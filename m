Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342F5CD484E
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 22:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA56610E52C;
	Mon, 11 May 2026 22:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wr9xs5HV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98AE10E902
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 22:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778540240; x=1810076240;
 h=date:from:to:cc:subject:message-id;
 bh=wRhDMSw+LL5BC4ABSKxHDL0wDtiUpVrqNk07PznseCk=;
 b=Wr9xs5HVJnoNFj1v+bkKrwRX4UP5UcT6OjsutdZI+sjigkg5ua4KYwdZ
 cBwgrD3vRzho+Tcu6H4v6MPlD+dIaBHk/8gmcY79QHb7mhnibQ6XyvhvC
 Rn0JBm4QwBUxvwdRBSbVZNIUDcjz8Jg/bp9zNZo/Ji8mR6+TwrB0m/GvL
 GCvXE4v+GNnhKOyXMBMte5Mso1drknnQcrcKiBWyR46A7yGP5HOzLW3iG
 Wr1GlNTYc7RSVooU4yowZPhFPmxAD50e1BELMDvjm14Ax5Lu5yIRFwG70
 qjr4I3B5GNEnF4eeeo06Auv4Anu95tdRMhHMC5SSdOxzijJZwYlpzLu5o g==;
X-CSE-ConnectionGUID: truEPxcPT7mm5EAMSAjLDg==
X-CSE-MsgGUID: Rnv0GtLbQbOAK+4E7sFkTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="82003561"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="82003561"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 15:57:20 -0700
X-CSE-ConnectionGUID: dGBtqAH2QnCX09z/FLx2GA==
X-CSE-MsgGUID: luNBlFkEQ0yl3NzX1Hdmsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="275716281"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 11 May 2026 15:57:19 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wMZYq-000000001Fh-2g98;
 Mon, 11 May 2026 22:57:16 +0000
Date: Tue, 12 May 2026 06:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD REGRESSION
 479669418253e0f27f8cf5db01a731352ea592e7
Message-ID: <202605120600.4zFj6BqT-lkp@intel.com>
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
branch HEAD: 479669418253e0f27f8cf5db01a731352ea592e7  drm/xe/dma-buf: fix UAF with retry loop

Error/Warning ids grouped by kconfigs:

recent_errors
`-- m68k-allmodconfig
    |-- drivers-gpu-drm-bridge-microchip-lvds.c:error:initialization-of-void-(-)(struct-drm_bridge-struct-drm_atomic_commit-)-from-incompatible-pointer-type-void-(-)(struct-drm_bridge-struct-drm_atomic_state-
    `-- drivers-gpu-drm-bridge-microchip-lvds.c:error:passing-argument-of-drm_atomic_get_new_connector_for_encoder-from-incompatible-pointer-type

elapsed time: 729m

