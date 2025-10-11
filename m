Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144FECCA476
	for <intel-xe@archiver.kernel.org>; Sat, 11 Oct 2025 16:50:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E0610E0F7;
	Sat, 11 Oct 2025 16:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TE76/ui1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A5510E0F7
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Oct 2025 16:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760201416; x=1791737416;
 h=date:from:to:cc:subject:message-id;
 bh=fKq8paigA/8B6OlSwCsQus0+aUenpYUczTMSqFJUtEw=;
 b=TE76/ui1gigGEulM8a/FfNdEUFTd52LBGTH90oiAG+DmgXpvGQWZtJ0F
 RsKXIfd82zWD/oitKa1qvDyr8apmSDtNG9TyQmBp7rmUITHJ9Q0QRDasM
 nkIRFbY8Cki33us4i/sbY1ypemzV6NJOpriZQyfoGeJAjHYYftWqkNG9i
 VUrAuCTQIpPQEfjzZF4WgbBxVsFfnIqXVwWvD4fF8qM+ejZy4LghEoJ5g
 fIlEcaElF53/OkFvBOAIB7P7C65cp6lKW3tErONQlsM43+dbyjr1ngdMo
 clzVaX3omSlYXBpI5l5aA9PKoPiiLgK3NsB47Ir7RjYq+lADQaoB7pYdF g==;
X-CSE-ConnectionGUID: UJ4KQZCTS++0mlM7DGYnSg==
X-CSE-MsgGUID: 4q3zBPJjRRaHZLhkNOiQtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="62276727"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="62276727"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 09:50:15 -0700
X-CSE-ConnectionGUID: k4TWFXfbQKS/FN1ErjeH/w==
X-CSE-MsgGUID: Hx0+oer0SBWmFWosC/2+eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="212180524"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 11 Oct 2025 09:50:14 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v7cnL-0003sB-2X;
 Sat, 11 Oct 2025 16:50:11 +0000
Date: Sun, 12 Oct 2025 00:50:02 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 65369b8e29613682b3c0484e0630d8500b421132
Message-ID: <202510120056.zWLNzpdW-lkp@intel.com>
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
branch HEAD: 65369b8e29613682b3c0484e0630d8500b421132  drm/xe: Change return type of detect_bar2_dgfx() from s64 to u64

elapsed time: 1272m

