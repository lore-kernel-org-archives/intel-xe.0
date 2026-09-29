Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32FFCA5FA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 21:00:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDBF10F0EC;
	Tue, 29 Sep 2026 21:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SO6rDh7f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4408610F0DD
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 21:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790715613; x=1822251613;
 h=date:from:to:cc:subject:message-id;
 bh=pe71Td2AIEKWbmMFqqy3qq5+SjoTn+7NOIzDaKYXVR8=;
 b=SO6rDh7fKYnPwUdr+Tc/sBWG0Jf55a40/rlk+OC1odazVOdV4lrTWmuS
 dk6yhnrzj2TEXoK/n0Nxp5poGjsx8pE5uNJ9YJTy3i/ZjlANuRyjzfT3k
 V0eJjajyisuN0xVNnsLQgPKvuP95L9KUst6oaP6agdPh3WUw1Ldmnpij6
 cV3Z+xwieI4/l0Jpx36SvcSrb0LWTAsiQcfRcwZ9k3uSM4tku8vVUrbT2
 YTwAKVe02aXFnF8bidTF3cs/3pyL3QO30em0HU2ssZtcZcLlJyzNFkyrx
 +HCjKmNAhwAoDC3rJaoVA1CROLaXsYLUTjAuRs6qr0LeDL0l6XsD/SEZ9 A==;
X-CSE-ConnectionGUID: pVCIqAfrTn+qrglqmhSssg==
X-CSE-MsgGUID: 8IwFzkh+QWWWsszN7WoE/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="93933317"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="93933317"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 14:00:13 -0700
X-CSE-ConnectionGUID: 0oyGpJYQSTeLpaS/jjKvGg==
X-CSE-MsgGUID: C/jxoMb7Sw2QTQkgvvURPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="275027993"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 29 Sep 2026 14:00:12 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1xBevp-00000000Pm2-1djK;
 Tue, 29 Sep 2026 21:00:09 +0000
Date: Wed, 30 Sep 2026 04:59:58 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 d1b210c045f706927eaf6f1bda41a07d37672e9b
Message-ID: <202609300455.ZlniLRhT-lkp@intel.com>
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
branch HEAD: d1b210c045f706927eaf6f1bda41a07d37672e9b  drm/xe/xe3p_lpg: Add support for Wa_16030224309

elapsed time: 1089m

