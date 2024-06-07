Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC03DC27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 20:48:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B775610E08E;
	Fri,  7 Jun 2024 20:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F8sYSCR6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5477310E08E
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 20:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717793323; x=1749329323;
 h=date:from:to:cc:subject:message-id;
 bh=9C5lvWgoDOXGrJBi8hfk/xrrjEgJiitABjhi3JP2qcY=;
 b=F8sYSCR627FHVwDzb/5bmLhCckiUN2OYU6AuvgeXRR8veMyfk0CQefNK
 5EI4yyb2cUcdilMGlklhgbF8p3KclfUIB80efds185/6XP7QQ1FkbZufk
 Eqmy9AV+0vT8o1KhGkRrpOP2t4YrI5uv6Ju9DPtVPzl+txjYz6Fe5oNgu
 XXnAu9bWGhVEeCzJJRE4i6kn+vzQm+UXl38G3d+04fF5MPJXQGHb/8sDu
 i1l0aLD10EhoFTlg/67h/KH1LtnqKHvXXcJkjQu9baX1w3Qyk3jUSczF9
 pe4BwjlLsJK+gSngBMYwgvUQPzh9uN+kHwniPo2C6YQ7u1qifdSZgZrrZ A==;
X-CSE-ConnectionGUID: rv3YFGgfShig7BSmIea0Bw==
X-CSE-MsgGUID: s4MVW+T+TQ+Zc6T4AlDjBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14363905"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14363905"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:48:43 -0700
X-CSE-ConnectionGUID: YnVbW0UvSXiCMxhQDqHqUQ==
X-CSE-MsgGUID: dAy+29flSAGjmeonbu6ybQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="39102891"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 07 Jun 2024 13:48:42 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sFgVr-0000Vc-30;
 Fri, 07 Jun 2024 20:48:39 +0000
Date: Sat, 08 Jun 2024 04:47:49 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 a9f9b30e1748252d158f78a0c0affdc949671dd1
Message-ID: <202406080448.W4lM2bYW-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: a9f9b30e1748252d158f78a0c0affdc949671dd1  MAINTAINERS: Update Xe driver maintainers

elapsed time: 1458m

configs tested: 55
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
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
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
s390                              allnoconfig   clang
s390                                defconfig   clang
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                                  kexec   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
