Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A38CD3430
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 10:11:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB8910E5FD;
	Mon,  4 May 2026 10:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pgo8JT58";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0851310E200;
 Mon,  4 May 2026 10:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777889489; x=1809425489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dg8X46XetOSBZdDHcrYWrVyHA4rZPbrpHQKVPRq5t1k=;
 b=Pgo8JT58DM+R48OMqETFOprWbt0Jdl3I8YD1VGmSfdIk5W/W/gKguuIb
 n1cbuf0UT1Aegx+MaYQQKpdygojSJHaG9+70x1JmBpMJ08pM8W2ZbG3wx
 WfxAyBNmucMstoxUkWowG74IYogc2mcQktT76USAPjXAGQi2PELeOdbdj
 5lEesALlcSjpPQIUfcUer/nkiuqGb9aGur/81VPiEpKjgbF/zsybN9IF2
 kEb0LmBAewa8O/pIsN47ZoagIkGGoyF4e/0h65GKZ4wuUdZgBgRYzMDzl
 lMAzgjITf08tmHP7wEvCEK5tnL6U4hir/0W/rtD1EpZbe8q+KVTLlEGUq w==;
X-CSE-ConnectionGUID: CL/r9inUS4iiSJQRlh8abw==
X-CSE-MsgGUID: KDKnvE+bQvmzUN5vuUxInA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="82356836"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="82356836"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 03:11:28 -0700
X-CSE-ConnectionGUID: CJnQmku+SpqcUkiBCI7MyQ==
X-CSE-MsgGUID: ljBP9yW8SamTJrKXwVKPLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="232327137"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa007.fm.intel.com with ESMTP; 04 May 2026 03:11:27 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, fnu.vishwanatha@intel.com,
 santhosh.reddy.guddati@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 1/2] drm/i915/hdcp: Use new MST topology state in
 intel_conn_to_vcpi()
Date: Mon,  4 May 2026 15:41:17 +0530
Message-Id: <20260504101117.3619984-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504101117.3619984-1-suraj.kandpal@intel.com>
References: <20260504101117.3619984-1-suraj.kandpal@intel.com>
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

intel_conn_to_vcpi() runs from the HDCP enable path in commit_tail
and looks up the VCPI via mgr->base.state. When an ALLOCATE_PAYLOAD
is being driven on the mgr just before HDCP enable, that payload
list is being mutated in place, so the lookup can miss the port and
trip drm_WARN_ON(!payload), causing HDCP to be programmed with
VCPI 0.
Use drm_atomic_get_new_mst_topology_state() to read the topology
state attached to this atomic commit (stable, decided in
atomic_check), and bail out cleanly when no topology state or
payload is present for this port instead of WARNing.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Tested-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
v1 -> v2:
- Update commit meessage and subject (Santhosh Reddy Guddati)

 drivers/gpu/drm/i915/display/intel_hdcp.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 9b4ff3b80b05..02ac981ca1ea 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -72,6 +72,7 @@ intel_hdcp_adjust_hdcp_line_rekeying(struct intel_encoder *encoder,
 static int intel_conn_to_vcpi(struct intel_atomic_state *state,
 			      struct intel_connector *connector)
 {
+	struct intel_display *display = to_intel_display(state);
 	struct drm_dp_mst_topology_mgr *mgr;
 	struct drm_dp_mst_atomic_payload *payload;
 	struct drm_dp_mst_topology_state *mst_state;
@@ -82,10 +83,17 @@ static int intel_conn_to_vcpi(struct intel_atomic_state *state,
 	mgr = connector->mst.port->mgr;
 
 	drm_modeset_lock(&mgr->base.lock, state->base.acquire_ctx);
-	mst_state = to_drm_dp_mst_topology_state(mgr->base.state);
+	mst_state = drm_atomic_get_new_mst_topology_state(&state->base, mgr);
+	if (!mst_state) {
+		drm_dbg_kms(display->drm, "MST topology still not created\n");
+		return 0;
+	}
+
 	payload = drm_atomic_get_mst_payload_state(mst_state, connector->mst.port);
-	if (drm_WARN_ON(mgr->dev, !payload))
+	if (!payload) {
+		drm_dbg_kms(display->drm, "MST Payload not present\n");
 		return 0;
+	}
 
 	return payload->vcpi;
 }
-- 
2.34.1

