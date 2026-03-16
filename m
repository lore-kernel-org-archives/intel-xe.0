Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419CBF4645F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 12:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FC210E4FF;
	Mon, 16 Mar 2026 12:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S4h1Go3Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7BA10E4FF
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 12:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773663661; x=1805199661;
 h=date:from:to:cc:subject:message-id;
 bh=XiGwvk61sln6g623z+AKGVZBx5Specw9mTAdp+xYX2I=;
 b=S4h1Go3QhEEyP24UPXV1NT8Agadl3d/La+wfcMEgZa5VGeJ5zbM5BK6z
 7rRCKK8/yVLRZRUvhRDX/4WRu2G0DCrRDugurlW+ljZE28/ST/RkkUl7I
 aztrZ5L4Mvu+l6zNqXHRBUlo2TUJSnIoeCSrNGdhrtuDaMEqEZJvgpzBh
 wlxe18yaQfgNOi/gaJULPER42wiL4wYZyC/xQ6eZDyEYkY8XFIsJkb/TI
 3fill5UzxFNHmC0fWCHrqRNkb8rMi/IBKfVRjcQTtPsnki0n/X/MKE23P
 a71fjgMrgI8JAgxg0vJ1wbpR3waNGRU76hjs/fqv7lyskNo8WNzPjVjHC w==;
X-CSE-ConnectionGUID: /Y5Ma3o6Qzi7doeQMtDZQw==
X-CSE-MsgGUID: 6DZs5gP4RRmfJ11H3EEq+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="73692943"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="73692943"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 05:21:00 -0700
X-CSE-ConnectionGUID: 66LLSkXLRReRJuJZ+kUoRQ==
X-CSE-MsgGUID: y0uQYvydRriKIh6pz0D6Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="226033596"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 16 Mar 2026 05:21:00 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1w26wL-000000000du-07or;
 Mon, 16 Mar 2026 12:20:57 +0000
Date: Mon, 16 Mar 2026 20:20:30 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 192cb1f5cb1694c45b7cac14519d7bad65ba22f6
Message-ID: <202603162025.7OzlKzZZ-lkp@intel.com>
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
branch HEAD: 192cb1f5cb1694c45b7cac14519d7bad65ba22f6  drm/pagemap: Enable THP support for GPU memory migration

elapsed time: 1000m

configs tested: 100
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
arc                    allmodconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc                    allyesconfig    gcc-15.2.0
arc            axs103_smp_defconfig    gcc-15.2.0
arc         randconfig-001-20260316    gcc-10.5.0
arc         randconfig-002-20260316    gcc-9.5.0
arm                     allnoconfig    clang-23
arm                    allyesconfig    gcc-15.2.0
arm         randconfig-001-20260316    clang-23
arm         randconfig-002-20260316    clang-23
arm         randconfig-003-20260316    clang-23
arm         randconfig-004-20260316    clang-23
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.2.0
arm64       randconfig-001-20260316    gcc-11.5.0
arm64       randconfig-002-20260316    clang-23
arm64       randconfig-003-20260316    clang-23
arm64       randconfig-004-20260316    clang-19
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
csky        randconfig-001-20260316    gcc-15.2.0
csky        randconfig-002-20260316    gcc-14.3.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-23
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
i386        randconfig-001-20260316    gcc-14
i386        randconfig-002-20260316    clang-20
i386        randconfig-003-20260316    gcc-14
i386        randconfig-004-20260316    gcc-14
i386        randconfig-005-20260316    clang-20
i386        randconfig-006-20260316    gcc-12
i386        randconfig-007-20260316    gcc-14
i386        randconfig-012-20260316    gcc-14
i386        randconfig-013-20260316    clang-20
i386        randconfig-014-20260316    gcc-13
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-23
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    gcc-15.2.0
m68k                      defconfig    gcc-15.2.0
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
microblaze                defconfig    gcc-15.2.0
mips                   allmodconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
parisc      randconfig-001-20260316    gcc-8.5.0
parisc      randconfig-002-20260316    gcc-12.5.0
powerpc                allmodconfig    gcc-15.2.0
powerpc                 allnoconfig    gcc-15.2.0
powerpc     randconfig-001-20260316    clang-23
powerpc     randconfig-002-20260316    clang-23
powerpc64   randconfig-001-20260316    gcc-13.4.0
powerpc64   randconfig-002-20260316    gcc-8.5.0
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
riscv                  allyesconfig    clang-16
riscv       randconfig-001-20260316    gcc-15.2.0
riscv       randconfig-002-20260316    gcc-8.5.0
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
s390        randconfig-001-20260316    clang-18
s390        randconfig-002-20260316    gcc-14.3.0
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    gcc-15.2.0
sh          randconfig-001-20260316    gcc-15.2.0
sh          randconfig-002-20260316    gcc-12.5.0
sparc                   allnoconfig    gcc-15.2.0
sparc       randconfig-001-20260316    gcc-8.5.0
sparc       randconfig-002-20260316    gcc-12.5.0
sparc64                allmodconfig    clang-23
sparc64     randconfig-001-20260316    gcc-8.5.0
sparc64     randconfig-002-20260316    gcc-15.2.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
um          randconfig-001-20260316    gcc-14
um          randconfig-002-20260316    clang-23
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.2.0
xtensa                 allyesconfig    gcc-15.2.0
xtensa      randconfig-001-20260316    gcc-15.2.0
xtensa      randconfig-002-20260316    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
