Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D62C7EE25
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 20:09:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7340B10E610;
	Thu,  8 Jun 2023 20:09:02 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB7C10E612
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 20:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686254941; x=1717790941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Mrv/n6LsEZANEClDVrlXpu1l5hg6caEXVA5Clv4OUU=;
 b=VxkYPf2g+EIV7Q4tBEzRkmqAemosqtHgc6k4pzobA4uAp2/33iWTO4uP
 hNVFBrYfb0RmM6TvhKPIEC/F9Vtm0KOvbsGbn+01WRI2+qQcXGsaS9N0X
 LW2YoQfZkvanrKQZGtDly3pppokr/ShHT5SwMDHcfeZfwjlFcFXNVuATV
 OGtf+hTOVpvXUsR3Vbh7H6B79GEhXXQ2Z/QmxsPq7X9jK5UASDeTE/SFa
 yJlrTEc91hFtwCM5e2haAXLobU9yp+WP8t21oOGSG5uxgSPybSCRQjIOJ
 VNB4eO0Bj2c/jvyF8BBVo/Y2xZS3bt0sOR15fF/ZdsFj6q7+2q7aLK1Ka A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="357427594"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="357427594"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 13:09:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="739888055"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="739888055"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 13:08:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu,  8 Jun 2023 13:08:57 -0700
Message-Id: <20230608200857.124884-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230608200857.124884-1-matthew.brost@intel.com>
References: <20230608200857.124884-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] drm/xe/guc: Print doorbell ID in GuC engine
 debugfs / error capture
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
 drivers/gpu/drm/xe/xe_guc_submit.c       | 2 ++
 drivers/gpu/drm/xe/xe_guc_submit_types.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 5d503ca50b27..a3961974f01c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1966,6 +1966,7 @@ xe_guc_engine_snapshot_capture(struct xe_engine *e)
 	snapshot->sched_props.timeslice_us = e->sched_props.timeslice_us;
 	snapshot->sched_props.preempt_timeout_us =
 		e->sched_props.preempt_timeout_us;
+	snapshot->doorbell_id = e->guc->doorbell_id;
 
 	snapshot->lrc = kmalloc_array(e->width, sizeof(struct lrc_snapshot),
 				      GFP_ATOMIC);
@@ -2048,6 +2049,7 @@ xe_guc_engine_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
 		   snapshot->sched_props.timeslice_us);
 	drm_printf(p, "\tPreempt timeout: %u (us)\n",
 		   snapshot->sched_props.preempt_timeout_us);
+	drm_printf(p, "\tDoorbell ID: %u\n", snapshot->doorbell_id);
 
 	for (i = 0; snapshot->lrc && i < snapshot->width; ++i) {
 		drm_printf(p, "\tHW Context Desc: 0x%08x\n",
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
index 6765b2c6eab1..b44210bfb794 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -92,6 +92,8 @@ struct xe_guc_submit_engine_snapshot {
 	u32 logical_mask;
 	/** @width: width (number BB submitted per exec) of this engine */
 	u16 width;
+	/** @doorbell_id: doorbell id */
+	u16 doorbell_id;
 	/** @refcount: ref count of this engine */
 	u32 refcount;
 	/**
-- 
2.34.1

