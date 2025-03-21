Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D345C36002
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 17:49:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72F210E7FD;
	Fri, 21 Mar 2025 17:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CV7l5fEt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC0810E7FD
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Mar 2025 17:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742579372; x=1774115372;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=18GztC3Rp7AiuWcHmws0TzgyyAJ5MrP0DwFQ7umiouM=;
 b=CV7l5fEtknNjkPzj78e8VzCCfocPIdXNrp7/aiGtyKfUGBKA8JktgtDx
 MQ88la0MSyHPFRBryI1nDqQ6iiB0E/Yp2UJEF7dIkWnt4DziA7EMZF6/9
 4+wu+Ed3KtpWO04tvq/w00dP6JENQA0Iw1EofnTIZXX8d+pqVHjSRCegK
 +O2lo3vOWvCEZ2u/1OB16GZZQqhGTsXlrM67u8OGnNKmirSulQkhuY6Wr
 /EJEqu18aODF54/DwYKDSvERGyYF9JTh0ZLDW4U9x00SRdorrt916eL4X
 473Oz742oupXbdxBA8ufpZpnZmUThvDTAvlARfUw6YbfFkVWH0QBw9pza A==;
X-CSE-ConnectionGUID: xhy1052cQumoOOjQqj8GFA==
X-CSE-MsgGUID: xDXRIizZT6mVp4Uw39tyqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43018469"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="43018469"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 10:49:14 -0700
X-CSE-ConnectionGUID: g9rKkXPSSG+BN7jLVslreg==
X-CSE-MsgGUID: gQAXe2XfT+Kxp61WpYEBdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="154466754"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
 by fmviesa001.fm.intel.com with ESMTP; 21 Mar 2025 10:49:12 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tvgUY-0001Ys-1K;
 Fri, 21 Mar 2025 17:49:10 +0000
Date: Sat, 22 Mar 2025 01:49:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 50af7cab7520e46680cf4633bba6801443b75856
Message-ID: <202503220154.Bek7hNsV-lkp@intel.com>
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
branch HEAD: 50af7cab7520e46680cf4633bba6801443b75856  drm/xe: Fix exporting xe buffers multiple times

elapsed time: 1445m

configs tested: 82
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                           allyesconfig    gcc-14.2.0
arc                             allmodconfig    gcc-14.2.0
arc                             allyesconfig    gcc-14.2.0
arc                  randconfig-001-20250321    gcc-13.3.0
arc                  randconfig-002-20250321    gcc-11.5.0
arm                             allmodconfig    gcc-14.2.0
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250321    clang-19
arm                  randconfig-002-20250321    gcc-9.3.0
arm                  randconfig-003-20250321    gcc-5.5.0
arm                  randconfig-004-20250321    clang-21
arm64                           allmodconfig    clang-19
arm64                randconfig-001-20250321    gcc-5.5.0
arm64                randconfig-002-20250321    gcc-5.5.0
arm64                randconfig-003-20250321    clang-20
arm64                randconfig-004-20250321    clang-21
csky                 randconfig-001-20250321    gcc-13.3.0
csky                 randconfig-002-20250321    gcc-13.3.0
hexagon                         allmodconfig    clang-17
hexagon                         allyesconfig    clang-21
hexagon              randconfig-001-20250321    clang-21
hexagon              randconfig-002-20250321    clang-16
i386                            allmodconfig    gcc-12
i386                             allnoconfig    gcc-12
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250321    clang-20
i386       buildonly-randconfig-002-20250321    clang-20
i386       buildonly-randconfig-003-20250321    clang-20
i386       buildonly-randconfig-004-20250321    clang-20
i386       buildonly-randconfig-005-20250321    clang-20
i386       buildonly-randconfig-006-20250321    clang-20
i386                               defconfig    clang-20
loongarch                       allmodconfig    gcc-14.2.0
loongarch            randconfig-001-20250321    gcc-14.2.0
loongarch            randconfig-002-20250321    gcc-14.2.0
m68k                            allyesconfig    gcc-14.2.0
nios2                randconfig-001-20250321    gcc-13.3.0
nios2                randconfig-002-20250321    gcc-7.5.0
openrisc                        allyesconfig    gcc-14.2.0
parisc                          allmodconfig    gcc-14.2.0
parisc                          allyesconfig    gcc-14.2.0
parisc               randconfig-001-20250321    gcc-8.5.0
parisc               randconfig-002-20250321    gcc-6.5.0
powerpc                         allyesconfig    clang-21
powerpc              randconfig-001-20250321    clang-21
powerpc              randconfig-002-20250321    gcc-7.5.0
powerpc              randconfig-003-20250321    gcc-7.5.0
powerpc64            randconfig-001-20250321    gcc-5.5.0
powerpc64            randconfig-002-20250321    clang-16
powerpc64            randconfig-003-20250321    gcc-7.5.0
riscv                           allmodconfig    clang-21
riscv                           allyesconfig    clang-16
riscv                randconfig-001-20250321    clang-21
riscv                randconfig-002-20250321    clang-21
s390                            allmodconfig    clang-18
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250321    clang-16
s390                 randconfig-002-20250321    gcc-8.5.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250321    gcc-7.5.0
sh                   randconfig-002-20250321    gcc-7.5.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250321    gcc-12.4.0
sparc                randconfig-002-20250321    gcc-6.5.0
sparc64              randconfig-001-20250321    gcc-10.5.0
sparc64              randconfig-002-20250321    gcc-6.5.0
um                              allmodconfig    clang-19
um                              allyesconfig    gcc-12
um                   randconfig-001-20250321    gcc-12
um                   randconfig-002-20250321    gcc-12
x86_64                           allnoconfig    clang-20
x86_64                          allyesconfig    clang-20
x86_64     buildonly-randconfig-001-20250321    clang-20
x86_64     buildonly-randconfig-002-20250321    clang-20
x86_64     buildonly-randconfig-003-20250321    gcc-12
x86_64     buildonly-randconfig-004-20250321    clang-20
x86_64     buildonly-randconfig-005-20250321    clang-20
x86_64     buildonly-randconfig-006-20250321    clang-20
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250321    gcc-6.5.0
xtensa               randconfig-002-20250321    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
