Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CF71061B24
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 22:39:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC1210E7BE;
	Mon, 30 Mar 2026 22:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOqOvlCB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896D910E7BB
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 22:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774910392; x=1806446392;
 h=date:from:to:cc:subject:message-id;
 bh=CyERnnpsHwIjEK3OvCZX13weWnkZPQ2r6tIyqDgbwtM=;
 b=aOqOvlCBszOc4KKq+ND6EVmBmx7OCY31NO/Rrl2cOIae2qsF8rw4uFRb
 eMoAovPXi/BINN4OfPM1TMLIumoEGTRKVbySSfDQGja5BU5WDuxJVpa8Z
 yRUPizi2zizzBqCV6WF4h31c1NFEFI5wjPSa3wUuGvnk3quT1l5CoKiiN
 zvfy+IHo5oCf28+tSsnBpc52VVhogRSokPWYwudAcRaBZGhwqI+aHrnti
 Zca16UET2ipuhIuIzaLcPtMlPcWQJhZHJVU3nvFrBEFuiTW5tYSUbcU6x
 iKJzHzsDzOTDfpHMCBjT0Hnf0dxaRyPtTvCojTuu+ga2ze+12x7VX8u24 g==;
X-CSE-ConnectionGUID: cyloqWC4Tcaxuu3YqsQdyg==
X-CSE-MsgGUID: PDLb8H3lQIWlUQkk3VUuzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="76104653"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="76104653"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 15:39:52 -0700
X-CSE-ConnectionGUID: T4dkIq0pTe6+Eyg/pn/CfA==
X-CSE-MsgGUID: VnhzCbAzRXiuPHTnrWZyZw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 30 Mar 2026 15:39:50 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1w7LGu-000000001o5-18oW;
 Mon, 30 Mar 2026 22:39:48 +0000
Date: Tue, 31 Mar 2026 06:38:56 +0800
From: kernel test robot <lkp@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 df03d7c2bbc91d1e83f8b42881ad791353df7d94
Message-ID: <202603310648.Aj0OywZE-lkp@intel.com>
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
branch HEAD: df03d7c2bbc91d1e83f8b42881ad791353df7d94  drm/xe: Document GT statistics

elapsed time: 744m

