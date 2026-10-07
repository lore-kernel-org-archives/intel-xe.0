Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C742CA5FFC
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 15:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92E810E60B;
	Wed,  7 Oct 2026 15:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jRaQJFQA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FA310E60B
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 15:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791388551; x=1822924551;
 h=date:from:to:cc:subject:message-id;
 bh=XI09ao/Ayi0mlj60fx4Kigl0AeAXRQiB9vIwY6AQWYE=;
 b=jRaQJFQAzqgJkPf2X6zWUIooelQ+C+NcmtltMlcT44ZGFBu3NmqJV5zR
 a/LkhplJa5mYV4Sxs9YeEibOuv9UAhwokBSiVqDt7i7/KSUO2tcCxwhC3
 F25xjShJMSz55gyZA92tX97wzMOK0UuAG5bzetwqAmBxTTXMcK2776l7k
 ZkhN4nh34Urk7FPx1wSNstzDU67K66k4lHv5cAErZrkA+7CcZc0X5S2lf
 gEyIELw/32DDMM/urNuZbsdezuuvUMoGDb8IfnixQ4MZP7b/W/dYF5SaU
 dYVi6T+xH9zCQgFs+g8u5wUHpaIbUryKc3i9tBjGYTWTc3hoFIdcn7PHf g==;
X-CSE-ConnectionGUID: dqqPJjGyR6+rQwzWvq7j+A==
X-CSE-MsgGUID: tk2xZaNuS3yKkpFgXtAQew==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="151353"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="151353"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 08:55:51 -0700
X-CSE-ConnectionGUID: a3nGU9MVReWk2H2kxt+RMA==
X-CSE-MsgGUID: FxJQCObkS/yDyz4+kgJA6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="87102"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 07 Oct 2026 08:55:49 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1xETze-000000003CA-2U0z;
 Wed, 07 Oct 2026 15:55:46 +0000
Date: Wed, 07 Oct 2026 23:55:19 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 f0a4447789ef28ba1aded2db19543d69c640b5e5
Message-ID: <202610072316.2DNBoz1f-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: f0a4447789ef28ba1aded2db19543d69c640b5e5  drm/xe/sysctrl: Fix mailbox header handling

elapsed time: 1144m

