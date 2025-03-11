Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E16C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 10:53:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CE410E55E;
	Tue, 11 Mar 2025 10:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gCCc5cW+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA4110E55E
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 10:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741690374; x=1773226374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/G1R/JGe5Rdi1zwy3NV/laDJ0uDiNBrH54Mljy+TaMY=;
 b=gCCc5cW+eOP6wOChm/W17MbrF8aHTxe1h+qO43XEXFYHyG4mEVTTrIRu
 ifzJInhi2iC5GEhcDWNZtwKz27CdN7bwKbfNHX++3Yf2vJEJ/Yu8uZ4P/
 7ruVAY+1EGnKHin7/BMSqssLf9WDPWWB7JvNee3PCd0NjyZJkpAD2JG/Z
 NoXTblPg0st7+4Q1XyKjs2HTz05D/PIhWPr3ZYTxcIu/NFiicWObzitYa
 O1N+p6/IQujIcOxqGOJjDAfIJVOQvzWv6lnZEz1GQCQw6yTTf8vR4Z/Aq
 KR/8SzXRWDRA/bWIoqjR1LtoOeFR6FNYtnAbY1nTmXNc7+YZ8jCsxSdYx w==;
X-CSE-ConnectionGUID: m2AMhgEYSpOHYBLRhfOj8g==
X-CSE-MsgGUID: oYPWL55mTCSAM9TCAXKyrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42576726"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="42576726"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 03:52:53 -0700
X-CSE-ConnectionGUID: M1/jcUQBRU+XIWiD66wJ4A==
X-CSE-MsgGUID: ZMgMWjj4Tvuiwtd/6CLu5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="120783542"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 03:52:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 5/5] drm/xe/vf: Unblock xe_rtp_process_to_sr for VFs
Date: Tue, 11 Mar 2025 11:52:21 +0100
Message-Id: <20250311105221.1910-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250303173522.1822-6-michal.wajdeczko@intel.com>
References: <20250303173522.1822-6-michal.wajdeczko@intel.com>
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

In commit 9632dfb0def4 ("drm/xe/vf: Don't run any save-restore
RTP actions if VF") we disabled processing of all RTP rules if
we were running as a VFs, since many of the RTP actions were
trying to access registers unaccessible for VFs.

This also included all of LRC WA rules, since some of them were
implemented in a way that required RMW pattern.

Now, as we can program LRC WAs without accessing such registers
from the driver, relying on the MI_MATH instruction instead, we
can unblock xe_rtp_process_to_sr() for VFs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
v2: rebased
---
 drivers/gpu/drm/xe/xe_rtp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 13bb62d3e615..29e694bb1219 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -258,9 +258,6 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
 
 	rtp_get_context(ctx, &hwe, &gt, &xe);
 
-	if (IS_SRIOV_VF(xe))
-		return;
-
 	xe_assert(xe, entries);
 
 	for (entry = entries; entry - entries < n_entries; entry++) {
-- 
2.47.1

