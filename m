Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF742606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bmvBMwTi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647A7112204;
	Fri, 27 Nov 2026 06:10:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BE611212D;
 Fri, 27 Nov 2026 06:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795759790; x=1827295790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CE5EakEH0J4rnpd2DSOQHzY7apjK7AFkaAkEx0/62S4=;
 b=bmvBMwTiR0WLHU6LABjos8edtH7Jjse8SboRhDmGvPHyB9LzmmA9c5wG
 iwAvPPCj5UWthTeIjegGm30716GNEJpSjpKrgR9lVqgDxL3uA77uLqAlU
 p+Mc2zvdzDAGAbIhRktD7qs9DeRgdIFBqxi8afbbfSNPXiCYrjwknaRVq
 67tg97SdrKQb+pU22bEm5qkcfXrwfd4ooaDz1IOru1dGi9TGAbftYU18K
 MPHwUkLH3KJ9tybrS9DQ5LZazCB83JPfz6ZqzbvuAAAcWH73a+C1gAaPT
 kIqYGfJFColtK5d3s/+EBt/IzFZyFeAjTbLo7DUVL2JImjF7ugEzoY+Tc g==;
X-CSE-ConnectionGUID: IOjxYovbTuuwrGNlDuiENA==
X-CSE-MsgGUID: FD+yqttbR3qxjS+NI4qvMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4578252"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4578252"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:09:50 -0800
X-CSE-ConnectionGUID: MXiHtApcTgCucW3mWME3aA==
X-CSE-MsgGUID: W2WKFZKGRxW4jSaNL7huTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14361926"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa013.fm.intel.com with ESMTP; 26 Nov 2026 22:09:46 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, jani.nikula@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 06/18] drm/i915/display: Enable the pipelock primary before
 its secondaries
Date: Fri, 27 Nov 2026 11:39:12 +0530
Message-Id: <20261127060924.1648295-7-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127060924.1648295-1-suraj.kandpal@intel.com>
References: <20261127060924.1648295-1-suraj.kandpal@intel.com>
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

A pipelock secondary doesn't start its timing generator until it sees
a frame sync from the primary, and it raises no vblank interrupts
before that. With the port sync order the secondary is enabled first,
so the vblank wait in intel_enable_crtc() would time out.
Enable the primary first and the secondaries after it, so they lock
on the next frame sync and their vblank waits work as usual. The
disable order doesn't change, secondaries still go first.

Bspec: 73521
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 2839e2e7965c..c5d8d1178dd6 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -189,6 +189,16 @@ bool intel_crtc_in_sync_group(const struct intel_crtc_state *crtc_state)
 		intel_crtc_is_sync_secondary(crtc_state);
 }
 
+static bool intel_display_sync_enable_late(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+
+	if (HAS_PIPELOCK(display))
+		return intel_crtc_is_sync_secondary(crtc_state);
+
+	return intel_crtc_is_sync_primary(crtc_state);
+}
+
 /*
  * Return a bitmask of all the start indices of consecutive bitfields of size
  * width in mask.
@@ -7328,7 +7338,7 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 			continue;
 
 		if (intel_dp_mst_is_slave_trans(new_crtc_state) ||
-		    intel_crtc_is_sync_primary(new_crtc_state))
+		    intel_display_sync_enable_late(new_crtc_state))
 			continue;
 
 		modeset_pipes &= ~intel_crtc_joined_pipe_mask(new_crtc_state);
@@ -7338,7 +7348,7 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 
 	/*
 	 * Then we enable all remaining pipes that depend on other
-	 * pipes: MST slaves and port sync primaries
+	 * pipes: MST slaves, port sync primaries and pipelock secondaries
 	 */
 	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state) {
 		enum pipe pipe = crtc->pipe;
-- 
2.34.1