configs tested: 316
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2103-20260929    gcc-16.1.0 cocci
alpha                randconfig-r2104-20260929    gcc-11.5.0 cocci
alpha                randconfig-r2107-20260929    gcc-11.5.0 cocci
alpha                randconfig-r2107-20260929    gcc-15.2.0 cocci
alpha                randconfig-r2200-20260929    gcc-11.5.0 smatch
alpha                randconfig-r2307-20260929    gcc-14.3.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20260929    clang-17
arc                   randconfig-1000-20260930    gcc-11.5.0
arc                   randconfig-1001-20260929    clang-17
arc                   randconfig-1001-20260930    gcc-11.5.0
arc                  randconfig-r2301-20260929    clang-21   sparse
arc                  randconfig-r2303-20260929    gcc-8.5.0  sparse
arc                     vdk_hs38_smp_defconfig    gcc-16.1.0
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                         clps711x_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                          lpc32xx_defconfig    clang-17
arm                              mxs_defconfig    gcc-16.1.0
arm                          orion5x_defconfig    gcc-16.1.0
arm                   randconfig-1000-20260929    clang-17
arm                   randconfig-1000-20260930    gcc-11.5.0
arm                   randconfig-1001-20260929    clang-17
arm                   randconfig-1001-20260930    gcc-11.5.0
arm                   randconfig-1002-20260929    clang-17
arm                   randconfig-1002-20260930    gcc-11.5.0
arm                   randconfig-1003-20260929    clang-17
arm                   randconfig-1003-20260930    gcc-11.5.0
arm                  randconfig-r2100-20260929    gcc-9.5.0  cocci
arm                  randconfig-r2202-20260929    clang-17   smatch
arm                         spear6xx_defconfig    clang-17
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260929    clang-24
arm64                 randconfig-1000-20260930    gcc-16.1.0
arm64                 randconfig-1001-20260929    clang-24
arm64                 randconfig-1001-20260930    gcc-16.1.0
arm64                 randconfig-1002-20260929    clang-24
arm64                 randconfig-1002-20260930    gcc-16.1.0
arm64                 randconfig-1003-20260929    clang-24
arm64                 randconfig-1003-20260930    gcc-16.1.0
arm64                randconfig-r2305-20260929    clang-21   sparse
arm64                randconfig-r2306-20260929    clang-19   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260929    clang-24
csky                  randconfig-1000-20260930    gcc-16.1.0
csky                  randconfig-1001-20260929    clang-24
csky                  randconfig-1001-20260930    gcc-16.1.0
csky                 randconfig-r2309-20260929    clang-19   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260929    gcc-8.5.0
hexagon               randconfig-1001-20260929    gcc-8.5.0
hexagon              randconfig-r2106-20260929    clang-24   cocci
hexagon              randconfig-r2201-20260929    clang-19   smatch
hexagon              randconfig-r2302-20260929    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260929    clang-22
i386        buildonly-randconfig-1000-20260930    gcc-14
i386        buildonly-randconfig-1001-20260929    clang-22
i386        buildonly-randconfig-1001-20260930    gcc-14
i386        buildonly-randconfig-1002-20260929    clang-22
i386        buildonly-randconfig-1002-20260930    gcc-14
i386        buildonly-randconfig-1003-20260929    clang-22
i386        buildonly-randconfig-1003-20260930    gcc-14
i386        buildonly-randconfig-1004-20260929    clang-22
i386        buildonly-randconfig-1004-20260930    gcc-14
i386        buildonly-randconfig-1005-20260929    clang-22
i386        buildonly-randconfig-1005-20260930    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260929    gcc-13
i386                  randconfig-1001-20260929    gcc-13
i386                  randconfig-1002-20260929    gcc-13
i386                  randconfig-1003-20260929    gcc-13
i386                  randconfig-1004-20260929    gcc-13
i386                  randconfig-1005-20260929    gcc-13
i386                  randconfig-1006-20260929    gcc-13
i386                  randconfig-1007-20260929    gcc-14
i386                  randconfig-1007-20260930    clang-22
i386                  randconfig-1008-20260929    gcc-14
i386                  randconfig-1008-20260930    clang-22
i386                  randconfig-1009-20260929    gcc-14
i386                  randconfig-1009-20260930    clang-22
i386                  randconfig-1010-20260929    gcc-14
i386                  randconfig-1010-20260930    clang-22
i386                  randconfig-1011-20260929    gcc-14
i386                  randconfig-1011-20260930    clang-22
i386                  randconfig-1012-20260929    gcc-14
i386                  randconfig-1012-20260930    clang-22
i386                  randconfig-1013-20260929    gcc-14
i386                  randconfig-1013-20260930    clang-22
i386                  randconfig-2100-20260929    clang-22   cocci
i386                  randconfig-2101-20260929    clang-22   cocci
i386                  randconfig-2102-20260929    clang-22   cocci
i386                  randconfig-2103-20260929    clang-22   cocci
i386                  randconfig-2200-20260929    gcc-14     smatch
i386                  randconfig-2300-20260929    gcc-14     sparse
i386                  randconfig-2301-20260929    gcc-14     sparse
i386                  randconfig-2302-20260929    gcc-14     sparse
i386                 randconfig-r2102-20260929    gcc-16.1.0 cocci
i386                 randconfig-r2306-20260929    gcc-14.3.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    clang-17
loongarch             randconfig-1000-20260929    gcc-8.5.0
loongarch             randconfig-1001-20260929    gcc-8.5.0
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                        bvme6000_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                           hp300_defconfig    clang-17
m68k                             q40_defconfig    clang-17
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                            ip30_defconfig    gcc-16.1.0
mips                 randconfig-r2202-20260929    gcc-12.5.0 smatch
mips                 randconfig-r2300-20260929    clang-24   sparse
mips                 randconfig-r2300-20260929    gcc-8.5.0  sparse
mips                 randconfig-r2303-20260929    clang-24   sparse
mips                 randconfig-r2308-20260929    gcc-11.5.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260929    gcc-8.5.0
nios2                 randconfig-1001-20260929    gcc-8.5.0
nios2                randconfig-r2101-20260929    gcc-9.5.0  cocci
nios2                randconfig-r2106-20260929    gcc-11.5.0 cocci
openrisc                          alldefconfig    gcc-16.1.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2103-20260929    gcc-16.1.0 cocci
openrisc             randconfig-r2104-20260929    clang-24   cocci
openrisc             randconfig-r2303-20260929    clang-21   sparse
openrisc             randconfig-r2305-20260929    clang-24   sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260929    gcc-8.5.0
parisc                randconfig-1000-20260930    gcc-8.5.0
parisc                randconfig-1001-20260929    gcc-8.5.0
parisc                randconfig-1001-20260930    gcc-8.5.0
parisc               randconfig-r2105-20260929    gcc-11.5.0 cocci
parisc               randconfig-r2309-20260929    gcc-11.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                     gamecube_defconfig    gcc-16.1.0
powerpc                      ksi8560_defconfig    gcc-16.1.0
powerpc                    motionpro_defconfig    gcc-16.1.0
powerpc                  mpc837x_rdb_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20260929    gcc-8.5.0
powerpc               randconfig-1000-20260930    gcc-8.5.0
powerpc               randconfig-1001-20260929    gcc-8.5.0
powerpc               randconfig-1001-20260930    gcc-8.5.0
powerpc              randconfig-r2102-20260929    gcc-16.1.0 cocci
powerpc              randconfig-r2201-20260929    gcc-10.5.0 smatch
powerpc              randconfig-r2202-20260929    clang-24   smatch
powerpc                      redwood_defconfig    clang-17
powerpc64             randconfig-1000-20260929    gcc-8.5.0
powerpc64             randconfig-1000-20260930    gcc-8.5.0
powerpc64             randconfig-1001-20260929    gcc-8.5.0
powerpc64             randconfig-1001-20260930    gcc-8.5.0
powerpc64            randconfig-r2100-20260929    gcc-16.1.0 cocci
powerpc64            randconfig-r2104-20260929    gcc-15.2.0 cocci
powerpc64            randconfig-r2106-20260929    gcc-15.2.0 cocci
powerpc64            randconfig-r2304-20260929    clang-24   sparse
powerpc64            randconfig-r2307-20260929    gcc-11.5.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260929    clang-24
riscv                 randconfig-1001-20260929    clang-24
riscv                 randconfig-2000-20260929    gcc-11.5.0
riscv                 randconfig-2001-20260929    gcc-11.5.0
riscv                randconfig-r2100-20260929    gcc-16.1.0 cocci
riscv                randconfig-r2102-20260929    gcc-9.5.0  cocci
riscv                randconfig-r2304-20260929    clang-21   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260929    clang-24
s390                  randconfig-1001-20260929    clang-24
s390                  randconfig-2000-20260929    gcc-11.5.0
s390                  randconfig-2001-20260929    gcc-11.5.0
s390                 randconfig-r2101-20260929    gcc-16.1.0 cocci
s390                 randconfig-r2105-20260929    clang-24   cocci
s390                 randconfig-r2307-20260929    clang-19   sparse
s390                 randconfig-r2309-20260929    gcc-14.3.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    clang-17
sh                           kfr2r09_defconfig    gcc-16.1.0
sh                    randconfig-1000-20260929    clang-24
sh                    randconfig-1001-20260929    clang-24
sh                    randconfig-2000-20260929    gcc-11.5.0
sh                    randconfig-2001-20260929    gcc-11.5.0
sh                   randconfig-r2201-20260929    gcc-16.1.0 smatch
sh                   randconfig-r2305-20260929    gcc-8.5.0  sparse
sh                            se7721_defconfig    gcc-16.1.0
sh                            se7722_defconfig    gcc-16.1.0
sh                    secureedge5410_defconfig    gcc-16.1.0
sh                              shx3_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260929    gcc-14
sparc                 randconfig-1001-20260929    gcc-14
sparc                 randconfig-2000-20260929    gcc-12.5.0
sparc                 randconfig-2001-20260929    gcc-12.5.0
sparc                randconfig-r2101-20260929    gcc-16.1.0 cocci
sparc                randconfig-r2200-20260929    gcc-8.5.0  smatch
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260929    gcc-14
sparc64               randconfig-1001-20260929    gcc-14
sparc64               randconfig-2000-20260929    gcc-12.5.0
sparc64               randconfig-2001-20260929    gcc-12.5.0
sparc64              randconfig-r2103-20260929    gcc-9.5.0  cocci
sparc64              randconfig-r2308-20260929    clang-19   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260929    gcc-14
um                    randconfig-1001-20260929    gcc-14
um                    randconfig-2000-20260929    gcc-12.5.0
um                    randconfig-2001-20260929    gcc-12.5.0
um                   randconfig-r2107-20260929    clang-24   cocci
um                   randconfig-r2301-20260929    clang-24   sparse
um                   randconfig-r2302-20260929    clang-21   sparse
um                   randconfig-r2306-20260929    gcc-11.5.0 sparse
um                            x86_64_defconfig    clang-17
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20260929    clang-22
x86_64      buildonly-randconfig-1001-20260929    clang-22
x86_64      buildonly-randconfig-1002-20260929    clang-22
x86_64      buildonly-randconfig-1003-20260929    clang-22
x86_64      buildonly-randconfig-1004-20260929    clang-22
x86_64      buildonly-randconfig-1005-20260929    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260929    clang-22
x86_64                randconfig-1001-20260929    clang-22
x86_64                randconfig-1002-20260929    clang-22
x86_64                randconfig-1003-20260929    clang-22
x86_64                randconfig-1004-20260929    clang-22
x86_64                randconfig-1005-20260929    clang-22
x86_64                randconfig-1006-20260929    gcc-13
x86_64                randconfig-1007-20260929    gcc-13
x86_64                randconfig-1008-20260929    gcc-13
x86_64                randconfig-1009-20260929    gcc-13
x86_64                randconfig-1010-20260929    gcc-13
x86_64                randconfig-1011-20260929    gcc-13
x86_64                randconfig-1012-20260929    clang-22
x86_64                randconfig-1013-20260929    clang-22
x86_64                randconfig-1014-20260929    clang-22
x86_64                randconfig-1015-20260929    clang-22
x86_64                randconfig-1016-20260929    clang-22
x86_64                randconfig-1017-20260929    clang-22
x86_64                randconfig-2100-20260929    clang-22   cocci
x86_64                randconfig-2101-20260929    clang-22   cocci
x86_64                randconfig-2102-20260929    clang-22   cocci
x86_64                randconfig-2103-20260929    clang-22   cocci
x86_64                randconfig-2200-20260929    clang-22   smatch
x86_64                randconfig-2300-20260929    gcc-14     sparse
x86_64                randconfig-2301-20260929    gcc-14     sparse
x86_64                randconfig-2302-20260929    gcc-14     sparse
x86_64               randconfig-r2300-20260929    clang-21   sparse
x86_64               randconfig-r2302-20260929    gcc-8.5.0  sparse
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
xtensa                randconfig-1000-20260929    gcc-14
xtensa                randconfig-1001-20260929    gcc-14
xtensa                randconfig-2000-20260929    gcc-12.5.0
xtensa                randconfig-2001-20260929    gcc-12.5.0
xtensa               randconfig-r2105-20260929    gcc-15.2.0 cocci
xtensa               randconfig-r2301-20260929    gcc-8.5.0  sparse
xtensa               randconfig-r2304-20260929    gcc-8.5.0  sparse
xtensa               randconfig-r2308-20260929    gcc-14.3.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
