Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B69C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 06:51:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8689910EB6B;
	Fri,  7 Jun 2024 06:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XQQkDvWi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E4010E297
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 06:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717743110; x=1749279110;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Q+jdBH09aNEq0FH30PenJjtpKknUW4NJirLb3j6Xl/Q=;
 b=XQQkDvWi5Xjs6spQd5sc61DhSKP/H1FlDu2F8RAQx4Z5/IDafbBkgFef
 yOBpqZfHZ9fanoZrSUMQgLS3+Z0ugda2Xf2ROnbRXHa/RgFOIrIMYpJXv
 r62NXArFowEtciFrVvfIgG5feR2l9MyIjG008sbHNQATFDPJTGJNY/bPy
 2Q//KeoA0BUlJt1nSDfYojcwGrXGHTHtL7nLfgarn/uzy/2DPzNZyJVIl
 tdE5vh7ONLR/mj+iaSkaDO+HB7UKUrMcKlVWi2zsMhHimFhnNJyLbK+jU
 JHQ1U6Ad2SbLC/8AAL9Njxe/2KVlBokq+88rRrxySPhNVY4MiW7n5ZAZY A==;
X-CSE-ConnectionGUID: ljXrxnkJSc+ah8eSKwLNbA==
X-CSE-MsgGUID: D+9UXuZMR26N3cOgLNG4Xw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14254932"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="14254932"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 23:51:49 -0700
X-CSE-ConnectionGUID: u+ElvJihSeSfJOKsTkMuWg==
X-CSE-MsgGUID: /aS+NEBOQBOoh9CK2uep8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="75702763"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 23:51:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 4/5] drm/xe: Add ctx timestamp to LRC snapshot
Date: Thu,  6 Jun 2024 23:52:18 -0700
Message-Id: <20240607065219.2264624-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607065219.2264624-1-matthew.brost@intel.com>
References: <20240607065219.2264624-1-matthew.brost@intel.com>
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

The ctx timestamp is useful information, add to LRC snapshot.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 76d61b5d5cb6..47bc15391a2b 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -49,6 +49,8 @@ struct xe_lrc_snapshot {
 	} tail;
 	u32 start_seqno;
 	u32 seqno;
+	u32 ctx_timestamp;
+	u32 ctx_timestamp_job;
 };
 
 static struct xe_device *
@@ -1618,6 +1620,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
 	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset;
 	snapshot->lrc_snapshot = NULL;
+	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
+	snapshot->ctx_timestamp_job = xe_lrc_ctx_timestamp_job(lrc);
 	return snapshot;
 }
 
@@ -1666,6 +1670,9 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 		   snapshot->tail.internal, snapshot->tail.memory);
 	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
 	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
+	drm_printf(p, "\tTimestamp: 0x%08x\n", snapshot->ctx_timestamp);
+	drm_printf(p, "\tTimestamp job: 0x%08x\n",
+		   snapshot->ctx_timestamp_job);
 
 	if (!snapshot->lrc_snapshot)
 		return;
-- 
2.34.1

