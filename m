Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A851C021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 22:05:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B7010E077;
	Wed, 19 Feb 2025 22:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bYC62QAo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAC110E077
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Feb 2025 22:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740002704; x=1771538704;
 h=date:from:to:cc:subject:message-id;
 bh=Fdki21N2Bm1mz89FoGnJZVBOhdcH7WY+LsqUboLyOcY=;
 b=bYC62QAoGmEKb91yngzN2Wr/gxlBDwHIkLTTwn0vO/TB1yiUTPxPDvnQ
 84NGaYVrdlwYPUPeGOtUo9gjdjlrx7SM4HFS4EBU3u9+KzkRDBx7BTrLy
 ZN0Tlzk7tCYm5rZg/+DeoMZzB0+srZIsHzlH9PC1CaQCZg0WHJ5rslN98
 Jz7qsf3QxcDUTWWxCnMqLagiMHSQtbm8ISnnBJWKnsp5oElh9KBIc3jfa
 Hu65fQvhJp+4gwd4esRVn48BkBbQMZJvWubKoRyyNoqyOYnxzomhmtqa4
 SSP/gQlu12CY0yxBFmKgRx05On/m7LHiTMZ4E3a9Dm52vMPlRuUo9sESL g==;
X-CSE-ConnectionGUID: RX1UNB3PSJqAwGkBnuvqOw==
X-CSE-MsgGUID: t45hkVBwR26yFD4uQWY0VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40882106"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="40882106"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 14:05:03 -0800
X-CSE-ConnectionGUID: 5PAk2Lp/Sl2Ok7gFmbqlJA==
X-CSE-MsgGUID: tD0UK/0OTHCfBo9T16lnDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115322663"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by orviesa007.jf.intel.com with ESMTP; 19 Feb 2025 14:04:56 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tksBV-0003XL-1C;
 Wed, 19 Feb 2025 22:04:49 +0000
Date: Thu, 20 Feb 2025 06:03:54 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 213e24250feed3bcf58d7594298df2d7e78a88ab
Message-ID: <202502200648.WVYxN0Zn-lkp@intel.com>
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
branch HEAD: 213e24250feed3bcf58d7594298df2d7e78a88ab  drm/xe/guc: Fix size_t print format

elapsed time: 1446m

configs tested: 73
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                           allyesconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250219    gcc-13.2.0
arc                  randconfig-002-20250219    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250219    gcc-14.2.0
arm                  randconfig-002-20250219    clang-17
arm                  randconfig-003-20250219    clang-15
arm                  randconfig-004-20250219    gcc-14.2.0
arm64                randconfig-001-20250219    clang-21
arm64                randconfig-002-20250219    gcc-14.2.0
arm64                randconfig-003-20250219    gcc-14.2.0
arm64                randconfig-004-20250219    gcc-14.2.0
csky                 randconfig-001-20250219    gcc-14.2.0
csky                 randconfig-002-20250219    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250219    clang-14
hexagon              randconfig-002-20250219    clang-21
i386                            allmodconfig    gcc-12
i386                             allnoconfig    gcc-12
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250219    clang-19
i386       buildonly-randconfig-002-20250219    clang-19
i386       buildonly-randconfig-003-20250219    gcc-12
i386       buildonly-randconfig-004-20250219    clang-19
i386       buildonly-randconfig-005-20250219    clang-19
i386       buildonly-randconfig-006-20250219    gcc-12
i386                               defconfig    clang-19
loongarch            randconfig-001-20250219    gcc-14.2.0
loongarch            randconfig-002-20250219    gcc-14.2.0
nios2                randconfig-001-20250219    gcc-14.2.0
nios2                randconfig-002-20250219    gcc-14.2.0
parisc               randconfig-001-20250219    gcc-14.2.0
parisc               randconfig-002-20250219    gcc-14.2.0
powerpc              randconfig-001-20250219    clang-15
powerpc              randconfig-002-20250219    clang-17
powerpc              randconfig-003-20250219    gcc-14.2.0
powerpc64            randconfig-001-20250219    gcc-14.2.0
powerpc64            randconfig-002-20250219    gcc-14.2.0
powerpc64            randconfig-003-20250219    gcc-14.2.0
riscv                randconfig-001-20250219    clang-21
riscv                randconfig-002-20250219    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250219    clang-18
s390                 randconfig-002-20250219    clang-21
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250219    gcc-14.2.0
sh                   randconfig-002-20250219    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250219    gcc-14.2.0
sparc                randconfig-002-20250219    gcc-14.2.0
sparc64              randconfig-001-20250219    gcc-14.2.0
sparc64              randconfig-002-20250219    gcc-14.2.0
um                              allmodconfig    clang-21
um                              allyesconfig    gcc-12
um                   randconfig-001-20250219    clang-21
um                   randconfig-002-20250219    clang-21
x86_64                           allnoconfig    clang-19
x86_64                          allyesconfig    clang-19
x86_64     buildonly-randconfig-001-20250219    gcc-12
x86_64     buildonly-randconfig-002-20250219    clang-19
x86_64     buildonly-randconfig-003-20250219    gcc-12
x86_64     buildonly-randconfig-004-20250219    clang-19
x86_64     buildonly-randconfig-005-20250219    gcc-12
x86_64     buildonly-randconfig-006-20250219    clang-19
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250219    gcc-14.2.0
xtensa               randconfig-002-20250219    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
