Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EB5C4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 06:49:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BE310E26E;
	Mon,  6 Nov 2023 06:49:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F6F10E26E
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 06:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699253347; x=1730789347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=snY3SeN7CaeUliaRrdCdYh05c+EB+xgUTG3bTUD6NDs=;
 b=CgxypzGK3F6Jn/b9B80s6NberRJoPrMNAhoBBgp/OleO9vOX5/qE9mNj
 X+1oEbcLUQdkDuUeB4ypunsEbdIiMiC521qfLWjwlfxtS7h8sst4qRpqG
 tvL1oNTN8l08ZtD9Yua2krftJnjI0lruhH/61Dwbpu1hZS/b4AS5LdMdj
 J9Y2PiWLXyia8B0VPfccD2vG8kDmBwWNP1I3zVV0bvf3Em+m8gR0KLrf+
 R6dHvQsFjbpnY0SDFnO4mAGC2UCPlI0A7zLFuvqudZF2caekx0tqYYeSS
 ozS3k6bOhIwekVRii1W/Nt+4CEBEqzpgfMibL5EDOWCoCTL2ZwzepBpOJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="369424672"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; d="scan'208";a="369424672"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:49:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="3534752"
Received: from rdegreef-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.42.181])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:49:05 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 08:48:34 +0200
Message-Id: <20231106064834.161647-9-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106064834.161647-1-jouni.hogander@intel.com>
References: <20231106064834.161647-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 8/8] fixup! FIXME: drm/i915/display: Remaining
 changes to make xe compile
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now as we have common dma fence handling for i915 and Xe we don't need to
have differing intel_prepare_plane_fb implementations.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 563b70f6a0c7..77e281bf4cb5 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -1072,7 +1072,6 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 {
 	struct intel_plane_state *new_plane_state =
 		to_intel_plane_state(_new_plane_state);
-#ifdef I915
 	struct i915_sched_attr attr = { .priority = I915_PRIORITY_DISPLAY };
 	struct intel_plane *plane = to_intel_plane(_plane);
 	struct intel_atomic_state *state =
@@ -1143,12 +1142,6 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 	intel_plane_unpin_fb(new_plane_state);
 
 	return ret;
-#else
-	if (!intel_fb_obj(new_plane_state->hw.fb))
-		return 0;
-
-	return intel_plane_pin_fb(new_plane_state);
-#endif
 }
 
 /**
-- 
2.34.1

