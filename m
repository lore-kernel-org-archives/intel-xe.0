Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFA8C4828F
	for <intel-xe@archiver.kernel.org>; Sun,  4 Feb 2024 07:01:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B011610F4DB;
	Sun,  4 Feb 2024 07:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y1U1XqCW";
	dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Sun, 04 Feb 2024 07:01:27 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75A710F4DB
 for <intel-xe@lists.freedesktop.org>; Sun,  4 Feb 2024 07:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707030088; x=1738566088;
 h=date:from:to:cc:subject:message-id;
 bh=CwX9mQRfmjbc+oSYSnk8pZ6GES+NhaDIk/p7G0XqWTw=;
 b=Y1U1XqCW83nIeoJA9hi407U1OYOvA3VYcB5P29q9jR+V/lGu1Ni5FYIi
 T0/4hM9wCxcRvjuWRoVimQissS/HEcMV2VhJLY070aRlJf/aEgiptOOLh
 ZPHbVU8XncOBn4LluxPDYCws2R7uxBvLrsn65u1I8AapU/csLpytQi57p
 lxNCLAaCW56JJ35+5buHaTSm5d0OxXXLWUhzMEa7d1/D/n7pDvRIhXFvJ
 5jB02xyvQQVbKwGyrc2HJ3mc+YRDz+IfC8Qpk2zW2CLBVp/UhOpXbKh4k
 q+2Ag0et9hssV17yYP1Nxooq2TnsbvE/K+S9xamfeW5Q/WDCkP8f14udm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="276857"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="276857"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2024 22:54:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5047609"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
 by orviesa003.jf.intel.com with ESMTP; 03 Feb 2024 22:54:11 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rWWOH-00065p-1P;
 Sun, 04 Feb 2024 06:54:09 +0000
Date: Sun, 04 Feb 2024 14:53:51 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:topic/xe-for-CI] BUILD SUCCESS
 ea08150056720bdd045eb42b075765bccb77b48d
Message-ID: <202402041448.OEHNeOrn-lkp@intel.com>
User-Agent: s-nail v14.9.24
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git topic/xe-for-CI
branch HEAD: ea08150056720bdd045eb42b075765bccb77b48d  drm/xe/guc: define PVC FW

elapsed time: 1449m

