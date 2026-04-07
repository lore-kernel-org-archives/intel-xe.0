Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6B5FB5189
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 03:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A7510E33B;
	Tue,  7 Apr 2026 03:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i9voeX2g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5F110E337
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 03:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775530948; x=1807066948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ci3SjApyf/Uv2q8Xw1SDf7epsBC0iglTLLm1zukgvNo=;
 b=i9voeX2gkfapNNvoSURiJqFRtZ3cOiz3nABhJDn1DTHiHW6mRYx3UWr7
 6QJ7ioQq8aFspO46IOExDloPP66fZyzlI+JUkKPjKfkbXnisF2CHZgBqP
 uNXb4ddDFOPkxva7Xi337lim5/+i/AIBG+J5ofB8Xk25OJ7yFCQt0pNOu
 kc8nvOLHHdZuk4LyQF59Da8epnwOCUFQ2hR0saivKdfvV9kKV4W0iRqrv
 AGj11dqTK0J59lCAPfFkFGr2baYcE6Ntv+HmsuFkbfZEOcnzFZTHBHdg4
 Nci2uuhIjmbN3dwU2md5pS2HJ4Id46hwf26MiVbOMFwnQtPnLpTYmXREQ g==;
X-CSE-ConnectionGUID: wxkWTL4TS/WaCAQ5mfWE8Q==
X-CSE-MsgGUID: oII3tClNT/2Np4vdpLvrvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80377329"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="80377329"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 20:02:27 -0700
X-CSE-ConnectionGUID: wbynd+lZTESZ0+CRoSE2kA==
X-CSE-MsgGUID: tqxYLDo/QD6fgUW4DoPByQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="232084950"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 20:02:25 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 1/3] drm/xe/oa: Use xe_map layer
Date: Mon,  6 Apr 2026 20:02:17 -0700
Message-ID: <20260407030219.444060-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260407030219.444060-1-ashutosh.dixit@intel.com>
References: <20260407030219.444060-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

OA code should have used xe_map layer to begin with. In CRI, the OA buffer
can be located both in system and device memory. For these reasons, move OA
code to use the xe_map layer when accessing the OA buffer.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 88 ++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_oa_types.h |  3 --
 2 files changed, 49 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 6337e671c97ae..dfd3b6a789cc3 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -213,32 +213,40 @@ static u32 xe_oa_hw_tail_read(struct xe_oa_stream *stream)
 #define oa_report_header_64bit(__s) \
 	((__s)->oa_buffer.format->header == HDR_64_BIT)
 
-static u64 oa_report_id(struct xe_oa_stream *stream, void *report)
+static u64 oa_report_id(struct xe_oa_stream *stream, u32 tail)
 {
-	return oa_report_header_64bit(stream) ? *(u64 *)report : *(u32 *)report;
+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
+
+	return oa_report_header_64bit(stream) ?
+		xe_map_rd(stream->oa->xe, map, tail, u64) :
+		xe_map_rd(stream->oa->xe, map, tail, u32);
 }
 
-static void oa_report_id_clear(struct xe_oa_stream *stream, u32 *report)
+static void oa_report_id_clear(struct xe_oa_stream *stream, u32 head)
 {
-	if (oa_report_header_64bit(stream))
-		*(u64 *)report = 0;
-	else
-		*report = 0;
+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
+
+	oa_report_header_64bit(stream) ?
+		xe_map_wr(stream->oa->xe, map, head, u64, 0) :
+		xe_map_wr(stream->oa->xe, map, head, u32, 0);
 }
 
-static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
+static u64 oa_timestamp(struct xe_oa_stream *stream, u32 tail)
 {
+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
+
 	return oa_report_header_64bit(stream) ?
-		*((u64 *)report + 1) :
-		*((u32 *)report + 1);
+		xe_map_rd(stream->oa->xe, map, tail + 2, u64) :
+		xe_map_rd(stream->oa->xe, map, tail + 1, u32);
 }
 
-static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 *report)
+static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 head)
 {
-	if (oa_report_header_64bit(stream))
-		*(u64 *)&report[2] = 0;
-	else
-		report[1] = 0;
+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
+
+	oa_report_header_64bit(stream) ?
+		xe_map_wr(stream->oa->xe, map, head + 2, u64, 0) :
+		xe_map_wr(stream->oa->xe, map, head + 1, u32, 0);
 }
 
 static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
