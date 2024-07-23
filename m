Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598D1C3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 07:23:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CAE10E454;
	Tue, 23 Jul 2024 07:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLmmQ7s+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE0410E454
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 07:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721719402; x=1753255402;
 h=date:from:to:cc:subject:message-id;
 bh=S20I/4Nt9WLnFQqJZzWWTZExHvjpbWtzVA2IP9YWRmM=;
 b=nLmmQ7s+FaKcrIzCLIk15OofPW+/H+1+JQA1yQdkNuxqO/KDY4yuOUVs
 lLq8PWIKTH+2RFp2IpRZnkXaEaUwKADKb5qb+KgBohr8zdMJyVwPo5IKE
 9vqCm6q0ESL2dEvq8VCoLppqf8L/aSQBzag8209a4CLjFDtxXvGr/0PRY
 dVLiiA3xQcUEuJ+bWiblGIWZFsJH7jggK9XSAr3RU1pOL1mt4U/pY9q0U
 byiGne/zuQlygNhow8xeZi4Fk3eGQKEZeB4DzxZByokMWaSxWmGPC6yEI
 Juwu3BtHhztMUysXitYVqB0U9HEt7n9rIMrU8GN0hgfH0My0BIKysmBUA A==;
X-CSE-ConnectionGUID: vVWS4K/fRwGSkwVv2DPmUg==
X-CSE-MsgGUID: npd1a6QbRRKWO/cr6ficKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30748335"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="30748335"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 00:23:22 -0700
X-CSE-ConnectionGUID: FINNwKUGQ8+66SH5hxcBfQ==
X-CSE-MsgGUID: 6MxLAW4+TvK6O/IrERBN0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="52374868"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 23 Jul 2024 00:23:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sW9ri-000ljw-0X;
 Tue, 23 Jul 2024 07:23:18 +0000
Date: Tue, 23 Jul 2024 15:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next-fixes] BUILD SUCCESS
 0cf3f7297d01c6863fb5a20c3e247999824e3dde
Message-ID: <202407231515.b7niNPEd-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next-fixes
branch HEAD: 0cf3f7297d01c6863fb5a20c3e247999824e3dde  drm/xe/vf: Fix register value lookup

elapsed time: 730m

