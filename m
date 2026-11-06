Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DB2606A32C
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 21:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ag7oi81u
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C285A10E48A;
	Fri,  6 Nov 2026 21:55:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEB010E48A
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 21:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794002127; x=1825538127;
 h=date:from:to:cc:subject:message-id;
 bh=qWoYuwnYjRhObg03QrXKkXdchRthsK+vebvqyHKA8W8=;
 b=ag7oi81u7aQCrKyOO+q8JH5OQD3sHLAC0MnjuVs63HF02T0H5LpMzrHd
 vIaMQOiV/BSr+FY0w5xI+aTgTMm1fddswefvOHbyOUctNlyXDK0v4gc84
 GKQ5w2spqM4JxNyvjRm3v75p2PG7uBxEdT64MgTYPIBuE6A3cr44dE+ds
 1grEaTGVDNfu9y0gfCaEvXl+T56kAYK9Xb3mMvwhx/kqNgbOm1rr0Itun
 WJmYVteh4i1yt4K7mPANH2MYlPzE7HNd0efL7OwoOorQWC/7h3JHGHUT2
 og2mSu+y4/raCR1V9bC9a3aN7TCy012tFk83LGP5V9aw25ZufpPrW+1YF Q==;
X-CSE-ConnectionGUID: FK9/8+zATkuibFbbpz6F9A==
X-CSE-MsgGUID: KZ+rNcYfQXKFiI15yVgilg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2845330"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2845330"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 13:55:26 -0800
X-CSE-ConnectionGUID: dGpjoh/3Quq5YHI4n9oM9A==
X-CSE-MsgGUID: bgNNn+WmSMSO2rZSLRVpaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7402105"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 06 Nov 2026 13:55:25 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1xPRu6-00000000pz9-1Fh8;
 Fri, 06 Nov 2026 21:55:22 +0000
Date: Sat, 07 Nov 2026 05:54:58 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 28f45837549a0558c5dbe19a78c0717fc7d774ee
Message-ID: <20261107055458.uNlONuHE-lkp@intel.com>
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
branch HEAD: 28f45837549a0558c5dbe19a78c0717fc7d774ee  drm/xe/guc: Do not attribute a TDR disable to a pending suspend

elapsed time: 1496m

