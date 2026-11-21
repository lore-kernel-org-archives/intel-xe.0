Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6ED606A69C
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 04:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G89iyFLi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9387C10E008;
	Sat, 21 Nov 2026 04:20:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225FD10E008
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 04:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795234796; x=1826770796;
 h=date:from:to:cc:subject:message-id;
 bh=1Lj3qD4rzlRBB3dtOWixcLxNQCljSP+lX2sReTJKXwQ=;
 b=G89iyFLiFWH389zSuyWq6Iy8TjFMUPfo+YAxlou9zGf9/Y0x6Hxp22KI
 HPUfA06uE2xHXSiFo5zF2FFK0xuowB3gSYhAfuY13hn+wGKSvOi0WQ/CR
 BKM16J6brv73FfVv0UXI1STLALb542T2j2pcQ3HhVp97RsqHGJflWtpgt
 +cYciKseRYc8z/H3GE5iDvbnLKdDCmQeFm5lh1sUAXdA0w+wAyWukoHLs
 2LXJ6M/nQu0FnvrWyO96d5Fdb1FeT3/4s5Px7J5XOV38V2Efy5cE3WsAJ
 IObx6+8UMvRv/NZ6iKIST04Xgg0lD2ce+N6/7KBRXcixFyTZkpqyjphOj Q==;
X-CSE-ConnectionGUID: PkfVuzPETpyCBrPvU06i/Q==
X-CSE-MsgGUID: URHiuA99TQe1HT8SVuCCsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4010224"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4010224"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 20:19:55 -0800
X-CSE-ConnectionGUID: tZebyFaXRie81gOQ4LmNWQ==
X-CSE-MsgGUID: mgujErWLRGOp2aU8z0qf3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; d="scan'208";a="12677677"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
 by fmviesa011.fm.intel.com with ESMTP; 20 Nov 2026 20:19:53 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1xUcZr-00000001JVQ-2OrM;
 Sat, 21 Nov 2026 04:19:51 +0000
Date: Sat, 21 Nov 2026 12:19:15 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 58417a6534dd3c190203a50541aa34b4a98bf275
Message-ID: <20261121121915.LGZKH5Sz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: 58417a6534dd3c190203a50541aa34b4a98bf275  drm/xe/hwmon: Propagate all hardware read errors

elapsed time: 1350m

