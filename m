Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0EAC77B73
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 00:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7542E10E40D;
	Tue,  2 May 2023 00:17:32 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B49510E403
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 00:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682986649; x=1714522649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8nwJVb4NqpjM4r34lGY1h73mK6adHvGEAjI5UeLVHWo=;
 b=nogwHOqB1n+TMahv1BhP6iOO5+Wi94lfwSqhrYCoRMUVQ8wsvsoJ0OHa
 GBeZwd+mwmvqoH04tHLP2U/3DW8OibYAy+53gRaheKzJ+/OgoEc7js/oz
 QWAuXFoyz28nMaSyttkTH+t71CMbiCnWm3L02kJF/2rcEXzuP96XByIhu
 3Y9g4K/la7t1Dwzm257oxOv2En4IwiT9oT7Sz8NX+/l1VuGKG+9PvpEG4
 ZrVC7GayMXq3b3DaZ2mYIZO4V9E3TRsS4J5YyvOD0jBkCXnsV73aiCqRe
 OuBn2kNCmREazx7FYFvvDn3l+OVCGezvs81tZ2IPNUNksoSvCmWKrCpau A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="332619573"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="332619573"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="765541698"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="765541698"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 17:17:08 -0700
Message-Id: <20230502001727.3211096-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502001727.3211096-1-matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 12/31] drm/xe/guc: Print doorbell ID in GuC
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

