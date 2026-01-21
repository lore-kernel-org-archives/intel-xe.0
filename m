Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5312C44508
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 23:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C09F10E8A5;
	Wed, 21 Jan 2026 23:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RLU7SBei";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DEF10E8A5
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 23:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769039121; x=1800575121;
 h=date:from:to:cc:subject:message-id;
 bh=jyDv9FiMGdLzwLTwLxE6Emr6T5obeuRBIoDTzSvNMkw=;
 b=RLU7SBeifaGJJ3SxcyYMa7JJNpjCNpaq/k5zIyaIfWEtqp3G1Vekvxtz
 ZighPS2bS1fOUQ4cLQKPn9QvOCz0B/tBhEAW0/rT+Ak0R6KL0C57TkPEz
 EiTVNx1IIJD4LxpVhodK0VnKkzm5ZxY4UugV/3JyLWcheSRrn3xXGyMS2
 jj5Ygr2urskankr4ZtbTRPbbMYpIrJPt2/1yhP9SbPq9dBCiZq+RD3CoA
 U1BKtIb3A9eQLVsTBXodoeHdCqPB7KWUVkTK3jBsEstOuXtFPIYWeeEm8
 uUQB9AxUbPJLya2TycVtt1aVPxKviGxIEunAL63i46i9X9ojKULRP9ZDD Q==;
X-CSE-ConnectionGUID: fl8yam+MRDm2GhyY7LyYCg==
X-CSE-MsgGUID: t8WfO7T9QiKnyFnxNAl+3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="57838452"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="57838452"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 15:45:21 -0800
X-CSE-ConnectionGUID: UXMrZiLYRqetExGIajBzxA==
X-CSE-MsgGUID: iugAJvAaRfKw8vXX06uOwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="211022784"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 21 Jan 2026 15:45:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vihsz-00000000SAN-2HZH;
 Wed, 21 Jan 2026 23:45:17 +0000
Date: Thu, 22 Jan 2026 07:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 9dd1048bca4fe2aa67c7a286bafb3947537adedb
Message-ID: <202601220757.TY7FSNi6-lkp@intel.com>
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
branch HEAD: 9dd1048bca4fe2aa67c7a286bafb3947537adedb  drm/xe/migrate: fix job lock assert

elapsed time: 728m

