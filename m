Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8B5CCD1AB
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 12:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FD910EA64;
	Fri, 24 Oct 2025 12:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fdbU4kAK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EFB10EA64
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 12:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761308548; x=1792844548;
 h=date:from:to:cc:subject:message-id;
 bh=M6RBlAXGa8lYcCKYMBA550plTD2dYkkaksAzHqXUcZI=;
 b=fdbU4kAKBlG4THBPtXhoIXsgsRcn2onBtOREMDCfDoOuZ1sozvL1gDtj
 SkXoSnHPsEF1/rbbGBz3i0fRMEcMT/75U65xfixD42wWv6QPlB+N1/xpt
 FcRmgFxCCgA8cihLQ8N6lhJY6QEFx9ApDf09/CsK//2xd0AWYIAkrnH7t
 ZOyfi/DJUfYO7DSTsJ6LVKzwxIRypqXehHEzpan9QZQAMlBqO0tJgWl53
 2Q7EwMqhpec/2Qb62hqf35qt8Wu9URaXdBtW8EUSYtyk+D5zIpPlivQTh
 Gze6zmgl8JvKlmlJUa+tZ5TvgFLDsLoA+5srb3JbTlIG8Nt9yRjl7IgNx A==;
X-CSE-ConnectionGUID: FdKc3QJlRyKy1cetdiVm7Q==
X-CSE-MsgGUID: unkTMnTESR2yx239Z1YrrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86119572"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="86119572"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 05:22:28 -0700
X-CSE-ConnectionGUID: Yk2KKkXeSPSd03qadcjS3w==
X-CSE-MsgGUID: tw08rTB1RTuWCjcFS4tseA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="184339759"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by fmviesa006.fm.intel.com with ESMTP; 24 Oct 2025 05:22:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vCGoK-000EU9-0T;
 Fri, 24 Oct 2025 12:22:24 +0000
Date: Fri, 24 Oct 2025 20:22:02 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:topic/xe-for-CI] BUILD SUCCESS
 da39e07e72ce7927980f9eada791aa74cd2c9717
Message-ID: <202510242056.T64X5kTu-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git topic/xe-for-CI
branch HEAD: da39e07e72ce7927980f9eada791aa74cd2c9717  topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI

elapsed time: 1451m

configs tested: 113
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251023    gcc-8.5.0
arc                   randconfig-002-20251023    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-22
arm                          pxa168_defconfig    clang-19
arm                   randconfig-001-20251023    clang-22
arm                   randconfig-002-20251023    clang-19
arm                   randconfig-003-20251023    gcc-8.5.0
arm                   randconfig-004-20251023    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251023    clang-22
arm64                 randconfig-002-20251023    gcc-8.5.0
arm64                 randconfig-003-20251023    gcc-8.5.0
arm64                 randconfig-004-20251023    clang-17
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251023    gcc-11.5.0
csky                  randconfig-002-20251023    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251023    clang-22
hexagon               randconfig-002-20251023    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251023    clang-20
i386        buildonly-randconfig-002-20251023    clang-20
i386        buildonly-randconfig-003-20251023    gcc-14
i386        buildonly-randconfig-004-20251023    clang-20
i386        buildonly-randconfig-005-20251023    clang-20
i386        buildonly-randconfig-006-20251023    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251023    clang-22
loongarch             randconfig-002-20251023    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       m5208evb_defconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          rb532_defconfig    clang-18
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251023    gcc-8.5.0
nios2                 randconfig-002-20251023    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251023    gcc-9.5.0
parisc                randconfig-002-20251023    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                   bluestone_defconfig    clang-22
powerpc               mpc834x_itxgp_defconfig    clang-22
powerpc               randconfig-001-20251023    gcc-12.5.0
powerpc               randconfig-002-20251023    clang-22
powerpc               randconfig-003-20251023    clang-22
powerpc64             randconfig-001-20251023    clang-22
powerpc64             randconfig-002-20251023    gcc-10.5.0
powerpc64             randconfig-003-20251023    gcc-10.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251023    gcc-8.5.0
riscv                 randconfig-002-20251023    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251023    clang-19
s390                  randconfig-002-20251023    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20251023    gcc-15.1.0
sh                    randconfig-002-20251023    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251023    gcc-12.5.0
sparc                 randconfig-002-20251023    gcc-8.5.0
sparc64               randconfig-001-20251023    clang-22
sparc64               randconfig-002-20251023    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20251023    gcc-13
um                    randconfig-002-20251023    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251023    clang-20
x86_64      buildonly-randconfig-002-20251023    gcc-13
x86_64      buildonly-randconfig-003-20251023    clang-20
x86_64      buildonly-randconfig-004-20251023    gcc-14
x86_64      buildonly-randconfig-005-20251023    clang-20
x86_64      buildonly-randconfig-006-20251023    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251023    gcc-8.5.0
xtensa                randconfig-002-20251023    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
