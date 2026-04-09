Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C759F364BD
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 20:37:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E7B10E83A;
	Thu,  9 Apr 2026 20:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YLcrwTzG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C9D10E052
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 20:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775767042; x=1807303042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cUA1/demErm0qskbVRI7wivB43vADfxwuZsXovC+aoI=;
 b=YLcrwTzGPHT149hify+jSwplHNastM3KQDHXlIWx2Kj4m43NPpVKw+KP
 YUPo3kfFu4QndLjifS/UEDDrq5RrcCuvmxqFutl7MbBZTx++nAdQHMZyV
 ml8s2OBO5+kSDfa54Ss7bUryyIibAxE/48yjdg8v8lbfg5JX61murcb69
 Zy/mq/tM/Sd7/v/8IBDCynYTzKwKHxelCWpQHHs8hbiJDtEQpYg6u3ShF
 GkqcE5OhL8du/c8UbshEW/0FxjqpTqwbZz9Nh12MzWdtnOKtWSAE028OH
 ltdDNRUZGNb4TduZoMKmWfl046QKJOvjl0QZKzaEpE22EJzbdFfJSfsH/ Q==;
X-CSE-ConnectionGUID: jyXMmqUgQVaaf1eILv7DIQ==
X-CSE-MsgGUID: 0YmP1MqNTo6vRoP3c6qb/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76692624"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="76692624"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:37:21 -0700
X-CSE-ConnectionGUID: cPIN5VoXSe2HtMweaCC/HQ==
X-CSE-MsgGUID: l9U2JqhVRMGpgjGm5x59uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="227881125"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:37:20 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH 4/5] drm/xe/multi_queue: Use QUEUE_TIMESTAMP as job timestamp
 for multi-queue
Date: Thu,  9 Apr 2026 13:37:19 -0700
Message-ID: <20260409203714.1887402-11-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
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

Each queue in a multi queue group has a dedicated timestamp counter. Use
this QUEUE TIMESTAMP register to capture the start timestamp for the
job.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index cfeb4fc7d217..0eea37c0b4b2 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -269,8 +269,12 @@ static u32 get_ppgtt_flag(struct xe_sched_job *job)
 static int emit_copy_timestamp(struct xe_device *xe, struct xe_lrc *lrc,
 			       u32 *dw, int i)
 {
+	const struct xe_reg reg = lrc->multi_queue.valid ?
+				   RING_QUEUE_TIMESTAMP(0) :
+				   RING_CTX_TIMESTAMP(0);
+
 	dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
-	dw[i++] = RING_CTX_TIMESTAMP(0).addr;
+	dw[i++] = reg.addr;
 	dw[i++] = xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
 	dw[i++] = 0;
 
@@ -281,7 +285,7 @@ static int emit_copy_timestamp(struct xe_device *xe, struct xe_lrc *lrc,
 	if (IS_SRIOV_VF(xe)) {
 		dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT |
 			MI_SRM_ADD_CS_OFFSET;
-		dw[i++] = RING_CTX_TIMESTAMP(0).addr;
+		dw[i++] = reg.addr;
 		dw[i++] = xe_lrc_ctx_timestamp_ggtt_addr(lrc);
 		dw[i++] = 0;
 	}
-- 
2.43.0

