Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2349AC79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 19:43:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C635B10E2FE;
	Thu, 10 Sep 2026 19:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lvekFNrN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF0F10E2DE;
 Thu, 10 Sep 2026 19:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789069394; x=1820605394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JBF3mTDACNNNGQjjZPR8csMIdVl94a2TcP1ROAg4cDs=;
 b=lvekFNrNCthVzLdSMTf8ppApzNFb3Nw/sMW61Pq8qhbBPZndUoDVXbpw
 OBIu0hpfxOqspDAgO54AL6DPIstCLNUsEZHKatOIh1MsPiv3EOy0ZdZK5
 ezZbKVwoV+ewxGXTruM8fUxsNU47Ccm+sRCuZ0IF7Sb2+64oy6yY+nkLC
 fE90NrEfi5tyf4pW1uyvAPWKp7tu20Mie2E2bnCKEpyc8LfBFpoQbwW4K
 lV463NHbQw70amuIcxs52Gag48NMbkTvacATV/JL8QXBYz4gVTUZaTdJD
 edeyX1EwZ21oZCYLbivzd7r5GFS16WmAEBHp1hjRJDmig0s3jj4u5Es31 g==;
X-CSE-ConnectionGUID: WEWWcknkTUiLti1WohLIbQ==
X-CSE-MsgGUID: f8HucR5iTdmbQJ6DHIedCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="92041729"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="92041729"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 12:42:59 -0700
X-CSE-ConnectionGUID: qHtEjzpVTJqDRXVv9kvjTg==
X-CSE-MsgGUID: 9z7I3/nnRr6Tx2Hjno4LTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="276959680"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.208])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 12:42:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 maarten.lankhorst@linux.intel.com,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Subject: [PATCH 4/4] drm/i915/display: debug log about fence wait errors
Date: Thu, 10 Sep 2026 22:42:36 +0300
Message-ID: <6b670a146bfcfd0cc2c7641cc8d72df96e356ef9.1789069102.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789069102.git.jani.nikula@intel.com>
References: <cover.1789069102.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Currently there's no indication if fence wait failed. Debug log about
it.

v2: Rebase, no timeout anymore

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 983e84bca1ee..edaa29944d23 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7290,6 +7290,7 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 
 static void intel_atomic_commit_fence_wait(struct intel_atomic_state *state)
 {
+	struct intel_display *display = to_intel_display(state);
 	struct drm_plane *plane;
 	struct drm_plane_state *new_plane_state;
 	long ret;
@@ -7300,8 +7301,11 @@ static void intel_atomic_commit_fence_wait(struct intel_atomic_state *state)
 			continue;
 
 		ret = dma_fence_wait(new_plane_state->fence, false);
-		if (ret < 0)
+		if (ret < 0) {
+			drm_dbg_kms(display->drm, "[PLANE:%d:%s] fence wait failed (%pe)\n",
+				    plane->base.id, plane->name, ERR_PTR(ret));
 			break;
+		}
 
 		dma_fence_put(new_plane_state->fence);
 		new_plane_state->fence = NULL;
-- 
2.47.3

