Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18035C9831E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 23:54:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DA110E558;
	Thu, 24 Sep 2026 23:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MVzeiKQA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAAB10E558
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 23:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790294072; x=1821830072;
 h=date:from:to:cc:subject:message-id;
 bh=9DkieYKAddXBXW893etnSiIGy/ShN5xr99rRDvzvG40=;
 b=MVzeiKQA4U3f5hsjb1Q5cSEW8hfMwCo5vkFwtjcD5WOoAfjJcSxnlns+
 o0YxjuO40AuY5qU22fxUpU9R+xAcS+8Pfb+rvBcms7LeKiF1QK0ofLp0s
 da7ywo28geG4jvNX/Taww2XNhfndBsHMnUsyAxK7lYCWqDdXyvQTHHAAN
 /unRrleBGktA/AcSB54KjFh8S+Od9H0AvdOU9mpBFaM+aZLBsr5Cnpcec
 qfpc1JP22dLWOkGlT4gwi+xQ9uQwg5uB9ToV0cvGQknFCZFN9vbowLjn7
 JbiEoL5lYbgmL0CThwhDkiK/tip9XRQbbHUTtnO5PouaxOY+idBpom7AF A==;
X-CSE-ConnectionGUID: vdtnzTQhTyisH28PeQHysA==
X-CSE-MsgGUID: scReyZBrRhWrbGUutD5H3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89988950"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="89988950"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 16:54:32 -0700
X-CSE-ConnectionGUID: nPi5CZ/uQcq5jVPTy4pqNQ==
X-CSE-MsgGUID: BI4U6WDcRAKe0EKRzEAbrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="303697932"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 24 Sep 2026 16:54:31 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1x9tGm-00000000Joy-3E9a;
 Thu, 24 Sep 2026 23:54:28 +0000
Date: Fri, 25 Sep 2026 07:54:18 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 cc319238e3f6668f867beb381ce93727c69b7317
Message-ID: <202609250715.8NjxJnNc-lkp@intel.com>
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
branch HEAD: cc319238e3f6668f867beb381ce93727c69b7317  drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms

elapsed time: 3090m