configs tested: 309
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260511    gcc-10.5.0
arc                   randconfig-001-20260512    gcc-11.5.0
arc                   randconfig-002-20260511    gcc-10.5.0
arc                   randconfig-002-20260512    gcc-11.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                          pxa3xx_defconfig    clang-23
arm                   randconfig-001-20260511    gcc-10.5.0
arm                   randconfig-001-20260512    gcc-11.5.0
arm                   randconfig-002-20260511    gcc-10.5.0
arm                   randconfig-002-20260512    gcc-11.5.0
arm                   randconfig-003-20260511    gcc-10.5.0
arm                   randconfig-003-20260512    gcc-11.5.0
arm                   randconfig-004-20260511    gcc-10.5.0
arm                   randconfig-004-20260512    gcc-11.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260511    clang-17
arm64                 randconfig-001-20260511    clang-23
arm64                 randconfig-001-20260512    gcc-14.3.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260511    clang-17
arm64                 randconfig-002-20260511    clang-23
arm64                 randconfig-002-20260512    gcc-14.3.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260511    clang-17
arm64                 randconfig-003-20260511    clang-23
arm64                 randconfig-003-20260512    gcc-14.3.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260511    clang-17
arm64                 randconfig-004-20260511    clang-23
arm64                 randconfig-004-20260512    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260511    clang-17
csky                  randconfig-001-20260511    clang-23
csky                  randconfig-001-20260512    gcc-14.3.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260511    clang-17
csky                  randconfig-002-20260511    clang-23
csky                  randconfig-002-20260512    gcc-14.3.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260511    gcc-8.5.0
hexagon               randconfig-001-20260512    gcc-10.5.0
hexagon               randconfig-002-20260511    gcc-8.5.0
hexagon               randconfig-002-20260512    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260511    gcc-14
i386        buildonly-randconfig-001-20260512    gcc-14
i386        buildonly-randconfig-002-20260511    gcc-14
i386        buildonly-randconfig-002-20260512    gcc-14
i386        buildonly-randconfig-003-20260511    gcc-14
i386        buildonly-randconfig-003-20260512    gcc-14
i386        buildonly-randconfig-004-20260511    gcc-14
i386        buildonly-randconfig-004-20260512    gcc-14
i386        buildonly-randconfig-005-20260511    gcc-14
i386        buildonly-randconfig-005-20260512    gcc-14
i386        buildonly-randconfig-006-20260511    gcc-14
i386        buildonly-randconfig-006-20260512    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260511    gcc-12
i386                  randconfig-002-20260511    gcc-12
i386                  randconfig-003-20260511    gcc-12
i386                  randconfig-004-20260511    gcc-12
i386                  randconfig-005-20260511    gcc-12
i386                  randconfig-006-20260511    gcc-12
i386                  randconfig-007-20260511    gcc-12
i386                           randconfig-011    clang-20
i386                  randconfig-011-20260511    clang-20
i386                  randconfig-011-20260512    clang-20
i386                           randconfig-012    clang-20
i386                  randconfig-012-20260511    clang-20
i386                  randconfig-012-20260512    clang-20
i386                           randconfig-013    clang-20
i386                  randconfig-013-20260511    clang-20
i386                  randconfig-013-20260512    clang-20
i386                           randconfig-014    clang-20
i386                  randconfig-014-20260511    clang-20
i386                  randconfig-014-20260512    clang-20
i386                           randconfig-015    clang-20
i386                  randconfig-015-20260511    clang-20
i386                  randconfig-015-20260512    clang-20
i386                           randconfig-016    clang-20
i386                  randconfig-016-20260511    clang-20
i386                  randconfig-016-20260512    clang-20
i386                           randconfig-017    clang-20
i386                  randconfig-017-20260511    clang-20
i386                  randconfig-017-20260512    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260511    gcc-8.5.0
loongarch             randconfig-001-20260512    gcc-10.5.0
loongarch             randconfig-002-20260511    gcc-8.5.0
loongarch             randconfig-002-20260512    gcc-10.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           jazz_defconfig    clang-17
mips                    maltaup_xpa_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260511    gcc-8.5.0
nios2                 randconfig-001-20260512    gcc-10.5.0
nios2                 randconfig-002-20260511    gcc-8.5.0
nios2                 randconfig-002-20260512    gcc-10.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    clang-20
parisc                randconfig-001-20260511    clang-20
parisc                randconfig-001-20260512    gcc-12.5.0
parisc                         randconfig-002    clang-20
parisc                randconfig-002-20260511    clang-20
parisc                randconfig-002-20260512    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                      arches_defconfig    gcc-15.2.0
powerpc                        randconfig-001    clang-20
powerpc               randconfig-001-20260511    clang-20
powerpc               randconfig-001-20260512    gcc-12.5.0
powerpc                        randconfig-002    clang-20
powerpc               randconfig-002-20260511    clang-20
powerpc               randconfig-002-20260512    gcc-12.5.0
powerpc64                      randconfig-001    clang-20
powerpc64             randconfig-001-20260511    clang-20
powerpc64             randconfig-001-20260512    gcc-12.5.0
powerpc64                      randconfig-002    clang-20
powerpc64             randconfig-002-20260511    clang-20
powerpc64             randconfig-002-20260512    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    gcc-12.5.0
riscv                 randconfig-001-20260511    gcc-12.5.0
riscv                 randconfig-001-20260512    gcc-15.2.0
riscv                          randconfig-002    gcc-12.5.0
riscv                 randconfig-002-20260511    gcc-12.5.0
riscv                 randconfig-002-20260512    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    gcc-12.5.0
s390                  randconfig-001-20260511    gcc-12.5.0
s390                  randconfig-001-20260512    gcc-15.2.0
s390                           randconfig-002    gcc-12.5.0
s390                  randconfig-002-20260511    gcc-12.5.0
s390                  randconfig-002-20260512    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-12.5.0
sh                    randconfig-001-20260511    gcc-12.5.0
sh                    randconfig-001-20260512    gcc-15.2.0
sh                             randconfig-002    gcc-12.5.0
sh                    randconfig-002-20260511    gcc-12.5.0
sh                    randconfig-002-20260512    gcc-15.2.0
sh                           se7751_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-8.5.0
sparc                 randconfig-001-20260511    gcc-8.5.0
sparc                 randconfig-001-20260512    gcc-13.4.0
sparc                          randconfig-002    gcc-8.5.0
sparc                 randconfig-002-20260511    gcc-8.5.0
sparc                 randconfig-002-20260512    gcc-13.4.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-8.5.0
sparc64               randconfig-001-20260511    gcc-8.5.0
sparc64               randconfig-001-20260512    gcc-13.4.0
sparc64                        randconfig-002    gcc-8.5.0
sparc64               randconfig-002-20260511    gcc-8.5.0
sparc64               randconfig-002-20260512    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-8.5.0
um                    randconfig-001-20260511    gcc-8.5.0
um                    randconfig-001-20260512    gcc-13.4.0
um                             randconfig-002    gcc-8.5.0
um                    randconfig-002-20260511    gcc-8.5.0
um                    randconfig-002-20260512    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64               buildonly-randconfig-001    gcc-14
x86_64      buildonly-randconfig-001-20260511    gcc-14
x86_64      buildonly-randconfig-001-20260512    gcc-14
x86_64               buildonly-randconfig-002    gcc-14
x86_64      buildonly-randconfig-002-20260511    gcc-14
x86_64      buildonly-randconfig-002-20260512    gcc-14
x86_64               buildonly-randconfig-003    gcc-14
x86_64      buildonly-randconfig-003-20260511    gcc-14
x86_64      buildonly-randconfig-003-20260512    gcc-14
x86_64               buildonly-randconfig-004    gcc-14
x86_64      buildonly-randconfig-004-20260511    gcc-14
x86_64      buildonly-randconfig-004-20260512    gcc-14
x86_64               buildonly-randconfig-005    gcc-14
x86_64      buildonly-randconfig-005-20260511    gcc-14
x86_64      buildonly-randconfig-005-20260512    gcc-14
x86_64               buildonly-randconfig-006    gcc-14
x86_64      buildonly-randconfig-006-20260511    gcc-14
x86_64      buildonly-randconfig-006-20260512    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    clang-20
x86_64                randconfig-001-20260511    clang-20
x86_64                randconfig-001-20260512    gcc-14
x86_64                         randconfig-002    clang-20
x86_64                randconfig-002-20260511    clang-20
x86_64                randconfig-002-20260512    gcc-14
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260511    clang-20
x86_64                randconfig-003-20260512    gcc-14
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260511    clang-20
x86_64                randconfig-004-20260512    gcc-14
x86_64                         randconfig-005    clang-20
x86_64                randconfig-005-20260511    clang-20
x86_64                randconfig-005-20260512    gcc-14
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260511    clang-20
x86_64                randconfig-006-20260512    gcc-14
x86_64                         randconfig-011    clang-20
x86_64                randconfig-011-20260511    clang-20
x86_64                randconfig-011-20260512    clang-20
x86_64                         randconfig-012    clang-20
x86_64                randconfig-012-20260511    clang-20
x86_64                randconfig-012-20260512    clang-20
x86_64                         randconfig-013    clang-20
x86_64                randconfig-013-20260511    clang-20
x86_64                randconfig-013-20260512    clang-20
x86_64                         randconfig-014    clang-20
x86_64                randconfig-014-20260511    clang-20
x86_64                randconfig-014-20260512    clang-20
x86_64                         randconfig-015    clang-20
x86_64                randconfig-015-20260511    clang-20
x86_64                randconfig-015-20260512    clang-20
x86_64                         randconfig-016    clang-20
x86_64                randconfig-016-20260511    clang-20
x86_64                randconfig-016-20260512    clang-20
x86_64                randconfig-071-20260511    clang-20
x86_64                randconfig-071-20260512    clang-20
x86_64                randconfig-072-20260511    clang-20
x86_64                randconfig-072-20260512    clang-20
x86_64                randconfig-073-20260511    clang-20
x86_64                randconfig-073-20260512    clang-20
x86_64                randconfig-074-20260511    clang-20
x86_64                randconfig-074-20260512    clang-20
x86_64                randconfig-075-20260511    clang-20
x86_64                randconfig-075-20260512    clang-20
x86_64                randconfig-076-20260511    clang-20
x86_64                randconfig-076-20260512    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                          iss_defconfig    gcc-15.2.0
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260511    gcc-8.5.0
xtensa                randconfig-001-20260512    gcc-13.4.0
xtensa                         randconfig-002    gcc-8.5.0
xtensa                randconfig-002-20260511    gcc-8.5.0
xtensa                randconfig-002-20260512    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
