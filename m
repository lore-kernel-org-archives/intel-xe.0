Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7331EC5AC81
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 12:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F2810F4AA;
	Fri,  7 Aug 2026 12:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZ8Q9yLf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935F610F4A9;
 Fri,  7 Aug 2026 12:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786106066; x=1817642066;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w3giVvmUDhAYxfbFtr7T400GMClul/VpdLObRUcGAPE=;
 b=eZ8Q9yLfC9s813Y0bZjrTuiw/2TQf8a4NbiD6I33frEpp6RsJe7TAPBo
 O7Huvgh/VW5oDt8DswYo70PD1Dd3nKK9Gmx7AqLVMG/NV4+AqfO0Pb0qv
 bZWHd8QbAczbGu7Nz1wN02tfcMdzE5yQdgCczIkX9dRWVjEV11RxQ5fwe
 m0GSdijxN4f1OHccVjN1siALkzAxUVvKU/6zLymjEzJVgTChhYh6L1HvN
 vSkdQjBI3UmDOkeiW/3mPU+wyyikSNkSnY92KHNV/636qapaEgqD3N8b+
 3g2rBJ5tgxwprx5pv0v+dSujkr+Vvn+0ZYWOuSjoScde2SAseWjL5TA0I Q==;
X-CSE-ConnectionGUID: iNfCCXNjRGak5kwgb0Am+g==
X-CSE-MsgGUID: kqN0mIpXQcWlqTkAeBeqbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86824038"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86824038"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:34:26 -0700
X-CSE-ConnectionGUID: hn4T05APQYeZjOKBE62Ukw==
X-CSE-MsgGUID: +8l6m3cCQw+g3/BvY/rzdA==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.152])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:34:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	jani.nikula@intel.com
Subject: [PATCH 3/4] drm/i915/dp: Limit compute config joining to pipes that
 can actually join
Date: Fri,  7 Aug 2026 15:34:06 +0300
Message-ID: <dc1c7fc45d4da7d3fd1bd8b94c30c78d69aa0742.1786105831.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1786105831.git.jani.nikula@intel.com>
References: <cover.1786105831.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Skip joining for pipes that can't work as joiner primary pipe for the
number of pipes being joined. This limits the invalid combos early,
instead of ending up with crtc_state->joiner_pipes that would fail
during modeset. Before, crtc_state->joiner pipes could have ended up
including pipes that do not exist on the platform.

Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 5 +++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index e1604bc895e5..6b60e0a1c8ee 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2910,6 +2910,7 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 			     struct drm_connector_state *conn_state,
 			     bool respect_downstream_limits)
 {
+	struct intel_display *display = to_intel_display(encoder);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
@@ -2924,6 +2925,10 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 		return -EINVAL;
 
 	for_each_joiner_candidate(connector, adjusted_mode, num_joined_pipes) {
+		/* If the pipe can't be a joiner primary, skip early. */
+		if (!(intel_joiner_valid_primary_pipe_mask(display, num_joined_pipes) & BIT(crtc->pipe)))
+			continue;
+
 		/*
 		 * NOTE:
 		 * The crtc_state->joiner_pipes should have been set at the end
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 3be1643f8d03..379666692bc8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -770,6 +770,10 @@ static int mst_stream_compute_config(struct intel_atomic_state *state,
 		return ret;
 
 	for_each_joiner_candidate(connector, adjusted_mode, num_joined_pipes) {
+		/* If the pipe can't be a joiner primary, skip early. */
+		if (!(intel_joiner_valid_primary_pipe_mask(display, num_joined_pipes) & BIT(crtc->pipe)))
+			continue;
+
 		if (num_joined_pipes > 1)
 			pipe_config->joiner_pipes = GENMASK(crtc->pipe + num_joined_pipes - 1,
 							    crtc->pipe);
-- 
2.47.3

