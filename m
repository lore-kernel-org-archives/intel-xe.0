Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F17C282D1
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 17:35:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7A710E4C1;
	Mon,  3 Mar 2025 17:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvCRj/da";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B1110E4C1
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 17:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741023343; x=1772559343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uSNjzJqB3L53Bt0N0054iU4ge7DKh3ampEn8doPjp+w=;
 b=RvCRj/daU7P+EfSLg0fnj6bSsIMWkxAdMpw9NuC1YRVtPmLlEPJNP9RF
 kH/ZmZ7fZphqTt2+1IK66X9w2m3Rx5fdZO5eKd6onr8q3jo0XLAOtW3u7
 Bj6nAhlRM4+0YqR9CLddTRU9o1qAwLR84C70FBvDEiSSxBPAA2+0sBAuv
 DJyI2u8m3j9vkiuAZJ7+1UPR+cVuClNIyPpfIZNh95tpjG+zzdplI0O+f
 6tcpxLXOUZ8M/JYuAEZEuLV/SUkq6WFcZ9rWb+kyL8u4HKq67w2J6tEUx
 L5KoVlSmGh1Pts1ZvebgVHrLc3eWB9dDQA3OyFsY/2AlvrSNbX/AmWIhw w==;
X-CSE-ConnectionGUID: F/TaXdYzRJCAp/tvZ4gozA==
X-CSE-MsgGUID: tDjyqeQFQOOyRBEuzWTUow==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41937525"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41937525"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 09:35:43 -0800
X-CSE-ConnectionGUID: CwZfz3xuQHGuQrtapT+rbA==
X-CSE-MsgGUID: wsPZTaFETWCeFtttet2+rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="118101330"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.99.10])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 09:35:41 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 5/5] drm/xe/vf: Unblock xe_rtp_process_to_sr for VFs
Date: Mon,  3 Mar 2025 18:35:22 +0100
Message-Id: <20250303173522.1822-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250303173522.1822-1-michal.wajdeczko@intel.com>
References: <20250303173522.1822-1-michal.wajdeczko@intel.com>
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
---
 drivers/gpu/drm/xe/xe_rtp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 7a1c78fdfc92..d2ccf632d07e 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -256,9 +256,6 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
 
 	rtp_get_context(ctx, &hwe, &gt, &xe);
 
-	if (IS_SRIOV_VF(xe))
-		return;
-
 	for (entry = entries; entry && entry->name; entry++) {
 		bool match = false;
 
-- 
2.47.1

