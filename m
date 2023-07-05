Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B28AEB64DA
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 16:08:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C2F10E3AD;
	Wed,  5 Jul 2023 16:08:27 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E252C10E3A0
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jul 2023 16:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688573302; x=1720109302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qNT/ABDzYBcTur24S9ENWgQkFELPZNEziKMFYsc2isA=;
 b=m/ZthHOxbUpk5XYd+noAAQ/yFLbDnbrvFQsrW4PLiwBOHdyQvOcdWm9P
 nq9l6kuBUZgfgOTG0MZUYJUvS4uYp3qGExClNQ9EBI0MAxdYyQmPhz+w8
 F3sCi/L033i/IIODU2y/rYXMOgDu8riesXprPX4u0KuTeboryi2JCPaLC
 iRt2yg+cYVDmPObKMkwMQWEPRt1ZDIsnLsJ7bNVQD53T0xuzy3XHGmLmr
 MpJWc0YD8CDSCktO479a0+QtM+YcPbiZ8iqLA98+HPvHE23Nts+sl1UAw
 paqlCZUykZVEIsY/bkpiVpnHPdalcXoxoBFPFq74ZSf/3ZpON0K8NlLby g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="362248955"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="362248955"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 09:06:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="965879890"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="965879890"
Received: from peterhox-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.10.156])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 09:06:45 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Jul 2023 17:06:07 +0100
Message-ID: <20230705160602.237213-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705160602.237213-9-matthew.auld@intel.com>
References: <20230705160602.237213-9-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 4/7] drm/xe/ct: serialise fast_lock during CT
 disable
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
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index f8c1a2ca89f7..811518230262 100644
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

