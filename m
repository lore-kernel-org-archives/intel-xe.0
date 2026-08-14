Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604CBC5CFCF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 02:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC2E10E24F;
	Fri, 14 Aug 2026 02:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lus08Lpt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D3210E24F
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 02:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786674418; x=1818210418;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=D7r9xMCVXj39QeDNy3tpM6ZtDthPE1KHT1oyux20Kgk=;
 b=lus08Lpt3knqqjJ3Kgb8xlZUku3RZ0cxmiZnXvqtq4sSvrupd50/X7dK
 bU0dPCmUby2NRSxsIoSRlxl+YNjWysyH5R4ir8TmA94nz8OrXf/GvAbFh
 a0eFj5I5lxvzZZcQ0uvnaf0psY/UtgzHvLwJUvS4zziZldkP7J00r0lEY
 UsbZlQ45JwmwB67bO6a0H9+0EWc6GmV0ldjpZoejhix3bjxS1Rm9cokra
 L7ARyy5rKXm3rasOLSbYkeSbBKjY1/C6YTXaFtcVPzjLYcTO7f2xwRLUu
 F7v1CuPyoGTJEmxZHDEi7d3kK9Vhuugh1XnDA7cfWfIV3Ew2SFRC85FTh g==;
X-CSE-ConnectionGUID: OIJlL9BSTFu4HivirSGRjg==
X-CSE-MsgGUID: +GdNzW7JTayBN0IfH3U6rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="98613632"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98613632"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 19:26:57 -0700
X-CSE-ConnectionGUID: /54DuchsRrKp1lJJ1Cyrfw==
X-CSE-MsgGUID: CnYfFndiTyyrUh6cPVLq6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="267594038"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 13 Aug 2026 19:26:56 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wuhdG-00000000XSQ-0rzj;
 Fri, 14 Aug 2026 02:26:54 +0000
Date: Fri, 14 Aug 2026 10:26:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 ef526d122b62af5afa437f095aa6661a953676c4
Message-ID: <202608141023.351Yb7or-lkp@intel.com>
User-Agent: s-nail v14.9.25
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
branch HEAD: ef526d122b62af5afa437f095aa6661a953676c4  drm/xe: Fix xe_device_probe() failure

elapsed time: 744m

configs tested: 15
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha           allnoconfig    gcc-16.1.0
alpha          allyesconfig    gcc-16.1.0
alpha             defconfig    gcc-16.1.0
arc            allmodconfig    gcc-16.1.0
arc            allyesconfig    gcc-16.1.0
csky           allmodconfig    gcc-16.1.0
i386           allmodconfig    gcc-14
loongarch         defconfig    clang-24
mips       bigsur_defconfig    gcc-16.1.0
nios2          allmodconfig    gcc-11.5.0
nios2           allnoconfig    gcc-11.5.0
parisc         allmodconfig    gcc-16.1.0
parisc         allyesconfig    gcc-16.1.0
parisc            defconfig    gcc-16.1.0
sh                defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