configs tested: 358
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r1303-20260925    gcc-14.3.0 sparse
alpha                randconfig-r1304-20260924    gcc-16.1.0 sparse
alpha                randconfig-r2102-20260923    gcc-8.5.0  cocci
alpha                randconfig-r2102-20260924    gcc-11.5.0 cocci
alpha                randconfig-r2103-20260924    gcc-11.5.0 cocci
alpha                randconfig-r2106-20260924    gcc-14     cocci
alpha                randconfig-r2107-20260923    gcc-10.5.0 cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                      haps_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-1000-20260924    clang-24
arc                   randconfig-1000-20260925    clang-24
arc                   randconfig-1001-20260924    clang-24
arc                   randconfig-1001-20260925    clang-24
arc                  randconfig-r2101-20260923    gcc-8.5.0  cocci
arc                  randconfig-r2202-20260923    gcc-14.3.0 smatch
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                          assabet_defconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                          nhk8815_defconfig    clang-24
arm                   randconfig-1000-20260924    clang-24
arm                   randconfig-1000-20260925    clang-24
arm                   randconfig-1001-20260924    clang-24
arm                   randconfig-1001-20260925    clang-24
arm                   randconfig-1002-20260924    clang-24
arm                   randconfig-1002-20260925    clang-24
arm                   randconfig-1003-20260924    clang-24
arm                   randconfig-1003-20260925    clang-24
arm                  randconfig-r1305-20260924    gcc-16.1.0 sparse
arm                  randconfig-r2100-20260923    gcc-8.5.0  cocci
arm                  randconfig-r2101-20260923    gcc-8.5.0  cocci
arm                  randconfig-r2201-20260923    gcc-16.1.0 smatch
arm                         spear6xx_defconfig    clang-24
arm                            stm32_defconfig    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260924    gcc-11.5.0
arm64                 randconfig-1001-20260924    gcc-11.5.0
arm64                 randconfig-1002-20260924    gcc-11.5.0
arm64                 randconfig-1003-20260924    gcc-11.5.0
arm64                randconfig-r1302-20260924    gcc-16.1.0 sparse
arm64                randconfig-r1307-20260924    gcc-11.5.0 sparse
arm64                randconfig-r2200-20260923    clang-24   smatch
arm64                randconfig-r2201-20260923    clang-24   smatch
arm64                randconfig-r2202-20260923    clang-24   smatch
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260924    gcc-11.5.0
csky                  randconfig-1001-20260924    gcc-11.5.0
csky                 randconfig-r1300-20260924    gcc-16.1.0 sparse
csky                 randconfig-r2103-20260923    gcc-8.5.0  cocci
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260924    gcc-8.5.0
hexagon               randconfig-1000-20260925    gcc-9.5.0
hexagon               randconfig-1001-20260924    gcc-8.5.0
hexagon               randconfig-1001-20260925    gcc-9.5.0
hexagon              randconfig-r1301-20260924    gcc-16.1.0 sparse
hexagon              randconfig-r2107-20260924    gcc-14     cocci
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260924    gcc-14
i386        buildonly-randconfig-1000-20260925    clang-22
i386        buildonly-randconfig-1001-20260924    gcc-14
i386        buildonly-randconfig-1001-20260925    clang-22
i386        buildonly-randconfig-1002-20260924    gcc-14
i386        buildonly-randconfig-1002-20260925    clang-22
i386        buildonly-randconfig-1003-20260924    gcc-14
i386        buildonly-randconfig-1003-20260925    clang-22
i386        buildonly-randconfig-1004-20260924    gcc-14
i386        buildonly-randconfig-1004-20260925    clang-22
i386        buildonly-randconfig-1005-20260924    gcc-14
i386        buildonly-randconfig-1005-20260925    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260924    gcc-12
i386                  randconfig-1001-20260924    gcc-12
i386                  randconfig-1002-20260924    gcc-12
i386                  randconfig-1003-20260924    gcc-12
i386                  randconfig-1004-20260924    gcc-12
i386                  randconfig-1005-20260924    gcc-12
i386                  randconfig-1006-20260924    gcc-12
i386                  randconfig-1007-20260924    clang-22
i386                  randconfig-1008-20260924    clang-22
i386                  randconfig-1009-20260924    clang-22
i386                  randconfig-1010-20260924    clang-22
i386                  randconfig-1011-20260924    clang-22
i386                  randconfig-1012-20260924    clang-22
i386                  randconfig-1013-20260924    clang-22
i386                  randconfig-1300-20260924    clang-22   sparse
i386                  randconfig-1301-20260924    clang-22   sparse
i386                  randconfig-1302-20260924    clang-22   sparse
i386                  randconfig-2100-20260923    clang-22   cocci
i386                  randconfig-2101-20260923    clang-22   cocci
i386                  randconfig-2102-20260923    clang-22   cocci
i386                  randconfig-2103-20260923    clang-22   cocci
i386                  randconfig-2200-20260923    gcc-12     smatch
i386                  randconfig-2200-20260924    clang-22   smatch
i386                 randconfig-r2100-20260923    gcc-8.5.0  cocci
i386                 randconfig-r2107-20260923    clang-22   cocci
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260924    gcc-8.5.0
loongarch             randconfig-1000-20260925    gcc-9.5.0
loongarch             randconfig-1001-20260924    gcc-8.5.0
loongarch             randconfig-1001-20260925    gcc-9.5.0
loongarch            randconfig-r2104-20260923    gcc-10.5.0 cocci
loongarch            randconfig-r2105-20260923    gcc-14     cocci
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.1.0
m68k                         m5307c3_defconfig    gcc-16.1.0
m68k                 randconfig-r2103-20260923    gcc-8.5.0  cocci
m68k                 randconfig-r2105-20260923    gcc-10.5.0 cocci
m68k                 randconfig-r2201-20260924    gcc-8.5.0  smatch
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r1304-20260925    gcc-14.3.0 sparse
microblaze           randconfig-r2101-20260924    gcc-11.5.0 cocci
microblaze           randconfig-r2104-20260923    clang-22   cocci
microblaze           randconfig-r2200-20260923    gcc-9.5.0  smatch
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                        bmips_be_defconfig    gcc-16.1.0
mips                 randconfig-r1309-20260924    gcc-11.5.0 sparse
mips                 randconfig-r2201-20260923    clang-22   smatch
mips                 randconfig-r2202-20260923    gcc-8.5.0  smatch
mips                            xway_defconfig    clang-24
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260924    gcc-8.5.0
nios2                 randconfig-1000-20260925    gcc-9.5.0
nios2                 randconfig-1001-20260924    gcc-8.5.0
nios2                 randconfig-1001-20260925    gcc-9.5.0
nios2                randconfig-r1303-20260924    gcc-16.1.0 sparse
nios2                randconfig-r1306-20260924    gcc-11.5.0 sparse
nios2                randconfig-r2100-20260923    gcc-15.2.0 cocci
nios2                randconfig-r2103-20260923    gcc-8.5.0  cocci
nios2                randconfig-r2105-20260923    clang-22   cocci
nios2                randconfig-r2105-20260924    gcc-14     cocci
openrisc                          allmodconfig    gcc-11.5.0
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc                   or1klitex_defconfig    clang-24
openrisc             randconfig-r2106-20260923    gcc-16.1.0 cocci
openrisc             randconfig-r2200-20260924    gcc-13.4.0 smatch
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260924    gcc-8.5.0
parisc                randconfig-1000-20260925    clang-24
parisc                randconfig-1001-20260924    gcc-8.5.0
parisc                randconfig-1001-20260925    clang-24
parisc               randconfig-r1301-20260925    gcc-14.3.0 sparse
parisc               randconfig-r2100-20260923    gcc-8.5.0  cocci
parisc               randconfig-r2104-20260923    gcc-14     cocci
parisc               randconfig-r2106-20260923    gcc-10.5.0 cocci
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                       mgcoge_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20260924    gcc-8.5.0
powerpc               randconfig-1000-20260925    clang-24
powerpc               randconfig-1001-20260924    gcc-8.5.0
powerpc               randconfig-1001-20260925    clang-24
powerpc              randconfig-r2102-20260923    gcc-15.2.0 cocci
powerpc              randconfig-r2106-20260923    clang-22   cocci
powerpc64             randconfig-1000-20260924    gcc-8.5.0
powerpc64             randconfig-1000-20260925    clang-24
powerpc64             randconfig-1001-20260924    gcc-8.5.0
powerpc64             randconfig-1001-20260925    clang-24
powerpc64            randconfig-r1300-20260925    gcc-14.3.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260924    gcc-15.2.0
riscv                 randconfig-1000-20260925    clang-24
riscv                 randconfig-1001-20260924    gcc-15.2.0
riscv                 randconfig-1001-20260925    clang-24
riscv                 randconfig-2000-20260923    gcc-9.5.0
riscv                 randconfig-2000-20260924    clang-24
riscv                 randconfig-2001-20260923    gcc-9.5.0
riscv                 randconfig-2001-20260924    clang-24
riscv                randconfig-r2107-20260923    gcc-16.1.0 cocci
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260924    gcc-15.2.0
s390                  randconfig-1000-20260925    clang-24
s390                  randconfig-1001-20260924    gcc-15.2.0
s390                  randconfig-1001-20260925    clang-24
s390                  randconfig-2000-20260923    gcc-9.5.0
s390                  randconfig-2000-20260924    clang-24
s390                  randconfig-2001-20260923    gcc-9.5.0
s390                  randconfig-2001-20260924    clang-24
s390                 randconfig-r1308-20260924    gcc-11.5.0 sparse
s390                 randconfig-r2200-20260923    gcc-8.5.0  smatch
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20260924    gcc-15.2.0
sh                    randconfig-1000-20260925    clang-24
sh                    randconfig-1001-20260924    gcc-15.2.0
sh                    randconfig-1001-20260925    clang-24
sh                    randconfig-2000-20260923    gcc-9.5.0
sh                    randconfig-2000-20260924    clang-24
sh                    randconfig-2001-20260923    gcc-9.5.0
sh                    randconfig-2001-20260924    clang-24
sh                   randconfig-r1305-20260925    gcc-14.3.0 sparse
sh                   randconfig-r2103-20260923    gcc-15.2.0 cocci
sh                   randconfig-r2104-20260923    gcc-16.1.0 cocci
sh                   randconfig-r2202-20260924    gcc-14.3.0 smatch
sh                            se7780_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260924    clang-17
sparc                 randconfig-1000-20260925    gcc-12
sparc                 randconfig-1001-20260924    clang-17
sparc                 randconfig-1001-20260925    gcc-12
sparc                 randconfig-2000-20260923    gcc-14.3.0
sparc                 randconfig-2000-20260924    gcc-13.4.0
sparc                 randconfig-2001-20260923    gcc-14.3.0
sparc                 randconfig-2001-20260924    gcc-13.4.0
sparc                randconfig-r2105-20260923    gcc-16.1.0 cocci
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260924    clang-17
sparc64               randconfig-1000-20260925    gcc-12
sparc64               randconfig-1001-20260924    clang-17
sparc64               randconfig-1001-20260925    gcc-12
sparc64               randconfig-2000-20260923    gcc-14.3.0
sparc64               randconfig-2000-20260924    gcc-13.4.0
sparc64               randconfig-2001-20260923    gcc-14.3.0
sparc64               randconfig-2001-20260924    gcc-13.4.0
sparc64              randconfig-r2100-20260924    gcc-11.5.0 cocci
sparc64              randconfig-r2101-20260923    gcc-15.2.0 cocci
sparc64              randconfig-r2102-20260923    gcc-8.5.0  cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260924    clang-17
um                    randconfig-1000-20260925    gcc-12
um                    randconfig-1001-20260924    clang-17
um                    randconfig-1001-20260925    gcc-12
um                    randconfig-2000-20260923    gcc-14.3.0
um                    randconfig-2000-20260924    gcc-13.4.0
um                    randconfig-2001-20260923    gcc-14.3.0
um                    randconfig-2001-20260924    gcc-13.4.0
um                   randconfig-r1302-20260925    gcc-14.3.0 sparse
um                   randconfig-r2200-20260923    gcc-14     smatch
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20260924    clang-22
x86_64      buildonly-randconfig-1000-20260925    clang-22
x86_64      buildonly-randconfig-1001-20260924    clang-22
x86_64      buildonly-randconfig-1001-20260925    clang-22
x86_64      buildonly-randconfig-1002-20260924    clang-22
x86_64      buildonly-randconfig-1002-20260925    clang-22
x86_64      buildonly-randconfig-1003-20260924    clang-22
x86_64      buildonly-randconfig-1003-20260925    clang-22
x86_64      buildonly-randconfig-1004-20260924    clang-22
x86_64      buildonly-randconfig-1004-20260925    clang-22
x86_64      buildonly-randconfig-1005-20260924    clang-22
x86_64      buildonly-randconfig-1005-20260925    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260924    clang-22
x86_64                randconfig-1000-20260925    gcc-14
x86_64                randconfig-1001-20260924    clang-22
x86_64                randconfig-1001-20260925    gcc-14
x86_64                randconfig-1002-20260924    clang-22
x86_64                randconfig-1002-20260925    gcc-14
x86_64                randconfig-1003-20260924    clang-22
x86_64                randconfig-1003-20260925    gcc-14
x86_64                randconfig-1004-20260924    clang-22
x86_64                randconfig-1004-20260925    gcc-14
x86_64                randconfig-1005-20260924    clang-22
x86_64                randconfig-1005-20260925    gcc-14
x86_64                randconfig-1006-20260924    clang-22
x86_64                randconfig-1006-20260925    clang-22
x86_64                randconfig-1007-20260924    clang-22
x86_64                randconfig-1007-20260925    clang-22
x86_64                randconfig-1008-20260924    clang-22
x86_64                randconfig-1008-20260925    clang-22
x86_64                randconfig-1009-20260924    clang-22
x86_64                randconfig-1009-20260925    clang-22
x86_64                randconfig-1010-20260924    clang-22
x86_64                randconfig-1010-20260925    clang-22
x86_64                randconfig-1011-20260924    clang-22
x86_64                randconfig-1011-20260925    clang-22
x86_64                randconfig-1012-20260924    clang-22
x86_64                randconfig-1013-20260924    clang-22
x86_64                randconfig-1014-20260924    clang-22
x86_64                randconfig-1015-20260924    clang-22
x86_64                randconfig-1016-20260924    clang-22
x86_64                randconfig-1017-20260924    clang-22
x86_64                randconfig-1300-20260924    clang-22   sparse
x86_64                randconfig-1301-20260924    clang-22   sparse
x86_64                randconfig-1302-20260924    clang-22   sparse
x86_64                randconfig-2100-20260923    clang-22   cocci
x86_64                randconfig-2100-20260924    clang-22   cocci
x86_64                randconfig-2101-20260923    clang-22   cocci
x86_64                randconfig-2101-20260924    clang-22   cocci
x86_64                randconfig-2102-20260923    clang-22   cocci
x86_64                randconfig-2102-20260924    clang-22   cocci
x86_64                randconfig-2103-20260923    clang-22   cocci
x86_64                randconfig-2103-20260924    clang-22   cocci
x86_64                randconfig-2200-20260923    gcc-14     smatch
x86_64                randconfig-2200-20260924    clang-22   smatch
x86_64               randconfig-r2101-20260923    gcc-8.5.0  cocci
x86_64               randconfig-r2104-20260924    gcc-14     cocci
x86_64               randconfig-r2106-20260923    gcc-14     cocci
x86_64               randconfig-r2107-20260923    gcc-14     cocci
x86_64               randconfig-r2201-20260923    clang-22   smatch
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
xtensa                            alldefconfig    gcc-16.1.0
xtensa                             allnoconfig    clang-24
xtensa                randconfig-1000-20260924    clang-17
xtensa                randconfig-1000-20260925    gcc-12
xtensa                randconfig-1001-20260924    clang-17
xtensa                randconfig-1001-20260925    gcc-12
xtensa                randconfig-2000-20260923    gcc-14.3.0
xtensa                randconfig-2000-20260924    gcc-13.4.0
xtensa                randconfig-2001-20260923    gcc-14.3.0
xtensa                randconfig-2001-20260924    gcc-13.4.0
xtensa               randconfig-r2102-20260923    gcc-8.5.0  cocci
xtensa               randconfig-r2202-20260923    gcc-10.5.0 smatch

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
