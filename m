Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1490DD6CFAC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 01:27:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A200210EBFE;
	Fri, 23 Jan 2026 01:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FO8JqIPD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0569A10E18B
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 01:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769131649; x=1800667649;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=5XbHhhdJ0nM/3UQPfLEF8ZxtblHly45d13JmwXx/2Wg=;
 b=FO8JqIPDJ0noEjNwywQ5hPeZmyn3dGWY2Y5s+wchECjwni6H+H8sRq3t
 b6JL8jfuAWJeiyjmAfQfmgHzvTmJyrhMEdvFAK3j4Zg4AQBr1gGs3qMZT
 6Iymk2Ud6jOVJaYxE8RIfpLuP5Zp5S9CCqpI5perByO3+Rd9JHQSi940I
 ugKrYEU/mchM9RVpNsxoFbu+dpjI2p9VvqPd+IlD+aK0KAUu5+BQHz7hM
 8T+OKuSs1ZSCpGoX6gMd5uPnv+uPUF6tVlzrB7/inJn4gHIQDIPpiJFwW
 wZ/YUmIHm2RXk2eSiJWBgwekDxo3UdjXCFq/piPSiBh/G8aIeZcVhIsAt w==;
X-CSE-ConnectionGUID: fmz4Jf2bRVCPBGn+6TgDaQ==
X-CSE-MsgGUID: BY7CVLl8S52+ZchpXXV0Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81010926"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; d="scan'208";a="81010926"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 17:27:29 -0800
X-CSE-ConnectionGUID: HE3vcHxWQXq3vEDNDL3Zrw==
X-CSE-MsgGUID: 9xICww/NQW2vA9AGyNDBrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; d="scan'208";a="207145357"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 22 Jan 2026 17:27:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vj5xN-00000000TP4-0Bk8;
 Fri, 23 Jan 2026 01:27:25 +0000
Date: Fri, 23 Jan 2026 09:26:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 e27ada4f19e7ffda4c05ce8633daf6daed667eea
Message-ID: <202601230926.WUT9TEYW-lkp@intel.com>
User-Agent: s-nail v14.9.25
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
branch HEAD: e27ada4f19e7ffda4c05ce8633daf6daed667eea  drm/xe: Select CONFIG_DEVICE_PRIVATE when DRM_XE_GPUSVM is selected

elapsed time: 810m

