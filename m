Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D62AC71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 13:15:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9E710E828;
	Thu, 12 Jun 2025 13:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EuppO3zo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C036410E828
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 13:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749734115; x=1781270115;
 h=date:from:to:cc:subject:message-id;
 bh=raVoAKtz2t73lLyyKtDeYCDoWsBNT4cFHLFVFi98Yu4=;
 b=EuppO3zomdMtub3Zh2un/VBIFM6Srxu2ilhn39ivul7qasXvapjcg+D5
 bjVByZ+BSgv4WsC8fKXyXNMLGAaagSfCSr0VzSfi6gimkvr2kVyeRMYfU
 /fQGdoZW07gcKbjio48nlx3FC7O55LerIMTfmFHDetMhiPovaqYMRw/Dt
 ++UJYDyBI45NSRJFe52JTcEQv21RCE+YdkCEYfDrlg/p2OPAfLH37ZiID
 IPRQzCiPz5psMg+EuIDBhrGHTBE5Fk+TxKvbFo/pKR09lV3QVetSkZhpe
 uZAo7IuACenTnLGNIulNW8qjDalV/0HIy49d/BuN+tTi0QG+Drzs2sKYQ w==;
X-CSE-ConnectionGUID: Uc2FaF4sSGe5nVk7hEEixg==
X-CSE-MsgGUID: ur9Ruu1RTuCEV8gewW1hnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="63320433"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="63320433"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 06:15:15 -0700
X-CSE-ConnectionGUID: xU6wIxmQQty1ZvjiQ3rqFw==
X-CSE-MsgGUID: /eD1dMX1TlGjONRvWFVy7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="178422155"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 12 Jun 2025 06:15:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uPhlu-000BYQ-2d;
 Thu, 12 Jun 2025 13:15:10 +0000
Date: Thu, 12 Jun 2025 21:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:topic/xe-for-CI] BUILD SUCCESS
 9b740fabbb7eb6722c78b886d1ae59d2504d855b
Message-ID: <202506122143.uT2mbiIq-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git topic/xe-for-CI
branch HEAD: 9b740fabbb7eb6722c78b886d1ae59d2504d855b  drm/xe/pm: Re-enable D3Cold by default on BMG

elapsed time: 1225m

