Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57450EC873F
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 15:40:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AB210E826;
	Thu,  7 Sep 2023 15:40:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7FE10E80A;
 Thu,  7 Sep 2023 15:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694101205; x=1725637205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sRyPIMGdtTYp1oy5LA9o1x1tWOpTYsEkisatQU/wDZk=;
 b=RipgCplqA0P/gU9tNj5i6wxjPbGzBbXiUCFtxi8V6jqjRaTsu2qtXRAY
 JLF3mJLQmOY61aAV9h3zPMR5OUCbxh2ZYNvxNUCz0OFIaSRMU74Wjj0zz
 ImpDRS+9ccZz67gNJ2S1t0GMb18QSesYg1rLZfoBzZlXr+qbxhvZjHAro
 NrclA/vWCuBI2vIfJLRPZ7NtUEf9YHBOejxJrR/bZpmGYEFDUre0A5oH5
 ZH4q5Cb5ic5rkN93aRG6kcMjKcV/+sghaptGJEFMyhnoGa59ksI4+A/tN
 OpJ7eNndWw3H9SRUz8yDCVBLylFZNEamydPZXJRAngKDDzT4VwXvpPJ3m Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="362445759"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="362445759"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 08:38:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="1072930241"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="1072930241"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 08:38:14 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Date: Thu,  7 Sep 2023 08:37:36 -0700
Message-Id: <20230907153757.2249452-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230907153757.2249452-1-lucas.demarchi@intel.com>
References: <20230907153757.2249452-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 06/27] drm/i915/xe2lpd: Treat cursor plane as
 regular plane for DDB allocation
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
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

We now start calculating relative plane data rate for cursor plane as
well, as instructed by BSpec and also treat cursor plane same way as
other planes, when doing allocation, i.e not using fixed allocation for
cursor anymore.

Bspec: 68907
Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 .../gpu/drm/i915/display/intel_atomic_plane.c    |  6 +++---
 drivers/gpu/drm/i915/display/skl_watermark.c     | 16 +++++++++-------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 60a492e186ab..d7a0bd686e49 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -214,9 +214,6 @@ intel_plane_relative_data_rate(const struct intel_crtc_state *crtc_state,
 	int width, height;
 	unsigned int rel_data_rate;
 
-	if (plane->id == PLANE_CURSOR)
-		return 0;
-
 	if (!plane_state->uapi.visible)
 		return 0;
 
@@ -244,6 +241,9 @@ intel_plane_relative_data_rate(const struct intel_crtc_state *crtc_state,
 
 	rel_data_rate = width * height * fb->format->cpp[color_plane];
 
+	if (plane->id == PLANE_CURSOR)
+		return rel_data_rate;
+
 	return intel_adjusted_rate(&plane_state->uapi.src,
 				   &plane_state->uapi.dst,
 				   rel_data_rate);
diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 063929a42a42..64a122d3c9c0 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -1367,7 +1367,7 @@ skl_total_relative_data_rate(const struct intel_crtc_state *crtc_state)
 	u64 data_rate = 0;
 
 	for_each_plane_id_on_crtc(crtc, plane_id) {
-		if (plane_id == PLANE_CURSOR)
+		if (plane_id == PLANE_CURSOR && DISPLAY_VER(i915) < 20)
 			continue;
 
 		data_rate += crtc_state->rel_data_rate[plane_id];
@@ -1514,10 +1514,12 @@ skl_crtc_allocate_plane_ddb(struct intel_atomic_state *state,
 		return 0;
 
 	/* Allocate fixed number of blocks for cursor. */
-	cursor_size = skl_cursor_allocation(crtc_state, num_active);
-	iter.size -= cursor_size;
-	skl_ddb_entry_init(&crtc_state->wm.skl.plane_ddb[PLANE_CURSOR],
-			   alloc->end - cursor_size, alloc->end);
+	if (DISPLAY_VER(i915) < 20) {
+		cursor_size = skl_cursor_allocation(crtc_state, num_active);
+		iter.size -= cursor_size;
+		skl_ddb_entry_init(&crtc_state->wm.skl.plane_ddb[PLANE_CURSOR],
+				   alloc->end - cursor_size, alloc->end);
+	}
 
 	iter.data_rate = skl_total_relative_data_rate(crtc_state);
 
@@ -1531,7 +1533,7 @@ skl_crtc_allocate_plane_ddb(struct intel_atomic_state *state,
 			const struct skl_plane_wm *wm =
 				&crtc_state->wm.skl.optimal.planes[plane_id];
 
-			if (plane_id == PLANE_CURSOR) {
+			if (plane_id == PLANE_CURSOR && DISPLAY_VER(i915) < 20) {
 				const struct skl_ddb_entry *ddb =
 					&crtc_state->wm.skl.plane_ddb[plane_id];
 
@@ -1579,7 +1581,7 @@ skl_crtc_allocate_plane_ddb(struct intel_atomic_state *state,
 		const struct skl_plane_wm *wm =
 			&crtc_state->wm.skl.optimal.planes[plane_id];
 
-		if (plane_id == PLANE_CURSOR)
+		if (plane_id == PLANE_CURSOR && DISPLAY_VER(i915) < 20)
 			continue;
 
 		if (DISPLAY_VER(i915) < 11 &&
-- 
2.40.1

