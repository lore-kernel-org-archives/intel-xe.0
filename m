Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A4DE64A8F
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 13:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3C810E35F;
	Tue,  3 Dec 2024 13:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TEKUdBRz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C93A10E35F
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Dec 2024 13:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733232429; x=1764768429;
 h=date:from:to:cc:subject:message-id;
 bh=3v/qkj+/3FA+mKdjhyZMIcZw8eFevdWLP5Wq+640o4s=;
 b=TEKUdBRziGWtZr77LOMIkdVJ1vP6sab1otPUGzQj7VZc1wBMNe5YBO7+
 3TxhCyOSWnWLHALHYRGgic3qQC8S3Sb2zNUg7h8K12K0cCwctWQYcIM5f
 0kHvFMKA9ZdP6AYFSyykXf8P5YyGt7aDa0sFrUaupOePTati5h98JWn3h
 YIDZapALPgKcMTYfJ9ZZmtloSPZt3qBu/vtCsL4gtPphcboFqjUv0daxm
 eQNYNgivzdG+ePXpqJQ74wouKx96p1+o3xHu/+mP4ABUlNsbl1xKtKv40
 cEGMX25UX2/X06uwXENkjrENiUwTax3pMuxIXz0dFPg3nzWhJG3Y8cPJg g==;
X-CSE-ConnectionGUID: qGO9Qe4bQdmBgxEs2CCgXg==
X-CSE-MsgGUID: jwckVP2jS8Gw+vmH7B1z1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43928721"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="43928721"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 05:27:09 -0800
X-CSE-ConnectionGUID: jPeVUkDETeKJvuATlXfdGA==
X-CSE-MsgGUID: fyyv8PWdTdabJ5vvBAYa+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="98433378"
Received: from lkp-server02.sh.intel.com (HELO 3c97e37f0ba1) ([10.239.97.151])
 by orviesa005.jf.intel.com with ESMTP; 03 Dec 2024 05:27:08 -0800
Received: from kbuild by 3c97e37f0ba1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tISvh-00002J-08;
 Tue, 03 Dec 2024 13:27:05 +0000
Date: Tue, 03 Dec 2024 21:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: John Harrison <John.C.Harrison@Intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 906c4b306e9340f6ffd6d44904ebc86e62e63627
Message-ID: <202412032130.ugYbZPdw-lkp@intel.com>
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
branch HEAD: 906c4b306e9340f6ffd6d44904ebc86e62e63627  drm/xe: Add mutex locking to devcoredump

elapsed time: 727m

configs tested: 114
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                            hsdk_defconfig    gcc-14.2.0
arc                   randconfig-001-20241203    clang-20
arc                   randconfig-001-20241203    gcc-13.2.0
arc                   randconfig-002-20241203    clang-20
arc                   randconfig-002-20241203    gcc-13.2.0
arc                    vdk_hs38_smp_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                         at91_dt_defconfig    gcc-14.2.0
arm                         mv78xx0_defconfig    gcc-14.2.0
arm                   randconfig-001-20241203    clang-20
arm                   randconfig-002-20241203    clang-20
arm                   randconfig-002-20241203    gcc-14.2.0
arm                   randconfig-003-20241203    clang-20
arm                   randconfig-004-20241203    clang-20
arm                           stm32_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241203    clang-20
arm64                 randconfig-001-20241203    gcc-14.2.0
arm64                 randconfig-002-20241203    clang-20
arm64                 randconfig-002-20241203    gcc-14.2.0
arm64                 randconfig-003-20241203    clang-20
arm64                 randconfig-003-20241203    gcc-14.2.0
arm64                 randconfig-004-20241203    clang-20
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
i386        buildonly-randconfig-001-20241203    clang-19
i386        buildonly-randconfig-001-20241203    gcc-12
i386        buildonly-randconfig-002-20241203    clang-19
i386        buildonly-randconfig-002-20241203    gcc-12
i386        buildonly-randconfig-003-20241203    clang-19
i386        buildonly-randconfig-004-20241203    clang-19
i386        buildonly-randconfig-005-20241203    clang-19
i386        buildonly-randconfig-006-20241203    clang-19
i386        buildonly-randconfig-006-20241203    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                  cavium_octeon_defconfig    gcc-14.2.0
mips                         db1xxx_defconfig    clang-20
mips                           ip28_defconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    gcc-14.2.0
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                generic-64bit_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      arches_defconfig    gcc-14.2.0
powerpc                     asp8347_defconfig    gcc-14.2.0
powerpc                   currituck_defconfig    gcc-14.2.0
powerpc                       eiger_defconfig    gcc-14.2.0
powerpc                    ge_imp3a_defconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc                   motionpro_defconfig    gcc-14.2.0
powerpc                 mpc8315_rdb_defconfig    gcc-14.2.0
powerpc                     tqm8541_defconfig    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        edosk7705_defconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                               j2_defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                            migor_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20241203    gcc-11
x86_64      buildonly-randconfig-002-20241203    gcc-11
x86_64      buildonly-randconfig-003-20241203    gcc-11
x86_64      buildonly-randconfig-004-20241203    gcc-11
x86_64      buildonly-randconfig-005-20241203    gcc-11
x86_64      buildonly-randconfig-006-20241203    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
