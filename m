Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D096DE6ADDD
	for <intel-xe@archiver.kernel.org>; Sat, 23 Nov 2024 16:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CE710E256;
	Sat, 23 Nov 2024 16:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WUgn5eR8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B4B10E256
 for <intel-xe@lists.freedesktop.org>; Sat, 23 Nov 2024 16:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732379164; x=1763915164;
 h=date:from:to:cc:subject:message-id;
 bh=dD01XcPbpB872MEwv4IrcwpiuyTcPA1qynCdoq5gFBw=;
 b=WUgn5eR85v/S/g0Y6qF8sgH9ubcPrHvrG7sCZmYYinFjLf01AY7/R2xZ
 5SQFyL/d+WVxg5lpXn8Bzz6xa+/OxljfEgTN1OuHcVczIkt4j0JUKr6d2
 HNtdzHL+kswOPZ+eeEfYLGMtmvr02cq7A6DxGOSXoUemavIog5puiLVbz
 0dlYFriNj0A72HoRDcPm0jsVzKF3m0pr7HTkBYD88AgAV3U3Gv1trK+fv
 OkikUJCelVAiw/A3S2mbyrwts2polkb6aERQBZMSZYMZGjKCjK98yNSpQ
 I9VmX2RC9q0LWTQ9sv6QJ/DBSC3E00gya3F8UnZQ/Pq+kFD17f3X0JZED A==;
X-CSE-ConnectionGUID: KVwMFOx4S62HUCmkhIKWRQ==
X-CSE-MsgGUID: sGZ2LsUFRYiZU2QcxsVBmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11265"; a="49938899"
X-IronPort-AV: E=Sophos;i="6.12,179,1728975600"; d="scan'208";a="49938899"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2024 08:26:04 -0800
X-CSE-ConnectionGUID: AxnQX3AJRwyYoIEdFqolXg==
X-CSE-MsgGUID: ts2IYwaNTAOsf3CgZ6cNdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,179,1728975600"; d="scan'208";a="91206752"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 23 Nov 2024 08:26:01 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tEsxL-0004jF-2l;
 Sat, 23 Nov 2024 16:25:59 +0000
Date: Sun, 24 Nov 2024 00:25:05 +0800
From: kernel test robot <lkp@intel.com>
To: John Harrison <John.C.Harrison@Intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 a9f7b97ddae36d664d627b152d5c5a07b32ba816
Message-ID: <202411240059.n5e3A4L3-lkp@intel.com>
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
branch HEAD: a9f7b97ddae36d664d627b152d5c5a07b32ba816  drm/xe/guc: Add support for G2G communications

elapsed time: 723m

configs tested: 159
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241123    gcc-13.2.0
arc                   randconfig-002-20241123    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                        multi_v5_defconfig    gcc-14.2.0
arm                        mvebu_v7_defconfig    clang-15
arm                   randconfig-001-20241123    gcc-14.2.0
arm                   randconfig-002-20241123    clang-20
arm                   randconfig-003-20241123    clang-20
arm                   randconfig-004-20241123    gcc-14.2.0
arm                       spear13xx_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241123    clang-20
arm64                 randconfig-002-20241123    gcc-14.2.0
arm64                 randconfig-003-20241123    gcc-14.2.0
arm64                 randconfig-004-20241123    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241123    gcc-14.2.0
csky                  randconfig-002-20241123    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241123    clang-20
hexagon               randconfig-002-20241123    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241123    clang-19
i386        buildonly-randconfig-002-20241123    clang-19
i386        buildonly-randconfig-003-20241123    gcc-12
i386        buildonly-randconfig-004-20241123    clang-19
i386        buildonly-randconfig-005-20241123    clang-19
i386        buildonly-randconfig-006-20241123    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241123    clang-19
i386                  randconfig-002-20241123    clang-19
i386                  randconfig-003-20241123    gcc-12
i386                  randconfig-004-20241123    clang-19
i386                  randconfig-005-20241123    clang-19
i386                  randconfig-006-20241123    clang-19
i386                  randconfig-011-20241123    gcc-12
i386                  randconfig-012-20241123    clang-19
i386                  randconfig-013-20241123    gcc-12
i386                  randconfig-014-20241123    gcc-12
i386                  randconfig-015-20241123    clang-19
i386                  randconfig-016-20241123    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241123    gcc-14.2.0
loongarch             randconfig-002-20241123    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                         bigsur_defconfig    gcc-14.2.0
mips                     loongson1b_defconfig    clang-15
mips                        qi_lb60_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241123    gcc-14.2.0
nios2                 randconfig-002-20241123    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241123    gcc-14.2.0
parisc                randconfig-002-20241123    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                 mpc834x_itx_defconfig    clang-20
powerpc                      pcm030_defconfig    clang-20
powerpc               randconfig-001-20241123    gcc-14.2.0
powerpc               randconfig-002-20241123    clang-20
powerpc               randconfig-003-20241123    clang-20
powerpc64             randconfig-001-20241123    gcc-14.2.0
powerpc64             randconfig-002-20241123    clang-20
powerpc64             randconfig-003-20241123    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-20
riscv                 randconfig-001-20241123    clang-20
riscv                 randconfig-002-20241123    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-20
s390                  randconfig-001-20241123    gcc-14.2.0
s390                  randconfig-002-20241123    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20241123    gcc-14.2.0
sh                    randconfig-002-20241123    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                          alldefconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20241123    gcc-14.2.0
sparc64               randconfig-002-20241123    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241123    clang-20
um                    randconfig-002-20241123    clang-20
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241123    gcc-12
x86_64      buildonly-randconfig-002-20241123    gcc-12
x86_64      buildonly-randconfig-003-20241123    gcc-11
x86_64      buildonly-randconfig-004-20241123    gcc-12
x86_64      buildonly-randconfig-005-20241123    gcc-12
x86_64      buildonly-randconfig-006-20241123    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241123    clang-19
x86_64                randconfig-002-20241123    gcc-12
x86_64                randconfig-003-20241123    clang-19
x86_64                randconfig-004-20241123    clang-19
x86_64                randconfig-005-20241123    gcc-12
x86_64                randconfig-006-20241123    clang-19
x86_64                randconfig-011-20241123    gcc-12
x86_64                randconfig-012-20241123    clang-19
x86_64                randconfig-013-20241123    gcc-12
x86_64                randconfig-014-20241123    clang-19
x86_64                randconfig-015-20241123    clang-19
x86_64                randconfig-016-20241123    gcc-12
x86_64                randconfig-071-20241123    clang-19
x86_64                randconfig-072-20241123    clang-19
x86_64                randconfig-073-20241123    gcc-12
x86_64                randconfig-074-20241123    clang-19
x86_64                randconfig-075-20241123    gcc-11
x86_64                randconfig-076-20241123    clang-19
x86_64                               rhel-9.4    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241123    gcc-14.2.0
xtensa                randconfig-002-20241123    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
