Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C519FC624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 04:21:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5DC10E03C;
	Thu,  3 Sep 2026 04:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WO0e8EH9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CE610E03C
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 04:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788409313; x=1819945313;
 h=date:from:to:cc:subject:message-id;
 bh=dHEN0yFdtmS5yz0OKcpg7VLwBwTMFUt5m0/T4OChMp4=;
 b=WO0e8EH9tf0wATfdRaIzhhqBiWy1qMbZCZw0EnJJ0rqQlUbAqFuM31jg
 6Fgje1P+9pP5pTtx+UNopL7yy61YqABLza1d+nKldu0Ycn02SfZqpojOX
 XHQ0b9Hw0zsNVUiHeTJQlPAFCEbOxNa/gtlIkdTAvwqvwrvCL9PrudNef
 QhJTIanSLkyrztNspyXDicOXVmFlYawIW7Mo4Mx9iW4Em/IeENlUb/sYL
 m+f0CvMajqPYzR7/FyFbOuzRU/fbKVzZe2TKJbuTZn+/AANbPUHd8at63
 dexwaZFlQpekv8tizSyWIhA0tgAqyvsZFY9idP/61F9FLUqv9y27N1Vbu w==;
X-CSE-ConnectionGUID: e9LudWtJTWqKKhQFux1wIQ==
X-CSE-MsgGUID: 7XMBczxWTcOT6JqeiyD4cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100235408"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="100235408"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 21:21:53 -0700
X-CSE-ConnectionGUID: vJBniHFSRsuS0D17y3c+WQ==
X-CSE-MsgGUID: 5jx6mytETkyqkbXPF9pPAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="270149242"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 02 Sep 2026 21:21:52 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1x1yxR-00000000440-27KY;
 Thu, 03 Sep 2026 04:21:49 +0000
Date: Thu, 03 Sep 2026 12:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 cc467969646b9778c947bec1383fb3cdaada14d5
Message-ID: <202609031235.L12pR9eI-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: cc467969646b9778c947bec1383fb3cdaada14d5  Merge drm/drm-next into drm-xe-next

elapsed time: 2868m

configs tested: 106
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                    allnoconfig    gcc-16.1.0
alpha                   allyesconfig    gcc-16.1.0
alpha       randconfig-r054-20260902    clang-22
arc                     allmodconfig    clang-24
arc                     allmodconfig    gcc-16.1.0
arc                      allnoconfig    gcc-16.1.0
arc                     allyesconfig    clang-24
arc         randconfig-r122-20260901    clang-24
arc         randconfig-r122-20260902    clang-24
arm                      allnoconfig    gcc-16.1.0
arm                     allyesconfig    clang-24
arm         randconfig-r052-20260902    clang-22
arm         randconfig-r112-20260901    clang-24
arm64                   allmodconfig    clang-24
arm64                    allnoconfig    gcc-16.1.0
arm64       randconfig-r053-20260902    clang-24
csky                    allmodconfig    gcc-16.1.0
csky                     allnoconfig    gcc-16.1.0
csky        randconfig-r061-20260902    clang-22
csky        randconfig-r062-20260902    clang-22
csky        randconfig-r072-20260902    gcc-14.3.0
csky        randconfig-r111-20260902    clang-24
hexagon                 allmodconfig    gcc-16.1.0
hexagon                  allnoconfig    gcc-16.1.0
hexagon     randconfig-r053-20260902    clang-24
hexagon     randconfig-r071-20260902    clang-24
i386                    allmodconfig    clang-22
i386                     allnoconfig    gcc-16.1.0
i386                    allyesconfig    clang-22
i386         randconfig-051-20260901    gcc-12
i386         randconfig-051-20260902    clang-22
i386         randconfig-052-20260901    gcc-12
i386         randconfig-052-20260902    clang-22
i386         randconfig-053-20260901    gcc-12
i386         randconfig-053-20260902    clang-22
i386         randconfig-054-20260901    gcc-12
i386         randconfig-054-20260902    clang-22
i386         randconfig-141-20260901    gcc-14
i386         randconfig-141-20260902    clang-22
i386        randconfig-r063-20260901    clang-22
i386        randconfig-r063-20260902    clang-22
loongarch               allmodconfig    clang-24
loongarch                allnoconfig    gcc-16.1.0
m68k                    allmodconfig    gcc-16.1.0
m68k                     allnoconfig    gcc-16.1.0
m68k                    allyesconfig    clang-24
m68k                    allyesconfig    gcc-16.1.0
m68k        randconfig-r054-20260902    clang-24
microblaze               allnoconfig    gcc-16.1.0
microblaze              allyesconfig    gcc-16.1.0
microblaze  randconfig-r113-20260901    clang-24
mips                    allmodconfig    gcc-16.1.0
mips                     allnoconfig    gcc-16.1.0
mips                    allyesconfig    gcc-16.1.0
mips        randconfig-r134-20260902    gcc-13.4.0
nios2                   allmodconfig    clang-20
nios2                    allnoconfig    clang-24
nios2       randconfig-r072-20260902    gcc-8.5.0
nios2       randconfig-r111-20260901    clang-24
nios2       randconfig-r123-20260901    clang-24
openrisc                allmodconfig    clang-20
openrisc                 allnoconfig    clang-24
openrisc    randconfig-r052-20260902    clang-24
openrisc    randconfig-r053-20260902    clang-22
openrisc    randconfig-r064-20260902    clang-22
openrisc    randconfig-r071-20260902    gcc-16.1.0
parisc                  allmodconfig    gcc-16.1.0
parisc                   allnoconfig    clang-24
parisc                  allyesconfig    clang-17
parisc      randconfig-r054-20260902    clang-24
parisc      randconfig-r121-20260902    clang-24
powerpc                 allmodconfig    gcc-16.1.0
powerpc                  allnoconfig    clang-24
powerpc     randconfig-r132-20260902    gcc-13.4.0
powerpc     randconfig-r133-20260902    gcc-13.4.0
powerpc64   randconfig-r112-20260902    clang-24
riscv                   allmodconfig    clang-24
riscv                    allnoconfig    clang-24
riscv                   allyesconfig    clang-24
riscv       randconfig-r051-20260902    clang-22
s390                    allmodconfig    clang-17
s390                     allnoconfig    clang-24
s390                    allyesconfig    gcc-16.1.0
sh                      allmodconfig    gcc-16.1.0
sh                       allnoconfig    clang-24
sh                      allyesconfig    clang-17
sh          randconfig-r061-20260901    clang-22
sh          randconfig-r062-20260901    clang-22
sh          randconfig-r121-20260901    clang-24
sparc                    allnoconfig    clang-24
sparc       randconfig-r052-20260902    clang-24
sparc64                 allmodconfig    clang-20
sparc64     randconfig-r051-20260902    clang-24
sparc64     randconfig-r113-20260902    clang-24
sparc64     randconfig-r131-20260902    gcc-13.4.0
um                      allmodconfig    clang-17
um                       allnoconfig    clang-24
um                      allyesconfig    gcc-16.1.0
um          randconfig-r064-20260901    clang-22
x86_64                  allmodconfig    clang-22
x86_64                   allnoconfig    clang-24
x86_64                  allyesconfig    clang-22
x86_64                 rhel-9.4-rust    clang-22
xtensa                   allnoconfig    clang-24
xtensa                  allyesconfig    clang-20
xtensa      randconfig-r123-20260902    clang-24

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
