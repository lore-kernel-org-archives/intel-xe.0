Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE95E6F06E
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 16:47:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A6B10E9E1;
	Fri,  1 Nov 2024 16:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLAf31BE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B26910E9E1
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 16:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730479671; x=1762015671;
 h=date:from:to:cc:subject:message-id;
 bh=CR1CyBMtmV4/pZxEZBTYSgUhAzYN2T/oc9VkJgEuhOk=;
 b=CLAf31BEoWe/mu9UUqxMeNsm3LLIGCJLdD4tXKMHr+TV6MIXqtS0nvvR
 y+teppuPEzOWLtkxON7dQtnlyjJxsE4IC534qmD6akxfutygiyzvSrO/B
 hQTiDe3AHz+fDERU7V2PBmi9AslezZ+/2akWaZ4WStCGV28ZJjSNVR20f
 aPVVwrv/qrickJcRJCqOntmg2SPosrP/YLHeALhgjemjwCzTQRc/yUdtf
 GMCpTDFHqEpvhVPCbGGPb9mJAkNQsfbkToaaO+HnEoXCgFL9E4V2tbaOt
 m/53qXthm+QMs5Yd1HC0RuZbvrR33EkTxvI7v+2xG+HaP5HjatXfrtFX6 Q==;
X-CSE-ConnectionGUID: xIgeBA3ETKSJzXcKjWA4/A==
X-CSE-MsgGUID: /PRT2ubhSyqILsgZ0u3xtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="17879840"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="17879840"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 09:47:50 -0700
X-CSE-ConnectionGUID: 6yR7AyiDQ0qjqn9VRp6Bfw==
X-CSE-MsgGUID: 3sXfqrv7TgiGk1qbrXBreg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="82892642"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 01 Nov 2024 09:47:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t6uoN-000hmI-12;
 Fri, 01 Nov 2024 16:47:47 +0000
Date: Sat, 02 Nov 2024 00:46:51 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 fe05cee4d9533892210e1ee90147175d87e7c053
Message-ID: <202411020038.K5DVRGPZ-lkp@intel.com>
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
branch HEAD: fe05cee4d9533892210e1ee90147175d87e7c053  drm/xe: Don't short circuit TDR on jobs not started

elapsed time: 1031m

configs tested: 119
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                          axs103_defconfig    gcc-14.1.0
arc                    vdk_hs38_smp_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                         assabet_defconfig    clang-20
arm                          ep93xx_defconfig    clang-20
arm                          exynos_defconfig    clang-20
arm                            hisi_defconfig    clang-20
arm                            hisi_defconfig    gcc-14.1.0
arm                        keystone_defconfig    clang-20
arm                         s5pv210_defconfig    clang-20
arm                        vexpress_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241101    gcc-12
i386        buildonly-randconfig-002-20241101    gcc-12
i386        buildonly-randconfig-003-20241101    gcc-12
i386        buildonly-randconfig-004-20241101    gcc-12
i386        buildonly-randconfig-005-20241101    gcc-12
i386        buildonly-randconfig-006-20241101    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241101    gcc-12
i386                  randconfig-002-20241101    gcc-12
i386                  randconfig-003-20241101    gcc-12
i386                  randconfig-004-20241101    gcc-12
i386                  randconfig-005-20241101    gcc-12
i386                  randconfig-006-20241101    gcc-12
i386                  randconfig-011-20241101    gcc-12
i386                  randconfig-012-20241101    gcc-12
i386                  randconfig-013-20241101    gcc-12
i386                  randconfig-014-20241101    gcc-12
i386                  randconfig-015-20241101    gcc-12
i386                  randconfig-016-20241101    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                 loongson3_defconfig    clang-20
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                           virt_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        maltaup_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                 simple_smp_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
powerpc                    adder875_defconfig    clang-20
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                    amigaone_defconfig    gcc-14.1.0
powerpc                     asp8347_defconfig    gcc-14.1.0
powerpc                      cm5200_defconfig    clang-20
powerpc               mpc834x_itxgp_defconfig    clang-20
powerpc                 mpc836x_rdk_defconfig    clang-20
powerpc                  mpc866_ads_defconfig    gcc-14.1.0
powerpc                      pcm030_defconfig    gcc-14.1.0
powerpc                     sequoia_defconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    gcc-14.1.0
s390                             alldefconfig    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                               j2_defconfig    gcc-14.1.0
sh                            migor_defconfig    clang-20
sh                          rsk7269_defconfig    gcc-14.1.0
sh                           se7206_defconfig    clang-20
sh                           se7343_defconfig    clang-20
sh                        sh7785lcr_defconfig    gcc-14.1.0
sh                            titan_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
