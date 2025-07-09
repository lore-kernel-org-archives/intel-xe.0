Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09533C83F10
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 22:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F5710E125;
	Wed,  9 Jul 2025 22:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0HYdg9W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DB310E125
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 22:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752100530; x=1783636530;
 h=date:from:to:cc:subject:message-id;
 bh=Yc2kiXlw8KULPgZQBeo5cX8ZQvVtXudsXpFWVdafZOQ=;
 b=I0HYdg9WL51SuhTE3uHpeRgQyRkJM2nhA2FBBPN88xlOXZEd/HerQ0hk
 DaQy90ABlZhiwFv+HrI80f0F9r36XuTMe4SPEdl/tcDtCgWFDkmNoxWQm
 1Iyoj0Jrja/62Qm1Rr7nBeiyXwCpKlCIv16v7cTGQkdX41NYM3WLvIQgt
 zP5L3MHt7uDB5WQfstT6NwEjrivPmcEujCMouFVfzqlEySsyXZQBd5Ito
 O2RvdwxTZAgYglPw+54WobaGLjyys5g+Lf/5MaAvd87UCkyqJ1LiuGJlX
 WMPXLAFiG+1kAhoNB9JdJdLZn1Q6nTefFy2DyEYESMQiOInkdlQhfs2W3 Q==;
X-CSE-ConnectionGUID: abgy3b+uSl6EGRpJ0g/okA==
X-CSE-MsgGUID: +ZMILRKNRmSrlyY3uUC+fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65724039"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="65724039"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 15:35:30 -0700
X-CSE-ConnectionGUID: gvKmyxirRPi3UYPq6wPK9g==
X-CSE-MsgGUID: XcajMYhLSJK+usWFKIOqsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="156454553"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 09 Jul 2025 15:35:29 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uZdNu-00048t-2u;
 Wed, 09 Jul 2025 22:35:26 +0000
Date: Thu, 10 Jul 2025 06:34:37 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 017ef1228d735965419ff118fe1b89089e772c42
Message-ID: <202507100625.qoG4q0WD-lkp@intel.com>
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
branch HEAD: 017ef1228d735965419ff118fe1b89089e772c42  drm/xe: Release runtime pm for error path of xe_devcoredump_read()

elapsed time: 1456m

configs tested: 96
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250709    gcc-8.5.0
arc                   randconfig-002-20250709    gcc-11.5.0
arm                               allnoconfig    clang-21
arm                   randconfig-001-20250709    gcc-12.4.0
arm                   randconfig-002-20250709    gcc-10.5.0
arm                   randconfig-003-20250709    clang-21
arm                   randconfig-004-20250709    clang-21
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250709    clang-21
arm64                 randconfig-002-20250709    gcc-15.1.0
arm64                 randconfig-003-20250709    clang-21
arm64                 randconfig-004-20250709    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250709    gcc-15.1.0
csky                  randconfig-002-20250709    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250709    clang-19
hexagon               randconfig-002-20250709    clang-21
i386        buildonly-randconfig-001-20250709    gcc-12
i386        buildonly-randconfig-002-20250709    clang-20
i386        buildonly-randconfig-003-20250709    clang-20
i386        buildonly-randconfig-004-20250709    clang-20
i386        buildonly-randconfig-005-20250709    gcc-12
i386        buildonly-randconfig-006-20250709    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250709    gcc-15.1.0
loongarch             randconfig-002-20250709    gcc-12.4.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250709    gcc-14.2.0
nios2                 randconfig-002-20250709    gcc-14.2.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250709    gcc-15.1.0
parisc                randconfig-002-20250709    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20250709    gcc-8.5.0
powerpc               randconfig-002-20250709    clang-21
powerpc               randconfig-003-20250709    clang-21
powerpc64             randconfig-001-20250709    gcc-10.5.0
powerpc64             randconfig-002-20250709    gcc-10.5.0
powerpc64             randconfig-003-20250709    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250709    gcc-10.5.0
riscv                 randconfig-002-20250709    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250709    clang-17
s390                  randconfig-002-20250709    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250709    gcc-10.5.0
sh                    randconfig-002-20250709    gcc-14.3.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250709    gcc-15.1.0
sparc                 randconfig-002-20250709    gcc-10.3.0
sparc64               randconfig-001-20250709    clang-21
sparc64               randconfig-002-20250709    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250709    clang-17
um                    randconfig-002-20250709    gcc-12
x86_64      buildonly-randconfig-001-20250709    gcc-12
x86_64      buildonly-randconfig-002-20250709    clang-20
x86_64      buildonly-randconfig-003-20250709    gcc-12
x86_64      buildonly-randconfig-004-20250709    gcc-12
x86_64      buildonly-randconfig-005-20250709    clang-20
x86_64      buildonly-randconfig-006-20250709    gcc-12
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250709    gcc-8.5.0
xtensa                randconfig-002-20250709    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
