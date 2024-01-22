Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080A6C46CD2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 21:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFA910EE6C;
	Mon, 22 Jan 2024 21:01:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD3510EF87
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 21:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705957286; x=1737493286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OJw2k1p4EctubOyCLsu1TMWqttPynhHLIJjLW7s3GoY=;
 b=baz+Rk9QzkTd1gLNZzl+M4Yoq7hS6jnfr+dh6BJGm6jWEFKu79iI+jV6
 /jON/7ldERLAY1kaQAw1MplS73tF6uAVTWdnFwG0sev67eWwTnUx3CotY
 lN5DY+R6VJYZH7VDFV5IWzwwMmoFCWGSpBPRaT9iuJx1qCh/gsq3q3J1S
 1Ka9ROumgWRpGHBIbMagpn3BU/v9Lg+pFtg7xtul2OxQQ0CbtzwHWyDhj
 3ssUrF4Cxh4iNi0mddeL9ocVwM27nXji1qpxDbak9YGnBxPulf1Q4UST+
 iLQ+v1XrAgulCmoeOcDgyxZedVfJc/Z8SrG509qpLt+xWun7gB8zSSG+C A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8000773"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="8000773"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:01:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1338115"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:01:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v5 3/3] drm/xe/guc: Flush G2H handler when turning off CTs
Date: Mon, 22 Jan 2024 13:01:56 -0800
Message-Id: <20240122210156.1517444-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122210156.1517444-1-matthew.brost@intel.com>
References: <20240122210156.1517444-1-matthew.brost@intel.com>
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
index 1c915a26bb97..bc6e656c3bf4 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -346,26 +346,35 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
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

