Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE8AC982DA
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 05:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C6B10E241;
	Mon, 21 Sep 2026 05:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYiuwZLA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AD310E229;
 Mon, 21 Sep 2026 05:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789969041; x=1821505041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cav1m2D4SqDp2Y0Pq4eMX4sgCE2DX2BZaCXsgqhdHf4=;
 b=AYiuwZLAaokJwrkEqVs0KxbzQ4u4kNR2DwgBrZ+IKJiuzuhkAJs3e8Oi
 cokBIKpi+VmKqU0o9r5IpmOqeGyXXExdP8Hjd5CSJ6ieKq2jNOQ8yKUyq
 mOh9OoONvaTBV0gzfU/TVEi4uWdGJfUVJZXOwFlWJrs5Zep27jVs3L3pS
 rEmLaeFLX7HYOihj99s6uFu0zt5jQkmvFp6MujPlmkWlAxKVhrSEWO32A
 oMWR6Pw0EEiMSRcQh2VxtxRqGrp1QNxqoUE8ICoLpV7h/4L+Pj/3dkiGU
 g0vl380FviaRPO0wNSDjOQdJ4QLJU0rA6pVQBeK7DwrdaXFUG+7RRLkxK A==;
X-CSE-ConnectionGUID: Pj/TrGvWQVusa56XKwS78g==
X-CSE-MsgGUID: smTtYXzUQB+xdpmiOyJ7Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="966618"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="966618"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2026 22:37:21 -0700
X-CSE-ConnectionGUID: yZu8U297Reue1c+rTQr/Yw==
X-CSE-MsgGUID: ut/oi03zS16sjG3l160B5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="300444477"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa001.fm.intel.com with ESMTP; 20 Sep 2026 22:37:20 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 4/8] drm/i915/backlight: log DPCD access errors
Date: Mon, 21 Sep 2026 11:07:06 +0530
Message-Id: <20260921053710.1586776-5-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921053710.1586776-1-suraj.kandpal@intel.com>
References: <20260921053710.1586776-1-suraj.kandpal@intel.com>
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

Now that the DPCD accessors return a proper error code, include it in
the error messages using %pe and ERR_PTR(), instead of just stating
that the access failed.

Store the brightness control write result in ret as well, so that it
can be logged the same way.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c | 29 ++++++++++---------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index f30da5f7e3d2..36aebc32971b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -183,8 +183,8 @@ intel_dp_aux_hdr_get_backlight(struct intel_connector *connector, enum pipe pipe
 	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, &tmp);
 	if (ret < 0) {
 		drm_err(display->drm,
-			"[CONNECTOR:%d:%s] Failed to read current backlight mode from DPCD\n",
-			connector->base.base.id, connector->base.name);
+			"[CONNECTOR:%d:%s] Failed to read current backlight mode from DPCD (%pe)\n",
+			connector->base.base.id, connector->base.name, ERR_PTR(ret));
 		return 0;
 	}
 
@@ -203,8 +203,8 @@ intel_dp_aux_hdr_get_backlight(struct intel_connector *connector, enum pipe pipe
 				    sizeof(buf));
 	if (ret < 0) {
 		drm_err(display->drm,
-			"[CONNECTOR:%d:%s] Failed to read brightness from DPCD\n",
-			connector->base.base.id, connector->base.name);
+			"[CONNECTOR:%d:%s] Failed to read brightness from DPCD (%pe)\n",
+			connector->base.base.id, connector->base.name, ERR_PTR(ret));
 		return 0;
 	}
 
@@ -226,8 +226,8 @@ intel_dp_aux_hdr_set_aux_backlight(const struct drm_connector_state *conn_state,
 	ret = drm_dp_dpcd_write_data(&intel_dp->aux, INTEL_EDP_BRIGHTNESS_NITS_LSB, buf,
 				     sizeof(buf));
 	if (ret < 0)
-		drm_err(dev, "[CONNECTOR:%d:%s] Failed to write brightness level to DPCD\n",
-			connector->base.base.id, connector->base.name);
+		drm_err(dev, "[CONNECTOR:%d:%s] Failed to write brightness level to DPCD (%pe)\n",
+			connector->base.base.id, connector->base.name, ERR_PTR(ret));
 }
 
 static void
@@ -341,11 +341,14 @@ intel_dp_aux_hdr_enable_backlight(const struct intel_crtc_state *crtc_state,
 
 	intel_dp_aux_fill_hdr_tcon_params(conn_state, &ctrl);
 
-	if (ctrl != old_ctrl &&
-	    drm_dp_dpcd_write_byte(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, ctrl) < 0)
-		drm_err(display->drm,
-			"[CONNECTOR:%d:%s] Failed to configure DPCD brightness controls\n",
-			connector->base.base.id, connector->base.name);
+	if (ctrl != old_ctrl) {
+		ret = drm_dp_dpcd_write_byte(&intel_dp->aux,
+					     INTEL_EDP_HDR_GETSET_CTRL_PARAMS, ctrl);
+		if (ret < 0)
+			drm_err(display->drm,
+				"[CONNECTOR:%d:%s] Failed to configure DPCD brightness controls (%pe)\n",
+				connector->base.base.id, connector->base.name, ERR_PTR(ret));
+	}
 
 	if (intel_dp_in_hdr_mode(conn_state)) {
 		hdr_metadata = conn_state->hdr_output_metadata->data;
@@ -463,8 +466,8 @@ static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, en
 					    sizeof(buf));
 		if (ret < 0) {
 			drm_err(intel_dp->aux.drm_dev,
-				"[CONNECTOR:%d:%s] Failed to read Luminance from DPCD\n",
-				connector->base.base.id, connector->base.name);
+				"[CONNECTOR:%d:%s] Failed to read Luminance from DPCD (%pe)\n",
+				connector->base.base.id, connector->base.name, ERR_PTR(ret));
 			return 0;
 		}
 
-- 
2.34.1

