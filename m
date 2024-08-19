Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E8BC52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 07:17:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDA610E07E;
	Mon, 19 Aug 2024 07:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NfcISSvL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C61F10E07E
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 07:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724051823; x=1755587823;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wC326Tcs6MrFw1nH7r35VE9OLlS9usQA8jiomTpCj1M=;
 b=NfcISSvL5NFPhnG3d7rdOsaUW7pozYjPoSfEeMGpbxSbFORlvpyLXTlO
 dw0U+RE5P7KDgX29BaoanUYKtvFDzKjHHbzNckPLkpyN+2IPFNWUZwvyW
 EWvD9VANXE0XI0VcohwxhkgD9kDnan9ftHDCceiIXnINrD0kA3wOD+vu8
 l/zFUxlmiGhfu3UJ8h4uUu0BvWi968d32yBrGGc7tWOZTxFIoTHfDhAf0
 6GU3Zb3ftYITxL9dBuQt9uH7uJjM8Ht/Mkf20JhIl6UFOeQwp/8pPxKyi
 ZdKky/Wk4Ii+wFYnGK/0QC79Qk3qKw8BS1yKjZGpbhNiNDT3F3/JJNVoH Q==;
X-CSE-ConnectionGUID: /ZaPvOf0SeqXndD8LmuG1A==
X-CSE-MsgGUID: djeOFCKhQT2YMypCjci4Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="22442602"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="22442602"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 00:17:02 -0700
X-CSE-ConnectionGUID: ClbEDrBTRdGkDVU7KOYKzA==
X-CSE-MsgGUID: KrWylCitTPuC2yFhqmvGBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="60439958"
Received: from singhapo-nuc7i7bnh.iind.intel.com ([10.145.169.50])
 by fmviesa010.fm.intel.com with ESMTP; 19 Aug 2024 00:17:01 -0700
From: apoorva.singh@intel.com
To: intel-xe@lists.freedesktop.org
Cc: Apoorva Singh <apoorva.singh@intel.com>
Subject: [PATCH] drm/xe: Add NULL check before deferencing pointer
Date: Mon, 19 Aug 2024 12:45:57 +0530
Message-Id: <20240819071557.964326-1-apoorva.singh@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Apoorva Singh <apoorva.singh@intel.com>

Add NULL check before deferencing of lrc->bo in
xe_lrc_snapshot_capture().

Free the dynamically allocated memory for snapshot
to avoid memory leak

Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 974a9cd8c379..e31d9bc64ff6 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1652,20 +1652,24 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	if (lrc->bo && lrc->bo->vm)
 		xe_vm_get(lrc->bo->vm);
 
-	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
-	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
-	snapshot->head = xe_lrc_ring_head(lrc);
-	snapshot->tail.internal = lrc->ring.tail;
-	snapshot->tail.memory = xe_lrc_ring_tail(lrc);
-	snapshot->start_seqno = xe_lrc_start_seqno(lrc);
-	snapshot->seqno = xe_lrc_seqno(lrc);
-	snapshot->lrc_bo = xe_bo_get(lrc->bo);
-	snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
-	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset;
-	snapshot->lrc_snapshot = NULL;
-	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
-	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
-	return snapshot;
+	if (lrc->bo) {
+		snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
+		snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
+		snapshot->head = xe_lrc_ring_head(lrc);
+		snapshot->tail.internal = lrc->ring.tail;
+		snapshot->tail.memory = xe_lrc_ring_tail(lrc);
+		snapshot->start_seqno = xe_lrc_start_seqno(lrc);
+		snapshot->seqno = xe_lrc_seqno(lrc);
+		snapshot->lrc_bo = xe_bo_get(lrc->bo);
+		snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
+		snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset;
+		snapshot->lrc_snapshot = NULL;
+		snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
+		snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
+		return snapshot;
+	}
+	kfree(snapshot);
+	return NULL;
 }
 
 void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
-- 
2.34.1

