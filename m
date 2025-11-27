Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB8BCFD2F6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 10:30:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D559310E7ED;
	Thu, 27 Nov 2025 10:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nMujBGZL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA68310E7ED
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 10:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764239425; x=1795775425;
 h=date:from:to:cc:subject:message-id;
 bh=SsnnwzOH/9zVMODT/OHW0ilVfbwzJUqV4oxkaWghBfw=;
 b=nMujBGZLT5NAanmqeALsQ2o6LltKDJ+SJKg2qYX+yd0J1T06d6Wwmjdn
 TYvsgYYMypByUX2s9iPQ4ZBIgrmCIu+lDws2OqZQ3j2YJ6cdPFj5VqnsW
 BwnRPkuNroY9cIZ9kGSXtedCLiUDG8nqFDy6QT36Zb6aYz7XTtECHNERE
 7Lx9XY464SkzmN4yxJPAs2VQUVs/bTg/m/IJ0Zk1W7xPikKJWuvBB1GJi
 la3lHE32eshP++CjlNjY6x92taKBs6J1nFtCo3gz6IpO5neOja49BAa0i
 fKz7LoU2JA2PyrNVkffwLBELDdaSHJ7bI7wC7BAU6RaMC7Shb+qSef1wv Q==;
X-CSE-ConnectionGUID: woOlky6GQMWgNTOCL25bDQ==
X-CSE-MsgGUID: szsk/pX8Q9eJn3xBD/0wxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77387845"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="77387845"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 02:30:25 -0800
X-CSE-ConnectionGUID: NDRCrxfJTTyujbbom5Lu0w==
X-CSE-MsgGUID: sNNoCHyFS+WgAX84vb9KvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="197524413"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 27 Nov 2025 02:30:23 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vOZGX-000000004UU-1d5H;
 Thu, 27 Nov 2025 10:30:21 +0000
Date: Thu, 27 Nov 2025 18:29:43 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 7276878b069c57d9a9cca5db01d2f7a427b73456
Message-ID: <202511271838.cpDeAVdt-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: 7276878b069c57d9a9cca5db01d2f7a427b73456  drm/xe: Fix conversion from clock ticks to milliseconds

elapsed time: 2244m

