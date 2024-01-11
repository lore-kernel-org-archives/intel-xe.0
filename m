Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465F8C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 14:14:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BC310E65C;
	Thu, 11 Jan 2024 14:14:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D7510E65C
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 14:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704982454; x=1736518454;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=DeKX8RdXH0ldCLBsFqX9Zo5PbDACR/SnzWF7TqxEGK8=;
 b=Dsp/mvCfxOfm1tgzBOtdlD+CNz/FDvmZKkKUkCyFUhhwc7uW2XSUahb5
 VYa1fxhn2j+rMo4A4l6t34SjfN2hnE9Jfjf3Xog5viFwuRa7c5Iwxxw76
 0GUT9eE9TIOTN/rU5/cGXvR4s0nXDhCm6PbdOxRG7xlyZ+jLKvaWXZXTp
 N5srnP6XRyO3H0CiDXk6eHUdN72lDODW1GImdBI2IE5/z2SEPYZVeRLDQ
 jfEqc4kMJhMOeyDbe5mgvii2VUiValKUCr+PNKYe15ySr2a7laGsWTFUn
 EJqHHtp0K2Fry13vRyK5tydRXsdN2I7yAzZd5qFnAv44ecdV+CGZ+r/eu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="402630261"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="402630261"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 06:14:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="17054198"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmviesa002.fm.intel.com with ESMTP; 11 Jan 2024 06:14:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rNvow-0008Ky-13;
 Thu, 11 Jan 2024 14:14:10 +0000
Date: Thu, 11 Jan 2024 22:13:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Subject: [drm-xe:topic/xe-for-CI] BUILD SUCCESS
 e4cfe0cd981952f6ed3d5b92a0b7e3ae0b3ad2b4
Message-ID: <202401112241.fJGv3fnd-lkp@intel.com>
User-Agent: s-nail v14.9.24
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git topic/xe-for-CI
branch HEAD: e4cfe0cd981952f6ed3d5b92a0b7e3ae0b3ad2b4  drm/xe/guc: define LNL FW

elapsed time: 1523m

configs tested: 105
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240111   gcc  
arc                   randconfig-002-20240111   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                       multi_v4t_defconfig   gcc  
arm                   randconfig-001-20240111   gcc  
arm                   randconfig-002-20240111   gcc  
arm                   randconfig-003-20240111   gcc  
arm                   randconfig-004-20240111   gcc  
arm                         s5pv210_defconfig   clang
arm                         socfpga_defconfig   clang
arm                           spitz_defconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240111   gcc  
i386         buildonly-randconfig-002-20240111   gcc  
i386         buildonly-randconfig-003-20240111   gcc  
i386         buildonly-randconfig-004-20240111   gcc  
i386         buildonly-randconfig-005-20240111   gcc  
i386         buildonly-randconfig-006-20240111   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240111   gcc  
i386                  randconfig-002-20240111   gcc  
i386                  randconfig-003-20240111   gcc  
i386                  randconfig-004-20240111   gcc  
i386                  randconfig-005-20240111   gcc  
i386                  randconfig-006-20240111   gcc  
i386                  randconfig-011-20240111   clang
i386                  randconfig-012-20240111   clang
i386                  randconfig-013-20240111   clang
i386                  randconfig-014-20240111   clang
i386                  randconfig-015-20240111   clang
i386                  randconfig-016-20240111   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                            mac_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                     cu1000-neo_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
