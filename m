Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C13CD64099
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 23:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B813A10E027;
	Fri,  8 Nov 2024 23:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ROvS3jaz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DB210E027
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 23:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731107167; x=1762643167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hVwZRc2xH7hWNsOAiRwHarH0PI2GyGXg4m/M1iAjJyw=;
 b=ROvS3jaz9pilNCZvPBDxytfYaNLOcUHws5dwldxiL+ZvoHwIyWa3uMts
 Kns66UqvST+WxyCK3UesLoeXM1HocHLtF582j0W5wGe1VbktBmNWaO1a2
 Xel8FlPOhkRsCiCjnHg7kp5PS3QVVZ6daq+I+s5zJcA7GVMGzu84We6OE
 5k2FsNSHFPMdZtXLOpOZXwS7In0ps0W/oGsVgOq6DwAfVTp/SFfmbl1jS
 XfHokQz5fdaYxo/imKSEE/uf4lwoLRGj9YFAm4xQYbINDlVmpC3ji0urF
 vPLLugwIrHDGUi7N5Y5ysjcdjdUYX7/uoTaI646RBI9QvDtk8exPcP3tA w==;
X-CSE-ConnectionGUID: WEtN/I1PQsyco0G7JbhD0g==
X-CSE-MsgGUID: eVpABvFSTj2xDk+CdDjn+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="42407023"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="42407023"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 15:06:06 -0800
X-CSE-ConnectionGUID: qiIPNIwASj2vmqnUfNxTYA==
X-CSE-MsgGUID: aWSTkITcSeO6BxAIB2/ZDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="86561705"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 15:06:06 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 2/2] drm/xe/oa: Allow subsequent OA streams to be opened on an
 exec_queue
Date: Fri,  8 Nov 2024 15:06:01 -0800
Message-ID: <20241108230602.2984959-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20241108230602.2984959-1-ashutosh.dixit@intel.com>
References: <20241108230602.2984959-1-ashutosh.dixit@intel.com>
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

The restriction that OA not be enabled on an active exec queue only applies
to the first OA stream opened on the exec queue. Subsequent OA streams can
be opened on the exec queue since this will not toggle the
OAC_CONTEXT_ENABLE bit.

Fixes: 2f4a730fcd2d ("drm/xe/oa: Add OAR support")
Cc: stable@vger.kernel.org
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
 drivers/gpu/drm/xe/xe_oa.c               | 8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 1158b6062a6cd..6e3311c22404e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -142,6 +142,8 @@ struct xe_exec_queue {
 	u64 tlb_flush_seqno;
 	/** @hw_engine_group_link: link into exec queues in the same hw engine group */
 	struct list_head hw_engine_group_link;
+	/** @oa: this exec_queue is used for OA (OAR/OAC) */
+	bool oa;
 	/** @lrc: logical ring context for this exec queue */
 	struct xe_lrc *lrc[] __counted_by(width);
 };
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index b0692b8ca0a3d..53d2946ea3052 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1915,6 +1915,9 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 		goto err_disable;
 	}
 
+	if (stream->exec_q && !stream->exec_q->oa)
+		stream->exec_q->oa = true;
+
 	/* Hold a reference on the drm device till stream_fd is released */
 	drm_dev_get(&stream->oa->xe->drm);
 
@@ -2068,9 +2071,10 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 		/*
 		 * Disallow OA from being enabled on active exec_queue's. Enabling OA toggles
 		 * the OAC_CONTEXT_ENABLE bit in CTXT_SR_CTL register, which changes the size
-		 * and layout of the underlying HW context image and can cause hangs.
+		 * and layout of the underlying HW context image and can cause hangs. This
+		 * restriction holds only for the first OA stream opened on the exec queue.
 		 */
-		if (XE_IOCTL_DBG(oa->xe, exec_queue_enabled(param.exec_q))) {
+		if (XE_IOCTL_DBG(oa->xe, !param.exec_q->oa && exec_queue_enabled(param.exec_q))) {
 			ret = -EADDRINUSE;
 			goto err_exec_q;
 		}
-- 
2.41.0

