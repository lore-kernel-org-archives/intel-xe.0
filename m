Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D1AC54E71
	for <intel-xe@archiver.kernel.org>; Sat, 24 May 2025 09:10:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9A210E171;
	Sat, 24 May 2025 09:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CblPPzO0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63A510E171
 for <intel-xe@lists.freedesktop.org>; Sat, 24 May 2025 09:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748077844; x=1779613844;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=qLKqN0Z/E8bhp8YL54uACHgnXZutgF/V7HQED52glas=;
 b=CblPPzO0nkgg7RXtdnAYO6/WQPA15z8ZH4aDzbSrUgOWSgX+HASHVbmJ
 jPrJNHDwR9MurX5EtFA6eQkPnFd4mmPm2XaSr2zL6oZx+wpW6/r3A1QUa
 v7wMxsMju/t2br0fWFbPvqUcdOMf/pboErt/O80+R2v3r894HMHUOMrMc
 QFUENvGRFx5h8oxj4/UNF2oO8HawD3uEICYPjvyMT/nGpXhHiJvltFYvO
 5nAOqbkpj8BRfvCFaU+iXO38BxLY28Q7t/jIwBkbGJa6BwZUmT7JCF7gB
 1NhjSb22EmrOdNlxgo3r51YnfcZN2jaYxm82M5LW4jRpiClfdb3bLkUoe Q==;
X-CSE-ConnectionGUID: RWXBfCIqQqmuxesVAhYofg==
X-CSE-MsgGUID: bHzWiJ6VR6OxffoJvBOEwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50120452"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; d="scan'208";a="50120452"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2025 02:10:39 -0700
X-CSE-ConnectionGUID: AIIAhxbSTf69ZzpJi3Dq0Q==
X-CSE-MsgGUID: s5MS4Wh3TsGZWhefSU2G7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; d="scan'208";a="141897628"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 24 May 2025 02:10:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uIktn-000R4W-1o;
 Sat, 24 May 2025 09:10:35 +0000
Date: Sat, 24 May 2025 17:10:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next-fixes] BUILD SUCCESS
 879ede53958f7bab79a88888f77e0ca91f0f77da
Message-ID: <202505241715.ajkdnFqh-lkp@intel.com>
User-Agent: s-nail v14.9.24
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next-fixes
branch HEAD: 879ede53958f7bab79a88888f77e0ca91f0f77da  drm/xe: Default auto_link_downgrade status to false

elapsed time: 1448m

