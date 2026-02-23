Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0F5EA4FC3
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185B010E3EE;
	Mon, 23 Feb 2026 14:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LpnUo3NE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA0810E3E0;
 Mon, 23 Feb 2026 14:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771855212; x=1803391212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AagpAJJ9IVwA2esuYj993NoDdSnC4QUj+YjLBE7x7I0=;
 b=LpnUo3NEU0xoPOTltGGP6ccewYecV6d913auzSWf6USY2XwwhfA1f0yO
 ApLYWwEHQhxS1dx00caENhPuMMMJI2aQ/e3zb9+mgci69JfBsIbbb0Qhi
 VoljLIzLfAKSCc7jXr2vN6hMCw+Wv1OGHXOof/9DcWEFPBlM62LUf6bWd
 miHXrOhBV62xgkH7c6hMRa79qnmBO+fK604Tl2u46GrwJjy7HPIrdvgmH
 NUFxCnenDZnWhvxvBfhQkqWRPIZnrGXtxZvWrvxUYDQOms3o0QPc/jWie
 RfaTKAVjLg7GRaVRNJgkBgHH3tlptDInTA5N8lRv9vGw0zQB2u2gjzs2+ Q==;
X-CSE-ConnectionGUID: clWDveylTTGMlFiosY2y/g==
X-CSE-MsgGUID: B8WXUPC+QySDbB+m7S1Qvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72827042"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72827042"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:00:12 -0800
X-CSE-ConnectionGUID: kS0q6rRfTY6ikzgfVlPOOA==
X-CSE-MsgGUID: wMuviWWqRj6VLjqt6idJLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="212961184"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:00:10 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 05/14] include/drm/display/dp: Add field for storing AS SDP
 version
Date: Mon, 23 Feb 2026 19:14:22 +0530
Message-ID: <20260223134431.1639308-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260223134431.1639308-1-ankit.k.nautiyal@intel.com>
References: <20260223134431.1639308-1-ankit.k.nautiyal@intel.com>
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

Add a new member to store Adaptive Sync SDP version and include it in AS
SDP logs.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 1 +
 include/drm/display/drm_dp_helper.h     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index a697cc227e28..9469943d8194 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -3507,6 +3507,7 @@ void drm_dp_as_sdp_log(struct drm_printer *p, const struct drm_dp_as_sdp *as_sdp
 {
 	drm_printf(p, "DP SDP: AS_SDP, revision %u, length %u\n",
 		   as_sdp->revision, as_sdp->length);
+	drm_printf(p, "    version: %d\n", as_sdp->version);
 	drm_printf(p, "    vtotal: %d\n", as_sdp->vtotal);
 	drm_printf(p, "    target_rr: %d\n", as_sdp->target_rr);
 	drm_printf(p, "    duration_incr_ms: %d\n", as_sdp->duration_incr_ms);
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 1d0acd58f486..c71787fc31c1 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -120,6 +120,7 @@ struct drm_dp_as_sdp {
 	unsigned char sdp_type;
 	unsigned char revision;
 	unsigned char length;
+	int version;
 	int vtotal;
 	int target_rr;
 	int duration_incr_ms;
-- 
2.45.2

