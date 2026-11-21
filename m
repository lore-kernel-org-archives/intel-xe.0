Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7132606A32A
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 06:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F1c7eBJm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7721310E05F;
	Sat, 21 Nov 2026 06:18:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A047410E05F
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 06:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795241893; x=1826777893;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=FFJkdsHCpRZGuLONfFjA9Ji5IP8M9YQSmLYPDypL59M=;
 b=F1c7eBJmGmtmgxoZfKUGsBjsLVSED5hiJy9uRwIZ+xn+1J3enI38wQY7
 Mu5ZlT7wQWos3W/XcPwhVFoAmXvaq8xdoUYfQI9akVn/xHDVVtb7HnjZT
 wq+vOfxLUI2ctV8DqGmoyqPuLkV5QYKWd1pdEwXCXBvLXt+alx9Gf5MpE
 luBtKfwDlqYdJ7CINXvdq7L5/552jlZeTQXk+q7jiOkFaooaNlap3VgzQ
 p4uWdlCv540qG1mXpsdqgGNUjPHUSMnemE9/aSaCLpLkkTKYDLBGp8N3m
 Jt3KtdAY5QrJy3GMc/PqMeL0+b3+CfSBy7ReeZPGufGWZFdz/kIXmi0GH Q==;
X-CSE-ConnectionGUID: C0dvB9xdTw2F4OqwQCsfjQ==
X-CSE-MsgGUID: zezHl1hjQ4Opv/dJ5YDgwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4204179"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4204179"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 22:18:13 -0800
X-CSE-ConnectionGUID: yAsU6jqaQV6ym+kGjbkgVA==
X-CSE-MsgGUID: DakaHaX4RvGQP5jJSLGmHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; d="scan'208";a="10988579"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 20 Nov 2026 22:18:11 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1xUeQL-00000001JdY-2Evc;
 Sat, 21 Nov 2026 06:18:09 +0000
Date: Sat, 21 Nov 2026 14:17:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 61df0d1929e7e99d38404a1be02c461a8f6a3f5a
Message-ID: <20261121141711.3RHMe2kw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: 61df0d1929e7e99d38404a1be02c461a8f6a3f5a  drm/xe: Add a per-client debugfs file reporting bo NUMA node distribution

elapsed time: 1468m