configs tested: 207
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240723   gcc-13.2.0
arc                   randconfig-002-20240723   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                          moxart_defconfig   gcc-13.2.0
arm                   randconfig-001-20240723   gcc-14.1.0
arm                   randconfig-002-20240723   gcc-14.1.0
arm                   randconfig-003-20240723   gcc-14.1.0
arm                   randconfig-004-20240723   clang-19
arm                          sp7021_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240723   gcc-14.1.0
arm64                 randconfig-002-20240723   gcc-14.1.0
arm64                 randconfig-003-20240723   clang-19
arm64                 randconfig-004-20240723   clang-16
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240723   gcc-14.1.0
csky                  randconfig-002-20240723   gcc-14.1.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240723   clang-19
hexagon               randconfig-002-20240723   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240723   gcc-8
i386         buildonly-randconfig-002-20240723   gcc-8
i386         buildonly-randconfig-003-20240723   gcc-13
i386         buildonly-randconfig-003-20240723   gcc-8
i386         buildonly-randconfig-004-20240723   gcc-12
i386         buildonly-randconfig-004-20240723   gcc-8
i386         buildonly-randconfig-005-20240723   clang-18
i386         buildonly-randconfig-005-20240723   gcc-8
i386         buildonly-randconfig-006-20240723   clang-18
i386         buildonly-randconfig-006-20240723   gcc-8
i386                                defconfig   clang-18
i386                  randconfig-001-20240723   clang-18
i386                  randconfig-001-20240723   gcc-8
i386                  randconfig-002-20240723   gcc-12
i386                  randconfig-002-20240723   gcc-8
i386                  randconfig-003-20240723   gcc-13
i386                  randconfig-003-20240723   gcc-8
i386                  randconfig-004-20240723   gcc-10
i386                  randconfig-004-20240723   gcc-8
i386                  randconfig-005-20240723   gcc-13
i386                  randconfig-005-20240723   gcc-8
i386                  randconfig-006-20240723   gcc-13
i386                  randconfig-006-20240723   gcc-8
i386                  randconfig-011-20240723   gcc-11
i386                  randconfig-011-20240723   gcc-8
i386                  randconfig-012-20240723   clang-18
i386                  randconfig-012-20240723   gcc-8
i386                  randconfig-013-20240723   clang-18
i386                  randconfig-013-20240723   gcc-8
i386                  randconfig-014-20240723   gcc-7
i386                  randconfig-014-20240723   gcc-8
i386                  randconfig-015-20240723   gcc-13
i386                  randconfig-015-20240723   gcc-8
i386                  randconfig-016-20240723   clang-18
i386                  randconfig-016-20240723   gcc-8
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch                 loongson3_defconfig   gcc-13.2.0
loongarch             randconfig-001-20240723   gcc-14.1.0
loongarch             randconfig-002-20240723   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5475evb_defconfig   gcc-13.2.0
m68k                            mac_defconfig   gcc-13.2.0
m68k                        mvme147_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                     loongson1c_defconfig   gcc-13.2.0
mips                        maltaup_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240723   gcc-14.1.0
nios2                 randconfig-002-20240723   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240723   gcc-14.1.0
parisc                randconfig-002-20240723   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      ep88xc_defconfig   gcc-13.2.0
powerpc                 mpc8313_rdb_defconfig   gcc-13.2.0
powerpc                 mpc836x_rdk_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240723   gcc-14.1.0
powerpc               randconfig-002-20240723   gcc-14.1.0
powerpc               randconfig-003-20240723   gcc-14.1.0
powerpc64             randconfig-001-20240723   gcc-14.1.0
powerpc64             randconfig-002-20240723   gcc-14.1.0
powerpc64             randconfig-003-20240723   clang-14
riscv                            allmodconfig   clang-19
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240723   gcc-14.1.0
riscv                 randconfig-002-20240723   clang-17
s390                             allmodconfig   clang-19
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240723   clang-19
s390                  randconfig-002-20240723   clang-19
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                         ap325rxa_defconfig   gcc-13.2.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240723   gcc-14.1.0
sh                    randconfig-002-20240723   gcc-14.1.0
sh                           se7724_defconfig   gcc-13.2.0
sh                           se7751_defconfig   gcc-13.2.0
sh                            shmin_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240723   gcc-14.1.0
sparc64               randconfig-002-20240723   gcc-14.1.0
um                               allmodconfig   clang-19
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240723   gcc-10
um                    randconfig-002-20240723   gcc-8
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240723   gcc-10
x86_64       buildonly-randconfig-002-20240723   gcc-10
x86_64       buildonly-randconfig-003-20240723   gcc-10
x86_64       buildonly-randconfig-004-20240723   gcc-10
x86_64       buildonly-randconfig-005-20240723   gcc-10
x86_64       buildonly-randconfig-006-20240723   gcc-10
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240723   gcc-10
x86_64                randconfig-002-20240723   gcc-10
x86_64                randconfig-003-20240723   gcc-10
x86_64                randconfig-004-20240723   gcc-10
x86_64                randconfig-005-20240723   gcc-10
x86_64                randconfig-006-20240723   gcc-10
x86_64                randconfig-011-20240723   gcc-10
x86_64                randconfig-012-20240723   gcc-10
x86_64                randconfig-013-20240723   gcc-10
x86_64                randconfig-014-20240723   gcc-10
x86_64                randconfig-015-20240723   gcc-10
x86_64                randconfig-016-20240723   gcc-10
x86_64                randconfig-071-20240723   gcc-10
x86_64                randconfig-072-20240723   gcc-10
x86_64                randconfig-073-20240723   gcc-10
x86_64                randconfig-074-20240723   gcc-10
x86_64                randconfig-075-20240723   gcc-10
x86_64                randconfig-076-20240723   gcc-10
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240723   gcc-14.1.0
xtensa                randconfig-002-20240723   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