configs tested: 286
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                   randconfig-001-20240203   gcc  
arc                   randconfig-001-20240204   gcc  
arc                   randconfig-002-20240203   gcc  
arc                   randconfig-002-20240204   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                          exynos_defconfig   clang
arm                           imxrt_defconfig   clang
arm                        mvebu_v7_defconfig   clang
arm                       netwinder_defconfig   gcc  
arm                   randconfig-001-20240203   clang
arm                   randconfig-001-20240204   gcc  
arm                   randconfig-002-20240203   clang
arm                   randconfig-003-20240203   gcc  
arm                   randconfig-004-20240203   clang
arm                   randconfig-004-20240204   gcc  
arm                        realview_defconfig   clang
arm                         s5pv210_defconfig   gcc  
arm                        shmobile_defconfig   gcc  
arm                         socfpga_defconfig   gcc  
arm                          sp7021_defconfig   gcc  
arm                           u8500_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240203   clang
arm64                 randconfig-001-20240204   gcc  
arm64                 randconfig-002-20240203   clang
arm64                 randconfig-003-20240203   gcc  
arm64                 randconfig-003-20240204   gcc  
arm64                 randconfig-004-20240203   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240203   gcc  
csky                  randconfig-001-20240204   gcc  
csky                  randconfig-002-20240203   gcc  
csky                  randconfig-002-20240204   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240203   clang
hexagon               randconfig-002-20240203   clang
i386                             alldefconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240203   clang
i386         buildonly-randconfig-001-20240204   gcc  
i386         buildonly-randconfig-002-20240203   gcc  
i386         buildonly-randconfig-002-20240204   gcc  
i386         buildonly-randconfig-003-20240203   clang
i386         buildonly-randconfig-003-20240204   gcc  
i386         buildonly-randconfig-004-20240203   clang
i386         buildonly-randconfig-004-20240204   gcc  
i386         buildonly-randconfig-005-20240203   clang
i386         buildonly-randconfig-005-20240204   gcc  
i386         buildonly-randconfig-006-20240203   gcc  
i386         buildonly-randconfig-006-20240204   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240203   clang
i386                  randconfig-001-20240204   clang
i386                  randconfig-002-20240203   gcc  
i386                  randconfig-002-20240204   clang
i386                  randconfig-003-20240203   clang
i386                  randconfig-003-20240204   clang
i386                  randconfig-004-20240203   gcc  
i386                  randconfig-004-20240204   gcc  
i386                  randconfig-005-20240203   clang
i386                  randconfig-005-20240204   clang
i386                  randconfig-006-20240203   gcc  
i386                  randconfig-006-20240204   gcc  
i386                  randconfig-011-20240203   clang
i386                  randconfig-011-20240204   clang
i386                  randconfig-012-20240203   gcc  
i386                  randconfig-012-20240204   gcc  
i386                  randconfig-013-20240203   gcc  
i386                  randconfig-013-20240204   clang
i386                  randconfig-014-20240203   gcc  
i386                  randconfig-014-20240204   clang
i386                  randconfig-015-20240203   gcc  
i386                  randconfig-015-20240204   clang
i386                  randconfig-016-20240203   gcc  
i386                  randconfig-016-20240204   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240203   gcc  
loongarch             randconfig-001-20240204   gcc  
loongarch             randconfig-002-20240203   gcc  
loongarch             randconfig-002-20240204   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                      bmips_stb_defconfig   clang
mips                           ci20_defconfig   clang
mips                     cu1000-neo_defconfig   gcc  
mips                           jazz_defconfig   clang
mips                       lemote2f_defconfig   gcc  
mips                      maltaaprp_defconfig   clang
nios2                         10m50_defconfig   gcc  
nios2                            alldefconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240203   gcc  
nios2                 randconfig-001-20240204   gcc  
nios2                 randconfig-002-20240203   gcc  
nios2                 randconfig-002-20240204   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240203   gcc  
parisc                randconfig-001-20240204   gcc  
parisc                randconfig-002-20240203   gcc  
parisc                randconfig-002-20240204   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    mvme5100_defconfig   gcc  
powerpc                      ppc64e_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20240203   clang
powerpc               randconfig-001-20240204   gcc  
powerpc               randconfig-002-20240203   clang
powerpc               randconfig-002-20240204   gcc  
powerpc               randconfig-003-20240203   clang
powerpc               randconfig-003-20240204   gcc  
powerpc                     skiroot_defconfig   clang
powerpc64             randconfig-001-20240203   clang
powerpc64             randconfig-001-20240204   gcc  
powerpc64             randconfig-002-20240203   gcc  
powerpc64             randconfig-003-20240203   clang
powerpc64             randconfig-003-20240204   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240203   clang
riscv                 randconfig-002-20240203   clang
riscv                 randconfig-002-20240204   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240203   gcc  
s390                  randconfig-002-20240203   clang
s390                  randconfig-002-20240204   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                    randconfig-001-20240203   gcc  
sh                    randconfig-001-20240204   gcc  
sh                    randconfig-002-20240203   gcc  
sh                    randconfig-002-20240204   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7203_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240203   gcc  
sparc64               randconfig-001-20240204   gcc  
sparc64               randconfig-002-20240203   gcc  
sparc64               randconfig-002-20240204   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240203   clang
um                    randconfig-001-20240204   gcc  
um                    randconfig-002-20240203   clang
um                    randconfig-002-20240204   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240203   gcc  
x86_64       buildonly-randconfig-001-20240204   clang
x86_64       buildonly-randconfig-002-20240203   gcc  
x86_64       buildonly-randconfig-002-20240204   clang
x86_64       buildonly-randconfig-003-20240203   gcc  
x86_64       buildonly-randconfig-003-20240204   gcc  
x86_64       buildonly-randconfig-004-20240203   gcc  
x86_64       buildonly-randconfig-004-20240204   gcc  
x86_64       buildonly-randconfig-005-20240203   gcc  
x86_64       buildonly-randconfig-005-20240204   clang
x86_64       buildonly-randconfig-006-20240203   gcc  
x86_64       buildonly-randconfig-006-20240204   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240203   gcc  
x86_64                randconfig-001-20240204   gcc  
x86_64                randconfig-002-20240203   gcc  
x86_64                randconfig-002-20240204   gcc  
x86_64                randconfig-003-20240203   clang
x86_64                randconfig-003-20240204   clang
x86_64                randconfig-004-20240203   gcc  
x86_64                randconfig-004-20240204   clang
x86_64                randconfig-005-20240203   gcc  
x86_64                randconfig-005-20240204   gcc  
x86_64                randconfig-006-20240203   gcc  
x86_64                randconfig-006-20240204   gcc  
x86_64                randconfig-011-20240203   gcc  
x86_64                randconfig-011-20240204   gcc  
x86_64                randconfig-012-20240203   gcc  
x86_64                randconfig-012-20240204   gcc  
x86_64                randconfig-013-20240203   clang
x86_64                randconfig-013-20240204   gcc  
x86_64                randconfig-014-20240203   clang
x86_64                randconfig-014-20240204   gcc  
x86_64                randconfig-015-20240203   clang
x86_64                randconfig-015-20240204   clang
x86_64                randconfig-016-20240203   clang
x86_64                randconfig-016-20240204   clang
x86_64                randconfig-071-20240203   clang
x86_64                randconfig-071-20240204   gcc  
x86_64                randconfig-072-20240203   gcc  
x86_64                randconfig-072-20240204   gcc  
x86_64                randconfig-073-20240203   clang
x86_64                randconfig-073-20240204   gcc  
x86_64                randconfig-074-20240203   clang
x86_64                randconfig-074-20240204   clang
x86_64                randconfig-075-20240203   clang
x86_64                randconfig-075-20240204   clang
x86_64                randconfig-076-20240203   clang
x86_64                randconfig-076-20240204   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20240203   gcc  
xtensa                randconfig-001-20240204   gcc  
xtensa                randconfig-002-20240203   gcc  
xtensa                randconfig-002-20240204   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
