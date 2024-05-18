Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4116FC25B74
	for <intel-xe@archiver.kernel.org>; Sat, 18 May 2024 05:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C639610E066;
	Sat, 18 May 2024 05:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a7jdr03T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272F210E066
 for <intel-xe@lists.freedesktop.org>; Sat, 18 May 2024 05:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716011330; x=1747547330;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=MfCfpQ1P0NmHM3G7ITAdeQ3hO1oSuvYYNXPEEuDRgmM=;
 b=a7jdr03TtwYdqckTb+9yfzvYWVMFanW969q7QrPqujuIKZSLoTen4NBV
 1gaInaMK1Yvy/+5Xpi3HWNtnyp0FNWSPZHJhFmSVpGeh69XNoF/0J37Bv
 9KruKFYvMgM1dcgHIblfdYAr4J8j9NeYsEjASBhpLld6hA+wP4ys2l+Hz
 kPSibve33rNfnJmqALIb0/1Aa6PIn1Nvdy8E8EtGUc8zkhx+X5Fj9VStR
 5qOlVfv2VHTHag6413qnmZcsoAtMhTsFLSLtnDsF1wOP1/CpRFhuzGrtN
 UorRMgJX7Ets6mpCnbO25cKDqo5I5f2QjA+AGoEGwdKHnjNgP4msbm9G2 w==;
X-CSE-ConnectionGUID: wlFu128eQ7Sq2hF/qto/Yg==
X-CSE-MsgGUID: sQKI1z+eQnS4QhILGJUtng==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12048116"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; d="scan'208";a="12048116"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 22:48:49 -0700
X-CSE-ConnectionGUID: TwT/fwy2SUy81D9sZ1Q6Rw==
X-CSE-MsgGUID: kSTAUhstSG2SqVW/81ox2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; d="scan'208";a="36924749"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
 by orviesa004.jf.intel.com with ESMTP; 17 May 2024 22:48:47 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s8Cw1-0001g0-1W;
 Sat, 18 May 2024 05:48:45 +0000
Date: Sat, 18 May 2024 13:48:09 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Jos=C3=A9?= Roberto de Souza" <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 844f3228d225d25af8a21a7e1554d78c20823a37
Message-ID: <202405181306.mlrivBnu-lkp@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: 844f3228d225d25af8a21a7e1554d78c20823a37  drm/xe: Replace RING_START_UDW by u64 RING_START

elapsed time: 724m

configs tested: 142
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
arc                   randconfig-001-20240518   gcc  
arc                   randconfig-002-20240518   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   clang
arm                                 defconfig   clang
arm                   randconfig-001-20240518   gcc  
arm                   randconfig-002-20240518   clang
arm                   randconfig-003-20240518   gcc  
arm                   randconfig-004-20240518   gcc  
arm                           sama5_defconfig   gcc  
arm                        shmobile_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240518   clang
arm64                 randconfig-002-20240518   gcc  
arm64                 randconfig-003-20240518   clang
arm64                 randconfig-004-20240518   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240518   gcc  
csky                  randconfig-002-20240518   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240518   clang
hexagon               randconfig-002-20240518   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240518   gcc  
i386         buildonly-randconfig-002-20240518   gcc  
i386         buildonly-randconfig-003-20240518   gcc  
i386         buildonly-randconfig-004-20240518   clang
i386         buildonly-randconfig-005-20240518   clang
i386         buildonly-randconfig-006-20240518   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240518   clang
i386                  randconfig-002-20240518   clang
i386                  randconfig-003-20240518   gcc  
i386                  randconfig-004-20240518   gcc  
i386                  randconfig-005-20240518   clang
i386                  randconfig-006-20240518   gcc  
i386                  randconfig-011-20240518   gcc  
i386                  randconfig-012-20240518   clang
i386                  randconfig-013-20240518   clang
i386                  randconfig-014-20240518   gcc  
i386                  randconfig-015-20240518   clang
i386                  randconfig-016-20240518   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240518   gcc  
loongarch             randconfig-002-20240518   gcc  
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
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240518   gcc  
nios2                 randconfig-002-20240518   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240518   gcc  
parisc                randconfig-002-20240518   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240518   clang
powerpc               randconfig-002-20240518   clang
powerpc               randconfig-003-20240518   clang
powerpc64             randconfig-001-20240518   gcc  
powerpc64             randconfig-002-20240518   gcc  
powerpc64             randconfig-003-20240518   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240518   gcc  
riscv                 randconfig-002-20240518   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240518   clang
s390                  randconfig-002-20240518   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240518   gcc  
sh                    randconfig-002-20240518   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240518   gcc  
sparc64               randconfig-002-20240518   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240518   clang
um                    randconfig-002-20240518   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-002-20240518   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
