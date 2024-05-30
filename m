Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7828AC25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 18:44:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8684B10EDEC;
	Thu, 30 May 2024 18:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QXnEjMb+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A2010EDEC
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 18:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717094664; x=1748630664;
 h=date:from:to:cc:subject:message-id;
 bh=mYXoXR66758pI/nLLes5JZ8TeUbFGx+nD5BqRZ5HU8w=;
 b=QXnEjMb+78einkm9iB/8Ezbq8uoR1KBgsUYs0xriUiSCo9aiS8s3tl1+
 eZ0lk2yxyD33vMzeGVmzIfvT8Yx0ERg6z/hnXukc/0dDMgCBeVUpwNvZ0
 BJCn5JZEZuxuuR4jXqIfc8dXJyaVhhh138kgs4mbw88XmTwpoPlNmp/9Q
 uO6OJ8u2gaDi6zltna2op94+8qJUpQCBbapNIysqvdwC0Qfe8PT4XVucV
 qVHIKyGCbabDQJZZ7mESxDFajBV/gMklMfsfo+B+AnslqPFcmbMWXDTyv
 iYDBY3A3ve42MaMTsViE0+FG8r56KiIz9pIjpkaudXQiBkNWaEsUS8BfP Q==;
X-CSE-ConnectionGUID: UQIDtjchSUOhnC2baKhlIQ==
X-CSE-MsgGUID: JWO3z482Ql6PoQ7frYR60g==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13733059"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="13733059"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 11:44:22 -0700
X-CSE-ConnectionGUID: PfwYHNwcT8K3t4mwhT45iw==
X-CSE-MsgGUID: riIrVQj+SHix42nrvqA+qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="73404242"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 30 May 2024 11:44:21 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sCkl8-000Frd-1s;
 Thu, 30 May 2024 18:44:18 +0000
Date: Fri, 31 May 2024 02:43:32 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:topic/xe-for-CI] BUILD SUCCESS
 428c3ef38ef5565140b2104f0d3dafdae9056ca9
Message-ID: <202405310230.CLwoPcqg-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git topic/xe-for-CI
branch HEAD: 428c3ef38ef5565140b2104f0d3dafdae9056ca9  Revert "drm/xe/gsc: define GSC FW for LNL"

elapsed time: 1458m

configs tested: 170
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240530   gcc  
arc                   randconfig-002-20240530   gcc  
arc                   randconfig-002-20240531   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   gcc  
arm                         axm55xx_defconfig   clang
arm                         bcm2835_defconfig   clang
arm                          collie_defconfig   gcc  
arm                                 defconfig   clang
arm                      jornada720_defconfig   clang
arm                         lpc18xx_defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                   randconfig-001-20240530   clang
arm                   randconfig-002-20240530   gcc  
arm                   randconfig-003-20240530   clang
arm                   randconfig-004-20240530   gcc  
arm                        shmobile_defconfig   gcc  
arm                           spitz_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240530   clang
arm64                 randconfig-002-20240530   gcc  
arm64                 randconfig-003-20240530   gcc  
arm64                 randconfig-004-20240530   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240530   gcc  
csky                  randconfig-002-20240530   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240530   clang
hexagon               randconfig-002-20240530   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240530   gcc  
i386         buildonly-randconfig-002-20240530   gcc  
i386         buildonly-randconfig-003-20240530   clang
i386         buildonly-randconfig-004-20240530   clang
i386         buildonly-randconfig-005-20240530   clang
i386         buildonly-randconfig-006-20240530   clang
i386                                defconfig   clang
i386                  randconfig-001-20240530   gcc  
i386                  randconfig-002-20240530   clang
i386                  randconfig-003-20240530   gcc  
i386                  randconfig-004-20240530   clang
i386                  randconfig-005-20240530   gcc  
i386                  randconfig-006-20240530   gcc  
i386                  randconfig-011-20240530   clang
i386                  randconfig-012-20240530   gcc  
i386                  randconfig-013-20240530   clang
i386                  randconfig-014-20240530   clang
i386                  randconfig-015-20240530   gcc  
i386                  randconfig-016-20240530   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240530   gcc  
loongarch             randconfig-002-20240530   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                   sb1250_swarm_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240530   gcc  
nios2                 randconfig-002-20240530   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240530   gcc  
parisc                randconfig-002-20240530   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   gcc  
powerpc                 mpc836x_rdk_defconfig   clang
powerpc               randconfig-001-20240530   gcc  
powerpc               randconfig-003-20240530   gcc  
powerpc                    socrates_defconfig   gcc  
powerpc64             randconfig-001-20240530   gcc  
riscv                            alldefconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
riscv                 randconfig-002-20240530   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240530   gcc  
sh                    randconfig-002-20240530   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240530   gcc  
sparc64               randconfig-002-20240530   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240530   gcc  
um                    randconfig-002-20240530   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240530   clang
x86_64       buildonly-randconfig-002-20240530   clang
x86_64       buildonly-randconfig-003-20240530   gcc  
x86_64       buildonly-randconfig-004-20240530   gcc  
x86_64       buildonly-randconfig-005-20240530   clang
x86_64       buildonly-randconfig-006-20240530   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240530   clang
x86_64                randconfig-002-20240530   clang
x86_64                randconfig-003-20240530   clang
x86_64                randconfig-004-20240530   clang
x86_64                randconfig-005-20240530   clang
x86_64                randconfig-006-20240530   clang
x86_64                randconfig-011-20240530   clang
x86_64                randconfig-012-20240530   gcc  
x86_64                randconfig-013-20240530   gcc  
x86_64                randconfig-014-20240530   gcc  
x86_64                randconfig-015-20240530   clang
x86_64                randconfig-016-20240530   gcc  
x86_64                randconfig-071-20240530   clang
x86_64                randconfig-072-20240530   clang
x86_64                randconfig-073-20240530   clang
x86_64                randconfig-074-20240530   clang
x86_64                randconfig-075-20240530   gcc  
x86_64                randconfig-076-20240530   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240530   gcc  
xtensa                randconfig-002-20240530   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
