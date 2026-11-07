Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258FD60A381E
	for <intel-xe@archiver.kernel.org>; Sat,  7 Nov 2026 15:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qgw/RFdT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D043810E643;
	Sat,  7 Nov 2026 15:06:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02D910E643
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Nov 2026 15:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794064010; x=1825600010;
 h=date:from:to:cc:subject:message-id;
 bh=4LXlUMoI2Gk3BXDBPs2IfP3RIBU5DL3ZdA6ANOc2mxk=;
 b=Qgw/RFdTMX6x0hAHcFPl8pwFR6dLfi6VPc09uvg/dh94R2APsGjHLDob
 Pkw04klrybhfGHdrxVIwiu/FZvIyDv7SfPtrWXM05YIMgFUXpyPqPgRXI
 uWbkM8p+zoNAxb4fwvGPUfh0hD6uf1HRf0pd2Eft/g5zwpbh7nok7P6jc
 PjHlpf1yRYaJWbIcGMiA/muVYXxiWWm1LZV3wvhhBiibt58LAwZ2iG98k
 d2MyFolV9z043Yof252SC/w8YzSYrcaQTL+CZNBG09gmlF+jd35yio0We
 a4eMXozUP9EsIhxR7e3++6OuW85u1O8kdN8uidv5i7AtjaXL1NKrgQoZx w==;
X-CSE-ConnectionGUID: nfP6WXGBTWieAbHZfPiiuQ==
X-CSE-MsgGUID: OlnGJtPbQRSPJ4b/ydRUBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2723075"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2723075"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2026 07:06:49 -0800
X-CSE-ConnectionGUID: 2o1pQSBeRI+TolNqlGajiw==
X-CSE-MsgGUID: G+PZFcHLRnu8D1d/ojDGug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7400628"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 07 Nov 2026 07:06:49 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1xPi0E-00000000r3F-0Zjw;
 Sat, 07 Nov 2026 15:06:46 +0000
Date: Sat, 07 Nov 2026 23:06:40 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 c9edd9cf7e613262e6f10e05876108f03086f658
Message-ID: <20261107230640.0eiK5oj8-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: c9edd9cf7e613262e6f10e05876108f03086f658  drm/xe/pf: Use multicast writes for early-generation LMTT config

elapsed time: 1007m

