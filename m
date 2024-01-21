Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EDEC47422
	for <intel-xe@archiver.kernel.org>; Sun, 21 Jan 2024 08:42:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C05410E08D;
	Sun, 21 Jan 2024 08:42:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D8310E08D
 for <intel-xe@lists.freedesktop.org>; Sun, 21 Jan 2024 08:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705826530; x=1737362530;
 h=date:from:to:cc:subject:message-id;
 bh=Yry0BcpX1JWuqLv3jrO8sitKjM5Gkg474qliSd5JcR4=;
 b=UXyzmBGMsIMMIQfKVR1xVBY3Y5r1YPcGQB0Ir8qGHWrSZvDsqktiOq/5
 vuckdwzpTVAlItWTQhkaayToC1zYtKh59GL1sUJ9uoJdWX9Fk5+6Vzp58
 oFKNl1DM/1ae9VqAkvNO/+gUDrXNh74GjZnMExz7AD3mzlhtOzPospfpy
 Vp1dT2uy7BF3eN/swf9ieXTmihSzDeVXG3KDBSwBH8YEjHMjvT95S+y2Z
 rObPtR7jANK/221NpUMv8R4sMclQAGgAntOwieni1AQ9r6/oq6K4xsiZE
 tXZaFQ4eqdMBZvNOOP5IDG8q3owzJ00dkSdcOOKH/poVLoZOTM939kTCT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="19581889"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; d="scan'208";a="19581889"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2024 00:42:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="785406589"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; d="scan'208";a="785406589"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 21 Jan 2024 00:42:07 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rRTP2-0005mW-29;
 Sun, 21 Jan 2024 08:42:04 +0000
Date: Sun, 21 Jan 2024 16:41:56 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 836e487149c27253aabf364a4978cfb8206bd14b
Message-ID: <202401211654.tGnjWpoz-lkp@intel.com>
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
branch HEAD: 836e487149c27253aabf364a4978cfb8206bd14b  drm/xe: Enable 32bits build

elapsed time: 2036m

configs tested: 114
configs skipped: 2

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
arc                   randconfig-001-20240121   gcc  
arc                   randconfig-002-20240121   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240121   gcc  
arm                   randconfig-002-20240121   gcc  
arm                   randconfig-003-20240121   gcc  
arm                   randconfig-004-20240121   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240121   gcc  
arm64                 randconfig-002-20240121   gcc  
arm64                 randconfig-003-20240121   gcc  
arm64                 randconfig-004-20240121   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240121   gcc  
csky                  randconfig-002-20240121   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240121   clang
hexagon               randconfig-002-20240121   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240120   clang
i386         buildonly-randconfig-002-20240120   clang
i386         buildonly-randconfig-003-20240120   clang
i386         buildonly-randconfig-004-20240120   clang
i386         buildonly-randconfig-005-20240120   clang
i386         buildonly-randconfig-006-20240120   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240120   clang
i386                  randconfig-002-20240120   clang
i386                  randconfig-003-20240120   clang
i386                  randconfig-004-20240120   clang
i386                  randconfig-005-20240120   clang
i386                  randconfig-006-20240120   clang
i386                  randconfig-011-20240120   gcc  
i386                  randconfig-012-20240120   gcc  
i386                  randconfig-013-20240120   gcc  
i386                  randconfig-014-20240120   gcc  
i386                  randconfig-015-20240120   gcc  
i386                  randconfig-016-20240120   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240121   gcc  
loongarch             randconfig-002-20240121   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
nios2                             allnoconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240121   gcc  
nios2                 randconfig-002-20240121   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240121   gcc  
parisc                randconfig-002-20240121   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc               randconfig-001-20240121   gcc  
powerpc               randconfig-002-20240121   gcc  
powerpc               randconfig-003-20240121   gcc  
powerpc64             randconfig-001-20240121   gcc  
powerpc64             randconfig-002-20240121   gcc  
powerpc64             randconfig-003-20240121   gcc  
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240121   gcc  
riscv                 randconfig-002-20240121   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240121   clang
s390                  randconfig-002-20240121   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240121   gcc  
sh                    randconfig-002-20240121   gcc  
sparc                            allmodconfig   gcc  
sparc64               randconfig-001-20240121   gcc  
sparc64               randconfig-002-20240121   gcc  
um                    randconfig-001-20240121   gcc  
um                    randconfig-002-20240121   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20240121   gcc  
xtensa                randconfig-002-20240121   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
