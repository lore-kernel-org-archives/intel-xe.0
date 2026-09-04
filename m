Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FEEC79F82
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:51:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271F710E199;
	Fri,  4 Sep 2026 21:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="naPFFrNh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D93D10E199
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788558693; x=1820094693;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MS0ef3NcB3i3MPN+0EYTaXnRs+8gp1pgFHHWEc767Eg=;
 b=naPFFrNhMCr0eDCHpVB/iqz4I3usYVqAzmZN5zei+dNMA4BgxevYuCF9
 YBPyN2YY/WoT7M2cmonVr0Fz+5yG1ejIAP5fxVwZtXIsLy6wUUBgzNXfo
 OAJ0ExquDH8zoxdLVmO+eYQvAVJNPL2IUjD/8iMqgGvyisbBNpt2Rr2bE
 Cz8f7TOu9SHoPNN6GG7uLmPVOWs1yezHiLR6Nvas/Vq177XQ4phuil6US
 9uox6NZbHDyrndEM7HHRILD/ZYQBOtCirYheH1Sui35xiCCGNJZJlUcKk
 yYSogZf8xokcrfOYwl98eG+VDuZaoiVlFU2k9zC/o3IP+5Chj9Acah9pT g==;
X-CSE-ConnectionGUID: J2PyEToAR4aUKhks+nyOqw==
X-CSE-MsgGUID: m4VXT8WGQUKPOD8hEAbbtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="106433880"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="106433880"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:51:33 -0700
X-CSE-ConnectionGUID: Ju5OZaUDRdu6iSSDB7YG1w==
X-CSE-MsgGUID: sbLVExtKSE6ND5f/rSstwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="266893003"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa007.fm.intel.com with ESMTP; 04 Sep 2026 14:51:32 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v6 0/2] drm/xe/shrinker: Runtime PM reference for non-system
 memory
Date: Fri,  4 Sep 2026 21:50:47 +0000
Message-Id: <20260904215049.543535-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Patch 2 fixes the reported bug: the shrinker walks the SYSTEM and TT
LRUs without a runtime PM reference, so with the device runtime
suspended the page table zap trips an assert and the TLB invalidation
returns -ENODEV.

Patch 1 comes first because its Fixes commit is a year older and it
applies on its own to stable trees that must not take patch 2.  It
separates the freed page count from the return value so an error no
longer discards the pages already freed.

Verified with igt@xe_madvise@dontneed-before-exec while the GPU is
runtime suspended: 15/15 runs hit the WARN before, 0/15 after, and a
CI-like configuration with the device active still passes 10/10.

Shuicheng Lin (2):
  drm/xe/shrinker: Return the freed page count through a parameter
  drm/xe/shrinker: Take a runtime PM ref before shrinking non-system
    memory

 drivers/gpu/drm/xe/xe_shrinker.c | 114 ++++++++++++++++++-------------
 1 file changed, 66 insertions(+), 48 deletions(-)

-- 
2.43.0

