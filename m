Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77438CD6E50
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 14:28:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A8F10FFF8;
	Fri, 29 May 2026 14:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGaJq/8w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CC410FFF8
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 14:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780064905; x=1811600905;
 h=date:from:to:cc:subject:message-id;
 bh=l+WF/x0regwVje/dVpkAuP94WfkmDEuDLdxt8lX31t8=;
 b=bGaJq/8wSab0oCoHuN5qZl/iMx76h8Qn0v0isRyju+jtJFg72pe6d3Qs
 rquDWwwB6dvxSrgM/ACh3OeKi8P//wG4etRqH5IKnAk5kSw6MdOujn2f5
 KFv3BXGEMg4SBZzG33HXHFuZmR9jl5C/kbkK6ZXu9nBAn9+9HBkluv97J
 ynIPVLA0iC6QYSD75HjmxpygBioCk6Le+WVrAh/ZzmgRZEoHKs3jGgBIz
 +VL4NYnjvzIoNHUlO5ArUbtgaQyqwftnGqLVHcPBYGw9f1O7fQ5vtb/0L
 wIFAc66ZHqlzXxVPh6H4e610MCWSspnjinj63mqDcIgR9xGiG+fQ1K9g0 g==;
X-CSE-ConnectionGUID: II6fsGkbQnWnx4BqKiP84A==
X-CSE-MsgGUID: YVc1JMmxQcCrRqEycIbGUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80817179"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="80817179"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 07:28:24 -0700
X-CSE-ConnectionGUID: 8cbHBIv4Q1+7KR9fGqUN4g==
X-CSE-MsgGUID: JI/3wumnRzSvcGA8hhhdxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="238676730"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 29 May 2026 07:28:23 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wSyCC-000000007Ly-2PYj;
 Fri, 29 May 2026 14:28:20 +0000
Date: Fri, 29 May 2026 22:27:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 6680bf0cb7261b7eb62a7226c6845c5c9ce5a009
Message-ID: <202605292226.FqRE2rXI-lkp@intel.com>
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
branch HEAD: 6680bf0cb7261b7eb62a7226c6845c5c9ce5a009  drm/xe: gate observation streams with perf_allow_cpu()

elapsed time: 1260m

configs tested: 187
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260529    clang-23
arc                   randconfig-002-20260529    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260529    clang-23
arm                   randconfig-002-20260529    clang-23
arm                   randconfig-003-20260529    clang-23
arm                   randconfig-004-20260529    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260529    clang-23
arm64                 randconfig-002-20260529    clang-23
arm64                 randconfig-003-20260529    clang-23
arm64                 randconfig-004-20260529    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260529    clang-23
csky                  randconfig-002-20260529    clang-23
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260529    gcc-8.5.0
hexagon               randconfig-002-20260529    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260529    gcc-12
i386        buildonly-randconfig-002-20260529    gcc-12
i386        buildonly-randconfig-003-20260529    gcc-12
i386        buildonly-randconfig-004-20260529    gcc-12
i386        buildonly-randconfig-005-20260529    gcc-12
i386        buildonly-randconfig-006-20260529    gcc-12
i386                                defconfig    gcc-15.2.0
i386                           randconfig-001    gcc-14
i386                  randconfig-001-20260529    gcc-14
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260529    gcc-14
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260529    gcc-14
i386                           randconfig-004    gcc-14
i386                  randconfig-004-20260529    gcc-14
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260529    gcc-14
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260529    gcc-14
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260529    gcc-14
i386                  randconfig-011-20260529    gcc-14
i386                  randconfig-012-20260529    gcc-14
i386                  randconfig-013-20260529    gcc-14
i386                  randconfig-014-20260529    gcc-14
i386                  randconfig-015-20260529    gcc-14
i386                  randconfig-016-20260529    gcc-14
i386                  randconfig-017-20260529    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260529    gcc-8.5.0
loongarch             randconfig-002-20260529    gcc-8.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            alldefconfig    gcc-11.5.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260529    gcc-8.5.0
nios2                 randconfig-002-20260529    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    clang-19
parisc                randconfig-001-20260529    clang-19
parisc                         randconfig-002    clang-19
parisc                randconfig-002-20260529    clang-19
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                        randconfig-001    clang-19
powerpc               randconfig-001-20260529    clang-19
powerpc                        randconfig-002    clang-19
powerpc               randconfig-002-20260529    clang-19
powerpc64                      randconfig-001    clang-19
powerpc64             randconfig-001-20260529    clang-19
powerpc64                      randconfig-002    clang-19
powerpc64             randconfig-002-20260529    clang-19
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260529    gcc-15.2.0
riscv                 randconfig-002-20260529    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260529    gcc-15.2.0
s390                  randconfig-002-20260529    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260529    gcc-15.2.0
sh                    randconfig-002-20260529    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260529    gcc-11.5.0
sparc                 randconfig-002-20260529    gcc-11.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260529    gcc-11.5.0
sparc64               randconfig-002-20260529    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260529    gcc-11.5.0
um                    randconfig-002-20260529    gcc-11.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260529    gcc-14
x86_64      buildonly-randconfig-002-20260529    gcc-14
x86_64      buildonly-randconfig-003-20260529    gcc-14
x86_64      buildonly-randconfig-004-20260529    gcc-14
x86_64      buildonly-randconfig-005-20260529    gcc-14
x86_64      buildonly-randconfig-006-20260529    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    clang-20
x86_64                randconfig-001-20260529    clang-20
x86_64                         randconfig-002    clang-20
x86_64                randconfig-002-20260529    clang-20
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260529    clang-20
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260529    clang-20
x86_64                         randconfig-005    clang-20
x86_64                randconfig-005-20260529    clang-20
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260529    clang-20
x86_64                randconfig-011-20260529    clang-20
x86_64                randconfig-012-20260529    clang-20
x86_64                randconfig-013-20260529    clang-20
x86_64                randconfig-014-20260529    clang-20
x86_64                randconfig-015-20260529    clang-20
x86_64                randconfig-016-20260529    clang-20
x86_64                randconfig-071-20260529    clang-20
x86_64                randconfig-072-20260529    clang-20
x86_64                randconfig-073-20260529    clang-20
x86_64                randconfig-074-20260529    clang-20
x86_64                randconfig-075-20260529    clang-20
x86_64                randconfig-076-20260529    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260529    gcc-11.5.0
xtensa                randconfig-002-20260529    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
