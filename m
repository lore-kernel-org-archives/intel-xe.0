Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA96CAC581
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 10:21:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B8CD10E4B9;
	Mon,  8 Sep 2025 10:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWiH5PY7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A85710E4B8
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 10:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757326864; x=1788862864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4iWXoCdZ2GYdkSSJi2NSvwKwD/LEs9OZOAyM2K9vETw=;
 b=dWiH5PY7KMnRij2gdp/3Tv6NHvXDbCaxv6LyrXNxwz0bXtiQbHgXyuJp
 Kk03XZAMV/SZ8UvOUgqhjqNT4wN76yGNy5N/B5LlMgDsn1INeTNVKufr7
 nAL9jXotvsYvpTQFis43SbB2QEsNprcAYU8R0s6829UAIqJkFTOnHUkFk
 4C9WF4s3BsFhbATLxQhwCLZrp99V6ZSF01eRFve+Ua/sSIxSp7AJ57eBU
 5osCyhOEUsdNdHxVJBCGqjUvHrl4IEzpkR6UwPlDzb3/gccfT2fWKQKxy
 KAcXK0slFbD21GtcIFGc4qYmoKzvLSAz9967udxm355T+l3jIqopxmX9S g==;
X-CSE-ConnectionGUID: xAEBwZxMS16CGIYDaut3Tg==
X-CSE-MsgGUID: RcDByW42Qrmtc71GcHIoCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59276866"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="59276866"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:21:04 -0700
X-CSE-ConnectionGUID: x+BFnGgXSzGTyDVRGpPWmA==
X-CSE-MsgGUID: 6/EP3lBYTsylsqHQc2y+6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="177981285"
Received: from abaranow-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.83.253])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:21:02 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/2] drm/xe/guc: Always add CT disable action during second
 init step
Date: Mon,  8 Sep 2025 12:20:51 +0200
Message-ID: <20250908102053.539-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908102053.539-1-michal.wajdeczko@intel.com>
References: <20250908102053.539-1-michal.wajdeczko@intel.com>
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

On DGFX, during init_post_hwconfig() step, we are reinitializing
CTB BO in VRAM and we have to replace cleanup action to disable CT
communication prior to release of underlying BO.

But that introduces some discrepancy between DGFX and iGFX, as for
iGFX we keep previously added disable CT action that would be called
during unwind much later.

To keep the same flow on both types of platforms, always replace old
cleanup action and register new one.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index f40543b040d6..12372d5b7067 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -300,12 +300,11 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct)
 
 	xe_assert(xe, !xe_guc_ct_enabled(ct));
 
-	if (!IS_DGFX(xe))
-		return 0;
-
-	ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->bo);
-	if (ret)
-		return ret;
+	if (IS_DGFX(xe)) {
+		ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->bo);
+		if (ret)
+			return ret;
+	}
 
 	devm_release_action(xe->drm.dev, guc_action_disable_ct, ct);
 	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
-- 
2.47.1

