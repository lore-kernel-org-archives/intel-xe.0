Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FADC00A94
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 15:20:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9026210F6D7;
	Fri, 12 Apr 2024 15:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMRI28Fq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66D710F6D7
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 15:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712935222; x=1744471222;
 h=date:from:to:cc:subject:message-id;
 bh=nkzPqu0C4j/SevTRxx7YiXgHFpMZV8qfI1vzz2/bMgA=;
 b=lMRI28Fq/rdYx3KHQ9jtuXzMOttT8Vq5cfAI/yXBQMyxCFJp+wZW2ObO
 06L7rI3qLc7qCyvIG00tX9fMW9IspUqWKq/PKevU9EzLrWYaLrYmoXF5B
 tO5UCW2QuXwTx1HniobYcjpvc0d0rA5fUfEccqC4ALc6wxl5y16vQormy
 jModJ2J2EZmQnorFufgBvyI92haTUOdrnEMPoDQrYN6sDUaJIcZ9hXeze
 E8A3P34KQpcZekxjtdK+jlRK5VpEYMETCi8xViOtZOtYEcNYd1hrH0kHD
 kDlBaHmm2dtbLN82hFqOomUaXaE0NtZGCkKROc95i0HrNAqkg+RDH4onE w==;
X-CSE-ConnectionGUID: MN09xT58SguBNe2zYKByOA==
X-CSE-MsgGUID: /81ZHQqSTdaH2jGEkyJGcw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="19814536"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="19814536"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 08:20:13 -0700
X-CSE-ConnectionGUID: /+UhY4V1Rx2By4Ueu6jssw==
X-CSE-MsgGUID: jlrx0WNAQt6/OmqEmOWnZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="58681355"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 12 Apr 2024 08:20:11 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rvIhF-0000BE-1C;
 Fri, 12 Apr 2024 15:20:09 +0000
Date: Fri, 12 Apr 2024 23:19:17 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 f76646c83f028c62853c23dac49204232e903597
Message-ID: <202404122315.2aDdWyO2-lkp@intel.com>
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
branch HEAD: f76646c83f028c62853c23dac49204232e903597  drm/xe: Label RING_CONTEXT_CONTROL as masked

elapsed time: 1474m

configs tested: 163
configs skipped: 7

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
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20240412   gcc  
arc                   randconfig-002-20240412   gcc  
arm                              alldefconfig   gcc  
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20240412   gcc  
arm                   randconfig-004-20240412   gcc  
arm                           sama5_defconfig   gcc  
arm                           u8500_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240412   gcc  
arm64                 randconfig-002-20240412   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240412   gcc  
csky                  randconfig-002-20240412   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240412   gcc  
i386         buildonly-randconfig-002-20240412   clang
i386         buildonly-randconfig-003-20240412   gcc  
i386         buildonly-randconfig-004-20240412   gcc  
i386         buildonly-randconfig-005-20240412   gcc  
i386         buildonly-randconfig-006-20240412   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240412   clang
i386                  randconfig-002-20240412   gcc  
i386                  randconfig-003-20240412   clang
i386                  randconfig-004-20240412   clang
i386                  randconfig-005-20240412   clang
i386                  randconfig-006-20240412   gcc  
i386                  randconfig-011-20240412   clang
i386                  randconfig-012-20240412   gcc  
i386                  randconfig-013-20240412   clang
i386                  randconfig-014-20240412   gcc  
i386                  randconfig-015-20240412   gcc  
i386                  randconfig-016-20240412   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240412   gcc  
loongarch             randconfig-002-20240412   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1000-neo_defconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                           ip22_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240412   gcc  
nios2                 randconfig-002-20240412   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240412   gcc  
parisc                randconfig-002-20240412   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      arches_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                     powernv_defconfig   gcc  
powerpc               randconfig-003-20240412   gcc  
powerpc                     tqm5200_defconfig   gcc  
powerpc64             randconfig-001-20240412   gcc  
powerpc64             randconfig-002-20240412   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240412   gcc  
s390                  randconfig-002-20240412   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                    randconfig-001-20240412   gcc  
sh                    randconfig-002-20240412   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240412   gcc  
sparc64               randconfig-002-20240412   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-002-20240412   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-004-20240412   clang
x86_64       buildonly-randconfig-005-20240412   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240412   clang
x86_64                randconfig-004-20240412   clang
x86_64                randconfig-005-20240412   clang
x86_64                randconfig-006-20240412   clang
x86_64                randconfig-011-20240412   clang
x86_64                randconfig-013-20240412   clang
x86_64                randconfig-014-20240412   clang
x86_64                randconfig-015-20240412   clang
x86_64                randconfig-072-20240412   clang
x86_64                randconfig-073-20240412   clang
x86_64                randconfig-076-20240412   clang
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20240412   gcc  
xtensa                randconfig-002-20240412   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
