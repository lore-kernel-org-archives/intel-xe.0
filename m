Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BCFF3ED7B
	for <intel-xe@archiver.kernel.org>; Sun, 12 Apr 2026 06:22:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5245910E09D;
	Sun, 12 Apr 2026 06:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TtlQ1XRJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16BD10E09D
 for <intel-xe@lists.freedesktop.org>; Sun, 12 Apr 2026 06:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775974952; x=1807510952;
 h=date:from:to:cc:subject:message-id;
 bh=oagKCDKGW5Br+D2qlCEnw+4zkIZyIzwVl8GfShx64EA=;
 b=TtlQ1XRJodOcMKy2NM2MuAuWCpyM4olZP1twQx3Xy0++WfW71iGMrYB9
 iSSl/BDxhdjLEyCDC+hT20hF16t03xnIEs2LlwMF5BSIa/y9uDs6Og79m
 MvadwJMkXubfVZfW7UZ0StRqRbyIv3/RpU+BYJbztujPkAEJHE1TIxhyw
 qTvwsp8WorbNAEmKMWAgRZHYlLz6HXe0VMCE2YHaMQed180C6xIZldwam
 YcVtvNc0FlZX79vejwJoNypm6S0KDO+CbenjjYXfu7ItgOLiXKIU94/Es
 yydhAVQtGzCJXcBr+IN7o2Ec9RcgvMOF9tXx+SRX0bsHSO6KCzQJ6ip7u A==;
X-CSE-ConnectionGUID: IyBvBI6xTMSUmzbjV5VqJA==
X-CSE-MsgGUID: gVQJfK38RkyZID7BRfZn9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="77053906"
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; d="scan'208";a="77053906"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2026 23:22:31 -0700
X-CSE-ConnectionGUID: mZK2zfVuSWuIAnEouwzL/w==
X-CSE-MsgGUID: FE9kwVL2R62uFmaKRX9OUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; d="scan'208";a="234472087"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 11 Apr 2026 23:22:29 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wBoDD-000000001xL-1Vt3;
 Sun, 12 Apr 2026 06:22:27 +0000
Date: Sun, 12 Apr 2026 14:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 4d33314decfeac8b82d771a1bd083a59f4ac6fae
Message-ID: <202604121411.vyWipC4R-lkp@intel.com>
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
branch HEAD: 4d33314decfeac8b82d771a1bd083a59f4ac6fae  drm/xe/guc: Add support for NO_RESPONSE_BUSY in CTB

elapsed time: 731m

