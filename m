Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDDBC5516D
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 18:42:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BAF10F043;
	Thu, 30 Jul 2026 18:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KjIzKrv2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3738F10F043
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 18:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785436934; x=1816972934;
 h=date:from:to:cc:subject:message-id;
 bh=M0//T2NewwcToz4cNmPFckgAx6eC/E5P9vfD7XMB37U=;
 b=KjIzKrv2GwhdrwJcx4vXHyw3L7YOSWMA+nY4rYVay6Dfujb7688ruVTk
 UIzYAOO2QZYG3p7OMeY5aadWjLQ5rBuFa/CjGztItI9hPS3v50btXt0ZH
 XMX5/XyAQ7aWexOxDQkmnlNFmT6cCzefWeTIrOT1O9sWF9iEYRJO4XRET
 s9zrSwAfYWR1+NTkWJ4qC4GsEdo3el4Ao1SjLA2hbqvyq211R+B0dJy/A
 BK710PLqHDYDAPPgGUSTKVh6MuDGo7reBJJDvkb4zq7Mo9M5D0/UaeHV9
 5kZx3aP7dXdFIQmK78GAYlHNEWQqhTS9wfHcgWEDHsB76WVIrPmw2mdz+ g==;
X-CSE-ConnectionGUID: HX1vIZnGRtOPJi1waeKJ9g==
X-CSE-MsgGUID: P/0n3kJ9SyG8po99sSnI9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86080848"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="86080848"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 11:42:14 -0700
X-CSE-ConnectionGUID: N5yNkDRASiGga/7NyhKddw==
X-CSE-MsgGUID: 4DLLsKVqQ4GR4scSnf+6Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="264652975"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
 by orviesa005.jf.intel.com with ESMTP; 30 Jul 2026 11:42:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wpVhb-00000000hS1-28KK;
 Thu, 30 Jul 2026 18:41:57 +0000
Date: Fri, 31 Jul 2026 02:40:28 +0800
From: kernel test robot <lkp@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 60693b580ab5f7f3158adcc2bab5ae816edd49ff
Message-ID: <202607310212.9zdjUYCQ-lkp@intel.com>
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
branch HEAD: 60693b580ab5f7f3158adcc2bab5ae816edd49ff  drm/xe/tests: add live KUnit coverage for BO page-size allocation modes

elapsed time: 863m

