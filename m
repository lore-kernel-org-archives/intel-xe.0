Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A02CA601E
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 13:00:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4D310E315;
	Fri,  9 Oct 2026 13:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VtihMYnT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C3710E315
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 13:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791550838; x=1823086838;
 h=date:from:to:cc:subject:message-id;
 bh=sxl03u90gTgwbGJD6HXr9k51nHg59jfDtqfMUUcOUDw=;
 b=VtihMYnTySB4I0nZa1vAXyAshYprx6LWj3KK/Z78+Bu6wRS97FZwl0Lp
 BiqPFp5NUL4xy3i4R0Y0DyQjT93SNsFDA32yjVWy0Vf7y+8vIjhLcWY+k
 ShxUkHwpuHkiGEojjyegb7lu2XTv0KgdXlnW/uP+dFeIzq1r2QpNC8pV0
 WnAEGf1v2AfChwS7ihGWkyQx/FBUN002U/8niB08TMroJNxJ1NyEiqTDM
 9h8X58q4RBBvCoYSLC+lgJlTu8Q3w4eDl5CSsKekZbxmfMrnyCEFzGI72
 QGOTH4o64NwesRM0SZOHZaysNSPDjhpk+RsBBQP5cr9crd0vqg0VLfhfC Q==;
X-CSE-ConnectionGUID: gfdoQrEPQ5iWwI+ljfiaFQ==
X-CSE-MsgGUID: d6Byr2EnT7O19/Z4chEFjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="340380"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="340380"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 06:00:28 -0700
X-CSE-ConnectionGUID: etBGqNT2SZeh2tTp1gwCeA==
X-CSE-MsgGUID: cOv/bbCGRdSZJGcIL8IXiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="766704"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 09 Oct 2026 06:00:26 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1xFAD2-000000005oK-0Jdd;
 Fri, 09 Oct 2026 13:00:24 +0000
Date: Fri, 09 Oct 2026 20:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 611857adc9e7b0ee1239a0baf38498922ca5a12e
Message-ID: <202610092026.1mqE4GZK-lkp@intel.com>
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
branch HEAD: 611857adc9e7b0ee1239a0baf38498922ca5a12e  drm/xe/i2c: cancel the client work on remove

elapsed time: 1387m