@@ -275,9 +283,7 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 	 * they were written.  If not : (╯°□°）╯︵ ┻━┻
 	 */
 	while (xe_oa_circ_diff(stream, tail, stream->oa_buffer.tail) >= report_size) {
-		void *report = stream->oa_buffer.vaddr + tail;
-
-		if (oa_report_id(stream, report) || oa_timestamp(stream, report))
+		if (oa_report_id(stream, tail) || oa_timestamp(stream, tail))
 			break;
 
 		tail = xe_oa_circ_diff(stream, tail, report_size);
@@ -311,30 +317,37 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
 	return HRTIMER_RESTART;
 }
 
+static inline unsigned long
+xe_oa_copy_to_user(void __user *dst, const struct iosys_map *src, size_t src_offset, size_t len)
+{
+	if (src->is_iomem)
+		return copy_to_user(dst, src->vaddr_iomem + src_offset, len);
+	else
+		return copy_to_user(dst, src->vaddr + src_offset, len);
+}
+
 static int xe_oa_append_report(struct xe_oa_stream *stream, char __user *buf,
-			       size_t count, size_t *offset, const u8 *report)
+			       size_t count, size_t *offset, u32 head)
 {
+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
 	int report_size = stream->oa_buffer.format->size;
 	int report_size_partial;
-	u8 *oa_buf_end;
 
 	if ((count - *offset) < report_size)
 		return -ENOSPC;
 
 	buf += *offset;
 
-	oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
-	report_size_partial = oa_buf_end - report;
+	report_size_partial = stream->oa_buffer.circ_size - head;
 
 	if (report_size_partial < report_size) {
-		if (copy_to_user(buf, report, report_size_partial))
+		if (xe_oa_copy_to_user(buf, map, head, report_size_partial))
 			return -EFAULT;
 		buf += report_size_partial;
 
-		if (copy_to_user(buf, stream->oa_buffer.vaddr,
-				 report_size - report_size_partial))
+		if (xe_oa_copy_to_user(buf, map, 0, report_size - report_size_partial))
 			return -EFAULT;
-	} else if (copy_to_user(buf, report, report_size)) {
+	} else if (xe_oa_copy_to_user(buf, map, head, report_size)) {
 		return -EFAULT;
 	}
 
@@ -347,7 +360,6 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 				size_t count, size_t *offset)
 {
 	int report_size = stream->oa_buffer.format->size;
-	u8 *oa_buf_base = stream->oa_buffer.vaddr;
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
 	size_t start_offset = *offset;
 	unsigned long flags;
@@ -364,26 +376,24 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 
 	for (; xe_oa_circ_diff(stream, tail, head);
 	     head = xe_oa_circ_incr(stream, head, report_size)) {
-		u8 *report = oa_buf_base + head;
-
-		ret = xe_oa_append_report(stream, buf, count, offset, report);
+		ret = xe_oa_append_report(stream, buf, count, offset, head);
 		if (ret)
 			break;
 
 		if (!(stream->oa_buffer.circ_size % report_size)) {
 			/* Clear out report id and timestamp to detect unlanded reports */
-			oa_report_id_clear(stream, (void *)report);
-			oa_timestamp_clear(stream, (void *)report);
+			oa_report_id_clear(stream, head);
+			oa_timestamp_clear(stream, head);
 		} else {
-			u8 *oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
-			u32 part = oa_buf_end - report;
+			struct iosys_map *map = &stream->oa_buffer.bo->vmap;
+			u32 part = stream->oa_buffer.circ_size - head;
 
 			/* Zero out the entire report */
 			if (report_size <= part) {
-				memset(report, 0, report_size);
+				xe_map_memset(stream->oa->xe, map, head, 0, report_size);
 			} else {
-				memset(report, 0, part);
-				memset(oa_buf_base, 0, report_size - part);
+				xe_map_memset(stream->oa->xe, map, head, 0, part);
+				xe_map_memset(stream->oa->xe, map, 0, 0, report_size - part);
 			}
 		}
 	}
@@ -436,7 +446,8 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
 	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
 
 	/* Zero out the OA buffer since we rely on zero report id and timestamp fields */
-	memset(stream->oa_buffer.vaddr, 0, xe_bo_size(stream->oa_buffer.bo));
+	xe_map_memset(stream->oa->xe, &stream->oa_buffer.bo->vmap, 0, 0,
+		      xe_bo_size(stream->oa_buffer.bo));
 }
 
 static u32 __format_to_oactrl(const struct xe_oa_format *format, int counter_sel_mask)
@@ -891,7 +902,6 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
 	stream->oa_buffer.bo = bo;
 	/* mmap implementation requires OA buffer to be in system memory */
 	xe_assert(stream->oa->xe, bo->vmap.is_iomem == 0);
-	stream->oa_buffer.vaddr = bo->vmap.vaddr;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index b03ffd5134834..2dd550c93b8ac 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -162,9 +162,6 @@ struct xe_oa_buffer {
 	/** @format: xe_bo backing the OA buffer */
 	struct xe_bo *bo;
 
-	/** @vaddr: mapped vaddr of the OA buffer */
-	u8 *vaddr;
-
 	/** @ptr_lock: Lock protecting reads/writes to head/tail pointers */
 	spinlock_t ptr_lock;
 
-- 
2.48.1

