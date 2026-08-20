Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E1AC5DF87
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 23:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E535E10F1CE;
	Thu, 20 Aug 2026 23:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MeD0uM2O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16C110F1CE
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 23:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787267390; x=1818803390;
 h=date:from:to:cc:subject:message-id;
 bh=mcmUkPcrp5BxaXatg+pozx5cSZsxk1zhDBDBv82yeIw=;
 b=MeD0uM2Ovcr7mgsStS2nLIk044OepkWndPXA81j6oG3hTbeeWOuK/rrX
 Fg+S/XTipFFB1sj+oFogWmHPVMsDVy67laMyEiD94/0ApqX+omfzso1QF
 VZCV7mDVgSTle1iJtU0Ity/PLHBqrw9akKJkJX8RDb6DsEdpbahXmZpJr
 QziBwIS2SBpUnlMC0bd5xnKcBsf0ITXwley0SrpruzCeuJh4eTLZzut3z
 vCzPEsuJhKkNRFpCJIZUvEuvTRBzV332Dq9LJlQZCSREBGui0vqyA9lHY
 P5AMARIlcpk7QXANdJ2nxgPt/faqKds0V0ZdAZDhJMyaBNNKlyJ3rDdKy Q==;
X-CSE-ConnectionGUID: Lp2iJEWASuO+4CFp9CZ/jA==
X-CSE-MsgGUID: 8gT9FU32T027tBfkoqTsNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="99171158"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="99171158"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 16:09:49 -0700
X-CSE-ConnectionGUID: XumY/561Tume1iRovEKHbA==
X-CSE-MsgGUID: G8sHk76nTc2/Wk35AknShw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="269644997"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 20 Aug 2026 16:09:48 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wxBtK-00000000o0X-0CZE;
 Thu, 20 Aug 2026 23:09:46 +0000
Date: Fri, 21 Aug 2026 07:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 9b8234d176bb98e8612ddc4c3dbfd014219d5f6f
Message-ID: <202608210706.UJXpIvT9-lkp@intel.com>
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
branch HEAD: 9b8234d176bb98e8612ddc4c3dbfd014219d5f6f  drm/xe/pci_error: Allow debugging PCI errors

elapsed time: 1506m

