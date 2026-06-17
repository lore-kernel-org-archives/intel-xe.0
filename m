Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0AECD98F2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 18:00:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3489E10EAB8;
	Wed, 17 Jun 2026 18:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bXl1KD0z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B1F10EAB8
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 18:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781719207; x=1813255207;
 h=date:from:to:cc:subject:message-id;
 bh=InoDEOq6POL/wt3KC1E2uTstFKXQpy44DHwk2IfMSPg=;
 b=bXl1KD0zYFfIkPoe2bHuwmvWPUlKjjVh7p5GMsGbmJiZFD8qJQlR53QY
 wcByhWIrtODxv8KdEoDlpkFa+nrPSBVhPKsfO7XXCfrYVSZnWf5XG56O4
 h5uvIvxsTjbLxaqeymNi5wMvybnf8lHg6qMjRL87ToqCW1s79iQHZ9/1Y
 o9HxNopfmm0Fnj3NeauKpZtltyu8P2lltG9dWMoNzBj/n//P66cpFkHbG
 wtWsuyadUc8bjMB40AoHW6dxG9GvtWA+2CBcmoYEBz4oDRVgyIMYZ6LrN
 btQHxgu/wSRl5vpvHgxKIZe1hNSAHJDCk1LJNS7gKjRP5BxbTCAU2H+BV A==;
X-CSE-ConnectionGUID: qzDFQH+aR92lo2nx77hrRw==
X-CSE-MsgGUID: QZyWUE0DS860nBI1TcFEnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82306471"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="82306471"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 11:00:07 -0700
X-CSE-ConnectionGUID: TRYTRaR8RFii5vHsvaN/+g==
X-CSE-MsgGUID: DwjKIcn+TcOrNuX+Vjaxgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="248211039"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 17 Jun 2026 11:00:05 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wZuYU-00000000Ums-1OT3;
 Wed, 17 Jun 2026 18:00:02 +0000
Date: Thu, 18 Jun 2026 01:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next-fixes] BUILD SUCCESS
 0b5ed2756d45b04669502a1f13b1657ec7664571
Message-ID: <202606180117.PB2eGkUq-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next-fixes
branch HEAD: 0b5ed2756d45b04669502a1f13b1657ec7664571  drm/xe: Add compact-PT and addr mask handling for page reclaim

elapsed time: 1447m

