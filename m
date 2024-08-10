Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA54C3DA4A
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 17:06:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A624D10E13C;
	Sat, 10 Aug 2024 17:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gqso2GGv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E731510E13C
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Aug 2024 17:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723309615; x=1754845615;
 h=date:from:to:cc:subject:message-id;
 bh=f3EW3US5P5WA49j/NiTZE29EQxXjUBrEImcQnZPmC0Q=;
 b=Gqso2GGv3BSUp3J9bkhFwz4y9IobeEoKD/uNuQM593lnQjJ7UktD1Wac
 vTAV5I1Ro65uDYTFZc6yBXGiBvMpigaCn9w5zFeCNvOdBP+kCCOtdgllp
 z0rhDfYFgJaMmX0Z8qMbIlp4A91MGCQj3FnVG9NOoZNF+t91weLin76AB
 WKgWnGDnb3xhNx3Zlfi/CG+vK5be1Ka3pdP5xKFufhQltDo7M/NiWxP49
 uC3cACer2NU8rK41U4GA0lyPkC6ITUcXIQlUN6eti5WVekHJiM63LHfnh
 OCQpyZRokcZMv6+kavUJFeKhoMi2/ibWNLt8q7O7TpOc2HSTbz4Yay+Ih Q==;
X-CSE-ConnectionGUID: h90AidYgSF6cHq5YEiJlcA==
X-CSE-MsgGUID: BBk1KOU0TrCtXxF6pkx2xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="25264058"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; d="scan'208";a="25264058"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2024 10:06:54 -0700
X-CSE-ConnectionGUID: uQAQyy0gT0y5aPT/Q4wA1A==
X-CSE-MsgGUID: YqAImJjBQTufG8sseuYaDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; d="scan'208";a="58561216"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
 by orviesa008.jf.intel.com with ESMTP; 10 Aug 2024 10:06:52 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1scpYH-000A87-1D;
 Sat, 10 Aug 2024 17:06:49 +0000
Date: Sun, 11 Aug 2024 01:06:28 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 fdaf4e491ad013f8b07d8aaaff3cc90b04d3fa18
Message-ID: <202408110126.g8Z2BaMH-lkp@intel.com>
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
branch HEAD: fdaf4e491ad013f8b07d8aaaff3cc90b04d3fa18  drm/xe: Hold a PM ref when GT TLB invalidations are inflight

elapsed time: 1453m

configs tested: 136
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240810   gcc-13.2.0
arc                   randconfig-002-20240810   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                   randconfig-001-20240810   gcc-14.1.0
arm                   randconfig-002-20240810   clang-20
arm                   randconfig-003-20240810   gcc-14.1.0
arm                   randconfig-004-20240810   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240810   gcc-14.1.0
arm64                 randconfig-002-20240810   clang-20
arm64                 randconfig-003-20240810   clang-20
arm64                 randconfig-004-20240810   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240810   gcc-14.1.0
csky                  randconfig-002-20240810   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240810   clang-20
hexagon               randconfig-002-20240810   clang-14
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240810   clang-18
i386         buildonly-randconfig-002-20240810   clang-18
i386         buildonly-randconfig-003-20240810   clang-18
i386         buildonly-randconfig-004-20240810   clang-18
i386         buildonly-randconfig-005-20240810   gcc-12
i386         buildonly-randconfig-006-20240810   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240810   clang-18
i386                  randconfig-002-20240810   gcc-12
i386                  randconfig-003-20240810   clang-18
i386                  randconfig-004-20240810   gcc-12
i386                  randconfig-005-20240810   gcc-12
i386                  randconfig-006-20240810   clang-18
i386                  randconfig-011-20240810   gcc-12
i386                  randconfig-012-20240810   gcc-12
i386                  randconfig-013-20240810   clang-18
i386                  randconfig-014-20240810   gcc-12
i386                  randconfig-015-20240810   gcc-12
i386                  randconfig-016-20240810   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240810   gcc-14.1.0
loongarch             randconfig-002-20240810   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240810   gcc-14.1.0
nios2                 randconfig-002-20240810   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240810   gcc-14.1.0
parisc                randconfig-002-20240810   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc64             randconfig-001-20240810   gcc-14.1.0
powerpc64             randconfig-002-20240810   clang-20
powerpc64             randconfig-003-20240810   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                 randconfig-001-20240810   clang-20
riscv                 randconfig-002-20240810   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240810   gcc-14.1.0
s390                  randconfig-002-20240810   clang-15
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240810   gcc-14.1.0
sh                    randconfig-002-20240810   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240810   gcc-14.1.0
sparc64               randconfig-002-20240810   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240810   gcc-12
um                    randconfig-002-20240810   gcc-12
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240810   gcc-12
x86_64       buildonly-randconfig-002-20240810   clang-18
x86_64       buildonly-randconfig-003-20240810   clang-18
x86_64       buildonly-randconfig-004-20240810   clang-18
x86_64       buildonly-randconfig-005-20240810   clang-18
x86_64       buildonly-randconfig-006-20240810   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240810   clang-18
x86_64                randconfig-002-20240810   clang-18
x86_64                randconfig-003-20240810   gcc-12
x86_64                randconfig-004-20240810   clang-18
x86_64                randconfig-005-20240810   clang-18
x86_64                randconfig-006-20240810   gcc-12
x86_64                randconfig-011-20240810   clang-18
x86_64                randconfig-012-20240810   gcc-12
x86_64                randconfig-013-20240810   clang-18
x86_64                randconfig-014-20240810   clang-18
x86_64                randconfig-015-20240810   clang-18
x86_64                randconfig-016-20240810   clang-18
x86_64                randconfig-071-20240810   clang-18
x86_64                randconfig-072-20240810   gcc-12
x86_64                randconfig-073-20240810   clang-18
x86_64                randconfig-074-20240810   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240810   gcc-14.1.0
xtensa                randconfig-002-20240810   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
