Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548BFC02185
	for <intel-xe@archiver.kernel.org>; Sat, 18 Jan 2025 15:34:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB2D10E043;
	Sat, 18 Jan 2025 15:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mtYA1Gi4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F267210E043
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Jan 2025 15:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737214468; x=1768750468;
 h=date:from:to:cc:subject:message-id;
 bh=BEFFS9u82zw8IG6dxxDELwI/mQdIwpFlm7ZJXmh9zng=;
 b=mtYA1Gi4iEwbg4Q7fS/LYDhIS7dlJvh/AvHJzR31tNhI6b+2Uql2gOZ/
 SnV4VlyCB8dls1CabN/Lbq6eBrtGXVbyXrlaImmH1XhQotprOd3FEjB7M
 4zECbcYbc4wkc08YmXjjWGxFKwFxL0Uvlfxm1UxT+Dlg6ZfkpkfrjZCIC
 2Abla9FxZS8M7plVBFqObnNKhlUQewVwoVY85wtKl2mn+mhpxz+u34Ufq
 OpxVol8gAzwkm46i99ij41UdHz2O/Sp0+mpUfwvfDj1J3KgK693CPU0kv
 kv6U1DZHDnp0Z5c3fqSkXf6CwZMf6EfnVKhHndMA79BI+q0IZ3bNkj9HS g==;
X-CSE-ConnectionGUID: DgMKc+QkRqmEwqfB4t7Yow==
X-CSE-MsgGUID: 1UH4yw2DR8eG2KuqvdnA2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49050864"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="49050864"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2025 07:34:27 -0800
X-CSE-ConnectionGUID: SvwULFWmRR29ql5V5DS9Dg==
X-CSE-MsgGUID: sGZL0xISRHGGwNmSrEpDNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; d="scan'208";a="106255148"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 18 Jan 2025 07:34:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tZAq8-000UYh-0k;
 Sat, 18 Jan 2025 15:34:24 +0000
Date: Sat, 18 Jan 2025 23:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 474c4dd29f666145dee7b5dce56d024a26e9550c
Message-ID: <202501182344.Se2ICVms-lkp@intel.com>
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
branch HEAD: 474c4dd29f666145dee7b5dce56d024a26e9550c  drm/xe: Add missing SPDX license identifiers

elapsed time: 1447m

configs tested: 79
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                               allnoconfig    gcc-13.2.0
arc                   randconfig-001-20250118    gcc-13.2.0
arc                   randconfig-002-20250118    gcc-13.2.0
arm                               allnoconfig    clang-17
arm                   randconfig-001-20250118    gcc-14.2.0
arm                   randconfig-002-20250118    clang-20
arm                   randconfig-003-20250118    gcc-14.2.0
arm                   randconfig-004-20250118    gcc-14.2.0
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250118    clang-17
arm64                 randconfig-002-20250118    gcc-14.2.0
arm64                 randconfig-003-20250118    clang-20
arm64                 randconfig-004-20250118    clang-15
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250118    gcc-14.2.0
csky                  randconfig-002-20250118    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250118    clang-20
hexagon               randconfig-002-20250118    clang-20
i386        buildonly-randconfig-001-20250118    gcc-12
i386        buildonly-randconfig-002-20250118    clang-19
i386        buildonly-randconfig-003-20250118    clang-19
i386        buildonly-randconfig-004-20250118    gcc-11
i386        buildonly-randconfig-005-20250118    clang-19
i386        buildonly-randconfig-006-20250118    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250118    gcc-14.2.0
loongarch             randconfig-002-20250118    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250118    gcc-14.2.0
nios2                 randconfig-002-20250118    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250118    gcc-14.2.0
parisc                randconfig-002-20250118    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250118    clang-15
powerpc               randconfig-002-20250118    clang-20
powerpc               randconfig-003-20250118    clang-20
powerpc64             randconfig-001-20250118    clang-17
powerpc64             randconfig-002-20250118    clang-19
powerpc64             randconfig-003-20250118    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250118    gcc-14.2.0
riscv                 randconfig-002-20250118    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250118    clang-20
s390                  randconfig-002-20250118    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250118    gcc-14.2.0
sh                    randconfig-002-20250118    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250118    gcc-14.2.0
sparc                 randconfig-002-20250118    gcc-14.2.0
sparc64               randconfig-001-20250118    gcc-14.2.0
sparc64               randconfig-002-20250118    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20250118    clang-17
um                    randconfig-002-20250118    clang-15
x86_64      buildonly-randconfig-001-20250118    clang-19
x86_64      buildonly-randconfig-002-20250118    gcc-12
x86_64      buildonly-randconfig-003-20250118    clang-19
x86_64      buildonly-randconfig-004-20250118    gcc-12
x86_64      buildonly-randconfig-005-20250118    clang-19
x86_64      buildonly-randconfig-006-20250118    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250118    gcc-14.2.0
xtensa                randconfig-002-20250118    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
