Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CE3C87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 16:40:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8457010E6C6;
	Tue,  5 Aug 2025 16:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WoVFTpYb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149BD10E6C6
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 16:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754412006; x=1785948006;
 h=date:from:to:cc:subject:message-id;
 bh=QpmKUvv583CzP/ainqJwkgfdZhsEdSVOapGiETbiULI=;
 b=WoVFTpYbhaqa6KH3oqWFmFQtS9ATKuSaHWvgAEnPxA3/vZ4bPh8dah5D
 tVk9fMtlyBCSjyZNq+6rv/8HqML+rtvUa4lcMTYHEnYaVowen7MrFk0T0
 Z/COntpZCfIwpkuh1pCHtzdGS1k0USjdTfubTiRxUb65tJQypAwNhflu9
 wkQkH9lnAlxk2tCppJOaCCk+OyhoaGZ1KfnZQmL0io/lUy2Jll8pWfhmv
 go4/D056I0YZJruGtuxuJEPpdrKK94nTnVTv/UAGrZ2OKWTXB4nJ6AjLR
 QyHoQnT0kavWRJGlcZdby3LtQvp3yiOAxEKosgU4tUVkU6lWBDGhTacJN Q==;
X-CSE-ConnectionGUID: lKRylRyeQcOqePNvBMJdig==
X-CSE-MsgGUID: roFOJidqQpap9JmrjA4FjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56627880"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56627880"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 09:40:06 -0700
X-CSE-ConnectionGUID: qghVcRE/Tq6nK26CPPYMcw==
X-CSE-MsgGUID: OXjeCwYfTDOlCgzzjpcG5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="169917383"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by orviesa005.jf.intel.com with ESMTP; 05 Aug 2025 09:40:05 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ujKhi-0000gw-2J;
 Tue, 05 Aug 2025 16:40:00 +0000
Date: Wed, 06 Aug 2025 00:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next-fixes] BUILD SUCCESS
 022906afdf90327bce33d52fb4fb41b6c7d618fb
Message-ID: <202508060028.1fJYfIec-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next-fixes
branch HEAD: 022906afdf90327bce33d52fb4fb41b6c7d618fb  Mark xe driver as BROKEN if kernel page size is not 4kB

elapsed time: 1441m

configs tested: 126
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250805    gcc-8.5.0
arc                   randconfig-002-20250805    gcc-10.5.0
arc                           tb10x_defconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                            hisi_defconfig    gcc-15.1.0
arm                   randconfig-001-20250805    gcc-11.5.0
arm                   randconfig-002-20250805    clang-22
arm                   randconfig-003-20250805    gcc-12.5.0
arm                   randconfig-004-20250805    clang-18
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250805    gcc-12.5.0
arm64                 randconfig-002-20250805    clang-20
arm64                 randconfig-003-20250805    gcc-11.5.0
arm64                 randconfig-004-20250805    gcc-13.4.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250805    gcc-12.5.0
csky                  randconfig-002-20250805    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250805    clang-20
hexagon               randconfig-002-20250805    clang-22
i386        buildonly-randconfig-001-20250805    clang-20
i386        buildonly-randconfig-002-20250805    gcc-12
i386        buildonly-randconfig-003-20250805    gcc-12
i386        buildonly-randconfig-004-20250805    gcc-12
i386        buildonly-randconfig-005-20250805    gcc-12
i386        buildonly-randconfig-006-20250805    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250805    gcc-15.1.0
loongarch             randconfig-002-20250805    gcc-12.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip22_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250805    gcc-11.5.0
nios2                 randconfig-002-20250805    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                  or1klitex_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250805    gcc-10.5.0
parisc                randconfig-002-20250805    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                       ebony_defconfig    clang-22
powerpc               randconfig-001-20250805    clang-22
powerpc               randconfig-002-20250805    clang-22
powerpc               randconfig-003-20250805    gcc-9.5.0
powerpc64             randconfig-001-20250805    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250805    clang-18
riscv                 randconfig-002-20250805    gcc-9.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250805    clang-22
s390                  randconfig-002-20250805    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                     magicpanelr2_defconfig    gcc-15.1.0
sh                    randconfig-001-20250805    gcc-9.5.0
sh                    randconfig-002-20250805    gcc-14.3.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250805    gcc-8.5.0
sparc                 randconfig-002-20250805    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250805    gcc-9.5.0
sparc64               randconfig-002-20250805    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250805    gcc-12
um                    randconfig-002-20250805    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20250805    gcc-12
x86_64      buildonly-randconfig-002-20250805    gcc-12
x86_64      buildonly-randconfig-003-20250805    clang-20
x86_64      buildonly-randconfig-004-20250805    gcc-12
x86_64      buildonly-randconfig-005-20250805    clang-20
x86_64      buildonly-randconfig-006-20250805    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250805    gcc-14.3.0
xtensa                randconfig-002-20250805    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
