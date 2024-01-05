Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C08C3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 20:34:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7821B10E69E;
	Fri,  5 Jan 2024 20:34:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C05C10E69E
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 20:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704486838; x=1736022838;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jUsktS5n3YL7gWquKmLovfk5bMP2uWdJh/azbDJro9M=;
 b=Etjo/PtnGaBcDZlXiUbJ4jjF7OFl/LW5vkB7G3HoOsF6/icqg3pWUVVV
 bMHoVpF7GsXAxg/BqzqA7a7h0zh+L27j5m94EPmUYZN+2B441nbxiQbFE
 v8My6JhgqwpYIEnGNvwT1hVwW/2+vF1VxvDBH+PvpLKJYYWU9PIBcH4bb
 xk/t+pOwGjkdQ+8Mj936DGMyEVycwC8NOEezjUkbdibEOR4sbz/3AEc2k
 BLrw3chTLYkRK0n6RPiTYIgGmyXkVcjG2A+iwfcoYDNSnNGESnZu1gyFW
 IXBJJhE7RKHN+HL0vjBeGEoDPICG8X7uEkf1kkH2pXGI4Fs4YWNr/x/cw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="461880841"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="461880841"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 12:33:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="730558732"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="730558732"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 12:33:59 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/xe/guc: Only take actions in CT irq handler if CTs are
 enabled
Date: Fri,  5 Jan 2024 12:34:31 -0800
Message-Id: <20240105203431.1329368-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_ct.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index f15f8a4857e0..9ecb67db8ec4 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -24,9 +24,11 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
 
 static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
 {
+	if (!ct->enabled)
+		return;
+
 	wake_up_all(&ct->wq);
-	if (ct->enabled)
-		queue_work(system_unbound_wq, &ct->g2h_worker);
+	queue_work(system_unbound_wq, &ct->g2h_worker);
 	xe_guc_ct_fast_path(ct);
 }
 
-- 
2.34.1

