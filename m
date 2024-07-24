Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EF2C3DA61
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 09:14:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FD810E5DF;
	Wed, 24 Jul 2024 09:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nq4Ti+tj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0903010E5F8
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 09:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721812456; x=1753348456;
 h=date:from:to:cc:subject:message-id;
 bh=kHVbVcFeeNLTRtE0PftkNEck30Uo01cQfxoSov7UtiM=;
 b=nq4Ti+tjami3ePAQjSyMrkTlbf/OHG2Pz4zwYkHzj8M6L8jQJ76dQ3+0
 oLe7Lb+DByLbY4xNxOv+GHISjhscJYKsljnKRavBCgrAySsVUoTHBvVMy
 YN10CWJTf+73PFRKBnBCsXffBGSenPzn0QV1G/Qy14BGFafUVQJPSl+/s
 kCrI2Uz/nfYCKLJ0Mwsg7Rsg/cDkAjJQ6RMo0Dam+mWDCrYb6uNbKB0Rp
 eGs3UhVmmVi8b+39GTorYUOmFUJxCFpY5y0ge7V060y0qE0lMnTyDJigC
 LAf4ol13jWid+yaOZp3ibYXuJXlcZtSuCEWJHzv/lwPA41qk17ZpvwqO/ A==;
X-CSE-ConnectionGUID: o8aAwYWeTHinzMnyUsustw==
X-CSE-MsgGUID: JIUiKD6KTkyxGGI6Hr5sNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19287890"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="19287890"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 02:14:15 -0700
X-CSE-ConnectionGUID: 1VkPuWyGT768X3OuN3M6rA==
X-CSE-MsgGUID: OxWQ+8T4RV62hwEAJ8ZsCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="56840111"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 24 Jul 2024 02:14:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sWY4Z-000mr0-29;
 Wed, 24 Jul 2024 09:14:11 +0000
Date: Wed, 24 Jul 2024 17:13:48 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 8af13c3fc1259c1b8cfc4459d3701fcf41ad74df
Message-ID: <202407241746.gYsc4UFU-lkp@intel.com>
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
branch HEAD: 8af13c3fc1259c1b8cfc4459d3701fcf41ad74df  drm/xe: Store process name and pid in xe file

elapsed time: 858m

configs tested: 103
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240724   gcc-13.2.0
arc                   randconfig-002-20240724   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-14.1.0
arm                   randconfig-001-20240724   clang-19
arm                   randconfig-002-20240724   clang-19
arm                   randconfig-003-20240724   clang-19
arm                   randconfig-004-20240724   gcc-14.1.0
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240724   gcc-14.1.0
arm64                 randconfig-002-20240724   gcc-14.1.0
arm64                 randconfig-003-20240724   gcc-14.1.0
arm64                 randconfig-004-20240724   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240724   gcc-14.1.0
csky                  randconfig-002-20240724   gcc-14.1.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240724   clang-19
hexagon               randconfig-002-20240724   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240724   clang-18
i386         buildonly-randconfig-002-20240724   gcc-9
i386         buildonly-randconfig-003-20240724   clang-18
i386         buildonly-randconfig-004-20240724   clang-18
i386         buildonly-randconfig-005-20240724   clang-18
i386         buildonly-randconfig-006-20240724   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240724   clang-18
i386                  randconfig-002-20240724   clang-18
i386                  randconfig-003-20240724   clang-18
i386                  randconfig-004-20240724   gcc-9
i386                  randconfig-005-20240724   clang-18
i386                  randconfig-006-20240724   clang-18
i386                  randconfig-011-20240724   gcc-13
i386                  randconfig-012-20240724   clang-18
i386                  randconfig-013-20240724   gcc-13
i386                  randconfig-014-20240724   gcc-8
i386                  randconfig-015-20240724   gcc-13
i386                  randconfig-016-20240724   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240724   gcc-14.1.0
loongarch             randconfig-002-20240724   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240724   gcc-14.1.0
nios2                 randconfig-002-20240724   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                randconfig-001-20240724   gcc-14.1.0
parisc                randconfig-002-20240724   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc               randconfig-001-20240724   clang-19
powerpc               randconfig-002-20240724   gcc-14.1.0
powerpc               randconfig-003-20240724   clang-19
powerpc64             randconfig-001-20240724   clang-19
powerpc64             randconfig-002-20240724   gcc-14.1.0
powerpc64             randconfig-003-20240724   clang-19
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                 randconfig-001-20240724   gcc-14.1.0
riscv                 randconfig-002-20240724   gcc-14.1.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                  randconfig-001-20240724   gcc-14.1.0
s390                  randconfig-002-20240724   clang-19
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                    randconfig-001-20240724   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
