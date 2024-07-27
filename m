Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFE4C3DA4A
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 07:50:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F3B10E037;
	Sat, 27 Jul 2024 07:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YLWgtNL0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69C510E037
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jul 2024 07:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722066620; x=1753602620;
 h=date:from:to:cc:subject:message-id;
 bh=FcHtKpOoxSEJX8L9gJ+N48y7iKCk9D6FWEKJ/j12w0g=;
 b=YLWgtNL0uiUGrmn0YbTe9OAs4kFD9MXKiXfWRG8aRtX/foe5+uo3V8Qb
 ZCZhPc12n9T0OkxvU+cckTzZ/08DSYtaaw/+28GmbPoCXc1FSkxq0qZDn
 x9fR+mhzCPJ2cTYq/1XmWDsJD5yYUYCC4J/xJFbmxed7V2EKUFe+QWKW/
 avSof0u5EVcSaGUnIktAeXNeiRBc67TqNt7lsra5qMYe7KhtV4wCMqOO+
 CbEg9Q827im48kPg0CpCD1vce/Ks3Y3886ZaxT4WlUi20IIVGMuJD5Xor
 F/5WbMriwWFgh1ZOTiCT1Spg5riCeVr/qlXdLSd3heZdCPP5mp0UFciN2 w==;
X-CSE-ConnectionGUID: Ct8toTMbRt24TCIG86LtpQ==
X-CSE-MsgGUID: c/TGg0Q2QZSz7YrWlMr4zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="37335710"
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; d="scan'208";a="37335710"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2024 00:50:20 -0700
X-CSE-ConnectionGUID: FajDSEToSCKirG4/0Q6PcQ==
X-CSE-MsgGUID: GySRvF+USF+70bjrKJzOkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; d="scan'208";a="84440158"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 27 Jul 2024 00:50:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sXcC0-000pjU-28;
 Sat, 27 Jul 2024 07:50:16 +0000
Date: Sat, 27 Jul 2024 15:49:49 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 fd6797ec50c561f085bc94e3ee26f484a52af79e
Message-ID: <202407271546.bVtwy2jy-lkp@intel.com>
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
branch HEAD: fd6797ec50c561f085bc94e3ee26f484a52af79e  drm/xe/rtp: Fix off-by-one when processing rules

elapsed time: 730m

configs tested: 94
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                     nsimosci_hs_defconfig   gcc-13.2.0
arc                   randconfig-001-20240727   gcc-13.2.0
arc                   randconfig-002-20240727   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                            mmp2_defconfig   gcc-14.1.0
arm                          pxa910_defconfig   gcc-14.1.0
arm                   randconfig-001-20240727   gcc-14.1.0
arm                   randconfig-002-20240727   gcc-14.1.0
arm                   randconfig-003-20240727   clang-17
arm                   randconfig-004-20240727   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240727   clang-20
arm64                 randconfig-002-20240727   gcc-14.1.0
arm64                 randconfig-003-20240727   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240727   gcc-13
i386         buildonly-randconfig-002-20240727   clang-18
i386         buildonly-randconfig-003-20240727   gcc-8
i386         buildonly-randconfig-004-20240727   gcc-10
i386         buildonly-randconfig-005-20240727   clang-18
i386         buildonly-randconfig-006-20240727   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240727   clang-18
i386                  randconfig-002-20240727   gcc-8
i386                  randconfig-003-20240727   clang-18
i386                  randconfig-004-20240727   clang-18
i386                  randconfig-005-20240727   clang-18
i386                  randconfig-006-20240727   gcc-13
i386                  randconfig-011-20240727   gcc-13
i386                  randconfig-012-20240727   gcc-13
i386                  randconfig-013-20240727   gcc-11
i386                  randconfig-014-20240727   gcc-13
i386                  randconfig-015-20240727   clang-18
i386                  randconfig-016-20240727   gcc-7
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240727   gcc-8
x86_64       buildonly-randconfig-002-20240727   gcc-13
x86_64       buildonly-randconfig-003-20240727   gcc-13
x86_64       buildonly-randconfig-004-20240727   gcc-13
x86_64       buildonly-randconfig-005-20240727   clang-18
x86_64       buildonly-randconfig-006-20240727   gcc-13
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240727   gcc-13
x86_64                randconfig-002-20240727   clang-18
x86_64                randconfig-003-20240727   clang-18
x86_64                randconfig-004-20240727   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
