Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5D9C5B543
	for <intel-xe@archiver.kernel.org>; Sat,  7 Jun 2025 07:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6C510E110;
	Sat,  7 Jun 2025 07:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k9jQRAA9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C13A10E110
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Jun 2025 07:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749280462; x=1780816462;
 h=date:from:to:cc:subject:message-id;
 bh=1rtD+iUA0tHZp9iYbp6UGA4nHx5H32LlnbrLnZq5ARY=;
 b=k9jQRAA9MTYIVT57dpYqwBuUE2IrRd/c56rZveT+dpSDeShNk8wk1znw
 GdL2M3Tvto3WRDDmapxT8NeTxFcxFeCu99kXRqXZz7torqUQu6NL6TTBP
 BHicBl3MzhnHyPlGPMCY3+8z4/FeQNSlwLEBU57OGwwGT2NL43nq4uL0E
 aPY44yutftKebwBe63sn/6qCp3wZsu6ThsbVMkR71IOKQxD1gfVO1sZMU
 IdimOLRkFlVCB4m6zUj0gB+vzaETotJ0FyBthQ+nFyllReTCBhzAXZf4I
 s/oh82kxKrB0+FfegRxIKe759+y5tgNTF4F9F7jZE4+gFAOYPSDhikA/m Q==;
X-CSE-ConnectionGUID: CBLb0+Y9Th+6YGpBdn0ePg==
X-CSE-MsgGUID: DmRAmvlITneKLZV29aGwag==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="61695433"
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; d="scan'208";a="61695433"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2025 00:14:21 -0700
X-CSE-ConnectionGUID: XmLYPV8PTTKAVKCdy20JBg==
X-CSE-MsgGUID: R2IglFp8Q5SEo4PUqKGJvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; d="scan'208";a="183209656"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 07 Jun 2025 00:14:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uNnku-0005Wh-2H;
 Sat, 07 Jun 2025 07:14:16 +0000
Date: Sat, 07 Jun 2025 15:13:45 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 bfb114751af9f44bc0fdd595bc09b085c81cc61f
Message-ID: <202506071536.XUcSMvCj-lkp@intel.com>
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
branch HEAD: bfb114751af9f44bc0fdd595bc09b085c81cc61f  drm/xe/topology: Stop trying to fix programming mistakes

elapsed time: 724m

configs tested: 122
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                 nsimosci_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250607    gcc-15.1.0
arc                   randconfig-002-20250607    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                         bcm2835_defconfig    clang-21
arm                       netwinder_defconfig    gcc-15.1.0
arm                   randconfig-001-20250607    clang-21
arm                   randconfig-002-20250607    gcc-13.3.0
arm                   randconfig-003-20250607    gcc-15.1.0
arm                   randconfig-004-20250607    gcc-14.3.0
arm                        spear3xx_defconfig    clang-17
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250607    clang-21
arm64                 randconfig-002-20250607    clang-21
arm64                 randconfig-003-20250607    clang-21
arm64                 randconfig-004-20250607    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250607    gcc-12.4.0
csky                  randconfig-002-20250607    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250607    clang-21
hexagon               randconfig-002-20250607    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250607    clang-20
i386        buildonly-randconfig-002-20250607    gcc-12
i386        buildonly-randconfig-003-20250607    gcc-12
i386        buildonly-randconfig-004-20250607    gcc-12
i386        buildonly-randconfig-005-20250607    clang-20
i386        buildonly-randconfig-006-20250607    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250607    gcc-13.3.0
loongarch             randconfig-002-20250607    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           mtx1_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250607    gcc-10.5.0
nios2                 randconfig-002-20250607    gcc-5.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250607    gcc-12.4.0
parisc                randconfig-002-20250607    gcc-12.4.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                   bluestone_defconfig    clang-21
powerpc               randconfig-001-20250607    gcc-10.5.0
powerpc               randconfig-002-20250607    clang-21
powerpc               randconfig-003-20250607    clang-21
powerpc                    socrates_defconfig    gcc-15.1.0
powerpc                     tqm5200_defconfig    gcc-15.1.0
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20250607    clang-19
powerpc64             randconfig-002-20250607    clang-21
powerpc64             randconfig-003-20250607    gcc-7.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250607    clang-21
riscv                 randconfig-002-20250607    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250607    clang-16
s390                  randconfig-002-20250607    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                            migor_defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250607    gcc-14.3.0
sh                    randconfig-002-20250607    gcc-9.3.0
sh                          rsk7264_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250607    gcc-10.3.0
sparc                 randconfig-002-20250607    gcc-12.4.0
sparc64               randconfig-001-20250607    gcc-9.3.0
sparc64               randconfig-002-20250607    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250607    clang-21
um                    randconfig-002-20250607    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250607    clang-20
x86_64      buildonly-randconfig-002-20250607    clang-20
x86_64      buildonly-randconfig-003-20250607    clang-20
x86_64      buildonly-randconfig-004-20250607    gcc-12
x86_64      buildonly-randconfig-005-20250607    gcc-12
x86_64      buildonly-randconfig-006-20250607    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250607    gcc-10.5.0
xtensa                randconfig-002-20250607    gcc-15.1.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
