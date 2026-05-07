Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAE5CD3442
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 16:20:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A782310E579;
	Thu,  7 May 2026 16:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l54oYMiN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FE010F206
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 16:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778170824; x=1809706824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HKn7hDS2Gw73OlIQ/XNWXc2phiVI2Wulwl8+GqqFH54=;
 b=l54oYMiNNrD/ElqQyJc8Jxww8xKVOwKeMSMSCax97mWVeUKbF0OCQWZT
 5mv2xZBXAPMPVJSrSG5irKePWlc8xCcXd7UckBTdEB0IvSG0e1WZLhkZL
 TBO5RfX5zEYEmIQHmyq3VnN1hDRnJyMMSf9BE4Ewqgy7wYY1VqrxdnNWK
 iMQUXHdlE+4HBE5znAKO0aSBlMiofxM/ycicSv5UnhhLUBGqe/xoYtcaG
 S6eibZ65lX2hhhbfptR5bjzAtVa51aSxagEizZ7uj55fK9TM9fKx8d29s
 qxzXcOYztqew+Czn1jkqLhuw5j+m1W9rgt2fgjBEG/aSMiIamABfZ+cU+ A==;
X-CSE-ConnectionGUID: OGn7gQdlSSCkYJq6WykoMw==
X-CSE-MsgGUID: /+ZBnTQ7Rvq6wquWmD8X0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79063599"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79063599"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:20:24 -0700
X-CSE-ConnectionGUID: Dk4Re5v/QSqlcnF97ciDqQ==
X-CSE-MsgGUID: /wThNTtfR+e3vhNzYQIL5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="266876562"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:20:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v5 01/11] drm/xe/lrc: Use 64 bit ctx timestamp in the LRC
 snapshot
Date: Thu,  7 May 2026 09:20:18 -0700
Message-ID: <20260507162016.3888309-14-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260507162016.3888309-13-umesh.nerlige.ramappa@intel.com>
References: <20260507162016.3888309-13-umesh.nerlige.ramappa@intel.com>
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

Use the 64 bit value when available for the context timestamp in the LRC
snapshot.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
 drivers/gpu/drm/xe/xe_lrc.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index fdfe2ed5f683..570ff9f55849 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2462,7 +2462,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	snapshot->replay_offset = 0;
 	snapshot->replay_size = lrc->replay_size;
 	snapshot->lrc_snapshot = NULL;
-	snapshot->ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(lrc));
+	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
 	return snapshot;
 }
@@ -2515,7 +2515,7 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 	drm_printf(p, "\tRing start: (memory) 0x%08x\n", snapshot->start);
 	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
 	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
-	drm_printf(p, "\tTimestamp: 0x%08x\n", snapshot->ctx_timestamp);
+	drm_printf(p, "\tTimestamp: 0x%016llx\n", snapshot->ctx_timestamp);
 	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
 
 	if (!snapshot->lrc_snapshot)
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 5440663183f6..bef7af9a578b 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -37,7 +37,7 @@ struct xe_lrc_snapshot {
 	} tail;
 	u32 start_seqno;
 	u32 seqno;
-	u32 ctx_timestamp;
+	u64 ctx_timestamp;
 	u32 ctx_job_timestamp;
 };
 
-- 
2.51.0

