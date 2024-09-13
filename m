Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06DEFA372A
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 08:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6905610ECB0;
	Fri, 13 Sep 2024 08:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BzS8i5wV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E1510ECB0
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 08:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726214922; x=1757750922;
 h=date:from:to:cc:subject:message-id;
 bh=sQWvLtND5YG4QvYVMjob+PWJ9m5Xmqx/tMUkSMYyP9U=;
 b=BzS8i5wVl7lAFAmj/soAzcqBKX3u/7evDAL8JC52HCaj/D47+z6DAQug
 Jsl1D1jR2eyEDB0lePaQpKmWjyhAf91DVdfkZ9KBvkVQlmFMG0Mp+jqmh
 hg4spNz0P8nAEvaRlrXPv90nDLAsXAWP4Of+D9+LJhdBCuF2TrXmVrHdY
 RJ6SB25pLn99nvHtN1c5suRV3OXqptOFEDxVMaqKAP4PYSDdg2elb15MA
 5PGFYaYPIi539yalr4kHowA8A4E7fl2X2+PT7ypqPXPStmeRQN3+1M1dU
 VBLMpOWnOk4J1ww6jszeEObBPoTtj28J3xXXvkcUgtF+K/kx0+qwBX8E5 g==;
X-CSE-ConnectionGUID: WTdbEOSTRAuaL02F+7S5VA==
X-CSE-MsgGUID: ZZIDuwKfRBipTyBSYgh6Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28884533"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="28884533"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 01:08:42 -0700
X-CSE-ConnectionGUID: 9iaGwtciSmmcfQPKti3K8Q==
X-CSE-MsgGUID: otUg8m9fTUS5BuzTPnSQ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="72333453"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 13 Sep 2024 01:08:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sp1M7-0006BX-18;
 Fri, 13 Sep 2024 08:08:39 +0000
Date: Fri, 13 Sep 2024 16:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 94c4aa266111262c96c98f822d1bccc494786fee
Message-ID: <202409131658.sBAbLRUd-lkp@intel.com>
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
branch HEAD: 94c4aa266111262c96c98f822d1bccc494786fee  drm/xe/client: add missing bo locking in show_meminfo()

elapsed time: 1030m

configs tested: 128
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20240913    gcc-13.2.0
arc                   randconfig-002-20240913    gcc-13.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                   randconfig-001-20240913    gcc-13.2.0
arm                   randconfig-002-20240913    gcc-13.2.0
arm                   randconfig-003-20240913    gcc-13.2.0
arm                   randconfig-004-20240913    gcc-13.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20240913    gcc-13.2.0
arm64                 randconfig-002-20240913    gcc-13.2.0
arm64                 randconfig-003-20240913    gcc-13.2.0
arm64                 randconfig-004-20240913    gcc-13.2.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20240913    gcc-13.2.0
csky                  randconfig-002-20240913    gcc-13.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20240913    gcc-13.2.0
hexagon               randconfig-002-20240913    gcc-13.2.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20240913    clang-18
i386        buildonly-randconfig-002-20240913    clang-18
i386        buildonly-randconfig-003-20240913    clang-18
i386        buildonly-randconfig-004-20240913    clang-18
i386        buildonly-randconfig-005-20240913    clang-18
i386        buildonly-randconfig-006-20240913    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240913    clang-18
i386                  randconfig-002-20240913    clang-18
i386                  randconfig-003-20240913    clang-18
i386                  randconfig-004-20240913    clang-18
i386                  randconfig-005-20240913    clang-18
i386                  randconfig-006-20240913    clang-18
i386                  randconfig-011-20240913    clang-18
i386                  randconfig-012-20240913    clang-18
i386                  randconfig-013-20240913    clang-18
i386                  randconfig-014-20240913    clang-18
i386                  randconfig-015-20240913    clang-18
i386                  randconfig-016-20240913    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20240913    gcc-13.2.0
loongarch             randconfig-002-20240913    gcc-13.2.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20240913    gcc-13.2.0
nios2                 randconfig-002-20240913    gcc-13.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20240913    gcc-13.2.0
parisc                randconfig-002-20240913    gcc-13.2.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc               randconfig-001-20240913    gcc-13.2.0
powerpc64             randconfig-001-20240913    gcc-13.2.0
powerpc64             randconfig-002-20240913    gcc-13.2.0
powerpc64             randconfig-003-20240913    gcc-13.2.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20240913    gcc-13.2.0
riscv                 randconfig-002-20240913    gcc-13.2.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20240913    gcc-13.2.0
s390                  randconfig-002-20240913    gcc-13.2.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20240913    gcc-13.2.0
sh                    randconfig-002-20240913    gcc-13.2.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20240913    gcc-13.2.0
sparc64               randconfig-002-20240913    gcc-13.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20240913    gcc-13.2.0
um                    randconfig-002-20240913    gcc-13.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20240913    gcc-13.2.0
xtensa                randconfig-002-20240913    gcc-13.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
