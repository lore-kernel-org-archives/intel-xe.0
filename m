Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510F1F36B97
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 23:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C86A10E884;
	Thu,  9 Apr 2026 23:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kl+6Bbdp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97E110E87D
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 23:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775776679; x=1807312679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eYcqldTG98TaRuEAL1dRNGI4lL4PwFy/08pBDo0uzsA=;
 b=Kl+6Bbdpe412e5sAgbzxAZ8X9X///Dt/9snNGkMs1TAWMxgQj0mpWKBI
 2VHumAxGMHS5RymCjcdmfsyO7CZ0HQdchzfiE/OSNf9OrC+k7P2ttEdAy
 TG0w1YX8/k4QbZPhFoDkTNwQpWvCSZjZH+xMZ4aH+nG6Ln/oPcftr8GFY
 tsyUJoW69oVTjvoQUdeHkHBmOEK6fhjwiDK2TmqSEIeB/SFszUO2/FNfY
 Euc4gO+e6mSX0F5k+eUqQ+f0kRJPjFkPqh3YDe3VLF35CvEmaNO/ED5bj
 mOxJOrVbbcunLx5tpg/xPQQNCftUg2c6HIJThH8jwzeOdjGCEcRh/us9e w==;
X-CSE-ConnectionGUID: liFx4/r0RtGoHIPQ4lgiUA==
X-CSE-MsgGUID: AfUPnXJDRNqZfi9A4fsrKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="80654739"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="80654739"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 16:17:59 -0700
X-CSE-ConnectionGUID: 2JJHvo48S0Csh9N7LDtI7Q==
X-CSE-MsgGUID: OnlZUMflS9qAenhGrkrhcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="252268984"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 16:17:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 1/3] drm/xe/oa: Use xe_map layer
Date: Thu,  9 Apr 2026 16:17:52 -0700
Message-ID: <20260409231754.528518-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260409231754.528518-1-ashutosh.dixit@intel.com>
References: <20260409231754.528518-1-ashutosh.dixit@intel.com>
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

v2: Use xe_map layer also in xe_oa_copy_to_user (Umesh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 98 +++++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_oa_types.h |  3 -
 2 files changed, 59 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 6337e671c97ae..ff2ddec8ffa65 100644
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
@@ -311,30 +317,47 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
 	return HRTIMER_RESTART;
 }
 
+/* Because there is no iosys_map_copy_to_user() or copy_to_user_from_iomem() */
+static int xe_oa_copy_to_user(struct xe_oa_stream *stream, void __user *dst, u32 head, u32 len)
+{
+	u32 __user *dptr = dst;
+
+	xe_gt_assert(stream->gt, len % 4 == 0);
+
+	for (int i = 0; i < len / 4; i++) {
+		struct iosys_map *map = &stream->oa_buffer.bo->vmap;
+		u32 val = xe_map_rd(stream->oa->xe, map, head, u32);
+		int ret = put_user(val, dptr++);
+
+		if (ret)
+			return ret;
+		head += 4;
+	}
+
+	return 0;
+}
+
 static int xe_oa_append_report(struct xe_oa_stream *stream, char __user *buf,
-			       size_t count, size_t *offset, const u8 *report)
+			       size_t count, size_t *offset, u32 head)
 {
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
+		if (xe_oa_copy_to_user(stream, buf, head, report_size_partial))
 			return -EFAULT;
 		buf += report_size_partial;
 
-		if (copy_to_user(buf, stream->oa_buffer.vaddr,
-				 report_size - report_size_partial))
+		if (xe_oa_copy_to_user(stream, buf, 0, report_size - report_size_partial))
 			return -EFAULT;
-	} else if (copy_to_user(buf, report, report_size)) {
+	} else if (xe_oa_copy_to_user(stream, buf, head, report_size)) {
 		return -EFAULT;
 	}
 
@@ -347,7 +370,6 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 				size_t count, size_t *offset)
 {
 	int report_size = stream->oa_buffer.format->size;
-	u8 *oa_buf_base = stream->oa_buffer.vaddr;
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
 	size_t start_offset = *offset;
 	unsigned long flags;
@@ -364,26 +386,24 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 
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
@@ -436,7 +456,8 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
 	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
 
 	/* Zero out the OA buffer since we rely on zero report id and timestamp fields */
-	memset(stream->oa_buffer.vaddr, 0, xe_bo_size(stream->oa_buffer.bo));
+	xe_map_memset(stream->oa->xe, &stream->oa_buffer.bo->vmap, 0, 0,
+		      xe_bo_size(stream->oa_buffer.bo));
 }
 
 static u32 __format_to_oactrl(const struct xe_oa_format *format, int counter_sel_mask)
@@ -891,7 +912,6 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
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

