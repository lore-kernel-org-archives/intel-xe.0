Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB41C27C4F
	for <intel-xe@archiver.kernel.org>; Sun, 30 Jun 2024 13:10:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4C110E060;
	Sun, 30 Jun 2024 13:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihXpAo+l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A75C10E060
 for <intel-xe@lists.freedesktop.org>; Sun, 30 Jun 2024 13:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719753046; x=1751289046;
 h=date:from:to:cc:subject:message-id;
 bh=vHr9vygwvPfb5lGrIkf5MDVzzSRqBI+CsXSZjgEx6N4=;
 b=ihXpAo+lCZpCKL7CNgfy9LjxpeuTeTbXEPVfMS+j5JUot1LkgK8qinBM
 B12Y+qDf0a41tO2Iy8Aig3myMbmLsIubRVcVaEOUJFZfgX98h5FBWHlZL
 NI6QZMWwHGycPWNqwRsEGLUl8KnRQij+GVswCbUmq/Q2TlU5X34E4abkB
 dlaDhm03R+ix/2BgCHrtYkfYAUi8CI/d4aP9sIVLrrKrmbnmwo1P5cULA
 wnapvL8AG6HHyKEoGVUZxc6HHwBULcJiw/vIQsQpQSqGMleCeF/9zu3lJ
 xbrQ1l7ba0LMc00LGNetuDEiycNgwjY9UinZN9iXVOuK14HiwMf/2gTms w==;
X-CSE-ConnectionGUID: YRjAqPhfTtiq4O5HGpVDAg==
X-CSE-MsgGUID: +q4KKpuOTQ6Bfo9pqf5+jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="12323941"
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; d="scan'208";a="12323941"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 06:10:45 -0700
X-CSE-ConnectionGUID: V/TPfdAeTAi6+M99J0uHrw==
X-CSE-MsgGUID: SZ9phzmaRi6jUiowkced2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; d="scan'208";a="50421426"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 30 Jun 2024 06:10:45 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sNuKI-000LeY-1H;
 Sun, 30 Jun 2024 13:10:42 +0000
Date: Sun, 30 Jun 2024 21:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 4f82ac6102788112e599a6074d2c1f2afce923df
Message-ID: <202406302142.9wmKBBVP-lkp@intel.com>
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
branch HEAD: 4f82ac6102788112e599a6074d2c1f2afce923df  drm/xe/mcr: Avoid clobbering DSS steering

elapsed time: 2385m

configs tested: 66
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                   randconfig-001-20240630   gcc-13.2.0
arc                   randconfig-002-20240630   gcc-13.2.0
arc                    vdk_hs38_smp_defconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                          collie_defconfig   gcc-13.2.0
arm                          exynos_defconfig   clang-17
arm                       imx_v6_v7_defconfig   clang-19
arm                   randconfig-001-20240630   gcc-13.2.0
arm                   randconfig-002-20240630   clang-17
arm                   randconfig-003-20240630   clang-19
arm64                            alldefconfig   gcc-13.2.0
arm64                 randconfig-001-20240630   clang-15
csky                              allnoconfig   gcc-13.2.0
i386         buildonly-randconfig-001-20240629   gcc-7
i386         buildonly-randconfig-001-20240630   clang-18
i386         buildonly-randconfig-002-20240629   gcc-7
i386         buildonly-randconfig-002-20240630   clang-18
i386         buildonly-randconfig-003-20240629   gcc-7
i386         buildonly-randconfig-003-20240630   clang-18
i386         buildonly-randconfig-004-20240629   gcc-7
i386         buildonly-randconfig-004-20240630   clang-18
i386         buildonly-randconfig-005-20240629   gcc-7
i386         buildonly-randconfig-005-20240630   clang-18
i386         buildonly-randconfig-006-20240629   gcc-7
i386         buildonly-randconfig-006-20240630   clang-18
i386                  randconfig-001-20240629   gcc-7
i386                  randconfig-001-20240630   clang-18
i386                  randconfig-002-20240629   gcc-7
i386                  randconfig-002-20240630   clang-18
i386                  randconfig-003-20240629   gcc-7
i386                  randconfig-003-20240630   clang-18
i386                  randconfig-004-20240629   gcc-7
i386                  randconfig-004-20240630   clang-18
i386                  randconfig-005-20240629   gcc-7
i386                  randconfig-005-20240630   clang-18
i386                  randconfig-006-20240629   gcc-7
i386                  randconfig-006-20240630   clang-18
i386                  randconfig-011-20240629   gcc-7
i386                  randconfig-011-20240630   clang-18
i386                  randconfig-012-20240629   gcc-7
i386                  randconfig-012-20240630   clang-18
i386                  randconfig-013-20240629   gcc-7
i386                  randconfig-013-20240630   clang-18
i386                  randconfig-014-20240629   gcc-7
i386                  randconfig-014-20240630   clang-18
i386                  randconfig-015-20240629   gcc-7
i386                  randconfig-015-20240630   clang-18
i386                  randconfig-016-20240629   gcc-7
i386                  randconfig-016-20240630   clang-18
m68k                             allmodconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                            q40_defconfig   gcc-13.2.0
mips                     decstation_defconfig   gcc-13.2.0
mips                malta_qemu_32r6_defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                    ge_imp3a_defconfig   gcc-13.2.0
powerpc                      pcm030_defconfig   clang-19
powerpc                     redwood_defconfig   clang-19
riscv                             allnoconfig   gcc-13.2.0
s390                              allnoconfig   gcc-13.2.0
sh                           se7705_defconfig   gcc-13.2.0
um                                allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
