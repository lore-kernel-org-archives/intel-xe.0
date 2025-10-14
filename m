Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF42CCD195
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 16:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A3B10E66B;
	Tue, 14 Oct 2025 16:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ses/43Bb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D2610E203
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 16:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760460482; x=1791996482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UJY0dUlDYc8GA3tyKMmKtl+aO76mdNkJ6GUEwU9OzX4=;
 b=Ses/43BblHmsoiw9wXJwz5O58rN7KpKN9XduFsTfdDY0Jgj6nxgL6DAM
 lstB/BuZL7hFhhSnS46eaJnvsAmFxWOKF9mFx3Axs4ne7B3D28qykZ1wo
 qNEPX0crPVQgwApiqoGJEuMvdFy2G6Ceej87JlwUY9xrvhwyhsikknoEi
 pP5NQVC3QIUMWx8XCbPkWIaRjgA/1PAJ1K4TYMM86XX/3n+sw1WgknYcp
 6ItbPaw/dqdOIKplww11lTrWBF3DMY4TXEWOWsG1HlOFRfOvFgoG//KK1
 YZoJB4QBLVgY8j66MXg3+D5cSOr2wkAhKR+d/s+e1G71IMBaA7uO0E+IE w==;
X-CSE-ConnectionGUID: C2u9mFUtQRO6gdyvDw18Fg==
X-CSE-MsgGUID: 0z5ctJGlTg6Y0JZ89x8f+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="80063044"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="80063044"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:48:01 -0700
X-CSE-ConnectionGUID: FuGatJykRQ2wVOP9JiNn9w==
X-CSE-MsgGUID: S1XUJeu/SEuZmFhqQwm4vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="186184684"
Received: from dut4443lnl.fm.intel.com ([10.105.8.76])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:48:01 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 rodrigo.vivi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v3 2/7] drm/xe: Don't call xe_device_lookup_gt twice in
 xe_hw_engine_lookup
Date: Tue, 14 Oct 2025 16:48:01 +0000
Message-ID: <20251014164758.125598-11-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014164758.125598-9-jonathan.cavitt@intel.com>
References: <20251014164758.125598-9-jonathan.cavitt@intel.com>
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

We already initialize a
struct xe_gt *gt = xe_device_lookup_gt(xe, eci.gt_id)
in xe_hw_engine_lookup to ensure the given gt_id is valid.
We don't need to call xe_device_lookup_gt again to pass the same
gt to xe_gt_hw_engine in xe_hw_engine_lookup.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index d00cd37c0c5c..db66708ca386 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1073,7 +1073,6 @@ xe_hw_engine_lookup(struct xe_device *xe,
 	idx = array_index_nospec(eci.engine_class,
 				 ARRAY_SIZE(user_to_xe_engine_class));
 
-	return xe_gt_hw_engine(xe_device_lookup_gt(xe, eci.gt_id),
-			       user_to_xe_engine_class[idx],
+	return xe_gt_hw_engine(gt, user_to_xe_engine_class[idx],
 			       eci.engine_instance, true);
 }
-- 
2.43.0

