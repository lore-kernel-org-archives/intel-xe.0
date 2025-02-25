Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E77CC021BB
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 13:18:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A1B10E4C4;
	Tue, 25 Feb 2025 13:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFQUZF0w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE6310E4C4
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 13:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740489496; x=1772025496;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EGPY0tU1zRF5WaEzV9dBDDuP6CeQAiqiwlQG3DhGAO0=;
 b=mFQUZF0wSj0jHGtU/dL0jKX9ZYXXbk3fDHigWOW399ouP6slC2veHv92
 jOtxJj8lwfgP/UCLJENxTMPLVDuDG2kDajrib58oxYWWPG/1JivkS3jOu
 t2AD7dYC4IytdLaDBMP3xhVTvZcxR3M3udNGGpoiMBFUyuMMPXFFOSmwk
 3ayyrkrWGKr+/UBH5Q7/Z/HEEQQqjgh0q+rg+ZHu2YvdtKwQlSVZymRYE
 3Ilp6Kmwe9m+7BEHGouwxVdCWLRbYxjCuGr4Z2TGuFcY4SYnP5HdzvfHP
 VcGFBTMCPeIfYxvNo7P8t0JbI5jDHWWSKxh54ZkHlr0W1pOJdJFzkE5fV A==;
X-CSE-ConnectionGUID: 1HPO1l9EQwmDvmTnuVPmWA==
X-CSE-MsgGUID: K22OSczuT6uiWWttxwAfQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41139266"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41139266"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:18:16 -0800
X-CSE-ConnectionGUID: Nk5wzwQmRVGk4/1jWhOj2w==
X-CSE-MsgGUID: ENIlbxoTTkeJ2xL6TcxkYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="116163649"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.239])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:18:14 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH 0/3] Minor improvements to GT stats
Date: Tue, 25 Feb 2025 14:17:03 +0100
Message-ID: <20250225131753.1170520-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

This series is a follow-up of that comment:
https://patchwork.freedesktop.org/patch/635671/?series=144412&rev=2#comment_1162103

Thanks Matthew Auld for the suggestions.

Francois Dugast (3):
  drm/xe/gt_stats: Detect and log overflow
  drm/xe/gt_stats: Use atomic64_t for counters
  drm/xe/gt_pagefault: Change vma_pagefault unit to kilobyte

 drivers/gpu/drm/xe/xe_gt_pagefault.c   |  2 +-
 drivers/gpu/drm/xe/xe_gt_stats.c       | 24 +++++++++++++++---------
 drivers/gpu/drm/xe/xe_gt_stats_types.h |  2 +-
 drivers/gpu/drm/xe/xe_gt_types.h       |  2 +-
 4 files changed, 18 insertions(+), 12 deletions(-)

-- 
2.43.0

