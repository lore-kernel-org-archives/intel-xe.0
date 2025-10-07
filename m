Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF0ACCD186
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 11:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A465A10E682;
	Tue,  7 Oct 2025 11:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d6iG6Div";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6730C10E5D0
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 11:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759836408; x=1791372408;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=43DjX4XeIiEK7BpiQ6DzR5g7+04qzLTzYTq/hTp2q88=;
 b=d6iG6Divu4jxePQM1hd+cooHT8YggFc44XW7n4WTzwMymQpJAhebqg1N
 lZ8zPypOJztO+y2B0VrP/M8wR/tD71Gz0mMgrta6+0v4+DJGS7JI0Ehb0
 Qx0Jr+25r4WdiQv4z/JlZSJLxnSYW/juQJNomL3hWiDHW87/yE+u2UT3O
 8Zxr6GR2+G464B3otFidk1F5JvWDHJd+AKHZ5yCcQtx/cRYLqQizccUiM
 eBWsAmxcMqS8A9jG33j2h3teyh9UFFX+rUtVgl81u7qd/XvpB+EYuFzce
 Xmq0CCA8lOSjD8P9GkVYdV6IU8F1YAaGsE8pRTJ7s4puJ7RjstmvX6J2P w==;
X-CSE-ConnectionGUID: xfzLWhGOTqWngR8oLChhwA==
X-CSE-MsgGUID: OgyIMCT3TxCsobkM1RNVyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="65660675"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="65660675"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:47 -0700
X-CSE-ConnectionGUID: 9VNgKKICRoay0yuN9HZkOg==
X-CSE-MsgGUID: YQ8c1j+4Q36xsDFB3UY4AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180923990"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 06/32] drm/xe: Make LRC W/A scratch buffer usage consistent
Date: Tue,  7 Oct 2025 04:26:15 -0700
Message-Id: <20251007112641.2669655-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007112641.2669655-1-matthew.brost@intel.com>
References: <20251007112641.2669655-1-matthew.brost@intel.com>
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

The LRC W/A currently checks for LRC being iomem in some places, while
in others it checks if the scratch buffer is non-NULL. This
inconsistency causes issues with the VF post-migration recovery code,
which blindly passes in a scratch buffer.

This patch standardizes the check by consistently verifying whether the
LRC is iomem to determine if the scratch buffer should be used.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 2c6eae2de1f2..b5083c99dd50 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1247,7 +1247,7 @@ static int setup_bo(struct bo_setup_state *state)
 
 static void finish_bo(struct bo_setup_state *state)
 {
-	if (!state->buffer)
+	if (!state->lrc->bo->vmap.is_iomem)
 		return;
 
 	xe_map_memcpy_to(gt_to_xe(state->lrc->gt), &state->lrc->bo->vmap,
-- 
2.34.1

