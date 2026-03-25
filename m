Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4272F103A9AB
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 11:08:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA5610E861;
	Wed, 25 Mar 2026 11:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MbfV3OIi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFD310E84F;
 Wed, 25 Mar 2026 11:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774436888; x=1805972888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9aPgqiVhvvaZPNa3Vdfecb+N5uBatxo4I89E4/5v7+0=;
 b=MbfV3OIiWirkCQrTCHGcNIzhQq82c1AhqwxqUVVQRp3pkk5iDJzlDNvx
 6DXN+boteocwEC/KLT+rCvhK39DSTMDwTGEA4vvrr8stncbfkbsm94A54
 cMv7lRRGsCVyGTHP7gctJ8W4VLbISJfaELXuCwP7gIlKqRU/1oml/j3DA
 Bu5VUImu4tX/XVgLekQ1bIvTV5LUljDU5nn+qkwCPuKEOS1IEDhTJfcX/
 3+10nVjh7k8PBtDbkVyEDrmXCqFKYfYJAbyrj2PJa6wDNkOeSKTziPory
 xYVWnFErcHr3rBRFD+mBZ/D2gqCMKWOTABS8e62dmDA+wa9Oq3ee/R3if A==;
X-CSE-ConnectionGUID: ztI6vQ/3RUabLvDphOauKg==
X-CSE-MsgGUID: LwYKq0AzQgmrxKvtAHrw3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="93047506"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="93047506"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 04:08:08 -0700
X-CSE-ConnectionGUID: xNSEzrToQ8ObSe1dCKyloQ==
X-CSE-MsgGUID: jXEDQubfRD+VzuQqgvp+pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="219798342"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 25 Mar 2026 04:08:06 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: sowmiya.s@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com,
 chaitanya.kumar.borah@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 07/26] drm/i915/writeback: Add hook to check modes
Date: Wed, 25 Mar 2026 16:37:25 +0530
Message-Id: <20260325110744.1096786-8-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325110744.1096786-1-suraj.kandpal@intel.com>
References: <20260325110744.1096786-1-suraj.kandpal@intel.com>
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

Add connector helper hooks to check if mode is valid or not.
We add this restriction to make sure mode is 3840x2160 60Hz.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/i915/display/intel_writeback.c    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index 852951933348..765f62fa38f8 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -59,6 +59,25 @@ intel_writeback_connector_alloc(struct intel_connector *connector)
 	return 0;
 }
 
+static enum drm_mode_status
+intel_writeback_mode_valid(struct drm_connector *_connector,
+			   const struct drm_display_mode *mode)
+{
+	int refresh_rate;
+
+	if (mode->hdisplay > 3840)
+		return MODE_H_ILLEGAL;
+
+	if (mode->vdisplay > 2160)
+		return MODE_V_ILLEGAL;
+
+	refresh_rate = drm_mode_vrefresh(mode);
+	if (refresh_rate > 60)
+		return MODE_BAD;
+
+	return MODE_OK;
+}
+
 static int intel_writeback_get_modes(struct drm_connector *connector)
 {
 	return drm_add_modes_noedid(connector, 3840, 2160);
@@ -76,6 +95,7 @@ const struct drm_connector_funcs conn_funcs = {
 
 static const struct drm_connector_helper_funcs conn_helper_funcs = {
 	.get_modes = intel_writeback_get_modes,
+	.mode_valid = intel_writeback_mode_valid,
 };
 
 int intel_writeback_init(struct intel_display *display)
-- 
2.34.1

