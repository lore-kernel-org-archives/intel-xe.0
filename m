Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC00C8303C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 23:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66CF10E0AC;
	Wed,  2 Jul 2025 23:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WCv1h2Xn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4320410E0AC
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 23:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751497473; x=1783033473;
 h=date:from:to:cc:subject:message-id;
 bh=viDJvyfka0WwLY1KUaSokF9m8Z6+wkttLhjz5N80iLo=;
 b=WCv1h2XnIBaD8ZGGauLiY4Y4g+Qd2Cv+YqQEJYWw3ogy0WDqSRSJi+AP
 hv6tZMFnldO6ziwKl0UyGpjwpFAyl1ZitG9y1d1oq/s/z6KZji9t621aC
 6nm7zIAD4KfFORMOIt9TK//IqUwiX9DO6RWe+U2uuhYt2tT89G1bnWEBw
 +HjhZXbdUHcO4vUHDnuwLNg9Ydfo/6co4zCuppybwdcvfmO5RXtZEqbfx
 eAy2MdV+vmj3b8Ul2kj42oVC+hqy2MM/pxYQJxDmAXm73bco/Eci2P3Qc
 De33x4eUmATQumUtXgvZ/H0Eq4ow1QVfKD7XoGoIKEyJpgwEyIEZW0ZQj Q==;
X-CSE-ConnectionGUID: 2DXMd+GlS6OpSvO0H0Avaw==
X-CSE-MsgGUID: PtYctQw1SLmqhFw8Oe4B5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="52927825"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="52927825"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:04:33 -0700
X-CSE-ConnectionGUID: RiYtQygJTsKm5ZtGToOh6Q==
X-CSE-MsgGUID: n5HqUdE/Tna29YVzb8y2cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="154348110"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 02 Jul 2025 16:04:32 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uX6VB-0001CV-0v;
 Wed, 02 Jul 2025 23:04:29 +0000
Date: Thu, 03 Jul 2025 07:04:20 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 aa18d5769fcafe645a3ba01a9a69dde4f8dc8cc3
Message-ID: <202507030708.WbCBG9kv-lkp@intel.com>
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
branch HEAD: aa18d5769fcafe645a3ba01a9a69dde4f8dc8cc3  drm/xe: Allow dropping kunit dependency as built-in

elapsed time: 1447m

configs tested: 125
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250702    gcc-10.5.0
arc                   randconfig-002-20250702    gcc-14.3.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                          gemini_defconfig    clang-20
arm                      integrator_defconfig    clang-21
arm                   randconfig-001-20250702    clang-17
arm                   randconfig-002-20250702    clang-19
arm                   randconfig-003-20250702    clang-21
arm                   randconfig-004-20250702    clang-17
arm                           u8500_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250702    clang-21
arm64                 randconfig-002-20250702    clang-21
arm64                 randconfig-003-20250702    clang-21
arm64                 randconfig-004-20250702    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250702    gcc-15.1.0
csky                  randconfig-002-20250702    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250702    clang-21
hexagon               randconfig-002-20250702    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250702    clang-20
i386        buildonly-randconfig-002-20250702    gcc-12
i386        buildonly-randconfig-003-20250702    clang-20
i386        buildonly-randconfig-004-20250702    clang-20
i386        buildonly-randconfig-005-20250702    gcc-12
i386        buildonly-randconfig-006-20250702    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250702    gcc-15.1.0
loongarch             randconfig-002-20250702    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        stmark2_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip32_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250702    gcc-14.2.0
nios2                 randconfig-002-20250702    gcc-14.2.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250702    gcc-12.4.0
parisc                randconfig-002-20250702    gcc-9.3.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      chrp32_defconfig    clang-19
powerpc                     mpc512x_defconfig    clang-21
powerpc               mpc834x_itxgp_defconfig    clang-21
powerpc                    mvme5100_defconfig    gcc-15.1.0
powerpc                      pmac32_defconfig    clang-21
powerpc               randconfig-001-20250702    gcc-11.5.0
powerpc               randconfig-002-20250702    gcc-11.5.0
powerpc               randconfig-003-20250702    clang-21
powerpc64             randconfig-001-20250702    clang-21
powerpc64             randconfig-002-20250702    clang-19
powerpc64             randconfig-003-20250702    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250702    clang-21
riscv                 randconfig-002-20250702    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250702    gcc-10.5.0
s390                  randconfig-002-20250702    clang-21
sh                               alldefconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                             espt_defconfig    gcc-15.1.0
sh                    randconfig-001-20250702    gcc-15.1.0
sh                    randconfig-002-20250702    gcc-15.1.0
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250702    gcc-12.4.0
sparc                 randconfig-002-20250702    gcc-15.1.0
sparc64               randconfig-001-20250702    gcc-9.3.0
sparc64               randconfig-002-20250702    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250702    clang-21
um                    randconfig-002-20250702    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250702    gcc-12
x86_64      buildonly-randconfig-002-20250702    gcc-11
x86_64      buildonly-randconfig-003-20250702    clang-20
x86_64      buildonly-randconfig-004-20250702    clang-20
x86_64      buildonly-randconfig-005-20250702    clang-20
x86_64      buildonly-randconfig-006-20250702    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                       common_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250702    gcc-14.3.0
xtensa                randconfig-002-20250702    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