configs tested: 231
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                          axs101_defconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20251011    clang-22
arc                   randconfig-001-20251011    gcc-9.5.0
arc                   randconfig-002-20251011    clang-22
arc                   randconfig-002-20251011    gcc-9.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                            qcom_defconfig    clang-22
arm                   randconfig-001-20251011    clang-22
arm                   randconfig-002-20251011    clang-22
arm                   randconfig-002-20251011    gcc-12.5.0
arm                   randconfig-003-20251011    clang-22
arm                   randconfig-004-20251011    clang-22
arm                           stm32_defconfig    gcc-15.1.0
arm                           tegra_defconfig    gcc-15.1.0
arm                         wpcm450_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251011    clang-22
arm64                 randconfig-001-20251011    gcc-10.5.0
arm64                 randconfig-002-20251011    clang-22
arm64                 randconfig-002-20251011    gcc-12.5.0
arm64                 randconfig-003-20251011    clang-22
arm64                 randconfig-004-20251011    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251011    gcc-13.4.0
csky                  randconfig-001-20251011    gcc-8.5.0
csky                  randconfig-002-20251011    gcc-13.4.0
csky                  randconfig-002-20251011    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251011    clang-18
hexagon               randconfig-001-20251011    gcc-8.5.0
hexagon               randconfig-002-20251011    clang-22
hexagon               randconfig-002-20251011    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251011    clang-20
i386        buildonly-randconfig-001-20251011    gcc-13
i386        buildonly-randconfig-002-20251011    clang-20
i386        buildonly-randconfig-003-20251011    clang-20
i386        buildonly-randconfig-003-20251011    gcc-14
i386        buildonly-randconfig-004-20251011    clang-20
i386        buildonly-randconfig-004-20251011    gcc-14
i386        buildonly-randconfig-005-20251011    clang-20
i386        buildonly-randconfig-006-20251011    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251011    gcc-14
i386                  randconfig-002-20251011    gcc-14
i386                  randconfig-003-20251011    gcc-14
i386                  randconfig-004-20251011    gcc-14
i386                  randconfig-005-20251011    gcc-14
i386                  randconfig-006-20251011    gcc-14
i386                  randconfig-007-20251011    gcc-14
i386                  randconfig-011-20251011    clang-20
i386                  randconfig-012-20251011    clang-20
i386                  randconfig-013-20251011    clang-20
i386                  randconfig-014-20251011    clang-20
i386                  randconfig-015-20251011    clang-20
i386                  randconfig-016-20251011    clang-20
i386                  randconfig-017-20251011    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251011    clang-18
loongarch             randconfig-001-20251011    gcc-8.5.0
loongarch             randconfig-002-20251011    gcc-12.5.0
loongarch             randconfig-002-20251011    gcc-8.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        m5272c3_defconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251011    gcc-8.5.0
nios2                 randconfig-002-20251011    gcc-8.5.0
nios2                 randconfig-002-20251011    gcc-9.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           alldefconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251011    gcc-8.5.0
parisc                randconfig-002-20251011    gcc-14.3.0
parisc                randconfig-002-20251011    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                        fsp2_defconfig    gcc-15.1.0
powerpc                         ps3_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251011    clang-22
powerpc               randconfig-001-20251011    gcc-8.5.0
powerpc               randconfig-002-20251011    gcc-8.5.0
powerpc               randconfig-003-20251011    clang-22
powerpc               randconfig-003-20251011    gcc-8.5.0
powerpc64             randconfig-001-20251011    clang-22
powerpc64             randconfig-001-20251011    gcc-8.5.0
powerpc64             randconfig-002-20251011    gcc-8.5.0
powerpc64             randconfig-003-20251011    clang-22
powerpc64             randconfig-003-20251011    gcc-8.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251011    clang-18
riscv                 randconfig-001-20251011    clang-22
riscv                 randconfig-002-20251011    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251011    clang-22
s390                  randconfig-001-20251011    gcc-9.5.0
s390                  randconfig-002-20251011    clang-22
s390                  randconfig-002-20251011    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                        apsh4ad0a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                ecovec24-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20251011    clang-22
sh                    randconfig-001-20251011    gcc-15.1.0
sh                    randconfig-002-20251011    clang-22
sh                    randconfig-002-20251011    gcc-11.5.0
sh                           se7750_defconfig    gcc-15.1.0
sh                        sh7757lcr_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251011    clang-22
sparc                 randconfig-001-20251011    gcc-15.1.0
sparc                 randconfig-002-20251011    clang-22
sparc                 randconfig-002-20251011    gcc-15.1.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251011    clang-22
sparc64               randconfig-002-20251011    clang-22
sparc64               randconfig-002-20251011    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251011    clang-17
um                    randconfig-001-20251011    clang-22
um                    randconfig-002-20251011    clang-19
um                    randconfig-002-20251011    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251011    clang-20
x86_64      buildonly-randconfig-002-20251011    clang-20
x86_64      buildonly-randconfig-003-20251011    clang-20
x86_64      buildonly-randconfig-004-20251011    clang-20
x86_64      buildonly-randconfig-004-20251011    gcc-14
x86_64      buildonly-randconfig-005-20251011    clang-20
x86_64      buildonly-randconfig-005-20251011    gcc-14
x86_64      buildonly-randconfig-006-20251011    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251011    gcc-14
x86_64                randconfig-002-20251011    gcc-14
x86_64                randconfig-003-20251011    gcc-14
x86_64                randconfig-004-20251011    gcc-14
x86_64                randconfig-005-20251011    gcc-14
x86_64                randconfig-006-20251011    gcc-14
x86_64                randconfig-007-20251011    gcc-14
x86_64                randconfig-008-20251011    gcc-14
x86_64                randconfig-071-20251011    clang-20
x86_64                randconfig-072-20251011    clang-20
x86_64                randconfig-073-20251011    clang-20
x86_64                randconfig-074-20251011    clang-20
x86_64                randconfig-075-20251011    clang-20
x86_64                randconfig-076-20251011    clang-20
x86_64                randconfig-077-20251011    clang-20
x86_64                randconfig-078-20251011    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251011    clang-22
xtensa                randconfig-001-20251011    gcc-8.5.0
xtensa                randconfig-002-20251011    clang-22
xtensa                randconfig-002-20251011    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
