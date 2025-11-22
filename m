Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEFFCFC51F
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 17:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A3710E052;
	Sat, 22 Nov 2025 17:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="REExw4cA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7352D10E052
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 17:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763833452; x=1795369452;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=bKb6IzxAtAedrFKpMnZuVlmwSGq8S/+ZETR8NYUnPWI=;
 b=REExw4cALILBz6VILoPowRrVhQUxBf7Qt51G+inWfDhH6xRCPZ4DDoBB
 tcMevW21ffPOj/3AQItyao8S1JpyjLMcFBW/zRZ1cSmjjwpK1czbfL6GS
 COdPj6v+L4E8R9e2enY6xlXQgI08rLsSumQhdaGeuIlrQuJ0sbeeAHmnS
 jPUXkdICssWng8Hdi8/oIe2KgSZyD9rGERUQOZK2cBuCwoDRsy/II479f
 gCjOCybWJzIPDhymyhtomI4U/WEVm7KPR+OiFSKGufYfdoKGMu9eACzdD
 YMY0Ds1GuOSmr1KzVVcYKK/kWi5OnCmByxiPhYQVjASAtUEuN7iRIv00M A==;
X-CSE-ConnectionGUID: Wu9iQpaqQ7i4vLOJDSNs/Q==
X-CSE-MsgGUID: 6ivWsMIbSI+l4GwJHbnY7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="76586217"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; d="scan'208";a="76586217"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 09:44:11 -0800
X-CSE-ConnectionGUID: FAZcrF8OSAy6v0bQZJA+gg==
X-CSE-MsgGUID: 3AohOLf0TyGHqITyPb6B6w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 22 Nov 2025 09:44:10 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vMreZ-0007jL-0G;
 Sat, 22 Nov 2025 17:44:07 +0000
Date: Sun, 23 Nov 2025 01:43:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next-fixes] BUILD SUCCESS
 dcb171931954c51a1a7250d558f02b8f36570783
Message-ID: <202511230147.vSh1PNTU-lkp@intel.com>
User-Agent: s-nail v14.9.25
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next-fixes
branch HEAD: dcb171931954c51a1a7250d558f02b8f36570783  drm/xe/oa: Fix potential UAF in xe_oa_add_config_ioctl()

elapsed time: 1977m

configs tested: 107
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                      axs103_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20251122    gcc-14.3.0
arc                   randconfig-002-20251122    gcc-9.5.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20251122    clang-22
arm                   randconfig-002-20251122    clang-22
arm                   randconfig-003-20251122    clang-22
arm                   randconfig-004-20251122    gcc-12.5.0
arm                         s3c6400_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251122    gcc-8.5.0
arm64                 randconfig-002-20251122    gcc-9.5.0
arm64                 randconfig-003-20251122    gcc-10.5.0
arm64                 randconfig-004-20251122    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251122    gcc-15.1.0
csky                  randconfig-002-20251122    gcc-14.3.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251122    clang-22
hexagon               randconfig-002-20251122    clang-17
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251122    clang-20
i386        buildonly-randconfig-002-20251122    clang-20
i386        buildonly-randconfig-003-20251122    gcc-14
i386        buildonly-randconfig-004-20251122    clang-20
i386        buildonly-randconfig-005-20251122    clang-20
i386        buildonly-randconfig-006-20251122    clang-20
i386                  randconfig-001-20251122    clang-20
i386                  randconfig-002-20251122    gcc-13
i386                  randconfig-003-20251122    clang-20
i386                  randconfig-004-20251122    clang-20
i386                  randconfig-011-20251122    gcc-14
i386                  randconfig-012-20251122    clang-20
i386                  randconfig-013-20251122    clang-20
i386                  randconfig-014-20251122    gcc-14
i386                  randconfig-015-20251122    clang-20
i386                  randconfig-016-20251122    gcc-12
i386                  randconfig-017-20251122    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251122    gcc-12.5.0
loongarch             randconfig-002-20251122    gcc-14.3.0
m68k                             alldefconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251122    gcc-11.5.0
nios2                 randconfig-002-20251122    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251122    gcc-14.3.0
parisc                randconfig-002-20251122    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                     kmeter1_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251122    clang-16
powerpc               randconfig-002-20251122    gcc-11.5.0
powerpc64             randconfig-001-20251122    clang-17
powerpc64             randconfig-002-20251122    gcc-10.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251122    clang-22
riscv                 randconfig-002-20251122    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251122    clang-16
s390                  randconfig-002-20251122    gcc-13.4.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          r7780mp_defconfig    gcc-15.1.0
sh                    randconfig-001-20251122    gcc-15.1.0
sh                    randconfig-002-20251122    gcc-10.5.0
sh                   secureedge5410_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251122    gcc-13.4.0
sparc                 randconfig-002-20251122    gcc-11.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251122    gcc-13.4.0
sparc64               randconfig-002-20251122    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251122    clang-22
um                    randconfig-002-20251122    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-071-20251122    gcc-14
x86_64                randconfig-072-20251122    gcc-14
x86_64                randconfig-073-20251122    clang-20
x86_64                randconfig-074-20251122    gcc-14
x86_64                randconfig-075-20251122    clang-20
x86_64                randconfig-076-20251122    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  cadence_csp_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251122    gcc-12.5.0
xtensa                randconfig-002-20251122    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