configs tested: 236
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260412    gcc-11.5.0
arc                   randconfig-002-20260412    gcc-10.5.0
arc                   randconfig-002-20260412    gcc-11.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260412    clang-23
arm                   randconfig-001-20260412    gcc-11.5.0
arm                   randconfig-002-20260412    gcc-11.5.0
arm                   randconfig-002-20260412    gcc-14.3.0
arm                   randconfig-003-20260412    gcc-10.5.0
arm                   randconfig-003-20260412    gcc-11.5.0
arm                   randconfig-004-20260412    gcc-11.5.0
arm                        spear3xx_defconfig    clang-17
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260412    clang-19
arm64                 randconfig-002-20260412    clang-19
arm64                 randconfig-002-20260412    gcc-8.5.0
arm64                 randconfig-003-20260412    clang-18
arm64                 randconfig-003-20260412    clang-19
arm64                 randconfig-004-20260412    clang-19
arm64                 randconfig-004-20260412    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260412    clang-19
csky                  randconfig-001-20260412    gcc-15.2.0
csky                  randconfig-002-20260412    clang-19
csky                  randconfig-002-20260412    gcc-14.3.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260412    clang-23
hexagon               randconfig-002-20260412    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260412    gcc-14
i386        buildonly-randconfig-002-20260412    clang-20
i386        buildonly-randconfig-002-20260412    gcc-14
i386        buildonly-randconfig-003-20260412    gcc-14
i386        buildonly-randconfig-004-20260412    gcc-14
i386        buildonly-randconfig-005-20260412    gcc-14
i386        buildonly-randconfig-006-20260412    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260412    clang-20
i386                  randconfig-002-20260412    clang-20
i386                  randconfig-003-20260412    clang-20
i386                  randconfig-004-20260412    clang-20
i386                  randconfig-005-20260412    clang-20
i386                  randconfig-006-20260412    clang-20
i386                  randconfig-007-20260412    clang-20
i386                  randconfig-011-20260412    gcc-14
i386                  randconfig-012-20260412    clang-20
i386                  randconfig-012-20260412    gcc-14
i386                  randconfig-013-20260412    clang-20
i386                  randconfig-013-20260412    gcc-14
i386                  randconfig-014-20260412    clang-20
i386                  randconfig-014-20260412    gcc-14
i386                  randconfig-015-20260412    clang-20
i386                  randconfig-015-20260412    gcc-14
i386                  randconfig-016-20260412    clang-20
i386                  randconfig-016-20260412    gcc-14
i386                  randconfig-017-20260412    clang-20
i386                  randconfig-017-20260412    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260412    clang-23
loongarch             randconfig-002-20260412    clang-23
loongarch             randconfig-002-20260412    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                         db1xxx_defconfig    clang-23
mips                      loongson3_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260412    clang-23
nios2                 randconfig-001-20260412    gcc-11.5.0
nios2                 randconfig-002-20260412    clang-23
nios2                 randconfig-002-20260412    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260412    gcc-10.5.0
parisc                randconfig-001-20260412    gcc-15.2.0
parisc                randconfig-002-20260412    gcc-15.2.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260412    gcc-12.5.0
powerpc               randconfig-001-20260412    gcc-15.2.0
powerpc               randconfig-002-20260412    gcc-12.5.0
powerpc               randconfig-002-20260412    gcc-15.2.0
powerpc64             randconfig-001-20260412    clang-23
powerpc64             randconfig-001-20260412    gcc-15.2.0
powerpc64             randconfig-002-20260412    clang-23
powerpc64             randconfig-002-20260412    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260412    clang-23
riscv                 randconfig-001-20260412    gcc-15.2.0
riscv                 randconfig-002-20260412    clang-23
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260412    clang-23
s390                  randconfig-001-20260412    gcc-15.2.0
s390                  randconfig-002-20260412    clang-23
s390                  randconfig-002-20260412    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                 kfr2r09-romimage_defconfig    gcc-15.2.0
sh                    randconfig-001-20260412    clang-23
sh                    randconfig-001-20260412    gcc-15.2.0
sh                    randconfig-002-20260412    clang-23
sh                    randconfig-002-20260412    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260412    clang-23
sparc                 randconfig-002-20260412    clang-23
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260412    clang-23
sparc64               randconfig-002-20260412    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260412    clang-23
um                    randconfig-002-20260412    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260412    clang-20
x86_64      buildonly-randconfig-001-20260412    gcc-12
x86_64      buildonly-randconfig-002-20260412    clang-20
x86_64      buildonly-randconfig-002-20260412    gcc-14
x86_64      buildonly-randconfig-003-20260412    clang-20
x86_64      buildonly-randconfig-003-20260412    gcc-12
x86_64      buildonly-randconfig-004-20260412    clang-20
x86_64      buildonly-randconfig-004-20260412    gcc-14
x86_64      buildonly-randconfig-005-20260412    clang-20
x86_64      buildonly-randconfig-005-20260412    gcc-14
x86_64      buildonly-randconfig-006-20260412    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260412    clang-20
x86_64                randconfig-002-20260412    clang-20
x86_64                randconfig-003-20260412    clang-20
x86_64                randconfig-004-20260412    clang-20
x86_64                randconfig-005-20260412    clang-20
x86_64                randconfig-006-20260412    clang-20
x86_64                randconfig-011-20260412    gcc-14
x86_64                randconfig-012-20260412    gcc-14
x86_64                randconfig-013-20260412    gcc-14
x86_64                randconfig-014-20260412    gcc-14
x86_64                randconfig-015-20260412    gcc-14
x86_64                randconfig-016-20260412    gcc-14
x86_64                randconfig-071-20260412    clang-20
x86_64                randconfig-072-20260412    clang-20
x86_64                randconfig-073-20260412    clang-20
x86_64                randconfig-074-20260412    clang-20
x86_64                randconfig-075-20260412    clang-20
x86_64                randconfig-076-20260412    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260412    clang-23
xtensa                randconfig-002-20260412    clang-23

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