configs tested: 132
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
arc                    alldefconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc         randconfig-001-20251126    gcc-13.4.0
arc         randconfig-001-20251127    clang-22
arc         randconfig-002-20251126    gcc-11.5.0
arc         randconfig-002-20251127    clang-22
arm                     allnoconfig    clang-22
arm                     allnoconfig    gcc-15.1.0
arm         randconfig-001-20251126    clang-22
arm         randconfig-001-20251127    clang-22
arm         randconfig-002-20251126    clang-22
arm         randconfig-002-20251127    clang-22
arm         randconfig-003-20251126    clang-19
arm         randconfig-003-20251127    clang-22
arm         randconfig-004-20251126    clang-22
arm         randconfig-004-20251127    clang-22
arm               s3c6400_defconfig    gcc-15.1.0
arm               socfpga_defconfig    gcc-15.1.0
arm64                   allnoconfig    gcc-15.1.0
arm64       randconfig-001-20251127    gcc-15.1.0
arm64       randconfig-002-20251127    gcc-15.1.0
arm64       randconfig-003-20251127    gcc-15.1.0
arm64       randconfig-004-20251127    gcc-15.1.0
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
csky        randconfig-001-20251127    gcc-15.1.0
csky        randconfig-002-20251127    gcc-15.1.0
hexagon                 allnoconfig    clang-22
hexagon                 allnoconfig    gcc-15.1.0
hexagon     randconfig-001-20251126    clang-22
hexagon     randconfig-001-20251127    gcc-15.1.0
hexagon     randconfig-002-20251126    clang-22
hexagon     randconfig-002-20251127    gcc-15.1.0
i386                    allnoconfig    gcc-14
i386                    allnoconfig    gcc-15.1.0
loongarch               allnoconfig    clang-22
loongarch               allnoconfig    gcc-15.1.0
loongarch   randconfig-001-20251126    gcc-15.1.0
loongarch   randconfig-001-20251127    gcc-15.1.0
loongarch   randconfig-002-20251126    clang-22
loongarch   randconfig-002-20251127    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
mips                   allmodconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips                   allyesconfig    gcc-15.1.0
mips        cavium_octeon_defconfig    gcc-15.1.0
mips               rt305x_defconfig    gcc-15.1.0
nios2                  allmodconfig    clang-22
nios2                   allnoconfig    clang-22
nios2                   allnoconfig    gcc-11.5.0
nios2       randconfig-001-20251126    gcc-11.5.0
nios2       randconfig-001-20251127    gcc-15.1.0
nios2       randconfig-002-20251126    gcc-9.5.0
nios2       randconfig-002-20251127    gcc-15.1.0
openrisc               allmodconfig    clang-22
openrisc                allnoconfig    clang-22
openrisc                allnoconfig    gcc-15.1.0
openrisc                  defconfig    gcc-15.1.0
openrisc             virt_defconfig    gcc-15.1.0
parisc                 allmodconfig    gcc-15.1.0
parisc                  allnoconfig    clang-22
parisc                  allnoconfig    gcc-15.1.0
parisc                 allyesconfig    gcc-15.1.0
parisc                    defconfig    gcc-15.1.0
parisc      randconfig-001-20251126    gcc-8.5.0
parisc      randconfig-001-20251127    gcc-13.4.0
parisc      randconfig-002-20251126    gcc-15.1.0
parisc      randconfig-002-20251127    gcc-13.4.0
powerpc                allmodconfig    gcc-15.1.0
powerpc                 allnoconfig    clang-22
powerpc                 allnoconfig    gcc-15.1.0
powerpc     randconfig-001-20251126    gcc-10.5.0
powerpc     randconfig-001-20251127    gcc-13.4.0
powerpc     randconfig-002-20251126    gcc-8.5.0
powerpc     randconfig-002-20251127    gcc-13.4.0
powerpc           skiroot_defconfig    gcc-15.1.0
powerpc64   randconfig-001-20251126    clang-19
powerpc64   randconfig-001-20251127    gcc-13.4.0
powerpc64   randconfig-002-20251126    clang-22
powerpc64   randconfig-002-20251127    gcc-13.4.0
riscv                   allnoconfig    clang-22
riscv                   allnoconfig    gcc-15.1.0
riscv                     defconfig    gcc-15.1.0
riscv       randconfig-001-20251126    gcc-10.5.0
riscv       randconfig-001-20251127    gcc-12.5.0
riscv       randconfig-002-20251126    clang-22
riscv       randconfig-002-20251127    gcc-12.5.0
s390                   allmodconfig    gcc-15.1.0
s390                    allnoconfig    clang-22
s390                   allyesconfig    gcc-15.1.0
s390                      defconfig    gcc-15.1.0
s390        randconfig-001-20251126    gcc-8.5.0
s390        randconfig-001-20251127    gcc-12.5.0
s390        randconfig-002-20251126    gcc-8.5.0
s390        randconfig-002-20251127    gcc-12.5.0
sh                     allmodconfig    gcc-15.1.0
sh                      allnoconfig    clang-22
sh                      allnoconfig    gcc-15.1.0
sh                     allyesconfig    gcc-15.1.0
sh                r7780mp_defconfig    gcc-15.1.0
sh          randconfig-001-20251126    gcc-14.3.0
sh          randconfig-001-20251127    gcc-12.5.0
sh          randconfig-002-20251126    gcc-11.5.0
sh          randconfig-002-20251127    gcc-12.5.0
sparc                   allnoconfig    clang-22
sparc                   allnoconfig    gcc-15.1.0
sparc                     defconfig    gcc-15.1.0
sparc       randconfig-001-20251126    gcc-8.5.0
sparc       randconfig-001-20251127    clang-22
sparc       randconfig-002-20251127    clang-22
sparc64                allmodconfig    clang-22
sparc64     randconfig-001-20251127    clang-22
sparc64     randconfig-002-20251127    clang-22
um                      allnoconfig    clang-22
um          randconfig-001-20251127    clang-22
um          randconfig-002-20251127    clang-22
x86_64                  allnoconfig    clang-20
x86_64                  allnoconfig    clang-22
x86_64      randconfig-011-20251127    gcc-14
x86_64      randconfig-012-20251127    gcc-14
x86_64      randconfig-013-20251127    gcc-14
x86_64      randconfig-014-20251127    gcc-14
x86_64      randconfig-015-20251127    gcc-14
x86_64      randconfig-016-20251127    gcc-14
xtensa                  allnoconfig    clang-22
xtensa                  allnoconfig    gcc-15.1.0
xtensa                 allyesconfig    clang-22
xtensa      randconfig-001-20251127    clang-22
xtensa      randconfig-002-20251127    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
