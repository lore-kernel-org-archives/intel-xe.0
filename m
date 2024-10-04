Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47574CFA779
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 13:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100F010EA09;
	Fri,  4 Oct 2024 13:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="guCYABlT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EEF10E171
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 13:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728049523; x=1759585523;
 h=date:from:to:cc:subject:message-id;
 bh=tOhMkZsLggA/wY4kEn7bPdaVt2zC5zTfcbh8rj0HApE=;
 b=guCYABlTPcBo567+ArxQMYHws2Amf9+YK66nHdMF2JFsgg9djFsMiSuB
 WFR9qRcJiZd1Msm7U/2xOdc6kx35lxlE8BqKq8Zg2houUZBPByLBz0p6a
 jxYMNqwso19d5ZdKI7TY0tIG3i8R2giHRFNzebpFtQAuYzm7FOv829V3X
 J40OWjUZeK7VxsUg4Ye61dXRqcPJiZIuA3B9R3pXCn8LvSYy81wpvz8Co
 QYXDoDynqqaUGoFy/WtSBLMIvsLGCblrH24Id2AaD/ZGEj1aX1ATpg8Ub
 IjZF++Zj21iBzC7FPezimKN/49KYH+s/jM6ySbXW6BvbkbjiJCTU2cwN4 Q==;
X-CSE-ConnectionGUID: yW8mF78eSd+bq1EpnFOqwg==
X-CSE-MsgGUID: fDflLLmJSva1lPwQLKoC1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27215217"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="27215217"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 06:45:23 -0700
X-CSE-ConnectionGUID: qStHp4q4QGuoYAaUd4j0Bg==
X-CSE-MsgGUID: eF1RLcjATPi88ZXxQ+lY7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="98034719"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 04 Oct 2024 06:45:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1swicQ-0001iO-1Z;
 Fri, 04 Oct 2024 13:45:18 +0000
Date: Fri, 04 Oct 2024 21:44:50 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 a6f3b2527375c786f2eff77d3ee8b805bcfe026d
Message-ID: <202410042135.8YaG8LA9-lkp@intel.com>
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
branch HEAD: a6f3b2527375c786f2eff77d3ee8b805bcfe026d  drm/xe: Fix memory leak when aborting binds

elapsed time: 1377m

configs tested: 141
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241004    clang-18
i386        buildonly-randconfig-002-20241004    clang-18
i386        buildonly-randconfig-002-20241004    gcc-12
i386        buildonly-randconfig-003-20241004    clang-18
i386        buildonly-randconfig-003-20241004    gcc-12
i386        buildonly-randconfig-004-20241004    clang-18
i386        buildonly-randconfig-004-20241004    gcc-12
i386        buildonly-randconfig-005-20241004    clang-18
i386        buildonly-randconfig-006-20241004    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241004    clang-18
i386                  randconfig-001-20241004    gcc-12
i386                  randconfig-002-20241004    clang-18
i386                  randconfig-003-20241004    clang-18
i386                  randconfig-003-20241004    gcc-12
i386                  randconfig-004-20241004    clang-18
i386                  randconfig-004-20241004    gcc-12
i386                  randconfig-005-20241004    clang-18
i386                  randconfig-005-20241004    gcc-12
i386                  randconfig-006-20241004    clang-18
i386                  randconfig-006-20241004    gcc-12
i386                  randconfig-011-20241004    clang-18
i386                  randconfig-012-20241004    clang-18
i386                  randconfig-013-20241004    clang-18
i386                  randconfig-014-20241004    clang-18
i386                  randconfig-014-20241004    gcc-12
i386                  randconfig-015-20241004    clang-18
i386                  randconfig-016-20241004    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241004    clang-18
x86_64      buildonly-randconfig-002-20241004    clang-18
x86_64      buildonly-randconfig-003-20241004    clang-18
x86_64      buildonly-randconfig-004-20241004    clang-18
x86_64      buildonly-randconfig-005-20241004    clang-18
x86_64      buildonly-randconfig-006-20241004    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241004    clang-18
x86_64                randconfig-002-20241004    clang-18
x86_64                randconfig-003-20241004    clang-18
x86_64                randconfig-004-20241004    clang-18
x86_64                randconfig-005-20241004    clang-18
x86_64                randconfig-006-20241004    clang-18
x86_64                randconfig-011-20241004    clang-18
x86_64                randconfig-012-20241004    clang-18
x86_64                randconfig-013-20241004    clang-18
x86_64                randconfig-014-20241004    clang-18
x86_64                randconfig-015-20241004    clang-18
x86_64                randconfig-016-20241004    clang-18
x86_64                randconfig-071-20241004    clang-18
x86_64                randconfig-072-20241004    clang-18
x86_64                randconfig-073-20241004    clang-18
x86_64                randconfig-074-20241004    clang-18
x86_64                randconfig-075-20241004    clang-18
x86_64                randconfig-076-20241004    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
