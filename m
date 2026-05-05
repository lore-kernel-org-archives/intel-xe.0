Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD100CD3430
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 09:40:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7141410E117;
	Tue,  5 May 2026 09:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KCx0b2Ru";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3519E10E117;
 Tue,  5 May 2026 09:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777974025; x=1809510025;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UOxdpAm0/FzKCEG8IInkIKG/Y429WJekXrxv9genq/k=;
 b=KCx0b2Rui5aeTyK5DGUNkHosym8aPBTDD4yfXwLg16lL9Q6xwD9B7YPO
 /wwLsugxIPXXGf9WdLO6hW6cArR7QQ3AIj7Psyi6CFkbNZ2NQmdsrHHqN
 Mt3MmIkT1yp9gQn5ZWEHyxbR9BkTIWfQ/9kGL+EaKr+x9RKCDT61AaI8f
 V1OfOZ+rYtnGg8NDClWue8o4UL1WS2bH6tA8ZQRPxj+xHqHERgmHo2R+R
 n4wEntPJzieMsIAukoso92W0xKbDfJMHpMzq7viBS96kbRLSn7/oaz0XE
 8R/VO7WNoX3LLe4vdnuD5rZy/fdeb5nnKLibz9Vsi+Fc0VJ1nIa/tyoqz g==;
X-CSE-ConnectionGUID: EsJyekS/Q2K6/TcJfdll6w==
X-CSE-MsgGUID: ID91QlypQxqHSsRUFg8a/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="96267175"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="96267175"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 02:40:25 -0700
X-CSE-ConnectionGUID: pGe+AhVAR0CEplDNPVVSKw==
X-CSE-MsgGUID: 5IXLd7FySYeE/TXwyLpSSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="273916277"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa001.jf.intel.com with ESMTP; 05 May 2026 02:40:22 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, fnu.vishwanatha@intel.com,
 santhosh.reddy.guddati@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/hdcp: Skip inactive MST connectors when building
 stream list
Date: Tue,  5 May 2026 15:10:22 +0530
Message-Id: <20260505094022.4064256-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

intel_hdcp_required_content_stream() walks every connector on the
digital port to populate hdcp_port_data->streams[]. The only filter is
connector_status_disconnected, which reflects physical presence on the
MST topology, not whether the connector currently drives a stream.
On a multi-sink MST setup where only a subset of sinks are modeset,
the loop can pick a sibling MST connector that is connected but has
no active CRTC / VC payload. intel_conn_to_vcpi() then logs "MST
Payload not present" and returns 0, and the bogus StreamID=0 is
written to the repeater in RepeaterAuth_Stream_Manage (DPCD 0x693F0).
Authentication completes, but the repeater shortly raises
LINK_INTEGRITY_FAILURE (RxStatus 0x69493 bit4) because the StreamID
does not match any stream on its input. The HDCP check work then
tears the link down, the Content Protection property drops back to
DESIRED, and userspace observes a spurious HDCP enable failure.
Filter the connector iteration to only those with a CRTC assigned in
the new atomic state, so intel_conn_to_vcpi() is called for the
connector actually being enabled and reads its real VCPI from the MST
topology state.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 982f698e9814..1b2e2727c14c 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -116,6 +116,7 @@ intel_hdcp_required_content_stream(struct intel_atomic_state *state,
 	struct intel_digital_port *conn_dig_port;
 	struct intel_connector *connector;
 	struct hdcp_port_data *data = &dig_port->hdcp.port_data;
+	struct drm_connector_state *new_conn_state;
 	bool enforce_type0 = false;
 	int k;
 
@@ -139,6 +140,11 @@ intel_hdcp_required_content_stream(struct intel_atomic_state *state,
 		if (conn_dig_port != dig_port)
 			continue;
 
+		new_conn_state = drm_atomic_get_new_connector_state(&state->base,
+								    &connector->base);
+		if (!new_conn_state || !new_conn_state->crtc)
+			continue;
+
 		data->streams[data->k].stream_id =
 			intel_conn_to_vcpi(state, connector);
 		data->k++;
-- 
2.34.1

