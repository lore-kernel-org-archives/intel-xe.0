Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E16CD3444
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 01:32:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B147410EF6D;
	Thu,  7 May 2026 01:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G9U0KFdC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C011610EF6D;
 Thu,  7 May 2026 01:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778117557; x=1809653557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7R153jv7NqCfBPvSQctASI5DH33XEAdUFTtQMFzW5p0=;
 b=G9U0KFdCypHHS7hgInlUSOLZt4CMOjbUcbvklUWzL8JUCECiH8BvRNJN
 NU+fL3ZMdg/AU/cv0J4bBM68W8+NGDc0OK5X4jSF10rOSj+yDOTsbxtCt
 JdHehyFC6bb3yzB/m8aAwXA63Y9Lp/ufEEUmrH9lb+0VGTHt9vHU8sYaG
 PIrorG3WSfXvrxF+Y5JV86izKoF8H5F74/JOSM7OHh1jVjlgz9Okhztjg
 BJX0WP2A9OBNc94l8uFYGvPsaFdN8q600ZxV5+sgdLs+Qb9Q7XDAykLC9
 H1A9xqCrNhKJATwA79IHutpnHACIFJEVfaKwFS1gyirkWOOxPhb/hLIAg w==;
X-CSE-ConnectionGUID: WN0viN7WTlm+ksm2GcxTpg==
X-CSE-MsgGUID: 4bSzPtwWR4iR6+8VSRxc5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78089070"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="78089070"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:32:37 -0700
X-CSE-ConnectionGUID: D9EtYThSQP6YWo8ZC+bivg==
X-CSE-MsgGUID: LZTiqFUbTwKyFKQKRI/iug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="266692907"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 06 May 2026 18:32:37 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v3 30/31] drm/i915/buf_trans: compute JSL's VS/PE-O index
Date: Thu,  7 May 2026 03:31:36 +0200
Message-ID: <20260507013137.527510-31-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260507013137.527510-1-michal.grzelak@intel.com>
References: <20260507013137.527510-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Compute the most appropriate VS/PE-O index for JSL.

For external DP always use 1st table.

For eDPs not using low vswing use 1st table as well.

In cases when eDP encoder uses low vswing, choose 1st table if encoder
supports HBR3. When encoder supports HBR2 choose 3rd table. When
encoder supports modes lower than HBR2 choose 2nd table.

Warn if encoder does not support DP. In that case fallback to using
default VS/PE tables.

Looking from other OSes, in case when encoder does not support DP we
could theoretically use 1st table. However, as of now, use default
tables until it will be explicitly seen in the wild.

v2->v3
- return -EINVAL instead of -1 (Suraj)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 .../drm/i915/display/intel_ddi_buf_trans.c    | 30 ++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
index 067ab47c00883..a38e74aaca1f7 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
@@ -1786,6 +1786,31 @@ xe3plpd_get_lt_buf_trans(struct intel_encoder *encoder,
 		return intel_get_buf_trans(&xe3plpd_lt_trans_dp14, n_entries);
 }
 
+static int
+jsl_compute_index(struct intel_encoder *encoder,
+		  const struct intel_crtc_state *crtc_state)
+{
+	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP)) {
+		if (use_edp_low_vswing(encoder)) {
+			if (crtc_state->port_clock > 540000)
+				return 0;
+			else if (crtc_state->port_clock > 270000)
+				return 2;
+			else
+				return 1;
+		}
+	}
+
+	if (intel_crtc_has_dp_encoder(crtc_state))
+		return 0;
+
+	drm_WARN(to_intel_display(crtc_state)->drm, 1,
+		 "non-DP (%d) encoder asks to compute VS/PE-O index\n",
+		 crtc_state->output_types);
+
+	return -EINVAL;
+}
+
 static enum ehl_vspeo_index
 ehl_compute_index(struct intel_encoder *encoder,
 		  const struct intel_crtc_state *crtc_state)
@@ -1885,8 +1910,11 @@ vspeo_compute_index(struct intel_encoder *encoder,
 		else
 			return snps_c20_compute_index(crtc_state);
 	} else if (DISPLAY_VER(display) == 11) {
-		if (display->platform.elkhartlake)
+		if (display->platform.elkhartlake) {
 			return ehl_compute_index(encoder, crtc_state);
+		} else if (display->platform.jasperlake) {
+			return jsl_compute_index(encoder, crtc_state);
+		}
 	}
 
 	drm_dbg_kms(display->drm,
-- 
2.45.2

