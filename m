Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7392C87FD3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 07:45:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AB910E4DE;
	Fri,  8 Aug 2025 07:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4MZQMg6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AF310E4DE
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 07:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754639156; x=1786175156;
 h=date:from:to:cc:subject:message-id;
 bh=RxGKGpBeNp4xZqJCdNxA0x0XUNkfH1bNQCFZ2/6BLYc=;
 b=O4MZQMg6+VfkzOjfefdcPJXldLNSt18bb0bQotr5OxhE1+UlRdbgB6YH
 JgEiMB+uEN59L1zcooFcRiNRtX0FCzdgJbcTxYOngzHRKDTCsLcFsMOwV
 nijlyUU4/p7h3z3hVBpvTRlc9j5IweoHbjuj2H4ZT+PZxqlcHBqxCccmH
 q2OpyYzdnnFui5+NIqzIYsbYnNfG9ij6ErWH5Zjm2fGLZDHc3JjoGcqUN
 ipBPKmJGRWd8FymfXA3hQlbMXc3LANXxECZ8Pk25QxYao+DEWuCg7DH5x
 uARsQmlmzVWVw5qPV+rjLNN6dPxqQTrbV+kgruWL3T5mQvFy2FwcMgUoQ w==;
X-CSE-ConnectionGUID: bG30TonpSG+tmuHxfaQWVA==
X-CSE-MsgGUID: gF9bbPYYR9uvazO7M11BnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="79541558"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="79541558"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 00:45:55 -0700
X-CSE-ConnectionGUID: I+bCYUZcQhmL5q3TUE0CTA==
X-CSE-MsgGUID: fZ2zCIGWRU+5Foozj6CVDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="166059865"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by fmviesa010.fm.intel.com with ESMTP; 08 Aug 2025 00:45:54 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ukHnH-0003dq-1O;
 Fri, 08 Aug 2025 07:45:50 +0000
Date: Fri, 08 Aug 2025 15:44:45 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 9b7ca35ed28fe5fad86e9d9c24ebd1271e4c9c3e
Message-ID: <202508081539.2xepE9b8-lkp@intel.com>
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
branch HEAD: 9b7ca35ed28fe5fad86e9d9c24ebd1271e4c9c3e  drm/xe/migrate: prevent potential UAF

elapsed time: 880m

configs tested: 124
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250808    gcc-14.3.0
arc                   randconfig-002-20250808    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                          moxart_defconfig    gcc-15.1.0
arm                           omap1_defconfig    gcc-15.1.0
arm                   randconfig-001-20250808    gcc-14.3.0
arm                   randconfig-002-20250808    gcc-10.5.0
arm                   randconfig-003-20250808    clang-22
arm                   randconfig-004-20250808    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250808    clang-20
arm64                 randconfig-002-20250808    gcc-10.5.0
arm64                 randconfig-003-20250808    clang-22
arm64                 randconfig-004-20250808    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250808    gcc-15.1.0
csky                  randconfig-002-20250808    gcc-12.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250808    clang-20
hexagon               randconfig-002-20250808    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250808    clang-20
i386        buildonly-randconfig-002-20250808    clang-20
i386        buildonly-randconfig-003-20250808    gcc-12
i386        buildonly-randconfig-004-20250808    clang-20
i386        buildonly-randconfig-005-20250808    gcc-12
i386        buildonly-randconfig-006-20250808    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250808    clang-22
loongarch             randconfig-002-20250808    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       bvme6000_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250808    gcc-9.5.0
nios2                 randconfig-002-20250808    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250808    gcc-8.5.0
parisc                randconfig-002-20250808    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                     akebono_defconfig    clang-22
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250808    clang-22
powerpc               randconfig-002-20250808    clang-18
powerpc               randconfig-003-20250808    clang-22
powerpc64                        alldefconfig    clang-22
powerpc64             randconfig-001-20250808    clang-18
powerpc64             randconfig-002-20250808    clang-22
powerpc64             randconfig-003-20250808    clang-16
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250808    clang-22
riscv                 randconfig-002-20250808    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250808    gcc-10.5.0
s390                  randconfig-002-20250808    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250808    gcc-13.4.0
sh                    randconfig-002-20250808    gcc-10.5.0
sh                          rsk7264_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250808    gcc-12.5.0
sparc                 randconfig-002-20250808    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250808    clang-22
sparc64               randconfig-002-20250808    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250808    gcc-12
um                    randconfig-002-20250808    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250808    clang-20
x86_64      buildonly-randconfig-002-20250808    gcc-12
x86_64      buildonly-randconfig-003-20250808    clang-20
x86_64      buildonly-randconfig-004-20250808    clang-20
x86_64      buildonly-randconfig-005-20250808    gcc-12
x86_64      buildonly-randconfig-006-20250808    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250808    gcc-9.5.0
xtensa                randconfig-002-20250808    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