configs tested: 266
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                     haps_hs_smp_defconfig    gcc-15.2.0
arc                   randconfig-001-20260330    gcc-8.5.0
arc                   randconfig-001-20260331    clang-23
arc                   randconfig-002-20260330    gcc-8.5.0
arc                   randconfig-002-20260331    clang-23
arc                        vdk_hs38_defconfig    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260330    gcc-14.3.0
arm                   randconfig-001-20260331    clang-23
arm                   randconfig-002-20260330    clang-23
arm                   randconfig-002-20260331    clang-23
arm                   randconfig-003-20260330    clang-23
arm                   randconfig-003-20260331    clang-23
arm                   randconfig-004-20260330    gcc-8.5.0
arm                   randconfig-004-20260331    clang-23
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260330    clang-23
arm64                 randconfig-001-20260331    clang-18
arm64                 randconfig-002-20260330    clang-23
arm64                 randconfig-002-20260331    clang-18
arm64                 randconfig-003-20260330    gcc-8.5.0
arm64                 randconfig-003-20260331    clang-18
arm64                 randconfig-004-20260330    clang-23
arm64                 randconfig-004-20260331    clang-18
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260330    gcc-14.3.0
csky                  randconfig-001-20260331    clang-18
csky                  randconfig-002-20260330    gcc-15.2.0
csky                  randconfig-002-20260331    clang-18
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260331    clang-23
hexagon               randconfig-001-20260331    gcc-11.5.0
hexagon               randconfig-002-20260331    clang-19
hexagon               randconfig-002-20260331    gcc-11.5.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260330    clang-20
i386        buildonly-randconfig-001-20260331    clang-20
i386        buildonly-randconfig-002-20260330    clang-20
i386        buildonly-randconfig-002-20260331    clang-20
i386        buildonly-randconfig-003-20260330    clang-20
i386        buildonly-randconfig-003-20260331    clang-20
i386        buildonly-randconfig-004-20260330    gcc-14
i386        buildonly-randconfig-004-20260331    clang-20
i386        buildonly-randconfig-005-20260330    clang-20
i386        buildonly-randconfig-005-20260331    clang-20
i386        buildonly-randconfig-006-20260330    gcc-14
i386        buildonly-randconfig-006-20260331    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260330    clang-20
i386                  randconfig-001-20260331    gcc-14
i386                  randconfig-002-20260330    clang-20
i386                  randconfig-002-20260331    gcc-14
i386                  randconfig-003-20260330    clang-20
i386                  randconfig-003-20260331    gcc-14
i386                  randconfig-004-20260330    clang-20
i386                  randconfig-004-20260331    gcc-14
i386                  randconfig-005-20260330    clang-20
i386                  randconfig-005-20260331    gcc-14
i386                  randconfig-006-20260330    gcc-14
i386                  randconfig-006-20260331    gcc-14
i386                  randconfig-007-20260330    clang-20
i386                  randconfig-007-20260331    gcc-14
i386                  randconfig-011-20260330    gcc-14
i386                  randconfig-012-20260330    gcc-14
i386                  randconfig-013-20260330    gcc-14
i386                  randconfig-014-20260330    gcc-14
i386                  randconfig-015-20260330    gcc-14
i386                  randconfig-016-20260330    gcc-14
i386                  randconfig-017-20260330    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260331    gcc-11.5.0
loongarch             randconfig-001-20260331    gcc-12.5.0
loongarch             randconfig-002-20260331    gcc-11.5.0
loongarch             randconfig-002-20260331    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260331    gcc-11.5.0
nios2                 randconfig-002-20260331    gcc-11.5.0
nios2                 randconfig-002-20260331    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260330    gcc-8.5.0
parisc                randconfig-001-20260331    clang-23
parisc                randconfig-002-20260330    gcc-8.5.0
parisc                randconfig-002-20260331    clang-23
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260330    gcc-8.5.0
powerpc               randconfig-001-20260331    clang-23
powerpc               randconfig-002-20260330    clang-23
powerpc               randconfig-002-20260331    clang-23
powerpc64             randconfig-001-20260330    gcc-8.5.0
powerpc64             randconfig-001-20260331    clang-23
powerpc64             randconfig-002-20260330    clang-23
powerpc64             randconfig-002-20260331    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260331    gcc-15.2.0
riscv                 randconfig-002-20260330    clang-19
riscv                 randconfig-002-20260331    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260330    gcc-15.2.0
s390                  randconfig-001-20260331    gcc-15.2.0
s390                  randconfig-002-20260330    clang-20
s390                  randconfig-002-20260331    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260330    gcc-15.2.0
sh                    randconfig-001-20260331    gcc-15.2.0
sh                    randconfig-002-20260330    gcc-15.2.0
sh                    randconfig-002-20260331    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260331    gcc-8.5.0
sparc                 randconfig-002-20260331    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260331    clang-23
sparc64               randconfig-002-20260331    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260331    gcc-14
um                    randconfig-002-20260331    clang-23
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260330    clang-20
x86_64      buildonly-randconfig-001-20260331    clang-20
x86_64      buildonly-randconfig-002-20260330    gcc-14
x86_64      buildonly-randconfig-002-20260331    clang-20
x86_64      buildonly-randconfig-003-20260330    gcc-13
x86_64      buildonly-randconfig-003-20260331    clang-20
x86_64      buildonly-randconfig-004-20260330    gcc-14
x86_64      buildonly-randconfig-004-20260331    clang-20
x86_64      buildonly-randconfig-005-20260330    clang-20
x86_64      buildonly-randconfig-005-20260331    clang-20
x86_64      buildonly-randconfig-006-20260330    gcc-14
x86_64      buildonly-randconfig-006-20260331    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260330    gcc-14
x86_64                randconfig-001-20260331    gcc-14
x86_64                randconfig-002-20260330    clang-20
x86_64                randconfig-002-20260331    gcc-14
x86_64                randconfig-003-20260330    clang-20
x86_64                randconfig-003-20260331    gcc-14
x86_64                randconfig-004-20260330    clang-20
x86_64                randconfig-004-20260331    gcc-14
x86_64                randconfig-005-20260330    gcc-14
x86_64                randconfig-005-20260331    gcc-14
x86_64                randconfig-006-20260330    clang-20
x86_64                randconfig-006-20260331    gcc-14
x86_64                randconfig-011-20260330    gcc-14
x86_64                randconfig-011-20260331    clang-20
x86_64                randconfig-012-20260330    gcc-14
x86_64                randconfig-012-20260331    clang-20
x86_64                randconfig-013-20260330    gcc-14
x86_64                randconfig-013-20260331    clang-20
x86_64                randconfig-014-20260330    clang-20
x86_64                randconfig-014-20260331    clang-20
x86_64                randconfig-015-20260331    clang-20
x86_64                randconfig-016-20260330    gcc-14
x86_64                randconfig-016-20260331    clang-20
x86_64                randconfig-071-20260330    clang-20
x86_64                randconfig-071-20260331    clang-20
x86_64                randconfig-072-20260330    gcc-14
x86_64                randconfig-072-20260331    clang-20
x86_64                randconfig-073-20260330    clang-20
x86_64                randconfig-073-20260331    clang-20
x86_64                randconfig-074-20260330    clang-20
x86_64                randconfig-074-20260331    clang-20
x86_64                randconfig-075-20260330    clang-20
x86_64                randconfig-075-20260331    clang-20
x86_64                randconfig-076-20260330    clang-20
x86_64                randconfig-076-20260331    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260331    gcc-15.2.0
xtensa                randconfig-002-20260331    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
