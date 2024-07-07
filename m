Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB42C2BD09
	for <intel-xe@archiver.kernel.org>; Sun,  7 Jul 2024 01:38:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E5810E038;
	Sun,  7 Jul 2024 01:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bZqcZ6bJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4125910E038
 for <intel-xe@lists.freedesktop.org>; Sun,  7 Jul 2024 01:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720316308; x=1751852308;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=8pCd28Cg/Bxs2pVQQ9yfgIcrwTRJ1BsIQVIZBuRooZI=;
 b=bZqcZ6bJFryaSGLl85ig15cXP4G8iXkgtDVt4TOQzMVPJPuweQvGIPgE
 utPqwxw3n9OCX8b5S9FGr89MNhneMi1xzfnQB2WykA3rrsv0hTU6rfepi
 KPITwxbZctQBypC5GHgs12Z4oKDBzRCW7ptZuv+0zp2dE1vbWO2vkD+V6
 NsdL+V6CUYY25K9QJ6LXpoIkrzRRvSinaMJetPLXnIVzVUczD9wgHOkCz
 m8RIAnXgaWktW5AAEt0rsKWXAaCcOlrimXeUpEyUhTgvwaoB8ic9SuT3+
 2U2mfEqZa8SFzqiMJpcR9JTzJNaXgTrTK9gWUTCVCDUMS4NzLB1OZ4YJH A==;
X-CSE-ConnectionGUID: gINWYYycS9uzBktSHao7bw==
X-CSE-MsgGUID: sXKXSmlbQ+ecSVZi4wfscQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="12419207"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; d="scan'208";a="12419207"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2024 18:38:27 -0700
X-CSE-ConnectionGUID: z/j4TyueQVabufRMw2hblA==
X-CSE-MsgGUID: I55D14wsQjaOmdkCncJp5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; d="scan'208";a="51783002"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 06 Jul 2024 18:38:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sQGrA-000UTr-0a;
 Sun, 07 Jul 2024 01:38:24 +0000
Date: Sun, 07 Jul 2024 09:37:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 01e0cfc994be484ddcb9e121e353e51d8bb837c0
Message-ID: <202407070936.bGT9XQP7-lkp@intel.com>
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
branch HEAD: 01e0cfc994be484ddcb9e121e353e51d8bb837c0  drm/xe: Use write-back caching mode for system memory on DGFX

Warning ids grouped by kconfigs:

recent_errors
`-- x86_64-allnoconfig
    `-- drivers-gpu-drm-xe-xe_gt.c:generated-xe_wa_oob.h-is-included-more-than-once.

elapsed time: 973m

configs tested: 158
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                   randconfig-001-20240706   gcc-13.2.0
arc                   randconfig-002-20240706   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-13.2.0
arm                        clps711x_defconfig   clang-19
arm                          gemini_defconfig   clang-19
arm                       netwinder_defconfig   gcc-13.2.0
arm                         nhk8815_defconfig   clang-19
arm                       omap2plus_defconfig   gcc-13.2.0
arm                   randconfig-001-20240706   gcc-13.2.0
arm                   randconfig-002-20240706   gcc-13.2.0
arm                   randconfig-003-20240706   gcc-13.2.0
arm                   randconfig-004-20240706   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240706   gcc-13.2.0
arm64                 randconfig-002-20240706   gcc-13.2.0
arm64                 randconfig-003-20240706   clang-16
arm64                 randconfig-004-20240706   clang-19
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240706   gcc-13.2.0
csky                  randconfig-002-20240706   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240706   clang-19
hexagon               randconfig-002-20240706   clang-15
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240706   clang-18
i386         buildonly-randconfig-002-20240706   gcc-13
i386         buildonly-randconfig-003-20240706   clang-18
i386         buildonly-randconfig-004-20240706   gcc-13
i386         buildonly-randconfig-005-20240706   gcc-10
i386         buildonly-randconfig-006-20240706   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240706   gcc-13
i386                  randconfig-002-20240706   clang-18
i386                  randconfig-003-20240706   gcc-13
i386                  randconfig-004-20240706   clang-18
i386                  randconfig-005-20240706   clang-18
i386                  randconfig-006-20240706   gcc-12
i386                  randconfig-011-20240706   gcc-11
i386                  randconfig-012-20240706   clang-18
i386                  randconfig-013-20240706   clang-18
i386                  randconfig-014-20240706   clang-18
i386                  randconfig-015-20240706   gcc-7
i386                  randconfig-016-20240706   gcc-13
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240706   gcc-13.2.0
loongarch             randconfig-002-20240706   gcc-13.2.0
m68k                             alldefconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                      loongson3_defconfig   gcc-13.2.0
mips                  maltasmvp_eva_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240706   gcc-13.2.0
nios2                 randconfig-002-20240706   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240706   gcc-13.2.0
parisc                randconfig-002-20240706   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   clang-19
powerpc                     ksi8560_defconfig   gcc-13.2.0
powerpc                   microwatt_defconfig   gcc-13.2.0
powerpc                     mpc83xx_defconfig   clang-19
powerpc               randconfig-001-20240706   gcc-13.2.0
powerpc               randconfig-002-20240706   gcc-13.2.0
powerpc               randconfig-003-20240706   clang-19
powerpc                     taishan_defconfig   clang-19
powerpc64             randconfig-001-20240706   gcc-13.2.0
powerpc64             randconfig-002-20240706   gcc-13.2.0
powerpc64             randconfig-003-20240706   clang-19
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   clang-19
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240706   gcc-13.2.0
riscv                 randconfig-002-20240706   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   clang-19
s390                  randconfig-001-20240706   gcc-13.2.0
s390                  randconfig-002-20240706   clang-19
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240706   gcc-13.2.0
sh                    randconfig-002-20240706   gcc-13.2.0
sh                           se7619_defconfig   gcc-13.2.0
sh                        sh7785lcr_defconfig   gcc-13.2.0
sh                              ul2_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240706   gcc-13.2.0
sparc64               randconfig-002-20240706   gcc-13.2.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240706   clang-19
um                    randconfig-002-20240706   gcc-13
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240706   clang-18
x86_64       buildonly-randconfig-002-20240706   clang-18
x86_64       buildonly-randconfig-003-20240706   clang-18
x86_64       buildonly-randconfig-004-20240706   clang-18
x86_64       buildonly-randconfig-005-20240706   gcc-13
x86_64       buildonly-randconfig-006-20240706   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240706   gcc-9
x86_64                randconfig-002-20240706   clang-18
x86_64                randconfig-003-20240706   clang-18
x86_64                randconfig-004-20240706   clang-18
x86_64                randconfig-005-20240706   clang-18
x86_64                randconfig-006-20240706   clang-18
x86_64                randconfig-011-20240706   gcc-12
x86_64                randconfig-012-20240706   gcc-12
x86_64                randconfig-013-20240706   clang-18
x86_64                randconfig-014-20240706   gcc-13
x86_64                randconfig-015-20240706   gcc-13
x86_64                randconfig-016-20240706   gcc-13
x86_64                randconfig-071-20240706   gcc-12
x86_64                randconfig-072-20240706   gcc-13
x86_64                randconfig-073-20240706   gcc-12
x86_64                randconfig-074-20240706   gcc-13
x86_64                randconfig-075-20240706   clang-18
x86_64                randconfig-076-20240706   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-002-20240706   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
