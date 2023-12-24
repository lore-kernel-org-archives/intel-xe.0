Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5601C46CD2
	for <intel-xe@archiver.kernel.org>; Sun, 24 Dec 2023 20:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96C510E011;
	Sun, 24 Dec 2023 20:56:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9B510E011
 for <intel-xe@lists.freedesktop.org>; Sun, 24 Dec 2023 20:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703451412; x=1734987412;
 h=date:from:to:cc:subject:message-id;
 bh=d+TAuDvbXphIbFgK0sdETqUy+IoVA6896+XlNUytptg=;
 b=AbXIgve3wWNnSa5uoZeyK9jNZff8LjtUp1hmTXbzSfcllOEuPiR93ih7
 111Jxx7R+hgSzTaeXv6OPiAVnq7wCHZOMZNmM4HZ6a3J6Qa+h9OcDuxrQ
 HCxvrlwEAj7W88PwmY16Bjcl83QQVWWXj0HhsIlG3fLAjgAvBB+vjBKd+
 Zh7s6tP80i9bAAg4rtRCfj1SIh1ZW2fCsPZkGU8n/PyTsoHltMkDHsY2y
 APtGLJvr25QsFqX1BvU5PnECxkoUfQ54mIcZWAjlQD70EaIzNChbkr7fi
 oVDVdt2LJ8ER0dXBn0vRfotjUAGnhJj4jYKMl/hhAkq0CwPXS+QbCu8a/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="14928532"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; d="scan'208";a="14928532"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2023 12:56:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="1024764630"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; d="scan'208";a="1024764630"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 24 Dec 2023 12:56:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rHVWU-000Ce1-31;
 Sun, 24 Dec 2023 20:56:38 +0000
Date: Mon, 25 Dec 2023 04:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 84b9f177f5c8f5482c862a69d81c741253115a84
Message-ID: <202312250413.LsuNWKdB-lkp@intel.com>
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
branch HEAD: 84b9f177f5c8f5482c862a69d81c741253115a84  drm/xe: Disable 32bits build

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- s390-allmodconfig
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-gpu-drm-xe-tests-xe_mocs_test.o
|-- sparc-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:CTX_VALID-redefined
|-- sparc64-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:CTX_VALID-redefined
|-- sparc64-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:CTX_VALID-redefined
`-- x86_64-allnoconfig
    `-- drivers-gpu-drm-xe-tests-xe_pci.c:kunit-test-bug.h-is-included-more-than-once.

elapsed time: 2702m

configs tested: 91
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
arc                               allnoconfig   gcc  
arc                   randconfig-001-20231224   gcc  
arc                   randconfig-002-20231224   gcc  
arm                        keystone_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                   randconfig-001-20231224   gcc  
arm                   randconfig-002-20231224   gcc  
arm                   randconfig-003-20231224   gcc  
arm                   randconfig-004-20231224   gcc  
arm                             rpc_defconfig   gcc  
arm                       versatile_defconfig   clang
arm64                 randconfig-001-20231224   gcc  
arm64                 randconfig-002-20231224   gcc  
arm64                 randconfig-003-20231224   gcc  
arm64                 randconfig-004-20231224   gcc  
csky                  randconfig-001-20231224   gcc  
csky                  randconfig-002-20231224   gcc  
hexagon               randconfig-001-20231224   clang
hexagon               randconfig-002-20231224   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231224   gcc  
i386         buildonly-randconfig-002-20231224   gcc  
i386         buildonly-randconfig-003-20231224   gcc  
i386         buildonly-randconfig-004-20231224   gcc  
i386         buildonly-randconfig-005-20231224   gcc  
i386         buildonly-randconfig-006-20231224   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231224   gcc  
i386                  randconfig-002-20231224   gcc  
i386                  randconfig-003-20231224   gcc  
i386                  randconfig-004-20231224   gcc  
i386                  randconfig-005-20231224   gcc  
i386                  randconfig-006-20231224   gcc  
i386                  randconfig-011-20231224   clang
i386                  randconfig-012-20231224   clang
i386                  randconfig-013-20231224   clang
i386                  randconfig-014-20231224   clang
i386                  randconfig-015-20231224   clang
i386                  randconfig-016-20231224   clang
loongarch                        allmodconfig   gcc  
loongarch             randconfig-001-20231224   gcc  
loongarch             randconfig-002-20231224   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       allmodconfig   gcc  
mips                           ip22_defconfig   gcc  
mips                         rt305x_defconfig   gcc  
nios2                 randconfig-001-20231224   gcc  
nios2                 randconfig-002-20231224   gcc  
parisc                           alldefconfig   gcc  
parisc                randconfig-001-20231224   gcc  
parisc                randconfig-002-20231224   gcc  
powerpc                   bluestone_defconfig   clang
powerpc                     ep8248e_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc               randconfig-001-20231224   gcc  
powerpc               randconfig-002-20231224   gcc  
powerpc               randconfig-003-20231224   gcc  
powerpc64             randconfig-001-20231224   gcc  
powerpc64             randconfig-002-20231224   gcc  
powerpc64             randconfig-003-20231224   gcc  
riscv                 randconfig-001-20231224   gcc  
riscv                 randconfig-002-20231224   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-001-20231224   clang
s390                  randconfig-002-20231224   clang
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                    randconfig-001-20231224   gcc  
sh                    randconfig-002-20231224   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20231224   gcc  
sparc64               randconfig-002-20231224   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                    randconfig-001-20231224   gcc  
um                    randconfig-002-20231224   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20231224   gcc  
xtensa                randconfig-002-20231224   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
