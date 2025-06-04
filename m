Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D768C5B552
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 07:19:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAA510E683;
	Wed,  4 Jun 2025 07:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dFP6tY82";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EAC10E69D
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 07:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749021564; x=1780557564;
 h=date:from:to:cc:subject:message-id;
 bh=C/EpXCoyKpCXAmZ1NfljXBH79GhQbxo1/H8NWJwv5QY=;
 b=dFP6tY82SOoEgnETRLUjDwKSrbiMLuRmcXNJeh7Z/w/UzLbih4JxSdOR
 olKEtpBrx7M8NU0JzsrAPqEjrWzvc+/SNYJs+nnwXnAEcrbh0WNdtc8MU
 zQzaY5iA1dtqK/lT/HzGmt/LxXcYv6wrlHOuUxN4kgwF5781UP8LCFtlM
 n+vIVm13HhM+zPLIWnzRhcbtEqCpX+wa0ODm+nWzEWLQb04btFTzaiY21
 A4GNzZZueGKNM7QvBIMhnIa9pY9c4TNg7s/76zZD8fE/B1rVc9N0ngzkO
 V6xzRtgyyp761ikqVeQ4fRXuipgP5QvnX//OoKTYIyCQT3tGuOMCPriRf w==;
X-CSE-ConnectionGUID: Myui9MBMT6OWx4Wl5wyFRw==
X-CSE-MsgGUID: Akk3I97PTbiEnVcobBSFyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51159410"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="51159410"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 00:19:24 -0700
X-CSE-ConnectionGUID: s/01SLilRAm86dNtxRMusA==
X-CSE-MsgGUID: z8Lu2dd6RsGTBzBoZNZwWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="146076122"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 04 Jun 2025 00:19:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uMiPA-0002x3-0q;
 Wed, 04 Jun 2025 07:19:20 +0000
Date: Wed, 04 Jun 2025 15:19:10 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 c12c729e97508f4cd073a7cd5150d7512fa84f34
Message-ID: <202506041500.uK3y9yMa-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: c12c729e97508f4cd073a7cd5150d7512fa84f34  drm/xe/vf: Add sanity check for GGTT configuration

elapsed time: 1224m

configs tested: 35
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        allyesconfig    gcc-15.1.0
arc          allmodconfig    gcc-15.1.0
arc          allyesconfig    gcc-15.1.0
arm          allmodconfig    gcc-15.1.0
arm          allyesconfig    gcc-15.1.0
arm64        allmodconfig    clang-19
hexagon      allmodconfig    clang-17
hexagon      allyesconfig    clang-21
i386         allmodconfig    gcc-12
i386          allnoconfig    gcc-12
i386         allyesconfig    gcc-12
i386            defconfig    clang-20
loongarch    allmodconfig    gcc-15.1.0
m68k         allmodconfig    gcc-15.1.0
m68k         allyesconfig    gcc-15.1.0
microblaze   allmodconfig    gcc-15.1.0
microblaze   allyesconfig    gcc-15.1.0
openrisc     allyesconfig    gcc-15.1.0
parisc       allmodconfig    gcc-15.1.0
parisc       allyesconfig    gcc-15.1.0
powerpc      allmodconfig    gcc-15.1.0
powerpc      allyesconfig    clang-21
riscv        allmodconfig    clang-21
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390         allyesconfig    gcc-15.1.0
sh           allmodconfig    gcc-15.1.0
sh           allyesconfig    gcc-15.1.0
sparc        allmodconfig    gcc-15.1.0
um           allmodconfig    clang-19
um           allyesconfig    gcc-12
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64          defconfig    gcc-11
x86_64      rhel-9.4-rust    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
