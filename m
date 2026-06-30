Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEC0C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 13:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F0410E1F3;
	Tue, 30 Jun 2026 13:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zxhk7qGk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA7E10E1F3
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 13:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782826533; x=1814362533;
 h=date:from:to:cc:subject:message-id;
 bh=zZzOlP45WRo74Grigzp24Cb2rkm6QYmj40okpdB+lHs=;
 b=Zxhk7qGkGOAOaWndslMwypBcyUx2hrxE+TgGd9IcdHxJICOKMjduFgT8
 S+b+4eoO+kHKLX1UtjCGrChfdjFRity35Kwi+wtxCco6O6mNpVAQjN7ok
 l76EghoQXWV22NOKav5xMHgnlb6oZrmxwUI7n8WRqLCZ86ieXpjqo+t45
 0ZIgtqAu/hKCQ17n7TKWw4QsN56SBzreCiv0BhXOVo4+quHhayo40KDhx
 CkG8q+F26KRXUqK+vd8ILDQmruCXM3n1WVgSLTzPXznPv/qSJU32LdRff
 tNs3zlJXfic95kZA3ev/BN/j6FgDju5n1oex3RgaX8IvDIo6p3JFNVg38 g==;
X-CSE-ConnectionGUID: fJIbS7+GRsqGeisPaGiEFA==
X-CSE-MsgGUID: Tcot6/+GRwm2isIq/lyVBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94193196"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="94193196"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:35:33 -0700
X-CSE-ConnectionGUID: M1c1cCC4R4ipSwUXRqrLlw==
X-CSE-MsgGUID: 8XiZLSjwTD2TlZOoKNw8og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="245923615"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
 by fmviesa009.fm.intel.com with ESMTP; 30 Jun 2026 06:35:31 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1weYcM-000000008NC-0OXP;
 Tue, 30 Jun 2026 13:35:28 +0000
Date: Tue, 30 Jun 2026 21:34:47 +0800
From: kernel test robot <lkp@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 e459a3bdeb117be496d7f229e2ea1f6c9fe4080b
Message-ID: <202606302137.icQmFOtw-lkp@intel.com>
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
branch HEAD: e459a3bdeb117be496d7f229e2ea1f6c9fe4080b  drm/xe/hw_engine: Fix double-free of managed BO in error path

elapsed time: 847m

configs tested: 108
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    gcc-16.1.0
arc                   randconfig-001-20260630    gcc-12.5.0
arc                   randconfig-002-20260630    gcc-10.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                   randconfig-001-20260630    clang-23
arm                   randconfig-002-20260630    clang-23
arm                   randconfig-003-20260630    gcc-8.5.0
arm                   randconfig-004-20260630    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
hexagon                          allmodconfig    clang-23
hexagon                           allnoconfig    clang-23
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386                  randconfig-011-20260630    gcc-14
i386                  randconfig-013-20260630    gcc-12
i386                  randconfig-015-20260630    gcc-14
i386                  randconfig-016-20260630    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-20
loongarch                           defconfig    clang-23
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                        bcm47xx_defconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    gcc-16.1.0
parisc                randconfig-001-20260630    gcc-13.4.0
parisc                randconfig-002-20260630    gcc-15.2.0
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    gcc-16.1.0
powerpc               randconfig-001-20260630    clang-23
powerpc               randconfig-002-20260630    clang-22
powerpc64             randconfig-001-20260630    clang-23
powerpc64             randconfig-002-20260630    gcc-14.3.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                  randconfig-001-20260630    gcc-9.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-16.1.0
sparc                             allnoconfig    gcc-16.1.0
sparc                 randconfig-001-20260630    gcc-8.5.0
sparc                 randconfig-002-20260630    gcc-13.4.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
sparc64               randconfig-001-20260630    gcc-11.5.0
sparc64               randconfig-002-20260630    gcc-8.5.0
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260630    clang-16
um                    randconfig-002-20260630    clang-17
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260630    clang-22
x86_64      buildonly-randconfig-002-20260630    gcc-14
x86_64      buildonly-randconfig-003-20260630    clang-22
x86_64      buildonly-randconfig-004-20260630    clang-22
x86_64      buildonly-randconfig-005-20260630    clang-22
x86_64      buildonly-randconfig-006-20260630    clang-22
x86_64                              defconfig    gcc-14
x86_64                         randconfig-071    gcc-14
x86_64                randconfig-071-20260630    gcc-14
x86_64                         randconfig-072    gcc-14
x86_64                randconfig-072-20260630    gcc-14
x86_64                         randconfig-073    clang-22
x86_64                randconfig-073-20260630    clang-22
x86_64                         randconfig-074    gcc-14
x86_64                randconfig-074-20260630    clang-22
x86_64                         randconfig-075    gcc-13
x86_64                randconfig-075-20260630    gcc-14
x86_64                         randconfig-076    clang-22
x86_64                randconfig-076-20260630    clang-22
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    gcc-16.1.0
xtensa                randconfig-001-20260630    gcc-15.2.0
xtensa                randconfig-002-20260630    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
