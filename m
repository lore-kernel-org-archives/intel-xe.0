Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65613CD4F3C
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 08:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1546C10EF61;
	Wed, 20 May 2026 08:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yp/EdBFF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6177510EF49;
 Wed, 20 May 2026 08:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779264180; x=1810800180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SzFOqWT0Dmf3kU1Lv01Gg/xaLQ4c1vLSupatE4RGU4I=;
 b=Yp/EdBFFY+fuPwmH3cRSkiRcUq0+lsHhYuv5OHSA1ao7VFqy/poemfW0
 MVXK3USO1/a1ds21W1GbW1/Onq4siksMpljW2IJcpfPAyLOg9eTnjQn0f
 p9BNIHY70dmTfojPJsSvVtKd6wmhDusq9Qrf7tsmJxE+JYSToBdB2/mI6
 B5YgINlKiN5sTtFr3MDCplcR+sU88fbd2WJi0Ma+1SpldyjDVmYOBs2rW
 SxO3LsOwpjYxXPev3+Nlrt3Eu3FwX2iyW3aVonsZvP6vkjEJ2Rp5SUvo9
 9oixtiTb104uPfnWMXDW/T6xAI/NrrYm45NVuINE1tI3FOFGJVHNayF8/ A==;
X-CSE-ConnectionGUID: SzAtiaTWTrSHsQNhNJUVKw==
X-CSE-MsgGUID: SzB+6DEjRemlS8n7U9pZ3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91260575"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="91260575"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 01:03:00 -0700
X-CSE-ConnectionGUID: XDzCgwuFSuee1JgJ1WZLKg==
X-CSE-MsgGUID: rwElSZ/3RZ+K2dU/LnOuaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="263583990"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa002.fm.intel.com with ESMTP; 20 May 2026 01:02:58 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com
Subject: [CI 6/6] drm/amd/display: use plane color_mgmt_changed to track
 colorop changes
Date: Wed, 20 May 2026 13:08:27 +0530
Message-Id: <20260520073827.3395745-7-chaitanya.kumar.borah@intel.com>
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

Ensure the driver tracks changes in any colorop property of a plane
color pipeline by using the same mechanism of CRTC color management and
update plane color blocks when any colorop property changes. It fixes an
issue observed on gamescope settings for night mode which is done via
shaper/3D-LUT updates.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 3ae2f330c6b4..6be77ad25468 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10198,7 +10198,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_commit *state,
 			continue;
 
 		bundle->surface_updates[planes_count].surface = dc_plane;
-		if (new_pcrtc_state->color_mgmt_changed) {
+		if (new_pcrtc_state->color_mgmt_changed || new_plane_state->color_mgmt_changed) {
 			bundle->surface_updates[planes_count].gamma = &dc_plane->gamma_correction;
 			bundle->surface_updates[planes_count].in_transfer_func = &dc_plane->in_transfer_func;
 			bundle->surface_updates[planes_count].gamut_remap_matrix = &dc_plane->gamut_remap_matrix;
@@ -12040,6 +12040,10 @@ static bool should_reset_plane(struct drm_atomic_commit *state,
 	if (new_crtc_state->color_mgmt_changed)
 		return true;
 
+	/* Plane color pipeline or its colorop changes. */
+	if (new_plane_state->color_mgmt_changed)
+		return true;
+
 	/*
 	 * On zpos change, planes need to be reordered by removing and re-adding
 	 * them one by one to the dc state, in order of descending zpos.
-- 
2.25.1

