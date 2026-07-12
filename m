Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7348BC43458
	for <intel-xe@archiver.kernel.org>; Sun, 12 Jul 2026 05:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1861E10E211;
	Sun, 12 Jul 2026 05:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYIPS82P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0738F10E211
 for <intel-xe@lists.freedesktop.org>; Sun, 12 Jul 2026 05:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783833764; x=1815369764;
 h=date:from:to:cc:subject:message-id;
 bh=bTqXW0qVAVQa42atHPaSblBv4siNJ4ceoKKEilrIhm8=;
 b=QYIPS82PcovzrT1yZdLpmirnZyThWRL8lD6l7f2zteohKFoNV09stFj9
 3pv6XCfFLep65H9ZDsXSRI3GF7PoSoA/9Jxwwx6469jq1TDNGFasAC8BT
 BLh5ngUYIM4Yx490q7I4U/tXmUAxBbq6DpKy5VaDw44KrzxwdC2MaYqUb
 +zcsTh3NrkHw4Weq+3TxDSeFDDVJyFn2Soj/gaNbhxsEDszYLw2HHW2pW
 gok4CQzWdBhTekhUKVJXUWkxCV2CAuxTYipvXEXyeCQ1d8FHGNzePq0f7
 4xyXaIHhNM1V5lRR5PtCRenqJ4tUG7qvi5+eizPf9d7xoyFbEG1t3+KUy w==;
X-CSE-ConnectionGUID: FiY5jOBySHmOLOVtbVUKzQ==
X-CSE-MsgGUID: 41PHX5CYSO+8xJ7fjIXsvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84362179"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84362179"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2026 22:22:43 -0700
X-CSE-ConnectionGUID: JFG7xWMMQNWLUsJovu+3mQ==
X-CSE-MsgGUID: lCoT2DXKTFydpAD0KYqVWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255891389"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 11 Jul 2026 22:22:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wimeD-00000000KiM-2rXf;
 Sun, 12 Jul 2026 05:22:38 +0000
Date: Sun, 12 Jul 2026 13:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS WITH UNVERIFIED WARNING
 068388c0cd225654e7369907670d4e77b8dd3744
Message-ID: <202607121346.tYo5d9hj-lkp@intel.com>
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
branch HEAD: 068388c0cd225654e7369907670d4e77b8dd3744  drm/xe/pf: Handle migration descriptor using KLV helpers

Unverified Warning (likely false positive, kindly check if interested):

    https://lore.kernel.org/oe-kbuild/202607120341.jYqqcMOB-lkp@intel.com

    drivers/gpu/drm/xe/xe_guc_ads.c:411:49: sparse: sparse: Trying to use reserved word 'struct' as identifier

Warning ids grouped by kconfigs:

recent_errors
`-- arm64-randconfig-r134-20260711
    `-- drivers-gpu-drm-xe-xe_guc_ads.c:sparse:sparse:Trying-to-use-reserved-word-struct-as-identifier

elapsed time: 857m

configs tested: 209
configs skipped: 7

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260712    clang-18
arc                   randconfig-002-20260712    clang-18
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260712    clang-18
arm                   randconfig-002-20260712    clang-18
arm                   randconfig-003-20260712    clang-18
arm                   randconfig-004-20260712    clang-18
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260712    gcc-16.1.0
arm64                 randconfig-002-20260712    gcc-16.1.0
arm64                 randconfig-003-20260712    gcc-16.1.0
arm64                 randconfig-004-20260712    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260712    gcc-16.1.0
csky                  randconfig-002-20260712    gcc-16.1.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260712    clang-22
hexagon               randconfig-001-20260712    clang-23
hexagon               randconfig-002-20260712    clang-22
hexagon               randconfig-002-20260712    clang-23
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    clang-22
i386        buildonly-randconfig-001-20260712    clang-22
i386                 buildonly-randconfig-002    clang-22
i386        buildonly-randconfig-002-20260712    clang-22
i386                 buildonly-randconfig-003    clang-22
i386        buildonly-randconfig-003-20260712    clang-22
i386                 buildonly-randconfig-004    clang-22
i386        buildonly-randconfig-004-20260712    clang-22
i386                 buildonly-randconfig-005    clang-22
i386        buildonly-randconfig-005-20260712    clang-22
i386                 buildonly-randconfig-006    clang-22
i386        buildonly-randconfig-006-20260712    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260712    clang-22
i386                  randconfig-002-20260712    clang-22
i386                  randconfig-003-20260712    clang-22
i386                  randconfig-004-20260712    clang-22
i386                  randconfig-005-20260712    clang-22
i386                  randconfig-006-20260712    clang-22
i386                  randconfig-007-20260712    clang-22
i386                  randconfig-011-20260712    gcc-14
i386                  randconfig-012-20260712    gcc-14
i386                  randconfig-013-20260712    gcc-14
i386                  randconfig-014-20260712    gcc-14
i386                  randconfig-015-20260712    gcc-14
i386                  randconfig-016-20260712    gcc-14
i386                  randconfig-017-20260712    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260712    clang-22
loongarch             randconfig-002-20260712    clang-22
loongarch             randconfig-002-20260712    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                          hp300_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260712    clang-22
nios2                 randconfig-001-20260712    gcc-11.5.0
nios2                 randconfig-002-20260712    clang-22
nios2                 randconfig-002-20260712    gcc-11.5.0
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260712    gcc-8.5.0
parisc                randconfig-002-20260712    gcc-8.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc               randconfig-001-20260712    gcc-8.5.0
powerpc               randconfig-002-20260712    gcc-8.5.0
powerpc64             randconfig-001-20260712    gcc-8.5.0
powerpc64             randconfig-002-20260712    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260712    clang-22
riscv                 randconfig-002-20260712    clang-22
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260712    clang-22
s390                  randconfig-002-20260712    clang-22
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260712    clang-22
sh                    randconfig-002-20260712    clang-22
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260712    gcc-13.4.0
sparc                 randconfig-002-20260712    gcc-13.4.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260712    gcc-13.4.0
sparc64               randconfig-002-20260712    gcc-13.4.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260712    gcc-13.4.0
um                    randconfig-002-20260712    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260712    gcc-14
x86_64      buildonly-randconfig-002-20260712    gcc-14
x86_64      buildonly-randconfig-003-20260712    gcc-14
x86_64      buildonly-randconfig-004-20260712    gcc-14
x86_64      buildonly-randconfig-005-20260712    gcc-14
x86_64      buildonly-randconfig-006-20260712    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260712    gcc-14
x86_64                randconfig-002-20260712    gcc-14
x86_64                randconfig-003-20260712    gcc-14
x86_64                randconfig-004-20260712    gcc-14
x86_64                randconfig-005-20260712    gcc-14
x86_64                randconfig-006-20260712    gcc-14
x86_64                randconfig-011-20260712    clang-22
x86_64                randconfig-012-20260712    clang-22
x86_64                randconfig-013-20260712    clang-22
x86_64                randconfig-014-20260712    clang-22
x86_64                randconfig-015-20260712    clang-22
x86_64                randconfig-016-20260712    clang-22
x86_64                randconfig-071-20260712    clang-22
x86_64                randconfig-072-20260712    clang-22
x86_64                randconfig-073-20260712    clang-22
x86_64                randconfig-074-20260712    clang-22
x86_64                randconfig-075-20260712    clang-22
x86_64                randconfig-076-20260712    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                               rhel-9.4    gcc-14
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                          rhel-9.4-func    gcc-14
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                    rhel-9.4-kselftests    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                           alldefconfig    gcc-16.1.0
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260712    gcc-13.4.0
xtensa                randconfig-002-20260712    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
