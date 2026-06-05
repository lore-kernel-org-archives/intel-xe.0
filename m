Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED84ACD6E79
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 11:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA8E11A7AD;
	Fri,  5 Jun 2026 11:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IlIidyHm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77AA11A7AD
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 11:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780660241; x=1812196241;
 h=date:from:to:cc:subject:message-id;
 bh=Q/ry9gahKlWYTdjIfSbsIQZC1TZAP7kdZSi/JoOnwhc=;
 b=IlIidyHm4EetqaU4Qf4+Zj+8zlDydZSDAmV1OlxcO/haUYBKrIncMw1e
 hntXytl5twXLlGtUH0b95q6J6nPeW68V41RcPmmg5cEstep6E2sfZKsM0
 1MXQ3vrF5tPyMNIfjGBfQGqQWOuXuQMVi+qjc5JmWL+FfUK5FS9wSJVg7
 Upor3YtP5zg+DhAVjBflQj8BIZoe61fdH3U/DmehUqbE3LNJ/6+G9l1s/
 MFSJRY9xdNY6De7tbmb9490WTCCLF+V/2gfQ5RCY0V4UGBjeuJ4LLLrTA
 NIR5lyKMpjk6oXCUiggSruPQeHCHE1NCEWJuMHoYhieddrz4aQsMo9sN6 A==;
X-CSE-ConnectionGUID: G4V/lorrS3+Tj68UpZpZow==
X-CSE-MsgGUID: DiQS2EsmQYG6gKHoGbVhRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92977906"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="92977906"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 04:50:40 -0700
X-CSE-ConnectionGUID: 9pM4AP9jRfyVxe3zp6F91A==
X-CSE-MsgGUID: sBhOQHprRSiJ+rYo8G3+iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="238468757"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 05 Jun 2026 04:50:38 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wVT4O-00000000Fwc-06wG;
 Fri, 05 Jun 2026 11:50:36 +0000
Date: Fri, 05 Jun 2026 19:49:59 +0800
From: kernel test robot <lkp@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD REGRESSION
 b7fb55cc3364ca128cfff9d50649ffd4327cd01e
Message-ID: <202606051947.mPBrcJA3-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: b7fb55cc3364ca128cfff9d50649ffd4327cd01e  drm/xe/multi_queue: skip submit when primary queue is suspended

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202606041255.dGo9lFkh-lkp@intel.com

    drivers/gpu/drm/xe/xe_hw_engine.c:361:6: error: initializer element is not a compile-time constant

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arm64-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- arm64-randconfig-002-20260604
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- i386-randconfig-015-20260604
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- i386-randconfig-017-20260604
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- powerpc64-randconfig-002-20260604
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- riscv-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- s390-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- s390-randconfig-002-20260604
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- sparc64-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- um-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- x86_64-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- x86_64-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- x86_64-randconfig-001-20260604
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- x86_64-randconfig-015-20260604
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- x86_64-randconfig-016-20260604
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
`-- x86_64-randconfig-073-20260604
    `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant

elapsed time: 2142m

