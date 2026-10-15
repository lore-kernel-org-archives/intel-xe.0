Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0246ECC6B33
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 13:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CB510EC06;
	Thu, 15 Oct 2026 13:39:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EB510EC06
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 13:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792071571; x=1823607571;
 h=date:from:to:cc:subject:message-id;
 bh=oa5xKRQsD6V82+X6ardK9JnoR5wMSTCaayD2YI1hUFA=;
 b=OUG66GZJhHWgkqviCruQ8nZ/dbvEcOpNp1qjXkErrRRa6cynTT/dmwEG
 Tgamp3nSyRaPcMM8s2w4xZehROdjkxPqtLe7tWYp90R5ngEab2gJNJSrv
 vJoNmE09ElhnZ357o8HuLNatnRkUCqG/FGF5IiEalRQ+FHzrSKMZyGTzR
 82HJo9QwhYfT6UQRwwgOI6LZRvM2en9yQi7aHBW9FXaNZfa3vZGeyNC3B
 HAw5xBdT1+Cqh5f8NmeWd4Fw2B+bZ8fHZw2SoMHJHGNE2mbTJpIYirwBK
 Ro12gIqIKex7vPcs46tAv3gwAJg/AsW8SacdAlNE3rZTBmpea7dLarnaJ A==;
X-CSE-ConnectionGUID: toeNdlM4TgW0RIv7RwqB4Q==
X-CSE-MsgGUID: YTTwCrRuQJCSYTZadDRhIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="745281"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="745281"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 06:39:30 -0700
X-CSE-ConnectionGUID: 3ZAsV/XVTmORy0uvK3FW+A==
X-CSE-MsgGUID: R2gldYqGS6aQ/RD71KUmkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1605361"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 15 Oct 2026 06:39:29 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1xHLg6-00000000GaI-3ki3;
 Thu, 15 Oct 2026 13:39:26 +0000
Date: Thu, 15 Oct 2026 21:39:00 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 f7f8e453bef8ea29ae3615e5308eb2d4c250545d
Message-ID: <202610152157.zT83XvTs-lkp@intel.com>
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
branch HEAD: f7f8e453bef8ea29ae3615e5308eb2d4c250545d  drm/xe/uc: Add missing HuC firmware entry for Alderlake-N

elapsed time: 2616m

