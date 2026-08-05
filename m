Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C51C55ABA
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 19:48:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FC710E228;
	Wed,  5 Aug 2026 19:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EjYGr4KM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954D810E228
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 19:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785959338; x=1817495338;
 h=date:from:to:cc:subject:message-id;
 bh=3EE8YbuBZT4QnpS8vQaztQd2eMmTvlXLT0NFq6kEWvg=;
 b=EjYGr4KMmoaiYfMg0Yl7ocuzyE8YwLd5skIArVvHIhgUUmVm6NDLL0WT
 FDEQNfNFo/3zV4lZCzmFGvMGPIoKt4zjCd1q93kLVf1EFIezRyp8xIDtx
 DM5q4SHiwzdCQLWFx0deaBFl37mpFk7jF3fULCstp9Es3uPKULPwLFEOM
 JW5qXk3UoY5o4LocJuBbWDK/YPepj4B1SvY6JMI7FCYqpI3CndlCWwVpf
 UNgnC0M82SnUNOP+i8wM7LVCGHEbS1wulgNhmgljGUTP5vGbujWHa7rtP
 wOMt8wXKQfhDcKAgntalrOgoknAbeYwDj9kC1JKsRySjyK3zt6eI3Gs8V g==;
X-CSE-ConnectionGUID: 56eWYpZ1TG2d5ZvKsfny/Q==
X-CSE-MsgGUID: 4ZOPC6byR5+wai0EotQqZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97904931"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="97904931"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 12:48:58 -0700
X-CSE-ConnectionGUID: 6wa9iNlZSiumEtNB0H0NiQ==
X-CSE-MsgGUID: gK4/lD8JRTqFean5W5BtEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="286554209"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 05 Aug 2026 12:48:57 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wrhbi-00000000DIH-438k;
 Wed, 05 Aug 2026 19:48:54 +0000
Date: Thu, 06 Aug 2026 03:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 20bc4883c7c0e28c3ba6c76ccc279486c349dd3e
Message-ID: <202608060326.Flm3gjQQ-lkp@intel.com>
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
branch HEAD: 20bc4883c7c0e28c3ba6c76ccc279486c349dd3e  drm/xe/ras: Fix boot-time ras error processing

elapsed time: 1931m

