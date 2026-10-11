Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C550DCA9ECA
	for <intel-xe@archiver.kernel.org>; Sun, 11 Oct 2026 19:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCC710E03C;
	Sun, 11 Oct 2026 19:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KldMuCdi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2865E10E03C
 for <intel-xe@lists.freedesktop.org>; Sun, 11 Oct 2026 19:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791746586; x=1823282586;
 h=date:from:to:cc:subject:message-id;
 bh=24pbTCAtlSBrJJPkX4/Jc1bBQLeVUXDBQnijr1xTHjY=;
 b=KldMuCdi6xHK4bAXU7Vy6esOFjieKRGc25X4SgGCEIdOTZqqQsBezYll
 BnGXna+Gso6Hgvv+QpD+n0gxjAXYX+sU7GExIQw1dJ7javs6CAsd0qbYb
 f3uXaZ7zHJOyuWpm/oxDwhBrqHkHd/6WZRGeuaa4JyYDLYxKsLq9M9S4r
 T1CHEv2iicx+JSfGF69I5n2TUS0ZT7exKxuZvJr7kI+aTDeNeTC5oUgXG
 Vfjg2qy5+jOwnEgSsZfGR6PP+q+5CnnROEq/Qb/AKW3xmzmMbPrq6rsao
 lkqaQb9INh0j34uWyPF1oXwA4xv55wCnhrVna0mz28tJyhlVMYX8MdjIL A==;
X-CSE-ConnectionGUID: vwptXKdsS6+ykv2tBN20Bw==
X-CSE-MsgGUID: O34LPJTgQeKdgT6cAixrvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="468833"
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="468833"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 12:23:06 -0700
X-CSE-ConnectionGUID: B/EZYI/4QIehSWQ4peaZ7w==
X-CSE-MsgGUID: vkf/9rV5RmeGTxd9+I24/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="913264"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 11 Oct 2026 12:23:04 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1xFz8Q-00000000Ai3-0HvF;
 Sun, 11 Oct 2026 19:23:02 +0000
Date: Mon, 12 Oct 2026 03:22:40 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 0b3aec1e9b6f71840f579f202c978777629b9e3f
Message-ID: <202610120337.eG5CDBPy-lkp@intel.com>
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
branch HEAD: 0b3aec1e9b6f71840f579f202c978777629b9e3f  drm/xe/sysctrl: Add mailbox control state to error messages

elapsed time: 2271m

