Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0966C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 21:42:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9D810E1DB;
	Tue,  2 Jan 2024 21:42:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1D510E1DB
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 21:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704231775; x=1735767775;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bqSEAEpu0Qn9+7OfO76RgJRki2fspKIs8eoC7OcvOR8=;
 b=RUhfAlvpGRRPCCt5U2AU6yP1PHAlZ/qEjvV7NRZdhV1QQc0uMwJYmSxF
 V5atOzGxpNGVfFGN0VIS7z07O0jKvNLMF31zlJxi8Ay4v02f8jK/uHAMd
 A6de+rKbWn8jok2AGXyMaOZwDrV/9qUXxTUjNQenftwQbPswq48aP556h
 zWFlvtYNu/gOTdpK1i5BUH3GSjgDqLS28EDG29KamJC1Fsylum2uG+HmM
 GuOSVCWjz8Qy2WbV8/fCU0Lou0Br/oEpeH8hgR6HcmH/wCha1430u8xgo
 WYlL+ybOP0l9bLb5Wbie1wuI6rrdMlpV+ZanUaHLfxH1VomrbWLeNvk0R A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="3761174"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; 
   d="scan'208";a="3761174"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 13:42:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="1026888104"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; d="scan'208";a="1026888104"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 13:42:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/xe/guc: Only take actions in CT irq handler if CTs are
 enabled
Date: Tue,  2 Jan 2024 13:43:20 -0800
Message-Id: <20240102214320.1255783-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Protect entire IRQ handler by CT being enabled rather than just G2H
handler.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index f15f8a4857e0..05302db02e08 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -24,10 +24,11 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
 
 static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
 {
-	wake_up_all(&ct->wq);
-	if (ct->enabled)
+	if (ct->enabled) {
+		wake_up_all(&ct->wq);
 		queue_work(system_unbound_wq, &ct->g2h_worker);
-	xe_guc_ct_fast_path(ct);
+		xe_guc_ct_fast_path(ct);
+	}
 }
 
 /* Basic CT send / receives */
-- 
2.34.1

