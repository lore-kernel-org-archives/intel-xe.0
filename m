Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9CFC54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 18:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D38112C33;
	Tue,  5 Mar 2024 18:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KMB3mHCu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B64C112C33
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 18:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709664118; x=1741200118;
 h=date:from:to:cc:subject:message-id;
 bh=kuScAmQR7uK7LJ2qNHrXMQfSoTTjyEozfRsX4vb1LZg=;
 b=KMB3mHCuEiVLa5QDjmYskSzCUYbfC0VLjLn9sbUIId7sPiMiPD5NFPop
 9Ni6pQZlM42wlkhyAhWTIMuc5XrUuu6vAhO3NcES0kv1pO2jmY5O/M5J7
 0TCTW+rqbo3lRoceLVG6ZXFxTHhA/Uer+2yxgDGDUWtEZLDrcrNk+kaEg
 azF/r7HuGQYc2ut3nYR/CiupzHARwEdik2NdFr5vU1V44j+RMHSsSLHML
 ynkUqMKdq/Ipdmkfg76yearK7HCSZ4kC5n0ng0NQZCo5vSQObKHT/RJJF
 2oxb2vehE+QKnCGCYOxKa9VFHbZ9EIkvWwCjNhcZK5u+lmhJeT0YUgOto g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4413952"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="4413952"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 10:41:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="9541212"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 05 Mar 2024 10:41:56 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rhZjd-0003Zd-14;
 Tue, 05 Mar 2024 18:41:53 +0000
Date: Wed, 06 Mar 2024 02:41:53 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 5c9da9fc64a1a6745175c7e77c3a0021a32560a5
Message-ID: <202403060249.5JD0Lm08-lkp@intel.com>
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
branch HEAD: 5c9da9fc64a1a6745175c7e77c3a0021a32560a5  drm/xe: Convert xe_pm_runtime_{get, put} to void and protect from recursion

elapsed time: 1449m

configs tested: 136
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
arc                   randconfig-001-20240305   gcc  
arc                   randconfig-002-20240305   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240305   clang
arm                   randconfig-002-20240305   gcc  
arm                   randconfig-003-20240305   clang
arm                   randconfig-004-20240305   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240305   gcc  
arm64                 randconfig-002-20240305   clang
arm64                 randconfig-003-20240305   gcc  
arm64                 randconfig-004-20240305   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240305   gcc  
csky                  randconfig-002-20240305   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240305   clang
hexagon               randconfig-002-20240305   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240305   clang
i386         buildonly-randconfig-002-20240305   gcc  
i386         buildonly-randconfig-003-20240305   gcc  
i386         buildonly-randconfig-004-20240305   clang
i386         buildonly-randconfig-005-20240305   clang
i386         buildonly-randconfig-006-20240305   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240305   clang
i386                  randconfig-002-20240305   gcc  
i386                  randconfig-003-20240305   clang
i386                  randconfig-004-20240305   gcc  
i386                  randconfig-005-20240305   gcc  
i386                  randconfig-006-20240305   gcc  
i386                  randconfig-011-20240305   gcc  
i386                  randconfig-012-20240305   gcc  
i386                  randconfig-013-20240305   gcc  
i386                  randconfig-014-20240305   gcc  
i386                  randconfig-015-20240305   clang
i386                  randconfig-016-20240305   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240305   gcc  
loongarch             randconfig-002-20240305   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240305   gcc  
nios2                 randconfig-002-20240305   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240305   gcc  
parisc                randconfig-002-20240305   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240305   gcc  
powerpc               randconfig-002-20240305   gcc  
powerpc               randconfig-003-20240305   gcc  
powerpc64             randconfig-001-20240305   clang
powerpc64             randconfig-002-20240305   clang
powerpc64             randconfig-003-20240305   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240305   clang
riscv                 randconfig-002-20240305   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240305   gcc  
s390                  randconfig-002-20240305   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240305   gcc  
sh                    randconfig-002-20240305   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240305   gcc  
sparc64               randconfig-002-20240305   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240305   gcc  
um                    randconfig-002-20240305   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240305   gcc  
xtensa                randconfig-002-20240305   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
