Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964E7606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 20:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bEtIO1Uk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568B31129B2;
	Fri, 30 Oct 2026 20:34:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E08010E8DF;
 Fri, 30 Oct 2026 20:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793392473; x=1824928473;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=T28l5L4x4E4utTmXeyR7sJDhZsu800LOQ2Pa3cfxi4k=;
 b=bEtIO1Ukbld08Qch4TBpLxsIWIuyB3ZLn37/PvQraNP2M4m7gHzrWIcH
 bGi70bwo46XPGtv1fGV2fmEqVYZoKruRiQGRsXKxeWbzvSs3uM6eu9jyq
 TTT8EGkk7/H3a324o1JeOcCb0pSC9xIfyJ4PM27o6plsOWt4PGQSkWJ62
 3EtvPztBb4hrd43Cx8FgteZ6M/32t4peGNucAbcHcK3wWQcUaGmSjKqiK
 HhX4VEewBwnpl7YD+06lf2xk9Iwo8OJSzB8YnamBiH/wmq1T16GLZe8qw
 7IGQcKZ/K2rc4oRmkZAmuhwoyP0VLkFR6HCoJrKZAk/OMdqAAPF88OLGd Q==;
X-CSE-ConnectionGUID: dqdaZ/33SSGFfKZqE14SSA==
X-CSE-MsgGUID: hX3mlBIDQq+YhXD6loQoag==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2042445"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2042445"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 13:34:30 -0700
X-CSE-ConnectionGUID: LHfleOk5Q6mWEZlKkLyclA==
X-CSE-MsgGUID: klKafFwFSsGQ0d0krW9BXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5500630"
Received: from astead-desk.fm.intel.com ([10.80.113.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 13:34:30 -0700
From: Alan Stead <alan.stead@intel.com>
To: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 vivek.kasireddy@intel.com, dongwon.kim@intel.com, james.xiong@intel.com
Subject: [RFC v1 3/3] drm/i915/vrr: Allow VRR on HDMI 2.1 sinks
Date: Fri, 30 Oct 2026 13:32:22 -0700
Message-ID: <20261030203314.1085262-4-alan.stead@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030203314.1085262-1-alan.stead@intel.com>
References: <20261030203314.1085262-1-alan.stead@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Let intel_vrr_is_capable() accept HDMI sinks that advertise a VRR range
in the HDMI Forum VSDB (parsed by the DRM core into
display_info.hdmi.vrr_cap), and use that range instead of the EDID range
descriptor for the in-range check and for vmax. A VRRmax of 0 means the
refresh rate of the video timing, in which case the maximum comes from
the EDID range descriptor.

Attach the vrr_capable connector property to HDMI connectors and update
it whenever the EDID is read or dropped, as is done for DP.

HDMI 2.1 VRR is signalled to the sink with the VTEM, which needs the
HDMI EMP hardware of display version 20+, so restrict it to those.

Signed-off-by: Alan Stead <alan.stead@intel.com>
Assisted-by: LLM
---
 drivers/gpu/drm/i915/display/intel_hdmi.c |  8 ++++
 drivers/gpu/drm/i915/display/intel_vrr.c  | 54 +++++++++++++++++++----
 2 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index b6fa1a1558b8..4854e86c1762 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2490,6 +2490,8 @@ intel_hdmi_unset_edid(struct drm_connector *_connector)
 
 	drm_edid_free(connector->detect_edid);
 	connector->detect_edid = NULL;
+
+	drm_connector_set_vrr_capable_property(&connector->base, false);
 }
 
 static void
@@ -2573,6 +2575,9 @@ intel_hdmi_set_edid(struct drm_connector *_connector)
 
 	connector->detect_edid = drm_edid;
 
+	drm_connector_set_vrr_capable_property(&connector->base,
+					       intel_vrr_is_capable(connector));
+
 	if (drm_edid_is_digital(drm_edid)) {
 		intel_hdmi_dp_dual_mode_detect(&connector->base);
 
@@ -2726,6 +2731,9 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *_
 
 	if (!HAS_GMCH(display))
 		drm_connector_attach_max_bpc_property(&connector->base, 8, 12);
+
+	if (HAS_VRR(display) && DISPLAY_VER(display) >= 20)
+		drm_connector_attach_vrr_capable_property(&connector->base);
 }
 
 /*
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index f4cc4148d3a1..ae3863c523b6 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -39,11 +39,33 @@
 #define DCB_CORRECTION_AGGRESSIVENESS	1000 /* ms × 100; 10 ms */
 #define DCB_BLANK_TARGET		50
 
+/*
+ * The refresh rate range the sink supports VRR in. HDMI 2.1 sinks advertise
+ * it in the HDMI Forum VSDB, where VRRmax = 0 means "the refresh rate of the
+ * video timing" (fall back to the EDID range descriptor for the maximum).
+ */
+static void intel_vrr_sink_range(struct intel_connector *connector,
+				 int *min_vfreq, int *max_vfreq)
+{
+	const struct drm_display_info *info = &connector->base.display_info;
+	const struct drm_hdmi_vrr_cap *vrr_cap = &info->hdmi.vrr_cap;
+
+	*min_vfreq = info->monitor_range.min_vfreq;
+	*max_vfreq = info->monitor_range.max_vfreq;
+
+	if (connector->base.connector_type == DRM_MODE_CONNECTOR_HDMIA &&
+	    vrr_cap->supported) {
+		*min_vfreq = vrr_cap->vrr_min;
+		if (vrr_cap->vrr_max)
+			*max_vfreq = vrr_cap->vrr_max;
+	}
+}
+
 bool intel_vrr_is_capable(struct intel_connector *connector)
 {
 	struct intel_display *display = to_intel_display(connector);
-	const struct drm_display_info *info = &connector->base.display_info;
 	struct intel_dp *intel_dp;
+	int min_vfreq, max_vfreq;
 
 	if (!HAS_VRR(display))
 		return false;
@@ -78,24 +100,36 @@ bool intel_vrr_is_capable(struct intel_connector *connector)
 			return false;
 
 		break;
+	case DRM_MODE_CONNECTOR_HDMIA:
+		/*
+		 * HDMI 2.1 VRR is signalled to the sink with the VTEM, which
+		 * is sent using the EMP hardware of display version 20+.
+		 */
+		if (DISPLAY_VER(display) < 20 ||
+		    !connector->base.display_info.hdmi.vrr_cap.supported)
+			return false;
+		break;
 	default:
 		return false;
 	}
 
-	if (!info->monitor_range.min_vfreq || !info->monitor_range.max_vfreq ||
-	    info->monitor_range.min_vfreq > info->monitor_range.max_vfreq)
+	intel_vrr_sink_range(connector, &min_vfreq, &max_vfreq);
+
+	if (!min_vfreq || !max_vfreq || min_vfreq > max_vfreq)
 		return false;
 
-	return info->monitor_range.max_vfreq - info->monitor_range.min_vfreq > 10;
+	return max_vfreq - min_vfreq > 10;
 }
 
 bool intel_vrr_is_in_range(struct intel_connector *connector, int vrefresh)
 {
-	const struct drm_display_info *info = &connector->base.display_info;
+	int min_vfreq, max_vfreq;
+
+	intel_vrr_sink_range(connector, &min_vfreq, &max_vfreq);
 
 	return intel_vrr_is_capable(connector) &&
-		vrefresh >= info->monitor_range.min_vfreq &&
-		vrefresh <= info->monitor_range.max_vfreq;
+		vrefresh >= min_vfreq &&
+		vrefresh <= max_vfreq;
 }
 
 bool intel_vrr_possible(const struct intel_crtc_state *crtc_state)
@@ -413,11 +447,13 @@ static
 int intel_vrr_compute_vmax(struct intel_connector *connector,
 			   const struct drm_display_mode *adjusted_mode)
 {
-	const struct drm_display_info *info = &connector->base.display_info;
+	int min_vfreq, max_vfreq;
 	int vmax;
 
+	intel_vrr_sink_range(connector, &min_vfreq, &max_vfreq);
+
 	vmax = adjusted_mode->crtc_clock * 1000 /
-		(adjusted_mode->crtc_htotal * info->monitor_range.min_vfreq);
+		(adjusted_mode->crtc_htotal * min_vfreq);
 	vmax = max_t(int, vmax, adjusted_mode->crtc_vtotal);
 
 	return vmax;
-- 
2.53.0

