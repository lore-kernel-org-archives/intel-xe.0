Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E978F3D330
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 16:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C00C10EC49;
	Thu,  5 Mar 2026 16:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LHSoWZxm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D131210EC49
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 16:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772728104; x=1804264104;
 h=date:from:to:cc:subject:message-id;
 bh=20MyjVB+cjt26iu6ypXq9+FDJNQtEKKYEFIThSaQER0=;
 b=LHSoWZxmWiOUiPEhn+1Z3IwRIScdxH7zOlFx/btNcFWNu+dB6M7SOQkl
 pnBI0SGb2GMMSx4l9wFYYjWp9dMyi/qD+s9zde/r23Vlt3AAXSuYQ6sUl
 9Rwxdi1wtq22Ueaq29gcMPC//uSrjhYzU7Sa+5jE60rIGTTp6r11RMap5
 +pPkHv+uZT74DhZ7xax7ICM3ToIwZWyvp52ywm8aq4735y+bVVCy1WLmt
 Luc1yR+sTuo8Z0ygFNwQtApFyZI/YHlLIvNs+k3siroi7KYMmYacarrrz
 7W0bbct8MUfzVJKXhstd6F0KG4O2CmTP/IfkH84cCZ/pDsXQ9EkeMF9C6 Q==;
X-CSE-ConnectionGUID: X+I89HO4Tl62y7OlOy5Kzg==
X-CSE-MsgGUID: y5/FTRsmQxeeTIrxBQg2rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="96439209"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="96439209"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 08:28:22 -0800
X-CSE-ConnectionGUID: GDcLHmleRBqfIqrZrswMig==
X-CSE-MsgGUID: VpE9N71eT7WmNzqm7YPtVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="218681860"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 05 Mar 2026 08:28:21 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vyBYg-000000000v6-0rYW;
 Thu, 05 Mar 2026 16:28:18 +0000
Date: Fri, 06 Mar 2026 00:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 0cfe9c4838f1147713f6b5c02094cd4dc0c598fa
Message-ID: <202603060026.QExAaSar-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: 0cfe9c4838f1147713f6b5c02094cd4dc0c598fa  drm/xe: Fix memory leak in xe_vm_madvise_ioctl

elapsed time: 1554m

configs tested: 110
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260305    gcc-8.5.0
arc                   randconfig-002-20260305    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                   randconfig-001-20260305    clang-23
arm                   randconfig-002-20260305    clang-19
arm                   randconfig-003-20260305    clang-23
arm                   randconfig-004-20260305    gcc-10.5.0
arm64                             allnoconfig    gcc-15.2.0
arm64                 randconfig-001-20260305    gcc-9.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon               randconfig-001-20260305    clang-23
hexagon               randconfig-002-20260305    clang-23
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20260305    clang-20
i386        buildonly-randconfig-002-20260305    gcc-14
i386        buildonly-randconfig-003-20260305    gcc-14
i386        buildonly-randconfig-004-20260305    gcc-14
i386        buildonly-randconfig-005-20260305    gcc-14
i386        buildonly-randconfig-006-20260305    gcc-14
i386                  randconfig-001-20260305    clang-20
i386                  randconfig-002-20260305    gcc-14
i386                  randconfig-003-20260305    gcc-14
i386                  randconfig-004-20260305    clang-20
i386                  randconfig-005-20260305    gcc-14
i386                  randconfig-006-20260305    gcc-14
i386                  randconfig-007-20260305    clang-20
i386                  randconfig-011-20260305    clang-20
i386                  randconfig-012-20260305    clang-20
i386                  randconfig-013-20260305    clang-20
i386                  randconfig-014-20260305    clang-20
i386                  randconfig-015-20260305    clang-20
i386                  randconfig-016-20260305    clang-20
i386                  randconfig-017-20260305    gcc-14
loongarch                         allnoconfig    clang-23
loongarch             randconfig-001-20260305    gcc-15.2.0
loongarch             randconfig-002-20260305    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260305    gcc-8.5.0
nios2                 randconfig-002-20260305    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260305    gcc-9.5.0
parisc                randconfig-002-20260305    gcc-8.5.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc                   currituck_defconfig    clang-23
powerpc               randconfig-001-20260305    gcc-12.5.0
powerpc               randconfig-002-20260305    gcc-8.5.0
powerpc64             randconfig-001-20260305    clang-17
powerpc64             randconfig-002-20260305    gcc-10.5.0
riscv                             allnoconfig    gcc-15.2.0
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260305    gcc-15.2.0
riscv                 randconfig-002-20260305    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                  randconfig-001-20260305    clang-23
s390                  randconfig-002-20260305    clang-18
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                    randconfig-001-20260305    gcc-15.2.0
sh                    randconfig-002-20260305    gcc-12.5.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260305    gcc-8.5.0
sparc                 randconfig-002-20260305    gcc-12.5.0
sparc64               randconfig-001-20260305    clang-23
sparc64               randconfig-002-20260305    clang-20
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                    randconfig-001-20260305    clang-23
um                    randconfig-002-20260305    gcc-14
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20260305    gcc-14
x86_64      buildonly-randconfig-002-20260305    clang-20
x86_64      buildonly-randconfig-003-20260305    clang-20
x86_64      buildonly-randconfig-004-20260305    clang-20
x86_64      buildonly-randconfig-005-20260305    clang-20
x86_64      buildonly-randconfig-006-20260305    clang-20
x86_64                randconfig-001-20260305    clang-20
x86_64                randconfig-003-20260305    gcc-13
x86_64                randconfig-004-20260305    clang-20
x86_64                randconfig-012-20260305    gcc-14
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260305    gcc-8.5.0
xtensa                randconfig-002-20260305    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
