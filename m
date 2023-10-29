Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8960C4332F
	for <intel-xe@archiver.kernel.org>; Sun, 29 Oct 2023 08:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6EE10E09F;
	Sun, 29 Oct 2023 08:17:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D1E10E09E
 for <intel-xe@lists.freedesktop.org>; Sun, 29 Oct 2023 08:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698567476; x=1730103476;
 h=date:from:to:cc:subject:message-id;
 bh=6tIoPTju+UBydp4Icrrutz0LhpDgCC2MizmCot5OT/I=;
 b=fNi0x2Dtgiz5GZBcBRKr19k6bv2JRPOVyAB5I34uO7ZqDXk9z3e2Rdwz
 dSvw4khw3jbu+6zPx62Q6D+k+XoRrNYbGtGXwOAf5G7Bbd3GuoBVd+Hzv
 7AYzIo3sd3WnY9De4D8N+bW1CMcJDJ5Pwn/8cTOusWRJ60Hhrbcs7Oust
 M9LouoQSyu+3go7Q0GA+I5Dt2FkJUaEhr27zmOITtiNVJ2movC07Texl0
 +cTjGZappYaFtMnZDiEKAOlIK8tzDmuXJIaJ4ikHQV1Mm5naEhGZzX0FL
 l0opz6hY6toB2RR3tOPfvAT4Y302hA1PIqbO9jqAciTl31M8AtSut15Fo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="452190014"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; d="scan'208";a="452190014"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2023 01:17:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="759997024"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; d="scan'208";a="759997024"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 29 Oct 2023 01:17:54 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qx0zY-000CQV-0l;
 Sun, 29 Oct 2023 08:17:52 +0000
Date: Sun, 29 Oct 2023 16:16:59 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <202310291650.8KVAdMqR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Subject: [Intel-xe] [drm-xe:drm-xe-next] BUILD SUCCESS WITH WARNING
 f24c46200dc8fad700f51106e678d68d38496860
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
branch HEAD: f24c46200dc8fad700f51106e678d68d38496860  drm/xe: Fix WA 14010918519 write to wrong register

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202310201234.ZZLwdoiy-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/xe/display/xe_display_misc.c:10:14: warning: no previous prototype for 'intel_gmch_vga_set_decode' [-Wmissing-prototypes]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- alpha-allyesconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- arc-allmodconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- arc-allyesconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- arm-allmodconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- arm-allyesconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- arm64-allmodconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- arm64-allyesconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- csky-allmodconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- csky-allyesconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- loongarch-allmodconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- loongarch-allyesconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- microblaze-allmodconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- microblaze-allyesconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- mips-allmodconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- mips-allyesconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- openrisc-allmodconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- openrisc-allyesconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- parisc-allmodconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- parisc-allyesconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- powerpc-allmodconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- powerpc-allyesconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- riscv-allmodconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- riscv-allyesconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- s390-allmodconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- s390-allyesconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- sparc-allmodconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- sparc-allyesconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|-- sparc64-allmodconfig
|   `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
`-- sparc64-allyesconfig
    `-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode

elapsed time: 2185m

configs tested: 145
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20231028   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                          collie_defconfig   clang
arm                                 defconfig   gcc  
arm                   randconfig-001-20231028   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          alldefconfig   clang
i386         buildonly-randconfig-001-20231028   gcc  
i386         buildonly-randconfig-002-20231028   gcc  
i386         buildonly-randconfig-003-20231028   gcc  
i386         buildonly-randconfig-004-20231028   gcc  
i386         buildonly-randconfig-005-20231028   gcc  
i386         buildonly-randconfig-006-20231028   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231028   gcc  
i386                  randconfig-002-20231028   gcc  
i386                  randconfig-003-20231028   gcc  
i386                  randconfig-004-20231028   gcc  
i386                  randconfig-005-20231028   gcc  
i386                  randconfig-006-20231028   gcc  
i386                  randconfig-011-20231028   gcc  
i386                  randconfig-012-20231028   gcc  
i386                  randconfig-013-20231028   gcc  
i386                  randconfig-014-20231028   gcc  
i386                  randconfig-015-20231028   gcc  
i386                  randconfig-016-20231028   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231028   gcc  
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
mips                          malta_defconfig   clang
mips                  maltasmvp_eva_defconfig   gcc  
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
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                   currituck_defconfig   gcc  
powerpc                       ebony_defconfig   clang
powerpc                       holly_defconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                     redwood_defconfig   gcc  
powerpc                     taishan_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231028   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231028   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231028   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231028   gcc  
x86_64       buildonly-randconfig-002-20231028   gcc  
x86_64       buildonly-randconfig-003-20231028   gcc  
x86_64       buildonly-randconfig-004-20231028   gcc  
x86_64       buildonly-randconfig-005-20231028   gcc  
x86_64       buildonly-randconfig-006-20231028   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231028   gcc  
x86_64                randconfig-002-20231028   gcc  
x86_64                randconfig-003-20231028   gcc  
x86_64                randconfig-004-20231028   gcc  
x86_64                randconfig-005-20231028   gcc  
x86_64                randconfig-006-20231028   gcc  
x86_64                randconfig-011-20231028   gcc  
x86_64                randconfig-012-20231028   gcc  
x86_64                randconfig-013-20231028   gcc  
x86_64                randconfig-014-20231028   gcc  
x86_64                randconfig-015-20231028   gcc  
x86_64                randconfig-016-20231028   gcc  
x86_64                randconfig-071-20231028   gcc  
x86_64                randconfig-072-20231028   gcc  
x86_64                randconfig-073-20231028   gcc  
x86_64                randconfig-074-20231028   gcc  
x86_64                randconfig-075-20231028   gcc  
x86_64                randconfig-076-20231028   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
