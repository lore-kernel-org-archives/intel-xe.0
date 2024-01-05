Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EECC4707B
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 19:04:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A23A10E6A0;
	Fri,  5 Jan 2024 19:04:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7252810E6A3
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 19:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704481481; x=1736017481;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xnjyVBCfukTRcuHg0Kgp4OucrnVyBbNURD1s2eGOTSQ=;
 b=Xu8kRP3c1GADSI+A1A28QIST0Roi8aFL2/hbvi1tt5kauWqL7aSX3k8g
 gk/Qc/JQkV1wwqe68UUqQasZkSTny7zVqXmXFep3c49d8bNAkAnscaqQP
 stctvMjoeE+XYRb/+p1zeEmnmLRaz7AOuF2X4EY7x8mhk7V95I328UZHg
 BRXW4EtbW1BHl/DQdOYBxszt7wt1o/lbNPaHnxeSbRu17dudF0k2gQuua
 S62QGnyTCNgEQU3zeDu/DkZc/eERqmCtbHZ0Ird3MT1czc1nRtGY/og5e
 /zTezuU1foNVXAen+IIcNGZMLSqr0xFBlMtMQvwkWclpaqxQwk2pBCU7B Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="388013235"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="388013235"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 11:04:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="815025353"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="815025353"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 11:04:40 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe: Fix guc_exec_queue_set_priority
Date: Fri,  5 Jan 2024 11:04:39 -0800
Message-ID: <20240105190440.9908-2-brian.welty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105190440.9908-1-brian.welty@intel.com>
References: <20240105190440.9908-1-brian.welty@intel.com>
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

We need to set q->priority prior to calling guc_exec_queue_add_msg() as
that will call init_policies() and sets the scheduling properties to those
stored in the exec_queue.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 21ac68e3246f..5de3ac47c462 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1308,8 +1308,8 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
 	if (!msg)
 		return -ENOMEM;
 
-	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
 	q->priority = priority;
+	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
 
 	return 0;
 }
-- 
2.43.0

