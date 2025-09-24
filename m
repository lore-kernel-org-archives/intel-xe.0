Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57852CAC5B1
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 14:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EDA10E73B;
	Wed, 24 Sep 2025 14:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ILqTKaf3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD4210E73C;
 Wed, 24 Sep 2025 14:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758724154; x=1790260154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iYlKnzjpi63Lb1kpmKvJVK5zy/Sa+XnRmyJgrcxFuWE=;
 b=ILqTKaf3sPbdSLvnOSWzdKyRcRTTNIU/DYIhit/m7RFcvzMFkLg7H5kN
 Oj9VmEF1GFBxl2Ezf2S9XalCHRB25e4FbVbxfM64kE/FXq4oVcCYg8Izj
 UGCuuqes03gEXYMK/XghwLDKt/PaJtt6FptauDwQCLrvd/Icqw400DPhF
 Vgywy/+1hqou/7KxIL0MNJ+nRjXdU/A4aCj1TDHjsfw8wfCb334b1T6ta
 EpGkrd9YUY7P5Zt1SAkdi0x1BuGBDpLK1u0nU2f3O1+PZS0eWr2ALB7bv
 exZqZYzK3kG3wWNXr5zJZboyuYC59fPx/TIODLx0UtCL5HowkUZfZGDPr Q==;
X-CSE-ConnectionGUID: dIk4NzqXTgGYPhSkMcdW4A==
X-CSE-MsgGUID: qPZYy7eHSFynWftiHK6WrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61075913"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="61075913"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 07:29:14 -0700
X-CSE-ConnectionGUID: +H9rXLqWR82nmjlnR8hpww==
X-CSE-MsgGUID: lEZVKj5iQveIYq4Ex5VItw==
X-ExtLoop1: 1
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 07:29:12 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 04/10] drm/i915/vrr: Use SCL for computing guardband
Date: Wed, 24 Sep 2025 19:45:36 +0530
Message-ID: <20250924141542.3122126-5-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250924141542.3122126-1-ankit.k.nautiyal@intel.com>
References: <20250924141542.3122126-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

For now guardband is equal to the vblank length so ideally it should be
computed as difference between the vmin vtotal and vactive. However
since we are having few lines as SCL, we need to account for this while
computing the guardband.

Since the vblank start is moved by SCL lines from the vactive, the delta
between the vmin vtotal and new vblank start was used to account for this.
Now that SCL is explicitly tracked using the `set_context_latency` member,
use it directly in the guardband calculation.

In the future, when the guardband is shortened or optimized, we may need
to factor in both the change in the vblank start and SCL lines. For now,
explicitly accounting for SCL is sufficient.

v2: Fix typo: replace adjusted_mode->vdisplay with
adjusted_mode->crtc_vdisplay. (Ville)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index e188e5f07987..e414fb53552f 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -418,7 +418,9 @@ void intel_vrr_compute_config_late(struct intel_crtc_state *crtc_state)
 		return;
 
 	crtc_state->vrr.guardband =
-		crtc_state->vrr.vmin - adjusted_mode->crtc_vblank_start -
+		crtc_state->vrr.vmin -
+		adjusted_mode->crtc_vdisplay -
+		crtc_state->set_context_latency -
 		intel_vrr_extra_vblank_delay(display);
 
 	if (DISPLAY_VER(display) < 13) {
-- 
2.45.2

