Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABCFCD8C92
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 12:33:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9E810E2E8;
	Tue,  9 Jun 2026 12:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvNzde29";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F2210E2ED
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 12:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781008420; x=1812544420;
 h=date:from:to:cc:subject:message-id;
 bh=CjzUJkvS03PPE6yiH5jOveKy/vgqX2d38r6vFdZUS/M=;
 b=hvNzde29PoEPHkKDBUuF9fnEmE38XVFOjxzrsaodO1Zb4GcPwsC7FFcH
 5SuH0Ib2dTu9d10SIcutEZQZShNvpwjTzheXljAbFOjYSekAq2fHhXtZw
 H8CwAo6FTvl/rKlIrCJSWhRTakq4JxumTInQXn62jPrPKrfLTBKGfex4Q
 4y/9JU10O0x0vuaNNuNuId0/fFMtGd/bMIqPao+xiF3tvhGnHOS3QpC7Y
 WPqjT9xIf6X5TY0WaYSnpbQyH6rQJRVvYBlif6X4BOU8r3sjSrAn3dobT
 G0a1oX9i0o/t1KQPU6w2kKd3GrxXeMg34Z9tcod7OcupQwRXjhnBSIZYD A==;
X-CSE-ConnectionGUID: owxfGJXZQ9GhzCo85e4npw==
X-CSE-MsgGUID: 3c1cnsM1Tz+pCvQAb4SFvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81513760"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="81513760"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:33:39 -0700
X-CSE-ConnectionGUID: AVoRrrj9Tt+aLomZYVd+yw==
X-CSE-MsgGUID: pNSjGv5/SE2o6+i5KA977g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="242896708"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 09 Jun 2026 05:33:38 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wWveB-00000000K0g-3dYq;
 Tue, 09 Jun 2026 12:33:35 +0000
Date: Tue, 09 Jun 2026 20:32:52 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:topic/xe-for-CI] BUILD SUCCESS
 1cf7dc778fc0682a29c228939df45bb7be27a433
Message-ID: <202606092042.Pl0yWf2t-lkp@intel.com>
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
branch HEAD: 1cf7dc778fc0682a29c228939df45bb7be27a433  topic/xe-for-CI: Define GuC firmware for NVL-P

elapsed time: 5113m

configs tested: 55
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    gcc-16.1.0
arm           allnoconfig    clang-23
arm          allyesconfig    gcc-16.1.0
arm64        allmodconfig    clang-23
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    clang-23
hexagon       allnoconfig    clang-23
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-20
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-16.1.0
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-23
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-23
s390         allmodconfig    clang-23
s390          allnoconfig    clang-23
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-23
um            allnoconfig    clang-16
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
