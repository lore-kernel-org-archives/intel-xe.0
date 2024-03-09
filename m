Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD57C54798
	for <intel-xe@archiver.kernel.org>; Sat,  9 Mar 2024 04:30:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CA710E79A;
	Sat,  9 Mar 2024 04:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPMNInM9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784D410E79A
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Mar 2024 04:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709958614; x=1741494614;
 h=date:from:to:cc:subject:message-id;
 bh=/F9BLRNREnsSBlrDUoi/7m5ZuQ8jFI4d+7TSelGF41A=;
 b=TPMNInM9YV+lj1TRytJJrMVPxXWL88s2ixgyXEK0gKkfQGpk3SGkRYMY
 gsSEK4j/gzkbCSJh2IUcHA4LEJ6KufWxYe2Cnnk4mSh8gXCFmGKNnEOSH
 lMx3jq3XRDhs83a0CP0FTaumC71xUbHVNVLz/gxXz3yN0OLYxsVHY7a+r
 UmYaBDEy6eiQqD/J5aqCwje0Ts7A+2UJEubpRCWAWFedtEo1Ecv70xJf0
 58x1jb2PlHE9wQj9L9Nwcgw2Wi1XhiJJFNx1RvTwc3FkGBfkMsytDSWt0
 2dhCC3f1mZgK0DdB8kTfNOZD/ApjbhQrYidUIVj5Jm7cBZdxLdZs9K/gm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="30135782"
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; d="scan'208";a="30135782"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 20:30:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; d="scan'208";a="11214126"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 08 Mar 2024 20:30:13 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rioLa-0006yP-0n;
 Sat, 09 Mar 2024 04:30:10 +0000
Date: Sat, 09 Mar 2024 12:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:topic/xe-for-CI] BUILD SUCCESS
 acec3bca46a221c35922c40b10405500e17309c5
Message-ID: <202403091209.ShUXRlsn-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git topic/xe-for-CI
branch HEAD: acec3bca46a221c35922c40b10405500e17309c5  drm/xe/guc: define PVC FW

elapsed time: 750m

configs tested: 138
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
arc                   randconfig-001-20240309   gcc  
arc                   randconfig-002-20240309   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240309   clang
arm                   randconfig-002-20240309   gcc  
arm                   randconfig-003-20240309   clang
arm                   randconfig-004-20240309   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240309   gcc  
arm64                 randconfig-002-20240309   clang
arm64                 randconfig-003-20240309   clang
arm64                 randconfig-004-20240309   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240309   gcc  
csky                  randconfig-002-20240309   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240309   clang
hexagon               randconfig-002-20240309   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240309   clang
i386         buildonly-randconfig-002-20240309   clang
i386         buildonly-randconfig-003-20240309   gcc  
i386         buildonly-randconfig-004-20240309   gcc  
i386         buildonly-randconfig-005-20240309   gcc  
i386         buildonly-randconfig-006-20240309   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240309   gcc  
i386                  randconfig-002-20240309   gcc  
i386                  randconfig-003-20240309   clang
i386                  randconfig-004-20240309   clang
i386                  randconfig-005-20240309   clang
i386                  randconfig-006-20240309   gcc  
i386                  randconfig-011-20240309   gcc  
i386                  randconfig-012-20240309   gcc  
i386                  randconfig-013-20240309   clang
i386                  randconfig-014-20240309   clang
i386                  randconfig-015-20240309   clang
i386                  randconfig-016-20240309   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240309   gcc  
loongarch             randconfig-002-20240309   gcc  
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
nios2                 randconfig-001-20240309   gcc  
nios2                 randconfig-002-20240309   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240309   gcc  
parisc                randconfig-002-20240309   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240309   gcc  
powerpc               randconfig-002-20240309   clang
powerpc               randconfig-003-20240309   clang
powerpc64             randconfig-001-20240309   gcc  
powerpc64             randconfig-002-20240309   gcc  
powerpc64             randconfig-003-20240309   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240309   gcc  
riscv                 randconfig-002-20240309   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240309   clang
s390                  randconfig-002-20240309   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240309   gcc  
sh                    randconfig-002-20240309   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240309   gcc  
sparc64               randconfig-002-20240309   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240309   clang
um                    randconfig-002-20240309   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-002-20240309   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
