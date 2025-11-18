Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B97CED240
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 03:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639B210E139;
	Tue, 18 Nov 2025 03:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYAmfo5r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31FF10E139
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 03:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763435126; x=1794971126;
 h=date:from:to:cc:subject:message-id;
 bh=rhcpE+Tvim1qiAWozjYknHKJOtnf8nNRcmnykLLm1Gc=;
 b=kYAmfo5rpsJ0k/UgZUJVLJByLmHyB/XXqw15m4vGV8H9oYpbyh+rbuiQ
 Qc3W2w2BTOR1NbIP7HE/OMEWh8kBcr3ncug1KAR0Tragnqz4992nopL9S
 hjJZJcXdXMeqX31Ou60RMvxKaI8qAvmceME7xHcnWrv3AIlemGN3Rbaha
 vPX76OeYDjmntb6/Tm4LlnIpV1a7mELmxpxCIucD8XtlETfXa4Dy2+9PI
 1BKUXZFTZu5Hq35IUr7vHkgB/Rc9dOQtWeSTxxpHS2QZjwDyLYUFweq+a
 dYEZZEv/KXkA6CAyhTN2I5FH0X9ErqA7KLn/cANEztjG7kH/Q67p7Nyxn w==;
X-CSE-ConnectionGUID: MO9Y7Y2rS6O4fMYqDmsOFA==
X-CSE-MsgGUID: eRImeu1NQVq6EZfiu8zPVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69316518"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="69316518"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 19:05:25 -0800
X-CSE-ConnectionGUID: Ze4eUfygSW679vaKYiOdDw==
X-CSE-MsgGUID: Rro+h6QiT/e83tIj0tGF6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="195555841"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 17 Nov 2025 19:05:24 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vLC1y-0001H9-0u;
 Tue, 18 Nov 2025 03:05:22 +0000
Date: Tue, 18 Nov 2025 11:05:01 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 240372edaf854c9136f5ead45f2d8cd9496a9cb3
Message-ID: <202511181155.ygZ5CE2R-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: 240372edaf854c9136f5ead45f2d8cd9496a9cb3  drm/xe/xe3lpg: Extend Wa_15016589081 for xe3lpg

elapsed time: 7762m

configs tested: 71
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha               allnoconfig    gcc-15.1.0
alpha              allyesconfig    gcc-15.1.0
arc                allmodconfig    gcc-15.1.0
arc                 allnoconfig    gcc-15.1.0
arc                allyesconfig    gcc-15.1.0
arm                allmodconfig    gcc-15.1.0
arm                 allnoconfig    clang-22
arm64              allmodconfig    clang-19
arm64               allnoconfig    gcc-15.1.0
arm64              allyesconfig    clang-22
csky               allmodconfig    gcc-15.1.0
csky                allnoconfig    gcc-15.1.0
csky               allyesconfig    gcc-15.1.0
hexagon            allmodconfig    clang-17
hexagon             allnoconfig    clang-22
hexagon            allyesconfig    clang-22
i386               allmodconfig    gcc-14
i386                allnoconfig    gcc-14
i386               allyesconfig    gcc-14
loongarch          allmodconfig    clang-19
loongarch           allnoconfig    clang-22
loongarch          allyesconfig    clang-22
m68k               allmodconfig    gcc-15.1.0
m68k                allnoconfig    gcc-15.1.0
m68k               allyesconfig    gcc-15.1.0
microblaze         allmodconfig    gcc-15.1.0
microblaze          allnoconfig    gcc-15.1.0
microblaze         allyesconfig    gcc-15.1.0
mips                allnoconfig    gcc-15.1.0
mips               allyesconfig    gcc-15.1.0
nios2              allmodconfig    gcc-11.5.0
nios2               allnoconfig    gcc-11.5.0
nios2              allyesconfig    gcc-11.5.0
openrisc           allmodconfig    gcc-15.1.0
openrisc            allnoconfig    gcc-15.1.0
openrisc           allyesconfig    gcc-15.1.0
parisc             allmodconfig    gcc-15.1.0
parisc              allnoconfig    gcc-15.1.0
parisc             allyesconfig    gcc-15.1.0
powerpc            allmodconfig    gcc-15.1.0
powerpc             allnoconfig    gcc-15.1.0
powerpc            allyesconfig    clang-22
riscv              allmodconfig    clang-22
riscv               allnoconfig    gcc-15.1.0
riscv              allyesconfig    clang-16
s390               allmodconfig    clang-18
s390                allnoconfig    clang-22
s390               allyesconfig    gcc-15.1.0
sh                 allmodconfig    gcc-15.1.0
sh                  allnoconfig    gcc-15.1.0
sh                 allyesconfig    gcc-15.1.0
sparc              allmodconfig    gcc-15.1.0
sparc               allnoconfig    gcc-15.1.0
sparc              allyesconfig    gcc-15.1.0
sparc64            allmodconfig    clang-22
sparc64            allyesconfig    gcc-15.1.0
um                  allnoconfig    clang-22
um                 allyesconfig    gcc-14
x86_64             allmodconfig    clang-20
x86_64              allnoconfig    clang-20
x86_64             allyesconfig    clang-20
x86_64                    kexec    clang-20
x86_64                 rhel-9.4    clang-20
x86_64             rhel-9.4-bpf    gcc-14
x86_64            rhel-9.4-func    clang-20
x86_64      rhel-9.4-kselftests    clang-20
x86_64           rhel-9.4-kunit    gcc-14
x86_64             rhel-9.4-ltp    gcc-14
x86_64            rhel-9.4-rust    clang-20
xtensa              allnoconfig    gcc-15.1.0
xtensa             allyesconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
