Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C14CA600C
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 11:52:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0B910E3C3;
	Thu,  8 Oct 2026 11:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nveI2D5g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DA110E3C3
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 11:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791460324; x=1822996324;
 h=date:from:to:cc:subject:message-id;
 bh=UacmOnYEpK7eznji0pgzxp5J4kXUYv2i2U0zUjvx+18=;
 b=nveI2D5gMzNJnNEklUE+X8Qmc99vbAjTpmBt8QMh3WheSpkb5MesdTmc
 OARcffwk/2Fm01H8TGuR2pDl2QDSPgtY38IjBmYX7vAOR7iB9uu+ILyUJ
 xe7hrIvyxOGuzYGiqY1+76f9qANPfo+han9zBxQ7IonAA2puhgbBVt1xT
 fY8FkPwpUV4puKIQlZ2t/bZbvr8TJwkJAfXxEmwia7Waj2NJhCfKy0hOT
 IN1DjeeDL1vGtUX0fBTn6T7wG0ky+OfPZA9Y/CLjM7XZerJikaGfixOeK
 d0O5DZk9YsWHMhUWrKzuZRzJQ6W7KoOdzdHo/0RZyUL60RUPbDrnJRawT g==;
X-CSE-ConnectionGUID: aWZMTRUbTMedTAop017wyg==
X-CSE-MsgGUID: XjkbxbDlS+24KMTXTxJPVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="342427"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="342427"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 04:52:04 -0700
X-CSE-ConnectionGUID: 0CVL48FHRPO+AXqSm37u7g==
X-CSE-MsgGUID: HT2asCoeQcCu+us0oBrjSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="342230"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 08 Oct 2026 04:52:03 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1xEmfI-000000004Ke-1KlN;
 Thu, 08 Oct 2026 11:52:00 +0000
Date: Thu, 08 Oct 2026 19:51:20 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 a23f27d5ec11c3f418c5e5531eea34ccda2b5b20
Message-ID: <202610081917.ZzCmM2io-lkp@intel.com>
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
branch HEAD: a23f27d5ec11c3f418c5e5531eea34ccda2b5b20  drm/xe/i2c: cancel the client work on remove

elapsed time: 2680m

