Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2787C3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 20:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C8310E691;
	Fri,  5 Jan 2024 20:25:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0AC10E691
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 20:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704486299; x=1736022299;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yrCXkqGHWeo7RWMEssAznftT/shK5CuNJFI1/36Nkh8=;
 b=mmb5lUIQ1appLjwIZSJ2vgC6HtzfFL12l1kJ7SUGfm9wfuJPvSgzmPZF
 b01MHeXN4iXWz3nKHpQbidFGkQftMNYN+b2Xr1hJO4rtmpyc1Lfbb+qky
 bYi3glVF5UbvuPH4fVV3GJmB4xrlUuTrzGshI1OBSOhmPUuLGn5YmZkeY
 RGHcFtIMiUq3zo8QcS8uFP/iZOXc8XAXMqnVfKubKUTmuqtKpnv3Krflr
 QdWbJHY7ccGcFVbcidpB8r7n0rwK3SfZooTOGtSXMysMUfgD0u3gQIaM6
 lf6Nw78GvmsAFeVTc5vyr46GZZLpmOEqJz5mItReTsJwDv2KqbgLjcQQi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="4346824"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; 
   d="scan'208";a="4346824"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 12:24:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="15328076"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 12:24:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/xe/guc: Only take actions in CT irq handler if CTs are
 enabled
Date: Fri,  5 Jan 2024 12:25:28 -0800
Message-Id: <20240105202528.1329120-1-matthew.brost@intel.com>
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

v2: Return on not enabled in CT irq handler (Michal)

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
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