configs tested: 218
configs skipped: 17

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-16.1.0
arc                   randconfig-001-20260617    gcc-16.1.0
arc                            randconfig-002    gcc-16.1.0
arc                   randconfig-002-20260617    gcc-10.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                            randconfig-001    gcc-16.1.0
arm                   randconfig-001-20260617    clang-23
arm                            randconfig-002    gcc-16.1.0
arm                   randconfig-002-20260617    clang-23
arm                            randconfig-003    gcc-16.1.0
arm                   randconfig-003-20260617    clang-17
arm                            randconfig-004    gcc-16.1.0
arm                   randconfig-004-20260617    gcc-12.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    gcc-14.3.0
arm64                 randconfig-001-20260617    clang-23
arm64                 randconfig-001-20260617    gcc-12.5.0
arm64                          randconfig-002    gcc-8.5.0
arm64                 randconfig-002-20260617    gcc-10.5.0
arm64                 randconfig-002-20260617    gcc-12.5.0
arm64                          randconfig-003    clang-20
arm64                 randconfig-003-20260617    gcc-12.5.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260617    gcc-12.5.0
arm64                 randconfig-004-20260617    gcc-14.3.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    gcc-13.4.0
csky                  randconfig-001-20260617    gcc-10.5.0
csky                  randconfig-001-20260617    gcc-12.5.0
csky                  randconfig-002-20260617    gcc-12.5.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260617    clang-17
hexagon               randconfig-001-20260617    clang-22
hexagon               randconfig-002-20260617    clang-17
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386        buildonly-randconfig-001-20260617    clang-22
i386        buildonly-randconfig-002-20260617    gcc-14
i386        buildonly-randconfig-003-20260617    gcc-13
i386        buildonly-randconfig-004-20260617    clang-22
i386        buildonly-randconfig-005-20260617    gcc-14
i386        buildonly-randconfig-006-20260617    clang-22
i386                                defconfig    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-011-20260617    clang-22
i386                  randconfig-011-20260617    gcc-12
i386                  randconfig-012-20260617    clang-22
i386                  randconfig-012-20260617    gcc-14
i386                  randconfig-013-20260617    clang-22
i386                  randconfig-013-20260617    gcc-14
i386                  randconfig-014-20260617    clang-22
i386                  randconfig-014-20260617    gcc-14
i386                  randconfig-015-20260617    clang-22
i386                  randconfig-015-20260617    gcc-14
i386                  randconfig-016-20260617    clang-22
i386                  randconfig-016-20260617    gcc-14
i386                  randconfig-017-20260617    clang-22
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260617    clang-17
loongarch             randconfig-001-20260617    gcc-16.1.0
loongarch             randconfig-002-20260617    clang-17
loongarch             randconfig-002-20260617    clang-23
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260617    clang-17
nios2                 randconfig-001-20260617    gcc-8.5.0
nios2                 randconfig-002-20260617    clang-17
nios2                 randconfig-002-20260617    gcc-8.5.0
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260617    gcc-13.4.0
parisc                randconfig-001-20260617    gcc-15.2.0
parisc                randconfig-002-20260617    gcc-15.2.0
parisc64                            defconfig    clang-23
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                          g5_defconfig    gcc-16.1.0
powerpc               randconfig-001-20260617    gcc-14.3.0
powerpc               randconfig-001-20260617    gcc-15.2.0
powerpc               randconfig-002-20260617    gcc-15.2.0
powerpc64             randconfig-001-20260617    gcc-15.2.0
powerpc64             randconfig-001-20260617    gcc-8.5.0
powerpc64             randconfig-002-20260617    gcc-10.5.0
powerpc64             randconfig-002-20260617    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260617    clang-17
riscv                 randconfig-002-20260617    clang-23
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260617    gcc-9.5.0
s390                  randconfig-002-20260617    clang-23
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-16.1.0
sh                    randconfig-001-20260617    gcc-16.1.0
sh                    randconfig-002-20260617    gcc-12.5.0
sh                           se7619_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260617    gcc-16.1.0
sparc                 randconfig-001-20260617    gcc-8.5.0
sparc                 randconfig-002-20260617    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260617    gcc-16.1.0
sparc64               randconfig-001-20260617    gcc-8.5.0
sparc64               randconfig-002-20260617    clang-20
sparc64               randconfig-002-20260617    gcc-16.1.0
um                               allmodconfig    clang-17
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260617    clang-23
um                    randconfig-001-20260617    gcc-16.1.0
um                    randconfig-002-20260617    gcc-14
um                    randconfig-002-20260617    gcc-16.1.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64      buildonly-randconfig-001-20260617    clang-22
x86_64      buildonly-randconfig-002-20260617    clang-22
x86_64      buildonly-randconfig-003-20260617    clang-22
x86_64      buildonly-randconfig-004-20260617    clang-22
x86_64      buildonly-randconfig-005-20260617    clang-22
x86_64      buildonly-randconfig-006-20260617    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260617    clang-22
x86_64                randconfig-011-20260617    gcc-14
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260617    clang-22
x86_64                randconfig-012-20260617    gcc-14
x86_64                         randconfig-013    clang-22
x86_64                randconfig-013-20260617    clang-22
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260617    clang-22
x86_64                randconfig-014-20260617    gcc-14
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260617    clang-22
x86_64                randconfig-015-20260617    gcc-14
x86_64                         randconfig-016    clang-22
x86_64                randconfig-016-20260617    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                randconfig-001-20260617    gcc-16.1.0
xtensa                randconfig-001-20260617    gcc-8.5.0
xtensa                randconfig-002-20260617    gcc-13.4.0
xtensa                randconfig-002-20260617    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
