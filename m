Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12F6606A327
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 06:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M6aEHF9K
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CC110FDE6;
	Thu, 26 Nov 2026 06:35:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5514D10FCB6;
 Thu, 26 Nov 2026 06:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795674919; x=1827210919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CE5EakEH0J4rnpd2DSOQHzY7apjK7AFkaAkEx0/62S4=;
 b=M6aEHF9Kr9HFWDSNv9RuHV0LuwKONQyIH5RbaB+yaWJe3KyLMEcr5G0C
 K/eCcIzd+8V53onDwWkxfwcNk7SpmXIZXM+cKnsVbAWajI+EzLz6ZalHC
 IxvjUbVwRLZ0xPBKcjV8ouxGgBZeuqExJRNtXyXoVRQZUXYtO8xltS505
 xghWiUCbtJQutD3n6d1xuocMt3/VYymArKwj1XrHiqd4D4/N7swiSc7f3
 mKgcX0kVAoYCaYXggfbFB/Qljipkaocj7aa996OCo7juWZeGGoaQQtq9o
 gPaWUFMVMod/KcZKQ87lWFbQp2ZTa+qXy23JQCB+2HUfU1RFMe+KaMjzk A==;
X-CSE-ConnectionGUID: WqbXdQn7Tm2xhmImbjq5fA==
X-CSE-MsgGUID: xJpW290NQaWqyyY83WpJRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4462657"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4462657"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 22:35:18 -0800
X-CSE-ConnectionGUID: sCDlbdSQQ82blXAVmYvruA==
X-CSE-MsgGUID: JS4dSICSRo2ZIP8Fq6J/OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12346723"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2026 22:35:15 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 06/15] drm/i915/display: Enable the pipelock primary before
 its secondaries
Date: Thu, 26 Nov 2026 12:04:50 +0530
Message-Id: <20261126063459.863698-7-suraj.kandpal@intel.com>
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

