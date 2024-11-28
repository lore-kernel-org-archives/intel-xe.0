Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C39D70DEB
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 18:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3BA10E262;
	Thu, 28 Nov 2024 18:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h1vbZ/lX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756A110E262
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Nov 2024 18:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732820051; x=1764356051;
 h=date:from:to:cc:subject:message-id;
 bh=2SysXlTKDh0odnq7zLYGSnS99LDJMsO6QHYBA+almMw=;
 b=h1vbZ/lXl7/M4n9LxrioJrF+s3rpFGnizs8wgHCMfus4+qOj/AfqnhV5
 4VrRsq6kpaw+GNZhycjW0w0ri3JWnTkqWFXfkKPmkArfycMp7YSCjcN/b
 AZLhCWKAPMzMS4Rv1PAOZSs5gVd/nkTZfNlXDVDlrR8lZ+PvdgMhf29q6
 ui0btebqmqqoHKPF+IZWycSUU3gzX3YySqjXItSpwIJoUfe3JiNRRkGyc
 lzY2s4bHHCKhd9Zw2xc8SEETsGS3UR/66j45jSX7QacLjghZYF6+/ijE3
 +3P6hKvvrxUEUC4r8RG1VEt1k+yMmQxu6Pp7op3ManBgApbioDmE6nAe/ w==;
X-CSE-ConnectionGUID: kmLNVt4MTtaTAHEf34mhQQ==
X-CSE-MsgGUID: XzWJNlPMRlWC6EM3TpVmJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="44438814"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; d="scan'208";a="44438814"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 10:54:11 -0800
X-CSE-ConnectionGUID: jAYiQC6kQtC4OBtw3vUPlQ==
X-CSE-MsgGUID: kOdFVnUaTK2XRkyUZkj3mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; d="scan'208";a="123258963"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 28 Nov 2024 10:54:09 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tGjeR-0009vF-1p;
 Thu, 28 Nov 2024 18:54:07 +0000
Date: Fri, 29 Nov 2024 02:52:16 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 54254727837440966c3381ea688df002ff14f269
Message-ID: <202411290206.VcGOain8-lkp@intel.com>
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
branch HEAD: 54254727837440966c3381ea688df002ff14f269  drm/xe: Only allow contiguous BOs to use xe_bo_vmap

elapsed time: 1001m

configs tested: 182
configs skipped: 22

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241128    gcc-13.2.0
arc                   randconfig-002-20241128    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                            mmp2_defconfig    gcc-14.2.0
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                   randconfig-001-20241128    clang-20
arm                   randconfig-002-20241128    gcc-14.2.0
arm                   randconfig-003-20241128    gcc-14.2.0
arm                   randconfig-004-20241128    clang-20
arm                           sama5_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241128    clang-20
arm64                 randconfig-002-20241128    gcc-14.2.0
arm64                 randconfig-003-20241128    clang-20
arm64                 randconfig-004-20241128    clang-16
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241128    gcc-14.2.0
csky                  randconfig-002-20241128    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241128    clang-20
hexagon               randconfig-002-20241128    clang-20
i386        buildonly-randconfig-001-20241128    clang-19
i386        buildonly-randconfig-001-20241128    gcc-12
i386        buildonly-randconfig-002-20241128    clang-19
i386        buildonly-randconfig-003-20241128    clang-19
i386        buildonly-randconfig-004-20241128    clang-19
i386        buildonly-randconfig-004-20241128    gcc-11
i386        buildonly-randconfig-005-20241128    clang-19
i386        buildonly-randconfig-005-20241128    gcc-11
i386        buildonly-randconfig-006-20241128    clang-19
i386        buildonly-randconfig-006-20241128    gcc-12
i386                  randconfig-001-20241128    clang-19
i386                  randconfig-001-20241128    gcc-12
i386                  randconfig-002-20241128    clang-19
i386                  randconfig-003-20241128    clang-19
i386                  randconfig-003-20241128    gcc-12
i386                  randconfig-004-20241128    clang-19
i386                  randconfig-004-20241128    gcc-11
i386                  randconfig-005-20241128    clang-19
i386                  randconfig-005-20241128    gcc-12
i386                  randconfig-006-20241128    clang-19
i386                  randconfig-006-20241128    gcc-12
i386                  randconfig-011-20241128    clang-19
i386                  randconfig-011-20241128    gcc-12
i386                  randconfig-012-20241128    clang-19
i386                  randconfig-013-20241128    clang-19
i386                  randconfig-014-20241128    clang-19
i386                  randconfig-014-20241128    gcc-11
i386                  randconfig-015-20241128    clang-19
i386                  randconfig-016-20241128    clang-19
i386                  randconfig-016-20241128    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241128    gcc-14.2.0
loongarch             randconfig-002-20241128    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                         db1xxx_defconfig    gcc-14.2.0
mips                            gpr_defconfig    clang-20
mips                           ip22_defconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241128    gcc-14.2.0
nios2                 randconfig-002-20241128    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241128    gcc-14.2.0
parisc                randconfig-002-20241128    gcc-14.2.0
powerpc                     akebono_defconfig    clang-20
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      chrp32_defconfig    gcc-14.2.0
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                 mpc8315_rdb_defconfig    clang-20
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc                       ppc64_defconfig    clang-20
powerpc               randconfig-001-20241128    clang-20
powerpc               randconfig-002-20241128    gcc-14.2.0
powerpc               randconfig-003-20241128    clang-20
powerpc                     taishan_defconfig    clang-20
powerpc64             randconfig-001-20241128    clang-14
powerpc64             randconfig-002-20241128    gcc-14.2.0
powerpc64             randconfig-003-20241128    clang-20
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                 randconfig-001-20241128    gcc-14.2.0
riscv                 randconfig-002-20241128    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241128    clang-20
s390                  randconfig-002-20241128    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                    randconfig-001-20241128    gcc-14.2.0
sh                    randconfig-002-20241128    gcc-14.2.0
sh                           se7750_defconfig    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64               randconfig-001-20241128    gcc-14.2.0
sparc64               randconfig-002-20241128    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                             i386_defconfig    gcc-14.2.0
um                    randconfig-001-20241128    gcc-12
um                    randconfig-002-20241128    gcc-12
x86_64      buildonly-randconfig-001-20241128    clang-19
x86_64      buildonly-randconfig-002-20241128    clang-19
x86_64      buildonly-randconfig-003-20241128    clang-19
x86_64      buildonly-randconfig-004-20241128    clang-19
x86_64      buildonly-randconfig-005-20241128    clang-19
x86_64      buildonly-randconfig-006-20241128    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241128    clang-19
x86_64                randconfig-002-20241128    clang-19
x86_64                randconfig-003-20241128    clang-19
x86_64                randconfig-004-20241128    clang-19
x86_64                randconfig-005-20241128    clang-19
x86_64                randconfig-006-20241128    clang-19
x86_64                randconfig-011-20241128    clang-19
x86_64                randconfig-012-20241128    clang-19
x86_64                randconfig-013-20241128    clang-19
x86_64                randconfig-014-20241128    clang-19
x86_64                randconfig-015-20241128    clang-19
x86_64                randconfig-016-20241128    clang-19
x86_64                randconfig-071-20241128    clang-19
x86_64                randconfig-072-20241128    clang-19
x86_64                randconfig-073-20241128    clang-19
x86_64                randconfig-074-20241128    clang-19
x86_64                randconfig-075-20241128    clang-19
x86_64                randconfig-076-20241128    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                               rhel-9.4    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241128    gcc-14.2.0
xtensa                randconfig-002-20241128    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
