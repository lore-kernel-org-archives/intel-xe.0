Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEFCE7719A
	for <intel-xe@archiver.kernel.org>; Sat, 11 Jan 2025 11:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F199F10E57A;
	Sat, 11 Jan 2025 11:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U8s7ODKq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05AF310E57A
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Jan 2025 11:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736593241; x=1768129241;
 h=date:from:to:cc:subject:message-id;
 bh=vFzZ31gvqKjvRyeG4s2QMvpQ5WqHVcaRtNxwcBri49s=;
 b=U8s7ODKqCfJkaD0PcbW0YwH9BBmdJskztLruZO9vWsl3Rh0AGv8IHAzc
 0iUfr9J6FqgXWtw3BWEom04o2pxTpJY3aOBWZWzODXCpgAQlx2217FKAd
 jL6FQJ3qFot54WR61pyydo4a+g55me1a+0MNTayDoIXCOii/K3RmLBRbD
 ptwBs/wS97NDsdkxP/EUiyTsVwwHZRBRIVswxwVZR3rxa/xYnImZ7YEYp
 mqN7lbAZHf/5cV6QvUFI6bcV3Zmq04FVmxNrCfbGGlvXE19i4qUBRgNk7
 gAkJqFxQRGu++ZaCUSSvyiYC8fOC2i/FhdkQ0a6RskN1rsGiibjAk/G9X g==;
X-CSE-ConnectionGUID: QgKM5BdxQuK4MwkwhmTWyw==
X-CSE-MsgGUID: 5CjsMXwSSjKoPwca5XsT3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="39698160"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; d="scan'208";a="39698160"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2025 03:00:38 -0800
X-CSE-ConnectionGUID: 9QFvtRnTRz60JnIKW48hxw==
X-CSE-MsgGUID: EZn2Y6pmRcSybJvza0BV4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; d="scan'208";a="103903017"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 11 Jan 2025 03:00:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tWZEJ-000KY7-0F;
 Sat, 11 Jan 2025 11:00:35 +0000
Date: Sat, 11 Jan 2025 18:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 6a04bb5a2046067681257d5dd69a724856c8fbcb
Message-ID: <202501111827.vA6S1Tvr-lkp@intel.com>
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
branch HEAD: 6a04bb5a2046067681257d5dd69a724856c8fbcb  drm/xe: remove unused xe_pciids.h harder, add missing PCI ID

elapsed time: 1459m

configs tested: 89
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
arc                               allnoconfig    gcc-13.2.0
arc                   randconfig-001-20250110    gcc-13.2.0
arc                   randconfig-002-20250110    gcc-13.2.0
arm                               allnoconfig    clang-17
arm                   randconfig-001-20250110    clang-20
arm                   randconfig-002-20250110    gcc-14.2.0
arm                   randconfig-003-20250110    clang-19
arm                   randconfig-004-20250110    gcc-14.2.0
arm                             rpc_defconfig    clang-17
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250110    gcc-14.2.0
arm64                 randconfig-002-20250110    gcc-14.2.0
arm64                 randconfig-003-20250110    clang-17
arm64                 randconfig-004-20250110    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250110    gcc-14.2.0
csky                  randconfig-002-20250110    gcc-14.2.0
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250110    clang-20
hexagon               randconfig-002-20250110    clang-20
i386        buildonly-randconfig-001-20250110    clang-19
i386        buildonly-randconfig-002-20250110    clang-19
i386        buildonly-randconfig-003-20250110    clang-19
i386        buildonly-randconfig-004-20250110    gcc-12
i386        buildonly-randconfig-005-20250110    gcc-12
i386        buildonly-randconfig-006-20250110    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250110    gcc-14.2.0
loongarch             randconfig-002-20250110    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
mips                           ip32_defconfig    clang-20
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250110    gcc-14.2.0
nios2                 randconfig-002-20250110    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250110    gcc-14.2.0
parisc                randconfig-002-20250110    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    clang-20
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250110    clang-20
powerpc               randconfig-002-20250110    clang-20
powerpc               randconfig-003-20250110    clang-20
powerpc64             randconfig-001-20250110    clang-17
powerpc64             randconfig-002-20250110    clang-19
powerpc64             randconfig-003-20250110    clang-17
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250110    clang-17
riscv                 randconfig-002-20250110    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250110    gcc-14.2.0
s390                  randconfig-002-20250110    gcc-14.2.0
sh                               alldefconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250110    gcc-14.2.0
sh                    randconfig-002-20250110    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250110    gcc-14.2.0
sparc                 randconfig-002-20250110    gcc-14.2.0
sparc64               randconfig-001-20250110    gcc-14.2.0
sparc64               randconfig-002-20250110    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20250110    clang-20
um                    randconfig-002-20250110    gcc-12
x86_64      buildonly-randconfig-001-20250110    gcc-12
x86_64      buildonly-randconfig-002-20250110    clang-19
x86_64      buildonly-randconfig-003-20250110    clang-19
x86_64      buildonly-randconfig-004-20250110    gcc-12
x86_64      buildonly-randconfig-005-20250110    clang-19
x86_64      buildonly-randconfig-006-20250110    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250110    gcc-14.2.0
xtensa                randconfig-002-20250110    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
