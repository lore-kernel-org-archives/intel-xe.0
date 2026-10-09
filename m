Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E860CA5FED
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 08:49:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E4510FDD2;
	Fri,  9 Oct 2026 08:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GWHwYb/9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB4D10FFB6
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 08:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791535796; x=1823071796;
 h=date:from:to:cc:subject:message-id;
 bh=SdLbHo23pK5qKt/JVOBo0S6YCDdpGbg04xE2acJBMJw=;
 b=GWHwYb/9jKtGJxkXRO7Z71AaGzhlMwFjxKQxAgjkPQyk/IapHTSVlyvP
 0TvdUnU9kDVSmnfybXkjejv+GePVJW5O/cid+l8JQqPEEAWq49WyK0KBL
 Pihfyx4hWx4Flcq30U8cmbQD6YJATOrWSvs+Q/nsP2pCfvQxUgx+SWLms
 E2d13qO5uRbuuGCjvGLMYrqIhLVwS35CehD121I09Lbwci1vSSP5VfPG6
 ENxQ7fr5INyYZtAbfn5isOhE+9cWs52lmPgZllDhxo4NBQYiY/IT3+OGS
 PurCuy1TTeduFrTtc8XJscU3RINDMgCLxkLveKXIX6OJiKpHKK3FRf4nv g==;
X-CSE-ConnectionGUID: AnWIhBbYRWa6rlZmc8cTKw==
X-CSE-MsgGUID: YseiCZxNQW6IK5+rsYMvPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="219584"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="219584"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 01:49:56 -0700
X-CSE-ConnectionGUID: YtNznMcCSr6/F6iw+Jjj1A==
X-CSE-MsgGUID: 1R3qsLcFR3mbGfGOXXjR5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="603157"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 09 Oct 2026 01:49:55 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1xF6Ia-000000005WG-03Be;
 Fri, 09 Oct 2026 08:49:52 +0000
Date: Fri, 09 Oct 2026 16:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS WITH WARNING
 ea5b438eff857e92cb0eace759f969cb7a436326
Message-ID: <202610091602.AdqKR7Ph-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: ea5b438eff857e92cb0eace759f969cb7a436326  drm/xe: Keep VRAM fault injection within the usable range

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202609081240.TB3UjW0m-lkp@intel.com

    Documentation/gpu/rfc/gpusvm:70: ./drivers/gpu/drm/drm_gpusvm.c:102: WARNING: Lexing literal_block '// GPU fault handler: one fault, one DMA mapping per device\nerr = drm_gpusvm_get_pages(gpusvm, driver_pages(drange),\n                           drange->num_pages, gpusvm->mm,\n                           :c:type:`range->notifier <range>`->notifier,\n                           drm_gpusvm_range_start(range),\n                           drm_gpusvm_range_end(range), :c:type:`ctx`);\n\n// Notifier callback: mark every instance unmapped in one call\ndrm_gpusvm_range_set_unmapped(range, driver_pages(drange),\n                              drange->num_pages, mmu_range);' as "c" resulted in an error at token: '`'. Retrying in relaxed mode. [misc.highlighting_failure]
    Documentation/gpu/rfc/gpusvm:70: ./drivers/gpu/drm/drm_gpusvm.c:70: WARNING: Lexing literal_block 'struct driver_range {\n        struct drm_gpusvm_range base;\n        unsigned int num_pages; // 1: inline_pages, >1: pages[]\n        union {\n                struct drm_gpusvm_pages inline_pages;\n                struct drm_gpusvm_pages *pages;\n        };\n};\n\nstatic struct drm_gpusvm_pages *\ndriver_pages(struct driver_range *drange)\n{\n        return drange->num_pages == 1 ? :c:type:`drange->inline_pages <drange>` :\n                                        drange->pages;\n}' as "c" resulted in an error at token: '`'. Retrying in relaxed mode. [misc.highlighting_failure]

Warning ids grouped by kconfigs:

recent_errors
`-- x86_64-allnoconfig
    |-- Documentation-gpu-rfc-gpusvm:.-drivers-gpu-drm-drm_gpusvm.c:WARNING:Lexing-literal_block-GPU-fault-handler:one-fault-one-DMA-mapping-per-device-nerr-drm_gpusvm_get_pages(gpusvm-driver_pages(drange)-n-
    `-- Documentation-gpu-rfc-gpusvm:.-drivers-gpu-drm-drm_gpusvm.c:WARNING:Lexing-literal_block-struct-driver_range-n-struct-drm_gpusvm_range-base-n-unsigned-int-num_pages:inline_pages:pages-n-union-n-struct

