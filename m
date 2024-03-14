Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7AAC54E67
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 03:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BF410F88E;
	Thu, 14 Mar 2024 03:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FwwAcs1r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA9910F88E
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 03:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710386741; x=1741922741;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Fs9TBFJ7ZC5H0P4q2SWZr4om6UecWyMoa/9teNvkBzw=;
 b=FwwAcs1reXxhitQpm5ow30lq7z7KrggATJVz5Pfvra5amfAanxfewWts
 rqvyra8AwOaNUCGIpt2ZKhl5eQExj/EaB4I7xh4zVztyWOnHSUAUiAzgk
 xDxZcO19Vm/5oZi8bgQLj8XPmL2wYPeMRda2ZA3M1QQ/986ASZzm3pjVJ
 Upkesqa1XPSy2RJXTLO3lxK3qS4IXpCxBBjSFhRzzmTMQFcTyf/zoN0hL
 jtf6+MtGhsxQKZM3Q8KkHcycVhtzlbxAIe5f65GbIH0V6sg/KV1cMVWzO
 U4Ea29WR+XXp5LMKJEoB/D20uxNPsoxBsyy4HywhK+ILtrlGQMbd78UDk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="9005207"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="9005207"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 20:25:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="16888838"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 20:25:40 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 17/17] drm/xe/oa: Enable Xe2+ overrun mode
Date: Wed, 13 Mar 2024 20:25:32 -0700
Message-ID: <20240314032532.2813165-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Enable Xe2+ overrun mode. For Xe2+, when overrun mode is enabled, there are
no partial reports at the end of buffer, making the OA buffer effectively a
non-power-of-2 size circular buffer whose size, circ_size, is a multiple of
the report size.

v2: Fix implementation of xe_oa_circ_diff/xe_oa_circ_incr (Umesh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 35 ++++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_oa_types.h |  3 +++
 2 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 6f5bbb0787d9..1ad17cc14532 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -106,7 +106,14 @@ static const struct xe_oa_format oa_formats[] = {
 
 static u32 xe_oa_circ_diff(struct xe_oa_stream *stream, u32 tail, u32 head)
 {
-	return (tail - head) & (XE_OA_BUFFER_SIZE - 1);
+	return tail >= head ? tail - head :
+		tail + stream->oa_buffer.circ_size - head;
+}
+
+static u32 xe_oa_circ_incr(struct xe_oa_stream *stream, u32 ptr, u32 n)
+{
+	return ptr + n >= stream->oa_buffer.circ_size ?
+		ptr + n - stream->oa_buffer.circ_size : ptr + n;
 }
 
 static void xe_oa_config_release(struct kref *ref)
@@ -280,7 +287,7 @@ static int xe_oa_append_report(struct xe_oa_stream *stream, char __user *buf,
 
 	buf += *offset;
 
-	oa_buf_end = stream->oa_buffer.vaddr + XE_OA_BUFFER_SIZE;
+	oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
 	report_size_partial = oa_buf_end - report;
 
 	if (report_size_partial < report_size) {
@@ -306,7 +313,6 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 	int report_size = stream->oa_buffer.format->size;
 	u8 *oa_buf_base = stream->oa_buffer.vaddr;
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
-	u32 mask = (XE_OA_BUFFER_SIZE - 1);
 	size_t start_offset = *offset;
 	unsigned long flags;
 	u32 head, tail;
@@ -317,21 +323,23 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 	tail = stream->oa_buffer.tail;
 	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
 
-	xe_assert(stream->oa->xe, head < XE_OA_BUFFER_SIZE && tail < XE_OA_BUFFER_SIZE);
+	xe_assert(stream->oa->xe,
+		  head < stream->oa_buffer.circ_size && tail < stream->oa_buffer.circ_size);
 
-	for (; xe_oa_circ_diff(stream, tail, head); head = (head + report_size) & mask) {
+	for (; xe_oa_circ_diff(stream, tail, head);
+	     head = xe_oa_circ_incr(stream, head, report_size)) {
 		u8 *report = oa_buf_base + head;
 
 		ret = xe_oa_append_report(stream, buf, count, offset, report);
 		if (ret)
 			break;
 
-		if (is_power_of_2(report_size)) {
+		if (!(stream->oa_buffer.circ_size % report_size)) {
 			/* Clear out report id and timestamp to detect unlanded reports */
 			oa_report_id_clear(stream, (void *)report);
 			oa_timestamp_clear(stream, (void *)report);
 		} else {
-			u8 *oa_buf_end = stream->oa_buffer.vaddr + XE_OA_BUFFER_SIZE;
+			u8 *oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
 			u32 part = oa_buf_end - report;
 
 			/* Zero out the entire report */
@@ -369,7 +377,6 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
 	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_head_ptr,
 			gtt_offset & OAG_OAHEADPTR_MASK);
 	stream->oa_buffer.head = 0;
-
 	/*
 	 * PRM says: "This MMIO must be set before the OATAILPTR register and after the
 	 * OAHEADPTR register. This is to enable proper functionality of the overflow bit".
@@ -1256,6 +1263,18 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	stream->periodic = param->period_exponent > 0;
 	stream->period_exponent = param->period_exponent;
 
+	/*
+	 * For Xe2+, when overrun mode is enabled, there are no partial reports at the end
+	 * of buffer, making the OA buffer effectively a non-power-of-2 size circular
+	 * buffer whose size, circ_size, is a multiple of the report size
+	 */
+	if (GRAPHICS_VER(stream->oa->xe) >= 20 &&
+	    stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG && stream->sample)
+		stream->oa_buffer.circ_size =
+			XE_OA_BUFFER_SIZE - XE_OA_BUFFER_SIZE % stream->oa_buffer.format->size;
+	else
+		stream->oa_buffer.circ_size = XE_OA_BUFFER_SIZE;
+
 	if (stream->exec_q && engine_supports_mi_query(stream->hwe)) {
 		/* If we don't find the context offset, just return error */
 		ret = xe_oa_set_ctx_ctrl_offset(stream);
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 6984e7d04be5..d8d5c9d8c22e 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -163,6 +163,9 @@ struct xe_oa_buffer {
 
 	/** @tail: The last verified cached tail where HW has completed writing */
 	u32 tail;
+
+	/** @circ_size: The effective circular buffer size, for Xe2+ */
+	u32 circ_size;
 };
 
 /**
-- 
2.41.0

