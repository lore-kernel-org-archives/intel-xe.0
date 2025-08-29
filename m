Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C00DCA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 11:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F392C10E210;
	Fri, 29 Aug 2025 11:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BX7LyUJo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0629510E210
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 11:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756467267; x=1788003267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nmZA8NX2LPmM1qgPQHkmSSIBfG4MoA597bUvcqMcVsA=;
 b=BX7LyUJoGIXlXKgb6T2pQ3JGr+mJ016ESlRlmjXTCvGLXzM0919gSXAK
 bN72u4IEY8RXa18KiXRfxzfZ35lLfhXRCtOYGW01wV1dzKKeL3mvluaTx
 YQSut4M60whi/yyRXxpuSi0+RjQ0+Wq9IRfhuiBRF/7yNe/iPnSLVqWFx
 vO37ReZXRG447iTqolmrpI7ZhxImdwAsx7KxQL5t3CWDbwiblNTWzQNBq
 xYbyhMeRdNZnXPrXHLJltAia2g8C8KeNPIjlqjh4JYHq8Kzk2kmWFxl+x
 qg9S9pFr+LoBA9+FJeRv5/8UNbwR77ebhyz1kOll9I6jSpnARYI2wEjsa A==;
X-CSE-ConnectionGUID: 88DByp8jTZ+lv8SO6ZyQMA==
X-CSE-MsgGUID: 27YcFtfOTQO4TVGqXVxgeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="69025642"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="69025642"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 04:34:26 -0700
X-CSE-ConnectionGUID: lWbIhQKKSBOOp3RKRACvfw==
X-CSE-MsgGUID: GHxBl/GxRVi6CQgbDfJjSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170748277"
Received: from agladkov-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.245.245])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 04:34:24 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 2/3] drm/xe: Allow the pm notifier to continue on failure
Date: Fri, 29 Aug 2025 13:33:49 +0200
Message-ID: <20250829113350.40959-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829113350.40959-1-thomas.hellstrom@linux.intel.com>
References: <20250829113350.40959-1-thomas.hellstrom@linux.intel.com>
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

Its actions are opportunistic anyway and will be completed
on device suspend.

Also restrict the scope of the pm runtime reference to
the notifier callback itself to make it easier to
follow.

Marking as a fix to simplify backporting of the fix
that follows in the series.

Fixes: c6a4d46ec1d7 ("drm/xe: evict user memory in PM notifier")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: <stable@vger.kernel.org> # v6.16+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index a2e85030b7f4..b57b46ad9f7c 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -308,28 +308,22 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 	case PM_SUSPEND_PREPARE:
 		xe_pm_runtime_get(xe);
 		err = xe_bo_evict_all_user(xe);
-		if (err) {
+		if (err)
 			drm_dbg(&xe->drm, "Notifier evict user failed (%d)\n", err);
-			xe_pm_runtime_put(xe);
-			break;
-		}
 
 		err = xe_bo_notifier_prepare_all_pinned(xe);
-		if (err) {
+		if (err)
 			drm_dbg(&xe->drm, "Notifier prepare pin failed (%d)\n", err);
-			xe_pm_runtime_put(xe);
-		}
+		xe_pm_runtime_put(xe);
 		break;
 	case PM_POST_HIBERNATION:
 	case PM_POST_SUSPEND:
+		xe_pm_runtime_get(xe);
 		xe_bo_notifier_unprepare_all_pinned(xe);
 		xe_pm_runtime_put(xe);
 		break;
 	}
 
-	if (err)
-		return NOTIFY_BAD;
-
 	return NOTIFY_DONE;
 }
 
-- 
2.50.1

