Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC64FEA806
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 05:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C94610E768;
	Wed, 25 Mar 2026 05:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eyfhk1Y9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE5F10E777;
 Wed, 25 Mar 2026 05:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774414800; x=1805950800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=csehzMGxSCQB0Onc7q0j/azkp/i+EcMOSx2qSIYtkyw=;
 b=eyfhk1Y99v45nDcc5d7x3p0pkOgXRUq515+lsAmnpmNrwK9PMpZqgRPx
 Gi6w7Yp2dMy1sw8NC4geQvEEfJSAwTEPfyGLca98v32UkieS1GwZZuRPQ
 sGgGgOg5xx3dM5kfgr0hm14tS2ix9IE8SrkpAbdANeXD2nhiRQJMiu0sW
 jolg7TlnXpoYJTkghCvZFNxfR0BdD0bZO117X+U7tt8/f5z4B+9q+uLT8
 QceBY7UJa0grRzw/bewVtO2kN3XxvEQTjHoN0gw9y9i8uX8YxYrUt/lzN
 eLEeDOIE/4NQVT/tg497FoartY6cD/5rBybKwgirZ5pjNTZuEKgERmbEY g==;
X-CSE-ConnectionGUID: 0/3Xa2EJQK6w5SowWyVcpQ==
X-CSE-MsgGUID: nOcUI/9DRs2ZdgFo1mrU9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86922324"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="86922324"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 22:00:00 -0700
X-CSE-ConnectionGUID: OGdYfZKOTCOUqzAvMPBSXQ==
X-CSE-MsgGUID: 0FM/7kioSyKxaACbF93dIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="224580552"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 24 Mar 2026 21:59:57 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: sowmiya.s@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com,
 chaitanya.kumar.borah@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 13/26] drm/i915/writeback: Define function for connector
 function detect
Date: Wed, 25 Mar 2026 10:29:03 +0530
Message-Id: <20260325045916.984243-14-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325045916.984243-1-suraj.kandpal@intel.com>
References: <20260325045916.984243-1-suraj.kandpal@intel.com>
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

detect function always returns connector_status_connected if
writeback connector has been initialized.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_writeback.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index c1361a295b17..77b1ec19d3a0 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -153,11 +153,19 @@ static void intel_writeback_cleanup_job(struct drm_connector *connector,
 	job->priv = NULL;
 }
 
+static enum drm_connector_status
+intel_writeback_detect(struct drm_connector *connector,
+		       bool force)
+{
+	return connector_status_connected;
+}
+
 static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
 const struct drm_connector_funcs conn_funcs = {
+	.detect = intel_writeback_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = intel_digital_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-- 
2.34.1

