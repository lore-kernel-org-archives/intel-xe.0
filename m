Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09951FF885D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 12:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFBF10EB72;
	Tue, 28 Apr 2026 12:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VnInFV25";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF3010EB83
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 12:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777380177; x=1808916177;
 h=date:from:to:cc:subject:message-id;
 bh=IPEKctGYAFFUcKvA3V1ynMcq4DKFk40h/GmkyVQObmM=;
 b=VnInFV25qWkLUwMDBO/K2HbU4RQbmASDxh6PGb6mkjGFrrH/hCicz/U6
 upFDu7rh42K27lWccC4mw9eCCeo0qLQPfaIkWQJLsvH9wNRVt2NIH7kZX
 5DpdaWIuUHVcRmGgy8mYTsR3RDuclpO9YmPy7q9roCeigD+LU5BNY2GpK
 d9DHjEGyaXDK2304KfD4Z93grQeBklOsS7HCLEBVRjzp+cV+cKc1RpGVs
 sVxq4ubDN20NiQQWe1cDRUTNker7WFCycnexlZ227gvDxvPJiqnXrcVKy
 grbYURA8xzIIGnBzYdz7yckpuN9rHBJU02dz2BAWXYsqFXIsGxsV5k+3m A==;
X-CSE-ConnectionGUID: mTbuFVRnQk+MUDXz18kPfw==
X-CSE-MsgGUID: o4aiyfgJQquUVFDG0c1Byg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="100943907"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="100943907"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 05:42:56 -0700
X-CSE-ConnectionGUID: ZwSD1EaOTkyOcRfxXyLnyQ==
X-CSE-MsgGUID: owNmAcdLSHiJGPF3xhMpcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="229375142"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 28 Apr 2026 05:42:55 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wHhm8-000000009oi-21vj;
 Tue, 28 Apr 2026 12:42:52 +0000
Date: Tue, 28 Apr 2026 20:42:39 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 e70d1c5fedfac919278a96aae0984f1927a55137
Message-ID: <202604282032.JvLZf9tr-lkp@intel.com>
User-Agent: s-nail v14.9.25
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
branch HEAD: e70d1c5fedfac919278a96aae0984f1927a55137  drm/xe/gt: Drop redundant forcewake

elapsed time: 867m

configs tested: 144
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260428    gcc-9.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260428    gcc-14.3.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                            randconfig-001    gcc-8.5.0
arm                   randconfig-001-20260428    gcc-8.5.0
arm                            randconfig-002    gcc-11.5.0
arm                   randconfig-002-20260428    clang-23
arm                            randconfig-003    clang-20
arm                   randconfig-003-20260428    gcc-8.5.0
arm                            randconfig-004    gcc-14.3.0
arm                   randconfig-004-20260428    gcc-15.2.0
arm                           sama7_defconfig    clang-23
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                  randconfig-001-20260428    gcc-12.5.0
csky                  randconfig-002-20260428    gcc-12.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                        randconfig-001    clang-17
hexagon               randconfig-001-20260428    clang-16
hexagon                        randconfig-002    clang-23
hexagon               randconfig-002-20260428    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386                  randconfig-001-20260428    gcc-14
i386                  randconfig-002-20260428    clang-20
i386                  randconfig-003-20260428    gcc-14
i386                  randconfig-004-20260428    gcc-14
i386                  randconfig-005-20260428    gcc-14
i386                  randconfig-006-20260428    gcc-14
i386                  randconfig-007-20260428    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    clang-18
loongarch             randconfig-001-20260428    gcc-15.2.0
loongarch                      randconfig-002    gcc-13.4.0
loongarch             randconfig-002-20260428    clang-18
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260428    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260428    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    gcc-13.4.0
parisc                randconfig-001-20260428    gcc-11.5.0
parisc                         randconfig-002    gcc-8.5.0
parisc                randconfig-002-20260428    gcc-8.5.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc                        randconfig-001    gcc-13.4.0
powerpc               randconfig-001-20260428    gcc-13.4.0
powerpc                        randconfig-002    gcc-10.5.0
powerpc               randconfig-002-20260428    clang-23
powerpc64                      randconfig-001    clang-17
powerpc64             randconfig-001-20260428    clang-23
powerpc64                      randconfig-002    clang-23
powerpc64             randconfig-002-20260428    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                          randconfig-001    gcc-8.5.0
riscv                 randconfig-001-20260428    clang-23
riscv                          randconfig-002    clang-23
riscv                 randconfig-002-20260428    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                           randconfig-001    gcc-11.5.0
s390                  randconfig-001-20260428    gcc-9.5.0
s390                           randconfig-002    clang-23
s390                  randconfig-002-20260428    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                             randconfig-001    gcc-15.2.0
sh                    randconfig-001-20260428    gcc-14.3.0
sh                             randconfig-002    gcc-14.3.0
sh                    randconfig-002-20260428    gcc-13.4.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260428    gcc-12.5.0
sparc                 randconfig-002-20260428    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260428    clang-20
sparc64               randconfig-002-20260428    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260428    clang-23
um                    randconfig-002-20260428    gcc-14
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260428    clang-20
x86_64      buildonly-randconfig-002-20260428    gcc-14
x86_64      buildonly-randconfig-003-20260428    gcc-14
x86_64      buildonly-randconfig-004-20260428    gcc-14
x86_64      buildonly-randconfig-005-20260428    gcc-14
x86_64      buildonly-randconfig-006-20260428    gcc-12
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260428    gcc-14.3.0
xtensa                randconfig-002-20260428    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
