Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E600C52D7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 05:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125C710E028;
	Thu, 15 Aug 2024 05:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="msy5CZE4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7708910E028
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 05:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723701480; x=1755237480;
 h=date:from:to:cc:subject:message-id;
 bh=Gmu3tAuePj4IlEZA44DOlzNU0OrcDq38prYStVQMZ64=;
 b=msy5CZE4rWIoR64iYvgOtS8vYA/6v8Zl/BWCMTnfAqteXzGSEZlHlv9D
 ylmX0HecatuxZtov5LXDGE/Tu59H93brMiRzpkbh+8Njbd4uw9iQd3DpO
 elVS/N6ZLtmtSKOmUGIIPTnKK+6frht5VRq/PQBxEyzZTosq0nRNWmWAF
 U0V0w5sQilrdVXEDfDXnuWBsI8mzv4XFg8mTiG0h78cAZZeZ6NxIeyaTl
 Leg5cfazEzP73xpmQdFIn5aSF09Z2sU/rlb6NylxCTmJY7nlK88QbOk/Q
 ElkHDpqBCy8G8uPZcPfYCcR5aTkcpJcD2wZfV9XXio0spW7wuOnFR7ER5 Q==;
X-CSE-ConnectionGUID: 9YVoqEW5TgeU8u8la+3cYg==
X-CSE-MsgGUID: CM6hBlmlRtKX53/znIvVzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="13022195"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; d="scan'208";a="13022195"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 22:57:59 -0700
X-CSE-ConnectionGUID: qUriF+GUSSKiAF4PS0kipg==
X-CSE-MsgGUID: f1xY9m9pSwy+8mr58iMF3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; d="scan'208";a="63917531"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 14 Aug 2024 22:57:58 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1seTUi-0003FR-0K;
 Thu, 15 Aug 2024 05:57:56 +0000
Date: Thu, 15 Aug 2024 13:57:45 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 1eda95cba9df35f1fb0fb4b89511beb6603c614e
Message-ID: <202408151343.kc6LVEXh-lkp@intel.com>
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
branch HEAD: 1eda95cba9df35f1fb0fb4b89511beb6603c614e  drm/xe: Rename enable_display module param

elapsed time: 1003m

configs tested: 131
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240815   gcc-13.2.0
arc                   randconfig-002-20240815   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                   randconfig-001-20240815   gcc-14.1.0
arm                   randconfig-002-20240815   clang-16
arm                   randconfig-003-20240815   gcc-14.1.0
arm                   randconfig-004-20240815   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240815   clang-16
arm64                 randconfig-002-20240815   clang-17
arm64                 randconfig-003-20240815   clang-20
arm64                 randconfig-004-20240815   clang-20
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240815   gcc-14.1.0
csky                  randconfig-002-20240815   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240815   clang-20
hexagon               randconfig-002-20240815   clang-20
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240815   gcc-12
i386         buildonly-randconfig-002-20240815   clang-18
i386         buildonly-randconfig-003-20240815   clang-18
i386         buildonly-randconfig-004-20240815   clang-18
i386         buildonly-randconfig-005-20240815   clang-18
i386         buildonly-randconfig-006-20240815   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240815   gcc-12
i386                  randconfig-002-20240815   clang-18
i386                  randconfig-003-20240815   clang-18
i386                  randconfig-004-20240815   gcc-12
i386                  randconfig-005-20240815   gcc-12
i386                  randconfig-006-20240815   gcc-12
i386                  randconfig-011-20240815   clang-18
i386                  randconfig-012-20240815   clang-18
i386                  randconfig-013-20240815   gcc-12
i386                  randconfig-014-20240815   clang-18
i386                  randconfig-015-20240815   clang-18
i386                  randconfig-016-20240815   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240815   gcc-14.1.0
loongarch             randconfig-002-20240815   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240815   gcc-14.1.0
nios2                 randconfig-002-20240815   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240815   gcc-14.1.0
parisc                randconfig-002-20240815   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc               randconfig-001-20240815   gcc-14.1.0
powerpc               randconfig-002-20240815   gcc-14.1.0
powerpc               randconfig-003-20240815   gcc-14.1.0
powerpc64             randconfig-001-20240815   clang-20
powerpc64             randconfig-002-20240815   gcc-14.1.0
powerpc64             randconfig-003-20240815   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                               defconfig   clang-20
riscv                 randconfig-001-20240815   gcc-14.1.0
riscv                 randconfig-002-20240815   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240815   clang-17
s390                  randconfig-002-20240815   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240815   gcc-14.1.0
sh                    randconfig-002-20240815   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240815   gcc-14.1.0
sparc64               randconfig-002-20240815   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240815   clang-16
um                    randconfig-002-20240815   gcc-12
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240815   gcc-12
x86_64       buildonly-randconfig-002-20240815   gcc-11
x86_64       buildonly-randconfig-004-20240815   gcc-12
x86_64       buildonly-randconfig-005-20240815   gcc-12
x86_64       buildonly-randconfig-006-20240815   gcc-12
x86_64                              defconfig   gcc-11
x86_64                randconfig-002-20240815   gcc-12
x86_64                randconfig-004-20240815   gcc-12
x86_64                randconfig-006-20240815   gcc-12
x86_64                randconfig-012-20240815   gcc-12
x86_64                randconfig-013-20240815   gcc-12
x86_64                randconfig-014-20240815   gcc-12
x86_64                randconfig-015-20240815   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240815   gcc-14.1.0
xtensa                randconfig-002-20240815   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
