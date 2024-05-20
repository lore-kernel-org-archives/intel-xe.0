Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2F2C25B79
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 15:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2239210E55F;
	Mon, 20 May 2024 15:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QAJxvYlu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7C710E315
 for <intel-xe@lists.freedesktop.org>; Mon, 20 May 2024 15:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716219940; x=1747755940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yiXAP2YTorL+MT9QESUNSuph4LL7iWaw80fYfZKe08o=;
 b=QAJxvYluUneWrydKZNE1Qz+9QDVQFXgfal20TIc6wEzmXsEt1lf1xAtQ
 48uylkUgWl6c77593bk9Dqo5hhRw/dPmgwrv/UqP9zPPBSyr+qF7rYA0A
 FNoom6NDHqkCJDqnWasSkbCD8RnuMOtgf004U6te+ziL/u0+q8rGJXGCt
 xAn4yXFnG0WEHEeCoVIi7sWFi0yZ/GANPAlSynKo+vLLWlu6jDBTC2WFZ
 1B+sHmWl2nOgAuNLQ464FT7wEyTeZ/522V7sNRfdMMzy6YMxqK/W09vvD
 KGBihVAYiTMLWAdIRtCn7hUsayontpjNEH5PQrQSPEJweCihV6c9V0WvD w==;
X-CSE-ConnectionGUID: 3igzTJPwSiCZAhmz5femyw==
X-CSE-MsgGUID: hYXxhAcCTvS/PmUEVx/D2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="34873135"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="34873135"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:40 -0700
X-CSE-ConnectionGUID: eMkmJCUTQhqsj/zkmdArQg==
X-CSE-MsgGUID: u6qAf9DdTjiKlvOEcAr6tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32610446"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:40 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [CI v2 05/18] drm/xe/guc: s/guc_fini/guc_fini_hw/
Date: Mon, 20 May 2024 16:42:54 +0100
Message-ID: <20240520154249.52888-23-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520154249.52888-19-matthew.auld@intel.com>
References: <20240520154249.52888-19-matthew.auld@intel.com>
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

Make it clear that is about cleaning up the HW/FW side, and not software
state.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 83122c2e00cd..8ddf460e9c02 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -241,7 +241,7 @@ static void guc_write_params(struct xe_guc *guc)
 		xe_mmio_write32(gt, SOFT_SCRATCH(1 + i), guc->params[i]);
 }
 
-static void guc_fini(void *arg)
+static void guc_fini_hw(void *arg)
 {
 	struct xe_guc *guc = arg;
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -325,7 +325,7 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
-	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini, guc);
+	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
 	if (ret)
 		goto out;
 
-- 
2.45.1

