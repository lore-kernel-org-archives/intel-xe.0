Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BB7C02180
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 11:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA5110E947;
	Thu, 16 Jan 2025 11:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wo/RWtq2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2456510E947
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 11:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737027950; x=1768563950;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=2wJAt96NzEVGMT9X39laTTfjCeFQw+n1cX/jHNIsA7Q=;
 b=Wo/RWtq2QGJtXPNBEZ2RLTY1v71H5utjNYJUdYI4x0lZ1+JaEumaBrhU
 4/5VrYqIBEH7H/Zs7sj0w2xZjGBW0SpPy77CAC25iuV1smU9QphXWPT0M
 rsYExvxCxPAXaHrL8hFBffdSBL90p0HJimEc4CZ1i2OdYHGuR6n0bTb9V
 uilggha78+Iyb7W54eOg3+MU2zZ41y4B44PrRN9dv7aURL9CJeXc53GpQ
 hNL/727//DtAv0BEgWbcNAh3dLikVsxqEubWv+KgzT+lQXkDFDDnUmPe/
 1L0GgEicGiq05l/jj1fPsFc8GWO9d+BzmJRPL6PFTy+5pPoBFwhb4tTYC Q==;
X-CSE-ConnectionGUID: kCmYMrptR0ywNsz1leXq1Q==
X-CSE-MsgGUID: 5Ptl/UAERE61tDJbLnOBLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37528611"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37528611"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 03:45:50 -0800
X-CSE-ConnectionGUID: GCa34RSfQ4Wu9/kfimHhFw==
X-CSE-MsgGUID: ZlZ8ctQqTsih7jGofmTTVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="142743357"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 16 Jan 2025 03:45:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tYOJm-000Rl5-1x;
 Thu, 16 Jan 2025 11:45:46 +0000
Date: Thu, 16 Jan 2025 19:45:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 79a21fc921d7aafaf69d00b4938435b81bf66022
Message-ID: <202501161939.4tqFuTRC-lkp@intel.com>
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
branch HEAD: 79a21fc921d7aafaf69d00b4938435b81bf66022  drm/xe/oa: Add missing VISACTL mux registers

elapsed time: 1449m

configs tested: 94
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
alpha                           allyesconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                              allnoconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250115    gcc-13.2.0
arc                  randconfig-002-20250115    gcc-13.2.0
arc                       vdk_hs38_defconfig    gcc-13.2.0
arm                              allnoconfig    clang-17
arm                             allyesconfig    gcc-14.2.0
arm                           mmp2_defconfig    gcc-14.2.0
arm                  randconfig-001-20250115    clang-16
arm                  randconfig-002-20250115    clang-20
arm                  randconfig-003-20250115    clang-20
arm                  randconfig-004-20250115    clang-20
arm                        s3c6400_defconfig    gcc-14.2.0
arm64                           allmodconfig    clang-18
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20250115    clang-20
arm64                randconfig-002-20250115    gcc-14.2.0
arm64                randconfig-003-20250115    clang-18
arm64                randconfig-004-20250115    gcc-14.2.0
csky                             allnoconfig    gcc-14.2.0
csky                 randconfig-001-20250115    gcc-14.2.0
csky                 randconfig-002-20250115    gcc-14.2.0
hexagon                         allmodconfig    clang-20
hexagon                          allnoconfig    clang-20
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250115    clang-20
hexagon              randconfig-002-20250115    clang-19
i386                            allmodconfig    gcc-12
i386                             allnoconfig    gcc-12
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250115    clang-19
i386       buildonly-randconfig-002-20250115    gcc-12
i386       buildonly-randconfig-003-20250115    gcc-12
i386       buildonly-randconfig-004-20250115    gcc-12
i386       buildonly-randconfig-005-20250115    gcc-12
i386       buildonly-randconfig-006-20250115    gcc-12
i386                               defconfig    clang-19
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20250115    gcc-14.2.0
loongarch            randconfig-002-20250115    gcc-14.2.0
m68k                            allmodconfig    gcc-14.2.0
m68k                            allyesconfig    gcc-14.2.0
nios2                randconfig-001-20250115    gcc-14.2.0
nios2                randconfig-002-20250115    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
openrisc                        allyesconfig    gcc-14.2.0
parisc                          allmodconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc                          allyesconfig    gcc-14.2.0
parisc               randconfig-001-20250115    gcc-14.2.0
parisc               randconfig-002-20250115    gcc-14.2.0
powerpc                         allmodconfig    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20250115    gcc-14.2.0
powerpc              randconfig-002-20250115    gcc-14.2.0
powerpc              randconfig-003-20250115    gcc-14.2.0
powerpc64            randconfig-001-20250115    gcc-14.2.0
powerpc64            randconfig-002-20250115    gcc-14.2.0
powerpc64            randconfig-003-20250115    clang-18
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20250115    gcc-14.2.0
riscv                randconfig-002-20250115    clang-16
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-20
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250115    clang-20
s390                 randconfig-002-20250115    clang-15
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250115    gcc-14.2.0
sh                   randconfig-002-20250115    gcc-14.2.0
sparc                randconfig-001-20250115    gcc-14.2.0
sparc                randconfig-002-20250115    gcc-14.2.0
sparc64              randconfig-001-20250115    gcc-14.2.0
sparc64              randconfig-002-20250115    gcc-14.2.0
um                              allmodconfig    clang-20
um                               allnoconfig    clang-18
um                              allyesconfig    gcc-12
um                   randconfig-001-20250115    clang-18
um                   randconfig-002-20250115    gcc-12
x86_64                           allnoconfig    clang-19
x86_64                          allyesconfig    clang-19
x86_64     buildonly-randconfig-001-20250115    gcc-12
x86_64     buildonly-randconfig-002-20250115    gcc-12
x86_64     buildonly-randconfig-003-20250115    clang-19
x86_64     buildonly-randconfig-004-20250115    clang-19
x86_64     buildonly-randconfig-005-20250115    gcc-12
x86_64     buildonly-randconfig-006-20250115    clang-19
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250115    gcc-14.2.0
xtensa               randconfig-002-20250115    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
