include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vxl/vxl
    REF v1.18.0
    SHA512 6666d647b2e7010b91cb0b05016b5f49ae46d198f6bd160fe13fc09bc674eff5b937331fa11d81a8496473968b63452d950eee4fc2512152af57304a14bed63f
    HEAD_REF master
    PATCHES
        fix_dependency.patch
)

set(USE_WIN_WCHAR_T OFF)
if(NOT VCPKG_CMAKE_SYSTEM_NAME OR VCPKG_CMAKE_SYSTEM_NAME STREQUAL "WindowsStore")
    set(USE_WIN_WCHAR_T ON)
endif()

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DBUILD_EXAMPLES=OFF
        -DBUILD_TESTING=OFF
        -DBUILD_CORE_GEOMETRY=OFF
        -DBUILD_CORE_IMAGING=OFF
        -DBUILD_CORE_SERIALISATION=OFF
        -DBUILD_CORE_UTILITIES=OFF
        -DVXL_FORCE_V3P_BZLIB2=OFF
        -DVXL_USE_DCMTK=OFF
        -DXVL_USE_GEOTIFF=OFF
        -DVXL_USE_WIN_WCHAR_T=${USE_WIN_WCHAR_T}
        -DVXL_EXTRA_CMAKE_CXX_FLAGS=-DVNL_STATIC_DEFINE
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH share/vxl/cmake)
vcpkg_copy_pdbs()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)

file(INSTALL ${SOURCE_PATH}/core/vxl_copyright.h DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
#
