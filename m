Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52291D5E38E
	for <intel-xe@archiver.kernel.org>; Sun, 10 Nov 2024 02:34:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D4410E2C9;
	Sun, 10 Nov 2024 02:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kQ0LF/sX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA76510E2C9
 for <intel-xe@lists.freedesktop.org>; Sun, 10 Nov 2024 02:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731206050; x=1762742050;
 h=date:from:to:cc:subject:message-id;
 bh=3PS22OG1hfMcVK6fRtmQVvpzQbPXZ+HoHdT33pybaiQ=;
 b=kQ0LF/sXxBYeIhdAZSjbn0aVNOkz3y9mQTd+xJL1bEYAamNlROgpzOb5
 ubUtBdPILfJvl6EdbNTqHV6CKjmEKFE/PJXU28gCmqwzjT/A7R6sYhWxO
 OxYgyndvJpJwjyyLj8/lEMztl9d1kAyAcLBQeGhRAUG/TMlDN9BS/M39N
 j7WtYTnJLHeTotx7JdBQuSD85nCHXmBlG7XPm3EYleNEJ99PvFteE4vbV
 8tvXOlomKBVrPuqHmbuS4Ci5sZHNVUnGVvY48KJFBDTgXYmK4kosd9vDy
 anghOS8QsyH27T95hZiFT1G3B4JRKmYcisENp1PkXNXIaoTY3ufyKYnuT g==;
X-CSE-ConnectionGUID: 0hXHCe7PQharYCgIWFewIA==
X-CSE-MsgGUID: 00Hf+jd2QWeDhpWNjaoVUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="30452020"
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; d="scan'208";a="30452020"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2024 18:34:10 -0800
X-CSE-ConnectionGUID: TOyQK3VBRWeZHObVXbGbrw==
X-CSE-MsgGUID: xb29zY9hQXuaSn6OMNrRUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; d="scan'208";a="86180868"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 09 Nov 2024 18:34:09 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t9xmA-000sr0-2V;
 Sun, 10 Nov 2024 02:34:06 +0000
Date: Sun, 10 Nov 2024 10:33:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 f7278da76da2589af13bc8a487d0e8f8abdecc99
Message-ID: <202411101001.6FFXgI6z-lkp@intel.com>
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
branch HEAD: f7278da76da2589af13bc8a487d0e8f8abdecc99  drm/xe/guc: Do not assert CTB state while sending MMIO

elapsed time: 728m

configs tested: 173
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.2.0
arc                        nsimosci_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                       aspeed_g4_defconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-20
arm                                 defconfig    gcc-14.2.0
arm                          exynos_defconfig    gcc-14.2.0
arm                          gemini_defconfig    clang-20
arm                           imxrt_defconfig    clang-20
arm                   milbeaut_m10v_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    clang-20
arm                           sama5_defconfig    clang-20
arm                           stm32_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241110    gcc-11
i386        buildonly-randconfig-002-20241110    gcc-11
i386        buildonly-randconfig-003-20241110    gcc-11
i386        buildonly-randconfig-004-20241110    gcc-11
i386        buildonly-randconfig-005-20241110    gcc-11
i386        buildonly-randconfig-006-20241110    gcc-11
i386                                defconfig    clang-19
i386                  randconfig-001-20241110    gcc-11
i386                  randconfig-002-20241110    gcc-11
i386                  randconfig-003-20241110    gcc-11
i386                  randconfig-004-20241110    gcc-11
i386                  randconfig-005-20241110    gcc-11
i386                  randconfig-006-20241110    gcc-11
i386                  randconfig-011-20241110    gcc-11
i386                  randconfig-012-20241110    gcc-11
i386                  randconfig-013-20241110    gcc-11
i386                  randconfig-014-20241110    gcc-11
i386                  randconfig-015-20241110    gcc-11
i386                  randconfig-016-20241110    gcc-11
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           mtx1_defconfig    clang-20
mips                          rb532_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                       virt_defconfig    clang-20
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.2.0
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      chrp32_defconfig    clang-20
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                    ge_imp3a_defconfig    clang-20
powerpc                    ge_imp3a_defconfig    gcc-14.2.0
powerpc                     kmeter1_defconfig    gcc-14.2.0
powerpc                 mpc834x_itx_defconfig    gcc-14.2.0
riscv                            alldefconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                          debug_defconfig    clang-20
s390                                defconfig    clang-20
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                          rsk7264_defconfig    clang-20
sh                           se7712_defconfig    gcc-14.2.0
sh                   sh7724_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241109    gcc-12
x86_64      buildonly-randconfig-001-20241110    gcc-12
x86_64      buildonly-randconfig-002-20241109    gcc-12
x86_64      buildonly-randconfig-002-20241110    gcc-12
x86_64      buildonly-randconfig-003-20241109    gcc-12
x86_64      buildonly-randconfig-003-20241110    gcc-12
x86_64      buildonly-randconfig-004-20241109    gcc-12
x86_64      buildonly-randconfig-004-20241110    gcc-12
x86_64      buildonly-randconfig-005-20241109    gcc-12
x86_64      buildonly-randconfig-005-20241110    gcc-12
x86_64      buildonly-randconfig-006-20241109    gcc-12
x86_64      buildonly-randconfig-006-20241110    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241109    gcc-12
x86_64                randconfig-001-20241110    gcc-12
x86_64                randconfig-002-20241109    gcc-12
x86_64                randconfig-002-20241110    gcc-12
x86_64                randconfig-003-20241109    gcc-12
x86_64                randconfig-003-20241110    gcc-12
x86_64                randconfig-004-20241109    gcc-12
x86_64                randconfig-004-20241110    gcc-12
x86_64                randconfig-005-20241109    gcc-12
x86_64                randconfig-005-20241110    gcc-12
x86_64                randconfig-006-20241109    gcc-12
x86_64                randconfig-006-20241110    gcc-12
x86_64                randconfig-011-20241109    gcc-12
x86_64                randconfig-011-20241110    gcc-12
x86_64                randconfig-012-20241109    gcc-12
x86_64                randconfig-012-20241110    gcc-12
x86_64                randconfig-013-20241109    gcc-12
x86_64                randconfig-013-20241110    gcc-12
x86_64                randconfig-014-20241109    gcc-12
x86_64                randconfig-014-20241110    gcc-12
x86_64                randconfig-015-20241109    gcc-12
x86_64                randconfig-015-20241110    gcc-12
x86_64                randconfig-016-20241109    gcc-12
x86_64                randconfig-016-20241110    gcc-12
x86_64                randconfig-071-20241109    gcc-12
x86_64                randconfig-071-20241110    gcc-12
x86_64                randconfig-072-20241109    gcc-12
x86_64                randconfig-072-20241110    gcc-12
x86_64                randconfig-073-20241109    gcc-12
x86_64                randconfig-073-20241110    gcc-12
x86_64                randconfig-074-20241109    gcc-12
x86_64                randconfig-074-20241110    gcc-12
x86_64                randconfig-075-20241109    gcc-12
x86_64                randconfig-075-20241110    gcc-12
x86_64                randconfig-076-20241109    gcc-12
x86_64                randconfig-076-20241110    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
