Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51957C47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 23:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121CD10E0CE;
	Wed, 17 Jan 2024 23:56:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DE310E0CE
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 23:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705535784; x=1737071784;
 h=date:from:to:cc:subject:message-id;
 bh=0bdsP3EspBJgwd7BYa9eA4T6kHGZCEtQdWUnLqcQXUQ=;
 b=ZVKcfVnfiqUGiMUgroQHHrBIG3IOv7fi2/4pEwcbKJ4e4bSTxmsI3Bxu
 Cf0TSrRRVAg0HEmmIFBAlqG0ahyShaLTT7nfsjAQPrOcFhXC2S345xYo8
 GRJgjuwh3ie3C2gYIaBDJnLrl4UpmZfue1v3YDlk6QUPzRY5Ny+AqejbI
 iBpa8VjzU4egYJmSUgyH/dJum5vaudkfXjpFxQDGgRdi5ZR6NBN34CV1o
 L0yFpByw0rpGcDCuFs9p58MnW7Oj9HqxFFT2wviVeXdRP4la9Q0cHaSPa
 LoJuhNBMeTs89quGYMhNXjGoK0OoA8Zyey4YG/1IOyz3q4dozTm6RsQj3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7678232"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7678232"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 15:56:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="18961350"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 17 Jan 2024 15:56:22 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rQFlb-0002RI-2R;
 Wed, 17 Jan 2024 23:56:19 +0000
Date: Thu, 18 Jan 2024 07:55:24 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 85f3b79fb5788e2a1ec938a70d8f5c7150a670b9
Message-ID: <202401180722.MuSbhbZr-lkp@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: 85f3b79fb5788e2a1ec938a70d8f5c7150a670b9  drm/xe: Group normal kunit tests in a single module

elapsed time: 1785m

configs tested: 90
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                   randconfig-001-20240118   gcc  
arc                   randconfig-002-20240118   gcc  
arm                   randconfig-001-20240118   clang
arm                   randconfig-002-20240118   clang
arm                   randconfig-003-20240118   clang
arm                   randconfig-004-20240118   clang
arm64                 randconfig-001-20240118   clang
arm64                 randconfig-002-20240118   clang
arm64                 randconfig-003-20240118   clang
arm64                 randconfig-004-20240118   clang
csky                  randconfig-001-20240118   gcc  
csky                  randconfig-002-20240118   gcc  
hexagon               randconfig-001-20240118   clang
hexagon               randconfig-002-20240118   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240117   gcc  
i386         buildonly-randconfig-002-20240117   gcc  
i386         buildonly-randconfig-003-20240117   gcc  
i386         buildonly-randconfig-004-20240117   gcc  
i386         buildonly-randconfig-005-20240117   gcc  
i386         buildonly-randconfig-006-20240117   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240117   gcc  
i386                  randconfig-002-20240117   gcc  
i386                  randconfig-003-20240117   gcc  
i386                  randconfig-004-20240117   gcc  
i386                  randconfig-005-20240117   gcc  
i386                  randconfig-006-20240117   gcc  
i386                  randconfig-011-20240117   clang
i386                  randconfig-012-20240117   clang
i386                  randconfig-013-20240117   clang
i386                  randconfig-014-20240117   clang
i386                  randconfig-015-20240117   clang
i386                  randconfig-016-20240117   clang
loongarch                        allmodconfig   gcc  
loongarch             randconfig-001-20240118   gcc  
loongarch             randconfig-002-20240118   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                 randconfig-001-20240118   gcc  
nios2                 randconfig-002-20240118   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20240118   gcc  
parisc                randconfig-002-20240118   gcc  
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240118   clang
powerpc               randconfig-002-20240118   clang
powerpc               randconfig-003-20240118   clang
powerpc64             randconfig-001-20240118   clang
powerpc64             randconfig-002-20240118   clang
powerpc64             randconfig-003-20240118   clang
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                 randconfig-001-20240118   clang
riscv                 randconfig-002-20240118   clang
riscv                          rv32_defconfig   clang
s390                  randconfig-001-20240118   gcc  
s390                  randconfig-002-20240118   gcc  
sh                    randconfig-001-20240118   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240118   clang
x86_64       buildonly-randconfig-002-20240118   clang
x86_64       buildonly-randconfig-003-20240118   clang
x86_64       buildonly-randconfig-004-20240118   clang
x86_64       buildonly-randconfig-005-20240118   clang
x86_64       buildonly-randconfig-006-20240118   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240118   gcc  
x86_64                randconfig-002-20240118   gcc  
x86_64                randconfig-003-20240118   gcc  
x86_64                randconfig-004-20240118   gcc  
x86_64                randconfig-005-20240118   gcc  
x86_64                randconfig-006-20240118   gcc  
x86_64                randconfig-011-20240118   clang
x86_64                randconfig-012-20240118   clang
x86_64                randconfig-013-20240118   clang
x86_64                randconfig-014-20240118   clang
x86_64                randconfig-015-20240118   clang
x86_64                          rhel-8.3-rust   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
