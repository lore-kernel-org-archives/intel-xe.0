Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E18C4345F
	for <intel-xe@archiver.kernel.org>; Sat, 27 Apr 2024 17:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4485510F5CF;
	Sat, 27 Apr 2024 17:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L9nMxua2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BFA10F5CF
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Apr 2024 17:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714238628; x=1745774628;
 h=date:from:to:cc:subject:message-id;
 bh=i5nBjJeE/XsWdmJzxDHgH5R++yecRzCfLek2UTG3lpw=;
 b=L9nMxua2Zmpzy3eJLmCw5JXuGrd7JlCIR58SHczJ8BvBbd2Hhzajoj6U
 iJ+xUsuH+uuJvDPdSrYcmPybz1ln2oOjeX46WMth7Q0zQ4rlU27W9HVZj
 +7AVoqx4pJmvD2tn+VLe1fhC72NdrIS6k6tXmzWK3OPl+637pedt0G0xM
 ECjhNaNoLBJpjXdXtVDq8tNgBFZ0HyAbjnovsM+1iOV4Vu5MOLHx63rJw
 I9685s82ClWE63lN8Urv6nLsJKof7HauCffh3oKwY8dhVuMCFefkfXmkV
 C+5Ymti2NqthMDFVq9886sx0PgjYlKYr28nRq+PXv8GHklZNPUjW/rFGe g==;
X-CSE-ConnectionGUID: TChQhU6PRIOeLg7NbdHu/A==
X-CSE-MsgGUID: 3W7pRf/JRGyf5iL5Cv72gA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10075828"
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; d="scan'208";a="10075828"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2024 10:23:48 -0700
X-CSE-ConnectionGUID: prSyq7hyTc+g2Xlf/OZbNA==
X-CSE-MsgGUID: mPYOTHnWS1KPtclR/xQiYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; d="scan'208";a="26215527"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 27 Apr 2024 10:23:46 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s0lm4-0005Kg-1p;
 Sat, 27 Apr 2024 17:23:44 +0000
Date: Sun, 28 Apr 2024 01:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS WITH WARNING
 98ad158e543426561fa5df5c4387d4368601866f
Message-ID: <202404280153.m01guroU-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: 98ad158e543426561fa5df5c4387d4368601866f  drm/xe: Delete PT update selftest

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202404271550.YdQqXkUF-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:321:15: warning: variable 'end' is uninitialized when used here [-Wuninitialized]

Warning ids grouped by kconfigs:

clang_recent_errors
|-- i386-buildonly-randconfig-004-20240427
|   `-- drivers-gpu-drm-xe-xe_gt_tlb_invalidation.c:warning:variable-end-is-uninitialized-when-used-here
|-- i386-randconfig-006-20240427
|   `-- drivers-gpu-drm-xe-xe_gt_tlb_invalidation.c:warning:variable-end-is-uninitialized-when-used-here
|-- i386-randconfig-014-20240427
|   `-- drivers-gpu-drm-xe-xe_gt_tlb_invalidation.c:warning:variable-end-is-uninitialized-when-used-here
|-- powerpc-randconfig-002-20240427
|   `-- drivers-gpu-drm-xe-xe_gt_tlb_invalidation.c:warning:variable-end-is-uninitialized-when-used-here
|-- x86_64-buildonly-randconfig-006-20240427
|   `-- drivers-gpu-drm-xe-xe_gt_tlb_invalidation.c:warning:variable-end-is-uninitialized-when-used-here
|-- x86_64-randconfig-001-20240427
|   `-- drivers-gpu-drm-xe-xe_gt_tlb_invalidation.c:warning:variable-end-is-uninitialized-when-used-here
`-- x86_64-randconfig-013-20240427
    `-- drivers-gpu-drm-xe-xe_gt_tlb_invalidation.c:warning:variable-end-is-uninitialized-when-used-here

elapsed time: 1277m

configs tested: 161
configs skipped: 5

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240427   gcc  
arc                   randconfig-002-20240427   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                   randconfig-001-20240427   clang
arm                   randconfig-002-20240427   clang
arm                   randconfig-003-20240427   gcc  
arm                   randconfig-004-20240427   clang
arm                         s5pv210_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240427   clang
arm64                 randconfig-002-20240427   clang
arm64                 randconfig-003-20240427   gcc  
arm64                 randconfig-004-20240427   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240427   gcc  
csky                  randconfig-002-20240427   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240427   clang
hexagon               randconfig-002-20240427   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240427   clang
i386         buildonly-randconfig-002-20240427   gcc  
i386         buildonly-randconfig-003-20240427   clang
i386         buildonly-randconfig-004-20240427   clang
i386         buildonly-randconfig-005-20240427   clang
i386         buildonly-randconfig-006-20240427   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240427   clang
i386                  randconfig-002-20240427   gcc  
i386                  randconfig-003-20240427   clang
i386                  randconfig-004-20240427   gcc  
i386                  randconfig-005-20240427   gcc  
i386                  randconfig-006-20240427   clang
i386                  randconfig-011-20240427   gcc  
i386                  randconfig-012-20240427   gcc  
i386                  randconfig-013-20240427   clang
i386                  randconfig-014-20240427   clang
i386                  randconfig-015-20240427   gcc  
i386                  randconfig-016-20240427   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240427   gcc  
loongarch             randconfig-002-20240427   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240427   gcc  
nios2                 randconfig-002-20240427   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240427   gcc  
parisc                randconfig-002-20240427   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240427   clang
powerpc               randconfig-002-20240427   clang
powerpc               randconfig-003-20240427   clang
powerpc                     tqm8540_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64             randconfig-001-20240427   gcc  
powerpc64             randconfig-002-20240427   gcc  
powerpc64             randconfig-003-20240427   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240427   clang
riscv                 randconfig-002-20240427   gcc  
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240427   gcc  
s390                  randconfig-002-20240427   gcc  
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                    randconfig-001-20240427   gcc  
sh                    randconfig-002-20240427   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240427   gcc  
sparc64               randconfig-002-20240427   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240427   clang
um                    randconfig-002-20240427   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-003-20240427   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-003-20240427   gcc  
x86_64                randconfig-005-20240427   gcc  
x86_64                randconfig-006-20240427   gcc  
x86_64                randconfig-011-20240427   gcc  
x86_64                randconfig-015-20240427   gcc  
x86_64                randconfig-016-20240427   gcc  
x86_64                randconfig-071-20240427   gcc  
x86_64                randconfig-076-20240427   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240427   gcc  
xtensa                randconfig-002-20240427   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
