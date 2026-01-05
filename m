Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2341BFA3727
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 11:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92A510E3CF;
	Mon,  5 Jan 2026 11:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HojWl3ho";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D342A10E3CF;
 Mon,  5 Jan 2026 11:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767613927; x=1799149927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YJsN5H7ehDpg7YCf4UqX4NlLVHIp6NdZik1UVSglQFo=;
 b=HojWl3hohg+7fvBssA0JYlhCm0Mnl+YnfoajH9fHPLhwtFGfaKvwjwlq
 IwsMPbQ4c9HKVlTp7K3lHMAeEqBBLR4dGESt4JXNhNikREocDgrp61J30
 cva0NX9Vw2iR0UQZOpGwLx5RpMrtl2ISNm3NpKsl5yAfnm0JW0/QPY+ap
 b7sewIaQZjXaSHfgshdHVR1Y42VI/IrgV1kKoBZwN9Qd+98qZWRgiB5MM
 X/1pOwCcaW28Pw/A8Bt48JL028qxbTIEld21yKjmXYAuga4pp9p0BguUk
 p3zxNbedt+smZ2aA7CNGLrFEie5lLjhwclaObc8wo/0pyYzrgiKmprlf7 g==;
X-CSE-ConnectionGUID: QS3FTsU8QIK0vRfb5p3esg==
X-CSE-MsgGUID: Q3pYUK37TE+Ti3JRkM3epg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="69050667"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="69050667"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 03:52:07 -0800
X-CSE-ConnectionGUID: WOYnHmcJS1yJ72HhOiHAdg==
X-CSE-MsgGUID: opVNcX80RUuwVJ+oK99PaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="202614155"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 03:52:05 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 9/9] drm/i915/lt_phy_regs: Fix the SPDX identifier comment
Date: Mon,  5 Jan 2026 17:05:43 +0530
Message-ID: <20260105113544.574323-10-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260105113544.574323-1-ankit.k.nautiyal@intel.com>
References: <20260105113544.574323-1-ankit.k.nautiyal@intel.com>
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

Fix the SPDX identifier comment as per the licensing rules [1].

[1] https://www.kernel.org/doc/html/latest/process/license-rules.html

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lt_phy_regs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy_regs.h b/drivers/gpu/drm/i915/display/intel_lt_phy_regs.h
index 98ccc069a69b..37e46fb9abde 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy_regs.h
@@ -1,5 +1,5 @@
-/* SPDX-License-Identifier: MIT
- *
+/* SPDX-License-Identifier: MIT */
+/*
  * Copyright © 2025 Intel Corporation
  */
 
-- 
2.45.2

