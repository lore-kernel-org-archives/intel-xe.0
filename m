Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB01C77B60
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 21:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F0910E9A5;
	Tue, 28 Mar 2023 21:09:19 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA2610E4AA
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 21:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680037757; x=1711573757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WICzxDvZr7794aXorSpI4JIVlRwfRYfIMa8ijiT7pu4=;
 b=EOCLUSSDMIW8i8I7vaQUtazWBtQg3rSj7SkW4iWkmbc1EZHGEKthShWM
 7xj3ahb744HdZne4hwh/ybHhOw6eT0+LHChHCvZ1skfM8tTlkj85gqsEY
 JnzCLmti2OU/HOD1BrZaGsYOPBAkT0O999Dnc0f9aRCRDfvj71/DPrSv/
 pSx7nxrYOdXMCUiEiL8px32grIi7YGJuK/0lnY6vzpJ6VO8y4dOeKCaLu
 QZm483B/TWaum+w8CLouzQl7yWSSXkO0V8RlRrOdKjfy7EpzN2jE1RNZB
 yUQTcsjF3a74qRwalKUyehnPsoVacyKJ8Iod4nAhht/rj/ZcV+0AQ9y83 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="320346725"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="320346725"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 14:09:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="716607506"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="716607506"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 14:09:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 28 Mar 2023 14:09:20 -0700
Message-Id: <20230328210920.2110910-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328210920.2110910-1-matthew.brost@intel.com>
References: <20230328210920.2110910-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] drm/xe/guc: Print doorbell ID in GuC engine
 debugfs entry
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

This information is helpful so print it.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0fe533b001f0..7cf869d01a7a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1942,6 +1942,8 @@ static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
 	drm_printf(p, "\tTimeslice: %u (us)\n", e->sched_props.timeslice_us);
 	drm_printf(p, "\tPreempt timeout: %u (us)\n",
 		   e->sched_props.preempt_timeout_us);
+	drm_printf(p, "\tDoorbell ID: %u\n",
+		   e->guc->doorbell_id);
 	for (i = 0; i < e->width; ++i ) {
 		struct xe_lrc *lrc = e->lrc + i;
 
-- 
2.34.1

