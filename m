Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB622C83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 04:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7034389321;
	Wed,  9 Jul 2025 04:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uy5XWsJ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6370589321
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 04:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752034719; x=1783570719;
 h=date:from:to:cc:subject:message-id;
 bh=qXcThO2vEqT8JQ57zbxjowRPOLWEAWRM6dOJ4s/k65E=;
 b=Uy5XWsJ6gNy31wy4Ba1UnriWMkQKZ7MDEGVTtsgCiiMr5JSdHXFt++AL
 Gt0ndb/NxpQBkyjcb8a/2NaIse3plDFAHstqGqw1HFQUP/r9M6rhuGzbU
 NIxtz9KleA7zylL3ZrfBXq0UAYJOVimErn+C/30igYJYWbNgMaM1WaxDn
 RdHYntVhSf45w9awA9cINAo01lojgYxoFVLxiiENEAQuWTr0JbntYAG+m
 6km/BR3q0M/H/QwKuosvu/yw7EC71p59UZy4+HnYSFs+1iezR0iiQDL7B
 ePuRRcn16QwFVQT8g/lrmdlk8dms7WHTKLTUOe8NQumQ7w1TgNVw1J8Rn A==;
X-CSE-ConnectionGUID: sYYF4EfYR/qoHTlKFp/zmw==
X-CSE-MsgGUID: o7IRcQz8R6qZJ+jBU3An6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54376277"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54376277"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 21:18:39 -0700
X-CSE-ConnectionGUID: Kl5TsM51T2+JwIHG1LIacg==
X-CSE-MsgGUID: i5hXa2WDRgugxp1zHAzAWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155082965"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 08 Jul 2025 21:18:38 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uZMGR-00035N-1h;
 Wed, 09 Jul 2025 04:18:35 +0000
Date: Wed, 09 Jul 2025 12:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 7aba72c6631e8fb2caaaae22a3f53f03de3c4279
Message-ID: <202507091242.RGSC7V0O-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: 7aba72c6631e8fb2caaaae22a3f53f03de3c4279  FOR-DRM-XE-FIXES-TEST-UNBLOCK: platform/x86: asus-wmi: Only register lps0 dev for Ally devices

elapsed time: 1455m

