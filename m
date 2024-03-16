Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2828EC54E5D
	for <intel-xe@archiver.kernel.org>; Sat, 16 Mar 2024 09:51:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C9A10E52D;
	Sat, 16 Mar 2024 09:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YftSx2cj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF5610E52D
 for <intel-xe@lists.freedesktop.org>; Sat, 16 Mar 2024 09:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710582703; x=1742118703;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=akZQMtuDeys9RteHAOMcLmXeaQQWS5NB96LcP4QhpYM=;
 b=YftSx2cjakhs/C2X/H9wsmEQvx9aQXegoVYAf/SCA42z7+3YbdRUMyhh
 OjWuPGBbgwCFlGr6TPuTZCwmFZ528PAroRqKb21g5+swPTQWouETzGuPg
 2riuohYcl2u4C/6dt6dDidHQT69E+vfge7UGbMGBd8EsRFcNYOZom3A20
 QuQO0UDdVZjT8OmF/TQFvMc5Lbp+OEwgt9E1TXvVAPhIc51bRbH5koJ31
 LtCy/t0aHUmY2PACfOuQdVGroJCr+YOesMn3DKcCmgal8qXwzseaqRv5X
 gdwfbigfKUxY0GNvbzfQ3E3/GKREClS9G5gGY2FiWZjG8mRoQWk/ZUt66 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5645196"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5645196"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2024 02:51:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="12868925"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 16 Mar 2024 02:51:42 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rlQhX-000FI5-2V;
 Sat, 16 Mar 2024 09:51:39 +0000
Date: Sat, 16 Mar 2024 17:50:50 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Micha=C5=82?= Winiarski" <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 df26ac946416a3fc43347f143c71b2f4c0b7c63e
Message-ID: <202403161746.hUOOLwZq-lkp@intel.com>
User-Agent: s-nail v14.9.24
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: df26ac946416a3fc43347f143c71b2f4c0b7c63e  drm/xe/pf: Always select Multi-Level LMTT for platforms 12.60+

elapsed time: 730m

configs tested: 139
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240316   gcc  
arc                   randconfig-002-20240316   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240316   gcc  
arm                   randconfig-002-20240316   gcc  
arm                   randconfig-003-20240316   gcc  
arm                   randconfig-004-20240316   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240316   gcc  
arm64                 randconfig-002-20240316   clang
arm64                 randconfig-003-20240316   clang
arm64                 randconfig-004-20240316   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240316   gcc  
csky                  randconfig-002-20240316   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240316   clang
hexagon               randconfig-002-20240316   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240316   clang
i386         buildonly-randconfig-002-20240316   gcc  
i386         buildonly-randconfig-003-20240316   gcc  
i386         buildonly-randconfig-004-20240316   gcc  
i386         buildonly-randconfig-005-20240316   gcc  
i386         buildonly-randconfig-006-20240316   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240316   gcc  
i386                  randconfig-002-20240316   gcc  
i386                  randconfig-003-20240316   gcc  
i386                  randconfig-004-20240316   gcc  
i386                  randconfig-005-20240316   clang
i386                  randconfig-006-20240316   gcc  
i386                  randconfig-011-20240316   clang
i386                  randconfig-012-20240316   clang
i386                  randconfig-013-20240316   clang
i386                  randconfig-014-20240316   clang
i386                  randconfig-015-20240316   clang
i386                  randconfig-016-20240316   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240316   gcc  
loongarch             randconfig-002-20240316   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240316   gcc  
nios2                 randconfig-002-20240316   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240316   gcc  
parisc                randconfig-002-20240316   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240316   clang
powerpc               randconfig-002-20240316   clang
powerpc               randconfig-003-20240316   gcc  
powerpc64             randconfig-001-20240316   gcc  
powerpc64             randconfig-002-20240316   gcc  
powerpc64             randconfig-003-20240316   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240316   gcc  
riscv                 randconfig-002-20240316   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240316   clang
s390                  randconfig-002-20240316   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240316   gcc  
sh                    randconfig-002-20240316   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240316   gcc  
sparc64               randconfig-002-20240316   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240316   clang
um                    randconfig-002-20240316   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240316   gcc  
xtensa                randconfig-002-20240316   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
