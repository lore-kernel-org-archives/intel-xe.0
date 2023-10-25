Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA59BC25B47
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 10:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE47510E63A;
	Wed, 25 Oct 2023 10:41:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B9F10E0AD
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 10:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698230463; x=1729766463;
 h=date:from:to:cc:subject:message-id;
 bh=UORQa+EUv5ztQaqMiZ9UaYbBTlA952vrAUxVSPLN6a8=;
 b=oDn8tsGpb94oT3HkWogpUnC6wADxmNqCrhPYksthueOhAfLRx9Lh7lft
 kIb7H4wa85ophgjsL4SfQvpIStj7kJk5vLY0upGyaOhMIGDYbUWLNGG7C
 zn0akWtZVzMHP4mSPlTb5OWD0MKsUndTlqfvEkyunymXBzSvDmYi2sjMZ
 lV/RuUrSnKtXqkxA1Z8AdoOQ6VuD+s32NPPqDHwgmkbJxeCIEoYSEQfka
 yS/Ikrq170r7F+KH2ZEiMHwbkdhqJPm3THsNBZMqkGvbwX4hwbwIZRBks
 jfjhfXjsdJbhBaCg9MWAS0+3Nj8XjgOlxrcZv/tbrnhCDKrChDlHR45OY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="377646225"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="377646225"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 03:41:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="758825803"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="758825803"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 25 Oct 2023 03:41:02 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qvbJr-0008pH-1o;
 Wed, 25 Oct 2023 10:40:59 +0000
Date: Wed, 25 Oct 2023 18:40:18 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <202310251812.2Tr6uWLC-lkp@intel.com>
User-Agent: s-nail v14.9.24
Subject: [Intel-xe] [drm-xe:drm-xe-next] BUILD SUCCESS WITH WARNING
 a0a80950176b39dbc76f8faa92fddf6caaa06191
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
branch HEAD: a0a80950176b39dbc76f8faa92fddf6caaa06191  drm/xe: fix pat[2] programming with 2M/1G pages

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202310201234.ZZLwdoiy-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/xe/display/xe_display_misc.c:10:14: warning: no previous prototype for 'intel_gmch_vga_set_decode' [-Wmissing-prototypes]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- arc-allmodconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- arc-allyesconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- microblaze-allmodconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- microblaze-allyesconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- sparc-allmodconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- sparc-allyesconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- sparc64-allmodconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
`-- sparc64-allyesconfig
    `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode

elapsed time: 7767m

configs tested: 135
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231024   gcc  
arc                   randconfig-001-20231025   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231025   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231024   gcc  
i386         buildonly-randconfig-002-20231024   gcc  
i386         buildonly-randconfig-003-20231024   gcc  
i386         buildonly-randconfig-004-20231024   gcc  
i386         buildonly-randconfig-005-20231024   gcc  
i386         buildonly-randconfig-006-20231024   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231024   gcc  
i386                  randconfig-002-20231024   gcc  
i386                  randconfig-003-20231024   gcc  
i386                  randconfig-004-20231024   gcc  
i386                  randconfig-005-20231024   gcc  
i386                  randconfig-006-20231024   gcc  
i386                  randconfig-011-20231024   gcc  
i386                  randconfig-012-20231024   gcc  
i386                  randconfig-013-20231024   gcc  
i386                  randconfig-014-20231024   gcc  
i386                  randconfig-015-20231024   gcc  
i386                  randconfig-016-20231024   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231024   gcc  
loongarch             randconfig-001-20231025   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231024   gcc  
riscv                 randconfig-001-20231025   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231024   gcc  
s390                  randconfig-001-20231025   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231024   gcc  
sparc                 randconfig-001-20231025   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64       buildonly-randconfig-001-20231024   gcc  
x86_64       buildonly-randconfig-002-20231024   gcc  
x86_64       buildonly-randconfig-003-20231024   gcc  
x86_64       buildonly-randconfig-004-20231024   gcc  
x86_64       buildonly-randconfig-005-20231024   gcc  
x86_64       buildonly-randconfig-006-20231024   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231024   gcc  
x86_64                randconfig-002-20231024   gcc  
x86_64                randconfig-003-20231024   gcc  
x86_64                randconfig-004-20231024   gcc  
x86_64                randconfig-005-20231024   gcc  
x86_64                randconfig-006-20231024   gcc  
x86_64                randconfig-011-20231025   gcc  
x86_64                randconfig-012-20231025   gcc  
x86_64                randconfig-013-20231025   gcc  
x86_64                randconfig-014-20231025   gcc  
x86_64                randconfig-015-20231025   gcc  
x86_64                randconfig-016-20231025   gcc  
x86_64                randconfig-071-20231025   gcc  
x86_64                randconfig-072-20231025   gcc  
x86_64                randconfig-073-20231025   gcc  
x86_64                randconfig-074-20231025   gcc  
x86_64                randconfig-075-20231025   gcc  
x86_64                randconfig-076-20231025   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
