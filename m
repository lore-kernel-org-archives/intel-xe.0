Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1311EEB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jul 2023 09:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60F410E255;
	Mon, 10 Jul 2023 09:42:11 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FAB10E251
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jul 2023 09:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688982129; x=1720518129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GffgnOHWB3sVB3w1dCzYGbh1wnZeFRSxAEawmsEwX0Q=;
 b=J2DgMAGdKmZbsnli12G3n0iuCLODHcCdH0cINAEXCfZ5BGLxUMu8D1QF
 b4x3fQebQVTqWnXWjSg0bJUIMYqfxG4+JHTHsZrCD+XLG6qt558Nd9E5A
 g0L+UDovQVWOJqZkwzyvNY7QH1C7KSQdREgGpoly5z5ZuUslpL8MUsFQc
 M8+sGJ3YOe0PDPY7+dQ1F9BRdTdNs00YRApp/DbPEvNIpW6BwZTz4+/U1
 e+I63Bz54kDB7k/LjyIKgj/EW6it8Obk+RSEOfRPHD8hUcAYazqOzd/6c
 R7T9YJq03RfNkk05sUTD/soYciTn8AOrbCKytKpQCNw+prH6OVww0lKIP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="395081115"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="395081115"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 02:42:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="755940709"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="755940709"
Received: from congsip-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.16])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 02:42:07 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 10 Jul 2023 10:40:44 +0100
Message-ID: <20230710094037.28179-19-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710094037.28179-13-matthew.auld@intel.com>
References: <20230710094037.28179-13-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 06/11] drm/xe/ct: serialise fast_lock during
 CT disable
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

The fast-path CT could be running as we enter a runtime-suspend or
potentially a GT reset, however here we only use the ct->fast_lock and
not the full ct->lock. Before disabling the CT, also serialise against
the fast_lock to ensure any in-progress work finishes before we start
nuking the CT related stuff. Once we disable ct->enabled and drop the
lock, any new work should fail gracefully, and anything that was in
progress should be finished.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index ba89db1dcfdb..acf488b00b66 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -301,8 +301,10 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 		goto err_out;
 
 	mutex_lock(&ct->lock);
+	spin_lock_irq(&ct->fast_lock);
 	ct->g2h_outstanding = 0;
 	ct->enabled = true;
+	spin_unlock_irq(&ct->fast_lock);
 	mutex_unlock(&ct->lock);
 
 	smp_mb();
@@ -319,8 +321,10 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 
 void xe_guc_ct_disable(struct xe_guc_ct *ct)
 {
-	mutex_lock(&ct->lock);
-	ct->enabled = false;
+	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
+	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
+	ct->enabled = false; /* Finally disable CT communication */
+	spin_unlock_irq(&ct->fast_lock);
 	mutex_unlock(&ct->lock);
 
 	xa_destroy(&ct->fence_lookup);
-- 
2.41.0