configs tested: 306
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-15.2.0
arc                   randconfig-001-20260121    gcc-8.5.0
arc                   randconfig-001-20260122    gcc-15.2.0
arc                   randconfig-002-20260121    gcc-10.5.0
arc                   randconfig-002-20260122    gcc-15.2.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                           h3600_defconfig    gcc-15.2.0
arm                        keystone_defconfig    gcc-15.2.0
arm                   randconfig-001-20260121    clang-20
arm                   randconfig-001-20260122    gcc-15.2.0
arm                   randconfig-002-20260121    gcc-15.2.0
arm                   randconfig-002-20260122    gcc-15.2.0
arm                   randconfig-003-20260121    clang-18
arm                   randconfig-003-20260122    gcc-15.2.0
arm                   randconfig-004-20260121    clang-22
arm                   randconfig-004-20260122    gcc-15.2.0
arm                         s3c6400_defconfig    gcc-15.2.0
arm                         socfpga_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260121    gcc-15.2.0
arm64                 randconfig-001-20260122    gcc-15.2.0
arm64                 randconfig-002-20260121    clang-22
arm64                 randconfig-002-20260122    gcc-15.2.0
arm64                 randconfig-003-20260121    clang-22
arm64                 randconfig-003-20260122    gcc-15.2.0
arm64                 randconfig-004-20260121    gcc-12.5.0
arm64                 randconfig-004-20260122    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260121    gcc-9.5.0
csky                  randconfig-001-20260122    gcc-15.2.0
csky                  randconfig-002-20260121    gcc-15.2.0
csky                  randconfig-002-20260122    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260121    clang-19
hexagon               randconfig-001-20260122    gcc-15.2.0
hexagon               randconfig-002-20260121    clang-22
hexagon               randconfig-002-20260122    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260121    clang-20
i386        buildonly-randconfig-001-20260122    clang-20
i386        buildonly-randconfig-002-20260121    gcc-14
i386        buildonly-randconfig-002-20260122    clang-20
i386        buildonly-randconfig-003-20260121    gcc-13
i386        buildonly-randconfig-003-20260122    clang-20
i386        buildonly-randconfig-004-20260121    clang-20
i386        buildonly-randconfig-004-20260122    clang-20
i386        buildonly-randconfig-005-20260121    clang-20
i386        buildonly-randconfig-005-20260122    clang-20
i386        buildonly-randconfig-006-20260121    clang-20
i386        buildonly-randconfig-006-20260122    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260121    gcc-14
i386                  randconfig-001-20260122    gcc-14
i386                  randconfig-002-20260121    clang-20
i386                  randconfig-002-20260122    gcc-14
i386                  randconfig-003-20260121    clang-20
i386                  randconfig-003-20260122    gcc-14
i386                  randconfig-004-20260121    clang-20
i386                  randconfig-004-20260122    gcc-14
i386                  randconfig-005-20260121    gcc-14
i386                  randconfig-005-20260122    gcc-14
i386                  randconfig-006-20260121    clang-20
i386                  randconfig-006-20260122    gcc-14
i386                  randconfig-007-20260121    clang-20
i386                  randconfig-007-20260122    gcc-14
i386                  randconfig-011-20260121    gcc-14
i386                  randconfig-011-20260122    clang-20
i386                  randconfig-012-20260121    gcc-14
i386                  randconfig-012-20260122    clang-20
i386                  randconfig-013-20260121    clang-20
i386                  randconfig-013-20260122    clang-20
i386                  randconfig-014-20260121    gcc-12
i386                  randconfig-014-20260122    clang-20
i386                  randconfig-015-20260121    gcc-14
i386                  randconfig-015-20260122    clang-20
i386                  randconfig-016-20260121    gcc-14
i386                  randconfig-016-20260122    clang-20
i386                  randconfig-017-20260121    clang-20
i386                  randconfig-017-20260122    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260121    gcc-15.2.0
loongarch             randconfig-001-20260122    gcc-15.2.0
loongarch             randconfig-002-20260121    gcc-15.2.0
loongarch             randconfig-002-20260122    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                         amcore_defconfig    gcc-15.2.0
m68k                          atari_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
m68k                       m5275evb_defconfig    gcc-15.2.0
m68k                        m5407c3_defconfig    gcc-15.2.0
m68k                       m5475evb_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                         db1xxx_defconfig    gcc-15.2.0
mips                        omega2p_defconfig    clang-22
mips                      pic32mzda_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260121    gcc-11.5.0
nios2                 randconfig-001-20260122    gcc-15.2.0
nios2                 randconfig-002-20260121    gcc-10.5.0
nios2                 randconfig-002-20260122    gcc-15.2.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260121    gcc-9.5.0
parisc                randconfig-001-20260122    gcc-10.5.0
parisc                randconfig-002-20260121    gcc-13.4.0
parisc                randconfig-002-20260122    gcc-10.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                    mvme5100_defconfig    gcc-15.2.0
powerpc                     rainier_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260121    clang-22
powerpc               randconfig-001-20260122    gcc-10.5.0
powerpc               randconfig-002-20260121    clang-22
powerpc               randconfig-002-20260122    gcc-10.5.0
powerpc                     tqm8540_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260121    clang-22
powerpc64             randconfig-001-20260122    gcc-10.5.0
powerpc64             randconfig-002-20260121    clang-22
powerpc64             randconfig-002-20260122    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv             nommu_k210_sdcard_defconfig    gcc-15.2.0
riscv                 randconfig-001-20260121    clang-16
riscv                 randconfig-001-20260122    clang-18
riscv                 randconfig-002-20260121    gcc-8.5.0
riscv                 randconfig-002-20260122    clang-18
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260121    gcc-9.5.0
s390                  randconfig-001-20260122    clang-18
s390                  randconfig-002-20260121    clang-22
s390                  randconfig-002-20260122    clang-18
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                          kfr2r09_defconfig    gcc-15.2.0
sh                    randconfig-001-20260121    gcc-14.3.0
sh                    randconfig-001-20260122    clang-18
sh                    randconfig-002-20260121    gcc-9.5.0
sh                    randconfig-002-20260122    clang-18
sh                          rsk7203_defconfig    gcc-15.2.0
sh                           se7343_defconfig    gcc-15.2.0
sh                           se7712_defconfig    gcc-15.2.0
sh                           se7721_defconfig    gcc-15.2.0
sh                           se7722_defconfig    gcc-15.2.0
sh                   sh7724_generic_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260121    gcc-8.5.0
sparc                 randconfig-001-20260122    gcc-8.5.0
sparc                 randconfig-002-20260121    gcc-8.5.0
sparc                 randconfig-002-20260122    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260121    gcc-13.4.0
sparc64               randconfig-001-20260122    gcc-8.5.0
sparc64               randconfig-002-20260121    gcc-15.2.0
sparc64               randconfig-002-20260122    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260121    gcc-14
um                    randconfig-001-20260122    gcc-8.5.0
um                    randconfig-002-20260121    gcc-14
um                    randconfig-002-20260122    gcc-8.5.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260121    clang-20
x86_64      buildonly-randconfig-001-20260122    clang-20
x86_64      buildonly-randconfig-002-20260121    gcc-14
x86_64      buildonly-randconfig-002-20260122    clang-20
x86_64      buildonly-randconfig-003-20260121    clang-20
x86_64      buildonly-randconfig-003-20260122    clang-20
x86_64      buildonly-randconfig-004-20260121    clang-20
x86_64      buildonly-randconfig-004-20260122    clang-20
x86_64      buildonly-randconfig-005-20260121    gcc-13
x86_64      buildonly-randconfig-005-20260122    clang-20
x86_64      buildonly-randconfig-006-20260121    clang-20
x86_64      buildonly-randconfig-006-20260122    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260122    clang-20
x86_64                randconfig-001-20260122    gcc-14
x86_64                randconfig-002-20260122    clang-20
x86_64                randconfig-002-20260122    gcc-13
x86_64                randconfig-003-20260122    clang-20
x86_64                randconfig-004-20260122    clang-20
x86_64                randconfig-005-20260122    clang-20
x86_64                randconfig-006-20260122    clang-20
x86_64                randconfig-006-20260122    gcc-14
x86_64                randconfig-011-20260122    clang-20
x86_64                randconfig-011-20260122    gcc-14
x86_64                randconfig-012-20260122    clang-20
x86_64                randconfig-012-20260122    gcc-14
x86_64                randconfig-013-20260122    clang-20
x86_64                randconfig-014-20260122    clang-20
x86_64                randconfig-015-20260122    clang-20
x86_64                randconfig-016-20260122    clang-20
x86_64                randconfig-016-20260122    gcc-14
x86_64                randconfig-071-20260121    clang-20
x86_64                randconfig-071-20260122    clang-20
x86_64                randconfig-072-20260121    clang-20
x86_64                randconfig-072-20260122    clang-20
x86_64                randconfig-073-20260121    clang-20
x86_64                randconfig-073-20260122    clang-20
x86_64                randconfig-074-20260121    clang-20
x86_64                randconfig-074-20260122    clang-20
x86_64                randconfig-075-20260121    clang-20
x86_64                randconfig-075-20260122    clang-20
x86_64                randconfig-076-20260121    gcc-13
x86_64                randconfig-076-20260122    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260121    gcc-14.3.0
xtensa                randconfig-001-20260122    gcc-8.5.0
xtensa                randconfig-002-20260121    gcc-8.5.0
xtensa                randconfig-002-20260122    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
