Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13D1C6FD1F
	for <intel-xe@archiver.kernel.org>; Sat, 30 Mar 2024 15:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8A210E0F7;
	Sat, 30 Mar 2024 15:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fdPFn3RE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A8210E0F7
 for <intel-xe@lists.freedesktop.org>; Sat, 30 Mar 2024 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711813234; x=1743349234;
 h=date:from:to:cc:subject:message-id;
 bh=prd3TfSU6prg/WfovpGozzKoIbHR7C5YThjl1kBjnt0=;
 b=fdPFn3REDxVYM9f7LcZRMUf3N0eycrXKElX5ZdtV/J9i0mG8si51ABhK
 8ppMzKopsgSzsUS7a7HPTx+lTa0/Ynep65Sex0zPdzWies7tVUn65FTGd
 UGKasWX23vdCCfCgfbVBZO0HPCBzHbIZx9mUU/iz/kSy7WPkVcHoRSfGG
 0Kf2ugUbz2fM0JqFx1EM7xlS3bfQAKa210Dmkh/qWP9Lcdf9iN0oCjYet
 kJIbQXaeZ0dw83WHEczr+AyXZBOVp/VLdSKDGXWbtCQym3rlTtB8a9oFy
 ZNkUAwkAEwrr1FVbRJ31z+wNPzPF14F0jXaCCcfwnR9k6/EH/Jkn8ainC g==;
X-CSE-ConnectionGUID: RNFjnuzPTwSSsiFmqO+ouA==
X-CSE-MsgGUID: Z/BgIIaPSb27AXDBWjn7Vg==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="7168990"
X-IronPort-AV: E=Sophos;i="6.07,168,1708416000"; 
   d="scan'208";a="7168990"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2024 08:40:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,168,1708416000"; d="scan'208";a="17723971"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 30 Mar 2024 08:40:33 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rqaoo-00009H-0H;
 Sat, 30 Mar 2024 15:40:30 +0000
Date: Sat, 30 Mar 2024 23:39:58 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 b15e65349553b1689d15fbdebea874ca5ae2274a
Message-ID: <202403302356.T2MhiCiB-lkp@intel.com>
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
branch HEAD: b15e65349553b1689d15fbdebea874ca5ae2274a  drm/xe/xe_devcoredump: Check NULL before assignments

elapsed time: 1446m

configs tested: 177
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
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240330   gcc  
arc                   randconfig-002-20240330   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            mps2_defconfig   clang
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20240330   clang
arm                   randconfig-002-20240330   clang
arm                   randconfig-003-20240330   gcc  
arm                   randconfig-004-20240330   gcc  
arm                        spear3xx_defconfig   clang
arm                       versatile_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240330   clang
arm64                 randconfig-002-20240330   clang
arm64                 randconfig-003-20240330   clang
arm64                 randconfig-004-20240330   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240330   gcc  
csky                  randconfig-002-20240330   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240330   clang
hexagon               randconfig-002-20240330   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386         buildonly-randconfig-001-20240330   clang
i386         buildonly-randconfig-002-20240330   clang
i386         buildonly-randconfig-003-20240330   clang
i386         buildonly-randconfig-004-20240330   clang
i386         buildonly-randconfig-005-20240330   clang
i386         buildonly-randconfig-006-20240330   clang
i386                                defconfig   clang
i386                  randconfig-001-20240330   clang
i386                  randconfig-002-20240330   clang
i386                  randconfig-003-20240330   clang
i386                  randconfig-004-20240330   clang
i386                  randconfig-005-20240330   clang
i386                  randconfig-006-20240330   gcc  
i386                  randconfig-011-20240330   clang
i386                  randconfig-012-20240330   gcc  
i386                  randconfig-013-20240330   gcc  
i386                  randconfig-014-20240330   clang
i386                  randconfig-015-20240330   gcc  
i386                  randconfig-016-20240330   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240330   gcc  
loongarch             randconfig-002-20240330   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240330   gcc  
nios2                 randconfig-002-20240330   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240330   gcc  
parisc                randconfig-002-20240330   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      bamboo_defconfig   clang
powerpc                   bluestone_defconfig   clang
powerpc                   motionpro_defconfig   clang
powerpc                     mpc5200_defconfig   clang
powerpc                     rainier_defconfig   gcc  
powerpc               randconfig-001-20240330   gcc  
powerpc               randconfig-002-20240330   clang
powerpc               randconfig-003-20240330   clang
powerpc64             randconfig-001-20240330   gcc  
powerpc64             randconfig-002-20240330   gcc  
powerpc64             randconfig-003-20240330   gcc  
riscv                            alldefconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240330   gcc  
riscv                 randconfig-002-20240330   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240330   clang
s390                  randconfig-002-20240330   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240330   gcc  
sh                    randconfig-002-20240330   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240330   gcc  
sparc64               randconfig-002-20240330   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240330   clang
um                    randconfig-002-20240330   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240330   gcc  
x86_64       buildonly-randconfig-002-20240330   gcc  
x86_64       buildonly-randconfig-003-20240330   clang
x86_64       buildonly-randconfig-004-20240330   clang
x86_64       buildonly-randconfig-005-20240330   gcc  
x86_64       buildonly-randconfig-006-20240330   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240330   gcc  
x86_64                randconfig-002-20240330   clang
x86_64                randconfig-003-20240330   clang
x86_64                randconfig-004-20240330   gcc  
x86_64                randconfig-005-20240330   gcc  
x86_64                randconfig-006-20240330   gcc  
x86_64                randconfig-011-20240330   clang
x86_64                randconfig-012-20240330   clang
x86_64                randconfig-013-20240330   clang
x86_64                randconfig-014-20240330   gcc  
x86_64                randconfig-015-20240330   gcc  
x86_64                randconfig-016-20240330   gcc  
x86_64                randconfig-071-20240330   clang
x86_64                randconfig-072-20240330   clang
x86_64                randconfig-073-20240330   gcc  
x86_64                randconfig-074-20240330   clang
x86_64                randconfig-075-20240330   clang
x86_64                randconfig-076-20240330   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240330   gcc  
xtensa                randconfig-002-20240330   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
