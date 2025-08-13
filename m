Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98023C87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 14:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4104110E739;
	Wed, 13 Aug 2025 14:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BGqYOn2G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB84B10E739
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 14:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755096719; x=1786632719;
 h=date:from:to:cc:subject:message-id;
 bh=NzTWPNgYTi6EVpNDG0NjJTjxBdl13B97RS5XBBDsuP4=;
 b=BGqYOn2GvN503CCfBx6YN9FkVKmPllEOboN3wbUXG7dU9CqIrfy3L2h8
 ThK3wWnESuyqA7aFMKx6Nr+6AaHNCP79lxA/oumr9tIw0hWPHX+v4Zlml
 Lhfcel7n4SqlTzOfbj/XgZaEO3st9ZYt7RxM6Pipp2c+N5fiii81nk5YF
 V1N/biWMAeOjOrgKC05F0uK2S7F0mtmb59+vIs+e3j7GeHx3bUrAcsAqM
 jvOd0aKDWIV8o+tPFbUfGPmstSgvBKDV+TnjISwYOSpOnNQhvEGYBLr+Z
 BYyZDJ9eWAcen+Fe2xi73geicTIXHB0sEa0EKBJbLwU4KH4Vcyct58cP+ g==;
X-CSE-ConnectionGUID: U+RVmqI5TcuOoPa0s1c4bQ==
X-CSE-MsgGUID: BzvNLI1/RM+FI8xGOAEFRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="60016140"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="60016140"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 07:51:58 -0700
X-CSE-ConnectionGUID: w8vuuF8KTtacllgaTkKL2A==
X-CSE-MsgGUID: PFYXUQ4UQFy7DXa5jscU7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="171818157"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by orviesa005.jf.intel.com with ESMTP; 13 Aug 2025 07:51:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1umCpO-000A0K-0N;
 Wed, 13 Aug 2025 14:51:51 +0000
Date: Wed, 13 Aug 2025 22:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 32a4d1b98e6663101fd0abfaf151c48feea7abb1
Message-ID: <202508132236.ITYu2Odk-lkp@intel.com>
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
branch HEAD: 32a4d1b98e6663101fd0abfaf151c48feea7abb1  drm/xe/pf: Set VF LMEM BAR size

elapsed time: 1457m

configs tested: 104
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250813    gcc-11.5.0
arc                   randconfig-002-20250813    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250813    clang-22
arm                   randconfig-002-20250813    gcc-8.5.0
arm                   randconfig-003-20250813    clang-22
arm                   randconfig-004-20250813    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250813    clang-22
arm64                 randconfig-002-20250813    gcc-12.5.0
arm64                 randconfig-003-20250813    clang-22
arm64                 randconfig-004-20250813    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250813    gcc-14.3.0
csky                  randconfig-002-20250813    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250813    clang-22
hexagon               randconfig-002-20250813    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250812    gcc-12
i386        buildonly-randconfig-002-20250812    gcc-12
i386        buildonly-randconfig-003-20250812    gcc-12
i386        buildonly-randconfig-004-20250812    clang-20
i386        buildonly-randconfig-005-20250812    clang-20
i386        buildonly-randconfig-006-20250812    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250813    clang-19
loongarch             randconfig-002-20250813    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250813    gcc-11.5.0
nios2                 randconfig-002-20250813    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250813    gcc-14.3.0
parisc                randconfig-002-20250813    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20250813    clang-18
powerpc               randconfig-002-20250813    clang-22
powerpc               randconfig-003-20250813    clang-20
powerpc64             randconfig-001-20250813    clang-22
powerpc64             randconfig-002-20250813    gcc-8.5.0
powerpc64             randconfig-003-20250813    clang-17
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250813    clang-22
riscv                 randconfig-002-20250813    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250813    clang-22
s390                  randconfig-002-20250813    clang-18
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250813    gcc-9.5.0
sh                    randconfig-002-20250813    gcc-9.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250813    gcc-8.5.0
sparc                 randconfig-002-20250813    gcc-15.1.0
sparc64               randconfig-001-20250813    gcc-8.5.0
sparc64               randconfig-002-20250813    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250813    gcc-12
um                    randconfig-002-20250813    gcc-11
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250812    clang-20
x86_64      buildonly-randconfig-002-20250812    gcc-12
x86_64      buildonly-randconfig-003-20250812    gcc-12
x86_64      buildonly-randconfig-004-20250812    gcc-12
x86_64      buildonly-randconfig-005-20250812    clang-20
x86_64      buildonly-randconfig-006-20250812    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250813    gcc-10.5.0
xtensa                randconfig-002-20250813    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
