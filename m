Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962A5606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 06:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OxvAUmtm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A831112098;
	Thu, 26 Nov 2026 06:35:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E4010FE15;
 Thu, 26 Nov 2026 06:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795674931; x=1827210931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o3DlFHDV+ShxgKdM67ynFmqb6TrR1bKXqeoYoY999ZY=;
 b=OxvAUmtmqwXonOUfixo1/sLX5DQLmiQmDxXeZyB86t8VRIS5Crq1Yj37
 5/TAXhVLZLjxuVE0Tl/iQ5WAnhRAKmxFSG8WRGgJVs7FB6aLFtgQOAoHV
 zweoJWgDEr27So9zG1iicot0NoUcDhKUHY0wi95Qz+NSKzL0OcZmdeiaA
 +FRjzpQozsd3lw+w19cKyJkJIwleTrz0XCT49FQ/zFhxh8NtGlto6dY22
 QwLtsR3jGNlX+ilhzouRjg4WzePZ4Oxk+5WVNKtG8zi24p3vbwrYaSF2H
 olx+Opo+9IFwGPekIImLRHk+LbJogf3FoakKGD5mCMlnRwwJmgwyFM9Gz A==;
X-CSE-ConnectionGUID: anLWFAZPR/GaxQqFkekYqw==
X-CSE-MsgGUID: GF9GMJJVS9a09dFrUTN9bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4462678"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4462678"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 22:35:31 -0800
X-CSE-ConnectionGUID: nfojomYKSG2d4MCu+QQ0Ig==
X-CSE-MsgGUID: /pS69EkMTuSyT/HNibSEqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12346791"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2026 22:35:29 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 12/15] drm/i915/dp: Apply link training fallback to the whole
 tile group
Date: Thu, 26 Nov 2026 12:04:56 +0530
Message-Id: <20261126063459.863698-13-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126063459.863698-1-suraj.kandpal@intel.com>
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Link training fallback only limits the link of the connector that
failed. The next modeset then trains that tile at a lower rate than
the others, and the tiles can no longer be pipelocked together.

When a tile that can be pipelocked falls back, apply the same max link
limits to the other tiles in its group, so they all retrain with the
same link config and stay locked.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../drm/i915/display/intel_dp_link_training.c | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index ac1aff6edf05..d19f8d9b2c60 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -43,6 +43,7 @@
 #include "intel_hotplug.h"
 #include "intel_modeset_lock.h"
 #include "intel_panel.h"
+#include "intel_pipelock.h"
 #include "intel_psr.h"
 
 /**
@@ -1976,6 +1977,37 @@ int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
 	return err;
 }
 
+static void intel_dp_tile_group_fallback(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	struct intel_connector *connector = intel_dp->attached_connector;
+	struct intel_dp_link_config max_link_limits;
+	struct drm_connector_list_iter conn_iter;
+	struct intel_connector *iter;
+
+	if (!intel_pipelock_connector_possible(connector))
+		return;
+
+	intel_dp_link_caps_get_max_limits(intel_dp->link.caps, &max_link_limits);
+
+	drm_connector_list_iter_begin(display->drm, &conn_iter);
+	for_each_intel_connector_iter(iter, &conn_iter) {
+		struct intel_dp *iter_dp;
+
+		if (iter == connector || !intel_pipelock_connector_possible(iter) ||
+		    iter->base.tile_group != connector->base.tile_group)
+			continue;
+
+		iter_dp = intel_attached_dp(iter);
+
+		if (!intel_dp_link_caps_set_max_limits(iter_dp->link.caps, &max_link_limits))
+			drm_dbg_kms(display->drm,
+				    "[CONNECTOR:%d:%s] Can't limit link to match tile group\n",
+				    iter->base.base.id, iter->base.name);
+	}
+	drm_connector_list_iter_end(&conn_iter);
+}
+
 static bool intel_dp_schedule_fallback_link_training(struct intel_atomic_state *state,
 						     struct intel_dp *intel_dp,
 						     const struct intel_crtc_state *crtc_state)
@@ -1995,6 +2027,8 @@ static bool intel_dp_schedule_fallback_link_training(struct intel_atomic_state *
 		return false;
 	}
 
+	intel_dp_tile_group_fallback(intel_dp);
+
 	/* Schedule a Hotplug Uevent to userspace to start modeset */
 	intel_dp_queue_modeset_retry_for_link(state, encoder, crtc_state);
 
-- 
2.34.1