configs tested: 425
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    clang-20
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2100-20261014    gcc-8.5.0  cocci
alpha                randconfig-r2104-20261013    clang-22   cocci
alpha                randconfig-r2106-20261013    clang-22   cocci
alpha                randconfig-r2308-20261014    gcc-14.3.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    clang-20
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                             hsdk_defconfig    clang-24
arc                  nsimosci_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-1000-20261015    clang-24
arc                   randconfig-1001-20261015    clang-24
arc                   randconfig-2000-20261013    gcc-8.5.0
arc                   randconfig-2000-20261014    gcc-10.5.0
arc                   randconfig-2001-20261013    gcc-8.5.0
arc                   randconfig-2001-20261014    gcc-10.5.0
arc                  randconfig-r2102-20261014    gcc-8.5.0  cocci
arc                  randconfig-r2105-20261014    gcc-11.5.0 cocci
arc                  randconfig-r2107-20261013    clang-22   cocci
arc                  randconfig-r2300-20261013    gcc-8.5.0  sparse
arc                  randconfig-r2306-20261014    gcc-8.5.0  sparse
arc                  randconfig-r2307-20261014    gcc-8.5.0  sparse
arm                                allnoconfig    clang-20
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                      am200epdkit_defconfig    gcc-16.1.0
arm                          bcm2835_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                          mv78xx0_defconfig    gcc-16.1.0
arm                              mxs_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261015    clang-24
arm                   randconfig-1001-20261015    clang-24
arm                   randconfig-1002-20261015    clang-24
arm                   randconfig-1003-20261015    clang-24
arm                   randconfig-2000-20261013    gcc-8.5.0
arm                   randconfig-2000-20261014    gcc-10.5.0
arm                   randconfig-2001-20261013    gcc-8.5.0
arm                   randconfig-2001-20261014    gcc-10.5.0
arm                          socfpga_defconfig    gcc-16.1.0
arm                         vexpress_defconfig    gcc-16.1.0
arm64                             alldefconfig    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    clang-20
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261015    gcc-8.5.0
arm64                 randconfig-1001-20261015    gcc-8.5.0
arm64                 randconfig-1002-20261015    gcc-8.5.0
arm64                 randconfig-1003-20261015    gcc-8.5.0
arm64                 randconfig-2000-20261013    gcc-9.5.0
arm64                 randconfig-2000-20261014    gcc-16.1.0
arm64                 randconfig-2001-20261013    gcc-9.5.0
arm64                 randconfig-2001-20261014    gcc-16.1.0
arm64                randconfig-r2101-20261014    gcc-11.5.0 cocci
arm64                randconfig-r2104-20261014    gcc-10.5.0 cocci
arm64                randconfig-r2105-20261014    gcc-8.5.0  cocci
arm64                randconfig-r2109-20261014    gcc-15.2.0 cocci
arm64                randconfig-r2305-20261014    clang-24   sparse
arm64                randconfig-r2306-20261013    gcc-10.5.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    clang-20
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261015    gcc-8.5.0
csky                  randconfig-1001-20261015    gcc-8.5.0
csky                  randconfig-2000-20261013    gcc-9.5.0
csky                  randconfig-2000-20261014    gcc-16.1.0
csky                  randconfig-2001-20261013    gcc-9.5.0
csky                  randconfig-2001-20261014    gcc-16.1.0
csky                 randconfig-r2101-20261014    gcc-15.2.0 cocci
csky                 randconfig-r2104-20261014    gcc-11.5.0 cocci
csky                 randconfig-r2106-20261014    gcc-10.5.0 cocci
csky                 randconfig-r2107-20261014    gcc-11.5.0 cocci
csky                 randconfig-r2201-20261014    gcc-14.3.0 smatch
csky                 randconfig-r2302-20261014    clang-24   sparse
csky                 randconfig-r2309-20261014    gcc-14.3.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    clang-20
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261015    clang-24
hexagon               randconfig-1001-20261015    clang-24
hexagon               randconfig-2000-20261013    gcc-9.5.0
hexagon               randconfig-2000-20261014    gcc-16.1.0
hexagon               randconfig-2001-20261013    gcc-9.5.0
hexagon               randconfig-2001-20261014    gcc-16.1.0
hexagon              randconfig-r2101-20261013    clang-24   cocci
hexagon              randconfig-r2103-20261013    clang-24   cocci
hexagon              randconfig-r2103-20261014    gcc-11.5.0 cocci
hexagon              randconfig-r2304-20261014    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    clang-20
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261015    gcc-14
i386        buildonly-randconfig-1001-20261015    gcc-14
i386        buildonly-randconfig-1002-20261015    gcc-14
i386        buildonly-randconfig-1003-20261015    gcc-14
i386        buildonly-randconfig-1004-20261015    gcc-14
i386        buildonly-randconfig-1005-20261015    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261015    gcc-14
i386                  randconfig-1001-20261015    gcc-14
i386                  randconfig-1002-20261015    gcc-14
i386                  randconfig-1003-20261015    gcc-14
i386                  randconfig-1004-20261015    gcc-14
i386                  randconfig-1005-20261015    gcc-14
i386                  randconfig-1006-20261015    gcc-14
i386                  randconfig-1007-20261015    clang-22
i386                  randconfig-1008-20261015    clang-22
i386                  randconfig-1009-20261015    clang-22
i386                  randconfig-1010-20261015    clang-22
i386                  randconfig-1011-20261015    clang-22
i386                  randconfig-1012-20261015    clang-22
i386                  randconfig-1013-20261015    clang-22
i386                  randconfig-2000-20261013    gcc-8.5.0
i386                  randconfig-2000-20261014    gcc-10.5.0
i386                  randconfig-2001-20261013    gcc-8.5.0
i386                  randconfig-2001-20261014    gcc-10.5.0
i386                  randconfig-2100-20261013    gcc-14     cocci
i386                  randconfig-2100-20261014    gcc-13     cocci
i386                  randconfig-2101-20261013    gcc-14     cocci
i386                  randconfig-2101-20261014    gcc-13     cocci
i386                  randconfig-2102-20261013    gcc-14     cocci
i386                  randconfig-2102-20261014    gcc-13     cocci
i386                  randconfig-2103-20261013    gcc-14     cocci
i386                  randconfig-2103-20261014    gcc-13     cocci
i386                  randconfig-2104-20261013    gcc-14     cocci
i386                  randconfig-2104-20261014    gcc-13     cocci
i386                  randconfig-2105-20261013    gcc-14     cocci
i386                  randconfig-2105-20261014    gcc-13     cocci
i386                  randconfig-2200-20261013    gcc-14     smatch
i386                  randconfig-2200-20261014    clang-22   smatch
i386                  randconfig-2300-20261013    gcc-14     sparse
i386                  randconfig-2300-20261014    clang-22   sparse
i386                  randconfig-2301-20261013    gcc-14     sparse
i386                  randconfig-2301-20261014    clang-22   sparse
i386                  randconfig-2302-20261013    gcc-14     sparse
i386                  randconfig-2302-20261014    clang-22   sparse
i386                 randconfig-r2102-20261013    clang-24   cocci
i386                 randconfig-r2110-20261014    gcc-10.5.0 cocci
i386                 randconfig-r2111-20261013    clang-22   cocci
i386                 randconfig-r2111-20261014    gcc-8.5.0  cocci
i386                 randconfig-r2300-20261014    clang-24   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    clang-20
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261015    clang-24
loongarch             randconfig-1001-20261015    clang-24
loongarch             randconfig-2000-20261013    gcc-11.5.0
loongarch             randconfig-2000-20261014    gcc-8.5.0
loongarch             randconfig-2001-20261013    gcc-11.5.0
loongarch             randconfig-2001-20261014    gcc-8.5.0
loongarch            randconfig-r2104-20261014    gcc-8.5.0  cocci
loongarch            randconfig-r2111-20261014    gcc-10.5.0 cocci
loongarch            randconfig-r2201-20261013    clang-24   smatch
loongarch            randconfig-r2305-20261014    clang-24   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    clang-20
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2107-20261014    gcc-10.5.0 cocci
m68k                 randconfig-r2108-20261014    gcc-15.2.0 cocci
m68k                 randconfig-r2200-20261014    gcc-9.5.0  smatch
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2101-20261014    gcc-8.5.0  cocci
microblaze           randconfig-r2105-20261014    gcc-10.5.0 cocci
microblaze           randconfig-r2310-20261014    gcc-14.3.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                        bmips_be_defconfig    gcc-16.1.0
mips                            ip28_defconfig    gcc-16.1.0
mips                       loongson1_defconfig    clang-24
mips                            mtx1_defconfig    gcc-16.1.0
mips                 randconfig-r2103-20261014    gcc-8.5.0  cocci
mips                 randconfig-r2201-20261014    clang-24   smatch
mips                 randconfig-r2301-20261013    gcc-8.5.0  sparse
mips                 randconfig-r2301-20261014    clang-24   sparse
mips                 randconfig-r2302-20261013    gcc-8.5.0  sparse
mips                 randconfig-r2307-20261014    gcc-14     sparse
mips                 randconfig-r2307-20261014    gcc-14.3.0 sparse
mips                 randconfig-r2310-20261013    gcc-10.5.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261015    clang-24
nios2                 randconfig-1001-20261015    clang-24
nios2                 randconfig-2000-20261013    gcc-11.5.0
nios2                 randconfig-2000-20261014    gcc-8.5.0
nios2                 randconfig-2001-20261013    gcc-11.5.0
nios2                 randconfig-2001-20261014    gcc-8.5.0
nios2                randconfig-r2102-20261014    gcc-11.5.0 cocci
nios2                randconfig-r2110-20261014    gcc-11.5.0 cocci
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2100-20261013    clang-24   cocci
openrisc             randconfig-r2108-20261014    gcc-11.5.0 cocci
openrisc             randconfig-r2302-20261014    clang-24   sparse
openrisc                        virt_defconfig    clang-24
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261015    gcc-8.5.0
parisc                randconfig-1001-20261015    gcc-8.5.0
parisc                randconfig-2000-20261013    gcc-11.5.0
parisc                randconfig-2000-20261014    gcc-8.5.0
parisc                randconfig-2001-20261013    gcc-11.5.0
parisc                randconfig-2001-20261014    gcc-8.5.0
parisc               randconfig-r2108-20261013    clang-24   cocci
parisc               randconfig-r2108-20261014    gcc-8.5.0  cocci
parisc               randconfig-r2202-20261014    gcc-12.5.0 smatch
parisc               randconfig-r2311-20261013    gcc-10.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                    currituck_defconfig    clang-24
powerpc                        ebony_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261015    gcc-8.5.0
powerpc               randconfig-1001-20261015    gcc-8.5.0
powerpc               randconfig-2000-20261013    gcc-14
powerpc               randconfig-2000-20261014    clang-22
powerpc               randconfig-2001-20261013    gcc-14
powerpc               randconfig-2001-20261014    clang-22
powerpc              randconfig-r2100-20261014    gcc-15.2.0 cocci
powerpc              randconfig-r2107-20261014    gcc-8.5.0  cocci
powerpc              randconfig-r2110-20261013    clang-22   cocci
powerpc              randconfig-r2300-20261014    clang-24   sparse
powerpc              randconfig-r2304-20261014    clang-24   sparse
powerpc              randconfig-r2305-20261013    gcc-8.5.0  sparse
powerpc              randconfig-r2308-20261014    gcc-8.5.0  sparse
powerpc              randconfig-r2310-20261014    gcc-8.5.0  sparse
powerpc                      tqm8548_defconfig    clang-24
powerpc64             randconfig-1000-20261015    gcc-8.5.0
powerpc64             randconfig-1001-20261015    gcc-8.5.0
powerpc64             randconfig-2000-20261013    gcc-14
powerpc64             randconfig-2000-20261014    clang-22
powerpc64             randconfig-2001-20261013    gcc-14
powerpc64             randconfig-2001-20261014    clang-22
powerpc64            randconfig-r2301-20261014    clang-24   sparse
powerpc64            randconfig-r2306-20261014    gcc-14.3.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261015    gcc-11.5.0
riscv                 randconfig-1001-20261015    gcc-11.5.0
riscv                 randconfig-2000-20261013    gcc-15.2.0
riscv                 randconfig-2000-20261014    gcc-16.1.0
riscv                 randconfig-2001-20261013    gcc-15.2.0
riscv                 randconfig-2001-20261014    gcc-16.1.0
riscv                randconfig-r2111-20261014    gcc-11.5.0 cocci
riscv                randconfig-r2308-20261013    gcc-10.5.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261015    gcc-11.5.0
s390                  randconfig-1001-20261015    gcc-11.5.0
s390                  randconfig-2000-20261013    gcc-15.2.0
s390                  randconfig-2000-20261014    gcc-16.1.0
s390                  randconfig-2001-20261013    gcc-15.2.0
s390                  randconfig-2001-20261014    gcc-16.1.0
s390                 randconfig-r2103-20261014    gcc-15.2.0 cocci
s390                 randconfig-r2106-20261014    gcc-8.5.0  cocci
s390                 randconfig-r2109-20261013    clang-24   cocci
s390                 randconfig-r2200-20261014    gcc-8.5.0  smatch
s390                 randconfig-r2304-20261013    gcc-8.5.0  sparse
s390                 randconfig-r2307-20261013    gcc-10.5.0 sparse
s390                 randconfig-r2311-20261014    gcc-14.3.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                         apsh4ad0a_defconfig    gcc-16.1.0
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261015    gcc-11.5.0
sh                    randconfig-1001-20261015    gcc-11.5.0
sh                    randconfig-2000-20261013    gcc-15.2.0
sh                    randconfig-2000-20261014    gcc-16.1.0
sh                    randconfig-2001-20261013    gcc-15.2.0
sh                    randconfig-2001-20261014    gcc-16.1.0
sh                   randconfig-r2201-20261014    gcc-11.5.0 smatch
sh                   randconfig-r2309-20261014    gcc-8.5.0  sparse
sh                   randconfig-r2311-20261014    gcc-14     sparse
sh                   randconfig-r2311-20261014    gcc-8.5.0  sparse
sh                            se7722_defconfig    clang-24
sh                         sh7763rdp_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261015    gcc-8.5.0
sparc                 randconfig-1001-20261015    gcc-8.5.0
sparc                 randconfig-2000-20261013    gcc-16.1.0
sparc                 randconfig-2000-20261014    gcc-14.3.0
sparc                 randconfig-2001-20261013    gcc-16.1.0
sparc                 randconfig-2001-20261014    gcc-14.3.0
sparc                randconfig-r2110-20261014    gcc-8.5.0  cocci
sparc                randconfig-r2303-20261013    gcc-8.5.0  sparse
sparc                randconfig-r2303-20261014    clang-24   sparse
sparc                randconfig-r2304-20261014    clang-24   sparse
sparc                randconfig-r2309-20261014    gcc-14     sparse
sparc                        sparc32_defconfig    gcc-16.1.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261015    gcc-8.5.0
sparc64               randconfig-1001-20261015    gcc-8.5.0
sparc64               randconfig-2000-20261013    gcc-16.1.0
sparc64               randconfig-2000-20261014    gcc-14.3.0
sparc64               randconfig-2001-20261013    gcc-16.1.0
sparc64               randconfig-2001-20261014    gcc-14.3.0
sparc64              randconfig-r2200-20261013    clang-24   smatch
sparc64              randconfig-r2310-20261014    gcc-14     sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    clang-24
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261015    gcc-8.5.0
um                    randconfig-1001-20261015    gcc-8.5.0
um                    randconfig-2000-20261013    gcc-16.1.0
um                    randconfig-2000-20261014    gcc-14.3.0
um                    randconfig-2001-20261013    gcc-16.1.0
um                    randconfig-2001-20261014    gcc-14.3.0
um                   randconfig-r2102-20261014    gcc-15.2.0 cocci
um                   randconfig-r2109-20261014    gcc-8.5.0  cocci
um                   randconfig-r2302-20261014    clang-24   sparse
um                   randconfig-r2303-20261014    clang-24   sparse
um                   randconfig-r2308-20261014    gcc-14     sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261015    gcc-14
x86_64      buildonly-randconfig-1001-20261015    gcc-14
x86_64      buildonly-randconfig-1002-20261015    gcc-14
x86_64      buildonly-randconfig-1003-20261015    gcc-14
x86_64      buildonly-randconfig-1004-20261015    gcc-14
x86_64      buildonly-randconfig-1005-20261015    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261015    gcc-14
x86_64                randconfig-1001-20261015    gcc-14
x86_64                randconfig-1002-20261015    gcc-14
x86_64                randconfig-1003-20261015    gcc-14
x86_64                randconfig-1004-20261015    gcc-14
x86_64                randconfig-1005-20261015    gcc-14
x86_64                randconfig-1006-20261015    gcc-14
x86_64                randconfig-1007-20261015    gcc-14
x86_64                randconfig-1008-20261015    gcc-14
x86_64                randconfig-1009-20261015    gcc-14
x86_64                randconfig-1010-20261015    gcc-14
x86_64                randconfig-1011-20261015    gcc-14
x86_64                randconfig-1012-20261015    gcc-13
x86_64                randconfig-1013-20261015    gcc-13
x86_64                randconfig-1014-20261015    gcc-13
x86_64                randconfig-1015-20261015    gcc-13
x86_64                randconfig-1016-20261015    gcc-13
x86_64                randconfig-1017-20261015    gcc-13
x86_64                randconfig-2000-20261013    gcc-14
x86_64                randconfig-2000-20261014    clang-22
x86_64                randconfig-2001-20261013    gcc-14
x86_64                randconfig-2001-20261014    clang-22
x86_64                randconfig-2100-20261013    clang-22   cocci
x86_64                randconfig-2100-20261014    clang-22   cocci
x86_64                randconfig-2101-20261013    clang-22   cocci
x86_64                randconfig-2101-20261014    clang-22   cocci
x86_64                randconfig-2102-20261013    clang-22   cocci
x86_64                randconfig-2102-20261014    clang-22   cocci
x86_64                randconfig-2103-20261013    clang-22   cocci
x86_64                randconfig-2103-20261014    clang-22   cocci
x86_64                randconfig-2104-20261013    clang-22   cocci
x86_64                randconfig-2104-20261014    clang-22   cocci
x86_64                randconfig-2105-20261013    clang-22   cocci
x86_64                randconfig-2105-20261014    clang-22   cocci
x86_64                randconfig-2200-20261013    gcc-13     smatch
x86_64                randconfig-2200-20261014    clang-22   smatch
x86_64                randconfig-2300-20261013    gcc-14     sparse
x86_64                randconfig-2300-20261014    clang-22   sparse
x86_64                randconfig-2301-20261013    gcc-14     sparse
x86_64                randconfig-2301-20261014    clang-22   sparse
x86_64                randconfig-2302-20261013    gcc-14     sparse
x86_64                randconfig-2302-20261014    clang-22   sparse
x86_64               randconfig-r2106-20261014    gcc-11.5.0 cocci
x86_64               randconfig-r2109-20261014    gcc-11.5.0 cocci
x86_64               randconfig-r2200-20261014    gcc-14     smatch
x86_64               randconfig-r2202-20261013    gcc-14     smatch
x86_64               randconfig-r2202-20261014    clang-22   smatch
x86_64               randconfig-r2306-20261014    gcc-14     sparse
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
xtensa                randconfig-1000-20261015    gcc-8.5.0
xtensa                randconfig-1001-20261015    gcc-8.5.0
xtensa                randconfig-2000-20261013    gcc-16.1.0
xtensa                randconfig-2000-20261014    gcc-14.3.0
xtensa                randconfig-2001-20261013    gcc-16.1.0
xtensa                randconfig-2001-20261014    gcc-14.3.0
xtensa               randconfig-r2100-20261014    gcc-11.5.0 cocci
xtensa               randconfig-r2105-20261013    clang-22   cocci
xtensa               randconfig-r2202-20261014    gcc-14.3.0 smatch
xtensa               randconfig-r2303-20261014    clang-24   sparse
xtensa               randconfig-r2309-20261013    gcc-10.5.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
