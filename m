Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98667D65C6F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 10:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F2710E7D9;
	Thu, 14 Nov 2024 10:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DX3x35kr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E98D10E7DC
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 10:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731579449; x=1763115449;
 h=date:from:to:cc:subject:message-id;
 bh=rzFC443KrvkL0XeT0b9AaDThn4q7Lg//SRmW5eqiNZo=;
 b=DX3x35krzv7/cI+9ZO2TTDw78ez2EASFE7E+KXmaHjS3IUdqYYKo4onG
 8er83vUxW8gKgFCICEHP7GLZi3F7rMLPo7ajSYNSLZ63OnVhvtGR5zfzf
 oS7yO4mDDt+NPL/ZA1EGF51ri5cA9ztXM3Np8awj9VLnmzLw38PNisn1V
 01wvTj9Ape1pLDQMSrHvtSZp/ljDxSkfChBI8NVwCpothgWRO6cJZ9GIp
 LsCA9GS/BkIIJo+5txn8oLMiGbCyXwfQ/Ifv3XaKnVK8/0rO8Fv1UynU+
 /vOy5Vljfl/fQW1VIPu6SLwxocbe8in4g8j8RXHzoaiRbwfXMQS/chmyn w==;
X-CSE-ConnectionGUID: QrgBwwu0QQmmw975dJbs8Q==
X-CSE-MsgGUID: Lf7RQTapSEaDEqxsTgfqJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42069847"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="42069847"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 02:15:26 -0800
X-CSE-ConnectionGUID: Moazw6v1Tce2oHZ2KDPj8Q==
X-CSE-MsgGUID: W+cf4yMJQomQS+1bYljdMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="88266082"
Received: from lkp-server01.sh.intel.com (HELO cf353f978a24) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 14 Nov 2024 02:15:24 -0800
Received: from kbuild by cf353f978a24 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tBWsk-00003V-0I;
 Thu, 14 Nov 2024 10:15:22 +0000
Date: Thu, 14 Nov 2024 18:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 c0403e4ceecaefbeaf78263dffcd3e3f06a19f6b
Message-ID: <202411141822.A8V06fWS-lkp@intel.com>
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
branch HEAD: c0403e4ceecaefbeaf78263dffcd3e3f06a19f6b  drm/xe/oa: Fix "Missing outer runtime PM protection" warning

elapsed time: 828m

configs tested: 42
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha       allyesconfig    clang-20
arc         allmodconfig    clang-20
arc         allyesconfig    clang-20
arm         allmodconfig    clang-20
arm         allyesconfig    clang-20
arm64       allmodconfig    clang-20
hexagon     allmodconfig    clang-20
hexagon     allyesconfig    clang-20
i386        allmodconfig    clang-19
i386         allnoconfig    clang-19
i386        allyesconfig    clang-19
i386           defconfig    clang-19
loongarch   allmodconfig    gcc-14.2.0
m68k        allmodconfig    gcc-14.2.0
m68k        allyesconfig    gcc-14.2.0
microblaze  allmodconfig    gcc-14.2.0
microblaze  allyesconfig    gcc-14.2.0
openrisc     allnoconfig    clang-20
openrisc    allyesconfig    gcc-14.2.0
parisc      allmodconfig    gcc-14.2.0
parisc       allnoconfig    clang-20
parisc      allyesconfig    gcc-14.2.0
powerpc     allmodconfig    gcc-14.2.0
powerpc      allnoconfig    clang-20
powerpc     allyesconfig    gcc-14.2.0
riscv       allmodconfig    gcc-14.2.0
riscv        allnoconfig    clang-20
riscv       allyesconfig    gcc-14.2.0
s390        allmodconfig    gcc-14.2.0
s390         allnoconfig    clang-20
s390        allyesconfig    gcc-14.2.0
sh          allmodconfig    gcc-14.2.0
sh          allyesconfig    gcc-14.2.0
sparc       allmodconfig    gcc-14.2.0
um          allmodconfig    clang-20
um           allnoconfig    clang-20
um          allyesconfig    clang-20
x86_64       allnoconfig    clang-19
x86_64      allyesconfig    clang-19
x86_64         defconfig    clang-19
x86_64             kexec    clang-19
x86_64          rhel-8.3    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
