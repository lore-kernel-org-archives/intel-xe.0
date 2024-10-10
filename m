Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDE2D24456
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 22:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1BC10E9E5;
	Thu, 10 Oct 2024 22:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l680YIBE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B46B10E9E5
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 22:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728598958; x=1760134958;
 h=date:from:to:cc:subject:message-id;
 bh=tRY+zXLD0cq/Ho1LTCJwnr7NEOOkh5o9cWBYA+5fAkM=;
 b=l680YIBEVaNbOHqjGvb3xqpIhpMt/QxV0OilpbXAxsduP6tLrJTgy+3d
 jqODHF8Z2Ki4GVgj09aA1mNQMhqTAEeodqe6mByIEfRHD3NeK1NAgRGrc
 aI0w5DzW2hF38PTt2woWdFoejFUJmYZWGbmfur0rC2GoFSCIg2dZjJJKu
 0xuuLsWebWZVTKhvnudj29JdrXSjgp2zgIw/KJwjadzVr61Zit5J6StNj
 WthjrfWc8MC9P2XAV6roajJFXxwdyCOU/bJaJJ24vP8UErcnZyt1V/UbE
 w+sdrnfbosKMZhza4V4awO7BKpIlRamFaHG1GTdfjx9wUlIFnonURfj4Y w==;
X-CSE-ConnectionGUID: 3dyKOKndTHKCXmO9Gp3kmw==
X-CSE-MsgGUID: fr1wknasQHWAPnaTRuTiAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28144182"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="28144182"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 15:22:37 -0700
X-CSE-ConnectionGUID: YifMXtalRu+jyOk3xeVoTg==
X-CSE-MsgGUID: yZlRZEH4SMqlRI/8yih53A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="76343155"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 10 Oct 2024 15:22:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sz1YI-000BLp-1s;
 Thu, 10 Oct 2024 22:22:34 +0000
Date: Fri, 11 Oct 2024 06:22:28 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 1badf482816417dca71f8120b4c540cdc82aa03c
Message-ID: <202410110621.fjSGn9Bt-lkp@intel.com>
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
branch HEAD: 1badf482816417dca71f8120b4c540cdc82aa03c  drm/xe: Make wedged_mode debugfs writable

elapsed time: 1409m

configs tested: 83
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386                                defconfig    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241011    gcc-12
x86_64      buildonly-randconfig-002-20241011    gcc-12
x86_64      buildonly-randconfig-003-20241011    gcc-12
x86_64      buildonly-randconfig-004-20241011    gcc-12
x86_64      buildonly-randconfig-005-20241011    gcc-12
x86_64      buildonly-randconfig-006-20241011    gcc-12
x86_64                              defconfig    clang-18
x86_64                randconfig-001-20241011    gcc-12
x86_64                randconfig-002-20241011    gcc-12
x86_64                randconfig-003-20241011    gcc-12
x86_64                randconfig-004-20241011    gcc-12
x86_64                randconfig-005-20241011    gcc-12
x86_64                randconfig-006-20241011    gcc-12
x86_64                randconfig-011-20241011    gcc-12
x86_64                randconfig-012-20241011    gcc-12
x86_64                randconfig-013-20241011    gcc-12
x86_64                randconfig-014-20241011    gcc-12
x86_64                randconfig-015-20241011    gcc-12
x86_64                randconfig-016-20241011    gcc-12
x86_64                randconfig-071-20241011    gcc-12
x86_64                randconfig-072-20241011    gcc-12
x86_64                randconfig-073-20241011    gcc-12
x86_64                randconfig-074-20241011    gcc-12
x86_64                randconfig-075-20241011    gcc-12
x86_64                randconfig-076-20241011    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