configs tested: 166
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260730    gcc-11.5.0
arc                  randconfig-001-20260730    gcc-8.5.0
arc                  randconfig-002-20260730    gcc-8.5.0
arm                  randconfig-001-20260730    gcc-8.5.0
arm                  randconfig-002-20260730    gcc-15.2.0
arm                  randconfig-002-20260730    gcc-8.5.0
arm                  randconfig-003-20260730    gcc-13.4.0
arm                  randconfig-003-20260730    gcc-8.5.0
arm                  randconfig-004-20260730    clang-24
arm                  randconfig-004-20260730    gcc-8.5.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260730    gcc-14.3.0
arm64                randconfig-001-20260730    gcc-15.2.0
arm64                randconfig-002-20260730    clang-21
arm64                randconfig-002-20260730    gcc-14.3.0
arm64                randconfig-002-20260730    gcc-15.2.0
arm64                randconfig-003-20260730    gcc-14.3.0
arm64                randconfig-003-20260730    gcc-15.2.0
arm64                randconfig-003-20260730    gcc-8.5.0
arm64                randconfig-004-20260730    gcc-13.4.0
arm64                randconfig-004-20260730    gcc-14.3.0
arm64                randconfig-004-20260730    gcc-15.2.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260730    gcc-13.4.0
csky                 randconfig-001-20260730    gcc-14.3.0
csky                 randconfig-001-20260730    gcc-15.2.0
csky                 randconfig-002-20260730    gcc-14.3.0
csky                 randconfig-002-20260730    gcc-15.2.0
csky                 randconfig-002-20260730    gcc-16.1.0
hexagon                       randconfig-001    clang-17
hexagon                       randconfig-001    clang-24
hexagon              randconfig-001-20260730    clang-24
hexagon              randconfig-002-20260730    clang-24
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    gcc-14
i386       buildonly-randconfig-001-20260730    clang-22
i386       buildonly-randconfig-001-20260730    gcc-14
i386       buildonly-randconfig-002-20260730    clang-22
i386       buildonly-randconfig-002-20260730    gcc-14
i386       buildonly-randconfig-003-20260730    gcc-14
i386       buildonly-randconfig-004-20260730    clang-22
i386       buildonly-randconfig-004-20260730    gcc-14
i386       buildonly-randconfig-005-20260730    gcc-14
i386       buildonly-randconfig-006-20260730    gcc-14
i386                          randconfig-001    gcc-14
i386                 randconfig-001-20260730    gcc-14
i386                 randconfig-002-20260730    clang-22
i386                 randconfig-002-20260730    gcc-14
i386                 randconfig-003-20260730    gcc-14
i386                 randconfig-004-20260730    clang-22
i386                 randconfig-004-20260730    gcc-14
i386                 randconfig-005-20260730    clang-22
i386                 randconfig-005-20260730    gcc-14
i386                 randconfig-006-20260730    gcc-14
i386                 randconfig-007-20260730    gcc-14
i386                 randconfig-011-20260730    clang-22
i386                 randconfig-012-20260730    clang-22
i386                 randconfig-013-20260730    clang-22
i386                 randconfig-014-20260730    clang-22
i386                 randconfig-014-20260730    gcc-14
i386                 randconfig-015-20260730    clang-22
i386                 randconfig-016-20260730    clang-22
i386                 randconfig-016-20260730    gcc-13
i386                 randconfig-017-20260730    clang-22
i386                 randconfig-017-20260730    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260730    clang-24
loongarch            randconfig-001-20260730    gcc-16.1.0
loongarch            randconfig-002-20260730    clang-24
loongarch            randconfig-002-20260730    gcc-13.4.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260730    clang-24
nios2                randconfig-001-20260730    gcc-11.5.0
nios2                randconfig-002-20260730    clang-24
nios2                randconfig-002-20260730    gcc-9.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260730    gcc-14.3.0
parisc               randconfig-002-20260730    gcc-14.3.0
parisc               randconfig-002-20260730    gcc-16.1.0
powerpc                    rainier_defconfig    gcc-16.1.0
powerpc              randconfig-001-20260730    clang-24
powerpc              randconfig-001-20260730    gcc-14.3.0
powerpc              randconfig-002-20260730    gcc-11.5.0
powerpc              randconfig-002-20260730    gcc-14.3.0
powerpc64            randconfig-001-20260730    clang-24
powerpc64            randconfig-001-20260730    gcc-14.3.0
powerpc64            randconfig-002-20260730    gcc-14.3.0
powerpc64            randconfig-002-20260730    gcc-8.5.0
riscv                         randconfig-001    gcc-15.2.0
riscv                randconfig-001-20260730    gcc-15.2.0
riscv                randconfig-002-20260730    gcc-15.2.0
riscv                randconfig-002-20260730    gcc-9.5.0
s390                 randconfig-001-20260730    clang-17
s390                 randconfig-001-20260730    gcc-15.2.0
s390                 randconfig-002-20260730    gcc-15.2.0
s390                 randconfig-002-20260730    gcc-8.5.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260730    gcc-13.4.0
sh                   randconfig-001-20260730    gcc-15.2.0
sh                   randconfig-002-20260730    gcc-15.2.0
sparc                         randconfig-001    clang-24
sparc                randconfig-001-20260730    clang-24
sparc                randconfig-001-20260730    gcc-16.1.0
sparc                randconfig-002-20260730    clang-24
sparc                randconfig-002-20260730    gcc-16.1.0
sparc64              randconfig-001-20260730    clang-20
sparc64              randconfig-001-20260730    clang-24
sparc64              randconfig-002-20260730    clang-24
sparc64              randconfig-002-20260730    gcc-14.3.0
um                   randconfig-001-20260730    clang-17
um                   randconfig-001-20260730    clang-24
um                   randconfig-002-20260730    clang-24
x86_64              buildonly-randconfig-001    gcc-14
x86_64     buildonly-randconfig-001-20260730    clang-22
x86_64     buildonly-randconfig-001-20260730    gcc-14
x86_64     buildonly-randconfig-002-20260730    clang-22
x86_64     buildonly-randconfig-002-20260730    gcc-14
x86_64     buildonly-randconfig-003-20260730    clang-22
x86_64     buildonly-randconfig-003-20260730    gcc-14
x86_64     buildonly-randconfig-004-20260730    gcc-14
x86_64     buildonly-randconfig-005-20260730    gcc-14
x86_64     buildonly-randconfig-006-20260730    gcc-14
x86_64                                 kexec    clang-22
x86_64                        randconfig-001    clang-22
x86_64               randconfig-001-20260730    clang-22
x86_64               randconfig-002-20260730    clang-22
x86_64               randconfig-002-20260730    gcc-14
x86_64               randconfig-003-20260730    clang-22
x86_64               randconfig-004-20260730    clang-22
x86_64               randconfig-004-20260730    gcc-14
x86_64               randconfig-005-20260730    clang-22
x86_64               randconfig-006-20260730    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260730    clang-22
x86_64               randconfig-011-20260730    gcc-12
x86_64               randconfig-012-20260730    clang-22
x86_64               randconfig-012-20260730    gcc-14
x86_64               randconfig-013-20260730    clang-22
x86_64               randconfig-013-20260730    gcc-14
x86_64               randconfig-014-20260730    clang-22
x86_64               randconfig-015-20260730    clang-22
x86_64               randconfig-016-20260730    clang-22
x86_64               randconfig-016-20260730    gcc-12
x86_64               randconfig-071-20260730    gcc-12
x86_64               randconfig-071-20260730    gcc-14
x86_64               randconfig-072-20260730    gcc-12
x86_64               randconfig-073-20260730    clang-22
x86_64               randconfig-073-20260730    gcc-12
x86_64               randconfig-074-20260730    gcc-12
x86_64               randconfig-075-20260730    clang-22
x86_64               randconfig-075-20260730    gcc-12
x86_64               randconfig-076-20260730    clang-22
x86_64               randconfig-076-20260730    gcc-12
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260730    clang-24
xtensa               randconfig-001-20260730    gcc-16.1.0
xtensa               randconfig-002-20260730    clang-24
xtensa               randconfig-002-20260730    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
