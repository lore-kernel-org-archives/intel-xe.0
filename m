Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9F6C4332F
	for <intel-xe@archiver.kernel.org>; Sat,  4 Nov 2023 11:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D42310E0E5;
	Sat,  4 Nov 2023 11:35:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9742B10E0E5
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Nov 2023 11:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699097734; x=1730633734;
 h=date:from:to:cc:subject:message-id;
 bh=AOtyYTHJaAlSMVGKOvknL7jc36xhtgB7RV0U6JihQZQ=;
 b=lYfBntRHKPBOraf8rgsLpstuWGLYHdwAto5OVJzGOJxpqf05Z8zT23L5
 WA6KGaRzgnIITByeCtJ2hJBuerAIlLS0/hYJMNPuVM3kr5OaB1NBRGw9O
 SyA7TW3DOYY2iKM8aYH3rrh4/PEXW1jsI3EpN/K0sJt98+0YAYLvcj4I9
 ie6w+d5S+81i9x1GlR2A9tb6rLFb1rUtXzoLhudBrMyegJc7IY35/7F9Y
 k5cU/Y7fHbot2O+l5eLBsVzXEawx5ZRjkLmAFMrPtxyCTcnMHBe1X2hNl
 yNfWDybMCqM/eLU1c3sXkrzZe3r2jSdgDKlXr9XRkgkjyIUBh0coNkG72 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="391948498"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; d="scan'208";a="391948498"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2023 04:35:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1009066905"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; d="scan'208";a="1009066905"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 04 Nov 2023 04:35:31 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qzEw5-0004A7-18;
 Sat, 04 Nov 2023 11:35:29 +0000
Date: Sat, 04 Nov 2023 19:35:28 +0800
From: kernel test robot <lkp@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <202311041927.3DzA7J5Q-lkp@intel.com>
User-Agent: s-nail v14.9.24
Subject: [Intel-xe] [drm-xe:new] BUILD SUCCESS
 f30cae3de3b138849010f4e54d8800eb1cc080b9
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git new
branch HEAD: f30cae3de3b138849010f4e54d8800eb1cc080b9  drm/xe/xe_exec_queue: Add check for access counter granularity

elapsed time: 7422m

configs tested: 161
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
arc                   randconfig-001-20231030   gcc  
arc                   randconfig-002-20231030   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231030   gcc  
arm                   randconfig-002-20231030   gcc  
arm                   randconfig-003-20231030   gcc  
arm                   randconfig-004-20231030   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231030   gcc  
arm64                 randconfig-002-20231030   gcc  
arm64                 randconfig-003-20231030   gcc  
arm64                 randconfig-004-20231030   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231030   gcc  
csky                  randconfig-002-20231030   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231030   gcc  
i386         buildonly-randconfig-002-20231030   gcc  
i386         buildonly-randconfig-003-20231030   gcc  
i386         buildonly-randconfig-004-20231030   gcc  
i386         buildonly-randconfig-005-20231030   gcc  
i386         buildonly-randconfig-006-20231030   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231030   gcc  
i386                  randconfig-002-20231030   gcc  
i386                  randconfig-003-20231030   gcc  
i386                  randconfig-004-20231030   gcc  
i386                  randconfig-005-20231030   gcc  
i386                  randconfig-006-20231030   gcc  
i386                  randconfig-011-20231030   gcc  
i386                  randconfig-012-20231030   gcc  
i386                  randconfig-013-20231030   gcc  
i386                  randconfig-014-20231030   gcc  
i386                  randconfig-015-20231030   gcc  
i386                  randconfig-016-20231030   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231030   gcc  
loongarch             randconfig-002-20231030   gcc  
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
nios2                 randconfig-001-20231030   gcc  
nios2                 randconfig-002-20231030   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231030   gcc  
parisc                randconfig-002-20231030   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc               randconfig-001-20231030   gcc  
powerpc               randconfig-002-20231030   gcc  
powerpc               randconfig-003-20231030   gcc  
powerpc64             randconfig-001-20231030   gcc  
powerpc64             randconfig-002-20231030   gcc  
powerpc64             randconfig-003-20231030   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231030   gcc  
riscv                 randconfig-002-20231030   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231030   gcc  
s390                  randconfig-002-20231030   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231031   gcc  
sh                    randconfig-002-20231031   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231031   gcc  
sparc                 randconfig-002-20231031   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231031   gcc  
sparc64               randconfig-002-20231031   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231031   gcc  
um                    randconfig-002-20231031   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231030   gcc  
x86_64       buildonly-randconfig-002-20231030   gcc  
x86_64       buildonly-randconfig-003-20231030   gcc  
x86_64       buildonly-randconfig-004-20231030   gcc  
x86_64       buildonly-randconfig-005-20231030   gcc  
x86_64       buildonly-randconfig-006-20231030   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231030   gcc  
x86_64                randconfig-002-20231030   gcc  
x86_64                randconfig-003-20231030   gcc  
x86_64                randconfig-004-20231030   gcc  
x86_64                randconfig-005-20231030   gcc  
x86_64                randconfig-006-20231030   gcc  
x86_64                randconfig-011-20231030   gcc  
x86_64                randconfig-012-20231030   gcc  
x86_64                randconfig-013-20231030   gcc  
x86_64                randconfig-014-20231030   gcc  
x86_64                randconfig-015-20231030   gcc  
x86_64                randconfig-016-20231030   gcc  
x86_64                randconfig-071-20231030   gcc  
x86_64                randconfig-072-20231030   gcc  
x86_64                randconfig-073-20231030   gcc  
x86_64                randconfig-074-20231030   gcc  
x86_64                randconfig-075-20231030   gcc  
x86_64                randconfig-076-20231030   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                randconfig-001-20231031   gcc  
xtensa                randconfig-002-20231031   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