configs tested: 240
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250523    gcc-15.1.0
arc                   randconfig-001-20250524    gcc-8.5.0
arc                   randconfig-002-20250523    gcc-10.5.0
arc                   randconfig-002-20250524    gcc-8.5.0
arm                              alldefconfig    clang-18
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    clang-18
arm                   randconfig-001-20250523    clang-16
arm                   randconfig-001-20250524    gcc-8.5.0
arm                   randconfig-002-20250523    gcc-8.5.0
arm                   randconfig-002-20250524    gcc-8.5.0
arm                   randconfig-003-20250523    gcc-7.5.0
arm                   randconfig-003-20250524    gcc-8.5.0
arm                   randconfig-004-20250523    clang-21
arm                   randconfig-004-20250524    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250523    gcc-8.5.0
arm64                 randconfig-001-20250524    gcc-8.5.0
arm64                 randconfig-002-20250523    clang-16
arm64                 randconfig-002-20250524    gcc-8.5.0
arm64                 randconfig-003-20250523    clang-21
arm64                 randconfig-003-20250524    gcc-8.5.0
arm64                 randconfig-004-20250523    gcc-8.5.0
arm64                 randconfig-004-20250524    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250523    gcc-10.5.0
csky                  randconfig-001-20250524    gcc-13.3.0
csky                  randconfig-002-20250523    gcc-14.2.0
csky                  randconfig-002-20250524    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250523    clang-21
hexagon               randconfig-001-20250524    gcc-13.3.0
hexagon               randconfig-002-20250523    clang-21
hexagon               randconfig-002-20250524    gcc-13.3.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250523    clang-20
i386        buildonly-randconfig-001-20250524    gcc-12
i386        buildonly-randconfig-002-20250523    clang-20
i386        buildonly-randconfig-002-20250524    gcc-12
i386        buildonly-randconfig-003-20250523    clang-20
i386        buildonly-randconfig-003-20250524    gcc-12
i386        buildonly-randconfig-004-20250523    clang-20
i386        buildonly-randconfig-004-20250524    gcc-12
i386        buildonly-randconfig-005-20250523    clang-20
i386        buildonly-randconfig-005-20250524    gcc-12
i386        buildonly-randconfig-006-20250523    clang-20
i386        buildonly-randconfig-006-20250524    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-011-20250524    clang-20
i386                  randconfig-012-20250524    clang-20
i386                  randconfig-013-20250524    clang-20
i386                  randconfig-014-20250524    clang-20
i386                  randconfig-015-20250524    clang-20
i386                  randconfig-016-20250524    clang-20
i386                  randconfig-017-20250524    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250523    gcc-15.1.0
loongarch             randconfig-001-20250524    gcc-13.3.0
loongarch             randconfig-002-20250523    gcc-14.2.0
loongarch             randconfig-002-20250524    gcc-13.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    clang-18
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           gcw0_defconfig    gcc-14.2.0
mips                          rb532_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250523    gcc-10.5.0
nios2                 randconfig-001-20250524    gcc-13.3.0
nios2                 randconfig-002-20250523    gcc-10.5.0
nios2                 randconfig-002-20250524    gcc-13.3.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250523    gcc-9.3.0
parisc                randconfig-001-20250524    gcc-13.3.0
parisc                randconfig-002-20250523    gcc-7.5.0
parisc                randconfig-002-20250524    gcc-13.3.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                   bluestone_defconfig    gcc-14.2.0
powerpc                        cell_defconfig    gcc-14.2.0
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    clang-18
powerpc                      pmac32_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250523    clang-21
powerpc               randconfig-001-20250524    gcc-13.3.0
powerpc               randconfig-002-20250523    clang-21
powerpc               randconfig-002-20250524    gcc-13.3.0
powerpc               randconfig-003-20250523    clang-20
powerpc               randconfig-003-20250524    gcc-13.3.0
powerpc                     skiroot_defconfig    gcc-14.2.0
powerpc                      tqm8xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250523    clang-21
powerpc64             randconfig-001-20250524    gcc-13.3.0
powerpc64             randconfig-002-20250523    clang-19
powerpc64             randconfig-002-20250524    gcc-13.3.0
powerpc64             randconfig-003-20250523    clang-21
powerpc64             randconfig-003-20250524    gcc-13.3.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250523    gcc-8.5.0
riscv                 randconfig-001-20250524    gcc-8.5.0
riscv                 randconfig-002-20250523    clang-17
riscv                 randconfig-002-20250524    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250523    gcc-6.5.0
s390                  randconfig-001-20250524    gcc-8.5.0
s390                  randconfig-002-20250523    clang-21
s390                  randconfig-002-20250524    gcc-8.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    clang-18
sh                    randconfig-001-20250523    gcc-12.4.0
sh                    randconfig-001-20250524    gcc-8.5.0
sh                    randconfig-002-20250523    gcc-6.5.0
sh                    randconfig-002-20250524    gcc-8.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250523    gcc-10.3.0
sparc                 randconfig-001-20250524    gcc-8.5.0
sparc                 randconfig-002-20250523    gcc-10.3.0
sparc                 randconfig-002-20250524    gcc-8.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250523    gcc-9.3.0
sparc64               randconfig-001-20250524    gcc-8.5.0
sparc64               randconfig-002-20250523    gcc-7.5.0
sparc64               randconfig-002-20250524    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250523    gcc-12
um                    randconfig-001-20250524    gcc-8.5.0
um                    randconfig-002-20250523    gcc-12
um                    randconfig-002-20250524    gcc-8.5.0
um                           x86_64_defconfig    gcc-12
x86_64                           alldefconfig    gcc-14.2.0
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250523    gcc-12
x86_64      buildonly-randconfig-001-20250524    gcc-12
x86_64      buildonly-randconfig-002-20250523    clang-20
x86_64      buildonly-randconfig-002-20250524    gcc-12
x86_64      buildonly-randconfig-003-20250523    clang-20
x86_64      buildonly-randconfig-003-20250524    gcc-12
x86_64      buildonly-randconfig-004-20250523    clang-20
x86_64      buildonly-randconfig-004-20250524    gcc-12
x86_64      buildonly-randconfig-005-20250523    clang-20
x86_64      buildonly-randconfig-005-20250524    gcc-12
x86_64      buildonly-randconfig-006-20250523    gcc-12
x86_64      buildonly-randconfig-006-20250524    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250524    clang-20
x86_64                randconfig-002-20250524    clang-20
x86_64                randconfig-003-20250524    clang-20
x86_64                randconfig-004-20250524    clang-20
x86_64                randconfig-005-20250524    clang-20
x86_64                randconfig-006-20250524    clang-20
x86_64                randconfig-007-20250524    clang-20
x86_64                randconfig-008-20250524    clang-20
x86_64                randconfig-071-20250524    clang-20
x86_64                randconfig-072-20250524    clang-20
x86_64                randconfig-073-20250524    clang-20
x86_64                randconfig-074-20250524    clang-20
x86_64                randconfig-075-20250524    clang-20
x86_64                randconfig-076-20250524    clang-20
x86_64                randconfig-077-20250524    clang-20
x86_64                randconfig-078-20250524    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    clang-18
xtensa                randconfig-001-20250523    gcc-9.3.0
xtensa                randconfig-001-20250524    gcc-8.5.0
xtensa                randconfig-002-20250523    gcc-11.5.0
xtensa                randconfig-002-20250524    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