configs tested: 247
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-21
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-21
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250708    gcc-13.4.0
arc                   randconfig-001-20250709    gcc-10.5.0
arc                   randconfig-002-20250708    gcc-8.5.0
arc                   randconfig-002-20250709    gcc-10.5.0
arc                        vdk_hs38_defconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                           imxrt_defconfig    gcc-15.1.0
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                   randconfig-001-20250708    clang-21
arm                   randconfig-001-20250709    gcc-10.5.0
arm                   randconfig-002-20250708    clang-17
arm                   randconfig-002-20250709    gcc-10.5.0
arm                   randconfig-003-20250708    gcc-10.5.0
arm                   randconfig-003-20250709    gcc-10.5.0
arm                   randconfig-004-20250708    clang-21
arm                   randconfig-004-20250709    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-21
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250708    gcc-9.5.0
arm64                 randconfig-001-20250709    gcc-10.5.0
arm64                 randconfig-002-20250708    clang-19
arm64                 randconfig-002-20250709    gcc-10.5.0
arm64                 randconfig-003-20250708    clang-21
arm64                 randconfig-003-20250709    gcc-10.5.0
arm64                 randconfig-004-20250708    gcc-8.5.0
arm64                 randconfig-004-20250709    gcc-10.5.0
csky                              allnoconfig    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250708    gcc-13.4.0
csky                  randconfig-001-20250709    gcc-14.2.0
csky                  randconfig-002-20250708    gcc-15.1.0
csky                  randconfig-002-20250709    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250708    clang-21
hexagon               randconfig-001-20250709    gcc-14.2.0
hexagon               randconfig-002-20250708    clang-21
hexagon               randconfig-002-20250709    gcc-14.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250708    clang-20
i386        buildonly-randconfig-001-20250709    clang-20
i386        buildonly-randconfig-002-20250708    clang-20
i386        buildonly-randconfig-002-20250709    clang-20
i386        buildonly-randconfig-003-20250708    clang-20
i386        buildonly-randconfig-003-20250709    clang-20
i386        buildonly-randconfig-004-20250708    gcc-12
i386        buildonly-randconfig-004-20250709    clang-20
i386        buildonly-randconfig-005-20250708    clang-20
i386        buildonly-randconfig-005-20250709    clang-20
i386        buildonly-randconfig-006-20250708    clang-20
i386        buildonly-randconfig-006-20250709    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250709    clang-20
i386                  randconfig-002-20250709    clang-20
i386                  randconfig-003-20250709    clang-20
i386                  randconfig-004-20250709    clang-20
i386                  randconfig-005-20250709    clang-20
i386                  randconfig-006-20250709    clang-20
i386                  randconfig-007-20250709    clang-20
i386                  randconfig-011-20250709    clang-20
i386                  randconfig-012-20250709    clang-20
i386                  randconfig-013-20250709    clang-20
i386                  randconfig-014-20250709    clang-20
i386                  randconfig-015-20250709    clang-20
i386                  randconfig-016-20250709    clang-20
i386                  randconfig-017-20250709    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250708    clang-21
loongarch             randconfig-001-20250709    gcc-14.2.0
loongarch             randconfig-002-20250708    clang-21
loongarch             randconfig-002-20250709    gcc-14.2.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                         10m50_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250708    gcc-8.5.0
nios2                 randconfig-001-20250709    gcc-14.2.0
nios2                 randconfig-002-20250708    gcc-8.5.0
nios2                 randconfig-002-20250709    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250708    gcc-9.3.0
parisc                randconfig-001-20250709    gcc-14.2.0
parisc                randconfig-002-20250708    gcc-14.3.0
parisc                randconfig-002-20250709    gcc-14.2.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20250708    gcc-8.5.0
powerpc               randconfig-001-20250709    gcc-14.2.0
powerpc               randconfig-002-20250708    clang-19
powerpc               randconfig-002-20250709    gcc-14.2.0
powerpc               randconfig-003-20250708    clang-21
powerpc               randconfig-003-20250709    gcc-14.2.0
powerpc64             randconfig-001-20250708    clang-21
powerpc64             randconfig-001-20250709    gcc-14.2.0
powerpc64             randconfig-002-20250708    clang-21
powerpc64             randconfig-002-20250709    gcc-14.2.0
powerpc64             randconfig-003-20250708    clang-21
powerpc64             randconfig-003-20250709    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250708    clang-16
riscv                 randconfig-001-20250709    gcc-12
riscv                 randconfig-002-20250708    gcc-11.5.0
riscv                 randconfig-002-20250709    gcc-12
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250708    gcc-14.3.0
s390                  randconfig-001-20250709    gcc-12
s390                  randconfig-002-20250708    gcc-9.3.0
s390                  randconfig-002-20250709    gcc-12
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    gcc-15.1.0
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20250708    gcc-11.5.0
sh                    randconfig-001-20250709    gcc-12
sh                    randconfig-002-20250708    gcc-15.1.0
sh                    randconfig-002-20250709    gcc-12
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250708    gcc-13.4.0
sparc                 randconfig-001-20250709    gcc-12
sparc                 randconfig-002-20250708    gcc-13.4.0
sparc                 randconfig-002-20250709    gcc-12
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250708    clang-21
sparc64               randconfig-001-20250709    gcc-12
sparc64               randconfig-002-20250708    gcc-15.1.0
sparc64               randconfig-002-20250709    gcc-12
um                               alldefconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250708    clang-21
um                    randconfig-001-20250709    gcc-12
um                    randconfig-002-20250708    clang-17
um                    randconfig-002-20250709    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250708    gcc-12
x86_64      buildonly-randconfig-001-20250709    clang-20
x86_64      buildonly-randconfig-002-20250708    gcc-12
x86_64      buildonly-randconfig-002-20250709    clang-20
x86_64      buildonly-randconfig-003-20250708    clang-20
x86_64      buildonly-randconfig-003-20250709    clang-20
x86_64      buildonly-randconfig-004-20250708    gcc-12
x86_64      buildonly-randconfig-004-20250709    clang-20
x86_64      buildonly-randconfig-005-20250708    clang-20
x86_64      buildonly-randconfig-005-20250709    clang-20
x86_64      buildonly-randconfig-006-20250708    clang-20
x86_64      buildonly-randconfig-006-20250709    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250709    clang-20
x86_64                randconfig-002-20250709    clang-20
x86_64                randconfig-003-20250709    clang-20
x86_64                randconfig-004-20250709    clang-20
x86_64                randconfig-005-20250709    clang-20
x86_64                randconfig-006-20250709    clang-20
x86_64                randconfig-007-20250709    clang-20
x86_64                randconfig-008-20250709    clang-20
x86_64                randconfig-071-20250709    gcc-12
x86_64                randconfig-072-20250709    gcc-12
x86_64                randconfig-073-20250709    gcc-12
x86_64                randconfig-074-20250709    gcc-12
x86_64                randconfig-075-20250709    gcc-12
x86_64                randconfig-076-20250709    gcc-12
x86_64                randconfig-077-20250709    gcc-12
x86_64                randconfig-078-20250709    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250708    gcc-8.5.0
xtensa                randconfig-001-20250709    gcc-12
xtensa                randconfig-002-20250708    gcc-9.3.0
xtensa                randconfig-002-20250709    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
