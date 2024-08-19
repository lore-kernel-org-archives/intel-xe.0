Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA8AC52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 01:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A9B10E18B;
	Mon, 19 Aug 2024 01:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gg7mJ4wS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3020A10E18B
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 01:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724031919; x=1755567919;
 h=date:from:to:cc:subject:message-id;
 bh=/b8TgNp2bJvbgfB8KNpcNFIcmldra8vBdOEWN9CWB9I=;
 b=gg7mJ4wSdty5knosa+DsN/43/PuNuXkn8NuMK6TfPAIJhufRpPgGHi39
 g0Qq2AFhesKy5uNFjgUUf4SbrvlPqOFa6GMLYFyJKryV/nzytUooHH8Jr
 Ph6sDSVmOxlPH5ojeGb7/TA4ucFSANrWpbE8hQSWTAISz8IyX54NfQWy/
 MEzeK6RQQbOKR7mmVtLIOgX1vMy541wtbLOl0aq7zCpFXBexul2FF19Ll
 xxahtieZJ0x8TJ7WTW7Z/IXo8YTF/SVyXWlS1leSTdEhlG3EWcYyZI5zN
 obT1Du1k+z3wjv416BgXuZReHZQk4A28VIx0cZ1SLiW0mXbmGGmjq351c Q==;
X-CSE-ConnectionGUID: 8o0GxFZ8QxaqrJIUI/dVfA==
X-CSE-MsgGUID: Jp5jnT6hTgyOlPWi/0E92Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="22427085"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="22427085"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2024 18:45:18 -0700
X-CSE-ConnectionGUID: tPMJATC5Rnyj5MmwEJpGjA==
X-CSE-MsgGUID: CwfgIKFnRJC6fTY9Vqf5zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="60214954"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 18 Aug 2024 18:45:17 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sfrSN-0008Yi-1R;
 Mon, 19 Aug 2024 01:45:15 +0000
Date: Mon, 19 Aug 2024 09:44:34 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 4099cfda9dd856222d7cab6970a65896375616d5
Message-ID: <202408190931.QhzI6jBZ-lkp@intel.com>
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
branch HEAD: 4099cfda9dd856222d7cab6970a65896375616d5  drm/xe/device: Remove unused xe_device::usm::num_vm_in_*

elapsed time: 1448m

configs tested: 138
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                     nsimosci_hs_defconfig   gcc-13.2.0
arc                   randconfig-001-20240818   gcc-13.2.0
arc                   randconfig-002-20240818   gcc-13.2.0
arm                              alldefconfig   gcc-14.1.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   clang-14
arm                      footbridge_defconfig   clang-20
arm                       omap2plus_defconfig   gcc-14.1.0
arm                   randconfig-001-20240818   clang-15
arm                   randconfig-002-20240818   gcc-14.1.0
arm                   randconfig-003-20240818   clang-20
arm                   randconfig-004-20240818   clang-20
arm                        spear3xx_defconfig   clang-16
arm                        spear6xx_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
arm64                 randconfig-001-20240818   gcc-14.1.0
arm64                 randconfig-002-20240818   gcc-14.1.0
arm64                 randconfig-003-20240818   gcc-14.1.0
arm64                 randconfig-004-20240818   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240818   gcc-14.1.0
csky                  randconfig-002-20240818   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   clang-20
hexagon               randconfig-001-20240818   clang-20
hexagon               randconfig-002-20240818   clang-20
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240818   gcc-12
i386         buildonly-randconfig-002-20240818   clang-18
i386         buildonly-randconfig-003-20240818   clang-18
i386         buildonly-randconfig-004-20240818   clang-18
i386         buildonly-randconfig-005-20240818   gcc-12
i386         buildonly-randconfig-006-20240818   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240818   clang-18
i386                  randconfig-002-20240818   gcc-12
i386                  randconfig-003-20240818   clang-18
i386                  randconfig-004-20240818   clang-18
i386                  randconfig-005-20240818   clang-18
i386                  randconfig-006-20240818   gcc-12
i386                  randconfig-011-20240818   gcc-12
i386                  randconfig-012-20240818   gcc-12
i386                  randconfig-013-20240818   gcc-12
i386                  randconfig-014-20240818   clang-18
i386                  randconfig-015-20240818   clang-18
i386                  randconfig-016-20240818   gcc-11
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
loongarch             randconfig-001-20240818   gcc-14.1.0
loongarch             randconfig-002-20240818   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
microblaze                      mmu_defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                        bcm63xx_defconfig   clang-17
mips                           ip28_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
nios2                 randconfig-001-20240818   gcc-14.1.0
nios2                 randconfig-002-20240818   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-32bit_defconfig   gcc-14.1.0
parisc                randconfig-001-20240818   gcc-14.1.0
parisc                randconfig-002-20240818   gcc-14.1.0
parisc64                            defconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                      ep88xc_defconfig   gcc-14.1.0
powerpc                  iss476-smp_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240818   clang-20
powerpc               randconfig-002-20240818   clang-20
powerpc64             randconfig-001-20240818   gcc-14.1.0
powerpc64             randconfig-002-20240818   gcc-14.1.0
powerpc64             randconfig-003-20240818   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                 randconfig-001-20240818   clang-15
riscv                 randconfig-002-20240818   clang-20
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240818   gcc-14.1.0
s390                  randconfig-002-20240818   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240818   gcc-14.1.0
sh                    randconfig-002-20240818   gcc-14.1.0
sh                          rsk7269_defconfig   gcc-14.1.0
sh                  sh7785lcr_32bit_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240818   gcc-14.1.0
sparc64               randconfig-002-20240818   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240818   clang-20
um                    randconfig-002-20240818   gcc-12
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                  cadence_csp_defconfig   gcc-14.1.0
xtensa                          iss_defconfig   gcc-14.1.0
xtensa                randconfig-001-20240818   gcc-14.1.0
xtensa                randconfig-002-20240818   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
