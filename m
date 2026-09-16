Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C6FC982C3
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 15:12:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828FA10E27B;
	Wed, 16 Sep 2026 15:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhhRHMOo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B850510E27B
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 15:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789571570; x=1821107570;
 h=date:from:to:cc:subject:message-id;
 bh=Mei+pnuVqmS+zpb7zgHpSKJhShHkKAPtQS2LbI7NiMk=;
 b=bhhRHMOoush25uwQ5l+E2Qp+72VPvb5qLM0e9Q4fwfizdMRm/yPwvncT
 djAnrGY67bihQvYv2SOjeJ+j3nmfihRynY5JJCpmpjhTuHlplxMNQWNWo
 DCu1rFJh0pquho5kiMgEbK24VYhFHrwcsK2B8qhA3cun6rJ6N3kpWXh/W
 ahSRi2vq2uUPbagtA6ceImF3zx1sEE/vlP5l1HKMGqV3plm0ogPjIhCqx
 TZKrecbJkCgpbNcCBdZ+4Rkl/qcph0QoyoQk17NGWoBZ6+7THxTKUqvKF
 vi7HRl3G39j8+4HBAEA6l88KH1YB+Bti6BqjMAAjPlqddAaXW1Olk3ZKX w==;
X-CSE-ConnectionGUID: BT5fqjaSQEyeBpSW/XusnA==
X-CSE-MsgGUID: jd0ZhLmYQH+KzFmZrJMHAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93821830"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93821830"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 08:12:45 -0700
X-CSE-ConnectionGUID: 3wRChzF6S529XjY2CZ+TfQ==
X-CSE-MsgGUID: Xg6aOydzRxiRihWIIMQIEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="278597293"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 16 Sep 2026 08:12:43 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1x6rJQ-000000006H3-3QA8;
 Wed, 16 Sep 2026 15:12:40 +0000
Date: Wed, 16 Sep 2026 23:11:55 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 9c8ed392385177546fdd65e4463e292f0f647c6c
Message-ID: <202609162350.fzeGh13N-lkp@intel.com>
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
branch HEAD: 9c8ed392385177546fdd65e4463e292f0f647c6c  drm/xe/pf: Add _locked variant of the fair sched config function

elapsed time: 2706m

