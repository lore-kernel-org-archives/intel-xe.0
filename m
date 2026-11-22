Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4309B606A31A
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 22:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bTrUx2ns
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C9210E095;
	Sun, 22 Nov 2026 22:42:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D3A10E095
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 22:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795387315; x=1826923315;
 h=date:from:to:cc:subject:message-id;
 bh=uBJhK8jVWA0q85+7+NROhWNG0dGQedFxjnc46IAkR7o=;
 b=bTrUx2nsdWdV+q7vmTb909XUAvFKOmrStrKuxoIMLmK+r4MCpVTgYq8W
 Lf+Ia+k8l0lHzz2r3mnOkoGwYUP4l2LAuSkPDdCllH/thIfaGqR8wmRIj
 emInH752fk6CC11RFbVpOmvSHAoayw5kdW6g8zT7m4EnVK9WO3dLx5iNI
 QuDT2mggwKsl7D/ea9B2RwDq3G6Nvb8DlguaBEvP0Ms5wlPAREu47BHMr
 OSNJVcrcxDPNOON5Ewz2ksAWwvwRvQi38haERjVb+V7bowALEg6abh85f
 rbf3nJoe7RmIToICCTIO5L+/RcNHPChnz3+UL7qkqMqoOgXYKKB8k75+A g==;
X-CSE-ConnectionGUID: elBN0bCaRGGBhetMFMbkkw==
X-CSE-MsgGUID: E3xrNyU6SBaUXSltOsPLnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4083671"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4083671"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 14:41:55 -0800
X-CSE-ConnectionGUID: AX/mQ+vXTtu+snZjxPYDqQ==
X-CSE-MsgGUID: yOIk4YU7RzORgXy702KHUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11154751"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 22 Nov 2026 14:41:53 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1xVGFr-00000001MAW-0KQv;
 Sun, 22 Nov 2026 22:41:51 +0000
Date: Mon, 23 Nov 2026 06:41:01 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 6bae3d8f569445db5e3385b61efa5f9ba9eed3d3
Message-ID: <20261123064101.yTYMywSB-lkp@intel.com>
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
branch HEAD: 6bae3d8f569445db5e3385b61efa5f9ba9eed3d3  drm/xe/hwmon: Unregister hwmon before the device is unplugged

elapsed time: 1490m

