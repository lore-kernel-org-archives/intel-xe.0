Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C346C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 13:20:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C7A10E7EE;
	Thu, 25 Jul 2024 13:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MktKg3tE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3551A10E7EE
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 13:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721913608; x=1753449608;
 h=date:from:to:cc:subject:message-id;
 bh=q/UqmjD0DJaF1mGib48ts9UqK2hUYZtUVDzvB0ZIBkE=;
 b=MktKg3tEhH6zNupdZNsKUkYgM0ly3tjxARc1AOMGvmUBpa2J/jX5rCz9
 fA2H9rx5jEg2UZ7Ge7D+44vfMZqLryOrrgwXe5SId0SptTyv0AP+Dm/9b
 VZnBDN8jL2Tm98klsnz5SrUKB7+lJ4Q9ZWh9f96b780r6Y+sb1Z5CeZtI
 Fc740lnEankNWy0v5Z3zYi4KQkUO71Ua8tao2yR0FZOL16VXe3hK+oujL
 AHY3wKQyBLPuAA/V+h/IAgVtH1OPG5VUk06IeLWYNeW7MAtrYBJVf4nSu
 XjW2l0MnLzuQ4RaeVUv1C5PucGPnyuQPvRmjUrhP39ATXe1mInie50reM Q==;
X-CSE-ConnectionGUID: mw7E7dw2TrSgcL7iglCtZA==
X-CSE-MsgGUID: o7T82YuuRBmoDJAxk/Z4JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19261783"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="19261783"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 06:20:08 -0700
X-CSE-ConnectionGUID: xJJYmzCHR+qt8P3r067HDw==
X-CSE-MsgGUID: 1/dBaoysRL6MuYWEj5ed8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="52614258"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 25 Jul 2024 06:20:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sWyO4-000o8e-34;
 Thu, 25 Jul 2024 13:20:04 +0000
Date: Thu, 25 Jul 2024 21:19:25 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 1a394b4f504f33eac8c38b6f42ba025105c7e869
Message-ID: <202407252122.QmBqB4z3-lkp@intel.com>
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
branch HEAD: 1a394b4f504f33eac8c38b6f42ba025105c7e869  drm/xe: Fix possible UAF in guc_exec_queue_process_msg

elapsed time: 935m

configs tested: 115
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240725   gcc-13.2.0
arc                   randconfig-002-20240725   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-14.1.0
arm                     davinci_all_defconfig   clang-20
arm                   randconfig-001-20240725   clang-19
arm                   randconfig-002-20240725   clang-19
arm                   randconfig-003-20240725   clang-17
arm                   randconfig-004-20240725   clang-19
arm                         socfpga_defconfig   gcc-14.1.0
arm                        spear3xx_defconfig   clang-16
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240725   clang-19
arm64                 randconfig-002-20240725   clang-19
arm64                 randconfig-003-20240725   gcc-14.1.0
arm64                 randconfig-004-20240725   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240725   gcc-14.1.0
csky                  randconfig-002-20240725   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240725   clang-19
hexagon               randconfig-002-20240725   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240725   gcc-13
i386         buildonly-randconfig-002-20240725   gcc-8
i386         buildonly-randconfig-003-20240725   gcc-13
i386         buildonly-randconfig-004-20240725   gcc-8
i386         buildonly-randconfig-005-20240725   gcc-13
i386         buildonly-randconfig-006-20240725   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240725   gcc-13
i386                  randconfig-002-20240725   gcc-13
i386                  randconfig-003-20240725   gcc-13
i386                  randconfig-004-20240725   gcc-8
i386                  randconfig-005-20240725   clang-18
i386                  randconfig-006-20240725   clang-18
i386                  randconfig-011-20240725   clang-18
i386                  randconfig-012-20240725   gcc-13
i386                  randconfig-013-20240725   clang-18
i386                  randconfig-014-20240725   gcc-13
i386                  randconfig-015-20240725   clang-18
i386                  randconfig-016-20240725   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240725   gcc-14.1.0
loongarch             randconfig-002-20240725   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          hp300_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                            gpr_defconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240725   gcc-14.1.0
nios2                 randconfig-002-20240725   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                randconfig-001-20240725   gcc-14.1.0
parisc                randconfig-002-20240725   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc               randconfig-001-20240725   clang-20
powerpc               randconfig-002-20240725   clang-20
powerpc               randconfig-003-20240725   gcc-14.1.0
powerpc64             randconfig-001-20240725   gcc-14.1.0
powerpc64             randconfig-002-20240725   gcc-14.1.0
powerpc64             randconfig-003-20240725   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                 randconfig-001-20240725   gcc-14.1.0
riscv                 randconfig-002-20240725   gcc-14.1.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                  randconfig-001-20240725   clang-20
s390                  randconfig-002-20240725   clang-15
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                    randconfig-001-20240725   gcc-14.1.0
sh                    randconfig-002-20240725   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64               randconfig-001-20240725   gcc-14.1.0
sparc64               randconfig-002-20240725   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                    randconfig-001-20240725   gcc-12
um                    randconfig-002-20240725   clang-20
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240725   gcc-14.1.0
xtensa                randconfig-002-20240725   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
