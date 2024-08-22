Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8B1C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 17:36:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB86A10E0EB;
	Thu, 22 Aug 2024 17:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NgfzHDY9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BB810E0EB
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 17:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724348185; x=1755884185;
 h=date:from:to:cc:subject:message-id;
 bh=s9RumjI+odSNrGIFkWBOHnVkQASJUmfT6d+Y2Zd6/jY=;
 b=NgfzHDY9Ch1XqHA2nsLAe2ngDNIRNje5Hh1PAExkgPXAeC/1SgpfYbLE
 xX75R7TCFVopk840s+w39hPmYYgpTwV5o+QT3yCfNFQcNJDPUHvrw95+F
 OfGwtfld4UuJ886snLQyQNf/Heq0Ky5NE63yKYdu2XfzDWIvRfFSKU3us
 ot6huF2kJ7PUlfiGqk6bnucf9kHhqVNuw1he8AFYbNrz8vZrgUOQQRIf7
 wa1KrT0MlvzAwAx5d8D7Nwp8QoPR3SWNpt/Y3CYsu1utsyfF91b3sLfxW
 gnVyEVq3cMJpBwSzkdV4nBc66pVk/5KZRsYtDvUxBdKIgz3eawVumCZNc g==;
X-CSE-ConnectionGUID: I+BKPepJQk+aEHwQM/1IqQ==
X-CSE-MsgGUID: CX+XC4jBRxmkijlkil4ntw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22660811"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22660811"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:36:24 -0700
X-CSE-ConnectionGUID: ZeMeVbeYRx6TR5JH3tZVoA==
X-CSE-MsgGUID: twgoQXcbQhyLabpOq+4n2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="66199025"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 22 Aug 2024 10:36:23 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1shBjR-000D2i-1E;
 Thu, 22 Aug 2024 17:36:21 +0000
Date: Fri, 23 Aug 2024 01:36:20 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 9e7f30563677fbeff62d368d5d2a5ac7aaa9746a
Message-ID: <202408230118.UHcIDLc1-lkp@intel.com>
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
branch HEAD: 9e7f30563677fbeff62d368d5d2a5ac7aaa9746a  drm/xe: Free job before xe_exec_queue_put

elapsed time: 1465m

configs tested: 161
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240822   gcc-13.2.0
arc                   randconfig-002-20240822   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                            dove_defconfig   gcc-14.1.0
arm                          moxart_defconfig   gcc-14.1.0
arm                           omap1_defconfig   gcc-14.1.0
arm                   randconfig-001-20240822   gcc-14.1.0
arm                   randconfig-002-20240822   clang-20
arm                   randconfig-003-20240822   clang-20
arm                   randconfig-004-20240822   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240822   gcc-14.1.0
arm64                 randconfig-002-20240822   gcc-14.1.0
arm64                 randconfig-003-20240822   gcc-14.1.0
arm64                 randconfig-004-20240822   clang-20
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240822   gcc-14.1.0
csky                  randconfig-002-20240822   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240822   clang-14
hexagon               randconfig-002-20240822   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240822   gcc-12
i386         buildonly-randconfig-002-20240822   gcc-12
i386         buildonly-randconfig-003-20240822   clang-18
i386         buildonly-randconfig-003-20240822   gcc-12
i386         buildonly-randconfig-004-20240822   clang-18
i386         buildonly-randconfig-004-20240822   gcc-12
i386         buildonly-randconfig-005-20240822   gcc-12
i386         buildonly-randconfig-006-20240822   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240822   clang-18
i386                  randconfig-001-20240822   gcc-12
i386                  randconfig-002-20240822   gcc-12
i386                  randconfig-003-20240822   clang-18
i386                  randconfig-003-20240822   gcc-12
i386                  randconfig-004-20240822   clang-18
i386                  randconfig-004-20240822   gcc-12
i386                  randconfig-005-20240822   gcc-12
i386                  randconfig-006-20240822   clang-18
i386                  randconfig-006-20240822   gcc-12
i386                  randconfig-011-20240822   clang-18
i386                  randconfig-011-20240822   gcc-12
i386                  randconfig-012-20240822   clang-18
i386                  randconfig-012-20240822   gcc-12
i386                  randconfig-013-20240822   clang-18
i386                  randconfig-013-20240822   gcc-12
i386                  randconfig-014-20240822   gcc-12
i386                  randconfig-015-20240822   gcc-12
i386                  randconfig-016-20240822   clang-18
i386                  randconfig-016-20240822   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240822   gcc-14.1.0
loongarch             randconfig-002-20240822   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         apollo_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                          sun3x_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                          ath25_defconfig   clang-20
mips                        bcm47xx_defconfig   clang-15
mips                 decstation_r4k_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240822   gcc-14.1.0
nios2                 randconfig-002-20240822   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240822   gcc-14.1.0
parisc                randconfig-002-20240822   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                    gamecube_defconfig   clang-20
powerpc                     kmeter1_defconfig   gcc-14.1.0
powerpc                 mpc836x_rdk_defconfig   clang-20
powerpc                     mpc83xx_defconfig   clang-20
powerpc64             randconfig-001-20240822   gcc-14.1.0
powerpc64             randconfig-002-20240822   clang-17
powerpc64             randconfig-003-20240822   clang-15
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-002-20240822   clang-20
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                        dreamcast_defconfig   gcc-14.1.0
sh                          lboxre2_defconfig   gcc-14.1.0
sh                          rsk7269_defconfig   gcc-14.1.0
sh                          sdk7780_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240822   gcc-12
x86_64       buildonly-randconfig-002-20240822   clang-18
x86_64       buildonly-randconfig-003-20240822   gcc-12
x86_64       buildonly-randconfig-004-20240822   gcc-12
x86_64       buildonly-randconfig-005-20240822   gcc-12
x86_64       buildonly-randconfig-006-20240822   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240822   clang-18
x86_64                randconfig-002-20240822   clang-18
x86_64                randconfig-003-20240822   gcc-12
x86_64                randconfig-004-20240822   clang-18
x86_64                randconfig-005-20240822   gcc-12
x86_64                randconfig-006-20240822   gcc-12
x86_64                randconfig-011-20240822   gcc-12
x86_64                randconfig-012-20240822   clang-18
x86_64                randconfig-013-20240822   gcc-12
x86_64                randconfig-014-20240822   clang-18
x86_64                randconfig-015-20240822   clang-18
x86_64                randconfig-016-20240822   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
