Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8021FC87FDD
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 07:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1F810E3DC;
	Mon,  1 May 2023 07:51:17 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050AF10E30E
 for <intel-xe@lists.freedesktop.org>; Mon,  1 May 2023 07:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682927473; x=1714463473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8nwJVb4NqpjM4r34lGY1h73mK6adHvGEAjI5UeLVHWo=;
 b=b+oS3iLj7nl695z9k49elmSWO6VZRm22uhNp478QTeNOoiG9g/wdv/Wh
 UlFrWVwANfjJZaQdUKOeRlG1IkSa6AH4l3/t3z0cr6Ws3qUgihf3Dikm+
 mN8oOl9LFDQ43rZgtlgk45s3XaU0SrqSFryPjyAPB2cuFBWLhbgKkeBFv
 132a0tWma1OpHp3RTmn72TNoHYX+EtcJu/tgF5f4DUue8IkIozPuLErTc
 Rfk8/KdfvHG8jLAmEjTzkOzVJ2dtb7bBmCwyx0GTLCEVixOA1Icx5BMs0
 OzsPtp3oddYgu9+R+QHyVy7P99FNnghuLLuh+AL5rTQj2tB9cTljfqHuz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="346910718"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="346910718"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="870095218"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="870095218"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 00:50:56 -0700
Message-Id: <20230501075114.3108352-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501075114.3108352-1-matthew.brost@intel.com>
References: <20230501075114.3108352-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 12/30] drm/xe/guc: Print doorbell ID in GuC
 engine debugfs entry
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
index 1b6f36b04cd1..880f480c6d5f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2016,6 +2016,8 @@ static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
 	drm_printf(p, "\tTimeslice: %u (us)\n", e->sched_props.timeslice_us);
 	drm_printf(p, "\tPreempt timeout: %u (us)\n",
 		   e->sched_props.preempt_timeout_us);
+	drm_printf(p, "\tDoorbell ID: %u\n",
+		   e->guc->doorbell_id);
 	for (i = 0; i < e->width; ++i ) {
 		struct xe_lrc *lrc = e->lrc + i;
 
-- 
2.34.1