configs tested: 173
configs skipped: 14

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260604    gcc-10.5.0
arc                   randconfig-002-20260604    gcc-16.1.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260604    gcc-8.5.0
arm                   randconfig-002-20260604    gcc-14.3.0
arm                   randconfig-003-20260604    clang-23
arm                   randconfig-004-20260604    clang-23
arm64                            alldefconfig    gcc-16.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260604    clang-23
arm64                 randconfig-002-20260604    clang-17
arm64                 randconfig-003-20260604    clang-23
arm64                 randconfig-004-20260604    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260604    gcc-16.1.0
csky                  randconfig-002-20260604    gcc-16.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon                        randconfig-001    clang-23
hexagon               randconfig-001-20260604    clang-23
hexagon                        randconfig-002    clang-23
hexagon               randconfig-002-20260604    clang-16
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260604    clang-20
i386                 buildonly-randconfig-002    clang-20
i386        buildonly-randconfig-002-20260604    gcc-14
i386                 buildonly-randconfig-003    clang-20
i386        buildonly-randconfig-003-20260604    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260604    clang-20
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260604    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260604    clang-20
i386                                defconfig    clang-22
i386                  randconfig-011-20260604    gcc-14
i386                  randconfig-012-20260604    gcc-14
i386                  randconfig-013-20260604    gcc-14
i386                  randconfig-014-20260604    gcc-12
i386                  randconfig-015-20260604    clang-20
i386                  randconfig-016-20260604    clang-20
i386                  randconfig-017-20260604    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-20
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    clang-23
loongarch             randconfig-001-20260604    clang-23
loongarch                      randconfig-002    gcc-16.1.0
loongarch             randconfig-002-20260604    gcc-12.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260604    gcc-11.5.0
nios2                          randconfig-002    gcc-8.5.0
nios2                 randconfig-002-20260604    gcc-11.5.0
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-16.1.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260604    gcc-11.5.0
parisc                randconfig-002-20260604    gcc-13.4.0
parisc64                            defconfig    gcc-16.1.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260604    clang-23
powerpc               randconfig-002-20260604    clang-23
powerpc64             randconfig-001-20260604    clang-23
powerpc64             randconfig-002-20260604    clang-18
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260604    clang-23
riscv                 randconfig-002-20260604    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                                defconfig    clang-18
s390                  randconfig-001-20260604    clang-23
s390                  randconfig-002-20260604    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-16.1.0
sh                    randconfig-001-20260604    gcc-16.1.0
sh                    randconfig-002-20260604    gcc-16.1.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260604    gcc-13.4.0
sparc                 randconfig-002-20260604    gcc-11.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
sparc64               randconfig-001-20260604    gcc-9.5.0
sparc64               randconfig-002-20260604    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260604    clang-23
um                    randconfig-002-20260604    clang-23
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64               buildonly-randconfig-001    gcc-12
x86_64      buildonly-randconfig-001-20260604    gcc-14
x86_64               buildonly-randconfig-002    clang-20
x86_64      buildonly-randconfig-002-20260604    clang-20
x86_64               buildonly-randconfig-003    gcc-14
x86_64      buildonly-randconfig-003-20260604    gcc-14
x86_64               buildonly-randconfig-004    gcc-14
x86_64      buildonly-randconfig-004-20260604    clang-20
x86_64               buildonly-randconfig-005    gcc-14
x86_64      buildonly-randconfig-005-20260604    gcc-13
x86_64               buildonly-randconfig-006    clang-20
x86_64      buildonly-randconfig-006-20260604    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260604    clang-20
x86_64                randconfig-002-20260604    gcc-14
x86_64                randconfig-003-20260604    clang-20
x86_64                randconfig-004-20260604    clang-20
x86_64                randconfig-005-20260604    clang-20
x86_64                randconfig-006-20260604    gcc-14
x86_64                randconfig-011-20260604    clang-20
x86_64                randconfig-012-20260604    clang-20
x86_64                randconfig-013-20260604    clang-20
x86_64                randconfig-014-20260604    gcc-13
x86_64                randconfig-015-20260604    clang-20
x86_64                randconfig-016-20260604    clang-20
x86_64                randconfig-071-20260604    clang-20
x86_64                randconfig-071-20260604    clang-22
x86_64                randconfig-072-20260604    clang-20
x86_64                randconfig-072-20260604    clang-22
x86_64                randconfig-073-20260604    clang-20
x86_64                randconfig-073-20260604    clang-22
x86_64                randconfig-074-20260604    clang-20
x86_64                randconfig-074-20260604    clang-22
x86_64                randconfig-075-20260604    clang-20
x86_64                randconfig-075-20260604    clang-22
x86_64                randconfig-076-20260604    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260604    gcc-13.4.0
xtensa                randconfig-002-20260604    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