configs tested: 393
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261107    gcc-9.5.0
alpha                 randconfig-2001-20261107    gcc-9.5.0
alpha                 randconfig-2200-20261107    gcc-8.5.0  smatch
alpha                randconfig-r2106-20261107    gcc-10.5.0 cocci
alpha                randconfig-r2109-20261107    clang-24   cocci
alpha                randconfig-r2306-20261107    clang-17   sparse
arc                               alldefconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                      haps_hs_smp_defconfig    clang-17
arc                             hsdk_defconfig    gcc-16.2.0
arc                         nsimosci_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261107    gcc-12.5.0
arc                   randconfig-1001-20261107    gcc-12.5.0
arc                   randconfig-2000-20261107    gcc-9.5.0
arc                   randconfig-2001-20261107    gcc-9.5.0
arc                   randconfig-2002-20261107    gcc-9.5.0
arc                   randconfig-2003-20261107    gcc-9.5.0
arc                   randconfig-2004-20261107    gcc-9.5.0
arc                   randconfig-2005-20261107    gcc-9.5.0
arc                   randconfig-2200-20261107    gcc-8.5.0  smatch
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                         clps711x_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                            h3600_defconfig    gcc-16.2.0
arm                           ixp4xx_defconfig    gcc-16.2.0
arm                    milbeaut_m10v_defconfig    gcc-16.2.0
arm                         multi_v7_defconfig    gcc-16.2.0
arm                         mvebu_v5_defconfig    gcc-16.2.0
arm                         neponset_defconfig    gcc-16.2.0
arm                            omap1_defconfig    gcc-16.2.0
arm                        omap2plus_defconfig    gcc-16.2.0
arm                           pxa910_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261107    gcc-12.5.0
arm                   randconfig-1001-20261107    gcc-12.5.0
arm                   randconfig-1002-20261107    gcc-12.5.0
arm                   randconfig-1003-20261107    gcc-12.5.0
arm                   randconfig-2000-20261107    gcc-16.2.0
arm                   randconfig-2001-20261107    gcc-16.2.0
arm                   randconfig-2002-20261107    gcc-16.2.0
arm                   randconfig-2200-20261107    clang-24   smatch
arm                              rpc_defconfig    gcc-16.2.0
arm                           sp7021_defconfig    gcc-16.2.0
arm                            spitz_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261107    gcc-11.5.0
arm64                 randconfig-1001-20261107    gcc-11.5.0
arm64                 randconfig-1002-20261107    gcc-11.5.0
arm64                 randconfig-1003-20261107    gcc-11.5.0
arm64                 randconfig-2000-20261107    gcc-16.2.0
arm64                 randconfig-2001-20261107    gcc-16.2.0
arm64                 randconfig-2002-20261107    gcc-16.2.0
arm64                 randconfig-2200-20261107    gcc-12.5.0 smatch
arm64                randconfig-r2103-20261107    clang-24   cocci
arm64                randconfig-r2107-20261107    clang-24   cocci
arm64                        renesas_defconfig    gcc-16.2.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261107    gcc-11.5.0
csky                  randconfig-1001-20261107    gcc-11.5.0
csky                  randconfig-2000-20261107    clang-24
csky                  randconfig-2001-20261107    clang-24
csky                  randconfig-2200-20261107    gcc-11.5.0 smatch
csky                 randconfig-r2102-20261107    clang-24   cocci
csky                 randconfig-r2104-20261107    gcc-12.5.0 cocci
csky                 randconfig-r2109-20261107    gcc-10.5.0 cocci
csky                 randconfig-r2300-20261107    gcc-8.5.0  sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261107    clang-18
hexagon               randconfig-1001-20261107    clang-18
hexagon               randconfig-2000-20261107    clang-24
hexagon               randconfig-2001-20261107    clang-24
hexagon               randconfig-2200-20261107    clang-19   smatch
hexagon              randconfig-r2111-20261107    gcc-10.5.0 cocci
hexagon              randconfig-r2301-20261107    gcc-8.5.0  sparse
hexagon              randconfig-r2305-20261107    gcc-8.5.0  sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261107    gcc-14
i386        buildonly-randconfig-1001-20261107    gcc-14
i386        buildonly-randconfig-1002-20261107    gcc-14
i386        buildonly-randconfig-1003-20261107    gcc-14
i386        buildonly-randconfig-1004-20261107    gcc-14
i386        buildonly-randconfig-1005-20261107    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261107    clang-22
i386                  randconfig-1001-20261107    clang-22
i386                  randconfig-1002-20261107    clang-22
i386                  randconfig-1003-20261107    clang-22
i386                  randconfig-1004-20261107    clang-22
i386                  randconfig-1005-20261107    clang-22
i386                  randconfig-1006-20261107    clang-22
i386                  randconfig-1007-20261107    clang-22
i386                  randconfig-1008-20261107    clang-22
i386                  randconfig-1009-20261107    clang-22
i386                  randconfig-1010-20261107    clang-22
i386                  randconfig-1011-20261107    clang-22
i386                  randconfig-1012-20261107    clang-22
i386                  randconfig-1013-20261107    clang-22
i386                  randconfig-2000-20261107    clang-22
i386                  randconfig-2001-20261107    clang-22
i386                  randconfig-2002-20261107    clang-22
i386                  randconfig-2003-20261107    clang-22
i386                  randconfig-2004-20261107    clang-22
i386                  randconfig-2005-20261107    clang-22
i386                  randconfig-2100-20261107    gcc-14     cocci
i386                  randconfig-2101-20261107    gcc-14     cocci
i386                  randconfig-2102-20261107    gcc-14     cocci
i386                  randconfig-2103-20261107    gcc-14     cocci
i386                  randconfig-2104-20261107    gcc-14     cocci
i386                  randconfig-2105-20261107    gcc-14     cocci
i386                  randconfig-2200-20261107    clang-22   smatch
i386                  randconfig-2300-20261107    gcc-14     sparse
i386                  randconfig-2301-20261107    gcc-14     sparse
i386                  randconfig-2302-20261107    gcc-14     sparse
i386                 randconfig-r2310-20261107    clang-17   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    gcc-16.2.0
loongarch             randconfig-1000-20261107    clang-18
loongarch             randconfig-1001-20261107    clang-18
loongarch             randconfig-2000-20261107    gcc-16.2.0
loongarch             randconfig-2001-20261107    gcc-16.2.0
loongarch             randconfig-2200-20261107    gcc-16.2.0 smatch
loongarch            randconfig-r2105-20261107    gcc-12.5.0 cocci
loongarch            randconfig-r2110-20261107    clang-24   cocci
loongarch            randconfig-r2301-20261107    gcc-15.3.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5329evb_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261107    gcc-9.5.0
m68k                  randconfig-2001-20261107    gcc-9.5.0
m68k                  randconfig-2200-20261107    gcc-8.5.0  smatch
m68k                 randconfig-r2107-20261107    gcc-10.5.0 cocci
m68k                 randconfig-r2304-20261107    gcc-15.3.0 sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261107    gcc-9.5.0
microblaze            randconfig-2001-20261107    gcc-9.5.0
microblaze            randconfig-2200-20261107    gcc-15.3.0 smatch
microblaze           randconfig-r2102-20261107    gcc-12.5.0 cocci
microblaze           randconfig-r2303-20261107    gcc-15.3.0 sparse
microblaze           randconfig-r2307-20261107    clang-17   sparse
microblaze           randconfig-r2311-20261107    clang-17   sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                        bmips_be_defconfig    gcc-16.2.0
mips                       bmips_stb_defconfig    clang-17
mips                      cu1830-neo_defconfig    gcc-16.2.0
mips                      decstation_defconfig    gcc-16.2.0
mips                            gcw0_defconfig    gcc-16.2.0
mips                            ip27_defconfig    gcc-16.2.0
mips                           malta_defconfig    clang-17
mips                       malta_kvm_defconfig    clang-17
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                   maltasmvp_eva_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261107    gcc-8.5.0
mips                  randconfig-2001-20261107    gcc-8.5.0
mips                  randconfig-2002-20261107    gcc-8.5.0
mips                  randconfig-2200-20261107    gcc-13.5.0 smatch
mips                 randconfig-r2303-20261107    gcc-8.5.0  sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261107    clang-18
nios2                 randconfig-1001-20261107    clang-18
nios2                 randconfig-2000-20261107    gcc-16.2.0
nios2                 randconfig-2001-20261107    gcc-16.2.0
nios2                 randconfig-2200-20261107    gcc-11.5.0 smatch
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261107    gcc-8.5.0
openrisc              randconfig-2001-20261107    gcc-8.5.0
openrisc              randconfig-2002-20261107    gcc-8.5.0
openrisc              randconfig-2200-20261107    gcc-11.5.0 smatch
openrisc             randconfig-r2100-20261107    clang-24   cocci
openrisc                  simple_smp_defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261107    clang-24
parisc                randconfig-1001-20261107    clang-24
parisc                randconfig-2000-20261107    gcc-16.2.0
parisc                randconfig-2001-20261107    gcc-16.2.0
parisc                randconfig-2200-20261107    gcc-9.5.0  smatch
parisc               randconfig-r2100-20261107    gcc-12.5.0 cocci
parisc               randconfig-r2101-20261107    clang-24   cocci
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    gcc-16.2.0
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                  canyonlands_defconfig    gcc-16.2.0
powerpc                        ebony_defconfig    gcc-16.2.0
powerpc                      ep8248e_defconfig    gcc-16.2.0
powerpc                       katmai_defconfig    gcc-16.2.0
powerpc                      kmeter1_defconfig    gcc-16.2.0
powerpc                      ksi8560_defconfig    gcc-16.2.0
powerpc                       mgcoge_defconfig    gcc-16.2.0
powerpc                       pmac32_defconfig    gcc-16.2.0
powerpc                      rainier_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261107    clang-24
powerpc               randconfig-1001-20261107    clang-24
powerpc               randconfig-2000-20261107    clang-24
powerpc               randconfig-2001-20261107    clang-24
powerpc               randconfig-2002-20261107    clang-24
powerpc               randconfig-2200-20261107    gcc-10.5.0 smatch
powerpc              randconfig-r2105-20261107    clang-24   cocci
powerpc                      sequoia_defconfig    gcc-16.2.0
powerpc                      tqm8555_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261107    clang-24
powerpc64             randconfig-1001-20261107    clang-24
powerpc64             randconfig-2000-20261107    clang-24
powerpc64             randconfig-2001-20261107    clang-24
powerpc64             randconfig-2002-20261107    clang-24
powerpc64             randconfig-2200-20261107    clang-24   smatch
powerpc64            randconfig-r2101-20261107    gcc-12.5.0 cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    clang-17
riscv                                defconfig    gcc-16.2.0
riscv                     nommu_k210_defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261107    gcc-11.5.0
riscv                 randconfig-1001-20261107    gcc-11.5.0
riscv                 randconfig-2000-20261107    clang-24
riscv                 randconfig-2001-20261107    clang-24
riscv                 randconfig-2002-20261107    clang-24
riscv                 randconfig-2003-20261107    clang-24
riscv                 randconfig-2004-20261107    clang-24
riscv                 randconfig-2005-20261107    clang-24
riscv                 randconfig-2200-20261107    gcc-10.5.0 smatch
riscv                randconfig-r2108-20261107    gcc-10.5.0 cocci
riscv                randconfig-r2309-20261107    clang-17   sparse
s390                              alldefconfig    clang-17
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261107    gcc-11.5.0
s390                  randconfig-1001-20261107    gcc-11.5.0
s390                  randconfig-2000-20261107    gcc-14.4.0
s390                  randconfig-2001-20261107    gcc-14.4.0
s390                  randconfig-2002-20261107    gcc-14.4.0
s390                  randconfig-2003-20261107    gcc-14.4.0
s390                  randconfig-2004-20261107    gcc-14.4.0
s390                  randconfig-2005-20261107    gcc-14.4.0
s390                  randconfig-2200-20261107    gcc-10.5.0 smatch
s390                 randconfig-r2104-20261107    clang-24   cocci
s390                 randconfig-r2308-20261107    clang-17   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                           r7780mp_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261107    gcc-11.5.0
sh                    randconfig-1001-20261107    gcc-11.5.0
sh                    randconfig-2000-20261107    gcc-13.5.0
sh                    randconfig-2001-20261107    gcc-13.5.0
sh                    randconfig-2002-20261107    gcc-13.5.0
sh                    randconfig-2003-20261107    gcc-13.5.0
sh                    randconfig-2004-20261107    gcc-13.5.0
sh                    randconfig-2005-20261107    gcc-13.5.0
sh                    randconfig-2200-20261107    gcc-11.5.0 smatch
sh                   randconfig-r2110-20261107    gcc-10.5.0 cocci
sh                           rsk7269_defconfig    clang-17
sh                            se7343_defconfig    gcc-16.2.0
sh                            se7619_defconfig    gcc-16.2.0
sh                            se7712_defconfig    gcc-16.2.0
sh                            se7751_defconfig    gcc-16.2.0
sh                              sh03_defconfig    clang-17
sh                            sh2007_defconfig    gcc-16.2.0
sh                         sh7785lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261107    gcc-10.5.0
sparc                 randconfig-1001-20261107    gcc-10.5.0
sparc                 randconfig-2000-20261107    clang-24
sparc                 randconfig-2001-20261107    clang-24
sparc                 randconfig-2200-20261107    gcc-11.5.0 smatch
sparc                randconfig-r2300-20261107    gcc-15.3.0 sparse
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261107    gcc-10.5.0
sparc64               randconfig-1001-20261107    gcc-10.5.0
sparc64               randconfig-2000-20261107    clang-24
sparc64               randconfig-2001-20261107    clang-24
sparc64               randconfig-2200-20261107    clang-20   smatch
sparc64              randconfig-r2106-20261107    clang-24   cocci
sparc64              randconfig-r2108-20261107    clang-24   cocci
sparc64              randconfig-r2111-20261107    clang-24   cocci
sparc64              randconfig-r2302-20261107    gcc-8.5.0  sparse
sparc64              randconfig-r2304-20261107    gcc-8.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261107    gcc-10.5.0
um                    randconfig-1001-20261107    gcc-10.5.0
um                    randconfig-2000-20261107    clang-24
um                    randconfig-2001-20261107    clang-24
um                    randconfig-2200-20261107    gcc-14     smatch
um                   randconfig-r2103-20261107    gcc-12.5.0 cocci
um                            x86_64_defconfig    gcc-14
um                            x86_64_defconfig    gcc-16.2.0
x86_64                            alldefconfig    gcc-16.2.0
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261107    gcc-14
x86_64      buildonly-randconfig-1001-20261107    gcc-14
x86_64      buildonly-randconfig-1002-20261107    gcc-14
x86_64      buildonly-randconfig-1003-20261107    gcc-14
x86_64      buildonly-randconfig-1004-20261107    gcc-14
x86_64      buildonly-randconfig-1005-20261107    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261107    gcc-14
x86_64                randconfig-1001-20261107    gcc-14
x86_64                randconfig-1002-20261107    gcc-14
x86_64                randconfig-1003-20261107    gcc-14
x86_64                randconfig-1004-20261107    gcc-14
x86_64                randconfig-1005-20261107    gcc-14
x86_64                randconfig-1006-20261107    gcc-13
x86_64                randconfig-1007-20261107    gcc-13
x86_64                randconfig-1008-20261107    gcc-13
x86_64                randconfig-1009-20261107    gcc-13
x86_64                randconfig-1010-20261107    gcc-13
x86_64                randconfig-1011-20261107    gcc-13
x86_64                randconfig-1012-20261107    clang-22
x86_64                randconfig-1013-20261107    clang-22
x86_64                randconfig-1014-20261107    clang-22
x86_64                randconfig-1015-20261107    clang-22
x86_64                randconfig-1016-20261107    clang-22
x86_64                randconfig-1017-20261107    clang-22
x86_64                randconfig-2000-20261107    clang-22
x86_64                randconfig-2001-20261107    clang-22
x86_64                randconfig-2002-20261107    clang-22
x86_64                randconfig-2003-20261107    clang-22
x86_64                randconfig-2004-20261107    clang-22
x86_64                randconfig-2005-20261107    clang-22
x86_64                randconfig-2100-20261107    gcc-14     cocci
x86_64                randconfig-2101-20261107    gcc-14     cocci
x86_64                randconfig-2102-20261107    gcc-14     cocci
x86_64                randconfig-2103-20261107    gcc-14     cocci
x86_64                randconfig-2104-20261107    gcc-14     cocci
x86_64                randconfig-2105-20261107    gcc-14     cocci
x86_64                randconfig-2200-20261107    clang-22   smatch
x86_64                randconfig-2300-20261107    gcc-14     sparse
x86_64                randconfig-2301-20261107    gcc-14     sparse
x86_64                randconfig-2302-20261107    gcc-14     sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                            alldefconfig    gcc-16.2.0
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                        common_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261107    gcc-10.5.0
xtensa                randconfig-1001-20261107    gcc-10.5.0
xtensa                randconfig-2000-20261107    clang-24
xtensa                randconfig-2001-20261107    clang-24
xtensa                randconfig-2200-20261107    gcc-13.5.0 smatch
xtensa               randconfig-r2302-20261107    gcc-15.3.0 sparse
xtensa               randconfig-r2305-20261107    gcc-15.3.0 sparse
xtensa                          virt_defconfig    gcc-16.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
