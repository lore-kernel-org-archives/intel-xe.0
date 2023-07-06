Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18C8EB64DD
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 16:20:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D1010E47C;
	Thu,  6 Jul 2023 16:20:55 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED20610E476
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 16:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688660452; x=1720196452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UE8I3EeGWYFH/XqAOazvQ8/8gbf2eWL/jcTuNLvR4Yw=;
 b=W8VYfATHGdnYxJF9UI+7AF2vLDN5U85Ckob7H1wtaKlZQbN8E7w5PrjW
 eBcQfZFY7T4QFok3BEmFizk0vq8j2HrXMw+8WF8glvSky3G6FnP7dS4Y6
 vw4f16L4qni+vw94pG6TbidR4PrCT5oMTLp4hjMzDyzUEX932UQxqUaaO
 ndiUeocUSbFp8xKF6AakLK3l0eVR36v3BlkfJajZ950LQBL1cgVMaNLPn
 3sEs6aht7jflRLs+96vrP4DaIT99AocXnUcT2zTL5LKWTghzNTyUrjRxa
 V3LWyd8qFYPrgi3zoXnQFclgjrxTzt1Hng9BYHp3yaX/yO1qTkaSPpFvg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="394409313"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="394409313"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 09:20:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="722849927"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="722849927"
Received: from fmahon-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.229])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 09:20:51 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Jul 2023 17:20:08 +0100
Message-ID: <20230706162003.427026-16-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706162003.427026-12-matthew.auld@intel.com>
References: <20230706162003.427026-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 04/10] drm/xe/ct: hold fast_lock when
 reserving space for g2h
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

Reserving and checking for space on the g2h side relies on the
fast_lock, and not the CT lock since we need to release space from the
fast CT path. Make sure we hold it when checking for space and reserving
it. The main concern is calling __g2h_release_space() as we are reserving
something and since the info.space and info.g2h_outstanding operations
are not atomic we can get some nonsense values back.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index dcce6ed34370..ba89db1dcfdb 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -346,7 +346,10 @@ static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
 
 static bool g2h_has_room(struct xe_guc_ct *ct, u32 g2h_len)
 {
-	lockdep_assert_held(&ct->lock);
+	if (!g2h_len)
+		return true;
+
+	lockdep_assert_held(&ct->fast_lock);
 
 	return ct->ctbs.g2h.info.space > g2h_len;
 }
@@ -367,15 +370,15 @@ static void h2g_reserve_space(struct xe_guc_ct *ct, u32 cmd_len)
 	ct->ctbs.h2g.info.space -= cmd_len;
 }
 
-static void g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
+static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
 {
 	XE_BUG_ON(g2h_len > ct->ctbs.g2h.info.space);
 
 	if (g2h_len) {
-		spin_lock_irq(&ct->fast_lock);
+		lockdep_assert_held(&ct->fast_lock);
+
 		ct->ctbs.g2h.info.space -= g2h_len;
 		ct->g2h_outstanding += num_g2h;
-		spin_unlock_irq(&ct->fast_lock);
 	}
 }
 
@@ -505,21 +508,26 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 		}
 	}
 
+	if (g2h_len)
+		spin_lock_irq(&ct->fast_lock);
 retry:
 	ret = has_room(ct, len + GUC_CTB_HDR_LEN, g2h_len);
 	if (unlikely(ret))
-		goto out;
+		goto out_unlock;
 
 	ret = h2g_write(ct, action, len, g2h_fence ? g2h_fence->seqno : 0,
 			!!g2h_fence);
 	if (unlikely(ret)) {
 		if (ret == -EAGAIN)
 			goto retry;
-		goto out;
+		goto out_unlock;
 	}
 
-	g2h_reserve_space(ct, g2h_len, num_g2h);
+	__g2h_reserve_space(ct, g2h_len, num_g2h);
 	xe_guc_notify(ct_to_guc(ct));
+out_unlock:
+	if (g2h_len)
+		spin_unlock_irq(&ct->fast_lock);
 out:
 	return ret;
 }
-- 
2.41.0

