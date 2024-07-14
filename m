Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27DAC3DA45
	for <intel-xe@archiver.kernel.org>; Sun, 14 Jul 2024 00:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8400610E05E;
	Sun, 14 Jul 2024 00:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JF6/XLW5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF2F10E05E
 for <intel-xe@lists.freedesktop.org>; Sun, 14 Jul 2024 00:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720917536; x=1752453536;
 h=date:from:to:cc:subject:message-id;
 bh=liueYVRofPhFeJpX4lxCK55ui6arDxFjO5hWuzFioPQ=;
 b=JF6/XLW5yxlzpfVSJjWVEoeWtC4cqFDBEHu9rQPF592SWILgkW8Z6/nv
 qNWGA0z/Ua72ZNsfyepNE4/DG+Y0g19vihrjEbRic4pu3hayW4rHfHemV
 ySbpNcUiKI+ohJMoeVyJEulr7V1NC5DpMU3ttG8UVIQE7p8C82SMadNvM
 +VUDvGOnM+3gxjlbN2sls6xGgI8xqZWSRpn9Z2ZLserlwpNnNDQQRPJy2
 vYYBR78ZkxhhDIBDCSzC9XCBjIVh9JIk6sOC2lTAVXUjBiGiHrI57+RoP
 qJOtMTrEoWzH2sJ5bAHrvOSg1DN7OG1jPdCTj170uZUwuEWvF9ekgbrbN Q==;
X-CSE-ConnectionGUID: mz3o3v7gRB6mWtTneThPXg==
X-CSE-MsgGUID: oUWjnpQdTvObYYVglHhUfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="29723007"
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; d="scan'208";a="29723007"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2024 17:38:55 -0700
X-CSE-ConnectionGUID: Jrja46G1Rj+pwtEIzekQ4g==
X-CSE-MsgGUID: DQcu2q0ZSk+RA6XYyjSEMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; d="scan'208";a="49141674"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 13 Jul 2024 17:38:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sSnGM-000ct4-1w;
 Sun, 14 Jul 2024 00:38:50 +0000
Date: Sun, 14 Jul 2024 08:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 86c5b70a9c0c3f05f7002ef8b789460c96b54e27
Message-ID: <202407140859.yJlwHNkS-lkp@intel.com>
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
branch HEAD: 86c5b70a9c0c3f05f7002ef8b789460c96b54e27  drm/xe/xe2: Add Wa_15015404425

elapsed time: 1425m

configs tested: 145
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240714   gcc-13.2.0
arc                   randconfig-002-20240714   gcc-13.2.0
arc                    vdk_hs38_smp_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-14.1.0
arm                         bcm2835_defconfig   clang-19
arm                         lpc32xx_defconfig   clang-19
arm                   randconfig-001-20240714   clang-19
arm                   randconfig-002-20240714   clang-15
arm                   randconfig-003-20240714   clang-17
arm                   randconfig-004-20240714   clang-15
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240714   clang-15
arm64                 randconfig-002-20240714   clang-19
arm64                 randconfig-003-20240714   clang-19
arm64                 randconfig-004-20240714   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240714   gcc-14.1.0
csky                  randconfig-002-20240714   gcc-14.1.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240714   clang-19
hexagon               randconfig-002-20240714   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240713   clang-18
i386         buildonly-randconfig-002-20240713   clang-18
i386         buildonly-randconfig-003-20240713   gcc-8
i386         buildonly-randconfig-004-20240713   clang-18
i386         buildonly-randconfig-005-20240713   gcc-13
i386         buildonly-randconfig-006-20240713   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240713   gcc-10
i386                  randconfig-002-20240713   gcc-13
i386                  randconfig-003-20240713   gcc-13
i386                  randconfig-004-20240713   clang-18
i386                  randconfig-005-20240713   gcc-10
i386                  randconfig-006-20240713   gcc-12
i386                  randconfig-011-20240713   clang-18
i386                  randconfig-012-20240713   gcc-7
i386                  randconfig-013-20240713   gcc-13
i386                  randconfig-014-20240713   gcc-13
i386                  randconfig-015-20240713   gcc-11
i386                  randconfig-016-20240713   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240714   gcc-14.1.0
loongarch             randconfig-002-20240714   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         apollo_defconfig   gcc-14.1.0
m68k                       bvme6000_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                           jazz_defconfig   clang-19
mips                        maltaup_defconfig   clang-19
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240714   gcc-14.1.0
nios2                 randconfig-002-20240714   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240714   gcc-14.1.0
parisc                randconfig-002-20240714   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                   currituck_defconfig   clang-19
powerpc                       maple_defconfig   clang-19
powerpc               randconfig-001-20240714   clang-19
powerpc               randconfig-002-20240714   clang-19
powerpc               randconfig-003-20240714   gcc-14.1.0
powerpc64             randconfig-001-20240714   gcc-14.1.0
powerpc64             randconfig-002-20240714   gcc-14.1.0
powerpc64             randconfig-003-20240714   gcc-14.1.0
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                               defconfig   clang-19
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-19
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                        dreamcast_defconfig   gcc-14.1.0
sh                          lboxre2_defconfig   gcc-14.1.0
sh                            migor_defconfig   gcc-14.1.0
sh                           sh2007_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                           x86_64_defconfig   clang-15
x86_64                           alldefconfig   gcc-13
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240713   clang-18
x86_64       buildonly-randconfig-002-20240713   clang-18
x86_64       buildonly-randconfig-003-20240713   gcc-13
x86_64       buildonly-randconfig-004-20240713   clang-18
x86_64       buildonly-randconfig-005-20240713   gcc-8
x86_64       buildonly-randconfig-006-20240713   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240713   clang-18
x86_64                randconfig-002-20240713   clang-18
x86_64                randconfig-003-20240713   clang-18
x86_64                randconfig-004-20240713   gcc-13
x86_64                randconfig-005-20240713   clang-18
x86_64                randconfig-006-20240713   clang-18
x86_64                randconfig-011-20240713   clang-18
x86_64                randconfig-012-20240713   clang-18
x86_64                randconfig-013-20240713   gcc-13
x86_64                randconfig-014-20240713   clang-18
x86_64                randconfig-015-20240713   gcc-13
x86_64                randconfig-016-20240713   gcc-13
x86_64                randconfig-071-20240713   gcc-8
x86_64                randconfig-072-20240713   gcc-8
x86_64                randconfig-073-20240713   clang-18
x86_64                randconfig-074-20240713   clang-18
x86_64                randconfig-075-20240713   gcc-13
x86_64                randconfig-076-20240713   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
