Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E77CAC593
	for <intel-xe@archiver.kernel.org>; Sat, 13 Sep 2025 19:49:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD84F10E0D3;
	Sat, 13 Sep 2025 19:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YhMO07GU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D846E10E0D3
 for <intel-xe@lists.freedesktop.org>; Sat, 13 Sep 2025 19:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757792981; x=1789328981;
 h=date:from:to:cc:subject:message-id;
 bh=b+pQ+nfet5psSiC/kcmg5sjZuJfvx+4n41v/aOA2uQw=;
 b=YhMO07GUsufIhC90gJx0kRIxBh1WW1fTrZEmJyPxdxasv2VmrnuEt1Z9
 QExCDmK56HICrn6vsHkcmztR84OjjfYJ8nLO5OvEyp7Y0NpdbkOks4Ceg
 mUtlqb7eNxwsEsKdaySNCqDwtbEP0yPkjeyfv0Zw+EKVmBA0vxzAZAZRQ
 aNsJgIZGJDBy3TLCQxnPFmUaiMjD/4WR3NzeS4+W0zUiLi2xEQzIMBPtU
 J/ssu5R7xwQKDOlIZGXvkuEh+DuTxUDwumROtWu/jg8vb6nV+1rOC449j
 ulhZ2Dvtd8Y35l176x50Uoh7AB6SxmZeuXRVeLuOZuvvxMuc2NDGzhM/b Q==;
X-CSE-ConnectionGUID: 6T2jxvbdRKu6o/2W3mRfDA==
X-CSE-MsgGUID: NtvWlvuQRdG8vZyhZeKR9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="60248664"
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; d="scan'208";a="60248664"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2025 12:49:40 -0700
X-CSE-ConnectionGUID: Eky79QkMTH+FYe4S3JOzzA==
X-CSE-MsgGUID: UgCx3kSvSMSFJVkRwfnQmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; d="scan'208";a="179501650"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
 by fmviesa004.fm.intel.com with ESMTP; 13 Sep 2025 12:49:39 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uxWFc-0001om-1Q;
 Sat, 13 Sep 2025 19:49:36 +0000
Date: Sun, 14 Sep 2025 03:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD REGRESSION
 d4c3ed963e41d488695cf91068eabb8eb9f538ec
Message-ID: <202509140341.XgjUynOD-lkp@intel.com>
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
branch HEAD: d4c3ed963e41d488695cf91068eabb8eb9f538ec  drm/xe: defer free of NVM auxiliary container to device release callback

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202509101853.nDmyxTEM-lkp@intel.com

    drivers/gpu/drm/xe/xe_migrate.c:422:3: error: cannot jump from this indirect goto statement to one of its possible targets

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arm64-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_migrate.c:error:cannot-jump-from-this-indirect-goto-statement-to-one-of-its-possible-targets
|-- i386-randconfig-141-20250914
|   `-- drivers-gpu-drm-xe-xe_migrate.c:error:cannot-jump-from-this-indirect-goto-statement-to-one-of-its-possible-targets
|-- loongarch-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_migrate.c:error:cannot-jump-from-this-indirect-goto-statement-to-one-of-its-possible-targets
|-- s390-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_migrate.c:error:cannot-jump-from-this-indirect-goto-statement-to-one-of-its-possible-targets
`-- s390-randconfig-001-20250913
    `-- drivers-gpu-drm-xe-xe_migrate.c:error:cannot-jump-from-this-indirect-goto-statement-to-one-of-its-possible-targets

elapsed time: 1446m

configs tested: 104
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250913    gcc-10.5.0
arc                   randconfig-002-20250913    gcc-11.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-22
arm                   randconfig-001-20250913    clang-20
arm                   randconfig-002-20250913    clang-22
arm                   randconfig-003-20250913    clang-22
arm                   randconfig-004-20250913    gcc-14.3.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250913    clang-22
arm64                 randconfig-002-20250913    gcc-14.3.0
arm64                 randconfig-003-20250913    clang-22
arm64                 randconfig-004-20250913    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250913    gcc-11.5.0
csky                  randconfig-002-20250913    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20250913    clang-16
hexagon               randconfig-002-20250913    clang-22
i386        buildonly-randconfig-001-20250913    gcc-14
i386        buildonly-randconfig-002-20250913    clang-20
i386        buildonly-randconfig-003-20250913    clang-20
i386        buildonly-randconfig-004-20250913    clang-20
i386        buildonly-randconfig-005-20250913    clang-20
i386        buildonly-randconfig-006-20250913    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250913    clang-18
loongarch             randconfig-002-20250913    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                         3c120_defconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250913    gcc-8.5.0
nios2                 randconfig-002-20250913    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           alldefconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250913    gcc-12.5.0
parisc                randconfig-002-20250913    gcc-9.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                       eiger_defconfig    clang-22
powerpc               randconfig-001-20250913    gcc-8.5.0
powerpc               randconfig-002-20250913    clang-22
powerpc               randconfig-003-20250913    gcc-10.5.0
powerpc                     skiroot_defconfig    clang-22
powerpc64             randconfig-001-20250913    gcc-10.5.0
powerpc64             randconfig-002-20250913    clang-22
powerpc64             randconfig-003-20250913    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250913    gcc-13.4.0
riscv                 randconfig-002-20250913    clang-20
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250913    clang-22
s390                  randconfig-002-20250913    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250913    gcc-9.5.0
sh                    randconfig-002-20250913    gcc-14.3.0
sh                           se7724_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250913    gcc-15.1.0
sparc                 randconfig-002-20250913    gcc-8.5.0
sparc64               randconfig-001-20250913    gcc-8.5.0
sparc64               randconfig-002-20250913    clang-20
um                                allnoconfig    clang-22
um                    randconfig-001-20250913    gcc-14
um                    randconfig-002-20250913    clang-22
x86_64      buildonly-randconfig-001-20250913    clang-20
x86_64      buildonly-randconfig-002-20250913    gcc-14
x86_64      buildonly-randconfig-003-20250913    gcc-12
x86_64      buildonly-randconfig-004-20250913    gcc-14
x86_64      buildonly-randconfig-005-20250913    clang-20
x86_64      buildonly-randconfig-006-20250913    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250913    gcc-14.3.0
xtensa                randconfig-002-20250913    gcc-13.4.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
