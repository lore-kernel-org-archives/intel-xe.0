Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A4EC47072
	for <intel-xe@archiver.kernel.org>; Fri, 29 Dec 2023 04:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6492610E06E;
	Fri, 29 Dec 2023 04:36:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F6C10E084
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Dec 2023 04:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703824573; x=1735360573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nX1XmyuklP3XJmfKCDQzKCZ0feNM9ym6J5ZvkBJp8Q8=;
 b=FPokIxMU/qhd5m/1XMAZUyorCF9KLaywK+Zfurh+rqUFUftcYWsDK5LB
 eTp9OaV026PTj0JVAyzwDyp7fZ+rlRFAIn+BawJGmC6VeBcUy/7Vlin9N
 lAAjto9ja8NKVgzj/ZM/+c28jrWl3CvoGVC594Zimh0X6cNoj8MlubAr8
 +H+GMGH2eL5jDIJRkp34SeEh5S/xPHaCnWLlS4r23xbtlR9yJTAv8qJiQ
 bOIzQNhB4RaeYw+hkl/dYvChD/QOWjYeq+v2Awj02HTxbfaVK+GmeJ/tn
 N7Qfyj2qOviJdpfLcTC/isW27VhotffZUcG3kJCM6KmLnsbd79BV67E/f w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="3916608"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; 
   d="scan'208";a="3916608"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 20:34:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="902140272"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; d="scan'208";a="902140272"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 20:34:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/xe/guc: Protect queuing of G2H handler with fast lock
Date: Thu, 28 Dec 2023 20:35:06 -0800
Message-Id: <20231229043507.1002411-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229043507.1002411-1-matthew.brost@intel.com>
References: <20231229043507.1002411-1-matthew.brost@intel.com>
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

Once CTs are disabled it is expected that the G2H handler will not be
queued again. To prevent the IRQ handler from racing with a disable,
guard the queuing of the G2H handler in the IRQ handler by the fast
lock.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 214a6a357519..176301f58153 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -31,8 +31,13 @@ static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
 static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
 {
 	wake_up_all(&ct->wq);
+
+	/* Guard against CT being disabled */
+	spin_lock(&ct->fast_lock);
 	if (xe_guc_ct_enabled(ct))
 		queue_work(system_unbound_wq, &ct->g2h_worker);
+	spin_unlock(&ct->fast_lock);
+
 	xe_guc_ct_fast_path(ct);
 }
 
-- 
2.34.1