configs tested: 122
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260805    gcc-12.5.0
arc                  randconfig-002-20260805    gcc-12.5.0
arm                       multi_v7_defconfig    gcc-16.1.0
arm                  randconfig-001-20260805    gcc-12.5.0
arm                  randconfig-002-20260805    gcc-12.5.0
arm                  randconfig-003-20260805    gcc-12.5.0
arm                  randconfig-004-20260805    gcc-12.5.0
arm64                randconfig-001-20260805    gcc-10.5.0
arm64                randconfig-002-20260805    gcc-10.5.0
arm64                randconfig-003-20260805    gcc-10.5.0
arm64                randconfig-004-20260805    gcc-10.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260805    gcc-10.5.0
csky                 randconfig-002-20260805    gcc-10.5.0
hexagon              randconfig-001-20260805    clang-18
hexagon              randconfig-001-20260806    clang-24
hexagon              randconfig-002-20260805    clang-18
hexagon              randconfig-002-20260806    clang-24
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260805    clang-22
i386       buildonly-randconfig-002-20260805    clang-22
i386       buildonly-randconfig-003-20260805    clang-22
i386       buildonly-randconfig-004-20260805    clang-22
i386       buildonly-randconfig-005-20260805    clang-22
i386       buildonly-randconfig-006-20260805    clang-22
i386                 randconfig-001-20260805    gcc-13
i386                 randconfig-002-20260805    gcc-13
i386                 randconfig-003-20260805    gcc-13
i386                 randconfig-004-20260805    gcc-13
i386                 randconfig-005-20260805    gcc-13
i386                 randconfig-006-20260805    gcc-13
i386                 randconfig-007-20260805    gcc-13
i386                 randconfig-011-20260805    gcc-14
i386                 randconfig-012-20260805    gcc-14
i386                 randconfig-013-20260805    gcc-14
i386                 randconfig-014-20260805    gcc-14
i386                 randconfig-015-20260805    gcc-14
i386                 randconfig-016-20260805    gcc-14
i386                 randconfig-017-20260805    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260805    clang-18
loongarch            randconfig-001-20260806    clang-24
loongarch            randconfig-002-20260805    clang-18
loongarch            randconfig-002-20260806    clang-24
mips                          jazz_defconfig    clang-24
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260805    clang-18
nios2                randconfig-001-20260806    clang-24
nios2                randconfig-002-20260805    clang-18
nios2                randconfig-002-20260806    clang-24
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260805    gcc-9.5.0
parisc               randconfig-002-20260805    gcc-9.5.0
powerpc                    asp8347_defconfig    clang-24
powerpc              randconfig-001-20260805    gcc-9.5.0
powerpc              randconfig-002-20260805    gcc-9.5.0
powerpc64            randconfig-001-20260805    gcc-9.5.0
powerpc64            randconfig-002-20260805    gcc-9.5.0
riscv                         randconfig-001    gcc-8.5.0
riscv                randconfig-001-20260805    gcc-8.5.0
riscv                randconfig-001-20260806    gcc-13.4.0
riscv                randconfig-002-20260805    gcc-8.5.0
riscv                randconfig-002-20260806    gcc-13.4.0
s390                            alldefconfig    gcc-16.1.0
s390                 randconfig-001-20260805    gcc-8.5.0
s390                 randconfig-001-20260806    gcc-13.4.0
s390                 randconfig-002-20260805    gcc-8.5.0
s390                 randconfig-002-20260806    gcc-13.4.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260805    gcc-8.5.0
sh                   randconfig-001-20260806    gcc-13.4.0
sh                   randconfig-002-20260805    gcc-8.5.0
sh                   randconfig-002-20260806    gcc-13.4.0
sh                          se7206_defconfig    gcc-16.1.0
sparc                randconfig-001-20260805    gcc-11.5.0
sparc                randconfig-002-20260805    gcc-11.5.0
sparc64              randconfig-001-20260805    gcc-11.5.0
sparc64              randconfig-002-20260805    gcc-11.5.0
um                   randconfig-001-20260805    gcc-11.5.0
um                   randconfig-002-20260805    gcc-11.5.0
x86_64     buildonly-randconfig-001-20260805    gcc-14
x86_64     buildonly-randconfig-001-20260806    clang-22
x86_64     buildonly-randconfig-002-20260805    gcc-14
x86_64     buildonly-randconfig-002-20260806    clang-22
x86_64     buildonly-randconfig-003-20260805    gcc-14
x86_64     buildonly-randconfig-003-20260806    clang-22
x86_64     buildonly-randconfig-004-20260805    gcc-14
x86_64     buildonly-randconfig-004-20260806    clang-22
x86_64     buildonly-randconfig-005-20260805    gcc-14
x86_64     buildonly-randconfig-005-20260806    clang-22
x86_64     buildonly-randconfig-006-20260805    gcc-14
x86_64     buildonly-randconfig-006-20260806    clang-22
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260805    gcc-14
x86_64               randconfig-002-20260805    gcc-14
x86_64               randconfig-003-20260805    gcc-14
x86_64               randconfig-004-20260805    gcc-14
x86_64               randconfig-005-20260805    gcc-14
x86_64               randconfig-006-20260805    gcc-14
x86_64               randconfig-011-20260805    gcc-14
x86_64               randconfig-012-20260805    gcc-14
x86_64               randconfig-013-20260805    gcc-14
x86_64               randconfig-014-20260805    gcc-14
x86_64               randconfig-015-20260805    gcc-14
x86_64               randconfig-016-20260805    gcc-14
x86_64               randconfig-071-20260805    clang-22
x86_64               randconfig-072-20260805    clang-22
x86_64               randconfig-073-20260805    clang-22
x86_64               randconfig-074-20260805    clang-22
x86_64               randconfig-075-20260805    clang-22
x86_64               randconfig-076-20260805    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260805    gcc-11.5.0
xtensa               randconfig-002-20260805    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
