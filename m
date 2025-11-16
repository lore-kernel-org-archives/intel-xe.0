Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632D2CCD19A
	for <intel-xe@archiver.kernel.org>; Sun, 16 Nov 2025 15:50:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DA610E2BF;
	Sun, 16 Nov 2025 15:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YHjhCgGH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A6110E2BF
 for <intel-xe@lists.freedesktop.org>; Sun, 16 Nov 2025 15:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763308216; x=1794844216;
 h=date:from:to:cc:subject:message-id;
 bh=JRj3u8bLLufhJ7HCW5saXUcwrb13ZGRc9fPi7Ik65JY=;
 b=YHjhCgGHPLLT4vMULIylCzj1x7XKeRtLejbw6w66mSD0E5USx7dHjMGN
 ki79kDpY2qjxCa6pA2c6OO8YRsGrujNR8lz9bw8buPPp+umY8ATSkjliY
 7Kd3P9XC9nNctrfgdv7L5QDHjkIDBNZs8+6pG/UVI256B0Vp//VRQyZj8
 hUq1x0h8c+A+w4iQPPzIJXkxrR0dDvhLhkpn2a5E8j0eHVJHkZZe82xWp
 n8piBvJjUUPo4g9H08tm82/QeLtOrlXMn0rBNDL3W9g9l9N+HHWltd8OM
 iX4P0PL0pioEOkZRpamVM9FGncdTcQr0QjVz8pJcmaMO1BfPs5IvS+fLG w==;
X-CSE-ConnectionGUID: v3LVEiq1QBmEbnN2ITW5vQ==
X-CSE-MsgGUID: eAyczG/OQuKse7BqxcL70A==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="82951344"
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; d="scan'208";a="82951344"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2025 07:50:15 -0800
X-CSE-ConnectionGUID: /8KCjV4KRwSDurnkQUwstg==
X-CSE-MsgGUID: lr8PXniTT7yiagXzIukl2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; d="scan'208";a="190267243"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 16 Nov 2025 07:50:14 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vKf12-0008rn-0b;
 Sun, 16 Nov 2025 15:50:12 +0000
Date: Sun, 16 Nov 2025 23:49:47 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 c34a14bce7090862ebe5a64abe8d85df75e62737
Message-ID: <202511162341.mspY0xRy-lkp@intel.com>
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
branch HEAD: c34a14bce7090862ebe5a64abe8d85df75e62737  drm/xe/irq: Handle msix vector0 interrupt

elapsed time: 2362m

configs tested: 105
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251115    gcc-13.4.0
arc                   randconfig-002-20251115    gcc-11.5.0
arm                               allnoconfig    clang-22
arm                                 defconfig    clang-22
arm                   randconfig-001-20251115    clang-22
arm                   randconfig-002-20251115    gcc-8.5.0
arm                   randconfig-003-20251115    gcc-10.5.0
arm                   randconfig-004-20251115    clang-22
arm                        spear3xx_defconfig    clang-17
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251116    gcc-12.5.0
arm64                 randconfig-002-20251116    gcc-10.5.0
arm64                 randconfig-003-20251116    clang-22
arm64                 randconfig-004-20251116    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251116    gcc-12.5.0
csky                  randconfig-002-20251116    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251116    clang-22
hexagon               randconfig-002-20251116    clang-17
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251116    clang-20
i386        buildonly-randconfig-002-20251116    clang-20
i386        buildonly-randconfig-003-20251116    clang-20
i386        buildonly-randconfig-004-20251116    gcc-14
i386        buildonly-randconfig-005-20251116    clang-20
i386        buildonly-randconfig-006-20251116    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251116    gcc-14
i386                  randconfig-002-20251116    clang-20
i386                  randconfig-003-20251116    gcc-14
i386                  randconfig-004-20251116    gcc-14
i386                  randconfig-011-20251116    clang-20
i386                  randconfig-012-20251116    gcc-14
i386                  randconfig-013-20251116    gcc-14
i386                  randconfig-014-20251116    clang-20
i386                  randconfig-015-20251116    gcc-12
i386                  randconfig-016-20251116    clang-20
i386                  randconfig-017-20251116    gcc-14
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251116    gcc-15.1.0
loongarch             randconfig-002-20251116    clang-22
m68k                              allnoconfig    gcc-15.1.0
m68k                          atari_defconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        omega2p_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251116    gcc-11.5.0
nios2                 randconfig-002-20251116    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251116    gcc-12.5.0
parisc                randconfig-002-20251116    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                       ppc64_defconfig    clang-22
powerpc               randconfig-001-20251116    gcc-10.5.0
powerpc                     redwood_defconfig    clang-22
powerpc                  storcenter_defconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-002-20251116    gcc-10.5.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251116    gcc-13.4.0
sh                    randconfig-002-20251116    gcc-15.1.0
sh                           se7780_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251116    clang-20
x86_64      buildonly-randconfig-002-20251116    clang-20
x86_64      buildonly-randconfig-003-20251116    clang-20
x86_64      buildonly-randconfig-004-20251116    gcc-13
x86_64      buildonly-randconfig-005-20251116    clang-20
x86_64      buildonly-randconfig-006-20251116    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-002-20251116    gcc-14
x86_64                randconfig-011-20251116    clang-20
x86_64                randconfig-012-20251116    clang-20
x86_64                randconfig-013-20251116    gcc-14
x86_64                randconfig-014-20251116    clang-20
x86_64                randconfig-015-20251116    clang-20
x86_64                randconfig-016-20251116    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