configs tested: 218
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                 randconfig-r073-20260915    gcc-14.3.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-r071-20260915    gcc-14.3.0
arc                  randconfig-r1300-20260916    gcc-14     sparse
arc                            tb10x_defconfig    clang-17
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                              mxs_defconfig    clang-17
arm                          orion5x_defconfig    clang-17
arm                   randconfig-r052-20260915    gcc-9.5.0
arm                   randconfig-r061-20260915    clang-22
arm                   randconfig-r062-20260915    clang-24
arm                  randconfig-r1306-20260916    clang-18   sparse
arm                  randconfig-r1308-20260916    clang-18   sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260916    gcc-14.3.0
arm64                 randconfig-1001-20260916    gcc-14.3.0
arm64                 randconfig-1002-20260916    gcc-14.3.0
arm64                 randconfig-1003-20260916    gcc-14.3.0
arm64                 randconfig-r064-20260915    clang-22
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260916    gcc-14.3.0
csky                  randconfig-1001-20260916    gcc-14.3.0
csky                  randconfig-r054-20260915    gcc-15.2.0
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260916    gcc-16.1.0
hexagon               randconfig-1001-20260916    gcc-16.1.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260916    clang-22
i386        buildonly-randconfig-1001-20260916    clang-22
i386        buildonly-randconfig-1002-20260916    clang-22
i386        buildonly-randconfig-1003-20260916    clang-22
i386        buildonly-randconfig-1004-20260916    clang-22
i386        buildonly-randconfig-1005-20260916    clang-22
i386                                 defconfig    gcc-16.1.0
i386                   randconfig-051-20260915    clang-22
i386                   randconfig-052-20260915    clang-22
i386                   randconfig-053-20260915    clang-22
i386                   randconfig-054-20260915    clang-22
i386                  randconfig-1000-20260916    gcc-14
i386                  randconfig-1001-20260916    gcc-14
i386                  randconfig-1002-20260916    gcc-14
i386                  randconfig-1003-20260916    gcc-14
i386                  randconfig-1004-20260916    gcc-14
i386                  randconfig-1005-20260916    gcc-14
i386                  randconfig-1006-20260916    gcc-14
i386                  randconfig-1007-20260916    clang-22
i386                  randconfig-1008-20260916    clang-22
i386                  randconfig-1009-20260916    clang-22
i386                  randconfig-1010-20260916    clang-22
i386                  randconfig-1011-20260916    clang-22
i386                  randconfig-1012-20260916    clang-22
i386                  randconfig-1013-20260916    clang-22
i386                  randconfig-1300-20260916    clang-22   sparse
i386                  randconfig-1301-20260916    clang-22   sparse
i386                  randconfig-1302-20260916    clang-22   sparse
i386                   randconfig-141-20260915    clang-22
i386                  randconfig-r051-20260915    gcc-9.5.0
i386                 randconfig-r1301-20260916    gcc-14     sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260916    gcc-16.1.0
loongarch             randconfig-1001-20260916    gcc-16.1.0
loongarch             randconfig-r052-20260915    gcc-15.2.0
loongarch             randconfig-r054-20260915    clang-22
loongarch             randconfig-r062-20260915    gcc-13
loongarch            randconfig-r1305-20260916    gcc-14     sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5282evb_defconfig    clang-17
m68k                  randconfig-r061-20260915    clang-24
m68k                  randconfig-r064-20260915    gcc-13
m68k                 randconfig-r1303-20260916    gcc-14     sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze            randconfig-r053-20260915    clang-22
microblaze            randconfig-r053-20260915    gcc-9.5.0
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                  randconfig-r054-20260915    gcc-9.5.0
mips                    sb1250_swarm_defconfig    clang-17
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260916    gcc-16.1.0
nios2                 randconfig-1001-20260916    gcc-16.1.0
nios2                 randconfig-r063-20260915    gcc-13
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260916    gcc-10.5.0
parisc                randconfig-1001-20260916    gcc-10.5.0
parisc                randconfig-r072-20260915    gcc-8.5.0
parisc               randconfig-r1304-20260916    gcc-14     sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc               randconfig-1000-20260916    gcc-10.5.0
powerpc               randconfig-1001-20260916    gcc-10.5.0
powerpc               randconfig-r053-20260915    gcc-15.2.0
powerpc               randconfig-r063-20260915    clang-24
powerpc               randconfig-r064-20260915    clang-24
powerpc               randconfig-r072-20260915    gcc-9.5.0
powerpc              randconfig-r1307-20260916    clang-18   sparse
powerpc64             randconfig-1000-20260916    gcc-10.5.0
powerpc64             randconfig-1001-20260916    gcc-10.5.0
powerpc64             randconfig-r071-20260915    gcc-10.5.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-r051-20260915    gcc-15.2.0
s390                  randconfig-r063-20260915    clang-22
s390                  randconfig-r072-20260915    gcc-9.5.0
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                              espt_defconfig    clang-17
sh                    randconfig-r051-20260915    clang-22
sh                              shx3_defconfig    clang-17
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260916    clang-24
sparc                 randconfig-1001-20260916    clang-24
sparc                randconfig-r1309-20260916    clang-18   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260916    clang-24
sparc64               randconfig-1001-20260916    clang-24
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260916    clang-24
um                    randconfig-1001-20260916    clang-24
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260916    gcc-14
x86_64      buildonly-randconfig-1001-20260916    gcc-14
x86_64      buildonly-randconfig-1002-20260916    gcc-14
x86_64      buildonly-randconfig-1003-20260916    gcc-14
x86_64      buildonly-randconfig-1004-20260916    gcc-14
x86_64      buildonly-randconfig-1005-20260916    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260916    clang-22
x86_64                randconfig-1001-20260916    clang-22
x86_64                randconfig-1002-20260916    clang-22
x86_64                randconfig-1003-20260916    clang-22
x86_64                randconfig-1004-20260916    clang-22
x86_64                randconfig-1005-20260916    clang-22
x86_64                randconfig-1006-20260916    clang-22
x86_64                randconfig-1007-20260916    clang-22
x86_64                randconfig-1008-20260916    clang-22
x86_64                randconfig-1009-20260916    clang-22
x86_64                 randconfig-101-20260915    clang-22
x86_64                randconfig-1010-20260916    clang-22
x86_64                randconfig-1011-20260916    clang-22
x86_64                 randconfig-102-20260915    clang-22
x86_64                 randconfig-103-20260915    clang-22
x86_64                 randconfig-104-20260915    clang-22
x86_64                randconfig-1300-20260916    clang-22   sparse
x86_64                randconfig-1301-20260916    clang-22   sparse
x86_64                randconfig-1302-20260916    clang-22   sparse
x86_64                 randconfig-161-20260915    clang-22
x86_64                randconfig-r052-20260915    clang-22
x86_64                randconfig-r061-20260915    gcc-13
x86_64                randconfig-r062-20260915    clang-22
x86_64                randconfig-r071-20260915    clang-22
x86_64                randconfig-r073-20260915    gcc-14
x86_64               randconfig-r1302-20260916    gcc-14     sparse
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
xtensa                randconfig-1000-20260916    clang-24
xtensa                randconfig-1001-20260916    clang-24

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