configs tested: 527
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                 randconfig-2000-20261119    gcc-8.5.0
alpha                 randconfig-2001-20261119    gcc-8.5.0
alpha                 randconfig-2200-20261119    gcc-12.5.0 smatch
alpha                randconfig-r2100-20261119    gcc-10.5.0 cocci
alpha                randconfig-r2100-20261119    gcc-13.5.0 cocci
alpha                randconfig-r2102-20261119    gcc-16.2.0 cocci
alpha                randconfig-r2103-20261119    gcc-16.2.0 cocci
alpha                randconfig-r2106-20261119    gcc-11.5.0 cocci
alpha                randconfig-r2106-20261119    gcc-15.3.0 cocci
alpha                randconfig-r2110-20261119    gcc-8.5.0  cocci
alpha                randconfig-r2111-20261119    gcc-11.5.0 cocci
alpha                randconfig-r2301-20261119    gcc-16.2.0 sparse
alpha                randconfig-r2304-20261119    gcc-16.2.0 sparse
alpha                randconfig-r2305-20261119    gcc-16.2.0 sparse
alpha                randconfig-r2306-20261119    gcc-13.5.0 sparse
alpha                randconfig-r2311-20261119    gcc-13.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.2.0
arc                       axs103_smp_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261120    clang-17
arc                   randconfig-1000-20261121    clang-24
arc                   randconfig-1001-20261120    clang-17
arc                   randconfig-1001-20261121    clang-24
arc                   randconfig-2000-20261119    gcc-14.4.0
arc                   randconfig-2001-20261119    gcc-14.4.0
arc                   randconfig-2002-20261119    gcc-14.4.0
arc                   randconfig-2003-20261119    gcc-14.4.0
arc                   randconfig-2004-20261119    gcc-14.4.0
arc                   randconfig-2005-20261119    gcc-14.4.0
arc                   randconfig-2200-20261119    gcc-16.2.0 smatch
arc                  randconfig-r2107-20261119    gcc-15.3.0 cocci
arc                  randconfig-r2109-20261119    gcc-14     cocci
arc                  randconfig-r2306-20261119    gcc-8.5.0  sparse
arc                  randconfig-r2308-20261119    gcc-10.5.0 sparse
arc                  randconfig-r2311-20261119    gcc-8.5.0  sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                         clps711x_defconfig    gcc-16.2.0
arm                          mv78xx0_defconfig    gcc-16.2.0
arm                         neponset_defconfig    gcc-16.2.0
arm                        omap2plus_defconfig    gcc-16.2.0
arm                           pxa3xx_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261120    clang-17
arm                   randconfig-1000-20261121    clang-24
arm                   randconfig-1001-20261120    clang-17
arm                   randconfig-1001-20261121    clang-24
arm                   randconfig-1002-20261120    clang-17
arm                   randconfig-1002-20261121    clang-24
arm                   randconfig-1003-20261120    clang-17
arm                   randconfig-1003-20261121    clang-24
arm                   randconfig-2000-20261119    gcc-16.2.0
arm                   randconfig-2001-20261119    gcc-16.2.0
arm                   randconfig-2002-20261119    gcc-16.2.0
arm                   randconfig-2200-20261119    clang-24   smatch
arm                  randconfig-r2103-20261119    gcc-10.5.0 cocci
arm                  randconfig-r2105-20261119    gcc-16.2.0 cocci
arm                  randconfig-r2108-20261119    gcc-8.5.0  cocci
arm                  randconfig-r2300-20261119    clang-24   sparse
arm                  randconfig-r2301-20261119    clang-24   sparse
arm                  randconfig-r2302-20261119    gcc-15.3.0 sparse
arm                  randconfig-r2304-20261119    clang-24   sparse
arm                  randconfig-r2307-20261119    gcc-10.5.0 sparse
arm                  randconfig-r2309-20261119    clang-24   sparse
arm                  randconfig-r2310-20261119    clang-24   sparse
arm                              rpc_defconfig    gcc-16.2.0
arm                         shmobile_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                 randconfig-1000-20261120    clang-18
arm64                 randconfig-1001-20261120    clang-18
arm64                 randconfig-1002-20261120    clang-18
arm64                 randconfig-1003-20261120    clang-18
arm64                 randconfig-2000-20261119    gcc-16.2.0
arm64                 randconfig-2001-20261119    gcc-16.2.0
arm64                 randconfig-2002-20261119    gcc-16.2.0
arm64                 randconfig-2200-20261119    clang-17   smatch
arm64                randconfig-r2101-20261119    gcc-15.3.0 cocci
arm64                randconfig-r2104-20261119    gcc-11.5.0 cocci
arm64                randconfig-r2104-20261119    gcc-16.2.0 cocci
arm64                randconfig-r2106-20261119    gcc-14     cocci
arm64                randconfig-r2108-20261119    gcc-10.5.0 cocci
arm64                randconfig-r2109-20261119    gcc-14     cocci
arm64                randconfig-r2110-20261119    gcc-14     cocci
arm64                randconfig-r2302-20261119    gcc-16.2.0 sparse
arm64                randconfig-r2304-20261119    gcc-15.3.0 sparse
arm64                randconfig-r2309-20261119    clang-24   sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                  randconfig-1000-20261120    clang-18
csky                  randconfig-1001-20261120    clang-18
csky                  randconfig-2000-20261119    gcc-16.2.0
csky                  randconfig-2001-20261119    gcc-16.2.0
csky                  randconfig-2200-20261119    gcc-16.2.0 smatch
csky                 randconfig-r2105-20261119    gcc-11.5.0 cocci
csky                 randconfig-r2110-20261119    gcc-13.5.0 cocci
csky                 randconfig-r2111-20261119    gcc-13.5.0 cocci
csky                 randconfig-r2300-20261119    gcc-16.2.0 sparse
csky                 randconfig-r2302-20261119    gcc-16.2.0 sparse
csky                 randconfig-r2304-20261119    gcc-16.2.0 sparse
csky                 randconfig-r2305-20261119    gcc-16.2.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon               randconfig-1000-20261120    gcc-10.5.0
hexagon               randconfig-1000-20261121    gcc-11.5.0
hexagon               randconfig-1001-20261120    gcc-10.5.0
hexagon               randconfig-1001-20261121    gcc-11.5.0
hexagon               randconfig-2000-20261119    gcc-16.2.0
hexagon               randconfig-2001-20261119    gcc-16.2.0
hexagon               randconfig-2200-20261119    clang-17   smatch
hexagon              randconfig-r2100-20261119    gcc-11.5.0 cocci
hexagon              randconfig-r2101-20261119    clang-19   cocci
hexagon              randconfig-r2101-20261119    gcc-11.5.0 cocci
hexagon              randconfig-r2102-20261119    gcc-10.5.0 cocci
hexagon              randconfig-r2104-20261119    gcc-10.5.0 cocci
hexagon              randconfig-r2105-20261119    clang-19   cocci
hexagon              randconfig-r2107-20261119    gcc-14     cocci
hexagon              randconfig-r2109-20261119    gcc-10.5.0 cocci
hexagon              randconfig-r2300-20261119    gcc-15.3.0 sparse
hexagon              randconfig-r2305-20261119    gcc-15.3.0 sparse
hexagon              randconfig-r2309-20261119    clang-24   sparse
hexagon              randconfig-r2310-20261119    gcc-10.5.0 sparse
hexagon              randconfig-r2310-20261119    gcc-11.5.0 sparse
hexagon              randconfig-r2310-20261119    gcc-8.5.0  sparse
hexagon              randconfig-r2311-20261119    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261120    clang-22
i386        buildonly-randconfig-1000-20261121    gcc-13
i386        buildonly-randconfig-1001-20261120    clang-22
i386        buildonly-randconfig-1001-20261121    gcc-13
i386        buildonly-randconfig-1002-20261120    clang-22
i386        buildonly-randconfig-1002-20261121    gcc-13
i386        buildonly-randconfig-1003-20261120    clang-22
i386        buildonly-randconfig-1003-20261121    gcc-13
i386        buildonly-randconfig-1004-20261120    clang-22
i386        buildonly-randconfig-1004-20261121    gcc-13
i386        buildonly-randconfig-1005-20261120    clang-22
i386        buildonly-randconfig-1005-20261121    gcc-13
i386                  randconfig-1000-20261120    clang-22
i386                  randconfig-1000-20261121    clang-22
i386                  randconfig-1001-20261120    clang-22
i386                  randconfig-1001-20261121    clang-22
i386                  randconfig-1002-20261120    clang-22
i386                  randconfig-1002-20261121    clang-22
i386                  randconfig-1003-20261120    clang-22
i386                  randconfig-1003-20261121    clang-22
i386                  randconfig-1004-20261120    clang-22
i386                  randconfig-1004-20261121    clang-22
i386                  randconfig-1005-20261120    clang-22
i386                  randconfig-1005-20261121    clang-22
i386                  randconfig-1006-20261120    clang-22
i386                  randconfig-1006-20261121    clang-22
i386                  randconfig-2000-20261119    gcc-14
i386                  randconfig-2001-20261119    gcc-14
i386                  randconfig-2002-20261119    gcc-14
i386                  randconfig-2003-20261119    gcc-14
i386                  randconfig-2004-20261119    gcc-14
i386                  randconfig-2005-20261119    gcc-14
i386                  randconfig-2100-20261119    clang-22   cocci
i386                  randconfig-2101-20261119    clang-22   cocci
i386                  randconfig-2102-20261119    clang-22   cocci
i386                  randconfig-2103-20261119    clang-22   cocci
i386                  randconfig-2104-20261119    clang-22   cocci
i386                  randconfig-2105-20261119    clang-22   cocci
i386                  randconfig-2200-20261119    gcc-14     smatch
i386                  randconfig-2300-20261119    gcc-14     sparse
i386                  randconfig-2301-20261119    gcc-14     sparse
i386                  randconfig-2302-20261119    gcc-14     sparse
i386                 randconfig-r2100-20261119    gcc-10.5.0 cocci
i386                 randconfig-r2100-20261119    gcc-16.2.0 cocci
i386                 randconfig-r2106-20261119    clang-24   cocci
i386                 randconfig-r2107-20261119    gcc-10.5.0 cocci
i386                 randconfig-r2300-20261119    gcc-15.3.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261120    gcc-10.5.0
loongarch             randconfig-1000-20261121    gcc-11.5.0
loongarch             randconfig-1001-20261120    gcc-10.5.0
loongarch             randconfig-1001-20261121    gcc-11.5.0
loongarch             randconfig-2000-20261119    gcc-8.5.0
loongarch             randconfig-2001-20261119    gcc-8.5.0
loongarch             randconfig-2200-20261119    clang-24   smatch
loongarch            randconfig-r2111-20261119    gcc-14     cocci
loongarch            randconfig-r2111-20261119    gcc-8.5.0  cocci
loongarch            randconfig-r2300-20261119    gcc-16.2.0 sparse
loongarch            randconfig-r2302-20261119    clang-24   sparse
loongarch            randconfig-r2304-20261119    gcc-16.2.0 sparse
loongarch            randconfig-r2306-20261119    clang-24   sparse
loongarch            randconfig-r2311-20261119    gcc-10.5.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                  randconfig-2000-20261119    gcc-8.5.0
m68k                  randconfig-2001-20261119    gcc-8.5.0
m68k                  randconfig-2200-20261119    gcc-9.5.0  smatch
m68k                 randconfig-r2102-20261119    gcc-11.5.0 cocci
m68k                 randconfig-r2102-20261119    gcc-15.3.0 cocci
m68k                 randconfig-r2103-20261119    clang-19   cocci
m68k                 randconfig-r2105-20261119    gcc-11.5.0 cocci
m68k                 randconfig-r2106-20261119    gcc-10.5.0 cocci
m68k                 randconfig-r2107-20261119    gcc-8.5.0  cocci
m68k                 randconfig-r2108-20261119    gcc-13.5.0 cocci
m68k                 randconfig-r2111-20261119    clang-24   cocci
m68k                 randconfig-r2301-20261119    gcc-15.3.0 sparse
m68k                 randconfig-r2303-20261119    gcc-16.2.0 sparse
m68k                 randconfig-r2308-20261119    gcc-13.5.0 sparse
m68k                 randconfig-r2311-20261119    clang-24   sparse
m68k                 randconfig-r2311-20261119    gcc-11.5.0 sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261119    gcc-8.5.0
microblaze            randconfig-2001-20261119    gcc-8.5.0
microblaze            randconfig-2200-20261119    gcc-12.5.0 smatch
microblaze           randconfig-r2110-20261119    gcc-11.5.0 cocci
microblaze           randconfig-r2304-20261119    gcc-15.3.0 sparse
microblaze           randconfig-r2305-20261119    clang-24   sparse
microblaze           randconfig-r2305-20261119    gcc-16.2.0 sparse
microblaze           randconfig-r2305-20261119    gcc-8.5.0  sparse
microblaze           randconfig-r2311-20261119    clang-24   sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                           eyeq5_defconfig    gcc-16.2.0
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                      loongson2k_defconfig    gcc-16.2.0
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261119    gcc-16.2.0
mips                  randconfig-2001-20261119    gcc-16.2.0
mips                  randconfig-2002-20261119    gcc-16.2.0
mips                  randconfig-2200-20261119    clang-24   smatch
mips                 randconfig-r2101-20261119    gcc-13.5.0 cocci
mips                 randconfig-r2102-20261119    clang-19   cocci
mips                 randconfig-r2103-20261119    gcc-11.5.0 cocci
mips                 randconfig-r2103-20261119    gcc-13.5.0 cocci
mips                 randconfig-r2107-20261119    clang-24   cocci
mips                 randconfig-r2109-20261119    gcc-13.5.0 cocci
mips                 randconfig-r2110-20261119    gcc-10.5.0 cocci
mips                 randconfig-r2300-20261119    gcc-8.5.0  sparse
mips                 randconfig-r2302-20261119    clang-24   sparse
mips                 randconfig-r2303-20261119    gcc-16.2.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261120    gcc-10.5.0
nios2                 randconfig-1000-20261121    gcc-11.5.0
nios2                 randconfig-1001-20261120    gcc-10.5.0
nios2                 randconfig-1001-20261121    gcc-11.5.0
nios2                 randconfig-2000-20261119    gcc-8.5.0
nios2                 randconfig-2001-20261119    gcc-8.5.0
nios2                 randconfig-2200-20261119    gcc-11.5.0 smatch
nios2                randconfig-r2102-20261119    gcc-10.5.0 cocci
nios2                randconfig-r2102-20261119    gcc-11.5.0 cocci
nios2                randconfig-r2110-20261119    gcc-14     cocci
nios2                randconfig-r2111-20261119    gcc-8.5.0  cocci
nios2                randconfig-r2302-20261119    gcc-16.2.0 sparse
nios2                randconfig-r2303-20261119    gcc-15.3.0 sparse
nios2                randconfig-r2308-20261119    clang-24   sparse
nios2                randconfig-r2309-20261119    gcc-10.5.0 sparse
nios2                randconfig-r2309-20261119    gcc-13.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261119    gcc-16.2.0
openrisc              randconfig-2001-20261119    gcc-16.2.0
openrisc              randconfig-2002-20261119    gcc-16.2.0
openrisc              randconfig-2200-20261119    gcc-16.2.0 smatch
openrisc             randconfig-r2101-20261119    gcc-10.5.0 cocci
openrisc             randconfig-r2103-20261119    gcc-15.3.0 cocci
openrisc             randconfig-r2108-20261119    gcc-11.5.0 cocci
openrisc             randconfig-r2110-20261119    clang-24   cocci
openrisc             randconfig-r2302-20261119    gcc-15.3.0 sparse
openrisc             randconfig-r2307-20261119    gcc-11.5.0 sparse
openrisc             randconfig-r2308-20261119    gcc-11.5.0 sparse
openrisc             randconfig-r2308-20261119    gcc-8.5.0  sparse
openrisc             randconfig-r2309-20261119    gcc-8.5.0  sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                 generic-32bit_defconfig    gcc-16.2.0
parisc                randconfig-2000-20261119    gcc-8.5.0
parisc                randconfig-2001-20261119    gcc-8.5.0
parisc                randconfig-2200-20261119    gcc-14.4.0 smatch
parisc               randconfig-r2108-20261119    gcc-15.3.0 cocci
parisc               randconfig-r2109-20261119    gcc-15.3.0 cocci
parisc               randconfig-r2109-20261119    gcc-8.5.0  cocci
parisc               randconfig-r2302-20261119    gcc-8.5.0  sparse
parisc               randconfig-r2303-20261119    gcc-15.3.0 sparse
parisc               randconfig-r2309-20261119    clang-24   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       ep88xc_defconfig    gcc-16.2.0
powerpc                         icon_defconfig    gcc-16.2.0
powerpc                       pmac32_defconfig    gcc-16.2.0
powerpc               randconfig-2000-20261119    gcc-15.3.0
powerpc               randconfig-2001-20261119    gcc-15.3.0
powerpc               randconfig-2002-20261119    gcc-15.3.0
powerpc               randconfig-2200-20261119    gcc-13.5.0 smatch
powerpc              randconfig-r2100-20261119    clang-19   cocci
powerpc              randconfig-r2104-20261119    gcc-13.5.0 cocci
powerpc              randconfig-r2107-20261119    gcc-11.5.0 cocci
powerpc              randconfig-r2300-20261119    clang-24   sparse
powerpc              randconfig-r2307-20261119    clang-24   sparse
powerpc              randconfig-r2307-20261119    gcc-13.5.0 sparse
powerpc64             randconfig-2000-20261119    gcc-15.3.0
powerpc64             randconfig-2001-20261119    gcc-15.3.0
powerpc64             randconfig-2002-20261119    gcc-15.3.0
powerpc64             randconfig-2200-20261119    clang-24   smatch
powerpc64            randconfig-r2101-20261119    gcc-10.5.0 cocci
powerpc64            randconfig-r2101-20261119    gcc-16.2.0 cocci
powerpc64            randconfig-r2103-20261119    gcc-10.5.0 cocci
powerpc64            randconfig-r2105-20261119    gcc-10.5.0 cocci
powerpc64            randconfig-r2110-20261119    gcc-15.3.0 cocci
powerpc64            randconfig-r2111-20261119    gcc-10.5.0 cocci
powerpc64            randconfig-r2307-20261119    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261120    gcc-11.5.0
riscv                 randconfig-1000-20261121    clang-17
riscv                 randconfig-1001-20261120    gcc-11.5.0
riscv                 randconfig-1001-20261121    clang-17
riscv                 randconfig-2000-20261119    clang-24
riscv                 randconfig-2001-20261119    clang-24
riscv                 randconfig-2002-20261119    clang-24
riscv                 randconfig-2003-20261119    clang-24
riscv                 randconfig-2004-20261119    clang-24
riscv                 randconfig-2005-20261119    clang-24
riscv                 randconfig-2200-20261119    clang-24   smatch
riscv                randconfig-r2107-20261119    gcc-13.5.0 cocci
riscv                randconfig-r2305-20261119    clang-24   sparse
riscv                randconfig-r2306-20261119    clang-24   sparse
riscv                randconfig-r2306-20261119    gcc-10.5.0 sparse
riscv                randconfig-r2306-20261119    gcc-11.5.0 sparse
riscv                randconfig-r2307-20261119    gcc-8.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261120    gcc-11.5.0
s390                  randconfig-1000-20261121    clang-17
s390                  randconfig-1001-20261120    gcc-11.5.0
s390                  randconfig-1001-20261121    clang-17
s390                  randconfig-2000-20261119    clang-20
s390                  randconfig-2001-20261119    clang-20
s390                  randconfig-2002-20261119    clang-20
s390                  randconfig-2003-20261119    clang-20
s390                  randconfig-2004-20261119    clang-20
s390                  randconfig-2005-20261119    clang-20
s390                  randconfig-2200-20261119    clang-24   smatch
s390                 randconfig-r2103-20261119    gcc-11.5.0 cocci
s390                 randconfig-r2104-20261119    gcc-11.5.0 cocci
s390                 randconfig-r2104-20261119    gcc-15.3.0 cocci
s390                 randconfig-r2108-20261119    gcc-8.5.0  cocci
s390                 randconfig-r2301-20261119    gcc-16.2.0 sparse
s390                 randconfig-r2303-20261119    clang-24   sparse
s390                 randconfig-r2303-20261119    gcc-16.2.0 sparse
s390                 randconfig-r2304-20261119    clang-24   sparse
s390                 randconfig-r2306-20261119    clang-24   sparse
s390                 randconfig-r2307-20261119    clang-24   sparse
s390                 randconfig-r2310-20261119    clang-24   sparse
s390                        zfcpdump_defconfig    gcc-16.2.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.2.0
sh                 ecovec24-romimage_defconfig    gcc-16.2.0
sh                                j2_defconfig    gcc-16.2.0
sh                           kfr2r09_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261120    gcc-11.5.0
sh                    randconfig-1000-20261121    clang-17
sh                    randconfig-1001-20261120    gcc-11.5.0
sh                    randconfig-1001-20261121    clang-17
sh                    randconfig-2000-20261119    gcc-12.5.0
sh                    randconfig-2001-20261119    gcc-12.5.0
sh                    randconfig-2002-20261119    gcc-12.5.0
sh                    randconfig-2003-20261119    gcc-12.5.0
sh                    randconfig-2004-20261119    gcc-12.5.0
sh                    randconfig-2005-20261119    gcc-12.5.0
sh                    randconfig-2200-20261119    gcc-16.2.0 smatch
sh                   randconfig-r2106-20261119    gcc-8.5.0  cocci
sh                   randconfig-r2107-20261119    gcc-8.5.0  cocci
sh                   randconfig-r2108-20261119    clang-24   cocci
sh                   randconfig-r2110-20261119    gcc-8.5.0  cocci
sh                   randconfig-r2300-20261119    gcc-16.2.0 sparse
sh                   randconfig-r2301-20261119    gcc-8.5.0  sparse
sh                   randconfig-r2303-20261119    gcc-16.2.0 sparse
sh                   randconfig-r2305-20261119    gcc-15.3.0 sparse
sh                   randconfig-r2309-20261119    gcc-11.5.0 sparse
sh                         sh7785lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261120    clang-24
sparc                 randconfig-1001-20261120    clang-24
sparc                 randconfig-2000-20261119    clang-21
sparc                 randconfig-2001-20261119    clang-21
sparc                 randconfig-2200-20261119    gcc-8.5.0  smatch
sparc                randconfig-r2102-20261119    gcc-11.5.0 cocci
sparc                randconfig-r2105-20261119    gcc-13.5.0 cocci
sparc                randconfig-r2304-20261119    gcc-8.5.0  sparse
sparc                randconfig-r2310-20261119    clang-24   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261120    clang-24
sparc64               randconfig-1001-20261120    clang-24
sparc64               randconfig-2000-20261119    clang-21
sparc64               randconfig-2001-20261119    clang-21
sparc64               randconfig-2200-20261119    gcc-13.5.0 smatch
sparc64              randconfig-r2100-20261119    gcc-11.5.0 cocci
sparc64              randconfig-r2103-20261119    gcc-11.5.0 cocci
sparc64              randconfig-r2105-20261119    gcc-11.5.0 cocci
sparc64              randconfig-r2301-20261119    clang-24   sparse
sparc64              randconfig-r2302-20261119    gcc-16.2.0 sparse
sparc64              randconfig-r2305-20261119    gcc-16.2.0 sparse
sparc64              randconfig-r2308-20261119    clang-24   sparse
sparc64              randconfig-r2310-20261119    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261120    clang-24
um                    randconfig-1001-20261120    clang-24
um                    randconfig-2000-20261119    clang-21
um                    randconfig-2001-20261119    clang-21
um                   randconfig-r2101-20261119    gcc-11.5.0 cocci
um                   randconfig-r2104-20261119    gcc-10.5.0 cocci
um                   randconfig-r2106-20261119    gcc-8.5.0  cocci
um                   randconfig-r2107-20261119    gcc-14     cocci
um                   randconfig-r2108-20261119    gcc-14     cocci
um                   randconfig-r2109-20261119    gcc-8.5.0  cocci
um                   randconfig-r2300-20261119    gcc-16.2.0 sparse
um                   randconfig-r2301-20261119    gcc-15.3.0 sparse
um                   randconfig-r2303-20261119    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261121    clang-22
x86_64      buildonly-randconfig-1001-20261121    clang-22
x86_64      buildonly-randconfig-1002-20261121    clang-22
x86_64      buildonly-randconfig-1003-20261121    clang-22
x86_64      buildonly-randconfig-1004-20261121    clang-22
x86_64      buildonly-randconfig-1005-20261121    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261120    clang-22
x86_64                randconfig-1001-20261120    clang-22
x86_64                randconfig-1002-20261120    clang-22
x86_64                randconfig-1003-20261120    clang-22
x86_64                randconfig-1004-20261120    clang-22
x86_64                randconfig-1005-20261120    clang-22
x86_64                randconfig-1006-20261120    clang-22
x86_64                randconfig-1007-20261120    clang-22
x86_64                randconfig-1008-20261120    clang-22
x86_64                randconfig-1009-20261120    clang-22
x86_64                randconfig-1010-20261120    clang-22
x86_64                randconfig-1011-20261120    clang-22
x86_64                randconfig-1012-20261120    clang-22
x86_64                randconfig-1013-20261120    clang-22
x86_64                randconfig-1014-20261120    clang-22
x86_64                randconfig-1015-20261120    clang-22
x86_64                randconfig-1016-20261120    clang-22
x86_64                randconfig-1017-20261120    clang-22
x86_64                randconfig-2000-20261119    clang-22
x86_64                randconfig-2001-20261119    clang-22
x86_64                randconfig-2002-20261119    clang-22
x86_64                randconfig-2003-20261119    clang-22
x86_64                randconfig-2004-20261119    clang-22
x86_64                randconfig-2005-20261119    clang-22
x86_64                randconfig-2100-20261119    clang-22   cocci
x86_64                randconfig-2101-20261119    clang-22   cocci
x86_64                randconfig-2102-20261119    clang-22   cocci
x86_64                randconfig-2103-20261119    clang-22   cocci
x86_64                randconfig-2104-20261119    clang-22   cocci
x86_64                randconfig-2105-20261119    clang-22   cocci
x86_64                randconfig-2200-20261119    clang-22   smatch
x86_64                randconfig-2300-20261119    gcc-14     sparse
x86_64                randconfig-2301-20261119    gcc-14     sparse
x86_64                randconfig-2302-20261119    gcc-14     sparse
x86_64               randconfig-r2105-20261119    gcc-10.5.0 cocci
x86_64               randconfig-r2111-20261119    gcc-14     cocci
x86_64               randconfig-r2111-20261119    gcc-15.3.0 cocci
x86_64               randconfig-r2301-20261119    gcc-16.2.0 sparse
x86_64               randconfig-r2304-20261119    gcc-16.2.0 sparse
x86_64               randconfig-r2308-20261119    clang-24   sparse
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
xtensa                            alldefconfig    gcc-16.2.0
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261120    clang-24
xtensa                randconfig-1001-20261120    clang-24
xtensa                randconfig-2000-20261119    gcc-16.2.0
xtensa                randconfig-2001-20261119    gcc-16.2.0
xtensa                randconfig-2200-20261119    gcc-14.4.0 smatch
xtensa               randconfig-r2100-20261119    gcc-15.3.0 cocci
xtensa               randconfig-r2102-20261119    gcc-13.5.0 cocci
xtensa               randconfig-r2104-20261119    clang-19   cocci
xtensa               randconfig-r2105-20261119    gcc-15.3.0 cocci
xtensa               randconfig-r2106-20261119    gcc-13.5.0 cocci
xtensa               randconfig-r2109-20261119    clang-24   cocci
xtensa               randconfig-r2109-20261119    gcc-11.5.0 cocci
xtensa               randconfig-r2301-20261119    gcc-16.2.0 sparse
xtensa               randconfig-r2303-20261119    gcc-8.5.0  sparse
xtensa               randconfig-r2310-20261119    gcc-13.5.0 sparse
xtensa               randconfig-r2311-20261119    clang-24   sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
