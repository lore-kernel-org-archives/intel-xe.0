Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9247BCF9C6B
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 12:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5062C10E2B1;
	Tue, 24 Sep 2024 12:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fCtUN035";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255C510E2B1
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 12:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727181859; x=1758717859;
 h=date:from:to:cc:subject:message-id;
 bh=WGcMczXTQFShw26DYQLgc98vlDMCuG+BF2rdyrxQP44=;
 b=fCtUN0352PAqeQpG8RNuXAgnPR2VeWLkFJEE9vNUgvQmnOau6W+g8+38
 XRPTNxw6QWto5fzGIuU5+zPTuZjHHvN8PrpIicr9ANy96l0JRa9xIh6gW
 V9RSpT/Cil5OSisK/xRCYGeFMcg5HqBoqUuMfyU+mGIyPcHQ/qxzOgjWw
 jVW2LiHF39i8MuLcUesVkvzHNTKwVs3sOIKQALNzSIPrIkCBsKYRmCHk7
 2WFTgkyLxAojqMsxEHekfMDda65IwEI0aMj0MI2/RVOOJ0moo1hsFKIC4
 MH8tdBUMifD8X7T2xjcizZGYhPNbjnmG25QrQZe9E7bzHjbOEHsCMVeHk Q==;
X-CSE-ConnectionGUID: LRzTFuCjTK6p3xitVF8vuw==
X-CSE-MsgGUID: pLDYlrbXS9y/YmM0uKRLDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26318201"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="26318201"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 05:44:18 -0700
X-CSE-ConnectionGUID: z6KIKlXCRxipNiT6EjDHeg==
X-CSE-MsgGUID: UgVLpHYbQHqTpkUyigWzqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="102223752"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 24 Sep 2024 05:44:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1st4tr-000INI-2E;
 Tue, 24 Sep 2024 12:44:15 +0000
Date: Tue, 24 Sep 2024 20:44:08 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 876253165f3eaaacacb8c8bed16a9df4b6081479
Message-ID: <202409242003.xzknvori-lkp@intel.com>
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
branch HEAD: 876253165f3eaaacacb8c8bed16a9df4b6081479  drm/xe/xe2: Add performance tuning for L3 cache flushing

elapsed time: 1080m

configs tested: 124
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                            allyesconfig    gcc-13.3.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                          axs101_defconfig    gcc-13.2.0
arc                   randconfig-001-20240924    gcc-13.2.0
arc                   randconfig-002-20240924    gcc-13.2.0
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                       aspeed_g4_defconfig    clang-20
arm                       imx_v6_v7_defconfig    clang-20
arm                          ixp4xx_defconfig    gcc-14.1.0
arm                        keystone_defconfig    gcc-14.1.0
arm                          pxa168_defconfig    clang-20
arm                   randconfig-001-20240924    clang-20
arm                   randconfig-002-20240924    gcc-14.1.0
arm                   randconfig-003-20240924    gcc-14.1.0
arm                   randconfig-004-20240924    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20240924    gcc-14.1.0
arm64                 randconfig-002-20240924    gcc-14.1.0
arm64                 randconfig-003-20240924    gcc-14.1.0
arm64                 randconfig-004-20240924    clang-14
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20240924    gcc-14.1.0
csky                  randconfig-002-20240924    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20240924    clang-20
hexagon               randconfig-002-20240924    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240924    clang-18
i386        buildonly-randconfig-002-20240924    gcc-12
i386        buildonly-randconfig-003-20240924    clang-18
i386        buildonly-randconfig-004-20240924    gcc-12
i386        buildonly-randconfig-005-20240924    gcc-12
i386        buildonly-randconfig-006-20240924    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240924    gcc-12
i386                  randconfig-002-20240924    gcc-12
i386                  randconfig-003-20240924    clang-18
i386                  randconfig-004-20240924    gcc-12
i386                  randconfig-005-20240924    gcc-12
i386                  randconfig-006-20240924    clang-18
i386                  randconfig-011-20240924    clang-18
i386                  randconfig-012-20240924    clang-18
i386                  randconfig-013-20240924    clang-18
i386                  randconfig-014-20240924    clang-18
i386                  randconfig-015-20240924    clang-18
i386                  randconfig-016-20240924    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20240924    gcc-14.1.0
loongarch             randconfig-002-20240924    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20240924    gcc-14.1.0
nios2                 randconfig-002-20240924    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-14.1.0
parisc                randconfig-001-20240924    gcc-14.1.0
parisc                randconfig-002-20240924    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc64             randconfig-001-20240924    gcc-14.1.0
powerpc64             randconfig-002-20240924    gcc-14.1.0
powerpc64             randconfig-003-20240924    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-20
riscv                 randconfig-001-20240924    gcc-14.1.0
riscv                 randconfig-002-20240924    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    clang-20
s390                  randconfig-001-20240924    clang-20
s390                  randconfig-002-20240924    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-14.1.0
sh                    randconfig-001-20240924    gcc-14.1.0
sh                    randconfig-002-20240924    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-14.1.0
sparc64               randconfig-001-20240924    gcc-14.1.0
sparc64               randconfig-002-20240924    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20240924    gcc-12
um                    randconfig-002-20240924    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20240924    gcc-14.1.0
xtensa                randconfig-002-20240924    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