configs tested: 384
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2104-20261007    gcc-10.5.0 cocci
alpha                randconfig-r2104-20261007    gcc-8.5.0  cocci
alpha                randconfig-r2202-20261007    gcc-8.5.0  smatch
alpha                randconfig-r2302-20261007    clang-24   sparse
alpha                randconfig-r2304-20261007    gcc-14.3.0 sparse
alpha                randconfig-r2305-20261007    clang-17   sparse
alpha                randconfig-r2306-20261007    clang-24   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261007    clang-24
arc                   randconfig-1001-20261007    clang-24
arc                  randconfig-r2100-20261007    clang-20   cocci
arc                  randconfig-r2102-20261007    gcc-10.5.0 cocci
arc                  randconfig-r2103-20261007    gcc-11.5.0 cocci
arc                  randconfig-r2107-20261007    gcc-10.5.0 cocci
arc                  randconfig-r2107-20261007    gcc-8.5.0  cocci
arc                  randconfig-r2200-20261006    gcc-13.4.0 smatch
arc                  randconfig-r2202-20261007    gcc-8.5.0  smatch
arc                  randconfig-r2309-20261007    gcc-8.5.0  sparse
arm                               alldefconfig    gcc-16.1.0
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                          bcm2835_defconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                            omap1_defconfig    gcc-16.1.0
arm                             qcom_defconfig    clang-24
arm                   randconfig-1000-20261007    clang-24
arm                   randconfig-1001-20261007    clang-24
arm                   randconfig-1002-20261007    clang-24
arm                   randconfig-1003-20261007    clang-24
arm                  randconfig-r2100-20261007    clang-17   cocci
arm                  randconfig-r2104-20261007    gcc-12.5.0 cocci
arm                  randconfig-r2104-20261007    gcc-8.5.0  cocci
arm                  randconfig-r2105-20261007    gcc-16.1.0 cocci
arm                  randconfig-r2202-20261007    gcc-12.5.0 smatch
arm                  randconfig-r2304-20261007    clang-20   sparse
arm                         shmobile_defconfig    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261007    gcc-13.4.0
arm64                 randconfig-1001-20261007    gcc-13.4.0
arm64                 randconfig-1002-20261007    gcc-13.4.0
arm64                 randconfig-1003-20261007    gcc-13.4.0
arm64                randconfig-r2100-20261007    gcc-10.5.0 cocci
arm64                randconfig-r2102-20261007    gcc-8.5.0  cocci
arm64                randconfig-r2104-20261007    gcc-8.5.0  cocci
arm64                randconfig-r2106-20261007    clang-22   cocci
arm64                randconfig-r2106-20261007    gcc-16.1.0 cocci
arm64                randconfig-r2107-20261007    gcc-8.5.0  cocci
arm64                randconfig-r2201-20261007    clang-24   smatch
arm64                randconfig-r2301-20261007    clang-17   sparse
arm64                randconfig-r2301-20261007    clang-24   sparse
arm64                randconfig-r2303-20261007    clang-17   sparse
arm64                randconfig-r2305-20261007    clang-20   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261007    gcc-13.4.0
csky                  randconfig-1001-20261007    gcc-13.4.0
csky                 randconfig-r2102-20261007    gcc-8.5.0  cocci
csky                 randconfig-r2104-20261007    gcc-16.1.0 cocci
csky                 randconfig-r2201-20261007    gcc-16.1.0 smatch
csky                 randconfig-r2301-20261007    gcc-8.5.0  sparse
csky                 randconfig-r2305-20261007    clang-24   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261007    gcc-12.5.0
hexagon               randconfig-1001-20261007    gcc-12.5.0
hexagon              randconfig-r2101-20261007    gcc-8.5.0  cocci
hexagon              randconfig-r2102-20261007    clang-20   cocci
hexagon              randconfig-r2103-20261007    gcc-8.5.0  cocci
hexagon              randconfig-r2105-20261007    gcc-8.5.0  cocci
hexagon              randconfig-r2106-20261007    gcc-8.5.0  cocci
hexagon              randconfig-r2107-20261007    clang-22   cocci
hexagon              randconfig-r2107-20261007    gcc-16.1.0 cocci
hexagon              randconfig-r2200-20261007    clang-24   smatch
hexagon              randconfig-r2201-20261007    clang-24   smatch
hexagon              randconfig-r2300-20261007    gcc-14     sparse
hexagon              randconfig-r2304-20261007    clang-17   sparse
hexagon              randconfig-r2309-20261007    clang-17   sparse
i386                              alldefconfig    gcc-16.1.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261007    gcc-14
i386        buildonly-randconfig-1001-20261007    gcc-14
i386        buildonly-randconfig-1002-20261007    gcc-14
i386        buildonly-randconfig-1003-20261007    gcc-14
i386        buildonly-randconfig-1004-20261007    gcc-14
i386        buildonly-randconfig-1005-20261007    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261007    clang-22
i386                  randconfig-1001-20261007    clang-22
i386                  randconfig-1002-20261007    clang-22
i386                  randconfig-1003-20261007    clang-22
i386                  randconfig-1004-20261007    clang-22
i386                  randconfig-1005-20261007    clang-22
i386                  randconfig-1006-20261007    clang-22
i386                  randconfig-1007-20261007    gcc-14
i386                  randconfig-1008-20261007    gcc-14
i386                  randconfig-1009-20261007    gcc-14
i386                  randconfig-1010-20261007    gcc-14
i386                  randconfig-1011-20261007    gcc-14
i386                  randconfig-1012-20261007    gcc-14
i386                  randconfig-1013-20261007    gcc-14
i386                  randconfig-2100-20261007    clang-22   cocci
i386                  randconfig-2101-20261007    clang-22   cocci
i386                  randconfig-2102-20261007    clang-22   cocci
i386                  randconfig-2103-20261007    clang-22   cocci
i386                  randconfig-2200-20261007    gcc-14     smatch
i386                  randconfig-2300-20261007    clang-22   sparse
i386                  randconfig-2301-20261007    clang-22   sparse
i386                  randconfig-2302-20261007    clang-22   sparse
i386                 randconfig-r2106-20261007    gcc-12.5.0 cocci
i386                 randconfig-r2106-20261007    gcc-8.5.0  cocci
i386                 randconfig-r2300-20261007    gcc-16.1.0 sparse
i386                 randconfig-r2300-20261007    gcc-8.5.0  sparse
i386                 randconfig-r2302-20261007    clang-20   sparse
i386                 randconfig-r2307-20261007    clang-17   sparse
i386                 randconfig-r2307-20261007    gcc-13.4.0 sparse
i386                 randconfig-r2307-20261007    gcc-8.5.0  sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    gcc-16.1.0
loongarch             randconfig-1000-20261007    gcc-12.5.0
loongarch             randconfig-1001-20261007    gcc-12.5.0
loongarch            randconfig-r2104-20261007    gcc-8.5.0  cocci
loongarch            randconfig-r2300-20261007    clang-17   sparse
loongarch            randconfig-r2301-20261007    gcc-16.1.0 sparse
loongarch            randconfig-r2302-20261006    gcc-10.5.0 sparse
loongarch            randconfig-r2304-20261007    gcc-16.1.0 sparse
loongarch            randconfig-r2305-20261007    gcc-8.5.0  sparse
loongarch            randconfig-r2307-20261007    clang-24   sparse
loongarch            randconfig-r2309-20261007    clang-17   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5282evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2100-20261007    gcc-11.5.0 cocci
m68k                 randconfig-r2106-20261007    gcc-10.5.0 cocci
m68k                 randconfig-r2303-20261007    gcc-8.5.0  sparse
m68k                 randconfig-r2305-20261007    gcc-14.3.0 sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2104-20261007    gcc-10.5.0 cocci
microblaze           randconfig-r2200-20261007    gcc-8.5.0  smatch
microblaze           randconfig-r2301-20261006    gcc-10.5.0 sparse
microblaze           randconfig-r2303-20261007    gcc-16.1.0 sparse
microblaze           randconfig-r2306-20261007    gcc-13.4.0 sparse
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                          bigsur_defconfig    gcc-16.1.0
mips                   maltasmvp_eva_defconfig    gcc-16.1.0
mips                 randconfig-r2304-20261007    gcc-14     sparse
mips                 randconfig-r2306-20261007    clang-17   sparse
mips                 randconfig-r2308-20261007    gcc-8.5.0  sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261007    gcc-12.5.0
nios2                 randconfig-1001-20261007    gcc-12.5.0
nios2                randconfig-r2101-20261007    gcc-11.5.0 cocci
nios2                randconfig-r2105-20261007    gcc-10.5.0 cocci
nios2                randconfig-r2105-20261007    gcc-8.5.0  cocci
nios2                randconfig-r2300-20261006    gcc-10.5.0 sparse
nios2                randconfig-r2307-20261007    gcc-11.5.0 sparse
nios2                randconfig-r2309-20261007    gcc-11.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2101-20261007    gcc-10.5.0 cocci
openrisc             randconfig-r2101-20261007    gcc-8.5.0  cocci
openrisc             randconfig-r2107-20261007    gcc-12.5.0 cocci
openrisc             randconfig-r2200-20261007    gcc-12.5.0 smatch
openrisc             randconfig-r2302-20261007    gcc-16.1.0 sparse
openrisc             randconfig-r2303-20261007    clang-20   sparse
openrisc             randconfig-r2308-20261007    gcc-11.5.0 sparse
openrisc             randconfig-r2309-20261007    gcc-13.4.0 sparse
openrisc                        virt_defconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261007    gcc-15.2.0
parisc                randconfig-1001-20261007    gcc-15.2.0
parisc               randconfig-r2100-20261007    gcc-8.5.0  cocci
parisc               randconfig-r2106-20261007    gcc-10.5.0 cocci
parisc               randconfig-r2201-20261007    gcc-8.5.0  smatch
parisc               randconfig-r2303-20261007    gcc-14.3.0 sparse
parisc               randconfig-r2305-20261007    gcc-14     sparse
parisc               randconfig-r2305-20261007    gcc-16.1.0 sparse
parisc               randconfig-r2306-20261007    gcc-11.5.0 sparse
parisc               randconfig-r2309-20261007    clang-24   sparse
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                         fsp2_defconfig    clang-24
powerpc                     ge_imp3a_defconfig    gcc-16.1.0
powerpc                  mpc8313_rdb_defconfig    gcc-16.1.0
powerpc                  mpc832x_rdb_defconfig    clang-24
powerpc                       pmac32_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261007    gcc-15.2.0
powerpc               randconfig-1001-20261007    gcc-15.2.0
powerpc              randconfig-r2101-20261007    gcc-8.5.0  cocci
powerpc              randconfig-r2201-20261007    clang-24   smatch
powerpc              randconfig-r2301-20261007    gcc-14.3.0 sparse
powerpc              randconfig-r2302-20261007    gcc-14     sparse
powerpc              randconfig-r2306-20261007    clang-17   sparse
powerpc              randconfig-r2307-20261007    gcc-11.5.0 sparse
powerpc              randconfig-r2308-20261007    gcc-13.4.0 sparse
powerpc                      tqm8555_defconfig    clang-24
powerpc                  xes_mpc85xx_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261007    gcc-15.2.0
powerpc64             randconfig-1001-20261007    gcc-15.2.0
powerpc64            randconfig-r2103-20261007    gcc-10.5.0 cocci
powerpc64            randconfig-r2200-20261007    clang-24   smatch
powerpc64            randconfig-r2201-20261007    clang-24   smatch
powerpc64            randconfig-r2202-20261007    gcc-10.5.0 smatch
powerpc64            randconfig-r2303-20261007    clang-24   sparse
powerpc64            randconfig-r2305-20261006    gcc-10.5.0 sparse
powerpc64            randconfig-r2306-20261007    gcc-8.5.0  sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261007    clang-24
riscv                 randconfig-1001-20261007    clang-24
riscv                 randconfig-2000-20261006    gcc-16.1.0
riscv                 randconfig-2000-20261007    gcc-12.5.0
riscv                 randconfig-2001-20261006    gcc-16.1.0
riscv                 randconfig-2001-20261007    gcc-12.5.0
riscv                randconfig-r2101-20261007    clang-17   cocci
riscv                randconfig-r2105-20261007    gcc-8.5.0  cocci
riscv                randconfig-r2106-20261007    gcc-8.5.0  cocci
riscv                randconfig-r2201-20261007    clang-24   smatch
riscv                randconfig-r2304-20261006    gcc-10.5.0 sparse
riscv                randconfig-r2304-20261007    gcc-8.5.0  sparse
riscv                randconfig-r2308-20261007    clang-17   sparse
s390                               allnoconfig    clang-24
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261007    clang-24
s390                  randconfig-1001-20261007    clang-24
s390                  randconfig-2000-20261006    gcc-16.1.0
s390                  randconfig-2000-20261007    gcc-12.5.0
s390                  randconfig-2001-20261006    gcc-16.1.0
s390                  randconfig-2001-20261007    gcc-12.5.0
s390                 randconfig-r2101-20261007    clang-20   cocci
s390                 randconfig-r2106-20261007    gcc-8.5.0  cocci
s390                 randconfig-r2302-20261007    gcc-8.5.0  sparse
s390                 randconfig-r2308-20261007    gcc-8.5.0  sparse
s390                 randconfig-r2309-20261007    gcc-8.5.0  sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    gcc-16.1.0
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261007    clang-24
sh                    randconfig-1001-20261007    clang-24
sh                    randconfig-2000-20261006    gcc-16.1.0
sh                    randconfig-2000-20261007    gcc-12.5.0
sh                    randconfig-2001-20261006    gcc-16.1.0
sh                    randconfig-2001-20261007    gcc-12.5.0
sh                   randconfig-r2105-20261007    clang-22   cocci
sh                   randconfig-r2105-20261007    gcc-10.5.0 cocci
sh                   randconfig-r2306-20261007    gcc-8.5.0  sparse
sh                   randconfig-r2307-20261007    gcc-8.5.0  sparse
sh                           rsk7264_defconfig    gcc-16.1.0
sh                           sdk7780_defconfig    gcc-16.1.0
sh                            se7751_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261007    clang-17
sparc                 randconfig-1001-20261007    clang-17
sparc                 randconfig-2000-20261007    clang-24
sparc                 randconfig-2001-20261007    clang-24
sparc                randconfig-r2100-20261007    gcc-8.5.0  cocci
sparc                randconfig-r2102-20261007    gcc-8.5.0  cocci
sparc                randconfig-r2103-20261007    clang-17   cocci
sparc                randconfig-r2105-20261007    gcc-12.5.0 cocci
sparc                randconfig-r2107-20261007    gcc-8.5.0  cocci
sparc                randconfig-r2301-20261007    clang-20   sparse
sparc                randconfig-r2302-20261007    gcc-14.3.0 sparse
sparc                randconfig-r2303-20261006    gcc-10.5.0 sparse
sparc                randconfig-r2303-20261007    gcc-14     sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261007    clang-17
sparc64               randconfig-1001-20261007    clang-17
sparc64               randconfig-2000-20261007    clang-24
sparc64               randconfig-2001-20261007    clang-24
sparc64              randconfig-r2100-20261007    gcc-8.5.0  cocci
sparc64              randconfig-r2102-20261007    gcc-11.5.0 cocci
sparc64              randconfig-r2103-20261007    clang-20   cocci
sparc64              randconfig-r2200-20261007    clang-21   smatch
sparc64              randconfig-r2201-20261007    gcc-16.1.0 smatch
sparc64              randconfig-r2300-20261007    clang-20   sparse
sparc64              randconfig-r2304-20261007    clang-24   sparse
sparc64              randconfig-r2309-20261007    gcc-11.5.0 sparse
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261007    clang-17
um                    randconfig-1001-20261007    clang-17
um                    randconfig-2000-20261007    clang-24
um                    randconfig-2001-20261007    clang-24
um                   randconfig-r2202-20261007    clang-24   smatch
um                   randconfig-r2300-20261007    clang-24   sparse
um                   randconfig-r2301-20261007    gcc-14     sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261007    gcc-14
x86_64      buildonly-randconfig-1001-20261007    gcc-14
x86_64      buildonly-randconfig-1002-20261007    gcc-14
x86_64      buildonly-randconfig-1003-20261007    gcc-14
x86_64      buildonly-randconfig-1004-20261007    gcc-14
x86_64      buildonly-randconfig-1005-20261007    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261007    clang-22
x86_64                randconfig-1001-20261007    clang-22
x86_64                randconfig-1002-20261007    clang-22
x86_64                randconfig-1003-20261007    clang-22
x86_64                randconfig-1004-20261007    clang-22
x86_64                randconfig-1005-20261007    clang-22
x86_64                randconfig-1006-20261007    clang-22
x86_64                randconfig-1007-20261007    clang-22
x86_64                randconfig-1008-20261007    clang-22
x86_64                randconfig-1009-20261007    clang-22
x86_64                randconfig-1010-20261007    clang-22
x86_64                randconfig-1011-20261007    clang-22
x86_64                randconfig-1012-20261007    gcc-12
x86_64                randconfig-1013-20261007    gcc-12
x86_64                randconfig-1014-20261007    gcc-12
x86_64                randconfig-1015-20261007    gcc-12
x86_64                randconfig-1016-20261007    gcc-12
x86_64                randconfig-1017-20261007    gcc-12
x86_64                randconfig-2100-20261007    clang-22   cocci
x86_64                randconfig-2101-20261007    clang-22   cocci
x86_64                randconfig-2102-20261007    clang-22   cocci
x86_64                randconfig-2103-20261007    clang-22   cocci
x86_64                randconfig-2200-20261006    clang-22   smatch
x86_64                randconfig-2200-20261007    gcc-14     smatch
x86_64                randconfig-2300-20261007    clang-22   sparse
x86_64                randconfig-2301-20261007    clang-22   sparse
x86_64                randconfig-2302-20261007    clang-22   sparse
x86_64               randconfig-r2104-20261007    clang-22   cocci
x86_64               randconfig-r2107-20261007    gcc-10.5.0 cocci
x86_64               randconfig-r2202-20261007    clang-22   smatch
x86_64               randconfig-r2308-20261007    clang-24   sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                   audio_kc705_defconfig    gcc-16.1.0
xtensa                randconfig-1000-20261007    clang-17
xtensa                randconfig-1001-20261007    clang-17
xtensa                randconfig-2000-20261007    clang-24
xtensa                randconfig-2001-20261007    clang-24
xtensa               randconfig-r2102-20261007    clang-17   cocci
xtensa               randconfig-r2103-20261007    gcc-8.5.0  cocci
xtensa               randconfig-r2201-20261007    gcc-8.5.0  smatch
xtensa               randconfig-r2300-20261007    gcc-14.3.0 sparse
xtensa               randconfig-r2302-20261007    clang-17   sparse
xtensa               randconfig-r2307-20261007    clang-17   sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
