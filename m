Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2255FFC6169
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 17:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15D710ED54;
	Fri, 13 Sep 2024 17:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/T1YsWG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1556310ED54
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 17:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726248311; x=1757784311;
 h=date:from:to:cc:subject:message-id;
 bh=pWXIEZuczVcq9Usp8lLhJg4vPiHuSGcjdm7nVOhGVKo=;
 b=L/T1YsWGZ0ZAvCpTEHGvmST+OTC/AUfTgl7sGpaeMEbbCGLdtklIEIoY
 Ku1mQaX0RXEcZNJwjUwSpbM7jYn09XxGGB+UJdfXwQQXYqbiU4Zqzvd1S
 s2vTLrcalG6or/pGYWaXnjgzdPUpagRrAojJvl7FWA4Uzt1pUdNUdKMgD
 A1VKTnudFc3IC1mpzOgD0q+pHousLb+dKgeg+gdDpk3XloJxYkd8NH25y
 3Ux6eHIQ1pN0KZW7z6EvOL9MT/gntZCTv7iakcpXKrUK8rMnqg2yrNE0+
 jjogfj7yFY7agRI5MYB4TGbOYcl+DwOlqw16HEWc3g1EJftiNYBQXIAvz A==;
X-CSE-ConnectionGUID: qa7NpibdStCreI4rK3SqLg==
X-CSE-MsgGUID: M5ymf9uGSBORvkUs2ISuCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="47672531"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="47672531"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 10:25:10 -0700
X-CSE-ConnectionGUID: 2BlRdLVaTJ+6RH6Tkvz2RA==
X-CSE-MsgGUID: 3s2FKRHAQjOOs/zTE+DYJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="68458039"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 13 Sep 2024 10:25:09 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1spA2c-0006jw-13;
 Fri, 13 Sep 2024 17:25:06 +0000
Date: Sat, 14 Sep 2024 01:24:47 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next-fixes] BUILD SUCCESS
 f1a4dceeb2bd4b4478e4f0c77dac55569d153fb3
Message-ID: <202409140140.NO6FWC40-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next-fixes
branch HEAD: f1a4dceeb2bd4b4478e4f0c77dac55569d153fb3  drm/xe: Fix missing conversion to xe_display_pm_runtime_resume

elapsed time: 1039m

configs tested: 81
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
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
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
