Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C21C606A338
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 22:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MIWETL7B
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14A610EC31;
	Mon, 23 Nov 2026 22:52:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB71510F24B;
 Mon, 23 Nov 2026 22:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795474332; x=1827010332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6OLYw7yE6ZiaS0nfjkU6CJek0YnZpJzNJrOUBGrIkv8=;
 b=MIWETL7BFGPLQ2gNel3NpRaAXeD6c7mq7EnrXy5tibBs3HckKIg8/qZ+
 FDyS3GytgzFe5GdI7w0llYxhYAC/IaYXG6ibkZbGorZmV6s8OkFpcZU7/
 l4b+M8c/E86fSOediIRlE38xUwk6zlEWbwIbG7RCAGktAMDi3WOjUr475
 x+z6qK6mz8z2YYAoz1Dod1SNI8ryI9u9KKIMqjH24ifTNy2zMsTeEeAye
 X8+NSGp1BND9EF2Fc4G26SNxWekUypXSH39lqVTS7iBQnIfFQGU8pcwZ1
 FwzTo5D+dTjq24mGC6bopgbyAoOGayim9A8yAP25sHPfzglWukLQRZnWz Q==;
X-CSE-ConnectionGUID: KBkMdq1/T3WKjaalWCU0Qw==
X-CSE-MsgGUID: x5FFdxbmQsmuaZ5FeVXGdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4172993"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4172993"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 14:52:06 -0800
X-CSE-ConnectionGUID: G/W7PVv/QlOvDiND3GI7FQ==
X-CSE-MsgGUID: moHRPFKaQEut/kboCbS53g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="13400370"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 14:52:06 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/9] drm/i915/hdcp: Pass the full atomic state to
 intel_hdcp_atomic_check()
Date: Tue, 24 Nov 2026 00:51:35 +0200
Message-ID: <20261123225139.23087-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123225139.23087-1-ville.syrjala@linux.intel.com>
References: <20261123225139.23087-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Stop looking at the connector_state->state footgun in
intel_hdcp_atomic_check(). Pass the full atomic state
from the caller instead.

The connector_state->state pointer is only valid up to
swap_state() after which it becomes NULL. In this case
the code only gets called during atomic_check() so we
do know that the pointer is valid, but it's best to never
use it since other people, unaware of the danger, might
blindly mimic the same approach elsewhere.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic.c | 2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c   | 6 +++---
 drivers/gpu/drm/i915/display/intel_hdcp.h   | 4 +++-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index b042c3cc78e1..8badcd4c04ae 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -124,7 +124,7 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
 		to_intel_digital_connector_state(old_state);
 	struct drm_crtc_state *crtc_state;
 
-	intel_hdcp_atomic_check(conn, old_state, new_state);
+	intel_hdcp_atomic_check(state, conn, old_state, new_state);
 
 	if (!new_state->crtc)
 		return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index dad0c854e4fa..1eb740243bba 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -2684,7 +2684,8 @@ void intel_hdcp_cleanup(struct intel_connector *connector)
 	mutex_unlock(&hdcp->mutex);
 }
 
-void intel_hdcp_atomic_check(struct drm_connector *connector,
+void intel_hdcp_atomic_check(struct drm_atomic_commit *state,
+			     struct drm_connector *connector,
 			     struct drm_connector_state *old_state,
 			     struct drm_connector_state *new_state)
 {
@@ -2703,8 +2704,7 @@ void intel_hdcp_atomic_check(struct drm_connector *connector,
 		return;
 	}
 
-	crtc_state = drm_atomic_get_new_crtc_state(new_state->state,
-						   new_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
 	/*
 	 * Fix the HDCP uapi content protection state in case of modeset.
 	 * FIXME: As per HDCP content protection property uapi doc, an uevent()
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h b/drivers/gpu/drm/i915/display/intel_hdcp.h
index 00f2b265ab4a..09a344823460 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.h
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
@@ -10,6 +10,7 @@
 
 #define HDCP_ENCRYPT_STATUS_CHANGE_TIMEOUT_MS	50
 
+struct drm_atomic_commit;
 struct drm_connector;
 struct drm_connector_state;
 struct drm_printer;
@@ -22,7 +23,8 @@ struct intel_encoder;
 struct intel_hdcp_shim;
 enum port;
 
-void intel_hdcp_atomic_check(struct drm_connector *connector,
+void intel_hdcp_atomic_check(struct drm_atomic_commit *state,
+			     struct drm_connector *connector,
 			     struct drm_connector_state *old_state,
 			     struct drm_connector_state *new_state);
 int intel_hdcp_init(struct intel_connector *connector,
-- 
2.56.1