configs tested: 259
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2101-20261006    gcc-9.5.0  cocci
alpha                randconfig-r2200-20261006    gcc-14.3.0 smatch
alpha                randconfig-r2309-20261006    clang-24   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261008    clang-18
arc                   randconfig-1001-20261008    clang-18
arc                  randconfig-r2105-20261006    gcc-14.3.0 cocci
arc                  randconfig-r2201-20261006    gcc-11.5.0 smatch
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                          bcm2835_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                           ep93xx_defconfig    clang-24
arm                   randconfig-1000-20261008    clang-18
arm                   randconfig-1001-20261008    clang-18
arm                   randconfig-1002-20261008    clang-18
arm                   randconfig-1003-20261008    clang-18
arm                  randconfig-r2305-20261006    gcc-8.5.0  sparse
arm                          vf610m4_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261008    gcc-10.5.0
arm64                 randconfig-1001-20261008    gcc-10.5.0
arm64                 randconfig-1002-20261008    gcc-10.5.0
arm64                 randconfig-1003-20261008    gcc-10.5.0
arm64                randconfig-r2104-20261006    gcc-14.3.0 cocci
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261008    gcc-10.5.0
csky                  randconfig-1001-20261008    gcc-10.5.0
csky                 randconfig-r2200-20261006    gcc-15.2.0 smatch
csky                 randconfig-r2304-20261006    gcc-8.5.0  sparse
hexagon                           allmodconfig    clang-24
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261008    gcc-16.1.0
hexagon               randconfig-1001-20261008    gcc-16.1.0
hexagon              randconfig-r2301-20261006    gcc-8.5.0  sparse
hexagon              randconfig-r2308-20261006    clang-24   sparse
i386                               allnoconfig    gcc-16.1.0
i386        buildonly-randconfig-1000-20261008    clang-22
i386        buildonly-randconfig-1001-20261008    clang-22
i386        buildonly-randconfig-1002-20261008    clang-22
i386        buildonly-randconfig-1003-20261008    clang-22
i386        buildonly-randconfig-1004-20261008    clang-22
i386        buildonly-randconfig-1005-20261008    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261008    gcc-14
i386                  randconfig-1001-20261008    gcc-14
i386                  randconfig-1002-20261008    gcc-14
i386                  randconfig-1003-20261008    gcc-14
i386                  randconfig-1004-20261008    gcc-14
i386                  randconfig-1005-20261008    gcc-14
i386                  randconfig-1006-20261008    gcc-14
i386                  randconfig-1007-20261008    clang-22
i386                  randconfig-1008-20261008    clang-22
i386                  randconfig-1009-20261008    clang-22
i386                  randconfig-1010-20261008    clang-22
i386                  randconfig-1011-20261008    clang-22
i386                  randconfig-1012-20261008    clang-22
i386                  randconfig-1013-20261008    clang-22
i386                  randconfig-2100-20261006    clang-22   cocci
i386                  randconfig-2101-20261006    clang-22   cocci
i386                  randconfig-2102-20261006    clang-22   cocci
i386                  randconfig-2103-20261006    clang-22   cocci
i386                  randconfig-2200-20261006    gcc-13     smatch
i386                  randconfig-2300-20261006    gcc-14     sparse
i386                  randconfig-2301-20261006    gcc-14     sparse
i386                  randconfig-2302-20261006    gcc-14     sparse
i386                 randconfig-r2105-20261006    gcc-16.1.0 cocci
i386                 randconfig-r2202-20261006    gcc-14     smatch
i386                 randconfig-r2300-20261006    gcc-14     sparse
loongarch                         allmodconfig    clang-19
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261008    gcc-16.1.0
loongarch             randconfig-1001-20261008    gcc-16.1.0
loongarch            randconfig-r2201-20261006    gcc-13.4.0 smatch
loongarch            randconfig-r2308-20261006    gcc-8.5.0  sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                          amcore_defconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    clang-24
m68k                 randconfig-r2103-20261006    gcc-9.5.0  cocci
m68k                 randconfig-r2302-20261006    gcc-14     sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2306-20261006    clang-24   sparse
microblaze           randconfig-r2307-20261006    gcc-8.5.0  sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                   cavium_octeon_defconfig    clang-24
mips                          cobalt_defconfig    gcc-16.1.0
mips                     maltaup_xpa_defconfig    gcc-16.1.0
mips                 randconfig-r2301-20261006    gcc-14     sparse
mips                 randconfig-r2303-20261006    gcc-8.5.0  sparse
nios2                             allmodconfig    clang-20
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261008    gcc-16.1.0
nios2                 randconfig-1001-20261008    gcc-16.1.0
nios2                randconfig-r2106-20261006    gcc-14.3.0 cocci
nios2                randconfig-r2306-20261006    gcc-8.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                          allmodconfig    gcc-16.1.0
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                            allyesconfig    gcc-16.1.0
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261008    gcc-8.5.0
parisc                randconfig-1001-20261008    gcc-8.5.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                       arches_defconfig    clang-24
powerpc                     ge_imp3a_defconfig    gcc-16.1.0
powerpc                       katmai_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261008    gcc-8.5.0
powerpc               randconfig-1001-20261008    gcc-8.5.0
powerpc              randconfig-r2104-20261006    gcc-16.1.0 cocci
powerpc              randconfig-r2107-20261006    gcc-16.1.0 cocci
powerpc64                         alldefconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261008    gcc-8.5.0
powerpc64             randconfig-1001-20261008    gcc-8.5.0
powerpc64            randconfig-r2102-20261006    gcc-9.5.0  cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261008    gcc-10.5.0
riscv                 randconfig-1001-20261008    gcc-10.5.0
riscv                 randconfig-2000-20261006    gcc-16.1.0
riscv                 randconfig-2001-20261006    gcc-16.1.0
s390                              allmodconfig    clang-17
s390                              allmodconfig    clang-24
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261008    gcc-10.5.0
s390                  randconfig-1001-20261008    gcc-10.5.0
s390                  randconfig-2000-20261006    gcc-16.1.0
s390                  randconfig-2001-20261006    gcc-16.1.0
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                allyesconfig    gcc-16.1.0
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261008    gcc-10.5.0
sh                    randconfig-1001-20261008    gcc-10.5.0
sh                    randconfig-2000-20261006    gcc-16.1.0
sh                    randconfig-2001-20261006    gcc-16.1.0
sh                   randconfig-r2107-20261006    gcc-14.3.0 cocci
sh                   randconfig-r2302-20261006    gcc-8.5.0  sparse
sh                    sh7770_generic_defconfig    clang-24
sh                             shmin_defconfig    clang-24
sh                               ul2_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261008    gcc-14
sparc                 randconfig-1001-20261008    gcc-14
sparc                 randconfig-2000-20261006    clang-24
sparc                 randconfig-2001-20261006    clang-24
sparc                randconfig-r2300-20261006    gcc-8.5.0  sparse
sparc                randconfig-r2304-20261006    gcc-14     sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261008    gcc-14
sparc64               randconfig-1001-20261008    gcc-14
sparc64               randconfig-2000-20261006    clang-24
sparc64               randconfig-2001-20261006    clang-24
sparc64              randconfig-r2100-20261006    gcc-9.5.0  cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-14
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261008    gcc-14
um                    randconfig-1001-20261008    gcc-14
um                    randconfig-2000-20261006    clang-24
um                    randconfig-2001-20261006    clang-24
um                   randconfig-r2202-20261006    clang-24   smatch
um                   randconfig-r2303-20261006    gcc-14     sparse
um                   randconfig-r2305-20261006    gcc-14     sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261008    gcc-14
x86_64      buildonly-randconfig-1001-20261008    gcc-14
x86_64      buildonly-randconfig-1002-20261008    gcc-14
x86_64      buildonly-randconfig-1003-20261008    gcc-14
x86_64      buildonly-randconfig-1004-20261008    gcc-14
x86_64      buildonly-randconfig-1005-20261008    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261008    gcc-14
x86_64                randconfig-1001-20261008    gcc-14
x86_64                randconfig-1002-20261008    gcc-14
x86_64                randconfig-1003-20261008    gcc-14
x86_64                randconfig-1004-20261008    gcc-14
x86_64                randconfig-1005-20261008    gcc-14
x86_64                randconfig-1006-20261008    clang-22
x86_64                randconfig-1007-20261008    clang-22
x86_64                randconfig-1008-20261008    clang-22
x86_64                randconfig-1009-20261008    clang-22
x86_64                randconfig-1010-20261008    clang-22
x86_64                randconfig-1011-20261008    clang-22
x86_64                randconfig-1012-20261008    clang-22
x86_64                randconfig-1013-20261008    clang-22
x86_64                randconfig-1014-20261008    clang-22
x86_64                randconfig-1015-20261008    clang-22
x86_64                randconfig-1016-20261008    clang-22
x86_64                randconfig-1017-20261008    clang-22
x86_64                randconfig-2100-20261006    clang-22   cocci
x86_64                randconfig-2101-20261006    clang-22   cocci
x86_64                randconfig-2102-20261006    clang-22   cocci
x86_64                randconfig-2103-20261006    clang-22   cocci
x86_64                randconfig-2200-20261006    clang-22   smatch
x86_64                randconfig-2300-20261006    gcc-14     sparse
x86_64                randconfig-2301-20261006    gcc-14     sparse
x86_64                randconfig-2302-20261006    gcc-14     sparse
x86_64               randconfig-r2106-20261006    gcc-16.1.0 cocci
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                            allyesconfig    gcc-16.1.0
xtensa                   audio_kc705_defconfig    clang-24
xtensa                randconfig-1000-20261008    gcc-14
xtensa                randconfig-1001-20261008    gcc-14
xtensa                randconfig-2000-20261006    clang-24
xtensa                randconfig-2001-20261006    clang-24
xtensa               randconfig-r2307-20261006    clang-24   sparse
xtensa               randconfig-r2309-20261006    gcc-8.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
