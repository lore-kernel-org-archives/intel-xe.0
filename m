Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1661FF8868
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 20:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C7B10E913;
	Mon, 27 Apr 2026 20:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lPLiC9bK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1576010E913
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 20:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777321620; x=1808857620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rng7W77eNVZXMv8C3/v0YkITJlNgbkvXu90qEWEQ5dw=;
 b=lPLiC9bK8A8OR7iotXIbMJcC+Ukaqx2Y2wn7rt/ambXQ1vmgPOuzXK1u
 AzK+0eiIxLo7NrTVEH/Sumn+HIWruss2cJfQjBqSAGCI2CHK9h2wJm5Of
 IoRskteg5hrkrHT1JRubupEBIAxAPg6obKR2We4PsG5S4Oet+BmhE6E78
 dlZoVDO9UGgNEJc94UwJrl0cLe0jEDJCl+yOYDF/qs2gEBL2LWJMFU3NQ
 977XTlsi3MfEFrDbOZoubDQJEdYAhKci12O0Mrm3JXD9TEL6RNiUsZ1/P
 1w1QuMgGpC15l5T1pWS4eSykMi8v3sfkZuebUfpT43wWTyY+jlEmNIvmk g==;
X-CSE-ConnectionGUID: dxJv38V5QyCiPflPQaek2Q==
X-CSE-MsgGUID: fvQ1o/tISvWXjXoPmicLEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78114618"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78114618"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 13:27:00 -0700
X-CSE-ConnectionGUID: 0NDXGHVwS5KNC4LiSPniRA==
X-CSE-MsgGUID: tRpQNCK5S7edCERytUOxsQ==
X-ExtLoop1: 1
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 13:26:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 1/3] drm/xe/oa: Use xe_map layer
Date: Mon, 27 Apr 2026 13:26:53 -0700
Message-ID: <20260427202655.2493474-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427202655.2493474-1-ashutosh.dixit@intel.com>
References: <20260427202655.2493474-1-ashutosh.dixit@intel.com>
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

v2: Use xe_map layer and put_user in xe_oa_copy_to_user (Umesh)
v3: To avoid performance impact in v2, revert to v1 but move
    xe_map_copy_to_user() to xe_map.h
