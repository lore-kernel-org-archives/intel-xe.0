Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80ED606A319
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 05:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YtXyfHM6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78396112997;
	Fri, 23 Oct 2026 05:03:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53D410E552;
 Fri, 23 Oct 2026 05:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792731768; x=1824267768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jwe/bP3DVG7eJjoiLtgdgSaGNAfk28yeOI4aFNXkmKo=;
 b=YtXyfHM6Zan5qDMS+h90wQ8Ovcm+3EIeRyJKPtPC0bYljRseAZOxjGHx
 nkrMwFrxFAAUVKfCZ+PK7fuD0jFhWdZkbk69j8AS2HmgtRIcEWgvbfujU
 G+1/DlXtLeiaAYP4/gFjn0GKJXrm9L8nE/i+jcSKDJYx1v6hz9nyNs91f
 bWUFLW6wqjDez87jUEEvDw5q0G8NE63GmBdPV1IDHwGftXaJsq8qjWu7c
 w8LqDM9v4I2h+DTUiwEq/AWQ/ssRG7/Mm0foPx7RcysB1/D0AyYT53wxs
 QhLJsjbngY4aGF40bof84bB/job74rHfp0JpqfJV51GQs+BneeroqpE6h A==;
X-CSE-ConnectionGUID: 70JlHL1bQLGEAAvgqmiLPA==
X-CSE-MsgGUID: 7a+Dw7UUQ6WCxdgzSUXndQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1499167"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1499167"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:02:48 -0700
X-CSE-ConnectionGUID: zfmjRxaiQMiRue445TraSw==
X-CSE-MsgGUID: 6H9ZZfNNTSiEvOto8ZE/Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3926641"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 22 Oct 2026 22:02:46 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v8 09/14] drm/i915/display: Program Wa_14021768792 for linkm/n
 ratio > 10
Date: Fri, 23 Oct 2026 10:32:22 +0530
Message-Id: <20261023050227.2068466-10-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023050227.2068466-1-suraj.kandpal@intel.com>
References: <20261023050227.2068466-1-suraj.kandpal@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a bypass_m_n_ratio_limit member to struct intel_link_m_n to track
whether Wa_14021768792 is used to bypass the Link M/N ratio limit, and
program the workaround when it is set.
CHICKEN_TRANS and HDMI_EMP_DATA are programmed before LINK_N, since
writing LINK_N arms the double buffered update of the M/N registers, and
all of the programming has to be done before the transcoder is enabled.
Both are also explicitly cleared when the mechanism is not in use, so
that state cannot leak from a previous modeset.

Bspec: 49266
Co-developed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  | 35 ++++++++++++++++++-
 .../drm/i915/display/intel_display_types.h    |  2 ++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 461b81bf8341..b48f12cc615f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2715,6 +2715,15 @@ void intel_zero_m_n(struct intel_link_m_n *m_n)
 	m_n->tu = 1;
 }
 
+static u8 bmg_get_link_n_ext(const struct intel_link_m_n *m_n)
+{
+	if (!m_n->link_n)
+		return 0;
+
+	return PIPE_LINK_N1_EXT_INT(m_n->link_m / m_n->link_n) |
+		PIPE_LINK_N1_EXT_CEIL(DIV_ROUND_UP(m_n->link_m, m_n->link_n));
+}
+
 void intel_set_m_n(struct intel_display *display,
 		   const struct intel_link_m_n *m_n,
 		   intel_reg_t data_m_reg, intel_reg_t data_n_reg,
@@ -2726,7 +2735,9 @@ void intel_set_m_n(struct intel_display *display,
 	intel_de_write(display, data_n_reg, m_n->data_n);
 	intel_de_write(display, link_m_reg, m_n->link_m);
 
-	if (DISPLAY_VER(display) >= 14)
+	if (DISPLAY_VER(display) >= 14 && m_n->bypass_m_n_ratio_limit)
+		link_n |= PIPE_LINK_N1_EXTENDED(bmg_get_link_n_ext(m_n));
+	else if (DISPLAY_VER(display) >= 14)
 		link_n &= ~PIPE_LINK_N1_EXTENDED_MASK;
 	else
 		link_n &= DATA_LINK_M_N_MASK;
@@ -2747,6 +2758,26 @@ bool intel_cpu_transcoder_has_m2_n2(struct intel_display *display,
 	return IS_DISPLAY_VER(display, 5, 7) || display->platform.cherryview;
 }
 
+static void bmg_enhanced_tgdda_write(struct intel_crtc *crtc,
+				     enum transcoder transcoder,
+				     const struct intel_link_m_n *m_n)
+{
+	struct intel_display *display = to_intel_display(crtc);
+	bool enable = m_n->bypass_m_n_ratio_limit && m_n->link_n;
+	u32 link_m_frac = enable ? m_n->link_m % m_n->link_n : 0;
+
+	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
+		return;
+
+	intel_de_rmw(display, HDMI_EMP_DATA(display, transcoder),
+		     HDMI_EMP_DATA_LINK_M_FRAC_MASK,
+		     REG_FIELD_PREP(HDMI_EMP_DATA_LINK_M_FRAC_MASK, link_m_frac));
+
+	intel_de_rmw(display, CHICKEN_TRANS(display, transcoder),
+		     DP_ENHANCED_TGDDA_ENABLE,
+		     enable ? DP_ENHANCED_TGDDA_ENABLE : 0);
+}
+
 void intel_cpu_transcoder_set_m1_n1(struct intel_crtc *crtc,
 				    enum transcoder transcoder,
 				    const struct intel_link_m_n *m_n)
@@ -2754,6 +2785,8 @@ void intel_cpu_transcoder_set_m1_n1(struct intel_crtc *crtc,
 	struct intel_display *display = to_intel_display(crtc);
 	enum pipe pipe = crtc->pipe;
 
+	bmg_enhanced_tgdda_write(crtc, transcoder, m_n);
+
 	if (DISPLAY_VER(display) >= 5)
 		intel_set_m_n(display, m_n,
 			      PIPE_DATA_M1(display, transcoder),
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 8f9fb2603638..d0748837ce97 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -985,6 +985,8 @@ struct intel_link_m_n {
 	u32 data_n;
 	u32 link_m;
 	u32 link_n;
+	/* Wa_14021768792 for linkm/n ratio > 10 */
+	bool bypass_m_n_ratio_limit;
 };
 
 struct intel_csc_matrix {
-- 
2.34.1

