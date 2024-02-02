Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7135C4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 11:54:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF3A10E089;
	Fri,  2 Feb 2024 11:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WC8OEWdq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EF510E089
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 11:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706874847; x=1738410847;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=ikboldEK+i1gqNXNXkEgQ045v5N4xo9so71ehKZQWdE=;
 b=WC8OEWdqmjUv5s9z46j+zj74IUh97fkxZxQEnG47Kw0ZqGb4aCVJx9JT
 7W1ABrK13xHyR5cMkQ++YdWSZCA0wSw43WnsafCmxvvuiyrctRoGPwW+h
 SfEVvslUwglU4waGhDxotJjEcg+kN2A4PGDfQ6g6RLqIwqwKS4+gliOxh
 2umKwXQ8Fgu8rcItSEwe/SsQ74AhU759OavA2iEPpkBt9Nqx6SBWULzyD
 fX5Mw7Orl505+UjSfWUxxUaJfnPcsk+Vzr4vIOKRtg73jh/fIfjq3O4Dd
 ePAL1XqDYREVZFTlSmZupqkU9oOXcg8nBbnHx38OLutmhZA5POmh6nQUQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="10796320"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="10796320"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 03:54:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="393448"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
 by orviesa008.jf.intel.com with ESMTP; 02 Feb 2024 03:54:06 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rVs7O-0003pA-2P;
 Fri, 02 Feb 2024 11:54:02 +0000
Date: Fri, 02 Feb 2024 19:53:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 5f16ee27cd5abd5166e28b2311ac693c204063ff
Message-ID: <202402021921.JpsVOxvb-lkp@intel.com>
User-Agent: s-nail v14.9.24
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: 5f16ee27cd5abd5166e28b2311ac693c204063ff  drm/hwmon: Fix abi doc warnings

elapsed time: 1449m

configs tested: 205
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                   randconfig-001-20240201   gcc  
arc                   randconfig-001-20240202   gcc  
arc                   randconfig-002-20240201   gcc  
arc                   randconfig-002-20240202   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                       netwinder_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20240201   gcc  
arm                   randconfig-001-20240202   gcc  
arm                   randconfig-002-20240202   gcc  
arm                   randconfig-003-20240201   gcc  
arm                   randconfig-003-20240202   gcc  
arm                           sama5_defconfig   gcc  
arm                        shmobile_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240201   gcc  
arm64                 randconfig-001-20240202   gcc  
arm64                 randconfig-003-20240201   gcc  
arm64                 randconfig-003-20240202   gcc  
arm64                 randconfig-004-20240201   gcc  
arm64                 randconfig-004-20240202   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240201   gcc  
csky                  randconfig-001-20240202   gcc  
csky                  randconfig-002-20240201   gcc  
csky                  randconfig-002-20240202   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             alldefconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240201   gcc  
i386         buildonly-randconfig-002-20240201   gcc  
i386         buildonly-randconfig-002-20240202   clang
i386         buildonly-randconfig-004-20240202   clang
i386         buildonly-randconfig-005-20240202   clang
i386         buildonly-randconfig-006-20240201   gcc  
i386                                defconfig   clang
i386                  randconfig-003-20240202   clang
i386                  randconfig-005-20240201   gcc  
i386                  randconfig-012-20240201   gcc  
i386                  randconfig-013-20240201   gcc  
i386                  randconfig-014-20240201   gcc  
i386                  randconfig-014-20240202   clang
i386                  randconfig-015-20240201   gcc  
i386                  randconfig-016-20240201   gcc  
i386                  randconfig-016-20240202   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240201   gcc  
loongarch             randconfig-001-20240202   gcc  
loongarch             randconfig-002-20240201   gcc  
loongarch             randconfig-002-20240202   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1830-neo_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                      malta_kvm_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240201   gcc  
nios2                 randconfig-001-20240202   gcc  
nios2                 randconfig-002-20240201   gcc  
nios2                 randconfig-002-20240202   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240201   gcc  
parisc                randconfig-001-20240202   gcc  
parisc                randconfig-002-20240201   gcc  
parisc                randconfig-002-20240202   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     powernv_defconfig   gcc  
powerpc               randconfig-003-20240201   gcc  
powerpc                     tqm5200_defconfig   gcc  
powerpc                      walnut_defconfig   gcc  
powerpc64             randconfig-002-20240202   gcc  
powerpc64             randconfig-003-20240201   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240201   gcc  
riscv                 randconfig-001-20240202   gcc  
riscv                 randconfig-002-20240202   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240201   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                    randconfig-001-20240201   gcc  
sh                    randconfig-001-20240202   gcc  
sh                    randconfig-002-20240201   gcc  
sh                    randconfig-002-20240202   gcc  
sh                          rsk7269_defconfig   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240201   gcc  
sparc64               randconfig-001-20240202   gcc  
sparc64               randconfig-002-20240201   gcc  
sparc64               randconfig-002-20240202   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240201   gcc  
um                    randconfig-002-20240201   gcc  
um                    randconfig-002-20240202   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240202   clang
x86_64       buildonly-randconfig-002-20240202   clang
x86_64       buildonly-randconfig-003-20240202   clang
x86_64       buildonly-randconfig-004-20240202   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240202   clang
x86_64                randconfig-002-20240202   clang
x86_64                randconfig-011-20240202   clang
x86_64                randconfig-012-20240202   clang
x86_64                randconfig-014-20240202   clang
x86_64                randconfig-015-20240202   clang
x86_64                randconfig-016-20240202   clang
x86_64                randconfig-072-20240202   clang
x86_64                randconfig-074-20240202   clang
x86_64                randconfig-076-20240202   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                randconfig-001-20240201   gcc  
xtensa                randconfig-001-20240202   gcc  
xtensa                randconfig-002-20240201   gcc  
xtensa                randconfig-002-20240202   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
