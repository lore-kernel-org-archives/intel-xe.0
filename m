Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F28C87FCB
	for <intel-xe@archiver.kernel.org>; Sat,  9 Aug 2025 08:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2A210E27B;
	Sat,  9 Aug 2025 08:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLTxqAi9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07D910E27B
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Aug 2025 08:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754726858; x=1786262858;
 h=date:from:to:cc:subject:message-id;
 bh=xbTq7/uypZ+RnsfMwQS2Ni7SD1VtyqMjZ8GwzkQdcao=;
 b=GLTxqAi9gtEnIJM5s28iPVDJjtKfqUrburLYzXpPxIClVqEHriIYqkvy
 YY12pXrJn96483ftrOgfX5FfqanTrQomwSowfJ0VyTg9hx20RPeHFPa/X
 yhrqjug3yRyJ4SrUZsZZKUC0FdOn7pmyVI9JpqYs6pZwB+RNzbWdt/hso
 dyo8IAlDoEQ1c4kkEzqS1cpN3MxYqc04bI6Jn3aG5h14R6hqcLBAg94Qw
 3GgeNen72SJT6qWpXV8+lGNuFyFtSsO/B+sz9K5deawW2oRyEeZaVxJZA
 NB76u5wg8D1FBSqP+NNwpYlDVIEP2bx2NuI3sO2Tsm2BBqbmDNEbCmfha A==;
X-CSE-ConnectionGUID: YU/T5wWZQHS97ySsGcyScA==
X-CSE-MsgGUID: SYMc+9CaTGKDnkcuUkf6ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="57024460"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="57024460"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2025 01:07:38 -0700
X-CSE-ConnectionGUID: RSkp5DQURSq7RCs0RaaVGA==
X-CSE-MsgGUID: dhHRxtcOQdSxRNBJzvuryg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="196479699"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by orviesa002.jf.intel.com with ESMTP; 09 Aug 2025 01:07:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ukec2-0004gA-0S;
 Sat, 09 Aug 2025 08:07:34 +0000
Date: Sat, 09 Aug 2025 16:07:12 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 9f8aa0bcd1f35baefe083adfa26bc6f9f68f652b
Message-ID: <202508091606.I2ICCbE2-lkp@intel.com>
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
branch HEAD: 9f8aa0bcd1f35baefe083adfa26bc6f9f68f652b  drm/xe/vf: Refactor CCS save/restore to use default migration context

elapsed time: 787m

configs tested: 105
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250809    gcc-13.4.0
arc                   randconfig-002-20250809    gcc-14.3.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g4_defconfig    clang-22
arm                       netwinder_defconfig    gcc-15.1.0
arm                   randconfig-001-20250809    gcc-10.5.0
arm                   randconfig-002-20250809    clang-20
arm                   randconfig-003-20250809    gcc-8.5.0
arm                   randconfig-004-20250809    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250809    gcc-8.5.0
arm64                 randconfig-002-20250809    clang-22
arm64                 randconfig-003-20250809    clang-22
arm64                 randconfig-004-20250809    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250809    gcc-9.5.0
csky                  randconfig-002-20250809    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250809    clang-22
hexagon               randconfig-002-20250809    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250809    gcc-12
i386        buildonly-randconfig-002-20250809    clang-20
i386        buildonly-randconfig-003-20250809    gcc-12
i386        buildonly-randconfig-004-20250809    clang-20
i386        buildonly-randconfig-005-20250809    clang-20
i386        buildonly-randconfig-006-20250809    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250809    gcc-15.1.0
loongarch             randconfig-002-20250809    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        maltaup_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20250809    gcc-11.5.0
nios2                 randconfig-002-20250809    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20250809    gcc-8.5.0
parisc                randconfig-002-20250809    gcc-14.3.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                    gamecube_defconfig    clang-22
powerpc               randconfig-001-20250809    gcc-10.5.0
powerpc               randconfig-002-20250809    clang-22
powerpc               randconfig-003-20250809    gcc-12.5.0
powerpc64             randconfig-001-20250809    gcc-10.5.0
powerpc64             randconfig-002-20250809    clang-22
powerpc64             randconfig-003-20250809    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250809    clang-22
riscv                 randconfig-002-20250809    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250809    clang-22
s390                  randconfig-002-20250809    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250809    gcc-10.5.0
sh                    randconfig-002-20250809    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250809    gcc-8.5.0
sparc                 randconfig-002-20250809    gcc-15.1.0
sparc64               randconfig-001-20250809    gcc-8.5.0
sparc64               randconfig-002-20250809    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250809    clang-22
um                    randconfig-002-20250809    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250809    gcc-8.5.0
xtensa                randconfig-002-20250809    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
