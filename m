Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCB8E7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 17:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA93610F0A5;
	Fri, 13 Dec 2024 17:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fi5POVf+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115BB10F0A5
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 17:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734109583; x=1765645583;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=FOK9fXY2Pr74i8cPJC7Cb5nM8uM+60WamUCHIjWm0w0=;
 b=Fi5POVf+xq/3g3CEZ1dQNIncc3Uxkl4TydWZENRvDJFgPIYWSm4oRDfL
 8T6vVQD2IbPNIIE1ItIjE1S9HEpmhnCJZJSYsB+qVh0PLtNlnCui7e5fR
 tGxM+Wi8Uv3171+L5zeTq4YF7PgE/SDhGPOMZdZQQjRgGBqB+roQfm/9N
 f61DYxdwBio4h0L3PhRpE04csUteNOQwHb1zIUIEhTZDLdiT0MrB5ffPR
 9h9wTun69A8Eu1Mo4N80IoNCrrEfLRzAmQUQYeSSZ5GTV8RmGM95ADNsh
 eYWiYD2tSiWVgJBbF89mSaLmk8byrTtAI0gPliq8c7XvQseHhka6UQbyN Q==;
X-CSE-ConnectionGUID: g8vdEIMnTvmnmRDx8R3AWw==
X-CSE-MsgGUID: XOPxUhSjRv2G4PevP7F2ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="38248430"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="38248430"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 09:06:23 -0800
X-CSE-ConnectionGUID: DcSOLHPmTLWuiLoBTW4huQ==
X-CSE-MsgGUID: R/LjKZE6Qc2jGPuX5gpflg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="96654382"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 13 Dec 2024 09:06:22 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tM97L-000CGZ-2Y;
 Fri, 13 Dec 2024 17:06:19 +0000
Date: Sat, 14 Dec 2024 01:05:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 d7b028656c29b22fcde1c6ee1df5b28fbba987b5
Message-ID: <202412140124.HmkmVTPO-lkp@intel.com>
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
branch HEAD: d7b028656c29b22fcde1c6ee1df5b28fbba987b5  drm/xe/reg_sr: Remove register pool

elapsed time: 1459m

configs tested: 60
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                             allmodconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20241213    gcc-13.2.0
arc                  randconfig-002-20241213    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                  randconfig-001-20241213    clang-16
arm                  randconfig-002-20241213    clang-18
arm                  randconfig-003-20241213    gcc-14.2.0
arm                  randconfig-004-20241213    clang-18
arm64                randconfig-001-20241213    gcc-14.2.0
arm64                randconfig-002-20241213    gcc-14.2.0
arm64                randconfig-003-20241213    clang-18
arm64                randconfig-004-20241213    gcc-14.2.0
csky                 randconfig-001-20241213    gcc-14.2.0
csky                 randconfig-002-20241213    gcc-14.2.0
hexagon              randconfig-001-20241213    clang-20
hexagon              randconfig-002-20241213    clang-20
i386       buildonly-randconfig-001-20241213    clang-19
i386       buildonly-randconfig-002-20241213    gcc-12
i386       buildonly-randconfig-003-20241213    gcc-12
i386       buildonly-randconfig-004-20241213    clang-19
i386       buildonly-randconfig-005-20241213    gcc-12
i386       buildonly-randconfig-006-20241213    gcc-12
loongarch            randconfig-001-20241213    gcc-14.2.0
loongarch            randconfig-002-20241213    gcc-14.2.0
nios2                randconfig-001-20241213    gcc-14.2.0
nios2                randconfig-002-20241213    gcc-14.2.0
parisc               randconfig-001-20241213    gcc-14.2.0
parisc               randconfig-002-20241213    gcc-14.2.0
powerpc              randconfig-001-20241213    gcc-14.2.0
powerpc              randconfig-002-20241213    clang-20
powerpc              randconfig-003-20241213    gcc-14.2.0
powerpc64            randconfig-001-20241213    gcc-14.2.0
powerpc64            randconfig-002-20241213    gcc-14.2.0
powerpc64            randconfig-003-20241213    gcc-14.2.0
riscv                randconfig-001-20241213    gcc-14.2.0
riscv                randconfig-002-20241213    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20241213    gcc-14.2.0
s390                 randconfig-002-20241213    clang-19
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20241213    gcc-14.2.0
sh                   randconfig-002-20241213    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20241213    gcc-14.2.0
sparc                randconfig-002-20241213    gcc-14.2.0
sparc64              randconfig-001-20241213    gcc-14.2.0
sparc64              randconfig-002-20241213    gcc-14.2.0
um                   randconfig-001-20241213    gcc-12
um                   randconfig-002-20241213    clang-16
x86_64     buildonly-randconfig-001-20241213    gcc-12
x86_64     buildonly-randconfig-002-20241213    gcc-12
x86_64     buildonly-randconfig-003-20241213    gcc-12
x86_64     buildonly-randconfig-004-20241213    gcc-12
x86_64     buildonly-randconfig-005-20241213    gcc-12
x86_64     buildonly-randconfig-006-20241213    clang-19
xtensa               randconfig-001-20241213    gcc-14.2.0
xtensa               randconfig-002-20241213    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