v4: Use bounce buffer and copy_to_user in xe_oa_copy_to_user
v5: Fix offsets in oa_timestamp() and oa_timestamp_clear() (Umesh)
v6: Rename head/tail in helper args to report_offset (Umesh)
v7: Add xe_assert in xe_oa_copy_to_user (Umesh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 97 +++++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_oa_types.h |  4 +-
 2 files changed, 60 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 6337e671c97ae..6ded3c2fce34e 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -213,32 +213,40 @@ static u32 xe_oa_hw_tail_read(struct xe_oa_stream *stream)
 #define oa_report_header_64bit(__s) \
 	((__s)->oa_buffer.format->header == HDR_64_BIT)
 
-static u64 oa_report_id(struct xe_oa_stream *stream, void *report)
+static u64 oa_report_id(struct xe_oa_stream *stream, u32 report_offset)
 {
-	return oa_report_header_64bit(stream) ? *(u64 *)report : *(u32 *)report;
+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
+
+	return oa_report_header_64bit(stream) ?
+		xe_map_rd(stream->oa->xe, map, report_offset, u64) :
+		xe_map_rd(stream->oa->xe, map, report_offset, u32);
 }
 
-static void oa_report_id_clear(struct xe_oa_stream *stream, u32 *report)
+static void oa_report_id_clear(struct xe_oa_stream *stream, u32 report_offset)
 {
-	if (oa_report_header_64bit(stream))
-		*(u64 *)report = 0;
-	else
-		*report = 0;
+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
+
+	oa_report_header_64bit(stream) ?
+		xe_map_wr(stream->oa->xe, map, report_offset, u64, 0) :
+		xe_map_wr(stream->oa->xe, map, report_offset, u32, 0);
 }
 
-static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
+static u64 oa_timestamp(struct xe_oa_stream *stream, u32 report_offset)
 {
+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
+
 	return oa_report_header_64bit(stream) ?
-		*((u64 *)report + 1) :
-		*((u32 *)report + 1);
+		xe_map_rd(stream->oa->xe, map, report_offset + 8, u64) :
+		xe_map_rd(stream->oa->xe, map, report_offset + 4, u32);
 }
 
-static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 *report)
+static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 report_offset)
 {
-	if (oa_report_header_64bit(stream))
-		*(u64 *)&report[2] = 0;
-	else
-		report[1] = 0;
+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
+
+	oa_report_header_64bit(stream) ?
+		xe_map_wr(stream->oa->xe, map, report_offset + 8, u64, 0) :
+		xe_map_wr(stream->oa->xe, map, report_offset + 4, u32, 0);
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
 
+static unsigned long
+xe_oa_copy_to_user(struct xe_oa_stream *stream, void __user *dst, u32 report_offset, u32 len)
+{
+	xe_assert(stream->oa->xe, len <= stream->oa_buffer.format->size);
+
+	xe_map_memcpy_from(stream->oa->xe, stream->oa_buffer.bounce,
+			   &stream->oa_buffer.bo->vmap, report_offset, len);
+	return copy_to_user(dst, stream->oa_buffer.bounce, len);
+}
+
 static int xe_oa_append_report(struct xe_oa_stream *stream, char __user *buf,
-			       size_t count, size_t *offset, const u8 *report)
+			       size_t count, size_t *offset, u32 report_offset)
 {
 	int report_size = stream->oa_buffer.format->size;
 	int report_size_partial;
-	u8 *oa_buf_end;
 
 	if ((count - *offset) < report_size)
 		return -ENOSPC;
 
 	buf += *offset;
 
-	oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
-	report_size_partial = oa_buf_end - report;
+	report_size_partial = stream->oa_buffer.circ_size - report_offset;
 
 	if (report_size_partial < report_size) {
-		if (copy_to_user(buf, report, report_size_partial))
+		if (xe_oa_copy_to_user(stream, buf, report_offset, report_size_partial))
 			return -EFAULT;
 		buf += report_size_partial;
 
-		if (copy_to_user(buf, stream->oa_buffer.vaddr,
-				 report_size - report_size_partial))
+		if (xe_oa_copy_to_user(stream, buf, 0, report_size - report_size_partial))
 			return -EFAULT;
-	} else if (copy_to_user(buf, report, report_size)) {
+	} else if (xe_oa_copy_to_user(stream, buf, report_offset, report_size)) {
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
@@ -699,6 +710,7 @@ static int num_lri_dwords(int num_regs)
 static void xe_oa_free_oa_buffer(struct xe_oa_stream *stream)
 {
 	xe_bo_unpin_map_no_vm(stream->oa_buffer.bo);
+	kfree(stream->oa_buffer.bounce);
 }
 
 static void xe_oa_free_configs(struct xe_oa_stream *stream)
@@ -889,9 +901,16 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
 		return PTR_ERR(bo);
 
 	stream->oa_buffer.bo = bo;
+
 	/* mmap implementation requires OA buffer to be in system memory */
 	xe_assert(stream->oa->xe, bo->vmap.is_iomem == 0);
-	stream->oa_buffer.vaddr = bo->vmap.vaddr;
+
+	stream->oa_buffer.bounce = kmalloc(stream->oa_buffer.format->size, GFP_KERNEL);
+	if (!stream->oa_buffer.bounce) {
+		xe_bo_unpin_map_no_vm(stream->oa_buffer.bo);
+		return -ENOMEM;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 8906c3084b5f8..3d9ec8490899c 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -164,8 +164,8 @@ struct xe_oa_buffer {
 	/** @bo: xe_bo backing the OA buffer */
 	struct xe_bo *bo;
 
-	/** @vaddr: mapped vaddr of the OA buffer */
-	u8 *vaddr;
+	/** @bounce: bounce buffer used with xe_map layer */
+	void *bounce;
 
 	/** @ptr_lock: Lock protecting reads/writes to head/tail pointers */
 	spinlock_t ptr_lock;
-- 
2.54.0

