Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4062CD5BAE
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 08:02:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748BE10EF5B;
	Wed, 20 May 2026 08:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vwftw0oi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C1710EF45;
 Wed, 20 May 2026 08:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779264174; x=1810800174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+lES0vaXLP7bWJ87JCiJjjMryPwBd6f0BgUSHhUk9zY=;
 b=Vwftw0oi38+W5IVtTjGjKhLf9cUS0AvxALiTyc6CjwfUEbYs3q/PWmFq
 DzXN204Rhpif5rjLMjaI0tDEtNmY+i29bjTa3npa/NjH5cEQ10X4+7ld5
 dio6btOiT7bhwle85AtF7b5NtjRtvD++ziwb2wDrowmK1qmDhX4AEvLVj
 oOeTc8HdNYVwzn9xmMikAMCrjjqrCZhM5gF3hMwLdMBpgDqhgoGibqU6v
 IdhZyeDnTtPuk5jjxfOuKyggHuBSpbo8eFz9uF4YlgAAelfM/hlDzap4B
 TekjEU88tZq37G7RgRMIak0sKuc4pfK7aEdBuiQX7dp7ykv8pRQKzvgx7 A==;
X-CSE-ConnectionGUID: FNghHMyjSHqHD51k9AscSA==
X-CSE-MsgGUID: zwuTNzUuT+GwsJo15DGgIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91260567"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="91260567"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 01:02:54 -0700
X-CSE-ConnectionGUID: 70uQ0v3JTKifoKmPULkJaA==
X-CSE-MsgGUID: CupqU6vDQ06BRmjg57KjCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="263583932"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa002.fm.intel.com with ESMTP; 20 May 2026 01:02:52 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com
Subject: [CI 2/6] drm/atomic: reject colorop update from inactive color
 pipeline
Date: Wed, 20 May 2026 13:08:23 +0530
Message-Id: <20260520073827.3395745-3-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260520073827.3395745-1-chaitanya.kumar.borah@intel.com>
References: <20260520073827.3395745-1-chaitanya.kumar.borah@intel.com>
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

From: Melissa Wen <mwen@igalia.com>

Only allow updates on colorops that are part of an active pipeline.
Check if a colorop in a new state belongs to a color pipeline which was
set as a plane color_pipeline property and therefore is an active color
pipeline. If not, reject the atomic state. Performing this check later
in drm_atomic_check_only() to remove the ordering dependency that would
exist if done at the time of colorop property setting.

Suggested-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_atomic.c | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 28831a548b0c..659cf56150e5 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -812,6 +812,33 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	return 0;
 }
 
+/**
+ * drm_atomic_colorop_check - check new colorop state
+ * @new_colorop_state: new colorop state to check
+ *
+ * Ensure that the colorop in @new_colorop_state belongs to an active color
+ * pipeline, i.e. it's in the chain of colorops set to the color_pipeline
+ * property of a plane state.
+ *
+ * Returns: 0 on success, -EINVAL otherwise.
+ */
+static int drm_atomic_colorop_check(const struct drm_colorop_state *new_colorop_state)
+{
+	struct drm_colorop *colorop, *color_pipeline;
+	struct drm_plane_state *new_plane_state;
+
+	new_plane_state = drm_atomic_get_new_plane_state(new_colorop_state->state,
+							 new_colorop_state->colorop->plane);
+	color_pipeline = new_plane_state ? new_plane_state->color_pipeline :
+			 new_colorop_state->colorop->plane->state->color_pipeline;
+
+	for (colorop = color_pipeline; colorop; colorop = colorop->next)
+		if (colorop == new_colorop_state->colorop)
+			return 0;
+
+	return -EINVAL;
+}
+
 static void drm_atomic_colorop_print_state(struct drm_printer *p,
 					   const struct drm_colorop_state *state)
 {
@@ -1665,6 +1692,8 @@ int drm_atomic_check_only(struct drm_atomic_commit *state)
 	struct drm_plane *plane;
 	struct drm_plane_state *old_plane_state;
 	struct drm_plane_state *new_plane_state;
+	struct drm_colorop *colorop;
+	struct drm_colorop_state *new_colorop_state;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	struct drm_crtc_state *new_crtc_state;
@@ -1681,6 +1710,15 @@ int drm_atomic_check_only(struct drm_atomic_commit *state)
 			requested_crtc |= drm_crtc_mask(crtc);
 	}
 
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		ret = drm_atomic_colorop_check(new_colorop_state);
+		if (ret) {
+			drm_dbg_atomic(dev, "[COLOROP:%d:%d] is not part of an active color pipeline.\n",
+				       colorop->base.id, colorop->type);
+			return ret;
+		}
+	}
+
 	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
 		ret = drm_atomic_plane_check(old_plane_state, new_plane_state);
 		if (ret) {
-- 
2.25.1

