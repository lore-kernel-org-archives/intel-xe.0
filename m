Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64518C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 12:53:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1677010E993;
	Fri, 10 May 2024 12:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CmqrUndE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89C710E993
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 12:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715345590; x=1746881590;
 h=date:from:to:cc:subject:message-id;
 bh=QRmC8aCO1hGWlj7FcPpgjclfXwuBwzd2J4Mxt1xRyds=;
 b=CmqrUndEtoEDsoVS9BxddFDRDaN0DTUG2Eil5DZpyJesZzhNCXbTkudp
 YY2E4LC4gOIOziJzbuOyMzYyMYyPzsWhmrKAA71lUXGzFcjkywoondCzm
 C0uqk2dSk1hBgw6s5ybXmKgGA777tKoTWL8B2Femfp0t36sPGCtP6koPz
 FM2AAZadobIrViI74zaRU8lv14EkmzKT4pjDe1WvcLQaADYuI6tlQbnYd
 aldoO2BYvWpYRyZcoMalm1PV/hJtfz/SQTh27pdNVsX2Rny5S4WLsYaRb
 +be8ZpcnHQEzYOcCkIy5wbXVne7xfEFA6zztCHYsNBD+b8Ra0GJUgeLY4 g==;
X-CSE-ConnectionGUID: uJW1YCd4SLGf3z/xhsCYOQ==
X-CSE-MsgGUID: aR+7eX2SThqTYuoUVDuCKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11202501"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11202501"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 05:53:09 -0700
X-CSE-ConnectionGUID: ZvWY0gdARi+6g7QAP0gnQg==
X-CSE-MsgGUID: w4djiv1BTma2sANCqecp8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29667961"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 10 May 2024 05:53:09 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s5PkH-00069e-1m;
 Fri, 10 May 2024 12:53:05 +0000
Date: Fri, 10 May 2024 20:52:59 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 c002bfe644a29ba600c571f2abba13a155a12dcd
Message-ID: <202405102057.BDDrDmXJ-lkp@intel.com>
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
branch HEAD: c002bfe644a29ba600c571f2abba13a155a12dcd  drm/xe: Use ordered WQ for G2H handler

elapsed time: 1205m

configs tested: 176
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
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240510   gcc  
arc                   randconfig-002-20240510   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        mvebu_v5_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                   randconfig-001-20240510   gcc  
arm                   randconfig-002-20240510   clang
arm                   randconfig-003-20240510   gcc  
arm                   randconfig-004-20240510   gcc  
arm                           stm32_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240510   clang
arm64                 randconfig-002-20240510   gcc  
arm64                 randconfig-003-20240510   clang
arm64                 randconfig-004-20240510   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240510   gcc  
csky                  randconfig-002-20240510   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240510   clang
hexagon               randconfig-002-20240510   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240510   clang
i386         buildonly-randconfig-002-20240510   gcc  
i386         buildonly-randconfig-003-20240510   clang
i386         buildonly-randconfig-004-20240510   clang
i386         buildonly-randconfig-005-20240510   clang
i386         buildonly-randconfig-006-20240510   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240510   clang
i386                  randconfig-002-20240510   clang
i386                  randconfig-003-20240510   gcc  
i386                  randconfig-004-20240510   gcc  
i386                  randconfig-005-20240510   clang
i386                  randconfig-006-20240510   clang
i386                  randconfig-011-20240510   clang
i386                  randconfig-012-20240510   clang
i386                  randconfig-013-20240510   gcc  
i386                  randconfig-014-20240510   clang
i386                  randconfig-015-20240510   gcc  
i386                  randconfig-016-20240510   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240510   gcc  
loongarch             randconfig-002-20240510   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240510   gcc  
nios2                 randconfig-002-20240510   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240510   gcc  
parisc                randconfig-002-20240510   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240510   gcc  
powerpc               randconfig-002-20240510   gcc  
powerpc               randconfig-003-20240510   clang
powerpc                      walnut_defconfig   gcc  
powerpc64             randconfig-001-20240510   clang
powerpc64             randconfig-002-20240510   clang
powerpc64             randconfig-003-20240510   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240510   clang
riscv                 randconfig-002-20240510   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240510   gcc  
s390                  randconfig-002-20240510   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                    randconfig-001-20240510   gcc  
sh                    randconfig-002-20240510   gcc  
sh                           se7750_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240510   gcc  
sparc64               randconfig-002-20240510   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240510   gcc  
um                    randconfig-002-20240510   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240510   gcc  
x86_64       buildonly-randconfig-002-20240510   clang
x86_64       buildonly-randconfig-003-20240510   gcc  
x86_64       buildonly-randconfig-004-20240510   clang
x86_64       buildonly-randconfig-005-20240510   gcc  
x86_64       buildonly-randconfig-006-20240510   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240510   gcc  
x86_64                randconfig-002-20240510   clang
x86_64                randconfig-003-20240510   clang
x86_64                randconfig-004-20240510   gcc  
x86_64                randconfig-005-20240510   gcc  
x86_64                randconfig-006-20240510   gcc  
x86_64                randconfig-011-20240510   clang
x86_64                randconfig-012-20240510   clang
x86_64                randconfig-013-20240510   clang
x86_64                randconfig-016-20240510   gcc  
x86_64                randconfig-074-20240510   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240510   gcc  
xtensa                randconfig-002-20240510   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
