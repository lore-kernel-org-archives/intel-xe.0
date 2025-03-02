Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52551C19F32
	for <intel-xe@archiver.kernel.org>; Sun,  2 Mar 2025 06:29:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C02B10E023;
	Sun,  2 Mar 2025 06:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLjooaQ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D2710E023
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Mar 2025 06:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740896966; x=1772432966;
 h=date:from:to:cc:subject:message-id;
 bh=A/K8+LVgc9uTP1ypel+3+6LnvykEBaNSvWJesyClIP8=;
 b=OLjooaQ5LAoapya2Sfh7XxYy2p9pQQAqTOhq3qRHblwdayRYhRzQYuUg
 icCSGdAbZB/duTv0gHg1Hh07dEIdwx7ND68KkPbSP86qGvYcIs/39V0BR
 z4X9DYJhgKGoskbRXfxjbnlurnXgQimAePfdbt/jimKfPD/khVDXXYOot
 iBUofPvDvBXg/9zhwuqpE2+B19qgVrE2xlhVaLyBfpLry4DCw2p4Zt2Rn
 G3KCftpyyKGUZFyY2Fqy+2vEsdN1V9R8je+Io1oYmdgyL9TfQO/ZLBsg4
 R7AX5PP1TSNYyq8sIgbYJRXdGI7Dy3ApV8EGwgSh3bBEHHpRm6VmpEBvG g==;
X-CSE-ConnectionGUID: 7V9zg9yCR2eL8WH8eumUfQ==
X-CSE-MsgGUID: cpCisz39Snqx0GvH3ifmQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="51992467"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; d="scan'208";a="51992467"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2025 22:29:25 -0800
X-CSE-ConnectionGUID: 7RTAKAQVT6O0efy82FP6Cg==
X-CSE-MsgGUID: ldGesljkT0Wpyw+ntJqtVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117568048"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by orviesa010.jf.intel.com with ESMTP; 01 Mar 2025 22:29:24 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tocpF-000H7y-38;
 Sun, 02 Mar 2025 06:29:21 +0000
Date: Sun, 02 Mar 2025 14:28:49 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 067a974fd8a9ea43f97ca184e2768b583f2f8c44
Message-ID: <202503021443.F8Hy0CoS-lkp@intel.com>
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
branch HEAD: 067a974fd8a9ea43f97ca184e2768b583f2f8c44  drm/xe: Add performance tunings to debugfs

elapsed time: 1442m

configs tested: 121
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              alldefconfig    gcc-13.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-13.2.0
arc                   randconfig-001-20250301    gcc-13.2.0
arc                   randconfig-002-20250301    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                            hisi_defconfig    gcc-14.2.0
arm                   randconfig-001-20250301    gcc-14.2.0
arm                   randconfig-002-20250301    gcc-14.2.0
arm                   randconfig-003-20250301    clang-21
arm                   randconfig-004-20250301    clang-21
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250301    gcc-14.2.0
arm64                 randconfig-002-20250301    clang-21
arm64                 randconfig-003-20250301    clang-15
arm64                 randconfig-004-20250301    clang-17
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250301    gcc-14.2.0
csky                  randconfig-002-20250301    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250301    clang-21
hexagon               randconfig-002-20250301    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250301    clang-19
i386        buildonly-randconfig-002-20250301    clang-19
i386        buildonly-randconfig-003-20250301    clang-19
i386        buildonly-randconfig-004-20250301    clang-19
i386        buildonly-randconfig-005-20250301    gcc-12
i386        buildonly-randconfig-006-20250301    clang-19
i386                                defconfig    clang-19
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250301    gcc-14.2.0
loongarch             randconfig-002-20250301    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-16
mips                            gpr_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250301    gcc-14.2.0
nios2                 randconfig-002-20250301    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250301    gcc-14.2.0
parisc                randconfig-002-20250301    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    clang-21
powerpc                       ebony_defconfig    clang-18
powerpc                    gamecube_defconfig    clang-16
powerpc                  mpc866_ads_defconfig    clang-21
powerpc               randconfig-001-20250301    clang-17
powerpc               randconfig-002-20250301    clang-19
powerpc               randconfig-003-20250301    clang-21
powerpc64             randconfig-001-20250301    gcc-14.2.0
powerpc64             randconfig-002-20250301    clang-21
powerpc64             randconfig-003-20250301    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250301    gcc-14.2.0
riscv                 randconfig-002-20250301    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250301    clang-15
s390                  randconfig-002-20250301    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250301    gcc-14.2.0
sh                    randconfig-002-20250301    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250301    gcc-14.2.0
sparc                 randconfig-002-20250301    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250301    gcc-14.2.0
sparc64               randconfig-002-20250301    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250301    gcc-12
um                    randconfig-002-20250301    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250301    clang-19
x86_64      buildonly-randconfig-002-20250301    clang-19
x86_64      buildonly-randconfig-003-20250301    gcc-11
x86_64      buildonly-randconfig-004-20250301    gcc-12
x86_64      buildonly-randconfig-005-20250301    gcc-12
x86_64      buildonly-randconfig-006-20250301    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250301    gcc-14.2.0
xtensa                randconfig-002-20250301    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
