Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC5FF55139
	for <intel-xe@archiver.kernel.org>; Sun,  8 Mar 2026 13:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD0C10E15E;
	Sun,  8 Mar 2026 13:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MyAuAF3Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819E310E164;
 Sun,  8 Mar 2026 13:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772976309; x=1804512309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6KVH615DTae6mCzUGAQctgVNvAbBnF/asRLr21t3zmU=;
 b=MyAuAF3YU0o+uzbBxny3f9EhzfPj8lv4z3ge9eME3gcVvsa928qIs6v2
 G+lEX+xRqVuN3BZPNxnB4nQucEQOrnJCw0wCWEE09vsGitidGollv6wJm
 zuXhToqNLJRhA5fJrwqFg1uwZOvGi1ifKgRSV6zDH6wkLSonDvQ/Xke2X
 o/6Pgg9IZIn1Vcu3xnv67PkIluGMHGZPURwQqRZq4x9LsPs46TvrOic+s
 bNexv3oaOWaUyABZWWs8Mqk/VBt3Q8DzvBlzYvMOnsZ6hOKqujSb4CHh3
 20l+BD6fTxcQf3YFLZgNyLWT7HbeguDSsG3+ewKi4HVDeIiFeKUQeHytW A==;
X-CSE-ConnectionGUID: ZyyF5mOyQFKT73kQHlgq1w==
X-CSE-MsgGUID: rDPSGtHmS1a37dgv1enqmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="77871403"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="77871403"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 06:25:09 -0700
X-CSE-ConnectionGUID: R/YuslGAR2Ov/ZGy1OQXig==
X-CSE-MsgGUID: jseRWk/BRQ2w807KozWkQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="217598149"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa008.fm.intel.com with ESMTP; 08 Mar 2026 06:25:08 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [RFC v1 06/11] drm/i915/buf_trans: add intel_edp_above_hbr2() helper
Date: Sun,  8 Mar 2026 14:24:41 +0100
Message-ID: <20260308132446.3320848-7-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260308132446.3320848-1-michal.grzelak@intel.com>
References: <20260308132446.3320848-1-michal.grzelak@intel.com>
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

Check if port_clock is above HBR2 inside separate function.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 .../drm/i915/display/intel_ddi_buf_trans.c    | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
index ee6a78a20dac..8b369535189c 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
@@ -1191,6 +1191,13 @@ static bool intel_dp_above_hbr1(const struct intel_crtc_state *crtc_state)
 	return false;
 }
 
+static bool intel_edp_above_hbr2(const struct intel_crtc_state *crtc_state)
+{
+	if (crtc_state->port_clock > 540000)
+		return true;
+	return false;
+}
+
 static bool use_edp_hobl(struct intel_encoder *encoder)
 {
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
@@ -1374,7 +1381,7 @@ icl_get_combo_buf_trans_edp(struct intel_encoder *encoder,
 			    const struct intel_crtc_state *crtc_state,
 			    int *n_entries)
 {
-	if (crtc_state->port_clock > 540000) {
+	if (intel_edp_above_hbr2(crtc_state)) {
 		return intel_get_buf_trans(&icl_combo_phy_trans_dp_hbr2_edp_hbr3,
 					   n_entries);
 	} else if (use_edp_low_vswing(encoder)) {
@@ -1499,7 +1506,7 @@ tgl_get_combo_buf_trans_edp(struct intel_encoder *encoder,
 			    const struct intel_crtc_state *crtc_state,
 			    int *n_entries)
 {
-	if (crtc_state->port_clock > 540000) {
+	if (intel_edp_above_hbr2(crtc_state)) {
 		return intel_get_buf_trans(&icl_combo_phy_trans_dp_hbr2_edp_hbr3,
 					   n_entries);
 	} else if (use_edp_hobl(encoder)) {
@@ -1544,7 +1551,7 @@ dg1_get_combo_buf_trans_edp(struct intel_encoder *encoder,
 			    const struct intel_crtc_state *crtc_state,
 			    int *n_entries)
 {
-	if (crtc_state->port_clock > 540000)
+	if (intel_edp_above_hbr2(crtc_state))
 		return intel_get_buf_trans(&icl_combo_phy_trans_dp_hbr2_edp_hbr3,
 					   n_entries);
 	else if (use_edp_hobl(encoder))
@@ -1586,7 +1593,7 @@ rkl_get_combo_buf_trans_edp(struct intel_encoder *encoder,
 			    const struct intel_crtc_state *crtc_state,
 			    int *n_entries)
 {
-	if (crtc_state->port_clock > 540000) {
+	if (intel_edp_above_hbr2(crtc_state)) {
 		return intel_get_buf_trans(&icl_combo_phy_trans_dp_hbr2_edp_hbr3,
 					   n_entries);
 	} else if (use_edp_hobl(encoder)) {
@@ -1629,7 +1636,7 @@ adls_get_combo_buf_trans_edp(struct intel_encoder *encoder,
 			     const struct intel_crtc_state *crtc_state,
 			     int *n_entries)
 {
-	if (crtc_state->port_clock > 540000)
+	if (intel_edp_above_hbr2(crtc_state))
 		return intel_get_buf_trans(&adls_combo_phy_trans_edp_hbr3, n_entries);
 	else if (use_edp_hobl(encoder))
 		return intel_get_buf_trans(&tgl_combo_phy_trans_edp_hbr2_hobl, n_entries);
@@ -1668,7 +1675,7 @@ adlp_get_combo_buf_trans_edp(struct intel_encoder *encoder,
 			     const struct intel_crtc_state *crtc_state,
 			     int *n_entries)
 {
-	if (crtc_state->port_clock > 540000) {
+	if (intel_edp_above_hbr2(crtc_state)) {
 		return intel_get_buf_trans(&adlp_combo_phy_trans_edp_hbr3,
 					   n_entries);
 	} else if (use_edp_hobl(encoder)) {
-- 
2.45.2

