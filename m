Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B5EC47DD9
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 16:16:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF1A10F51B;
	Mon, 22 Jan 2024 16:16:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EFC10F524
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 16:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705940205; x=1737476205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IXl81ahTHEpLxlq9hNUKW6ZzUWUn8QYIi3A+p+3lKmw=;
 b=oJ0XmdCE10fd3RcjhM997LOYT7oJVK71nNpRipYCTNdw8T1NGTT289cL
 wZS8EAUFY8iipsO4AaUyfOyksv8mnhOBdfGCta6DJoTohrGQY8rF3e1I0
 9nIaZV8dMDFu/Np/B1yovxIoLl/t5ckAvlrH2fWcvReZGQLvmCrMAiP3S
 lPzcZMBBmWo5r5RXba4BpurKgNZPcIMAu+hBBkjkZI0jxUsj9EBrkDfvy
 8aJ/1GNZERKZagwomEup1R9DgFjC/sLYk/Nwy3PQBQ7eUSDTxI0FEP99/
 PEvZuS6vna9/IxSGbkAsB1CySy34P2CLVWHsg8ka7Im56HdPXdMJUMZRK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="400902482"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="400902482"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 08:16:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="929035063"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="929035063"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 08:16:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v4 3/3] drm/xe/guc: Flush G2H handler when turning off CTs
Date: Mon, 22 Jan 2024 08:17:16 -0800
Message-Id: <20240122161716.1503064-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122161716.1503064-1-matthew.brost@intel.com>
References: <20240122161716.1503064-1-matthew.brost@intel.com>
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

Make sure G2H handler is not running when changing the CT state to drop
messages or disabled. This will help prevent races in the code ensuring
that G2H are not being processed after changing the state.

v2:
- s/flush_g2h_handler/stop_g2h_handler (Michal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index a91a852dba81..4a0040ef5db7 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -340,26 +340,35 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	return err;
 }
 
+static void stop_g2h_handler(struct xe_guc_ct *ct)
+{
+	cancel_work_sync(&ct->g2h_worker);
+}
+
+
 /**
  * xe_guc_ct_disable - Set GuC to disabled state
  * @ct: the &xe_guc_ct
  *
- * Set GuC CT to disabled state, no outstanding g2h expected in this transition
+ * Set GuC CT to disabled state and stop g2h handler. No outstanding g2h expected
+ * in this transition.
  */
 void xe_guc_ct_disable(struct xe_guc_ct *ct)
 {
 	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
+	stop_g2h_handler(ct);
 }
 
 /**
  * xe_guc_ct_stop - Set GuC to stopped state
  * @ct: the &xe_guc_ct
  *
- * Set GuC CT to stopped state and clear any outstanding g2h
+ * Set GuC CT to stopped state, stop g2h handler, and clear any outstanding g2h
  */
 void xe_guc_ct_stop(struct xe_guc_ct *ct)
 {
 	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_STOPPED);
+	stop_g2h_handler(ct);
 }
 
 static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
-- 
2.34.1