configs tested: 366
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        randconfig-2000-20261120    gcc-15.3.0
alpha        randconfig-2000-20261121    gcc-14.4.0
alpha        randconfig-2001-20261120    gcc-15.3.0
alpha        randconfig-2001-20261121    gcc-14.4.0
alpha        randconfig-2200-20261120    gcc-15.3.0 smatch
alpha        randconfig-2200-20261121    gcc-10.5.0 smatch
alpha       randconfig-r2103-20261121    gcc-9.5.0  cocci
alpha       randconfig-r2301-20261121    clang-17   sparse
alpha       randconfig-r2301-20261121    gcc-14     sparse
alpha       randconfig-r2305-20261121    clang-17   sparse
alpha       randconfig-r2309-20261121    gcc-11.5.0 sparse
arc          randconfig-2000-20261120    gcc-11.5.0
arc          randconfig-2000-20261121    gcc-8.5.0
arc          randconfig-2001-20261120    gcc-11.5.0
arc          randconfig-2001-20261121    gcc-8.5.0
arc          randconfig-2002-20261120    gcc-11.5.0
arc          randconfig-2002-20261121    gcc-8.5.0
arc          randconfig-2003-20261120    gcc-11.5.0
arc          randconfig-2003-20261121    gcc-8.5.0
arc          randconfig-2004-20261120    gcc-11.5.0
arc          randconfig-2004-20261121    gcc-8.5.0
arc          randconfig-2005-20261120    gcc-11.5.0
arc          randconfig-2005-20261121    gcc-8.5.0
arc          randconfig-2200-20261120    gcc-15.3.0 smatch
arc          randconfig-2200-20261121    gcc-14.4.0 smatch
arc         randconfig-r2109-20261120    gcc-8.5.0  cocci
arc         randconfig-r2109-20261121    gcc-8.5.0  cocci
arc         randconfig-r2111-20261121    gcc-14.4.0 cocci
arc         randconfig-r2304-20261120    clang-24   sparse
arc         randconfig-r2309-20261120    clang-24   sparse
arm          randconfig-2000-20261120    gcc-8.5.0
arm          randconfig-2000-20261121    clang-24
arm          randconfig-2001-20261120    gcc-8.5.0
arm          randconfig-2001-20261121    clang-24
arm          randconfig-2002-20261120    gcc-8.5.0
arm          randconfig-2002-20261121    clang-24
arm          randconfig-2200-20261120    clang-17   smatch
arm          randconfig-2200-20261121    clang-19   smatch
arm         randconfig-r2106-20261120    gcc-8.5.0  cocci
arm         randconfig-r2300-20261121    gcc-14     sparse
arm         randconfig-r2304-20261121    gcc-8.5.0  sparse
arm         randconfig-r2310-20261121    gcc-15.3.0 sparse
arm64        randconfig-2000-20261120    gcc-8.5.0
arm64        randconfig-2000-20261121    clang-24
arm64        randconfig-2001-20261120    gcc-8.5.0
arm64        randconfig-2001-20261121    clang-24
arm64        randconfig-2002-20261120    gcc-8.5.0
arm64        randconfig-2002-20261121    clang-24
arm64        randconfig-2200-20261121    clang-22   smatch
arm64       randconfig-r2101-20261121    gcc-9.5.0  cocci
arm64       randconfig-r2102-20261120    clang-24   cocci
arm64       randconfig-r2300-20261120    clang-24   sparse
arm64       randconfig-r2301-20261120    gcc-8.5.0  sparse
arm64       randconfig-r2304-20261121    clang-17   sparse
arm64       randconfig-r2309-20261121    gcc-16.2.0 sparse
csky         randconfig-2000-20261120    gcc-16.2.0
csky         randconfig-2000-20261121    gcc-16.2.0
csky         randconfig-2001-20261120    gcc-16.2.0
csky         randconfig-2001-20261121    gcc-16.2.0
csky         randconfig-2200-20261120    gcc-15.3.0 smatch
csky         randconfig-2200-20261121    gcc-16.2.0 smatch
csky        randconfig-r2100-20261121    gcc-14     cocci
csky        randconfig-r2103-20261121    clang-24   cocci
csky        randconfig-r2108-20261121    gcc-13.5.0 cocci
csky        randconfig-r2303-20261121    gcc-14     sparse
csky        randconfig-r2309-20261121    gcc-10.5.0 sparse
hexagon      randconfig-2000-20261120    gcc-16.2.0
hexagon      randconfig-2000-20261121    gcc-16.2.0
hexagon      randconfig-2001-20261120    gcc-16.2.0
hexagon      randconfig-2001-20261121    gcc-16.2.0
hexagon      randconfig-2200-20261120    clang-17   smatch
hexagon      randconfig-2200-20261121    clang-24   smatch
hexagon     randconfig-r2106-20261120    clang-17   cocci
hexagon     randconfig-r2108-20261120    gcc-8.5.0  cocci
hexagon     randconfig-r2108-20261121    gcc-14.4.0 cocci
hexagon     randconfig-r2109-20261121    gcc-13.5.0 cocci
hexagon     randconfig-r2302-20261121    clang-17   sparse
hexagon     randconfig-r2304-20261121    gcc-14     sparse
i386         randconfig-2000-20261120    clang-22
i386         randconfig-2000-20261121    gcc-14
i386         randconfig-2001-20261120    clang-22
i386         randconfig-2001-20261121    gcc-14
i386         randconfig-2002-20261120    clang-22
i386         randconfig-2002-20261121    gcc-14
i386         randconfig-2003-20261120    clang-22
i386         randconfig-2003-20261121    gcc-14
i386         randconfig-2004-20261120    clang-22
i386         randconfig-2004-20261121    gcc-14
i386         randconfig-2005-20261120    clang-22
i386         randconfig-2005-20261121    gcc-14
i386         randconfig-2100-20261120    gcc-14     cocci
i386         randconfig-2100-20261121    clang-22   cocci
i386         randconfig-2101-20261120    gcc-14     cocci
i386         randconfig-2101-20261121    clang-22   cocci
i386         randconfig-2102-20261120    gcc-14     cocci
i386         randconfig-2102-20261121    clang-22   cocci
i386         randconfig-2103-20261120    gcc-14     cocci
i386         randconfig-2103-20261121    clang-22   cocci
i386         randconfig-2104-20261120    gcc-14     cocci
i386         randconfig-2104-20261121    clang-22   cocci
i386         randconfig-2105-20261120    gcc-14     cocci
i386         randconfig-2105-20261121    clang-22   cocci
i386         randconfig-2200-20261120    clang-22   smatch
i386         randconfig-2200-20261121    clang-22   smatch
i386         randconfig-2300-20261120    clang-22   sparse
i386         randconfig-2300-20261121    gcc-14     sparse
i386         randconfig-2301-20261120    clang-22   sparse
i386         randconfig-2301-20261121    gcc-14     sparse
i386         randconfig-2302-20261120    clang-22   sparse
i386         randconfig-2302-20261121    gcc-14     sparse
i386        randconfig-r2110-20261120    clang-17   cocci
i386        randconfig-r2110-20261121    gcc-13.5.0 cocci
i386        randconfig-r2111-20261120    clang-17   cocci
i386        randconfig-r2302-20261120    gcc-8.5.0  sparse
i386        randconfig-r2308-20261121    gcc-10.5.0 sparse
loongarch    randconfig-2000-20261120    clang-24
loongarch    randconfig-2000-20261121    clang-22
loongarch    randconfig-2001-20261120    clang-24
loongarch    randconfig-2001-20261121    clang-22
loongarch    randconfig-2200-20261120    clang-18   smatch
loongarch    randconfig-2200-20261121    gcc-16.2.0 smatch
loongarch   randconfig-r2101-20261120    clang-24   cocci
loongarch   randconfig-r2103-20261120    clang-24   cocci
loongarch   randconfig-r2104-20261120    clang-24   cocci
loongarch   randconfig-r2109-20261120    clang-17   cocci
loongarch   randconfig-r2110-20261120    gcc-8.5.0  cocci
loongarch   randconfig-r2311-20261120    clang-24   sparse
m68k         randconfig-2000-20261120    gcc-15.3.0
m68k         randconfig-2000-20261121    gcc-14.4.0
m68k         randconfig-2001-20261120    gcc-15.3.0
m68k         randconfig-2001-20261121    gcc-14.4.0
m68k         randconfig-2200-20261120    gcc-14.4.0 smatch
m68k         randconfig-2200-20261121    gcc-8.5.0  smatch
m68k        randconfig-r2101-20261120    clang-24   cocci
m68k        randconfig-r2104-20261120    clang-24   cocci
m68k        randconfig-r2105-20261120    clang-24   cocci
m68k        randconfig-r2310-20261121    gcc-11.5.0 sparse
m68k        randconfig-r2311-20261121    gcc-11.5.0 sparse
microblaze   randconfig-2000-20261120    gcc-15.3.0
microblaze   randconfig-2000-20261121    gcc-14.4.0
microblaze   randconfig-2001-20261120    gcc-15.3.0
microblaze   randconfig-2001-20261121    gcc-14.4.0
microblaze   randconfig-2200-20261120    gcc-11.5.0 smatch
microblaze   randconfig-2200-20261121    gcc-8.5.0  smatch
microblaze  randconfig-r2300-20261120    gcc-8.5.0  sparse
microblaze  randconfig-r2306-20261121    gcc-10.5.0 sparse
microblaze  randconfig-r2307-20261121    gcc-16.2.0 sparse
microblaze  randconfig-r2308-20261121    gcc-15.3.0 sparse
microblaze  randconfig-r2310-20261121    gcc-16.2.0 sparse
mips         randconfig-2000-20261120    gcc-9.5.0
mips         randconfig-2000-20261121    gcc-16.2.0
mips         randconfig-2001-20261120    gcc-9.5.0
mips         randconfig-2001-20261121    gcc-16.2.0
mips         randconfig-2002-20261120    gcc-9.5.0
mips         randconfig-2002-20261121    gcc-16.2.0
mips         randconfig-2200-20261120    clang-24   smatch
mips         randconfig-2200-20261121    clang-21   smatch
mips        randconfig-r2107-20261120    gcc-8.5.0  cocci
mips        randconfig-r2110-20261121    gcc-14.4.0 cocci
mips        randconfig-r2302-20261120    clang-24   sparse
mips        randconfig-r2302-20261121    gcc-8.5.0  sparse
mips        randconfig-r2306-20261121    gcc-16.2.0 sparse
nios2        randconfig-2000-20261120    clang-24
nios2        randconfig-2000-20261121    clang-22
nios2        randconfig-2001-20261120    clang-24
nios2        randconfig-2001-20261121    clang-22
nios2        randconfig-2200-20261120    gcc-11.5.0 smatch
nios2        randconfig-2200-20261121    gcc-10.5.0 smatch
nios2       randconfig-r2103-20261120    clang-24   cocci
nios2       randconfig-r2105-20261121    gcc-9.5.0  cocci
nios2       randconfig-r2111-20261121    gcc-13.5.0 cocci
nios2       randconfig-r2305-20261121    gcc-8.5.0  sparse
nios2       randconfig-r2306-20261120    clang-24   sparse
openrisc     randconfig-2000-20261120    gcc-9.5.0
openrisc     randconfig-2000-20261121    gcc-16.2.0
openrisc     randconfig-2001-20261120    gcc-9.5.0
openrisc     randconfig-2001-20261121    gcc-16.2.0
openrisc     randconfig-2002-20261120    gcc-9.5.0
openrisc     randconfig-2002-20261121    gcc-16.2.0
openrisc     randconfig-2200-20261120    gcc-11.5.0 smatch
openrisc     randconfig-2200-20261121    gcc-14.4.0 smatch
openrisc    randconfig-r2102-20261121    gcc-14     cocci
openrisc    randconfig-r2103-20261121    gcc-14     cocci
openrisc    randconfig-r2300-20261121    gcc-8.5.0  sparse
openrisc    randconfig-r2303-20261121    gcc-8.5.0  sparse
openrisc    randconfig-r2305-20261120    clang-24   sparse
openrisc    randconfig-r2305-20261120    gcc-8.5.0  sparse
parisc       randconfig-2000-20261120    clang-24
parisc       randconfig-2000-20261121    clang-22
parisc       randconfig-2001-20261120    clang-24
parisc       randconfig-2001-20261121    clang-22
parisc       randconfig-2200-20261120    gcc-8.5.0  smatch
parisc       randconfig-2200-20261121    gcc-16.2.0 smatch
parisc      randconfig-r2108-20261121    gcc-8.5.0  cocci
parisc      randconfig-r2303-20261121    clang-17   sparse
parisc      randconfig-r2306-20261121    gcc-15.3.0 sparse
powerpc      randconfig-2000-20261120    clang-24
powerpc      randconfig-2000-20261121    clang-24
powerpc      randconfig-2001-20261120    clang-24
powerpc      randconfig-2001-20261121    clang-24
powerpc      randconfig-2002-20261120    clang-24
powerpc      randconfig-2002-20261121    clang-24
powerpc      randconfig-2200-20261120    clang-17   smatch
powerpc      randconfig-2200-20261121    gcc-11.5.0 smatch
powerpc     randconfig-r2100-20261120    clang-24   cocci
powerpc     randconfig-r2101-20261121    clang-24   cocci
powerpc     randconfig-r2104-20261121    gcc-9.5.0  cocci
powerpc     randconfig-r2308-20261120    clang-24   sparse
powerpc     randconfig-r2308-20261121    gcc-16.2.0 sparse
powerpc64    randconfig-2000-20261120    clang-24
powerpc64    randconfig-2000-20261121    clang-24
powerpc64    randconfig-2001-20261120    clang-24
powerpc64    randconfig-2001-20261121    clang-24
powerpc64    randconfig-2002-20261120    clang-24
powerpc64    randconfig-2002-20261121    clang-24
powerpc64    randconfig-2200-20261120    gcc-16.2.0 smatch
powerpc64    randconfig-2200-20261121    gcc-10.5.0 smatch
powerpc64   randconfig-r2100-20261120    clang-24   cocci
powerpc64   randconfig-r2104-20261121    gcc-14     cocci
powerpc64   randconfig-r2109-20261121    gcc-14.4.0 cocci
powerpc64   randconfig-r2303-20261120    gcc-8.5.0  sparse
powerpc64   randconfig-r2307-20261121    gcc-11.5.0 sparse
riscv        randconfig-2000-20261120    clang-24
riscv        randconfig-2000-20261121    gcc-9.5.0
riscv        randconfig-2001-20261120    clang-24
riscv        randconfig-2001-20261121    gcc-9.5.0
riscv        randconfig-2002-20261120    clang-24
riscv        randconfig-2002-20261121    gcc-9.5.0
riscv        randconfig-2003-20261120    clang-24
riscv        randconfig-2003-20261121    gcc-9.5.0
riscv        randconfig-2004-20261120    clang-24
riscv        randconfig-2004-20261121    gcc-9.5.0
riscv        randconfig-2005-20261120    clang-24
riscv        randconfig-2005-20261121    gcc-9.5.0
riscv        randconfig-2200-20261120    gcc-8.5.0  smatch
riscv        randconfig-2200-20261121    clang-24   smatch
riscv       randconfig-r2102-20261120    clang-24   cocci
riscv       randconfig-r2107-20261121    gcc-13.5.0 cocci
riscv       randconfig-r2107-20261121    gcc-8.5.0  cocci
riscv       randconfig-r2108-20261120    clang-17   cocci
riscv       randconfig-r2310-20261120    clang-24   sparse
s390         randconfig-2000-20261120    clang-24
s390         randconfig-2000-20261121    clang-22
s390         randconfig-2001-20261120    clang-24
s390         randconfig-2001-20261121    clang-22
s390         randconfig-2002-20261120    clang-24
s390         randconfig-2002-20261121    clang-22
s390         randconfig-2003-20261120    clang-24
s390         randconfig-2003-20261121    clang-22
s390         randconfig-2004-20261120    clang-24
s390         randconfig-2004-20261121    clang-22
s390         randconfig-2005-20261120    clang-24
s390         randconfig-2005-20261121    clang-22
s390         randconfig-2200-20261120    clang-17   smatch
s390         randconfig-2200-20261121    gcc-8.5.0  smatch
s390        randconfig-r2100-20261121    clang-24   cocci
s390        randconfig-r2100-20261121    gcc-9.5.0  cocci
s390        randconfig-r2102-20261121    clang-24   cocci
s390        randconfig-r2106-20261121    gcc-13.5.0 cocci
s390        randconfig-r2106-20261121    gcc-14.4.0 cocci
s390        randconfig-r2306-20261121    gcc-11.5.0 sparse
s390        randconfig-r2307-20261120    clang-24   sparse
sh           randconfig-2000-20261120    gcc-11.5.0
sh           randconfig-2000-20261121    gcc-16.2.0
sh           randconfig-2001-20261120    gcc-11.5.0
sh           randconfig-2001-20261121    gcc-16.2.0
sh           randconfig-2002-20261120    gcc-11.5.0
sh           randconfig-2002-20261121    gcc-16.2.0
sh           randconfig-2003-20261120    gcc-11.5.0
sh           randconfig-2003-20261121    gcc-16.2.0
sh           randconfig-2004-20261120    gcc-11.5.0
sh           randconfig-2004-20261121    gcc-16.2.0
sh           randconfig-2005-20261120    gcc-11.5.0
sh           randconfig-2005-20261121    gcc-16.2.0
sh           randconfig-2200-20261120    gcc-11.5.0 smatch
sh           randconfig-2200-20261121    gcc-10.5.0 smatch
sh          randconfig-r2110-20261121    gcc-8.5.0  cocci
sh          randconfig-r2307-20261121    gcc-10.5.0 sparse
sh          randconfig-r2311-20261121    gcc-15.3.0 sparse
sh          randconfig-r2311-20261121    gcc-16.2.0 sparse
sparc        randconfig-2000-20261120    gcc-8.5.0
sparc        randconfig-2000-20261121    gcc-8.5.0
sparc        randconfig-2001-20261120    gcc-8.5.0
sparc        randconfig-2001-20261121    gcc-8.5.0
sparc        randconfig-2200-20261120    gcc-11.5.0 smatch
sparc        randconfig-2200-20261121    gcc-8.5.0  smatch
sparc       randconfig-r2102-20261121    gcc-9.5.0  cocci
sparc       randconfig-r2107-20261121    gcc-14.4.0 cocci
sparc       randconfig-r2300-20261121    clang-17   sparse
sparc       randconfig-r2301-20261121    gcc-8.5.0  sparse
sparc       randconfig-r2310-20261121    gcc-10.5.0 sparse
sparc64      randconfig-2000-20261120    gcc-8.5.0
sparc64      randconfig-2000-20261121    gcc-8.5.0
sparc64      randconfig-2001-20261120    gcc-8.5.0
sparc64      randconfig-2001-20261121    gcc-8.5.0
sparc64      randconfig-2200-20261120    gcc-14.4.0 smatch
sparc64      randconfig-2200-20261121    clang-20   smatch
sparc64     randconfig-r2104-20261121    clang-24   cocci
sparc64     randconfig-r2107-20261120    clang-17   cocci
sparc64     randconfig-r2111-20261120    gcc-8.5.0  cocci
sparc64     randconfig-r2309-20261121    gcc-15.3.0 sparse
um           randconfig-2000-20261120    gcc-8.5.0
um           randconfig-2000-20261121    gcc-8.5.0
um           randconfig-2001-20261120    gcc-8.5.0
um           randconfig-2001-20261121    gcc-8.5.0
um           randconfig-2200-20261120    clang-24   smatch
um           randconfig-2200-20261121    gcc-14     smatch
um          randconfig-r2105-20261120    clang-24   cocci
um          randconfig-r2106-20261121    gcc-8.5.0  cocci
um          randconfig-r2301-20261120    clang-24   sparse
um          randconfig-r2303-20261120    clang-24   sparse
x86_64                          kexec    clang-22
x86_64       randconfig-2000-20261120    clang-22
x86_64       randconfig-2000-20261121    gcc-14
x86_64       randconfig-2001-20261120    clang-22
x86_64       randconfig-2001-20261121    gcc-14
x86_64       randconfig-2002-20261120    clang-22
x86_64       randconfig-2002-20261121    gcc-14
x86_64       randconfig-2003-20261120    clang-22
x86_64       randconfig-2003-20261121    gcc-14
x86_64       randconfig-2004-20261120    clang-22
x86_64       randconfig-2004-20261121    gcc-14
x86_64       randconfig-2005-20261120    clang-22
x86_64       randconfig-2005-20261121    gcc-14
x86_64       randconfig-2100-20261120    gcc-14     cocci
x86_64       randconfig-2100-20261121    gcc-14     cocci
x86_64       randconfig-2101-20261120    gcc-14     cocci
x86_64       randconfig-2101-20261121    gcc-14     cocci
x86_64       randconfig-2102-20261120    gcc-14     cocci
x86_64       randconfig-2102-20261121    gcc-14     cocci
x86_64       randconfig-2103-20261120    gcc-14     cocci
x86_64       randconfig-2103-20261121    gcc-14     cocci
x86_64       randconfig-2104-20261120    gcc-14     cocci
x86_64       randconfig-2104-20261121    gcc-14     cocci
x86_64       randconfig-2105-20261120    gcc-14     cocci
x86_64       randconfig-2105-20261121    gcc-14     cocci
x86_64       randconfig-2200-20261120    clang-22   smatch
x86_64       randconfig-2200-20261121    gcc-14     smatch
x86_64       randconfig-2300-20261120    clang-22   sparse
x86_64       randconfig-2300-20261121    gcc-14     sparse
x86_64       randconfig-2301-20261120    clang-22   sparse
x86_64       randconfig-2301-20261121    gcc-14     sparse
x86_64       randconfig-2302-20261120    clang-22   sparse
x86_64       randconfig-2302-20261121    gcc-14     sparse
x86_64      randconfig-r2101-20261121    gcc-14     cocci
x86_64      randconfig-r2305-20261121    gcc-14     sparse
x86_64      randconfig-r2311-20261121    gcc-10.5.0 sparse
x86_64                       rhel-9.4    clang-22
x86_64                   rhel-9.4-bpf    clang-22
x86_64                  rhel-9.4-func    clang-22
x86_64            rhel-9.4-kselftests    clang-22
x86_64                 rhel-9.4-kunit    clang-22
x86_64                   rhel-9.4-ltp    clang-22
x86_64                  rhel-9.4-rust    clang-22
xtensa       randconfig-2000-20261120    gcc-16.2.0
xtensa       randconfig-2000-20261121    gcc-16.2.0
xtensa       randconfig-2001-20261120    gcc-16.2.0
xtensa       randconfig-2001-20261121    gcc-16.2.0
xtensa       randconfig-2200-20261120    gcc-9.5.0  smatch
xtensa       randconfig-2200-20261121    gcc-12.5.0 smatch
xtensa      randconfig-r2105-20261121    gcc-14     cocci
xtensa      randconfig-r2111-20261121    gcc-8.5.0  cocci
xtensa      randconfig-r2302-20261121    gcc-14     sparse
xtensa      randconfig-r2304-20261120    gcc-8.5.0  sparse
xtensa      randconfig-r2307-20261121    gcc-15.3.0 sparse
xtensa      randconfig-r2308-20261121    gcc-11.5.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
