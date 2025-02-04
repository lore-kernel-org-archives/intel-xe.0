Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AABFC02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 20:29:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A843710E077;
	Tue,  4 Feb 2025 20:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="URcRVl5h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3924710E077
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 20:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738700993; x=1770236993;
 h=date:from:to:cc:subject:message-id;
 bh=8aO0igrZg43eKMJYBWjPx5X4TstCw3Vo2x4UtsDbdpo=;
 b=URcRVl5hXu9+5BlHlx6vsLByy8tEU2z7MmyqkdYTy79YU+hYtmL6FveJ
 XAIWyFDkoZoUUqLv5HbChCkDK1BwQoMX3VYkd0wz1kz8TPdMPOUyTDJfC
 9CRYGZgJHJU2CdVbWmJugeEj6hTNcmeiMbzmaA50FgmNXr1RnjkJHdpj5
 XS4NCXfM2CTQvmh9vnXHsMLXPquLB7KFAN00ZQv1bL4oMABcpgArOPKVN
 ITlo2OmXHkP6vG5dcTvGsPPMLYh75rBxN5vv+s+xzJknPc2eS8ZJJTbAV
 YofOYnbcRUZNOMSp+O1FfKv2rPuKpK8enslmsgBkyOMzyMs/eEZP95rMQ Q==;
X-CSE-ConnectionGUID: P2J9pImbQ1O5+7VnS/lPPw==
X-CSE-MsgGUID: 2cTAy30zTtOKU2xuIfMPVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64602621"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="64602621"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 12:29:53 -0800
X-CSE-ConnectionGUID: J1MCb7l/RY6jKQOVjt8pKQ==
X-CSE-MsgGUID: MmpFpUH2RQyikizvcNSQ/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="110877182"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 04 Feb 2025 12:29:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tfPYL-000syr-2a;
 Tue, 04 Feb 2025 20:29:49 +0000
Date: Wed, 05 Feb 2025 04:29:31 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 a9ab6591b45258b79af1cb66112fd9f83c8855da
Message-ID: <202502050425.gvwbLiAc-lkp@intel.com>
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
branch HEAD: a9ab6591b45258b79af1cb66112fd9f83c8855da  drm/xe: Fix and re-enable xe_print_blob_ascii85()

elapsed time: 1445m

configs tested: 111
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              alldefconfig    gcc-13.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250204    gcc-13.2.0
arc                   randconfig-002-20250204    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250204    clang-21
arm                   randconfig-002-20250204    clang-17
arm                   randconfig-003-20250204    clang-19
arm                   randconfig-004-20250204    clang-21
arm                           sama7_defconfig    clang-16
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250204    clang-21
arm64                 randconfig-002-20250204    clang-21
arm64                 randconfig-003-20250204    clang-17
arm64                 randconfig-004-20250204    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250204    gcc-14.2.0
csky                  randconfig-002-20250204    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250204    clang-21
hexagon               randconfig-002-20250204    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250204    gcc-12
i386        buildonly-randconfig-002-20250204    clang-19
i386        buildonly-randconfig-003-20250204    clang-19
i386        buildonly-randconfig-004-20250204    gcc-12
i386        buildonly-randconfig-005-20250204    clang-19
i386        buildonly-randconfig-006-20250204    gcc-12
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250204    gcc-14.2.0
loongarch             randconfig-002-20250204    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250204    gcc-14.2.0
nios2                 randconfig-002-20250204    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250204    gcc-14.2.0
parisc                randconfig-002-20250204    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                 mpc834x_itx_defconfig    clang-21
powerpc                  mpc885_ads_defconfig    clang-18
powerpc               randconfig-001-20250204    gcc-14.2.0
powerpc               randconfig-002-20250204    gcc-14.2.0
powerpc               randconfig-003-20250204    clang-21
powerpc64             randconfig-002-20250204    clang-19
powerpc64             randconfig-003-20250204    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250204    gcc-14.2.0
riscv                 randconfig-002-20250204    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250204    gcc-14.2.0
s390                  randconfig-002-20250204    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250204    gcc-14.2.0
sh                    randconfig-002-20250204    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250204    gcc-14.2.0
sparc                 randconfig-002-20250204    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250204    gcc-14.2.0
sparc64               randconfig-002-20250204    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250204    clang-21
um                    randconfig-002-20250204    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250204    clang-19
x86_64      buildonly-randconfig-002-20250204    clang-19
x86_64      buildonly-randconfig-003-20250204    clang-19
x86_64      buildonly-randconfig-004-20250204    gcc-11
x86_64      buildonly-randconfig-005-20250204    clang-19
x86_64      buildonly-randconfig-006-20250204    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250204    gcc-14.2.0
xtensa                randconfig-002-20250204    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