configs tested: 339
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                 randconfig-2000-20261119    gcc-8.5.0
alpha                 randconfig-2001-20261119    gcc-8.5.0
alpha                 randconfig-2200-20261119    gcc-12.5.0 smatch
alpha                randconfig-r2100-20261119    gcc-10.5.0 cocci
alpha                randconfig-r2102-20261119    gcc-10.5.0 cocci
alpha                randconfig-r2301-20261119    clang-22   sparse
alpha                randconfig-r2305-20261119    gcc-16.2.0 sparse
alpha                randconfig-r2311-20261119    gcc-14.4.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                   randconfig-1000-20261121    clang-24
arc                   randconfig-1001-20261121    clang-24
arc                   randconfig-2000-20261119    gcc-14.4.0
arc                   randconfig-2001-20261119    gcc-14.4.0
arc                   randconfig-2002-20261119    gcc-14.4.0
arc                   randconfig-2003-20261119    gcc-14.4.0
arc                   randconfig-2004-20261119    gcc-14.4.0
arc                   randconfig-2005-20261119    gcc-14.4.0
arc                   randconfig-2200-20261119    gcc-16.2.0 smatch
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                         multi_v7_defconfig    clang-17
arm                   randconfig-1000-20261121    clang-24
arm                   randconfig-1001-20261121    clang-24
arm                   randconfig-1002-20261121    clang-24
arm                   randconfig-1003-20261121    clang-24
arm                   randconfig-2000-20261119    gcc-16.2.0
arm                   randconfig-2001-20261119    gcc-16.2.0
arm                   randconfig-2002-20261119    gcc-16.2.0
arm                   randconfig-2200-20261119    clang-24   smatch
arm                  randconfig-r2105-20261119    gcc-10.5.0 cocci
arm                  randconfig-r2305-20261119    gcc-13.5.0 sparse
arm                  randconfig-r2308-20261119    gcc-14.4.0 sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                 randconfig-2000-20261119    gcc-16.2.0
arm64                 randconfig-2001-20261119    gcc-16.2.0
arm64                 randconfig-2002-20261119    gcc-16.2.0
arm64                 randconfig-2200-20261119    clang-17   smatch
arm64                randconfig-r2101-20261119    gcc-15.3.0 cocci
arm64                randconfig-r2103-20261119    gcc-10.5.0 cocci
arm64                randconfig-r2105-20261119    gcc-8.5.0  cocci
arm64                randconfig-r2110-20261119    clang-24   cocci
arm64                randconfig-r2301-20261119    gcc-13.5.0 sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                  randconfig-2000-20261119    gcc-16.2.0
csky                  randconfig-2001-20261119    gcc-16.2.0
csky                  randconfig-2200-20261119    gcc-16.2.0 smatch
csky                 randconfig-r2304-20261119    gcc-16.2.0 sparse
csky                 randconfig-r2308-20261119    gcc-11.5.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon               randconfig-2000-20261119    gcc-16.2.0
hexagon               randconfig-2001-20261119    gcc-16.2.0
hexagon               randconfig-2200-20261119    clang-17   smatch
hexagon              randconfig-r2301-20261119    clang-24   sparse
hexagon              randconfig-r2309-20261119    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261120    clang-22
i386        buildonly-randconfig-1001-20261120    clang-22
i386        buildonly-randconfig-1002-20261120    clang-22
i386        buildonly-randconfig-1003-20261120    clang-22
i386        buildonly-randconfig-1004-20261120    clang-22
i386        buildonly-randconfig-1005-20261120    clang-22
i386                  randconfig-1000-20261120    clang-22
i386                  randconfig-1001-20261120    clang-22
i386                  randconfig-1002-20261120    clang-22
i386                  randconfig-1003-20261120    clang-22
i386                  randconfig-1004-20261120    clang-22
i386                  randconfig-1005-20261120    clang-22
i386                  randconfig-1006-20261120    clang-22
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
i386                 randconfig-r2104-20261119    gcc-8.5.0  cocci
i386                 randconfig-r2106-20261119    clang-24   cocci
i386                 randconfig-r2305-20261119    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch             randconfig-2000-20261119    gcc-8.5.0
loongarch             randconfig-2001-20261119    gcc-8.5.0
loongarch             randconfig-2200-20261119    clang-24   smatch
loongarch            randconfig-r2105-20261119    gcc-14.4.0 cocci
loongarch            randconfig-r2107-20261119    clang-24   cocci
loongarch            randconfig-r2110-20261119    gcc-10.5.0 cocci
loongarch            randconfig-r2303-20261119    gcc-13.5.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                        m5275evb_defconfig    clang-17
m68k                  randconfig-2000-20261119    gcc-8.5.0
m68k                  randconfig-2001-20261119    gcc-8.5.0
m68k                  randconfig-2200-20261119    gcc-9.5.0  smatch
m68k                 randconfig-r2102-20261119    gcc-15.3.0 cocci
m68k                 randconfig-r2106-20261119    gcc-10.5.0 cocci
m68k                 randconfig-r2111-20261119    clang-24   cocci
m68k                 randconfig-r2302-20261119    clang-22   sparse
m68k                 randconfig-r2304-20261119    clang-24   sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze            randconfig-2000-20261119    gcc-8.5.0
microblaze            randconfig-2001-20261119    gcc-8.5.0
microblaze            randconfig-2200-20261119    gcc-12.5.0 smatch
microblaze           randconfig-r2103-20261119    gcc-14.4.0 cocci
microblaze           randconfig-r2108-20261119    clang-24   cocci
microblaze           randconfig-r2111-20261119    clang-24   cocci
microblaze           randconfig-r2307-20261119    gcc-11.5.0 sparse
microblaze           randconfig-r2311-20261119    clang-24   sparse
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                 econet_en751221_defconfig    clang-17
mips                            ip32_defconfig    clang-17
mips                  randconfig-2000-20261119    gcc-16.2.0
mips                  randconfig-2001-20261119    gcc-16.2.0
mips                  randconfig-2002-20261119    gcc-16.2.0
mips                  randconfig-2200-20261119    clang-24   smatch
mips                 randconfig-r2107-20261119    clang-24   cocci
mips                 randconfig-r2306-20261119    gcc-11.5.0 sparse
mips                 randconfig-r2310-20261119    gcc-14.4.0 sparse
mips                 randconfig-r2311-20261119    gcc-11.5.0 sparse
mips                          rt305x_defconfig    clang-17
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                 randconfig-2000-20261119    gcc-8.5.0
nios2                 randconfig-2001-20261119    gcc-8.5.0
nios2                 randconfig-2200-20261119    gcc-11.5.0 smatch
nios2                randconfig-r2102-20261119    gcc-14.4.0 cocci
nios2                randconfig-r2109-20261119    clang-24   cocci
nios2                randconfig-r2302-20261119    gcc-16.2.0 sparse
nios2                randconfig-r2310-20261119    gcc-11.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc          de0_nano_multicore_defconfig    clang-17
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261119    gcc-16.2.0
openrisc              randconfig-2001-20261119    gcc-16.2.0
openrisc              randconfig-2002-20261119    gcc-16.2.0
openrisc              randconfig-2200-20261119    gcc-16.2.0 smatch
openrisc             randconfig-r2100-20261119    gcc-14.4.0 cocci
openrisc             randconfig-r2103-20261119    gcc-15.3.0 cocci
openrisc             randconfig-r2109-20261119    gcc-10.5.0 cocci
openrisc             randconfig-r2110-20261119    clang-24   cocci
openrisc             randconfig-r2303-20261119    clang-24   sparse
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                 generic-64bit_defconfig    clang-17
parisc                randconfig-1000-20261121    gcc-10.5.0
parisc                randconfig-1001-20261121    gcc-10.5.0
parisc                randconfig-2000-20261119    gcc-8.5.0
parisc                randconfig-2001-20261119    gcc-8.5.0
parisc                randconfig-2200-20261119    gcc-14.4.0 smatch
parisc               randconfig-r2108-20261119    gcc-10.5.0 cocci
parisc               randconfig-r2111-20261119    gcc-10.5.0 cocci
parisc               randconfig-r2304-20261119    clang-22   sparse
powerpc                            allnoconfig    clang-24
powerpc               randconfig-1000-20261121    gcc-10.5.0
powerpc               randconfig-1001-20261121    gcc-10.5.0
powerpc               randconfig-2000-20261119    gcc-15.3.0
powerpc               randconfig-2001-20261119    gcc-15.3.0
powerpc               randconfig-2002-20261119    gcc-15.3.0
powerpc               randconfig-2200-20261119    gcc-13.5.0 smatch
powerpc              randconfig-r2102-20261119    gcc-8.5.0  cocci
powerpc              randconfig-r2106-20261119    clang-24   cocci
powerpc              randconfig-r2108-20261119    clang-24   cocci
powerpc              randconfig-r2303-20261119    clang-22   sparse
powerpc              randconfig-r2307-20261119    clang-24   sparse
powerpc              randconfig-r2307-20261119    gcc-14.4.0 sparse
powerpc64             randconfig-1000-20261121    gcc-10.5.0
powerpc64             randconfig-1001-20261121    gcc-10.5.0
powerpc64             randconfig-2000-20261119    gcc-15.3.0
powerpc64             randconfig-2001-20261119    gcc-15.3.0
powerpc64             randconfig-2002-20261119    gcc-15.3.0
powerpc64             randconfig-2200-20261119    clang-24   smatch
powerpc64            randconfig-r2109-20261119    clang-24   cocci
powerpc64            randconfig-r2305-20261119    clang-24   sparse
powerpc64            randconfig-r2306-20261119    gcc-14.4.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-2000-20261119    clang-24
riscv                 randconfig-2000-20261120    clang-24
riscv                 randconfig-2001-20261119    clang-24
riscv                 randconfig-2001-20261120    clang-24
riscv                 randconfig-2002-20261119    clang-24
riscv                 randconfig-2002-20261120    clang-24
riscv                 randconfig-2003-20261119    clang-24
riscv                 randconfig-2003-20261120    clang-24
riscv                 randconfig-2004-20261119    clang-24
riscv                 randconfig-2004-20261120    clang-24
riscv                 randconfig-2005-20261119    clang-24
riscv                 randconfig-2005-20261120    clang-24
riscv                 randconfig-2200-20261119    clang-24   smatch
riscv                randconfig-r2101-20261119    gcc-8.5.0  cocci
riscv                randconfig-r2300-20261119    clang-22   sparse
riscv                randconfig-r2309-20261119    gcc-11.5.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-2000-20261119    clang-20
s390                  randconfig-2001-20261119    clang-20
s390                  randconfig-2002-20261119    clang-20
s390                  randconfig-2003-20261119    clang-20
s390                  randconfig-2004-20261119    clang-20
s390                  randconfig-2005-20261119    clang-20
s390                  randconfig-2200-20261119    clang-24   smatch
s390                 randconfig-r2101-20261119    gcc-10.5.0 cocci
s390                 randconfig-r2104-20261119    gcc-15.3.0 cocci
s390                 randconfig-r2306-20261119    clang-24   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-2000-20261119    gcc-12.5.0
sh                    randconfig-2001-20261119    gcc-12.5.0
sh                    randconfig-2002-20261119    gcc-12.5.0
sh                    randconfig-2003-20261119    gcc-12.5.0
sh                    randconfig-2004-20261119    gcc-12.5.0
sh                    randconfig-2005-20261119    gcc-12.5.0
sh                    randconfig-2200-20261119    gcc-16.2.0 smatch
sh                   randconfig-r2104-20261119    gcc-14.4.0 cocci
sh                   randconfig-r2108-20261119    clang-24   cocci
sh                   randconfig-r2111-20261119    clang-24   cocci
sh                   randconfig-r2300-20261119    gcc-16.2.0 sparse
sh                   randconfig-r2302-20261119    gcc-13.5.0 sparse
sh                   randconfig-r2303-20261119    gcc-16.2.0 sparse
sh                            se7780_defconfig    clang-17
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-2000-20261119    clang-21
sparc                 randconfig-2001-20261119    clang-21
sparc                 randconfig-2200-20261119    gcc-8.5.0  smatch
sparc                randconfig-r2101-20261119    gcc-14.4.0 cocci
sparc                randconfig-r2103-20261119    gcc-8.5.0  cocci
sparc                randconfig-r2107-20261119    clang-24   cocci
sparc                randconfig-r2302-20261119    clang-24   sparse
sparc                randconfig-r2309-20261119    gcc-14.4.0 sparse
sparc                randconfig-r2310-20261119    clang-24   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-2000-20261119    clang-21
sparc64               randconfig-2001-20261119    clang-21
sparc64               randconfig-2200-20261119    gcc-13.5.0 smatch
sparc64              randconfig-r2107-20261119    gcc-10.5.0 cocci
sparc64              randconfig-r2300-20261119    clang-24   sparse
sparc64              randconfig-r2300-20261119    gcc-13.5.0 sparse
sparc64              randconfig-r2308-20261119    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-2000-20261119    clang-21
um                    randconfig-2001-20261119    clang-21
um                   randconfig-r2104-20261119    gcc-10.5.0 cocci
um                   randconfig-r2106-20261119    clang-24   cocci
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261120    clang-22
x86_64      buildonly-randconfig-1001-20261120    clang-22
x86_64      buildonly-randconfig-1002-20261120    clang-22
x86_64      buildonly-randconfig-1003-20261120    clang-22
x86_64      buildonly-randconfig-1004-20261120    clang-22
x86_64      buildonly-randconfig-1005-20261120    clang-22
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
x86_64               randconfig-r2110-20261119    clang-24   cocci
x86_64               randconfig-r2304-20261119    gcc-13.5.0 sparse
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
xtensa                randconfig-2000-20261119    gcc-16.2.0
xtensa                randconfig-2001-20261119    gcc-16.2.0
xtensa                randconfig-2200-20261119    gcc-14.4.0 smatch
xtensa               randconfig-r2100-20261119    gcc-15.3.0 cocci
xtensa               randconfig-r2100-20261119    gcc-8.5.0  cocci
xtensa               randconfig-r2105-20261119    gcc-15.3.0 cocci
xtensa               randconfig-r2109-20261119    clang-24   cocci
xtensa               randconfig-r2301-20261119    gcc-16.2.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
