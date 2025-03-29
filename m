Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACB5C36008
	for <intel-xe@archiver.kernel.org>; Sat, 29 Mar 2025 20:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D1210E2D0;
	Sat, 29 Mar 2025 20:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BdRYUtnC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFAB10E2D0
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Mar 2025 20:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743279997; x=1774815997;
 h=date:from:to:cc:subject:message-id;
 bh=n6wpGAbEkTE6PXeRGE0Elgu/32vxSXo+s8H87Kjidi4=;
 b=BdRYUtnCdbPxmyOgYNGd3ppcy4xVNF1Mv0vX+OKrwG4tmR39oSnzWH4v
 /btSktn6t/xpLWob4e2GHckcbXj2r8vheIzThIe4KX3GVqaLKcrOnbscN
 PZxUIlcPJAYoTFMw/mYJvaCRIuCpu1Zzhc4rSL+RAfLNp34xH9ISKWPVh
 OWSoisWp1mdVV9gXIr0o3bJXChXQ1YEYHV3N2hs1m99TUMbUU02+lQOm0
 E1veQ8UjGewEg8aWsxn0eC1ZWXvvjSwRPnk2zlEJD4IzaO3gethSnMSUD
 T6q//r7H5JKWH4N4vb+U1YDclWmAV3oFI9shyly9msdjeEupiip61ZGkq w==;
X-CSE-ConnectionGUID: 5s4CONw8SUKBKe/cwfzG8g==
X-CSE-MsgGUID: mBesxU61QmW5qVHlvj1MuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="48397073"
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; d="scan'208";a="48397073"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2025 13:26:36 -0700
X-CSE-ConnectionGUID: rtedcsEBRAWbHhUTu6tPng==
X-CSE-MsgGUID: KvLWxDCvQd6LKyo+AwoEdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; d="scan'208";a="125976721"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
 by fmviesa008.fm.intel.com with ESMTP; 29 Mar 2025 13:26:35 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tyclF-0008LM-0y;
 Sat, 29 Mar 2025 20:26:33 +0000
Date: Sun, 30 Mar 2025 04:26:21 +0800
From: kernel test robot <lkp@intel.com>
To: John Harrison <John.C.Harrison@Intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 ce22fccd0773834a0b27900395e7b4a329041b6b
Message-ID: <202503300411.EwLYJ2Dq-lkp@intel.com>
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
branch HEAD: ce22fccd0773834a0b27900395e7b4a329041b6b  drm/xe/guc: Re-word message about ADS size changes

elapsed time: 1446m

configs tested: 131
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                            hsdk_defconfig    gcc-14.2.0
arc                   randconfig-001-20250329    gcc-14.2.0
arc                   randconfig-002-20250329    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   milbeaut_m10v_defconfig    clang-19
arm                            mmp2_defconfig    gcc-14.2.0
arm                            mps2_defconfig    clang-21
arm                        neponset_defconfig    gcc-14.2.0
arm                   randconfig-001-20250329    gcc-9.3.0
arm                   randconfig-002-20250329    clang-17
arm                   randconfig-003-20250329    clang-21
arm                   randconfig-004-20250329    clang-21
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250329    gcc-7.5.0
arm64                 randconfig-002-20250329    gcc-9.5.0
arm64                 randconfig-003-20250329    gcc-5.5.0
arm64                 randconfig-004-20250329    gcc-5.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250329    gcc-11.5.0
csky                  randconfig-002-20250329    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250329    clang-21
hexagon               randconfig-002-20250329    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250329    gcc-12
i386        buildonly-randconfig-002-20250329    gcc-12
i386        buildonly-randconfig-003-20250329    clang-20
i386        buildonly-randconfig-004-20250329    gcc-11
i386        buildonly-randconfig-005-20250329    gcc-12
i386        buildonly-randconfig-006-20250329    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20250329    gcc-14.2.0
loongarch             randconfig-002-20250329    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-21
mips                        vocore2_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250329    gcc-7.5.0
nios2                 randconfig-002-20250329    gcc-7.5.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250329    gcc-6.5.0
parisc                randconfig-002-20250329    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250329    gcc-5.5.0
powerpc               randconfig-002-20250329    gcc-5.5.0
powerpc               randconfig-003-20250329    gcc-9.3.0
powerpc                     sequoia_defconfig    clang-17
powerpc                     tqm8541_defconfig    clang-21
powerpc64             randconfig-001-20250329    gcc-9.3.0
powerpc64             randconfig-002-20250329    gcc-9.3.0
powerpc64             randconfig-003-20250329    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250329    gcc-14.2.0
riscv                 randconfig-002-20250329    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250329    gcc-8.5.0
s390                  randconfig-002-20250329    gcc-6.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                    randconfig-001-20250329    gcc-5.5.0
sh                    randconfig-002-20250329    gcc-11.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250329    gcc-8.5.0
sparc                 randconfig-002-20250329    gcc-8.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250329    gcc-6.5.0
sparc64               randconfig-002-20250329    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250329    gcc-12
um                    randconfig-002-20250329    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250329    clang-20
x86_64      buildonly-randconfig-002-20250329    gcc-12
x86_64      buildonly-randconfig-003-20250329    gcc-12
x86_64      buildonly-randconfig-004-20250329    clang-20
x86_64      buildonly-randconfig-005-20250329    clang-20
x86_64      buildonly-randconfig-006-20250329    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250329    gcc-10.5.0
xtensa                randconfig-002-20250329    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
