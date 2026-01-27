Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBDAD34092
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 15:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8811910E0CB;
	Tue, 27 Jan 2026 15:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XPbVCp2N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E20610E0CB
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 15:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769528857; x=1801064857;
 h=date:from:to:cc:subject:message-id;
 bh=dwGxlPx1+C9BdOMANhEPb/+Lrc4uCk2dDpW+vapA9js=;
 b=XPbVCp2NrgxNBAajhrj6l8c8xoSrfZMQu7hHEkfo/Xvf434CIGiD8nvJ
 K3GULfn0XjHz14PXJB6cvY74hZCmvWiIuHjajg3loiFs+LkH2M2cU1Pwu
 Er2YP5Qwk13B2Qs1O3zYNu8tWDbdsHzqq35ELnfUnBwTKF8i1CrM3Sphh
 cJrM5uSMFhkJXcApxzMF0Lsrl4AMSoW2jO6Ico/0PKX8/5YEszwfbaOxW
 3xhQoM5cAhm/k6xOf1GXICKfNDnJfYfX6dY9wKpHGtNV5cTfJJNQibxAU
 qq56N/KY46ZGEG+egE4/aTO/9bkMnumrbkOTQPaPdmSaiUPokUaqlsgm/ g==;
X-CSE-ConnectionGUID: kFIXjL+IT42+kgD1MEQ6zg==
X-CSE-MsgGUID: e2nTb3vEQuGoyXbEkCdlpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74589256"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="74589256"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 07:47:36 -0800
X-CSE-ConnectionGUID: 8qnmPo2qRGGEHLwq4DyLvg==
X-CSE-MsgGUID: 4eFokmx8S/yA6vzCsFXwDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="212981055"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 27 Jan 2026 07:47:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vklHw-00000000Yca-0Cvu;
 Tue, 27 Jan 2026 15:47:32 +0000
Date: Tue, 27 Jan 2026 23:46:35 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 60bfb8baf8f0d5b0d521744dfd01c880ce1a23f3
Message-ID: <202601272330.9X26iBGL-lkp@intel.com>
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
branch HEAD: 60bfb8baf8f0d5b0d521744dfd01c880ce1a23f3  drm/xe: Unregister drm device on probe error

elapsed time: 918m

configs tested: 179
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260127    gcc-14.3.0
arc                   randconfig-002-20260127    gcc-14.3.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                         mv78xx0_defconfig    clang-18
arm                        mvebu_v7_defconfig    clang-18
arm                   randconfig-001-20260127    gcc-14.3.0
arm                   randconfig-002-20260127    gcc-14.3.0
arm                   randconfig-003-20260127    gcc-14.3.0
arm                   randconfig-004-20260127    gcc-14.3.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260127    gcc-15.2.0
hexagon               randconfig-002-20260127    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260127    clang-20
i386                  randconfig-002-20260127    clang-20
i386                  randconfig-003-20260127    clang-20
i386                  randconfig-004-20260127    clang-20
i386                  randconfig-005-20260127    clang-20
i386                  randconfig-006-20260127    clang-20
i386                  randconfig-007-20260127    clang-20
i386                  randconfig-011-20260127    gcc-14
i386                  randconfig-012-20260127    gcc-14
i386                  randconfig-013-20260127    gcc-14
i386                  randconfig-014-20260127    gcc-14
i386                  randconfig-015-20260127    gcc-14
i386                  randconfig-016-20260127    gcc-14
i386                  randconfig-017-20260127    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260127    gcc-15.2.0
loongarch             randconfig-002-20260127    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                        mvme147_defconfig    clang-18
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          rb532_defconfig    clang-18
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260127    gcc-15.2.0
nios2                 randconfig-002-20260127    gcc-15.2.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                   bluestone_defconfig    clang-18
powerpc                    gamecube_defconfig    clang-18
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260127    clang-22
riscv                 randconfig-002-20260127    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260127    clang-22
s390                  randconfig-002-20260127    clang-22
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                     magicpanelr2_defconfig    clang-18
sh                    randconfig-001-20260127    clang-22
sh                    randconfig-002-20260127    clang-22
sh                           se7705_defconfig    clang-18
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260127    gcc-15.2.0
sparc                 randconfig-002-20260127    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260127    gcc-15.2.0
sparc64               randconfig-002-20260127    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260127    gcc-15.2.0
um                    randconfig-002-20260127    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260127    gcc-14
x86_64      buildonly-randconfig-002-20260127    gcc-14
x86_64      buildonly-randconfig-003-20260127    gcc-14
x86_64      buildonly-randconfig-004-20260127    gcc-14
x86_64      buildonly-randconfig-005-20260127    gcc-14
x86_64      buildonly-randconfig-006-20260127    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260127    clang-20
x86_64                randconfig-002-20260127    clang-20
x86_64                randconfig-003-20260127    clang-20
x86_64                randconfig-004-20260127    clang-20
x86_64                randconfig-005-20260127    clang-20
x86_64                randconfig-006-20260127    clang-20
x86_64                randconfig-011-20260127    clang-20
x86_64                randconfig-012-20260127    clang-20
x86_64                randconfig-013-20260127    clang-20
x86_64                randconfig-014-20260127    clang-20
x86_64                randconfig-015-20260127    clang-20
x86_64                randconfig-016-20260127    clang-20
x86_64                randconfig-071-20260127    gcc-14
x86_64                randconfig-072-20260127    gcc-14
x86_64                randconfig-073-20260127    gcc-14
x86_64                randconfig-074-20260127    gcc-14
x86_64                randconfig-075-20260127    gcc-14
x86_64                randconfig-076-20260127    gcc-14
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260127    gcc-15.2.0
xtensa                randconfig-002-20260127    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