elapsed time: 1137m

configs tested: 288
configs skipped: 14

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2104-20261008    gcc-14     cocci
alpha                randconfig-r2304-20261007    gcc-16.1.0 sparse
arc                               allmodconfig    gcc-16.1.0
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261009    gcc-10.5.0
arc                   randconfig-1001-20261009    gcc-10.5.0
arm                                allnoconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                             mmp2_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261009    gcc-10.5.0
arm                   randconfig-1001-20261009    gcc-10.5.0
arm                   randconfig-1002-20261009    gcc-10.5.0
arm                   randconfig-1003-20261009    gcc-10.5.0
arm                  randconfig-r2107-20261008    gcc-14     cocci
arm                  randconfig-r2200-20261007    gcc-12.5.0 smatch
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261009    gcc-15.2.0
arm64                 randconfig-1001-20261009    gcc-15.2.0
arm64                 randconfig-1002-20261009    gcc-15.2.0
arm64                 randconfig-1003-20261009    gcc-15.2.0
arm64                randconfig-r2102-20261007    gcc-8.5.0  cocci
arm64                randconfig-r2307-20261007    gcc-8.5.0  sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261009    gcc-15.2.0
csky                  randconfig-1001-20261009    gcc-15.2.0
csky                 randconfig-r2100-20261007    gcc-16.1.0 cocci
csky                 randconfig-r2306-20261007    gcc-13.4.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261008    gcc-16.1.0
hexagon               randconfig-1001-20261008    gcc-16.1.0
hexagon              randconfig-r2201-20261008    clang-24   smatch
hexagon              randconfig-r2303-20261007    gcc-8.5.0  sparse
hexagon              randconfig-r2305-20261008    gcc-13.4.0 sparse
i386                               allnoconfig    gcc-16.1.0
i386        buildonly-randconfig-1000-20261009    clang-22
i386        buildonly-randconfig-1001-20261009    clang-22
i386        buildonly-randconfig-1002-20261009    clang-22
i386        buildonly-randconfig-1003-20261009    clang-22
i386        buildonly-randconfig-1004-20261009    clang-22
i386        buildonly-randconfig-1005-20261009    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261008    gcc-14
i386                  randconfig-1001-20261008    gcc-14
i386                  randconfig-1002-20261008    gcc-14
i386                  randconfig-1003-20261008    gcc-14
i386                  randconfig-1004-20261008    gcc-14
i386                  randconfig-1005-20261008    gcc-14
i386                  randconfig-1006-20261008    gcc-14
i386                  randconfig-1007-20261008    clang-22
i386                  randconfig-1008-20261008    clang-22
i386                  randconfig-1009-20261008    clang-22
i386                  randconfig-1010-20261008    clang-22
i386                  randconfig-1011-20261008    clang-22
i386                  randconfig-1012-20261008    clang-22
i386                  randconfig-1013-20261008    clang-22
i386                  randconfig-2100-20261007    clang-22   cocci
i386                  randconfig-2101-20261007    clang-22   cocci
i386                  randconfig-2102-20261007    clang-22   cocci
i386                  randconfig-2103-20261007    clang-22   cocci
i386                  randconfig-2103-20261007    gcc-13     cocci
i386                  randconfig-2200-20261007    gcc-14     smatch
i386                  randconfig-2200-20261008    clang-22   smatch
i386                  randconfig-2300-20261007    clang-22   sparse
i386                  randconfig-2300-20261008    clang-22   sparse
i386                  randconfig-2301-20261007    clang-22   sparse
i386                  randconfig-2301-20261008    clang-22   sparse
i386                  randconfig-2302-20261007    clang-22   sparse
i386                  randconfig-2302-20261008    clang-22   sparse
i386                 randconfig-r2300-20261007    clang-22   sparse
i386                 randconfig-r2305-20261007    gcc-14     sparse
i386                 randconfig-r2309-20261007    gcc-14     sparse
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261008    gcc-16.1.0
loongarch             randconfig-1001-20261008    gcc-16.1.0
loongarch            randconfig-r2103-20261007    clang-21   cocci
loongarch            randconfig-r2106-20261008    gcc-14     cocci
loongarch            randconfig-r2201-20261007    clang-18   smatch
loongarch            randconfig-r2307-20261007    gcc-14     sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                 randconfig-r2301-20261008    gcc-13.4.0 sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2308-20261007    gcc-16.1.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                       maltasmvp_defconfig    gcc-16.1.0
mips                 randconfig-r2104-20261007    clang-17   cocci
mips                 randconfig-r2105-20261007    clang-17   cocci
mips                 randconfig-r2300-20261008    gcc-13.4.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261008    gcc-16.1.0
nios2                 randconfig-1001-20261008    gcc-16.1.0
nios2                randconfig-r2100-20261008    clang-24   cocci
nios2                randconfig-r2102-20261007    clang-21   cocci
nios2                randconfig-r2106-20261007    clang-17   cocci
nios2                randconfig-r2202-20261007    gcc-10.5.0 smatch
nios2                randconfig-r2202-20261008    gcc-8.5.0  smatch
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc                   or1klitex_defconfig    gcc-16.1.0
openrisc             randconfig-r2101-20261007    clang-21   cocci
openrisc             randconfig-r2309-20261007    gcc-13.4.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261009    gcc-8.5.0
parisc                randconfig-1001-20261009    gcc-8.5.0
parisc               randconfig-r2301-20261007    gcc-8.5.0  sparse
parisc64                          alldefconfig    gcc-16.1.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                        ppc64_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261009    gcc-8.5.0
powerpc               randconfig-1001-20261009    gcc-8.5.0
powerpc              randconfig-r2101-20261007    gcc-8.5.0  cocci
powerpc              randconfig-r2104-20261007    gcc-13.4.0 cocci
powerpc              randconfig-r2107-20261007    clang-17   cocci
powerpc              randconfig-r2302-20261007    gcc-11.5.0 sparse
powerpc64             randconfig-1000-20261009    gcc-8.5.0
powerpc64             randconfig-1001-20261009    gcc-8.5.0
powerpc64            randconfig-r2200-20261007    clang-24   smatch
powerpc64            randconfig-r2306-20261007    gcc-14     sparse
riscv                              allnoconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261009    gcc-16.1.0
riscv                 randconfig-1001-20261009    gcc-16.1.0
riscv                 randconfig-2000-20261007    gcc-12.5.0
riscv                 randconfig-2000-20261007    gcc-8.5.0
riscv                 randconfig-2000-20261008    gcc-11.5.0
riscv                 randconfig-2001-20261007    clang-20
riscv                 randconfig-2001-20261007    gcc-12.5.0
riscv                 randconfig-2001-20261008    gcc-11.5.0
riscv                randconfig-r2101-20261008    clang-24   cocci
riscv                randconfig-r2202-20261007    gcc-12.5.0 smatch
riscv                randconfig-r2304-20261007    gcc-8.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261009    gcc-16.1.0
s390                  randconfig-1001-20261009    gcc-16.1.0
s390                  randconfig-2000-20261007    gcc-12.5.0
s390                  randconfig-2000-20261007    gcc-8.5.0
s390                  randconfig-2000-20261008    gcc-11.5.0
s390                  randconfig-2001-20261007    gcc-12.5.0
s390                  randconfig-2001-20261007    gcc-13.4.0
s390                  randconfig-2001-20261008    gcc-11.5.0
s390                 randconfig-r2105-20261007    gcc-8.5.0  cocci
s390                 randconfig-r2304-20261008    gcc-13.4.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                      magicpanelr2_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261009    gcc-16.1.0
sh                    randconfig-1001-20261009    gcc-16.1.0
sh                    randconfig-2000-20261007    gcc-12.5.0
sh                    randconfig-2000-20261007    gcc-14.3.0
sh                    randconfig-2000-20261008    gcc-11.5.0
sh                    randconfig-2001-20261007    gcc-12.5.0
sh                    randconfig-2001-20261008    gcc-11.5.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261009    clang-18
sparc                 randconfig-1001-20261009    clang-18
sparc                 randconfig-2000-20261007    clang-24
sparc                 randconfig-2000-20261008    gcc-14
sparc                 randconfig-2001-20261007    clang-24
sparc                 randconfig-2001-20261008    gcc-14
sparc                randconfig-r2102-20261008    clang-24   cocci
sparc                randconfig-r2103-20261008    clang-24   cocci
sparc                randconfig-r2107-20261007    gcc-16.1.0 cocci
sparc                randconfig-r2300-20261007    gcc-8.5.0  sparse
sparc                randconfig-r2303-20261007    gcc-16.1.0 sparse
sparc                randconfig-r2303-20261008    gcc-13.4.0 sparse
sparc                randconfig-r2308-20261007    gcc-14     sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261009    clang-18
sparc64               randconfig-1001-20261009    clang-18
sparc64               randconfig-2000-20261007    clang-24
sparc64               randconfig-2000-20261008    gcc-14
sparc64               randconfig-2001-20261007    clang-24
sparc64               randconfig-2001-20261008    gcc-14
sparc64              randconfig-r2100-20261007    clang-21   cocci
sparc64              randconfig-r2106-20261007    clang-24   cocci
sparc64              randconfig-r2302-20261008    gcc-13.4.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261009    clang-18
um                    randconfig-1001-20261009    clang-18
um                    randconfig-2000-20261007    clang-24
um                    randconfig-2000-20261008    gcc-14
um                    randconfig-2001-20261007    clang-24
um                    randconfig-2001-20261008    gcc-14
um                   randconfig-r2105-20261008    gcc-14     cocci
um                   randconfig-r2302-20261007    gcc-8.5.0  sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261009    clang-22
x86_64      buildonly-randconfig-1001-20261009    clang-22
x86_64      buildonly-randconfig-1002-20261009    clang-22
x86_64      buildonly-randconfig-1003-20261009    clang-22
x86_64      buildonly-randconfig-1004-20261009    clang-22
x86_64      buildonly-randconfig-1005-20261009    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261008    gcc-14
x86_64                randconfig-1001-20261008    gcc-14
x86_64                randconfig-1002-20261008    gcc-14
x86_64                randconfig-1003-20261008    gcc-14
x86_64                randconfig-1004-20261008    gcc-14
x86_64                randconfig-1005-20261008    gcc-14
x86_64                randconfig-1006-20261008    clang-22
x86_64                randconfig-1007-20261008    clang-22
x86_64                randconfig-1008-20261008    clang-22
x86_64                randconfig-1009-20261008    clang-22
x86_64                randconfig-1010-20261008    clang-22
x86_64                randconfig-1011-20261008    clang-22
x86_64                randconfig-1012-20261008    clang-22
x86_64                randconfig-1013-20261008    clang-22
x86_64                randconfig-1014-20261008    clang-22
x86_64                randconfig-1015-20261008    clang-22
x86_64                randconfig-1016-20261008    clang-22
x86_64                randconfig-1017-20261008    clang-22
x86_64                randconfig-2100-20261007    clang-22   cocci
x86_64                randconfig-2100-20261008    clang-22   cocci
x86_64                randconfig-2101-20261007    clang-22   cocci
x86_64                randconfig-2101-20261008    clang-22   cocci
x86_64                randconfig-2102-20261007    clang-22   cocci
x86_64                randconfig-2102-20261008    clang-22   cocci
x86_64                randconfig-2103-20261007    clang-22   cocci
x86_64                randconfig-2103-20261008    clang-22   cocci
x86_64                randconfig-2200-20261007    gcc-14     smatch
x86_64                randconfig-2200-20261008    gcc-14     smatch
x86_64                randconfig-2300-20261007    clang-22   sparse
x86_64                randconfig-2300-20261008    clang-22   sparse
x86_64                randconfig-2301-20261007    clang-22   sparse
x86_64                randconfig-2301-20261008    clang-22   sparse
x86_64                randconfig-2302-20261007    clang-22   sparse
x86_64                randconfig-2302-20261008    clang-22   sparse
x86_64               randconfig-r2103-20261007    clang-22   cocci
x86_64               randconfig-r2301-20261007    clang-22   sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                   audio_kc705_defconfig    gcc-16.1.0
xtensa                randconfig-1000-20261009    clang-18
xtensa                randconfig-1001-20261009    clang-18
xtensa                randconfig-2000-20261007    clang-24
xtensa                randconfig-2000-20261008    gcc-14
xtensa                randconfig-2001-20261007    clang-24
xtensa                randconfig-2001-20261008    gcc-14
xtensa               randconfig-r2200-20261008    gcc-8.5.0  smatch
xtensa               randconfig-r2305-20261007    gcc-8.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
