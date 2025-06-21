Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1214FC7115C
	for <intel-xe@archiver.kernel.org>; Sat, 21 Jun 2025 20:13:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF43610E16D;
	Sat, 21 Jun 2025 20:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UzdJaSUN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833A110E16D
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Jun 2025 20:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750536820; x=1782072820;
 h=date:from:to:cc:subject:message-id;
 bh=gid63UqeW1e6wUVLucXnviHFj+ncrD9H6sB/yBl3vQ8=;
 b=UzdJaSUNfPI5SOFQP18+wW3aYy0p2McIXW51R1zgLkiPx2ZypjWqpEnT
 CcpQb8vlpJ1aNHOHvXPNDNTCAYoZ4fG0YmiO/lC4wL4G4DRhZ5msNp14P
 mILLfFtPugmkd36nOOOhdYUEIDGUSyy0DRq3giWHHjceU+edcatCS+vyo
 DptBUv1Rs6y7Mm/Wqmy8yOqE90jWv3CsrjiuZVLhpbZBIn+eG3ZcgJtcv
 oRFzA3fBNiFXjhjj7/ZbQt+pTrHFJ+9TyD3KNdPLMEnI1MgOmPUIhMCrp
 nNlT7fZ+D/jFg5hkKjXQnSp6Q9EKUrtWiZjd3fP2kEp9TfXPsQsp9PGoq Q==;
X-CSE-ConnectionGUID: kjnuLdQCRryoGwIDcnU6dQ==
X-CSE-MsgGUID: xNR+LbXuSay9F1BeyHaIiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="64136444"
X-IronPort-AV: E=Sophos;i="6.16,254,1744095600"; d="scan'208";a="64136444"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2025 13:13:38 -0700
X-CSE-ConnectionGUID: 4JdAsxv1QcWNLD/ATvjX5g==
X-CSE-MsgGUID: 1IO8h6vKR9eJzm5CyWb38g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,254,1744095600"; d="scan'208";a="151417665"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 21 Jun 2025 13:13:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uT4ak-000MqY-2q;
 Sat, 21 Jun 2025 20:13:34 +0000
Date: Sun, 22 Jun 2025 04:13:10 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 3972872e459d812ab5e481a231a6066cf4f4d0f4
Message-ID: <202506220400.widz7foH-lkp@intel.com>
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
branch HEAD: 3972872e459d812ab5e481a231a6066cf4f4d0f4  drm/xe/ptl: Apply Wa_16026007364

elapsed time: 1445m

configs tested: 123
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250621    gcc-8.5.0
arc                   randconfig-002-20250621    gcc-10.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                            dove_defconfig    gcc-15.1.0
arm                       imx_v4_v5_defconfig    clang-21
arm                      integrator_defconfig    clang-21
arm                   randconfig-001-20250621    clang-21
arm                   randconfig-002-20250621    gcc-15.1.0
arm                   randconfig-003-20250621    clang-20
arm                   randconfig-004-20250621    gcc-8.5.0
arm                           sunxi_defconfig    gcc-15.1.0
arm                       versatile_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250621    clang-21
arm64                 randconfig-002-20250621    gcc-15.1.0
arm64                 randconfig-003-20250621    clang-17
arm64                 randconfig-004-20250621    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250621    gcc-15.1.0
csky                  randconfig-002-20250621    gcc-15.1.0
hexagon                          alldefconfig    clang-21
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250621    clang-21
hexagon               randconfig-002-20250621    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250621    clang-20
i386        buildonly-randconfig-002-20250621    gcc-12
i386        buildonly-randconfig-003-20250621    clang-20
i386        buildonly-randconfig-004-20250621    clang-20
i386        buildonly-randconfig-005-20250621    clang-20
i386        buildonly-randconfig-006-20250621    gcc-12
i386                                defconfig    clang-20
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250621    gcc-12.4.0
loongarch             randconfig-002-20250621    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                       m5475evb_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    clang-21
mips                           mtx1_defconfig    clang-21
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250621    gcc-9.3.0
nios2                 randconfig-002-20250621    gcc-12.4.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250621    gcc-10.5.0
parisc                randconfig-002-20250621    gcc-12.4.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                    amigaone_defconfig    gcc-15.1.0
powerpc                     ksi8560_defconfig    gcc-15.1.0
powerpc                     mpc5200_defconfig    clang-21
powerpc               randconfig-001-20250621    clang-17
powerpc               randconfig-002-20250621    clang-19
powerpc               randconfig-003-20250621    gcc-8.5.0
powerpc64             randconfig-001-20250621    gcc-11.5.0
powerpc64             randconfig-002-20250621    gcc-13.3.0
powerpc64             randconfig-003-20250621    gcc-11.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250621    clang-21
riscv                 randconfig-002-20250621    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250621    clang-21
s390                  randconfig-002-20250621    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                            hp6xx_defconfig    gcc-15.1.0
sh                    randconfig-001-20250621    gcc-15.1.0
sh                    randconfig-002-20250621    gcc-15.1.0
sh                           se7705_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250621    gcc-15.1.0
sparc                 randconfig-002-20250621    gcc-15.1.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250621    gcc-8.5.0
sparc64               randconfig-002-20250621    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250621    clang-21
um                    randconfig-002-20250621    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250621    gcc-12
x86_64      buildonly-randconfig-002-20250621    clang-20
x86_64      buildonly-randconfig-003-20250621    gcc-12
x86_64      buildonly-randconfig-004-20250621    gcc-12
x86_64      buildonly-randconfig-005-20250621    gcc-12
x86_64      buildonly-randconfig-006-20250621    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250621    gcc-12.4.0
xtensa                randconfig-002-20250621    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