configs tested: 346
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                 randconfig-2000-20261105    gcc-15.3.0
alpha                 randconfig-2000-20261106    gcc-8.5.0
alpha                 randconfig-2001-20261105    gcc-15.3.0
alpha                 randconfig-2001-20261106    gcc-8.5.0
alpha                 randconfig-2200-20261105    gcc-9.5.0  smatch
alpha                randconfig-r2105-20261106    gcc-11.5.0 cocci
alpha                randconfig-r2111-20261106    clang-24   cocci
alpha                randconfig-r2308-20261105    gcc-8.5.0  sparse
alpha                randconfig-r2311-20261105    gcc-8.5.0  sparse
arc                                allnoconfig    gcc-16.2.0
arc                   randconfig-2000-20261105    gcc-8.5.0
arc                   randconfig-2000-20261106    gcc-12.5.0
arc                   randconfig-2001-20261105    gcc-8.5.0
arc                   randconfig-2001-20261106    gcc-12.5.0
arc                   randconfig-2002-20261105    gcc-8.5.0
arc                   randconfig-2002-20261106    gcc-12.5.0
arc                   randconfig-2003-20261105    gcc-8.5.0
arc                   randconfig-2003-20261106    gcc-12.5.0
arc                   randconfig-2004-20261105    gcc-8.5.0
arc                   randconfig-2004-20261106    gcc-12.5.0
arc                   randconfig-2005-20261105    gcc-8.5.0
arc                   randconfig-2005-20261106    gcc-12.5.0
arc                   randconfig-2200-20261105    gcc-8.5.0  smatch
arc                   randconfig-2200-20261106    gcc-10.5.0 smatch
arc                  randconfig-r2101-20261105    gcc-8.5.0  cocci
arc                  randconfig-r2107-20261106    clang-24   cocci
arc                  randconfig-r2301-20261106    gcc-8.5.0  sparse
arm                                allnoconfig    gcc-16.2.0
arm                      am200epdkit_defconfig    gcc-16.2.0
arm                    milbeaut_m10v_defconfig    gcc-16.2.0
arm                   randconfig-2000-20261105    clang-24
arm                   randconfig-2000-20261106    gcc-9.5.0
arm                   randconfig-2001-20261105    clang-24
arm                   randconfig-2001-20261106    gcc-9.5.0
arm                   randconfig-2002-20261105    clang-24
arm                   randconfig-2002-20261106    gcc-9.5.0
arm                   randconfig-2200-20261105    gcc-15.3.0 smatch
arm                   randconfig-2200-20261106    clang-17   smatch
arm                  randconfig-r2104-20261105    clang-24   cocci
arm                  randconfig-r2304-20261106    gcc-8.5.0  sparse
arm                              rpc_defconfig    gcc-16.2.0
arm                           sp7021_defconfig    gcc-16.2.0
arm                         vexpress_defconfig    gcc-16.2.0
arm64                              allnoconfig    gcc-16.2.0
arm64                 randconfig-2000-20261105    clang-24
arm64                 randconfig-2000-20261106    gcc-9.5.0
arm64                 randconfig-2001-20261105    clang-24
arm64                 randconfig-2001-20261106    gcc-9.5.0
arm64                 randconfig-2002-20261105    clang-24
arm64                 randconfig-2002-20261106    gcc-9.5.0
arm64                 randconfig-2200-20261105    clang-20   smatch
arm64                 randconfig-2200-20261106    clang-24   smatch
arm64                randconfig-r2100-20261106    gcc-10.5.0 cocci
csky                               allnoconfig    gcc-16.2.0
csky                  randconfig-2000-20261105    clang-24
csky                  randconfig-2000-20261106    clang-24
csky                  randconfig-2001-20261105    clang-24
csky                  randconfig-2001-20261106    clang-24
csky                  randconfig-2200-20261105    gcc-9.5.0  smatch
csky                  randconfig-2200-20261106    gcc-10.5.0 smatch
csky                 randconfig-r2108-20261106    clang-24   cocci
hexagon                            allnoconfig    gcc-16.2.0
hexagon               randconfig-1000-20261107    clang-18
hexagon               randconfig-1001-20261107    clang-18
hexagon               randconfig-2000-20261105    clang-24
hexagon               randconfig-2000-20261106    clang-24
hexagon               randconfig-2001-20261105    clang-24
hexagon               randconfig-2001-20261106    clang-24
hexagon               randconfig-2200-20261105    clang-17   smatch
hexagon               randconfig-2200-20261106    clang-24   smatch
hexagon              randconfig-r2105-20261105    clang-24   cocci
hexagon              randconfig-r2110-20261105    gcc-16.2.0 cocci
i386                               allnoconfig    gcc-16.2.0
i386                  randconfig-1007-20261107    clang-22
i386                  randconfig-1008-20261107    clang-22
i386                  randconfig-1009-20261107    clang-22
i386                  randconfig-1010-20261107    clang-22
i386                  randconfig-1011-20261107    clang-22
i386                  randconfig-1012-20261107    clang-22
i386                  randconfig-1013-20261107    clang-22
i386                  randconfig-2000-20261105    clang-22
i386                  randconfig-2000-20261106    gcc-14
i386                  randconfig-2001-20261105    clang-22
i386                  randconfig-2001-20261106    gcc-14
i386                  randconfig-2002-20261105    clang-22
i386                  randconfig-2002-20261106    gcc-14
i386                  randconfig-2003-20261105    clang-22
i386                  randconfig-2003-20261106    gcc-14
i386                  randconfig-2004-20261105    clang-22
i386                  randconfig-2004-20261106    gcc-14
i386                  randconfig-2005-20261105    clang-22
i386                  randconfig-2005-20261106    gcc-14
i386                  randconfig-2100-20261105    gcc-14     cocci
i386                  randconfig-2100-20261106    clang-22   cocci
i386                  randconfig-2101-20261105    gcc-14     cocci
i386                  randconfig-2101-20261106    clang-22   cocci
i386                  randconfig-2102-20261105    gcc-14     cocci
i386                  randconfig-2102-20261106    clang-22   cocci
i386                  randconfig-2103-20261105    gcc-14     cocci
i386                  randconfig-2103-20261106    clang-22   cocci
i386                  randconfig-2104-20261105    gcc-14     cocci
i386                  randconfig-2104-20261106    clang-22   cocci
i386                  randconfig-2105-20261105    gcc-14     cocci
i386                  randconfig-2105-20261106    clang-22   cocci
i386                  randconfig-2200-20261105    clang-22   smatch
i386                  randconfig-2200-20261106    clang-22   smatch
i386                  randconfig-2300-20261105    clang-22   sparse
i386                  randconfig-2301-20261105    clang-22   sparse
i386                  randconfig-2302-20261105    clang-22   sparse
i386                 randconfig-r2103-20261105    clang-24   cocci
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    gcc-16.2.0
loongarch             randconfig-1000-20261107    clang-18
loongarch             randconfig-1001-20261107    clang-18
loongarch             randconfig-2000-20261105    gcc-16.2.0
loongarch             randconfig-2000-20261106    clang-19
loongarch             randconfig-2001-20261105    gcc-16.2.0
loongarch             randconfig-2001-20261106    clang-19
loongarch             randconfig-2200-20261105    gcc-16.2.0 smatch
m68k                               allnoconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                           multi_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261105    gcc-15.3.0
m68k                  randconfig-2000-20261106    gcc-8.5.0
m68k                  randconfig-2001-20261105    gcc-15.3.0
m68k                  randconfig-2001-20261106    gcc-8.5.0
m68k                  randconfig-2200-20261105    gcc-8.5.0  smatch
m68k                  randconfig-2200-20261106    gcc-11.5.0 smatch
m68k                 randconfig-r2102-20261105    gcc-8.5.0  cocci
m68k                 randconfig-r2103-20261106    gcc-10.5.0 cocci
m68k                 randconfig-r2104-20261106    gcc-10.5.0 cocci
m68k                 randconfig-r2303-20261106    gcc-8.5.0  sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261105    gcc-15.3.0
microblaze            randconfig-2000-20261106    gcc-8.5.0
microblaze            randconfig-2001-20261105    gcc-15.3.0
microblaze            randconfig-2001-20261106    gcc-8.5.0
microblaze            randconfig-2200-20261105    gcc-9.5.0  smatch
microblaze            randconfig-2200-20261106    gcc-14.4.0 smatch
microblaze           randconfig-r2100-20261106    gcc-11.5.0 cocci
microblaze           randconfig-r2105-20261106    gcc-10.5.0 cocci
microblaze           randconfig-r2107-20261105    gcc-16.2.0 cocci
mips                               allnoconfig    gcc-16.2.0
mips                           ath25_defconfig    gcc-16.2.0
mips                           eyeq5_defconfig    gcc-16.2.0
mips                            gcw0_defconfig    gcc-16.2.0
mips                   maltasmvp_eva_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261105    gcc-9.5.0
mips                  randconfig-2001-20261105    gcc-9.5.0
mips                  randconfig-2002-20261105    gcc-9.5.0
mips                  randconfig-2200-20261105    gcc-11.5.0 smatch
mips                  randconfig-2200-20261106    clang-17   smatch
mips                 randconfig-r2104-20261105    gcc-8.5.0  cocci
mips                 randconfig-r2104-20261106    gcc-11.5.0 cocci
mips                 randconfig-r2110-20261106    clang-24   cocci
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261107    clang-18
nios2                 randconfig-1001-20261107    clang-18
nios2                 randconfig-2000-20261105    gcc-16.2.0
nios2                 randconfig-2000-20261106    clang-19
nios2                 randconfig-2001-20261105    gcc-16.2.0
nios2                 randconfig-2001-20261106    clang-19
nios2                 randconfig-2200-20261105    gcc-9.5.0  smatch
nios2                 randconfig-2200-20261106    gcc-10.5.0 smatch
nios2                randconfig-r2102-20261106    gcc-10.5.0 cocci
nios2                randconfig-r2310-20261105    gcc-8.5.0  sparse
openrisc                           allnoconfig    clang-24
openrisc              randconfig-2000-20261105    gcc-9.5.0
openrisc              randconfig-2001-20261105    gcc-9.5.0
openrisc              randconfig-2002-20261105    gcc-9.5.0
openrisc              randconfig-2200-20261106    gcc-16.2.0 smatch
openrisc             randconfig-r2100-20261105    clang-24   cocci
openrisc             randconfig-r2102-20261106    gcc-11.5.0 cocci
openrisc             randconfig-r2106-20261106    clang-24   cocci
openrisc             randconfig-r2111-20261105    gcc-16.2.0 cocci
parisc                             allnoconfig    clang-24
parisc                randconfig-2000-20261105    gcc-16.2.0
parisc                randconfig-2000-20261106    clang-19
parisc                randconfig-2001-20261105    gcc-16.2.0
parisc                randconfig-2001-20261106    clang-19
parisc                randconfig-2200-20261105    gcc-15.3.0 smatch
parisc                randconfig-2200-20261106    gcc-12.5.0 smatch
parisc               randconfig-r2305-20261106    gcc-8.5.0  sparse
parisc               randconfig-r2306-20261105    gcc-8.5.0  sparse
parisc               randconfig-r2307-20261105    gcc-15.3.0 sparse
parisc               randconfig-r2308-20261105    gcc-15.3.0 sparse
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                      ksi8560_defconfig    gcc-16.2.0
powerpc               randconfig-2000-20261105    clang-18
powerpc               randconfig-2000-20261106    gcc-8.5.0
powerpc               randconfig-2001-20261105    clang-18
powerpc               randconfig-2001-20261106    gcc-8.5.0
powerpc               randconfig-2002-20261105    clang-18
powerpc               randconfig-2002-20261106    gcc-8.5.0
powerpc               randconfig-2200-20261105    clang-17   smatch
powerpc               randconfig-2200-20261106    clang-24   smatch
powerpc              randconfig-r2101-20261106    gcc-11.5.0 cocci
powerpc                      tqm5200_defconfig    gcc-16.2.0
powerpc                          wii_defconfig    gcc-16.2.0
powerpc64             randconfig-2000-20261105    clang-18
powerpc64             randconfig-2000-20261106    gcc-8.5.0
powerpc64             randconfig-2001-20261105    clang-18
powerpc64             randconfig-2001-20261106    gcc-8.5.0
powerpc64             randconfig-2002-20261105    clang-18
powerpc64             randconfig-2002-20261106    gcc-8.5.0
powerpc64             randconfig-2200-20261105    clang-24   smatch
powerpc64             randconfig-2200-20261106    gcc-8.5.0  smatch
powerpc64            randconfig-r2102-20261105    clang-24   cocci
powerpc64            randconfig-r2103-20261105    gcc-8.5.0  cocci
powerpc64            randconfig-r2307-20261105    gcc-8.5.0  sparse
riscv                              allnoconfig    clang-24
riscv                 randconfig-1000-20261107    gcc-11.5.0
riscv                 randconfig-1001-20261107    gcc-11.5.0
riscv                 randconfig-2000-20261105    clang-24
riscv                 randconfig-2001-20261105    clang-24
riscv                 randconfig-2002-20261105    clang-24
riscv                 randconfig-2003-20261105    clang-24
riscv                 randconfig-2004-20261105    clang-24
riscv                 randconfig-2005-20261105    clang-24
riscv                 randconfig-2200-20261105    clang-24   smatch
riscv                 randconfig-2200-20261106    gcc-11.5.0 smatch
riscv                randconfig-r2100-20261105    gcc-8.5.0  cocci
riscv                randconfig-r2300-20261106    gcc-8.5.0  sparse
riscv                randconfig-r2309-20261105    gcc-8.5.0  sparse
riscv                randconfig-r2311-20261105    gcc-15.3.0 sparse
s390                               allnoconfig    clang-24
s390                  randconfig-1000-20261107    gcc-11.5.0
s390                  randconfig-1001-20261107    gcc-11.5.0
s390                  randconfig-2000-20261105    clang-24
s390                  randconfig-2001-20261105    clang-24
s390                  randconfig-2002-20261105    clang-24
s390                  randconfig-2003-20261105    clang-24
s390                  randconfig-2004-20261105    clang-24
s390                  randconfig-2005-20261105    clang-24
s390                  randconfig-2200-20261105    clang-24   smatch
s390                  randconfig-2200-20261106    clang-18   smatch
s390                 randconfig-r2108-20261105    gcc-16.2.0 cocci
s390                 randconfig-r2109-20261106    clang-24   cocci
sh                                 allnoconfig    clang-24
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261107    gcc-11.5.0
sh                    randconfig-1001-20261107    gcc-11.5.0
sh                    randconfig-2000-20261105    gcc-16.2.0
sh                    randconfig-2001-20261105    gcc-16.2.0
sh                    randconfig-2002-20261105    gcc-16.2.0
sh                    randconfig-2003-20261105    gcc-16.2.0
sh                    randconfig-2004-20261105    gcc-16.2.0
sh                    randconfig-2005-20261105    gcc-16.2.0
sh                    randconfig-2200-20261105    gcc-13.5.0 smatch
sh                    randconfig-2200-20261106    gcc-16.2.0 smatch
sh                   randconfig-r2103-20261106    gcc-11.5.0 cocci
sh                   randconfig-r2309-20261105    gcc-15.3.0 sparse
sh                            se7619_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                 randconfig-2000-20261105    clang-24
sparc                 randconfig-2000-20261106    gcc-8.5.0
sparc                 randconfig-2001-20261105    clang-24
sparc                 randconfig-2001-20261106    gcc-8.5.0
sparc                 randconfig-2200-20261105    gcc-16.2.0 smatch
sparc                 randconfig-2200-20261106    gcc-8.5.0  smatch
sparc                randconfig-r2101-20261105    clang-24   cocci
sparc                randconfig-r2302-20261106    gcc-8.5.0  sparse
sparc64                              defconfig    gcc-14
sparc64               randconfig-2000-20261105    clang-24
sparc64               randconfig-2000-20261106    gcc-8.5.0
sparc64               randconfig-2001-20261105    clang-24
sparc64               randconfig-2001-20261106    gcc-8.5.0
sparc64               randconfig-2200-20261105    gcc-8.5.0  smatch
sparc64               randconfig-2200-20261106    gcc-8.5.0  smatch
um                                 allnoconfig    clang-24
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-2000-20261105    clang-24
um                    randconfig-2000-20261106    gcc-8.5.0
um                    randconfig-2001-20261105    clang-24
um                    randconfig-2001-20261106    gcc-8.5.0
um                    randconfig-2200-20261105    clang-19   smatch
um                    randconfig-2200-20261106    gcc-13     smatch
um                   randconfig-r2101-20261106    gcc-10.5.0 cocci
um                   randconfig-r2306-20261105    gcc-15.3.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            alldefconfig    gcc-16.2.0
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261107    gcc-14
x86_64      buildonly-randconfig-1001-20261107    gcc-14
x86_64      buildonly-randconfig-1002-20261107    gcc-14
x86_64      buildonly-randconfig-1003-20261107    gcc-14
x86_64      buildonly-randconfig-1004-20261107    gcc-14
x86_64      buildonly-randconfig-1005-20261107    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261107    gcc-14
x86_64                randconfig-1001-20261107    gcc-14
x86_64                randconfig-1002-20261107    gcc-14
x86_64                randconfig-1003-20261107    gcc-14
x86_64                randconfig-1004-20261107    gcc-14
x86_64                randconfig-1005-20261107    gcc-14
x86_64                randconfig-2000-20261105    gcc-14
x86_64                randconfig-2001-20261105    gcc-14
x86_64                randconfig-2002-20261105    gcc-14
x86_64                randconfig-2003-20261105    gcc-14
x86_64                randconfig-2004-20261105    gcc-14
x86_64                randconfig-2005-20261105    gcc-14
x86_64                randconfig-2100-20261105    gcc-14     cocci
x86_64                randconfig-2100-20261106    clang-22   cocci
x86_64                randconfig-2101-20261105    gcc-14     cocci
x86_64                randconfig-2101-20261106    clang-22   cocci
x86_64                randconfig-2102-20261105    gcc-14     cocci
x86_64                randconfig-2102-20261106    clang-22   cocci
x86_64                randconfig-2103-20261105    gcc-14     cocci
x86_64                randconfig-2103-20261106    clang-22   cocci
x86_64                randconfig-2104-20261105    gcc-14     cocci
x86_64                randconfig-2104-20261106    clang-22   cocci
x86_64                randconfig-2105-20261105    gcc-14     cocci
x86_64                randconfig-2105-20261106    clang-22   cocci
x86_64                randconfig-2200-20261105    clang-22   smatch
x86_64                randconfig-2200-20261106    gcc-14     smatch
x86_64                randconfig-2300-20261105    clang-22   sparse
x86_64                randconfig-2301-20261105    clang-22   sparse
x86_64                randconfig-2302-20261105    clang-22   sparse
x86_64               randconfig-r2109-20261105    gcc-16.2.0 cocci
x86_64               randconfig-r2310-20261105    gcc-15.3.0 sparse
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
xtensa                             allnoconfig    clang-24
xtensa                randconfig-2000-20261105    clang-24
xtensa                randconfig-2000-20261106    clang-24
xtensa                randconfig-2001-20261105    clang-24
xtensa                randconfig-2001-20261106    clang-24
xtensa                randconfig-2200-20261105    gcc-8.5.0  smatch
xtensa                randconfig-2200-20261106    gcc-8.5.0  smatch
xtensa               randconfig-r2105-20261105    gcc-8.5.0  cocci
xtensa               randconfig-r2106-20261105    gcc-16.2.0 cocci

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
