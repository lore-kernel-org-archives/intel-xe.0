Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17A0C4829A
	for <intel-xe@archiver.kernel.org>; Sat, 10 Feb 2024 11:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878791127E1;
	Sat, 10 Feb 2024 11:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZiHIiplb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8461127E1
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Feb 2024 11:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707563969; x=1739099969;
 h=date:from:to:cc:subject:message-id;
 bh=RbWdxV/UPam38f7E4CzGvDPgKkaYvFvCt6nFBxkZ3J0=;
 b=ZiHIiplbReXg8IMqUVMzlkHQa0M1r9sMXbG6MM5lSSD7wIA4fxnTjHTr
 VxoPLck+l8T2Xrg9akSGiY0Zz1b3ZoXMXQTN13k2jAV3c4Rn87jrMHs9d
 +VlRV8CKjMpZizUrMpAFqPopVWey0ANU56XGz77jkQFl505+Ooo0Ny7xZ
 uwkhXADhFMBCFHq1cpFFufzfJbd43mnAAhjTrJqZyoJynUy6d4H/gE2Ok
 z2Jq9sjMb5HbWAAnrrRSKTMO3mPM1yJuG2zgraPJxQSGCLQXmC8KFZHyj
 ZslXWbn2YqSnMVHErYbfTBiNzhc7ChwWV7SUaoAX4OcWBn1d8Clq8joEf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1444326"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="1444326"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2024 03:19:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; d="scan'208";a="39598277"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 10 Feb 2024 03:19:18 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rYlO7-0005bO-0e;
 Sat, 10 Feb 2024 11:19:15 +0000
Date: Sat, 10 Feb 2024 19:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 63fb531fbfda81bda652546a39333b565aea324d
Message-ID: <202402101915.b3glkB5O-lkp@intel.com>
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
branch HEAD: 63fb531fbfda81bda652546a39333b565aea324d  drm/xe/display: fix i915_gem_object_is_shmem() wrapper

elapsed time: 1448m

configs tested: 178
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
arc                   randconfig-001-20240210   gcc  
arc                   randconfig-002-20240210   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                      footbridge_defconfig   clang
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20240210   gcc  
arm                   randconfig-002-20240210   gcc  
arm                   randconfig-003-20240210   gcc  
arm                   randconfig-004-20240210   gcc  
arm                       versatile_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240210   clang
arm64                 randconfig-002-20240210   gcc  
arm64                 randconfig-003-20240210   gcc  
arm64                 randconfig-004-20240210   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240210   gcc  
csky                  randconfig-002-20240210   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240210   clang
hexagon               randconfig-002-20240210   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240209   clang
i386         buildonly-randconfig-002-20240209   clang
i386         buildonly-randconfig-003-20240209   gcc  
i386         buildonly-randconfig-004-20240209   clang
i386         buildonly-randconfig-005-20240209   clang
i386         buildonly-randconfig-006-20240209   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240209   clang
i386                  randconfig-002-20240209   gcc  
i386                  randconfig-003-20240209   clang
i386                  randconfig-004-20240209   clang
i386                  randconfig-005-20240209   clang
i386                  randconfig-006-20240209   gcc  
i386                  randconfig-011-20240209   gcc  
i386                  randconfig-012-20240209   gcc  
i386                  randconfig-013-20240209   clang
i386                  randconfig-014-20240209   gcc  
i386                  randconfig-015-20240209   gcc  
i386                  randconfig-016-20240209   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240210   gcc  
loongarch             randconfig-002-20240210   gcc  
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
mips                            gpr_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240210   gcc  
nios2                 randconfig-002-20240210   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240210   gcc  
parisc                randconfig-002-20240210   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 canyonlands_defconfig   clang
powerpc                       eiger_defconfig   clang
powerpc                    klondike_defconfig   gcc  
powerpc                   microwatt_defconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   gcc  
powerpc               randconfig-001-20240210   gcc  
powerpc               randconfig-002-20240210   clang
powerpc               randconfig-003-20240210   gcc  
powerpc                      walnut_defconfig   gcc  
powerpc64             randconfig-001-20240210   clang
powerpc64             randconfig-002-20240210   clang
powerpc64             randconfig-003-20240210   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240210   gcc  
riscv                 randconfig-002-20240210   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240210   gcc  
s390                  randconfig-002-20240210   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20240210   gcc  
sh                    randconfig-002-20240210   gcc  
sh                          sdk7780_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240210   gcc  
sparc64               randconfig-002-20240210   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240210   gcc  
um                    randconfig-002-20240210   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240209   gcc  
x86_64       buildonly-randconfig-002-20240209   gcc  
x86_64       buildonly-randconfig-003-20240209   clang
x86_64       buildonly-randconfig-004-20240209   gcc  
x86_64       buildonly-randconfig-005-20240209   clang
x86_64       buildonly-randconfig-006-20240209   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240209   clang
x86_64                randconfig-002-20240209   gcc  
x86_64                randconfig-003-20240209   gcc  
x86_64                randconfig-004-20240209   clang
x86_64                randconfig-005-20240209   gcc  
x86_64                randconfig-006-20240209   gcc  
x86_64                randconfig-011-20240209   clang
x86_64                randconfig-012-20240209   clang
x86_64                randconfig-013-20240209   gcc  
x86_64                randconfig-014-20240209   clang
x86_64                randconfig-015-20240209   gcc  
x86_64                randconfig-016-20240209   clang
x86_64                randconfig-071-20240209   gcc  
x86_64                randconfig-072-20240209   clang
x86_64                randconfig-073-20240209   clang
x86_64                randconfig-074-20240209   gcc  
x86_64                randconfig-075-20240209   gcc  
x86_64                randconfig-076-20240209   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                randconfig-001-20240210   gcc  
xtensa                randconfig-002-20240210   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