configs tested: 173
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    clang-24
arc                  randconfig-001-20260820    clang-24
arc                  randconfig-001-20260821    gcc-10.5.0
arc                  randconfig-002-20260820    clang-24
arc                  randconfig-002-20260821    gcc-10.5.0
arm                  randconfig-001-20260820    clang-24
arm                  randconfig-001-20260821    gcc-10.5.0
arm                  randconfig-002-20260820    clang-24
arm                  randconfig-002-20260821    gcc-10.5.0
arm                  randconfig-003-20260820    clang-24
arm                  randconfig-003-20260821    gcc-10.5.0
arm                  randconfig-004-20260820    clang-24
arm                  randconfig-004-20260821    gcc-10.5.0
arm                          sunxi_defconfig    gcc-16.1.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260820    clang-24
arm64                randconfig-001-20260820    gcc-14.3.0
arm64                randconfig-001-20260821    gcc-8.5.0
arm64                randconfig-002-20260820    clang-24
arm64                randconfig-002-20260820    gcc-14.3.0
arm64                randconfig-002-20260821    gcc-8.5.0
arm64                randconfig-003-20260820    clang-24
arm64                randconfig-003-20260820    gcc-14.3.0
arm64                randconfig-003-20260821    gcc-8.5.0
arm64                randconfig-004-20260820    clang-24
arm64                randconfig-004-20260820    gcc-14.3.0
arm64                randconfig-004-20260821    gcc-8.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260820    clang-24
csky                 randconfig-001-20260820    gcc-14.3.0
csky                 randconfig-001-20260821    gcc-8.5.0
csky                 randconfig-002-20260820    clang-24
csky                 randconfig-002-20260820    gcc-14.3.0
csky                 randconfig-002-20260821    gcc-8.5.0
hexagon                       randconfig-001    gcc-14.3.0
hexagon              randconfig-001-20260820    gcc-14.3.0
hexagon              randconfig-002-20260820    gcc-14.3.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260820    gcc-14
i386       buildonly-randconfig-001-20260821    gcc-14
i386       buildonly-randconfig-002-20260820    gcc-14
i386       buildonly-randconfig-002-20260821    gcc-14
i386       buildonly-randconfig-003-20260820    gcc-14
i386       buildonly-randconfig-003-20260821    gcc-14
i386       buildonly-randconfig-004-20260820    gcc-14
i386       buildonly-randconfig-004-20260821    gcc-14
i386       buildonly-randconfig-005-20260820    gcc-14
i386       buildonly-randconfig-005-20260821    gcc-14
i386       buildonly-randconfig-006-20260820    gcc-14
i386       buildonly-randconfig-006-20260821    gcc-14
i386                 randconfig-001-20260820    clang-22
i386                 randconfig-001-20260821    clang-22
i386                 randconfig-002-20260820    clang-22
i386                 randconfig-002-20260821    clang-22
i386                 randconfig-003-20260820    clang-22
i386                 randconfig-003-20260821    clang-22
i386                 randconfig-004-20260820    clang-22
i386                 randconfig-004-20260821    clang-22
i386                 randconfig-005-20260820    clang-22
i386                 randconfig-005-20260821    clang-22
i386                 randconfig-006-20260820    clang-22
i386                 randconfig-006-20260821    clang-22
i386                 randconfig-007-20260820    clang-22
i386                 randconfig-007-20260821    clang-22
i386                          randconfig-011    clang-22
i386                 randconfig-011-20260820    gcc-14
i386                 randconfig-012-20260820    gcc-14
i386                 randconfig-013-20260820    gcc-14
i386                 randconfig-014-20260820    gcc-14
i386                 randconfig-015-20260820    clang-22
i386                 randconfig-015-20260820    gcc-14
i386                 randconfig-016-20260820    gcc-14
i386                 randconfig-017-20260820    clang-22
i386                 randconfig-017-20260820    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260820    gcc-14.3.0
loongarch            randconfig-002-20260820    gcc-14.3.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260820    gcc-14.3.0
nios2                randconfig-002-20260820    gcc-14.3.0
openrisc        de0_nano_multicore_defconfig    gcc-16.1.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-8.5.0
parisc               randconfig-001-20260820    gcc-8.5.0
parisc               randconfig-001-20260821    gcc-12.5.0
parisc               randconfig-002-20260820    gcc-8.5.0
parisc               randconfig-002-20260821    gcc-12.5.0
powerpc              randconfig-001-20260820    gcc-8.5.0
powerpc              randconfig-001-20260821    gcc-12.5.0
powerpc              randconfig-002-20260820    gcc-8.5.0
powerpc              randconfig-002-20260821    gcc-12.5.0
powerpc                    sequoia_defconfig    clang-24
powerpc64            randconfig-001-20260820    gcc-8.5.0
powerpc64            randconfig-001-20260821    gcc-12.5.0
powerpc64            randconfig-002-20260820    gcc-8.5.0
powerpc64            randconfig-002-20260821    gcc-12.5.0
riscv                randconfig-001-20260820    clang-24
riscv                randconfig-001-20260821    clang-24
riscv                randconfig-002-20260820    clang-24
riscv                randconfig-002-20260821    clang-24
s390                 randconfig-001-20260820    clang-24
s390                 randconfig-001-20260821    clang-24
s390                 randconfig-002-20260820    clang-24
s390                 randconfig-002-20260821    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260820    clang-24
sh                   randconfig-001-20260821    clang-24
sh                   randconfig-002-20260820    clang-24
sh                   randconfig-002-20260821    clang-24
sparc                         randconfig-001    gcc-8.5.0
sparc                randconfig-001-20260820    gcc-13.4.0
sparc                randconfig-001-20260821    gcc-8.5.0
sparc                randconfig-002-20260820    gcc-13.4.0
sparc                randconfig-002-20260821    gcc-8.5.0
sparc64              randconfig-001-20260820    gcc-13.4.0
sparc64              randconfig-001-20260821    gcc-8.5.0
sparc64              randconfig-002-20260820    gcc-13.4.0
sparc64              randconfig-002-20260821    gcc-8.5.0
um                   randconfig-001-20260820    gcc-13.4.0
um                   randconfig-001-20260821    gcc-8.5.0
um                   randconfig-002-20260820    gcc-13.4.0
um                   randconfig-002-20260821    gcc-8.5.0
x86_64     buildonly-randconfig-001-20260820    gcc-14
x86_64     buildonly-randconfig-002-20260820    gcc-14
x86_64     buildonly-randconfig-003-20260820    gcc-14
x86_64     buildonly-randconfig-004-20260820    gcc-14
x86_64     buildonly-randconfig-005-20260820    gcc-14
x86_64     buildonly-randconfig-006-20260820    gcc-14
x86_64                                 kexec    clang-22
x86_64                        randconfig-001    gcc-14
x86_64               randconfig-001-20260820    clang-22
x86_64               randconfig-001-20260820    gcc-14
x86_64               randconfig-002-20260820    clang-22
x86_64               randconfig-002-20260820    gcc-14
x86_64               randconfig-003-20260820    clang-22
x86_64               randconfig-003-20260820    gcc-14
x86_64               randconfig-004-20260820    clang-22
x86_64               randconfig-004-20260820    gcc-14
x86_64               randconfig-005-20260820    clang-22
x86_64               randconfig-005-20260820    gcc-14
x86_64               randconfig-006-20260820    clang-22
x86_64               randconfig-006-20260820    gcc-14
x86_64               randconfig-011-20260820    clang-22
x86_64               randconfig-011-20260821    gcc-14
x86_64               randconfig-012-20260820    clang-22
x86_64               randconfig-012-20260821    gcc-14
x86_64               randconfig-013-20260820    clang-22
x86_64               randconfig-013-20260821    gcc-14
x86_64               randconfig-014-20260820    clang-22
x86_64               randconfig-014-20260821    gcc-14
x86_64               randconfig-015-20260820    clang-22
x86_64               randconfig-015-20260821    gcc-14
x86_64               randconfig-016-20260820    clang-22
x86_64               randconfig-016-20260821    gcc-14
x86_64               randconfig-071-20260820    clang-22
x86_64               randconfig-072-20260820    clang-22
x86_64               randconfig-073-20260820    clang-22
x86_64               randconfig-074-20260820    clang-22
x86_64               randconfig-075-20260820    clang-22
x86_64               randconfig-076-20260820    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260820    gcc-13.4.0
xtensa               randconfig-001-20260821    gcc-8.5.0
xtensa               randconfig-002-20260820    gcc-13.4.0
xtensa               randconfig-002-20260821    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