configs tested: 375
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2100-20261008    gcc-9.5.0  cocci
alpha                randconfig-r2102-20261008    clang-22   cocci
alpha                randconfig-r2102-20261008    gcc-12.5.0 cocci
alpha                randconfig-r2105-20261007    gcc-9.5.0  cocci
alpha                randconfig-r2107-20261008    gcc-8.5.0  cocci
alpha                randconfig-r2202-20261007    gcc-8.5.0  smatch
alpha                randconfig-r2304-20261007    clang-24   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261009    gcc-10.5.0
arc                   randconfig-1001-20261009    gcc-10.5.0
arc                  randconfig-r2102-20261007    clang-24   cocci
arc                  randconfig-r2104-20261008    gcc-8.5.0  cocci
arc                  randconfig-r2300-20261008    clang-24   sparse
arc                  randconfig-r2303-20261008    gcc-10.5.0 sparse
arc                  randconfig-r2304-20261008    clang-24   sparse
arc                  randconfig-r2304-20261008    gcc-16.1.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                          bcm2835_defconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                             mps2_defconfig    clang-24
arm                   randconfig-1000-20261009    gcc-10.5.0
arm                   randconfig-1001-20261009    gcc-10.5.0
arm                   randconfig-1002-20261009    gcc-10.5.0
arm                   randconfig-1003-20261009    gcc-10.5.0
arm                  randconfig-r2101-20261008    gcc-8.5.0  cocci
arm                  randconfig-r2104-20261008    gcc-16.1.0 cocci
arm                  randconfig-r2107-20261008    gcc-16.1.0 cocci
arm                  randconfig-r2107-20261008    gcc-8.5.0  cocci
arm                  randconfig-r2200-20261008    clang-17   smatch
arm                  randconfig-r2201-20261008    gcc-8.5.0  smatch
arm                  randconfig-r2202-20261007    gcc-12.5.0 smatch
arm                  randconfig-r2300-20261007    gcc-14.3.0 sparse
arm                  randconfig-r2300-20261008    gcc-10.5.0 sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261009    gcc-15.2.0
arm64                 randconfig-1001-20261009    gcc-15.2.0
arm64                 randconfig-1002-20261009    gcc-15.2.0
arm64                 randconfig-1003-20261009    gcc-15.2.0
arm64                randconfig-r2304-20261008    gcc-10.5.0 sparse
arm64                randconfig-r2306-20261007    gcc-14     sparse
arm64                randconfig-r2307-20261008    clang-24   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261009    gcc-15.2.0
csky                  randconfig-1001-20261009    gcc-15.2.0
csky                 randconfig-r2106-20261007    gcc-9.5.0  cocci
csky                 randconfig-r2301-20261008    gcc-10.5.0 sparse
csky                 randconfig-r2307-20261008    gcc-8.5.0  sparse
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261009    clang-18
hexagon               randconfig-1001-20261009    clang-18
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261009    clang-22
i386        buildonly-randconfig-1001-20261009    clang-22
i386        buildonly-randconfig-1002-20261009    clang-22
i386        buildonly-randconfig-1003-20261009    clang-22
i386        buildonly-randconfig-1004-20261009    clang-22
i386        buildonly-randconfig-1005-20261009    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261009    clang-22
i386                  randconfig-1001-20261009    clang-22
i386                  randconfig-1002-20261009    clang-22
i386                  randconfig-1003-20261009    clang-22
i386                  randconfig-1004-20261009    clang-22
i386                  randconfig-1005-20261009    clang-22
i386                  randconfig-1006-20261009    clang-22
i386                  randconfig-1007-20261009    clang-22
i386                  randconfig-1008-20261009    clang-22
i386                  randconfig-1009-20261009    clang-22
i386                  randconfig-1010-20261009    clang-22
i386                  randconfig-1011-20261009    clang-22
i386                  randconfig-1012-20261009    clang-22
i386                  randconfig-1013-20261009    clang-22
i386                  randconfig-2100-20261007    clang-22   cocci
i386                  randconfig-2100-20261008    clang-22   cocci
i386                  randconfig-2101-20261007    clang-22   cocci
i386                  randconfig-2101-20261008    clang-22   cocci
i386                  randconfig-2102-20261007    clang-22   cocci
i386                  randconfig-2102-20261008    clang-22   cocci
i386                  randconfig-2103-20261007    clang-22   cocci
i386                  randconfig-2103-20261008    clang-22   cocci
i386                  randconfig-2200-20261007    gcc-14     smatch
i386                  randconfig-2200-20261008    clang-22   smatch
i386                  randconfig-2300-20261007    clang-22   sparse
i386                  randconfig-2300-20261008    clang-22   sparse
i386                  randconfig-2301-20261007    clang-22   sparse
i386                  randconfig-2301-20261008    clang-22   sparse
i386                  randconfig-2302-20261007    clang-22   sparse
i386                  randconfig-2302-20261008    clang-22   sparse
i386                 randconfig-r2101-20261008    clang-22   cocci
i386                 randconfig-r2300-20261008    gcc-10.5.0 sparse
i386                 randconfig-r2302-20261008    gcc-16.1.0 sparse
i386                 randconfig-r2304-20261008    gcc-13.4.0 sparse
i386                 randconfig-r2307-20261008    gcc-14     sparse
i386                 randconfig-r2309-20261007    gcc-14     sparse
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261009    clang-18
loongarch             randconfig-1001-20261009    clang-18
loongarch            randconfig-r2100-20261007    clang-24   cocci
loongarch            randconfig-r2100-20261008    gcc-12.5.0 cocci
loongarch            randconfig-r2101-20261008    gcc-9.5.0  cocci
loongarch            randconfig-r2307-20261008    clang-24   sparse
loongarch            randconfig-r2308-20261008    gcc-14.3.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                           hp300_defconfig    clang-24
m68k                 randconfig-r2105-20261008    gcc-8.5.0  cocci
m68k                 randconfig-r2200-20261008    gcc-16.1.0 smatch
m68k                 randconfig-r2202-20261008    gcc-8.5.0  smatch
m68k                 randconfig-r2300-20261008    gcc-13.4.0 sparse
m68k                 randconfig-r2302-20261007    clang-24   sparse
m68k                 randconfig-r2305-20261007    gcc-14.3.0 sparse
m68k                 randconfig-r2309-20261008    gcc-14     sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2102-20261008    clang-24   cocci
microblaze           randconfig-r2103-20261008    gcc-12.5.0 cocci
microblaze           randconfig-r2105-20261007    gcc-9.5.0  cocci
microblaze           randconfig-r2301-20261008    gcc-16.1.0 sparse
microblaze           randconfig-r2304-20261007    gcc-14.3.0 sparse
microblaze           randconfig-r2305-20261008    gcc-10.5.0 sparse
microblaze           randconfig-r2305-20261008    gcc-16.1.0 sparse
microblaze           randconfig-r2308-20261008    gcc-14     sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                         bcm63xx_defconfig    clang-24
mips                            ci20_defconfig    gcc-16.1.0
mips                 randconfig-r2107-20261008    gcc-16.1.0 cocci
mips                 randconfig-r2202-20261008    gcc-15.2.0 smatch
mips                 randconfig-r2301-20261008    gcc-10.5.0 sparse
mips                 randconfig-r2306-20261008    clang-24   sparse
nios2                             alldefconfig    clang-24
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261009    clang-18
nios2                 randconfig-1001-20261009    clang-18
nios2                randconfig-r2102-20261008    gcc-9.5.0  cocci
nios2                randconfig-r2103-20261008    gcc-12.5.0 cocci
nios2                randconfig-r2104-20261008    gcc-8.5.0  cocci
nios2                randconfig-r2301-20261007    gcc-14.3.0 sparse
nios2                randconfig-r2301-20261008    clang-24   sparse
nios2                randconfig-r2302-20261008    gcc-10.5.0 sparse
nios2                randconfig-r2305-20261007    clang-24   sparse
nios2                randconfig-r2305-20261008    gcc-10.5.0 sparse
nios2                randconfig-r2306-20261008    gcc-8.5.0  sparse
nios2                randconfig-r2307-20261007    gcc-14     sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2101-20261007    clang-24   cocci
openrisc             randconfig-r2101-20261008    gcc-12.5.0 cocci
openrisc             randconfig-r2104-20261007    gcc-9.5.0  cocci
openrisc             randconfig-r2104-20261008    gcc-16.1.0 cocci
openrisc             randconfig-r2202-20261008    gcc-15.2.0 smatch
openrisc             randconfig-r2301-20261007    clang-24   sparse
openrisc             randconfig-r2305-20261008    clang-24   sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261009    gcc-8.5.0
parisc                randconfig-1001-20261009    gcc-8.5.0
parisc               randconfig-r2200-20261008    gcc-13.4.0 smatch
parisc               randconfig-r2300-20261008    gcc-16.1.0 sparse
parisc               randconfig-r2301-20261008    gcc-13.4.0 sparse
parisc               randconfig-r2302-20261007    gcc-14.3.0 sparse
parisc               randconfig-r2305-20261008    gcc-13.4.0 sparse
parisc               randconfig-r2309-20261008    clang-24   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                     amigaone_defconfig    gcc-16.1.0
powerpc                       chrp32_defconfig    clang-24
powerpc                        holly_defconfig    clang-24
powerpc               randconfig-1000-20261009    gcc-8.5.0
powerpc               randconfig-1001-20261009    gcc-8.5.0
powerpc              randconfig-r2105-20261008    gcc-16.1.0 cocci
powerpc64             randconfig-1000-20261009    gcc-8.5.0
powerpc64             randconfig-1001-20261009    gcc-8.5.0
powerpc64            randconfig-r2103-20261008    clang-22   cocci
powerpc64            randconfig-r2105-20261008    gcc-8.5.0  cocci
powerpc64            randconfig-r2201-20261007    clang-24   smatch
powerpc64            randconfig-r2300-20261007    clang-24   sparse
powerpc64            randconfig-r2303-20261008    clang-24   sparse
powerpc64            randconfig-r2308-20261007    gcc-14     sparse
riscv                             alldefconfig    gcc-16.1.0
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261009    gcc-16.1.0
riscv                 randconfig-1001-20261009    gcc-16.1.0
riscv                 randconfig-2000-20261007    gcc-12.5.0
riscv                 randconfig-2000-20261008    gcc-11.5.0
riscv                 randconfig-2001-20261007    gcc-12.5.0
riscv                 randconfig-2001-20261008    gcc-11.5.0
riscv                randconfig-r2101-20261008    clang-24   cocci
riscv                randconfig-r2103-20261008    gcc-8.5.0  cocci
riscv                randconfig-r2104-20261007    gcc-9.5.0  cocci
riscv                randconfig-r2106-20261008    gcc-8.5.0  cocci
riscv                randconfig-r2201-20261007    clang-24   smatch
riscv                randconfig-r2307-20261008    clang-24   sparse
riscv                randconfig-r2308-20261008    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261009    gcc-16.1.0
s390                  randconfig-1001-20261009    gcc-16.1.0
s390                  randconfig-2000-20261007    gcc-12.5.0
s390                  randconfig-2000-20261008    gcc-11.5.0
s390                  randconfig-2001-20261007    gcc-12.5.0
s390                  randconfig-2001-20261008    gcc-11.5.0
s390                 randconfig-r2100-20261008    clang-24   cocci
s390                 randconfig-r2107-20261008    gcc-8.5.0  cocci
s390                 randconfig-r2201-20261008    gcc-11.5.0 smatch
s390                 randconfig-r2202-20261008    clang-17   smatch
s390                 randconfig-r2302-20261008    clang-24   sparse
s390                 randconfig-r2306-20261008    gcc-14.3.0 sparse
s390                 randconfig-r2309-20261008    clang-24   sparse
s390                 randconfig-r2309-20261008    gcc-14.3.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                  kfr2r09-romimage_defconfig    clang-24
sh                    randconfig-1000-20261009    gcc-16.1.0
sh                    randconfig-1001-20261009    gcc-16.1.0
sh                    randconfig-2000-20261007    gcc-12.5.0
sh                    randconfig-2000-20261008    gcc-11.5.0
sh                    randconfig-2001-20261007    gcc-12.5.0
sh                    randconfig-2001-20261008    gcc-11.5.0
sh                   randconfig-r2200-20261008    gcc-16.1.0 smatch
sh                   randconfig-r2302-20261008    gcc-13.4.0 sparse
sh                   randconfig-r2303-20261008    gcc-16.1.0 sparse
sh                   randconfig-r2306-20261008    clang-24   sparse
sh                   randconfig-r2308-20261008    clang-24   sparse
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261009    clang-18
sparc                 randconfig-1001-20261009    clang-18
sparc                 randconfig-2000-20261007    clang-24
sparc                 randconfig-2000-20261008    gcc-14
sparc                 randconfig-2001-20261007    clang-24
sparc                 randconfig-2001-20261008    gcc-14
sparc                randconfig-r2103-20261008    clang-24   cocci
sparc                randconfig-r2104-20261008    gcc-8.5.0  cocci
sparc                randconfig-r2105-20261008    gcc-8.5.0  cocci
sparc                randconfig-r2106-20261008    gcc-16.1.0 cocci
sparc                randconfig-r2201-20261008    gcc-8.5.0  smatch
sparc                randconfig-r2303-20261007    clang-24   sparse
sparc                randconfig-r2303-20261008    gcc-13.4.0 sparse
sparc                randconfig-r2304-20261008    gcc-10.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261009    clang-18
sparc64               randconfig-1001-20261009    clang-18
sparc64               randconfig-2000-20261007    clang-24
sparc64               randconfig-2000-20261008    gcc-14
sparc64               randconfig-2001-20261007    clang-24
sparc64               randconfig-2001-20261008    gcc-14
sparc64              randconfig-r2100-20261008    clang-22   cocci
sparc64              randconfig-r2100-20261008    gcc-8.5.0  cocci
sparc64              randconfig-r2102-20261008    gcc-12.5.0 cocci
sparc64              randconfig-r2102-20261008    gcc-8.5.0  cocci
sparc64              randconfig-r2103-20261007    clang-24   cocci
sparc64              randconfig-r2106-20261007    gcc-9.5.0  cocci
sparc64              randconfig-r2106-20261008    gcc-16.1.0 cocci
sparc64              randconfig-r2107-20261007    gcc-9.5.0  cocci
sparc64              randconfig-r2308-20261008    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261009    clang-18
um                    randconfig-1001-20261009    clang-18
um                    randconfig-2000-20261007    clang-24
um                    randconfig-2000-20261008    gcc-14
um                    randconfig-2001-20261007    clang-24
um                    randconfig-2001-20261008    gcc-14
um                   randconfig-r2101-20261008    gcc-12.5.0 cocci
um                   randconfig-r2105-20261008    gcc-16.1.0 cocci
um                   randconfig-r2107-20261007    gcc-9.5.0  cocci
um                   randconfig-r2200-20261008    clang-17   smatch
um                   randconfig-r2201-20261008    clang-24   smatch
um                   randconfig-r2202-20261008    clang-17   smatch
um                   randconfig-r2303-20261007    gcc-14.3.0 sparse
um                   randconfig-r2306-20261008    clang-24   sparse
um                   randconfig-r2307-20261008    gcc-14.3.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261009    clang-22
x86_64      buildonly-randconfig-1001-20261009    clang-22
x86_64      buildonly-randconfig-1002-20261009    clang-22
x86_64      buildonly-randconfig-1003-20261009    clang-22
x86_64      buildonly-randconfig-1004-20261009    clang-22
x86_64      buildonly-randconfig-1005-20261009    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261009    gcc-14
x86_64                randconfig-1001-20261009    gcc-14
x86_64                randconfig-1002-20261009    gcc-14
x86_64                randconfig-1003-20261009    gcc-14
x86_64                randconfig-1004-20261009    gcc-14
x86_64                randconfig-1005-20261009    gcc-14
x86_64                randconfig-1012-20261009    gcc-14
x86_64                randconfig-1013-20261009    gcc-14
x86_64                randconfig-1014-20261009    gcc-14
x86_64                randconfig-1015-20261009    gcc-14
x86_64                randconfig-1016-20261009    gcc-14
x86_64                randconfig-1017-20261009    gcc-14
x86_64                randconfig-2100-20261007    clang-22   cocci
x86_64                randconfig-2100-20261008    clang-22   cocci
x86_64                randconfig-2101-20261007    clang-22   cocci
x86_64                randconfig-2101-20261008    clang-22   cocci
x86_64                randconfig-2102-20261007    clang-22   cocci
x86_64                randconfig-2102-20261008    clang-22   cocci
x86_64                randconfig-2103-20261007    clang-22   cocci
x86_64                randconfig-2103-20261008    clang-22   cocci
x86_64                randconfig-2200-20261007    gcc-14     smatch
x86_64                randconfig-2200-20261008    gcc-14     smatch
x86_64                randconfig-2300-20261007    clang-22   sparse
x86_64                randconfig-2300-20261008    clang-22   sparse
x86_64                randconfig-2301-20261007    clang-22   sparse
x86_64                randconfig-2301-20261008    clang-22   sparse
x86_64                randconfig-2302-20261007    clang-22   sparse
x86_64                randconfig-2302-20261008    clang-22   sparse
x86_64               randconfig-r2103-20261008    gcc-9.5.0  cocci
x86_64               randconfig-r2303-20261008    gcc-10.5.0 sparse
x86_64               randconfig-r2306-20261008    gcc-14     sparse
x86_64               randconfig-r2309-20261008    gcc-8.5.0  sparse
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
xtensa                randconfig-1000-20261009    clang-18
xtensa                randconfig-1001-20261009    clang-18
xtensa                randconfig-2000-20261007    clang-24
xtensa                randconfig-2000-20261008    gcc-14
xtensa                randconfig-2001-20261007    clang-24
xtensa                randconfig-2001-20261008    gcc-14
xtensa               randconfig-r2106-20261008    gcc-8.5.0  cocci
xtensa               randconfig-r2201-20261008    gcc-13.4.0 smatch
xtensa               randconfig-r2308-20261008    gcc-8.5.0  sparse
xtensa               randconfig-r2309-20261008    clang-24   sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
