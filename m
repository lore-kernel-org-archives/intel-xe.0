Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687F9C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 08:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9E310E598;
	Wed, 28 May 2025 08:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OyDvbNnf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D923110E598
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 08:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748421997; x=1779957997;
 h=date:from:to:cc:subject:message-id;
 bh=Q1VWg6VtlgV/flYfvFwdG5F79w1Kxp39yfS21XoatYU=;
 b=OyDvbNnfLFv1Res03gQltFiEqt1QWV9orcWHQFvzivJcbPX9iGjyEQCl
 VDAFgJiBJVMGy9D2/RbRR6ytzupWnxDh/rhcgc3uRHViRRWl+tMrpZsxw
 KP/aHMWjntEpFGjVdL+JhfOvlj5K8iTP3ek90R3ban3Hic0wiszqBC+F+
 VQEqXH/PO0Dzhn4mWVzjtqZyXOBaf/WbhqMhsat8jzDs/96IsCECQtqWo
 b0ke1mIPBb/5RZefYDYSdF8dSEm36b8JKqKceT62LkIO0j4JDswjy6RyI
 qJn7CfoV+OvNRiTaCA/90vKHJvKOqBEMbmWdFonMHKuJ+In9u3FjmbLHx A==;
X-CSE-ConnectionGUID: 0GkbbpfYRCmrJM5Ii1f0qQ==
X-CSE-MsgGUID: KGMmi6DqTMKcxcDhhUY1lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50324121"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="50324121"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 01:46:37 -0700
X-CSE-ConnectionGUID: Oy2nGmJ+TRyb8TIWJtpKCQ==
X-CSE-MsgGUID: BDmHPnsaTQ+04sAEdlMNiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="143008543"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 28 May 2025 01:46:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uKCQi-000VSY-3C;
 Wed, 28 May 2025 08:46:32 +0000
Date: Wed, 28 May 2025 16:46:03 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 39578fa40420fb11dbe4f42225a347e945d8fd0e
Message-ID: <202505281653.N36dl6SD-lkp@intel.com>
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
branch HEAD: 39578fa40420fb11dbe4f42225a347e945d8fd0e  drm/xe: Add missing documentation of rpa_freq

elapsed time: 794m

configs tested: 122
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                          axs101_defconfig    gcc-14.2.0
arc                   randconfig-001-20250528    gcc-15.1.0
arc                   randconfig-002-20250528    gcc-13.3.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         assabet_defconfig    clang-18
arm                   milbeaut_m10v_defconfig    clang-19
arm                           omap1_defconfig    gcc-14.2.0
arm                   randconfig-001-20250528    clang-21
arm                   randconfig-002-20250528    clang-17
arm                   randconfig-003-20250528    clang-19
arm                   randconfig-004-20250528    clang-21
arm                        spear3xx_defconfig    clang-17
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250528    gcc-9.5.0
arm64                 randconfig-002-20250528    gcc-7.5.0
arm64                 randconfig-003-20250528    gcc-7.5.0
arm64                 randconfig-004-20250528    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250528    gcc-15.1.0
csky                  randconfig-002-20250528    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250528    clang-21
hexagon               randconfig-002-20250528    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250528    gcc-12
i386        buildonly-randconfig-002-20250528    clang-20
i386        buildonly-randconfig-003-20250528    clang-20
i386        buildonly-randconfig-004-20250528    clang-20
i386        buildonly-randconfig-005-20250528    gcc-12
i386        buildonly-randconfig-006-20250528    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250528    gcc-15.1.0
loongarch             randconfig-002-20250528    gcc-13.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        omega2p_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250528    gcc-13.3.0
nios2                 randconfig-002-20250528    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                 simple_smp_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250528    gcc-6.5.0
parisc                randconfig-002-20250528    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                    gamecube_defconfig    clang-21
powerpc                 mpc836x_rdk_defconfig    clang-21
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250528    clang-21
powerpc               randconfig-002-20250528    gcc-7.5.0
powerpc               randconfig-003-20250528    gcc-7.5.0
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20250528    gcc-7.5.0
powerpc64             randconfig-002-20250528    clang-21
powerpc64             randconfig-003-20250528    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250528    gcc-9.3.0
riscv                 randconfig-002-20250528    clang-18
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250528    clang-21
s390                  randconfig-002-20250528    clang-21
s390                       zfcpdump_defconfig    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                    randconfig-001-20250528    gcc-9.3.0
sh                    randconfig-002-20250528    gcc-5.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250528    gcc-14.2.0
sparc                 randconfig-002-20250528    gcc-14.2.0
sparc64               randconfig-001-20250528    gcc-8.5.0
sparc64               randconfig-002-20250528    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250528    clang-21
um                    randconfig-002-20250528    gcc-11
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250528    clang-20
x86_64      buildonly-randconfig-002-20250528    clang-20
x86_64      buildonly-randconfig-003-20250528    gcc-12
x86_64      buildonly-randconfig-004-20250528    gcc-12
x86_64      buildonly-randconfig-005-20250528    gcc-12
x86_64      buildonly-randconfig-006-20250528    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250528    gcc-14.2.0
xtensa                randconfig-002-20250528    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
