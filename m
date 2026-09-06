Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39766C79F9E
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 20:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B586F10E32E;
	Sun,  6 Sep 2026 20:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FS5EmyR/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8217510E32E
 for <intel-xe@lists.freedesktop.org>; Sun,  6 Sep 2026 20:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788726584; x=1820262584;
 h=date:from:to:cc:subject:message-id;
 bh=eHNDk5n36abMjBLH2PIxsEOa89u7184jRs9u6HDRTlw=;
 b=FS5EmyR/2wBzmaIeTjmnaD6CY4ti9eBIhjRow251ittkRnNTz0TiGgy6
 w8hg7lWOyKkhmD4LvM+R//x24KvcbSNEsBBMXoJRwoubaavfROkV4N6Wu
 FwEOSnbZrKOe9PG58oTMnvR7Uh2Yi0Xm/eQx9QmULeB2m4sMC15jDDJF4
 Xo16bVC8Q57Vk0+++X1adFZ7RVyCtaAYfb/O9KJKr18EjpiSpR/B0HbL6
 Z+kfxIyl6wkcm6ggeOzHnY5F66q1mNsOUBZpBbuzV2iPVRErysUPIGflT
 pmu4AtPHh6M52SMFcgrby0E5a8Ec7Ornsg5qq8vBQCfh9St3vLraPtbzo Q==;
X-CSE-ConnectionGUID: /3eij4p1QFOX/GTqTt5Heg==
X-CSE-MsgGUID: fbygrJbCQUG+YvY0u31oMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="106505577"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="106505577"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 13:29:43 -0700
X-CSE-ConnectionGUID: HBW7cMxpQkClsgbE9y89pQ==
X-CSE-MsgGUID: DJyHW0EDSkqP0wLTeeSY8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="275818513"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 06 Sep 2026 13:29:42 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1x3JUi-000000002S5-0Iqw;
 Sun, 06 Sep 2026 20:29:40 +0000
Date: Mon, 07 Sep 2026 04:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 0e68c74e44da81a4599c52437ee1f63a2c234470
Message-ID: <202609070426.zJXLvxOf-lkp@intel.com>
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
branch HEAD: 0e68c74e44da81a4599c52437ee1f63a2c234470  drm/xe/vram: report FLAT_CCS base misalignment

elapsed time: 4336m

configs tested: 52
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    gcc-16.1.0
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2         allnoconfig    clang-24
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