configs tested: 258
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260122    gcc-14.3.0
arc                   randconfig-001-20260122    gcc-15.2.0
arc                   randconfig-001-20260123    gcc-10.5.0
arc                   randconfig-002-20260122    gcc-15.2.0
arc                   randconfig-002-20260123    gcc-10.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                         nhk8815_defconfig    clang-22
arm                           omap1_defconfig    clang-22
arm                   randconfig-001-20260122    clang-22
arm                   randconfig-001-20260122    gcc-15.2.0
arm                   randconfig-001-20260123    gcc-10.5.0
arm                   randconfig-002-20260122    gcc-11.5.0
arm                   randconfig-002-20260122    gcc-15.2.0
arm                   randconfig-002-20260123    gcc-10.5.0
arm                   randconfig-003-20260122    gcc-15.2.0
arm                   randconfig-003-20260123    gcc-10.5.0
arm                   randconfig-004-20260122    gcc-13.4.0
arm                   randconfig-004-20260122    gcc-15.2.0
arm                   randconfig-004-20260123    gcc-10.5.0
arm                           sama7_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260122    clang-20
hexagon               randconfig-001-20260123    gcc-12.5.0
hexagon               randconfig-002-20260122    clang-22
hexagon               randconfig-002-20260123    gcc-12.5.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260122    clang-20
i386        buildonly-randconfig-001-20260123    clang-20
i386        buildonly-randconfig-002-20260122    clang-20
i386        buildonly-randconfig-002-20260123    clang-20
i386        buildonly-randconfig-003-20260122    clang-20
i386        buildonly-randconfig-003-20260123    clang-20
i386        buildonly-randconfig-004-20260122    clang-20
i386        buildonly-randconfig-004-20260123    clang-20
i386        buildonly-randconfig-005-20260122    clang-20
i386        buildonly-randconfig-005-20260123    clang-20
i386        buildonly-randconfig-006-20260122    clang-20
i386        buildonly-randconfig-006-20260123    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260122    gcc-14
i386                  randconfig-002-20260122    clang-20
i386                  randconfig-002-20260122    gcc-14
i386                  randconfig-003-20260122    gcc-12
i386                  randconfig-003-20260122    gcc-14
i386                  randconfig-004-20260122    gcc-14
i386                  randconfig-005-20260122    gcc-14
i386                  randconfig-006-20260122    gcc-14
i386                  randconfig-007-20260122    gcc-14
i386                  randconfig-011-20260122    clang-20
i386                  randconfig-012-20260122    clang-20
i386                  randconfig-013-20260122    clang-20
i386                  randconfig-014-20260122    clang-20
i386                  randconfig-015-20260122    clang-20
i386                  randconfig-016-20260122    clang-20
i386                  randconfig-017-20260122    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260122    gcc-15.2.0
loongarch             randconfig-001-20260123    gcc-12.5.0
loongarch             randconfig-002-20260122    gcc-15.2.0
loongarch             randconfig-002-20260123    gcc-12.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                       m5275evb_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          eyeq5_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260122    gcc-11.5.0
nios2                 randconfig-001-20260123    gcc-12.5.0
nios2                 randconfig-002-20260122    gcc-8.5.0
nios2                 randconfig-002-20260123    gcc-12.5.0
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
parisc                randconfig-001-20260122    gcc-10.5.0
parisc                randconfig-001-20260123    gcc-12.5.0
parisc                randconfig-002-20260122    gcc-10.5.0
parisc                randconfig-002-20260123    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     powernv_defconfig    clang-22
powerpc               randconfig-001-20260122    gcc-10.5.0
powerpc               randconfig-001-20260123    gcc-12.5.0
powerpc               randconfig-002-20260122    gcc-10.5.0
powerpc               randconfig-002-20260123    gcc-12.5.0
powerpc64             randconfig-001-20260122    gcc-10.5.0
powerpc64             randconfig-001-20260123    gcc-12.5.0
powerpc64             randconfig-002-20260122    gcc-10.5.0
powerpc64             randconfig-002-20260123    gcc-12.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260122    clang-18
riscv                 randconfig-002-20260122    clang-18
riscv                 randconfig-002-20260122    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260122    clang-18
s390                  randconfig-001-20260122    gcc-8.5.0
s390                  randconfig-002-20260122    clang-18
s390                  randconfig-002-20260122    clang-22
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260122    clang-18
sh                    randconfig-001-20260122    gcc-15.2.0
sh                    randconfig-002-20260122    clang-18
sh                    randconfig-002-20260122    gcc-11.5.0
sh                           se7206_defconfig    clang-22
sh                             sh03_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260122    gcc-8.5.0
sparc                 randconfig-001-20260123    gcc-13.4.0
sparc                 randconfig-002-20260122    gcc-8.5.0
sparc                 randconfig-002-20260123    gcc-13.4.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260122    gcc-8.5.0
sparc64               randconfig-001-20260123    gcc-13.4.0
sparc64               randconfig-002-20260122    gcc-8.5.0
sparc64               randconfig-002-20260123    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260122    gcc-8.5.0
um                    randconfig-001-20260123    gcc-13.4.0
um                    randconfig-002-20260122    gcc-8.5.0
um                    randconfig-002-20260123    gcc-13.4.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260122    clang-20
x86_64      buildonly-randconfig-001-20260123    clang-20
x86_64      buildonly-randconfig-002-20260122    clang-20
x86_64      buildonly-randconfig-002-20260123    clang-20
x86_64      buildonly-randconfig-003-20260122    clang-20
x86_64      buildonly-randconfig-003-20260123    clang-20
x86_64      buildonly-randconfig-004-20260122    clang-20
x86_64      buildonly-randconfig-004-20260122    gcc-14
x86_64      buildonly-randconfig-004-20260123    clang-20
x86_64      buildonly-randconfig-005-20260122    clang-20
x86_64      buildonly-randconfig-005-20260123    clang-20
x86_64      buildonly-randconfig-006-20260122    clang-20
x86_64      buildonly-randconfig-006-20260123    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260122    clang-20
x86_64                randconfig-001-20260123    gcc-14
x86_64                randconfig-002-20260122    clang-20
x86_64                randconfig-002-20260123    gcc-14
x86_64                randconfig-003-20260122    clang-20
x86_64                randconfig-003-20260123    gcc-14
x86_64                randconfig-004-20260122    clang-20
x86_64                randconfig-004-20260123    gcc-14
x86_64                randconfig-005-20260122    clang-20
x86_64                randconfig-005-20260123    gcc-14
x86_64                randconfig-006-20260122    clang-20
x86_64                randconfig-006-20260123    gcc-14
x86_64                randconfig-011-20260122    clang-20
x86_64                randconfig-011-20260123    gcc-14
x86_64                randconfig-012-20260122    clang-20
x86_64                randconfig-012-20260123    gcc-14
x86_64                randconfig-013-20260122    clang-20
x86_64                randconfig-013-20260123    gcc-14
x86_64                randconfig-014-20260122    clang-20
x86_64                randconfig-014-20260123    gcc-14
x86_64                randconfig-015-20260122    clang-20
x86_64                randconfig-015-20260123    gcc-14
x86_64                randconfig-016-20260122    clang-20
x86_64                randconfig-016-20260123    gcc-14
x86_64                randconfig-071-20260123    clang-20
x86_64                randconfig-072-20260123    clang-20
x86_64                randconfig-073-20260123    clang-20
x86_64                randconfig-074-20260123    clang-20
x86_64                randconfig-075-20260123    clang-20
x86_64                randconfig-076-20260123    clang-20
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
xtensa                randconfig-001-20260122    gcc-8.5.0
xtensa                randconfig-001-20260123    gcc-13.4.0
xtensa                randconfig-002-20260122    gcc-8.5.0
xtensa                randconfig-002-20260123    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
