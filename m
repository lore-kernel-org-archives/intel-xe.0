Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BD7E7719D
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jan 2025 11:22:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E959B10E10D;
	Fri, 10 Jan 2025 11:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8bygOq+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9904810E10D
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jan 2025 11:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736508171; x=1768044171;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=LTjV/sfduDSfyqeHHwoMFJanGDxceTU1ieQwQVtFzkw=;
 b=m8bygOq+edMVZmRy+fwgLJHME240gwlSkXyTmY26yKouPB4yQQzaaH9b
 uhtvTXI/jm3Pe4CdrntuhH0cGtUmsJEB06o4A4y00eoDHq6oiNIs1pupr
 4VkR7hBNP7xdzZHOStQtwl9P5t72QuHFWriv0aJrIkN/AThxTT+fQ6I2A
 bYRglIRs130Sbxas8nV5B2/2y6VdkZzUR7Y8kgr7fZ+2Ody2vBYiHY8gD
 YU4tLNJwuRRSS0CWntcWl6fLy4T9aYLdj90vG02Yz9rJX42WrvKFgfzIw
 o5vrI0nyCsi0e8Fpvpar2eR86zjb1uwyI1BbCMsVPPqTznCGWIbH57Wpt A==;
X-CSE-ConnectionGUID: q76C7DkkQYW0NYTDgEpQSA==
X-CSE-MsgGUID: yk21iD2FSDi7NcAxq7EyTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47792260"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="47792260"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 03:22:51 -0800
X-CSE-ConnectionGUID: dHGQbWGMT5mlSP9aWnwB+w==
X-CSE-MsgGUID: INyMWY2uSJCGM5R9UDZETw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="141012096"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 10 Jan 2025 03:22:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tWD6E-000J7T-1C;
 Fri, 10 Jan 2025 11:22:46 +0000
Date: Fri, 10 Jan 2025 19:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 b84e1cd22f8a8c03b7b1051372560c7017c8be92
Message-ID: <202501101949.tOMGqbKy-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: b84e1cd22f8a8c03b7b1051372560c7017c8be92  drm/xe/dg1: Fix power gate sequence.

elapsed time: 1452m

configs tested: 91
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250109    gcc-13.2.0
arc                   randconfig-002-20250109    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                   randconfig-001-20250109    gcc-14.2.0
arm                   randconfig-002-20250109    clang-17
arm                   randconfig-003-20250109    clang-20
arm                   randconfig-004-20250109    gcc-14.2.0
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250109    gcc-14.2.0
arm64                 randconfig-002-20250109    clang-20
arm64                 randconfig-003-20250109    gcc-14.2.0
arm64                 randconfig-004-20250109    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250109    gcc-14.2.0
csky                  randconfig-002-20250109    gcc-14.2.0
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250109    clang-14
hexagon               randconfig-002-20250109    clang-20
i386        buildonly-randconfig-001-20250109    gcc-12
i386        buildonly-randconfig-002-20250109    gcc-12
i386        buildonly-randconfig-003-20250109    clang-19
i386        buildonly-randconfig-004-20250109    clang-19
i386        buildonly-randconfig-005-20250109    clang-19
i386        buildonly-randconfig-006-20250109    gcc-12
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250109    gcc-14.2.0
loongarch             randconfig-002-20250109    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250109    gcc-14.2.0
nios2                 randconfig-002-20250109    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250109    gcc-14.2.0
parisc                randconfig-002-20250109    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250109    clang-15
powerpc               randconfig-002-20250109    gcc-14.2.0
powerpc               randconfig-003-20250109    gcc-14.2.0
powerpc64             randconfig-001-20250109    gcc-14.2.0
powerpc64             randconfig-002-20250109    clang-20
powerpc64             randconfig-003-20250109    clang-17
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250109    gcc-14.2.0
riscv                 randconfig-002-20250109    clang-15
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250109    gcc-14.2.0
s390                  randconfig-002-20250109    clang-16
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250109    gcc-14.2.0
sh                    randconfig-002-20250109    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250109    gcc-14.2.0
sparc                 randconfig-002-20250109    gcc-14.2.0
sparc64               randconfig-001-20250109    gcc-14.2.0
sparc64               randconfig-002-20250109    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20250109    gcc-12
um                    randconfig-002-20250109    gcc-12
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250109    clang-19
x86_64      buildonly-randconfig-002-20250109    gcc-12
x86_64      buildonly-randconfig-003-20250109    clang-19
x86_64      buildonly-randconfig-004-20250109    clang-19
x86_64      buildonly-randconfig-005-20250109    clang-19
x86_64      buildonly-randconfig-006-20250109    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250109    gcc-14.2.0
xtensa                randconfig-002-20250109    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
