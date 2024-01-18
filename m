Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB14AC47DD7
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 19:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A4110E8F4;
	Thu, 18 Jan 2024 19:24:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F08110E8D5
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 19:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705605847; x=1737141847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MHujpt+hX8yOR5+4L+GUnN6T/NBP4Y/2kPPHVtBYI2U=;
 b=USzBhbwuY2NPTKkL/tAK7bD3nvLOw6dMmttNPTtx32u2NicE8StRFYoA
 P7f5MNr6czumOYIFN4entdKeh49izIypmBBl1IvNzG1/goyY/k6MAMVLG
 4efXU2jridSR2BbgwVEYEhv1seIKGrrp0dSj2f4lH952BnkWNz+p4dJ1L
 tglucQ4ARaXYRdyBcuvNmkzqUPUc/m0zSH58Em/CQsOdJyVl42rQyX2lO
 B/kbL8KuAsuO7djLaG1z3mFZu11KWIpv4yGSjmNM6nFRhmQ7ds2X4niRo
 Jx6lKOa3ku8RDddOsi6BhkABJMZ8kGyXw4iRJTFBQM27YDEckI9y5CGK7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7642098"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7642098"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 11:24:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="490991"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 11:24:06 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>,
	rodrigo.vivi@intel.com
Subject: [PATCH v3 3/3] drm/xe/guc: Flush G2H handler when turning off CTs
Date: Thu, 18 Jan 2024 11:24:42 -0800
Message-Id: <20240118192442.1480073-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240118192442.1480073-1-matthew.brost@intel.com>
References: <20240118192442.1480073-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_ct.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 41e9320914e9..a55707d3c451 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -343,26 +343,34 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	return err;
 }
 
+static void stop_g2h_handler(struct xe_guc_ct *ct)
+{
+	cancel_work_sync(&ct->g2h_worker);
+}
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
 	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED, false);
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
 	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_STOPPED, true);
+	stop_g2h_handler(ct);
 }
 
 static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
-- 
2.34.1

