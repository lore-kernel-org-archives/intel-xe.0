Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A120E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 17:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C2D10E061;
	Tue, 10 Dec 2024 17:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i15cKUeJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AAF10E061
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 17:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733852174; x=1765388174;
 h=date:from:to:cc:subject:message-id;
 bh=z6+rc4EpgPF2uPR+rbyWogXoy1pFpd+emNvIkppfc4g=;
 b=i15cKUeJLIinvB5RTM3Ql2zOavn7k/WbN0aJFmDeAte5SywYzC55Twd8
 UeUWCYrpON8+ksknaCQrrhDlsW59kbtD0dIodO3Q0KpVcmXqmtnIbfnlL
 PzZ8yA5EZCYGciYiI7MxxegsjEilE8GPymoNDVOUqwXiFczFLWIvSbHbm
 IWLCvr195rKF2klsNxKKoxT6zt9rPPcw79SCaEY9bOv5T483MT7N66Q5z
 Huicc1Q9BCsXAkPaYo+psqdPCRC7wIXYgGg6wuZTcTpOUlGBmCL55GKsp
 GeX3F/R4VcFs/G+0roH5ttFUlKJJ9DwMij05uAkSA4oIhKKnWqPj0paJ1 A==;
X-CSE-ConnectionGUID: N+dt3rnIRRO6PoIjxODXPg==
X-CSE-MsgGUID: eCN9ephoRFCh/fnbVECsEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="51736660"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="51736660"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 09:36:14 -0800
X-CSE-ConnectionGUID: 64M+8c2fSQW8TloLuVmvjA==
X-CSE-MsgGUID: yY7qE7deSHyw9rzCVDFM7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="95948696"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 10 Dec 2024 09:36:12 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tL49a-0005ox-0m;
 Tue, 10 Dec 2024 17:36:10 +0000
Date: Wed, 11 Dec 2024 01:35:12 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 cb57c75098c1c449a007ba301f9073f96febaaa9
Message-ID: <202412110106.mMLtIgZb-lkp@intel.com>
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
branch HEAD: cb57c75098c1c449a007ba301f9073f96febaaa9  drm/xe: fix the ERR_PTR() returned on failure to allocate tiny pt

elapsed time: 1442m

configs tested: 154
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241210    gcc-13.2.0
arc                   randconfig-001-20241210    gcc-14.2.0
arc                   randconfig-002-20241210    gcc-13.2.0
arc                   randconfig-002-20241210    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241210    clang-20
arm                   randconfig-001-20241210    gcc-14.2.0
arm                   randconfig-002-20241210    gcc-14.2.0
arm                   randconfig-003-20241210    clang-20
arm                   randconfig-003-20241210    gcc-14.2.0
arm                   randconfig-004-20241210    clang-20
arm                   randconfig-004-20241210    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241210    clang-20
arm64                 randconfig-001-20241210    gcc-14.2.0
arm64                 randconfig-002-20241210    clang-20
arm64                 randconfig-002-20241210    gcc-14.2.0
arm64                 randconfig-003-20241210    clang-20
arm64                 randconfig-003-20241210    gcc-14.2.0
arm64                 randconfig-004-20241210    clang-20
arm64                 randconfig-004-20241210    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241210    gcc-14.2.0
csky                  randconfig-002-20241210    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241210    clang-16
hexagon               randconfig-002-20241210    clang-14
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241210    gcc-12
i386        buildonly-randconfig-002-20241210    clang-19
i386        buildonly-randconfig-002-20241210    gcc-12
i386        buildonly-randconfig-003-20241210    gcc-12
i386        buildonly-randconfig-004-20241210    clang-19
i386        buildonly-randconfig-004-20241210    gcc-12
i386        buildonly-randconfig-005-20241210    clang-19
i386        buildonly-randconfig-005-20241210    gcc-12
i386        buildonly-randconfig-006-20241210    clang-19
i386        buildonly-randconfig-006-20241210    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241210    clang-19
i386                  randconfig-002-20241210    clang-19
i386                  randconfig-003-20241210    clang-19
i386                  randconfig-004-20241210    clang-19
i386                  randconfig-005-20241210    clang-19
i386                  randconfig-006-20241210    clang-19
i386                  randconfig-007-20241210    clang-19
i386                  randconfig-011-20241210    clang-19
i386                  randconfig-012-20241210    clang-19
i386                  randconfig-013-20241210    clang-19
i386                  randconfig-014-20241210    clang-19
i386                  randconfig-015-20241210    clang-19
i386                  randconfig-016-20241210    clang-19
i386                  randconfig-017-20241210    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241210    gcc-14.2.0
loongarch             randconfig-002-20241210    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241210    gcc-14.2.0
nios2                 randconfig-002-20241210    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241210    gcc-14.2.0
parisc                randconfig-002-20241210    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc               randconfig-001-20241210    clang-20
powerpc               randconfig-002-20241210    clang-20
powerpc               randconfig-003-20241210    clang-20
powerpc64             randconfig-001-20241210    gcc-14.2.0
powerpc64             randconfig-002-20241210    gcc-14.2.0
powerpc64             randconfig-003-20241210    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                 randconfig-001-20241210    clang-19
riscv                 randconfig-002-20241210    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241210    gcc-14.2.0
s390                  randconfig-002-20241210    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241210    gcc-14.2.0
sh                    randconfig-002-20241210    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241210    gcc-14.2.0
sparc                 randconfig-002-20241210    gcc-14.2.0
sparc64               randconfig-001-20241210    gcc-14.2.0
sparc64               randconfig-002-20241210    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                    randconfig-001-20241210    clang-20
um                    randconfig-002-20241210    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241210    clang-19
x86_64      buildonly-randconfig-001-20241210    gcc-12
x86_64      buildonly-randconfig-002-20241210    clang-19
x86_64      buildonly-randconfig-003-20241210    clang-19
x86_64      buildonly-randconfig-004-20241210    clang-19
x86_64      buildonly-randconfig-004-20241210    gcc-12
x86_64      buildonly-randconfig-005-20241210    clang-19
x86_64      buildonly-randconfig-005-20241210    gcc-12
x86_64      buildonly-randconfig-006-20241210    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241210    gcc-12
x86_64                randconfig-002-20241210    gcc-12
x86_64                randconfig-003-20241210    gcc-12
x86_64                randconfig-004-20241210    gcc-12
x86_64                randconfig-005-20241210    gcc-12
x86_64                randconfig-006-20241210    gcc-12
x86_64                randconfig-007-20241210    gcc-12
x86_64                randconfig-008-20241210    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241210    gcc-14.2.0
xtensa                randconfig-002-20241210    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
