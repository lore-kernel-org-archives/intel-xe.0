Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203FEC47258
	for <intel-xe@archiver.kernel.org>; Sun, 28 Jan 2024 17:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26276112258;
	Sun, 28 Jan 2024 17:32:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28D410EFEC
 for <intel-xe@lists.freedesktop.org>; Sun, 28 Jan 2024 17:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706463156; x=1737999156;
 h=date:from:to:cc:subject:message-id;
 bh=xEsC4nPsje8X/iFTl3hw1e5CLY9GArPXAq0DknwGcK0=;
 b=RVIQE8Hw29wFsWCww4a3SfnrgnCSj5WGO1EsIAsrN81j//U1ghsXobdQ
 aSpG+Iz1pD3fX0vn7+/GQKyR9svwJlkaMH2mm5rKsgfUpCwokbvJwuqVt
 +JVgPIHt/qJqpeqvIKg0l4sbhjt2SnuF8/LTHZp7w06cLt0GRZtHDGb09
 qTU+QKfxVYzemDpEH/NW+Bgpcz7kJDXmkHta/6fMJ0edHLMRK1pVzCWT0
 2kbY1nFenLCxVQdFTfeN1hIpXQ91Sj5Q6K/uQudqlAMyIAdQCeCQXabL6
 ZMZREE7BE4/fQWIxx/1a218O9Dtg5/1ZKsGlPqrjm2iKE5kRnbvFugz7O g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="406516172"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="406516172"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2024 09:32:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="35918884"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 28 Jan 2024 09:32:36 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rU91E-0003be-33;
 Sun, 28 Jan 2024 17:32:32 +0000
Date: Mon, 29 Jan 2024 01:32:32 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 348769d1cbfab409b9ac21c653dd4db609760175
Message-ID: <202401290129.X6tjKv0M-lkp@intel.com>
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
branch HEAD: 348769d1cbfab409b9ac21c653dd4db609760175  drm/xe: correct the assertion for number of PTEs

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- sparc-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:CTX_VALID-redefined
`-- sparc64-randconfig-001-20240128
    `-- drivers-gpu-drm-xe-xe_lrc.c:warning:CTX_VALID-redefined

elapsed time: 2290m

configs tested: 98
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240128   gcc  
arc                   randconfig-002-20240128   gcc  
arm                   randconfig-001-20240128   clang
arm                   randconfig-002-20240128   clang
arm                   randconfig-003-20240128   clang
arm                   randconfig-004-20240128   clang
arm64                 randconfig-001-20240128   clang
arm64                 randconfig-002-20240128   clang
arm64                 randconfig-003-20240128   clang
arm64                 randconfig-004-20240128   clang
csky                  randconfig-001-20240128   gcc  
csky                  randconfig-002-20240128   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
hexagon               randconfig-001-20240128   clang
hexagon               randconfig-002-20240128   clang
i386         buildonly-randconfig-001-20240127   gcc  
i386         buildonly-randconfig-002-20240127   gcc  
i386         buildonly-randconfig-003-20240127   gcc  
i386         buildonly-randconfig-004-20240127   gcc  
i386         buildonly-randconfig-005-20240127   gcc  
i386         buildonly-randconfig-006-20240127   gcc  
i386                  randconfig-001-20240127   gcc  
i386                  randconfig-002-20240127   gcc  
i386                  randconfig-003-20240127   gcc  
i386                  randconfig-004-20240127   gcc  
i386                  randconfig-005-20240127   gcc  
i386                  randconfig-006-20240127   gcc  
i386                  randconfig-011-20240127   clang
i386                  randconfig-012-20240127   clang
i386                  randconfig-013-20240127   clang
i386                  randconfig-014-20240127   clang
i386                  randconfig-015-20240127   clang
i386                  randconfig-016-20240127   clang
loongarch                        allmodconfig   gcc  
loongarch             randconfig-001-20240128   gcc  
loongarch             randconfig-002-20240128   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
microblaze                       allmodconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                 randconfig-001-20240128   gcc  
nios2                 randconfig-002-20240128   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240128   gcc  
parisc                randconfig-002-20240128   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc               randconfig-001-20240128   clang
powerpc               randconfig-002-20240128   clang
powerpc               randconfig-003-20240128   clang
powerpc64             randconfig-001-20240128   clang
powerpc64             randconfig-002-20240128   clang
powerpc64             randconfig-003-20240128   clang
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240128   clang
riscv                 randconfig-002-20240128   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240128   gcc  
s390                  randconfig-002-20240128   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240128   gcc  
sh                    randconfig-002-20240128   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240128   gcc  
sparc64               randconfig-002-20240128   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240128   clang
um                    randconfig-002-20240128   clang
um                           x86_64_defconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240128   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
