Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AD9C5DF66
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 02:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5102310E4DE;
	Fri, 14 Aug 2026 02:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L44UI8HM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC2410E4DE
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 02:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786674418; x=1818210418;
 h=date:from:to:cc:subject:message-id;
 bh=hUebBYqAWJ06DDlzz6odpDV2cLQXJwUnv2c/5BMJ+pk=;
 b=L44UI8HMNk/V9mpk+76Y2Vu+RC6/v3nqoGRCIh25V16W2PQd27ws64Lj
 IuivcIFx/OgWUpiOxbStP13ZCaH2UEk+S2Kc6C09rSjq1Z1FM69bz5mVe
 S0UCb7+aTxyJlPBIcYbGuiUd3whxnZkD5wKSaw/1MGQsM5/BzNl1x1BER
 xs/Wmw8jbQGdtvAWCpJapMelT/ZzOXGXd/AmOoFbcCYvt6Rg3y8HB4gJB
 AGt9avuqTDwqn+7H2gY7Hz37EnS75Q/4V1eRHjZmivnXE86X599PnjZvv
 j1ihyc7KH+I+B00hQkXaGN5T6a/UnghiorztTKC2O9z+6llKJuEeX0AXN Q==;
X-CSE-ConnectionGUID: PPST3kXOQwuWr3pdjpYeyA==
X-CSE-MsgGUID: PjLPDHYzT22UP6mf/t0UVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="98613633"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98613633"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 19:26:57 -0700
X-CSE-ConnectionGUID: GuqqLiIwRIeAbVpmDJhOzA==
X-CSE-MsgGUID: IzAyxYUuR5S51Vax2Q1NHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="267594039"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 13 Aug 2026 19:26:56 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wuhdG-00000000XSS-1IDV;
 Fri, 14 Aug 2026 02:26:54 +0000
Date: Fri, 14 Aug 2026 10:26:49 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 f29c2bd7eaeb73afcdbd4e3bbf54d6f8799a9b06
Message-ID: <202608141038.Y7n0avFC-lkp@intel.com>
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
branch HEAD: f29c2bd7eaeb73afcdbd4e3bbf54d6f8799a9b06  drm/xe/ras: Use fault-inject to trigger cold-reset wedge

elapsed time: 745m

configs tested: 15
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha       allnoconfig    gcc-16.1.0
alpha      allyesconfig    gcc-16.1.0
alpha         defconfig    gcc-16.1.0
arc        allmodconfig    gcc-16.1.0
arc        allyesconfig    gcc-16.1.0
csky       allmodconfig    gcc-16.1.0
i386       allmodconfig    gcc-14
loongarch     defconfig    clang-24
nios2      allmodconfig    gcc-11.5.0
nios2       allnoconfig    gcc-11.5.0
parisc     allmodconfig    gcc-16.1.0
parisc     allyesconfig    gcc-16.1.0
parisc        defconfig    gcc-16.1.0
parisc64   alldefconfig    gcc-16.1.0
sh            defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
