Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AF1F013E6
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 09:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E7B10E1F2;
	Mon, 16 Mar 2026 09:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UaAOhfYq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C5A10E1F2
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 09:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773652548; x=1805188548;
 h=date:from:to:cc:subject:message-id;
 bh=UaCN7ntRXvHKHlF75oTbe8QTW3VvVvz/L0lWt2UJ3TU=;
 b=UaAOhfYqpX1Slp6hNw7+SCnWXb2c/F7BT2opCza1Z40gfovcMw6I0YsG
 49ybieWtg0ebDnKYRnRkMP+YUzJ1Wjr6szwcxgHGUNTMKQUhpHbxS3olV
 yQcV2Bw04ItGSDjCfo0Ne6HpILCayEYtH0sVoISDBTYE7lXG2J1XuWNtd
 zTybCPbKDaRJgaKpRpdYwGHa6IEjnI972vnn2mHsOfuz6WUbWtY/U1E1n
 Yz3qZbnYbZ5aScOIpZYvGheAmbDWkCBz4or3otxGwotVXdcAAEBh9of7/
 yvG/i8Xp21Y4HsPjXkzOSI1zrbMkDLJKsZPdP5zGmwnMgJyoE1TeHoRY0 Q==;
X-CSE-ConnectionGUID: uKzjhRezT8um/LSDtX840w==
X-CSE-MsgGUID: M4UkodzRT4CdYaD4T1A5EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74849951"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="74849951"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 02:15:48 -0700
X-CSE-ConnectionGUID: +Q8J96YqRLS+TsMGYHgTEQ==
X-CSE-MsgGUID: 1hQ/pJtNQ9mCbRZ4N9bRkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="225965268"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 16 Mar 2026 02:15:46 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1w2435-000000000Q2-3gzA;
 Mon, 16 Mar 2026 09:15:43 +0000
Date: Mon, 16 Mar 2026 17:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:topic/xe-for-CI] BUILD SUCCESS
 bd9ef8d19f9e9ff47518ce48fb2002d58bfeeaaa
Message-ID: <202603161739.4GA1MavK-lkp@intel.com>
User-Agent: s-nail v14.9.25
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git topic/xe-for-CI
branch HEAD: bd9ef8d19f9e9ff47518ce48fb2002d58bfeeaaa  drm/xe/nvlp: Define GuC firmware for NVL-P

elapsed time: 814m

configs tested: 89
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
arc                    allmodconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc                    allyesconfig    gcc-15.2.0
arc         randconfig-001-20260316    gcc-10.5.0
arc         randconfig-002-20260316    gcc-9.5.0
arm                     allnoconfig    clang-23
arm                    allyesconfig    gcc-15.2.0
arm         randconfig-001-20260316    clang-23
arm         randconfig-002-20260316    clang-23
arm         randconfig-003-20260316    clang-23
arm         randconfig-004-20260316    clang-23
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.2.0
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-23
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
i386        randconfig-012-20260316    gcc-14
i386        randconfig-013-20260316    clang-20
i386        randconfig-014-20260316    gcc-13
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-23
loongarch   randconfig-002-20260316    clang-18
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    gcc-15.2.0
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
mips                   allmodconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
parisc      randconfig-001-20260316    gcc-8.5.0
powerpc                allmodconfig    gcc-15.2.0
powerpc                 allnoconfig    gcc-15.2.0
powerpc     randconfig-001-20260316    clang-23
powerpc     randconfig-002-20260316    clang-23
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
riscv                  allyesconfig    clang-16
riscv       randconfig-001-20260316    gcc-15.2.0
riscv       randconfig-002-20260316    gcc-8.5.0
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
s390        randconfig-001-20260316    clang-18
s390        randconfig-002-20260316    gcc-14.3.0
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    gcc-15.2.0
sh                        defconfig    gcc-15.2.0
sh                kfr2r09_defconfig    gcc-15.2.0
sh          randconfig-001-20260316    gcc-15.2.0
sh          randconfig-002-20260316    gcc-12.5.0
sparc                   allnoconfig    gcc-15.2.0
sparc       randconfig-001-20260316    gcc-8.5.0
sparc       randconfig-002-20260316    gcc-12.5.0
sparc64                allmodconfig    clang-23
sparc64                   defconfig    clang-20
sparc64     randconfig-001-20260316    gcc-8.5.0
sparc64     randconfig-002-20260316    gcc-15.2.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
um                        defconfig    clang-23
um                   i386_defconfig    gcc-14
um          randconfig-001-20260316    gcc-14
um          randconfig-002-20260316    clang-23
um                 x86_64_defconfig    clang-23
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                    defconfig    gcc-14
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.2.0
xtensa                 allyesconfig    gcc-15.2.0
xtensa      randconfig-001-20260316    gcc-15.2.0
xtensa      randconfig-002-20260316    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
