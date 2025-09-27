Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFB9CAC5B8
	for <intel-xe@archiver.kernel.org>; Sat, 27 Sep 2025 14:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B444910E1B3;
	Sat, 27 Sep 2025 14:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6NBMGn+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C75B10E1B3
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Sep 2025 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758983056; x=1790519056;
 h=date:from:to:cc:subject:message-id;
 bh=pccrq6IotU0r/I0C8IHijoBvHvhQVcepwHjMUhAyDOc=;
 b=a6NBMGn+CNAlVIWZXSoC2179+DurgjoBub3gM752hep9RjOUmLA7V+rA
 zmJ1O4BqesnVZMS0sZDrS1cnPn5I1PxHEmeUqglbgoCemRmefqWcPbTDv
 XTcis9+yr7Kos2If6ZGZadi0/XQHsArR7Cji2v3BVgw1LSKoQzZedhxNf
 S+Wcr/GtvXEzMxne8nlALB2jzTKgVTHRNet1RSJlS+mBUHpqidj0VTbIt
 fDdTRvt3zNMg4cPY7oLTPC/XzN+TUqX26s0Mw9riBT2Q8+IT0ZfHKMVWd
 w5g3SwvahkFgDd5IZi1LUk1Sr62YO+H0RzCvnJPur3I7oR/jlQzF8CkSZ A==;
X-CSE-ConnectionGUID: 8mlxqjVSQEmARB6wIfIxGQ==
X-CSE-MsgGUID: sTOvujCgQKCtHJA0oBJPuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="78936205"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; d="scan'208";a="78936205"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 07:24:15 -0700
X-CSE-ConnectionGUID: xA1Z15pYTqGT4+4ugbH+Mg==
X-CSE-MsgGUID: 7kB+Ekp6TV2V6kZQGUaV3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; d="scan'208";a="182246122"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
 by fmviesa005.fm.intel.com with ESMTP; 27 Sep 2025 07:24:14 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v2VqO-00076z-0P;
 Sat, 27 Sep 2025 14:24:12 +0000
Date: Sat, 27 Sep 2025 22:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 662d98b8b373007fa1b08ba93fee11f6fd3e387c
Message-ID: <202509272240.GBrGjwGp-lkp@intel.com>
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
branch HEAD: 662d98b8b373007fa1b08ba93fee11f6fd3e387c  drm/xe/hw_engine_group: Fix double write lock release in error path

elapsed time: 1462m

configs tested: 109
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250926    gcc-8.5.0
arc                   randconfig-002-20250926    gcc-9.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                            mps2_defconfig    clang-22
arm                             mxs_defconfig    clang-22
arm                   randconfig-001-20250926    clang-22
arm                   randconfig-002-20250926    clang-17
arm                   randconfig-003-20250926    clang-22
arm                   randconfig-004-20250926    clang-22
arm                        vexpress_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250926    gcc-8.5.0
arm64                 randconfig-002-20250926    gcc-12.5.0
arm64                 randconfig-003-20250926    gcc-9.5.0
arm64                 randconfig-004-20250926    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250926    gcc-15.1.0
csky                  randconfig-002-20250926    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250926    clang-22
hexagon               randconfig-002-20250926    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20250926    clang-20
i386        buildonly-randconfig-002-20250926    clang-20
i386        buildonly-randconfig-003-20250926    clang-20
i386        buildonly-randconfig-004-20250926    clang-20
i386        buildonly-randconfig-005-20250926    clang-20
i386        buildonly-randconfig-006-20250926    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250926    gcc-15.1.0
loongarch             randconfig-002-20250926    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250926    gcc-11.5.0
nios2                 randconfig-002-20250926    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250926    gcc-10.5.0
parisc                randconfig-002-20250926    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      ep88xc_defconfig    gcc-15.1.0
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc               randconfig-001-20250926    clang-22
powerpc               randconfig-002-20250926    clang-18
powerpc               randconfig-003-20250926    clang-22
powerpc                     tqm8555_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250926    clang-22
powerpc64             randconfig-002-20250926    clang-16
powerpc64             randconfig-003-20250926    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv             nommu_k210_sdcard_defconfig    gcc-15.1.0
riscv                 randconfig-001-20250926    clang-22
riscv                 randconfig-002-20250926    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250926    clang-22
s390                  randconfig-002-20250926    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250926    gcc-12.5.0
sh                    randconfig-002-20250926    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250926    gcc-14.3.0
sparc                 randconfig-002-20250926    gcc-15.1.0
sparc64               randconfig-001-20250926    gcc-12.5.0
sparc64               randconfig-002-20250926    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20250926    clang-22
um                    randconfig-002-20250926    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20250926    clang-20
x86_64      buildonly-randconfig-002-20250926    clang-20
x86_64      buildonly-randconfig-003-20250926    gcc-14
x86_64      buildonly-randconfig-004-20250926    gcc-14
x86_64      buildonly-randconfig-005-20250926    gcc-14
x86_64      buildonly-randconfig-006-20250926    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250926    gcc-14.3.0
xtensa                randconfig-002-20250926    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
