Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B15C54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 17:41:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A80B10F534;
	Thu, 14 Mar 2024 17:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rub/b7x6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEB110F326
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 17:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710438100; x=1741974100;
 h=date:from:to:cc:subject:message-id;
 bh=cd7kjZOxSA0AnazA3CIZpw1BkdK25b/hkyvwNL26TvA=;
 b=Rub/b7x6nruely2UOn8KWnmS+vfIl6kTFB1L9MXpd0gSTaTUA1NpQxO3
 TCxFBRP8mW6FW/wQUy90kAHK4yHFJO0wCuv0/Ui9gZdplTy3Lw/i2Ki94
 UqKwX8c4j2ViHX4/XTrLsrvoD8WVXEv94EWEKCUzlNu3k5utBqj5ykTvi
 QBUyMoogXp2X460X9XbqwiFWJOKZlIFrgzBmgq3ZTpHg3wGxKmeVSZBAf
 VsI2piweoNhzRZDZrhu3NBso7N+xfO0CyQhCbqDVjBePGLXWu3fh61eX1
 0Y2bHljXns2svKUH22dwO7swbSLja3XWVb3g/r7qQUzzUi1ivzueOpiiD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5462310"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="5462310"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:41:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="49809882"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 14 Mar 2024 10:41:39 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rkp5E-000DgN-0v;
 Thu, 14 Mar 2024 17:41:36 +0000
Date: Fri, 15 Mar 2024 01:40:37 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 002d8f0b4f76aabbf8e00c538a124b91625d7260
Message-ID: <202403150133.fGnwei4A-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: 002d8f0b4f76aabbf8e00c538a124b91625d7260  drm/xe: Remove unused xe_bo->props struct

elapsed time: 727m

configs tested: 145
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
arc                   randconfig-001-20240314   gcc  
arc                   randconfig-002-20240314   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240314   gcc  
arm                   randconfig-002-20240314   gcc  
arm                   randconfig-003-20240314   clang
arm                   randconfig-004-20240314   gcc  
arm                        vexpress_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240314   gcc  
arm64                 randconfig-002-20240314   gcc  
arm64                 randconfig-003-20240314   clang
arm64                 randconfig-004-20240314   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240314   gcc  
csky                  randconfig-002-20240314   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240314   clang
hexagon               randconfig-002-20240314   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240314   clang
i386         buildonly-randconfig-002-20240314   clang
i386         buildonly-randconfig-003-20240314   gcc  
i386         buildonly-randconfig-004-20240314   gcc  
i386         buildonly-randconfig-005-20240314   gcc  
i386         buildonly-randconfig-006-20240314   clang
i386                                defconfig   clang
i386                  randconfig-001-20240314   gcc  
i386                  randconfig-002-20240314   clang
i386                  randconfig-003-20240314   gcc  
i386                  randconfig-004-20240314   clang
i386                  randconfig-005-20240314   gcc  
i386                  randconfig-006-20240314   gcc  
i386                  randconfig-011-20240314   clang
i386                  randconfig-012-20240314   gcc  
i386                  randconfig-013-20240314   clang
i386                  randconfig-014-20240314   gcc  
i386                  randconfig-015-20240314   clang
i386                  randconfig-016-20240314   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240314   gcc  
loongarch             randconfig-002-20240314   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1000-neo_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                        maltaup_defconfig   clang
mips                      pic32mzda_defconfig   gcc  
mips                        qi_lb60_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240314   gcc  
nios2                 randconfig-002-20240314   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240314   gcc  
parisc                randconfig-002-20240314   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                  mpc885_ads_defconfig   clang
powerpc                     powernv_defconfig   gcc  
powerpc               randconfig-001-20240314   gcc  
powerpc               randconfig-002-20240314   gcc  
powerpc               randconfig-003-20240314   clang
powerpc                  storcenter_defconfig   gcc  
powerpc                     tqm5200_defconfig   gcc  
powerpc64             randconfig-001-20240314   gcc  
powerpc64             randconfig-002-20240314   clang
powerpc64             randconfig-003-20240314   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240314   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
