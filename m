Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9ED4C4167B
	for <intel-xe@archiver.kernel.org>; Sat,  9 Dec 2023 20:56:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED1610E262;
	Sat,  9 Dec 2023 20:56:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FD610E262
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Dec 2023 20:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702155376; x=1733691376;
 h=date:from:to:cc:subject:message-id;
 bh=wia8VaaU9tvNv5EWUv7TK1/jyOLOOqu0Js0qjflv5FY=;
 b=P5tRsOctI0P7Sd7Vb2CI9+7yEFpQeEZKdR6ADIBMdCNbrst1H1fjSdzP
 NCr7oKhKQcK4X+YUDUyt/83+zYJEkGZ8/UOuFHaPJm2X4E8YtZ2zozYOs
 uuMZPPTFSyxWrt+V6ADmdbt9tbDy9SW0jq6JKiGLzzml2zj6RrwmnfUI8
 KUzp6YWgHIfFrg0o3ovbY86LlFS9XkBUsIAY/KXhzYBn6MlmTQjVrD/By
 uAy7nEvdxkh+EknPQn6SJRb2KByHrgAU7aUDISa10tN2BykLa/2n0Hnkb
 4xU0rwsWS7h8lNmyOtkrBauozCURs9ez5HN/okyh/3oWnemd3bFGsCQVE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="374033600"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; d="scan'208";a="374033600"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2023 12:56:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="890565318"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; d="scan'208";a="890565318"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2023 12:56:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rC4Mu-000FwS-1W;
 Sat, 09 Dec 2023 20:56:12 +0000
Date: Sun, 10 Dec 2023 04:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [drm-xe:drm-xe-next] BUILD REGRESSION
 1fc141d1f445b8e5ab4ff14645b0482dd98460b9
Message-ID: <202312100417.gJ806aqC-lkp@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: 1fc141d1f445b8e5ab4ff14645b0482dd98460b9  drm/xe: Add frequency throttle reasons sysfs attributes

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202312092339.jUV164nY-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202312100223.2IyYhSLJ-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:55:10: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/gpu/drm/xe/xe_gt_freq.c:202:30: warning: variable 'err' is uninitialized when used here [-Wuninitialized]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm-randconfig-003-20231210
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-nvme-common-nvme-common.o
|-- arm64-randconfig-001-20231210
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-nomadik-rng.o
|-- i386-buildonly-randconfig-006-20231209
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-bridge-test.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-mgr-test.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-region-test.o
|-- i386-randconfig-002-20231209
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-bridge-test.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-mgr-test.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-region-test.o
|-- nios2-randconfig-002-20231210
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-nomadik-rng.o
|-- parisc-randconfig-001-20231210
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-nomadik-rng.o
|-- s390-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-nomadik-rng.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-st-rng.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-nvme-common-nvme-common.o
|-- sparc-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:CTX_VALID-redefined
|-- sparc64-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:CTX_VALID-redefined
|-- sparc64-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:CTX_VALID-redefined
`-- x86_64-allnoconfig
    `-- drivers-gpu-drm-xe-tests-xe_pci.c:kunit-test-bug.h-is-included-more-than-once.
clang_recent_errors
|-- hexagon-randconfig-002-20231210
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-bridge-test.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-mgr-test.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-region-test.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-nvme-common-nvme-common.o
`-- i386-allmodconfig
    |-- drivers-gpu-drm-xe-compat-i915-headers-gem-i915_gem_object.h:error:call-to-undeclared-function-readq-ISO-C99-and-later-do-not-support-implicit-function-declarations
    `-- drivers-gpu-drm-xe-xe_gt_freq.c:warning:variable-err-is-uninitialized-when-used-here

elapsed time: 1473m

configs tested: 58
configs skipped: 0

tested configs:
arc                   randconfig-001-20231210   gcc  
arc                   randconfig-002-20231210   gcc  
arm                   randconfig-001-20231210   gcc  
arm                   randconfig-002-20231210   gcc  
arm                   randconfig-003-20231210   gcc  
arm                   randconfig-004-20231210   gcc  
arm64                 randconfig-001-20231210   gcc  
arm64                 randconfig-002-20231210   gcc  
arm64                 randconfig-003-20231210   gcc  
arm64                 randconfig-004-20231210   gcc  
csky                  randconfig-001-20231210   gcc  
csky                  randconfig-002-20231210   gcc  
hexagon               randconfig-001-20231210   clang
hexagon               randconfig-002-20231210   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231209   gcc  
i386         buildonly-randconfig-002-20231209   gcc  
i386         buildonly-randconfig-003-20231209   gcc  
i386         buildonly-randconfig-004-20231209   gcc  
i386         buildonly-randconfig-005-20231209   gcc  
i386         buildonly-randconfig-006-20231209   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231209   gcc  
i386                  randconfig-002-20231209   gcc  
i386                  randconfig-003-20231209   gcc  
i386                  randconfig-004-20231209   gcc  
i386                  randconfig-005-20231209   gcc  
i386                  randconfig-006-20231209   gcc  
i386                  randconfig-011-20231209   clang
i386                  randconfig-012-20231209   clang
i386                  randconfig-013-20231209   clang
i386                  randconfig-014-20231209   clang
i386                  randconfig-015-20231209   clang
i386                  randconfig-016-20231209   clang
loongarch             randconfig-001-20231210   gcc  
loongarch             randconfig-002-20231210   gcc  
nios2                 randconfig-001-20231210   gcc  
nios2                 randconfig-002-20231210   gcc  
parisc                randconfig-001-20231210   gcc  
parisc                randconfig-002-20231210   gcc  
powerpc               randconfig-001-20231210   gcc  
powerpc               randconfig-002-20231210   gcc  
powerpc               randconfig-003-20231210   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