configs tested: 217
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250612    gcc-8.5.0
arc                   randconfig-002-20250612    gcc-10.5.0
arc                   randconfig-002-20250612    gcc-8.5.0
arc                        vdk_hs38_defconfig    clang-21
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-15.1.0
arm                            mmp2_defconfig    clang-21
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250612    clang-21
arm                   randconfig-001-20250612    gcc-8.5.0
arm                   randconfig-002-20250612    clang-18
arm                   randconfig-002-20250612    gcc-8.5.0
arm                   randconfig-003-20250612    clang-21
arm                   randconfig-003-20250612    gcc-8.5.0
arm                   randconfig-004-20250612    clang-21
arm                   randconfig-004-20250612    gcc-8.5.0
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250612    clang-19
arm64                 randconfig-001-20250612    gcc-8.5.0
arm64                 randconfig-002-20250612    clang-17
arm64                 randconfig-002-20250612    gcc-8.5.0
arm64                 randconfig-003-20250612    clang-21
arm64                 randconfig-003-20250612    gcc-8.5.0
arm64                 randconfig-004-20250612    clang-18
arm64                 randconfig-004-20250612    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250612    gcc-10.5.0
csky                  randconfig-001-20250612    gcc-11.5.0
csky                  randconfig-002-20250612    gcc-10.5.0
csky                  randconfig-002-20250612    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250612    clang-21
hexagon               randconfig-001-20250612    gcc-10.5.0
hexagon               randconfig-002-20250612    clang-21
hexagon               randconfig-002-20250612    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250612    clang-20
i386        buildonly-randconfig-002-20250612    clang-20
i386        buildonly-randconfig-002-20250612    gcc-12
i386        buildonly-randconfig-003-20250612    clang-20
i386        buildonly-randconfig-004-20250612    clang-20
i386        buildonly-randconfig-005-20250612    clang-20
i386        buildonly-randconfig-006-20250612    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250612    gcc-12
i386                  randconfig-002-20250612    gcc-12
i386                  randconfig-003-20250612    gcc-12
i386                  randconfig-004-20250612    gcc-12
i386                  randconfig-005-20250612    gcc-12
i386                  randconfig-006-20250612    gcc-12
i386                  randconfig-007-20250612    gcc-12
i386                  randconfig-011-20250612    gcc-12
i386                  randconfig-012-20250612    gcc-12
i386                  randconfig-013-20250612    gcc-12
i386                  randconfig-014-20250612    gcc-12
i386                  randconfig-015-20250612    gcc-12
i386                  randconfig-016-20250612    gcc-12
i386                  randconfig-017-20250612    gcc-12
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250612    gcc-10.5.0
loongarch             randconfig-001-20250612    gcc-13.3.0
loongarch             randconfig-002-20250612    gcc-10.5.0
loongarch             randconfig-002-20250612    gcc-12.4.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        mvme147_defconfig    gcc-15.1.0
m68k                        stmark2_defconfig    clang-21
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           gcw0_defconfig    clang-21
mips                           ip28_defconfig    clang-21
mips                           jazz_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250612    gcc-10.5.0
nios2                 randconfig-001-20250612    gcc-14.2.0
nios2                 randconfig-002-20250612    gcc-10.5.0
nios2                 randconfig-002-20250612    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250612    gcc-10.5.0
parisc                randconfig-001-20250612    gcc-8.5.0
parisc                randconfig-002-20250612    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc               mpc834x_itxgp_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250612    clang-21
powerpc               randconfig-001-20250612    gcc-10.5.0
powerpc               randconfig-002-20250612    gcc-10.5.0
powerpc               randconfig-002-20250612    gcc-8.5.0
powerpc               randconfig-003-20250612    clang-17
powerpc               randconfig-003-20250612    gcc-10.5.0
powerpc                  storcenter_defconfig    clang-21
powerpc                     taishan_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250612    gcc-10.5.0
powerpc64             randconfig-001-20250612    gcc-12.4.0
powerpc64             randconfig-002-20250612    clang-21
powerpc64             randconfig-002-20250612    gcc-10.5.0
powerpc64             randconfig-003-20250612    clang-21
powerpc64             randconfig-003-20250612    gcc-10.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250612    clang-21
riscv                 randconfig-001-20250612    gcc-12.4.0
riscv                 randconfig-002-20250612    clang-21
riscv                 randconfig-002-20250612    gcc-12.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250612    clang-21
s390                  randconfig-001-20250612    gcc-12.4.0
s390                  randconfig-002-20250612    gcc-11.5.0
s390                  randconfig-002-20250612    gcc-12.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250612    gcc-12.4.0
sh                    randconfig-002-20250612    gcc-12.4.0
sh                    randconfig-002-20250612    gcc-15.1.0
sh                           se7751_defconfig    gcc-15.1.0
sh                          urquell_defconfig    clang-21
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250612    gcc-12.4.0
sparc                 randconfig-001-20250612    gcc-14.3.0
sparc                 randconfig-002-20250612    gcc-10.3.0
sparc                 randconfig-002-20250612    gcc-12.4.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250612    gcc-12.4.0
sparc64               randconfig-001-20250612    gcc-13.3.0
sparc64               randconfig-002-20250612    gcc-12.4.0
sparc64               randconfig-002-20250612    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250612    clang-17
um                    randconfig-001-20250612    gcc-12.4.0
um                    randconfig-002-20250612    clang-21
um                    randconfig-002-20250612    gcc-12.4.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250612    clang-20
x86_64      buildonly-randconfig-001-20250612    gcc-12
x86_64      buildonly-randconfig-002-20250612    clang-20
x86_64      buildonly-randconfig-003-20250612    clang-20
x86_64      buildonly-randconfig-003-20250612    gcc-12
x86_64      buildonly-randconfig-004-20250612    clang-20
x86_64      buildonly-randconfig-004-20250612    gcc-12
x86_64      buildonly-randconfig-005-20250612    clang-20
x86_64      buildonly-randconfig-006-20250612    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250612    clang-20
x86_64                randconfig-002-20250612    clang-20
x86_64                randconfig-003-20250612    clang-20
x86_64                randconfig-004-20250612    clang-20
x86_64                randconfig-005-20250612    clang-20
x86_64                randconfig-006-20250612    clang-20
x86_64                randconfig-007-20250612    clang-20
x86_64                randconfig-008-20250612    clang-20
x86_64                randconfig-071-20250612    gcc-12
x86_64                randconfig-072-20250612    gcc-12
x86_64                randconfig-073-20250612    gcc-12
x86_64                randconfig-074-20250612    gcc-12
x86_64                randconfig-075-20250612    gcc-12
x86_64                randconfig-076-20250612    gcc-12
x86_64                randconfig-077-20250612    gcc-12
x86_64                randconfig-078-20250612    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250612    gcc-10.5.0
xtensa                randconfig-001-20250612    gcc-12.4.0
xtensa                randconfig-002-20250612    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
