Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6E01094470
	for <intel-xe@archiver.kernel.org>; Sat, 21 Mar 2026 11:50:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A79D10E165;
	Sat, 21 Mar 2026 11:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdYHHDfH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229B010E165
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Mar 2026 11:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774093843; x=1805629843;
 h=date:from:to:cc:subject:message-id;
 bh=4uwOO/MFQ7vqJb7gwFnsmWzGGFA2+2Cd7sjj/k2GfNM=;
 b=mdYHHDfHPXKDdKr1ibfsq9fQfVpukyq0MmyaPr3mnYAlwweTB1wsjTMA
 Nmx+U5Sx5ZiW72puoMwwlznEoIW9h3av7QS0NywcM4XkO4WpicUTGuxjd
 DcY9WIze6Y3vt8mM1GLCAEuoXUnHF9Ps8NVdt6gAYw1t0YUonqKAQQwe4
 Q/wHYpLhJD6rZSZM/MkIu84N/Kwnc4buJRnpvlj3fusQPdrPHlXHft2ek
 lJ378XRxoSCUMpcANB/hkCnUhCHiB8mg4BjnCInONAdz0qagBmJ+s75xz
 Gg+1PGqOrWaR4/hYaYq9ZF0HDNVT0jUGv5rgUGn1E5u9jlpsV6JL0Iyy/ Q==;
X-CSE-ConnectionGUID: 9nmloenXT0CVgG3/bIJcXQ==
X-CSE-MsgGUID: GAk75s+vSAKvYgJ+pRubLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74874889"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; d="scan'208";a="74874889"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2026 04:50:42 -0700
X-CSE-ConnectionGUID: YsU/gzbpRg6/HF5TQzQkpQ==
X-CSE-MsgGUID: fMLNa0lGRkWkn4TuiL/Ybw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
 by fmviesa003.fm.intel.com with ESMTP; 21 Mar 2026 04:50:41 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1w3uql-000000000hR-0BgT;
 Sat, 21 Mar 2026 11:50:39 +0000
Date: Sat, 21 Mar 2026 19:50:25 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 cb7415d8cbb750221b48e5beebe8f402719a20d9
Message-ID: <202603211919.47xzpc3k-lkp@intel.com>
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
branch HEAD: cb7415d8cbb750221b48e5beebe8f402719a20d9  drm/xe: Fix format specifier for printing pointer differences

elapsed time: 1032m

configs tested: 191
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
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260321    gcc-8.5.0
arc                   randconfig-002-20260321    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                           h3600_defconfig    gcc-15.2.0
arm                   randconfig-001-20260321    gcc-8.5.0
arm                   randconfig-002-20260321    gcc-8.5.0
arm                   randconfig-003-20260321    gcc-8.5.0
arm                   randconfig-004-20260321    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260321    clang-23
arm64                 randconfig-002-20260321    clang-23
arm64                 randconfig-003-20260321    clang-23
arm64                 randconfig-004-20260321    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260321    clang-23
csky                  randconfig-002-20260321    clang-23
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260321    gcc-11.5.0
hexagon               randconfig-002-20260321    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260321    clang-20
i386        buildonly-randconfig-002-20260321    clang-20
i386        buildonly-randconfig-003-20260321    clang-20
i386        buildonly-randconfig-004-20260321    clang-20
i386        buildonly-randconfig-005-20260321    clang-20
i386        buildonly-randconfig-006-20260321    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260321    gcc-14
i386                  randconfig-002-20260321    gcc-14
i386                  randconfig-003-20260321    gcc-14
i386                  randconfig-004-20260321    gcc-14
i386                  randconfig-005-20260321    gcc-14
i386                  randconfig-006-20260321    gcc-14
i386                  randconfig-007-20260321    gcc-14
i386                  randconfig-011-20260321    gcc-12
i386                  randconfig-012-20260321    gcc-12
i386                  randconfig-013-20260321    gcc-12
i386                  randconfig-014-20260321    gcc-12
i386                  randconfig-015-20260321    gcc-12
i386                  randconfig-016-20260321    gcc-12
i386                  randconfig-017-20260321    gcc-12
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260321    gcc-11.5.0
loongarch             randconfig-002-20260321    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260321    gcc-11.5.0
nios2                 randconfig-002-20260321    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260321    clang-23
parisc                randconfig-002-20260321    clang-23
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      ppc44x_defconfig    clang-23
powerpc               randconfig-001-20260321    clang-23
powerpc               randconfig-002-20260321    clang-23
powerpc64             randconfig-001-20260321    clang-23
powerpc64             randconfig-002-20260321    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260321    clang-23
riscv                 randconfig-002-20260321    clang-23
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260321    clang-23
s390                  randconfig-002-20260321    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                        edosk7760_defconfig    gcc-15.2.0
sh                    randconfig-001-20260321    clang-23
sh                    randconfig-002-20260321    clang-23
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260321    gcc-14
sparc                 randconfig-002-20260321    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260321    gcc-14
sparc64               randconfig-002-20260321    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260321    gcc-14
um                    randconfig-002-20260321    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260321    clang-20
x86_64      buildonly-randconfig-002-20260321    clang-20
x86_64      buildonly-randconfig-003-20260321    clang-20
x86_64      buildonly-randconfig-004-20260321    clang-20
x86_64      buildonly-randconfig-005-20260321    clang-20
x86_64      buildonly-randconfig-006-20260321    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260321    clang-20
x86_64                randconfig-002-20260321    clang-20
x86_64                randconfig-003-20260321    clang-20
x86_64                randconfig-004-20260321    clang-20
x86_64                randconfig-005-20260321    clang-20
x86_64                randconfig-006-20260321    clang-20
x86_64                randconfig-011-20260321    clang-20
x86_64                randconfig-012-20260321    clang-20
x86_64                randconfig-013-20260321    clang-20
x86_64                randconfig-014-20260321    clang-20
x86_64                randconfig-015-20260321    clang-20
x86_64                randconfig-016-20260321    clang-20
x86_64                randconfig-071-20260321    gcc-14
x86_64                randconfig-072-20260321    gcc-14
x86_64                randconfig-073-20260321    gcc-14
x86_64                randconfig-074-20260321    gcc-14
x86_64                randconfig-075-20260321    gcc-14
x86_64                randconfig-076-20260321    gcc-14
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
xtensa                randconfig-001-20260321    gcc-14
xtensa                randconfig-002-20260321    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
