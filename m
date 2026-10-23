Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C650A606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 16:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lfO/+Ovn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B27B112C3E;
	Fri, 23 Oct 2026 16:58:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FEA112C39;
 Fri, 23 Oct 2026 16:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792774721; x=1824310721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9/Wy0LSY8brap8J1qY82GVEapjoJNQvIQuq4iZ414FA=;
 b=lfO/+OvnjxQ0d5r+EGE0Xg6NtNJKRGk6vrU8969Cw8kd+AVTAaci9K9k
 f3bPs2WotfGv5o/OhItCS0wpNo+2ekqqq37zQMi762TLaZED9Yk7riW9Y
 3XzP/+GcNqGgawrnTPYYUvnLSB98bk+/A9bmltdgCFa6fH7dMafFF87eY
 S2BO3xvGYeZ4x2Jb3yxwjwAh0tAu9Hfp+wp5ktvNX2I45KKsbw8blAhKq
 w48ywb44bwFwnvjgQbfHIZvkTIWtMth/yymNyNi19ZDHGtJVeeC529Ney
 FIjy4gLVdwtMW4R1Xvu2/BP8vLIxSEq5R242SBkZTD/NUGPP+azUC5z/h w==;
X-CSE-ConnectionGUID: JbyJJ+mNTwq0As0VZX7cgw==
X-CSE-MsgGUID: /Er8bAYYS8exnyxYXNJvng==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1428572"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1428572"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:41 -0700
X-CSE-ConnectionGUID: AdVmZIWUQGOzB+Ig28P8pQ==
X-CSE-MsgGUID: wEwK0lfxROCHmHeQPkPTdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="4033961"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:39 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 09/13] drm/i915/vrr: Extract vrr_safe_window_end()
Date: Fri, 23 Oct 2026 19:57:59 +0300
Message-ID: <20261023165803.31016-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
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
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Extract the safe window calculation into a new helper
(vrr_safe_window_end()). This is analogous to vrr_vblank_start().
Other uses for this will appear soon.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 528f72f43022..e0b0b9ceb335 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -1261,13 +1261,19 @@ int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state)
 		return crtc_state->hw.adjusted_mode.crtc_vdisplay;
 }
 
+static int vrr_safe_window_end(const struct intel_crtc_state *crtc_state,
+			       int vblank_start)
+{
+	return vblank_start - crtc_state->set_context_latency;
+}
+
 int intel_vrr_vmin_safe_window_end_live(const struct intel_crtc_state *crtc_state)
 {
 	int vmin_vblank_start = crtc_state->vrr.dc_balance.enable ?
 			intel_vrr_dcb_vmin_vblank_start_live(crtc_state) :
 			intel_vrr_vmin_vblank_start(crtc_state);
 
-	return vmin_vblank_start - crtc_state->set_context_latency;
+	return vrr_safe_window_end(crtc_state, vmin_vblank_start);
 }
 
 static
-- 
2.55.0