configs tested: 270
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2107-20261010    gcc-8.5.0  cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                      haps_hs_smp_defconfig    clang-17
arc                  randconfig-r2103-20261010    gcc-13.4.0 cocci
arc                  randconfig-r2104-20261010    gcc-8.5.0  cocci
arc                  randconfig-r2107-20261010    gcc-8.5.0  cocci
arc                  randconfig-r2308-20261010    gcc-13.4.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                         clps711x_defconfig    gcc-11.5.0
arm                                  defconfig    gcc-16.1.0
arm                           exynos_defconfig    gcc-16.1.0
arm                  randconfig-r2105-20261010    gcc-8.5.0  cocci
arm                  randconfig-r2106-20261010    gcc-11.5.0 cocci
arm                  randconfig-r2303-20261010    gcc-8.5.0  sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261011    gcc-11.5.0
arm64                 randconfig-1001-20261011    gcc-11.5.0
arm64                 randconfig-1002-20261011    gcc-11.5.0
arm64                 randconfig-1003-20261011    gcc-11.5.0
arm64                 randconfig-2000-20261010    gcc-16.1.0
arm64                 randconfig-2001-20261010    gcc-16.1.0
arm64                randconfig-r2100-20261010    clang-24   cocci
arm64                randconfig-r2101-20261010    clang-22   cocci
arm64                randconfig-r2101-20261010    gcc-10.5.0 cocci
arm64                randconfig-r2200-20261010    gcc-14.3.0 smatch
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261011    gcc-11.5.0
csky                  randconfig-1001-20261011    gcc-11.5.0
csky                  randconfig-2000-20261010    gcc-16.1.0
csky                  randconfig-2001-20261010    gcc-16.1.0
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261011    clang-24
hexagon               randconfig-1001-20261011    clang-24
hexagon               randconfig-2000-20261010    gcc-16.1.0
hexagon               randconfig-2001-20261010    gcc-16.1.0
hexagon              randconfig-r2306-20261010    clang-21   sparse
hexagon              randconfig-r2306-20261010    gcc-16.1.0 sparse
i386                               allnoconfig    gcc-16.1.0
i386        buildonly-randconfig-1000-20261011    clang-22
i386        buildonly-randconfig-1001-20261011    clang-22
i386        buildonly-randconfig-1002-20261011    clang-22
i386        buildonly-randconfig-1003-20261011    clang-22
i386        buildonly-randconfig-1004-20261011    clang-22
i386        buildonly-randconfig-1005-20261011    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1007-20261011    clang-22
i386                  randconfig-1008-20261011    clang-22
i386                  randconfig-1009-20261011    clang-22
i386                  randconfig-1010-20261011    clang-22
i386                  randconfig-1011-20261011    clang-22
i386                  randconfig-1012-20261011    clang-22
i386                  randconfig-1013-20261011    clang-22
i386                  randconfig-2100-20261010    clang-22   cocci
i386                  randconfig-2100-20261010    gcc-14     cocci
i386                  randconfig-2101-20261010    clang-22   cocci
i386                  randconfig-2101-20261010    gcc-14     cocci
i386                  randconfig-2102-20261010    clang-22   cocci
i386                  randconfig-2103-20261010    clang-22   cocci
i386                  randconfig-2200-20261010    gcc-12     smatch
i386                  randconfig-2300-20261010    gcc-14     sparse
i386                  randconfig-2301-20261010    gcc-14     sparse
i386                  randconfig-2302-20261010    gcc-14     sparse
i386                 randconfig-r2201-20261010    clang-22   smatch
i386                 randconfig-r2305-20261010    gcc-8.5.0  sparse
i386                 randconfig-r2308-20261010    gcc-16.1.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch             randconfig-1000-20261011    clang-24
loongarch             randconfig-1001-20261011    clang-24
loongarch             randconfig-2000-20261010    gcc-8.5.0
loongarch             randconfig-2001-20261010    gcc-8.5.0
loongarch            randconfig-r2105-20261010    gcc-8.5.0  cocci
loongarch            randconfig-r2304-20261010    gcc-8.5.0  sparse
loongarch            randconfig-r2309-20261010    gcc-16.1.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                         mvme16x_defconfig    gcc-16.1.0
m68k                 randconfig-r2107-20261010    gcc-10.5.0 cocci
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze           randconfig-r2103-20261010    gcc-10.5.0 cocci
microblaze           randconfig-r2307-20261010    gcc-12.5.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                           eyeq6_defconfig    gcc-16.1.0
mips                       malta_kvm_defconfig    clang-17
mips                       maltaaprp_defconfig    clang-17
mips                 randconfig-r2100-20261010    gcc-10.5.0 cocci
mips                 randconfig-r2106-20261010    gcc-8.5.0  cocci
mips                 randconfig-r2200-20261010    gcc-14.3.0 smatch
mips                 randconfig-r2301-20261010    gcc-8.5.0  sparse
mips                           rm200_defconfig    gcc-11.5.0
nios2                          3c120_defconfig    gcc-11.5.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                 randconfig-1000-20261011    clang-24
nios2                 randconfig-1001-20261011    clang-24
nios2                 randconfig-2000-20261010    gcc-8.5.0
nios2                 randconfig-2001-20261010    gcc-8.5.0
nios2                randconfig-r2104-20261010    gcc-9.5.0  cocci
nios2                randconfig-r2106-20261010    gcc-8.5.0  cocci
nios2                randconfig-r2202-20261010    gcc-8.5.0  smatch
nios2                randconfig-r2306-20261010    gcc-13.4.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2102-20261010    clang-22   cocci
openrisc             randconfig-r2201-20261010    gcc-16.1.0 smatch
openrisc             randconfig-r2308-20261010    gcc-13.4.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261011    clang-24
parisc                randconfig-1001-20261011    clang-24
parisc                randconfig-2000-20261010    gcc-8.5.0
parisc                randconfig-2001-20261010    gcc-8.5.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                        eiger_defconfig    gcc-11.5.0
powerpc                    lite5200b_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261011    clang-24
powerpc               randconfig-1001-20261011    clang-24
powerpc               randconfig-2000-20261010    gcc-14
powerpc               randconfig-2001-20261010    gcc-14
powerpc              randconfig-r2100-20261010    clang-22   cocci
powerpc              randconfig-r2105-20261010    gcc-13.4.0 cocci
powerpc              randconfig-r2302-20261010    gcc-8.5.0  sparse
powerpc64                         alldefconfig    clang-17
powerpc64             randconfig-1000-20261011    clang-24
powerpc64             randconfig-1001-20261011    clang-24
powerpc64             randconfig-2000-20261010    gcc-14
powerpc64             randconfig-2001-20261010    gcc-14
powerpc64            randconfig-r2307-20261010    gcc-13.4.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-2000-20261010    gcc-16.1.0
riscv                 randconfig-2000-20261010    gcc-9.5.0
riscv                 randconfig-2001-20261010    clang-24
riscv                 randconfig-2001-20261010    gcc-16.1.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                           debug_defconfig    clang-17
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-2000-20261010    clang-17
s390                  randconfig-2000-20261010    gcc-16.1.0
s390                  randconfig-2001-20261010    gcc-15.2.0
s390                  randconfig-2001-20261010    gcc-16.1.0
s390                 randconfig-r2102-20261010    gcc-10.5.0 cocci
s390                 randconfig-r2307-20261010    gcc-16.1.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                 ecovec24-romimage_defconfig    clang-17
sh                             migor_defconfig    gcc-11.5.0
sh                    randconfig-2000-20261010    gcc-16.1.0
sh                    randconfig-2001-20261010    gcc-16.1.0
sh                   randconfig-r2202-20261010    gcc-9.5.0  smatch
sh                    secureedge5410_defconfig    gcc-11.5.0
sh                    sh7724_generic_defconfig    clang-17
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261011    gcc-9.5.0
sparc                 randconfig-1001-20261011    gcc-9.5.0
sparc                 randconfig-2000-20261010    gcc-16.1.0
sparc                 randconfig-2000-20261010    gcc-8.5.0
sparc                 randconfig-2001-20261010    gcc-16.1.0
sparc                randconfig-r2102-20261010    gcc-8.5.0  cocci
sparc                randconfig-r2200-20261010    gcc-16.1.0 smatch
sparc                        sparc32_defconfig    clang-17
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261011    gcc-9.5.0
sparc64               randconfig-1001-20261011    gcc-9.5.0
sparc64               randconfig-2000-20261010    gcc-16.1.0
sparc64               randconfig-2000-20261010    gcc-8.5.0
sparc64               randconfig-2001-20261010    clang-21
sparc64               randconfig-2001-20261010    gcc-16.1.0
sparc64              randconfig-r2101-20261010    clang-24   cocci
sparc64              randconfig-r2309-20261010    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261011    gcc-9.5.0
um                    randconfig-1001-20261011    gcc-9.5.0
um                    randconfig-2000-20261010    clang-24
um                    randconfig-2000-20261010    gcc-16.1.0
um                    randconfig-2001-20261010    clang-24
um                    randconfig-2001-20261010    gcc-16.1.0
um                   randconfig-r2309-20261010    gcc-13.4.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261011    gcc-14
x86_64      buildonly-randconfig-1001-20261011    gcc-14
x86_64      buildonly-randconfig-1002-20261011    gcc-14
x86_64      buildonly-randconfig-1003-20261011    gcc-14
x86_64      buildonly-randconfig-1004-20261011    gcc-14
x86_64      buildonly-randconfig-1005-20261011    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261011    gcc-14
x86_64                randconfig-1001-20261011    gcc-14
x86_64                randconfig-1002-20261011    gcc-14
x86_64                randconfig-1003-20261011    gcc-14
x86_64                randconfig-1004-20261011    gcc-14
x86_64                randconfig-1005-20261011    gcc-14
x86_64                randconfig-1012-20261011    clang-22
x86_64                randconfig-1013-20261011    clang-22
x86_64                randconfig-1014-20261011    clang-22
x86_64                randconfig-1015-20261011    clang-22
x86_64                randconfig-1016-20261011    clang-22
x86_64                randconfig-1017-20261011    clang-22
x86_64                randconfig-2000-20261010    gcc-14
x86_64                randconfig-2001-20261010    gcc-14
x86_64                randconfig-2100-20261010    clang-22   cocci
x86_64                randconfig-2101-20261010    clang-22   cocci
x86_64                randconfig-2102-20261010    clang-22   cocci
x86_64                randconfig-2103-20261010    clang-22   cocci
x86_64                randconfig-2104-20261010    clang-22   cocci
x86_64                randconfig-2105-20261010    clang-22   cocci
x86_64                randconfig-2200-20261010    gcc-14     smatch
x86_64                randconfig-2300-20261010    gcc-14     sparse
x86_64                randconfig-2301-20261010    gcc-14     sparse
x86_64                randconfig-2302-20261010    gcc-14     sparse
x86_64               randconfig-r2103-20261010    clang-22   cocci
x86_64               randconfig-r2104-20261010    gcc-8.5.0  cocci
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
xtensa                           iss_defconfig    gcc-16.1.0
xtensa                   nommu_kc705_defconfig    gcc-16.1.0
xtensa                randconfig-1000-20261011    gcc-9.5.0
xtensa                randconfig-1001-20261011    gcc-9.5.0
xtensa                randconfig-2000-20261010    gcc-10.5.0
xtensa                randconfig-2000-20261010    gcc-16.1.0
xtensa                randconfig-2001-20261010    gcc-16.1.0
xtensa               randconfig-r2300-20261010    gcc-8.5.0  sparse
xtensa                     xip_kc705_defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
