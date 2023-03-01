Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1A7C64ED6
	for <intel-xe@archiver.kernel.org>; Wed,  1 Mar 2023 09:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2467910E0B7;
	Wed,  1 Mar 2023 09:31:48 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D858510E09E
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Mar 2023 09:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677663106; x=1709199106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=chbX8zqKqwxdKuHvBbFBxb17ky+hjNETMZMT6XJQn3k=;
 b=arI9PZycGH7JqJ4iSs3Yz+Otey/wMmEi1A1sOe2qbAoI0kwmnR2eOsfz
 bfBB2zXSa48Dx+yT037ZnPOWVoyA7UDNQGdnznGy1dvzlMFqikuz4AwYu
 KGlqbBrnUx3euUZBj4oXYe+M33cmNKbJJYFkoA8wmctJa/WOk/yQTIjER
 Xd3xzp6IhE5GFNJ89HspdfqMvlEVWnZUdQrypzhCOQmBIW3v7bpd8oSqJ
 gelfhu4e1Nem44kQPpRrVG5w1to4n54AwVJuQ4FL4BzpgLptVIGo1a/Sk
 KU2yBa4+L2lXtfUZl0tdNCUERX9GNbpX43BZiufSnMDd1BAnfLfT+QTCs w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="333091754"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="333091754"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 01:31:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="1003600475"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="1003600475"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 01:31:46 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Mar 2023 01:31:07 -0800
Message-Id: <20230301093112.2893689-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230301093112.2893689-1-lucas.demarchi@intel.com>
References: <20230301093112.2893689-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/7] drm/xe/rtp: Add match for render reset domain
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This allows to create WA/tuning rules that match the first engine that
is either of compute or render class. This matters for platforms that
don't have a render engine and that may have arbitrary compute engines
fused off: some register programming need to be added to one of those
engines.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  5 +++++
 drivers/gpu/drm/xe/xe_rtp.c             | 10 ++++++++++
 drivers/gpu/drm/xe/xe_rtp.h             | 18 ++++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 05a2fdc381d7..2c40384957da 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -23,6 +23,7 @@ enum xe_engine_class {
 
 enum xe_hw_engine_id {
 	XE_HW_ENGINE_RCS0,
+#define XE_HW_ENGINE_RCS_MASK	GENMASK_ULL(XE_HW_ENGINE_RCS0, XE_HW_ENGINE_RCS0)
 	XE_HW_ENGINE_BCS0,
 	XE_HW_ENGINE_BCS1,
 	XE_HW_ENGINE_BCS2,
@@ -32,6 +33,7 @@ enum xe_hw_engine_id {
 	XE_HW_ENGINE_BCS6,
 	XE_HW_ENGINE_BCS7,
 	XE_HW_ENGINE_BCS8,
+#define XE_HW_ENGINE_BCS_MASK	GENMASK_ULL(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS0)
 	XE_HW_ENGINE_VCS0,
 	XE_HW_ENGINE_VCS1,
 	XE_HW_ENGINE_VCS2,
@@ -40,14 +42,17 @@ enum xe_hw_engine_id {
 	XE_HW_ENGINE_VCS5,
 	XE_HW_ENGINE_VCS6,
 	XE_HW_ENGINE_VCS7,
+#define XE_HW_ENGINE_VCS_MASK	GENMASK_ULL(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0)
 	XE_HW_ENGINE_VECS0,
 	XE_HW_ENGINE_VECS1,
 	XE_HW_ENGINE_VECS2,
 	XE_HW_ENGINE_VECS3,
+#define XE_HW_ENGINE_VECS_MASK	GENMASK_ULL(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0)
 	XE_HW_ENGINE_CCS0,
 	XE_HW_ENGINE_CCS1,
 	XE_HW_ENGINE_CCS2,
 	XE_HW_ENGINE_CCS3,
+#define XE_HW_ENGINE_CCS_MASK	GENMASK_ULL(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0)
 	XE_NUM_HW_ENGINES,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index c04eca290ef0..0d2f51bb06e8 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -160,3 +160,13 @@ bool xe_rtp_match_even_instance(const struct xe_gt *gt,
 {
 	return hwe->instance % 2 == 0;
 }
+
+bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
+					  const struct xe_hw_engine *hwe)
+{
+	u64 render_compute_mask = gt->info.engine_mask &
+		(XE_HW_ENGINE_CCS_MASK | XE_HW_ENGINE_RCS_MASK);
+
+	return render_compute_mask &&
+		hwe->engine_id == __ffs(render_compute_mask);
+}
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 9bd2532442ed..433f0cbff57f 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -409,4 +409,22 @@ void xe_rtp_process(const struct xe_rtp_entry *entries, struct xe_reg_sr *sr,
 bool xe_rtp_match_even_instance(const struct xe_gt *gt,
 				const struct xe_hw_engine *hwe);
 
+/*
+ * xe_rtp_match_first_render_or_compute - Match if it's first render or compute
+ * engine in the GT
+ *
+ * @gt: GT structure
+ * @hwe: Engine instance
+ *
+ * Registers on the render reset domain need to have their values re-applied
+ * when any of those engines are reset. Since the engines reset together, a
+ * programming can be set to just one of them. For simplicity the first engine
+ * of either render or compute class can be chosen.
+ *
+ * Returns: true if engine id is the first to match the render reset domain,
+ * false otherwise.
+ */
+bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
+					  const struct xe_hw_engine *hwe);
+
 #endif
-- 
2.39.0

