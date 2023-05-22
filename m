Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01910C7EE26
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 16:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C085810E368;
	Mon, 22 May 2023 16:18:44 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0C410E366
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 16:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684772320; x=1716308320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZkTzrnk8/ZI+WGbEFqd2ubEnD6ZaJjBCVpM+bUDgYBI=;
 b=Omzyi5fRihaIAqloVhkmKTV/dYk1svk+RpwV+CagzEIYSqQL/97Lp5AN
 jK2wMQFPx+YTuM6MYFriI+R/S8kMjLH1j48wwlIU3XXSjq8vygFV0O8v2
 KCmkErFuAT7qtxAOJEmeTZtq+gkPFgxeHO1/dy12I9bnoGpxIKkyCqZa3
 XkUzEo8JN9YQORxWWArkjEIC+r1F060jX6I66C/Wro//N9qLBlu4lkNUZ
 JJjDc16bO8LD5AVS5PgF1SXi1xHZIQI+y9EnWSXB1ywHXpVR5gLkfe79h
 l9rMX3uOIDrMeJdJhM18snA+pMILOf6+4tUfN5FQPUIMow2ri5w7X7FQh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="381199193"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="381199193"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 09:15:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="703586496"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="703586496"
Received: from amigon-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.249.128.230])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 09:15:49 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 22 May 2023 17:14:00 +0100
Message-Id: <20230522161403.79731-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522161403.79731-1-matthew.auld@intel.com>
References: <20230522161403.79731-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v7 4/7] drm/xe/ct: tweak lock ordering for
 freq_lock
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Lockdep spits out:

Possible unsafe locking scenario:
   CPU0				CPU1
   ----				----
   lock(&xe->mem_access.lock);
				lock(&pc->freq_lock);
				lock(&xe->mem_access.lock);
   lock(&pc->freq_lock);

It looks like we already mostly take care to ensure that the mem_access
ref is taken outside of taking freq_lock, since that is also grabbed
from the runtime_pm callbacks, except for one spot in guc_ct_send_recv()
which was grabbing the mem_access ref, even though the caller is already
holding freq_lock. It looks like all the callers are already holding the
mem_access.ref, so just switch over to use guc_ct_send_locked().

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 9dc906f2651a..7a8c9d6a03f3 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -689,7 +689,9 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 retry:
 	g2h_fence_init(&g2h_fence, response_buffer);
 retry_same_fence:
-	ret = guc_ct_send(ct, action, len, 0, 0, &g2h_fence);
+	mutex_lock(&ct->lock);
+	ret = guc_ct_send_locked(ct, action, len, 0, 0, &g2h_fence);
+	mutex_unlock(&ct->lock);
 	if (unlikely(ret == -ENOMEM)) {
 		void *ptr;
 
-- 
2.40.1

