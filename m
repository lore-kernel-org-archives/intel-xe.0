Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B44AE7716A
	for <intel-xe@archiver.kernel.org>; Sat, 14 Dec 2024 22:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7CE10E0B5;
	Sat, 14 Dec 2024 22:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WDUSahmT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2908C10E0B5
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Dec 2024 22:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734216633; x=1765752633;
 h=date:from:to:cc:subject:message-id;
 bh=86KBKmS9zR4QzDTYh7of6Kox3AIVfczDBmMRoUI4nlw=;
 b=WDUSahmTAEjQF4RTYyt3FZPynwSa5o1ZOJVE723kRpsM7qfcUzvgBQK7
 6rmg+98XF79z0M4ntbGKPI85yGHDWq7Wze9Zto1mWReF7LjnDgI2vfggF
 IrOuIylGoIw/OZxvqqXNRgTo5wXR0JPbeVvB7es8zDUY1toiZpFfqx0qQ
 Ss8CwVV2QxccfpFOmMMCM7Sfn+pr8WYq7wIOmenlbstjz58sKz/ifabmR
 WtRaPJX258jU3tw7DzZhZHLD9Pf0Ac4Nps6Y1m/0uXcBQFw3SuvUHPPvr
 JXQI6mfuUwOoYNDWBtipYDVvGOTvCgimG71KsOfxNEGaEOd3b1lTvCuHO w==;
X-CSE-ConnectionGUID: R02m+we8RiKM6wotzkrK9g==
X-CSE-MsgGUID: FV66KpK0SAO10kps9F8Q1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34783649"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; d="scan'208";a="34783649"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2024 14:50:33 -0800
X-CSE-ConnectionGUID: NwbmRtZrQFGh1hUc6xQvBg==
X-CSE-MsgGUID: XWfi5WnhRsC4k17RmV1QLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; d="scan'208";a="97412259"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 14 Dec 2024 14:50:32 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tMaxx-000DIc-20;
 Sat, 14 Dec 2024 22:50:29 +0000
Date: Sun, 15 Dec 2024 06:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 70fb86a85dc9fd66014d7eb2fe356f50702ceeb6
Message-ID: <202412150605.JS3E1st9-lkp@intel.com>
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
branch HEAD: 70fb86a85dc9fd66014d7eb2fe356f50702ceeb6  drm/xe: Revert some changes that break a mesa debug tool

elapsed time: 1449m

configs tested: 69
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                   randconfig-001-20241214    gcc-13.2.0
arc                   randconfig-002-20241214    gcc-13.2.0
arm                   randconfig-001-20241214    gcc-14.2.0
arm                   randconfig-002-20241214    clang-15
arm                   randconfig-003-20241214    gcc-14.2.0
arm                   randconfig-004-20241214    gcc-14.2.0
arm64                 randconfig-001-20241214    clang-15
arm64                 randconfig-002-20241214    clang-20
arm64                 randconfig-003-20241214    clang-15
arm64                 randconfig-004-20241214    gcc-14.2.0
csky                  randconfig-001-20241214    gcc-14.2.0
csky                  randconfig-002-20241214    gcc-14.2.0
hexagon               randconfig-001-20241214    clang-20
hexagon               randconfig-002-20241214    clang-14
i386        buildonly-randconfig-001-20241214    gcc-12
i386        buildonly-randconfig-002-20241214    gcc-12
i386        buildonly-randconfig-003-20241214    clang-19
i386        buildonly-randconfig-004-20241214    clang-19
i386        buildonly-randconfig-005-20241214    gcc-11
i386        buildonly-randconfig-006-20241214    gcc-12
loongarch             randconfig-001-20241214    gcc-14.2.0
loongarch             randconfig-002-20241214    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241214    gcc-14.2.0
nios2                 randconfig-002-20241214    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20241214    gcc-14.2.0
parisc                randconfig-002-20241214    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20241214    clang-20
powerpc               randconfig-002-20241214    clang-15
powerpc               randconfig-003-20241214    clang-20
powerpc64             randconfig-001-20241214    gcc-14.2.0
powerpc64             randconfig-003-20241214    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20241214    clang-20
riscv                 randconfig-002-20241214    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241214    gcc-14.2.0
s390                  randconfig-002-20241214    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241214    gcc-14.2.0
sh                    randconfig-002-20241214    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241214    gcc-14.2.0
sparc                 randconfig-002-20241214    gcc-14.2.0
sparc64               randconfig-001-20241214    gcc-14.2.0
sparc64               randconfig-002-20241214    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20241214    clang-20
um                    randconfig-002-20241214    clang-17
x86_64      buildonly-randconfig-001-20241214    gcc-11
x86_64      buildonly-randconfig-002-20241214    clang-19
x86_64      buildonly-randconfig-003-20241214    gcc-12
x86_64      buildonly-randconfig-004-20241214    gcc-12
x86_64      buildonly-randconfig-005-20241214    gcc-12
x86_64      buildonly-randconfig-006-20241214    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241214    gcc-14.2.0
xtensa                randconfig-002-20241214    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
