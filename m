Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3657C2BA1A
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 22:37:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9325B10E514;
	Mon, 17 Jun 2024 22:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOkQoM/V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5928610E51A
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 22:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718663821; x=1750199821;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Tadebbg3SiEs+BBpsXLEn0jHfgOBNlSO/lW27h3553w=;
 b=kOkQoM/VK0oi3GK8bC9oqAcQQezX8EYXqTX8ZrP9R2ZMYv6F3en3w/lU
 SOJnE+8w0s9lHQnD8y7xstk3PG3KxVM/rdkIHV4WbfJsRuuBTQDJ3ZPSA
 OnZS4tTaC1lmhebRHvwwNMkOgN5M0WY1bBaMjzC2YPi3ngN/5QnG/fxD3
 SqoNnwHXXGQqYBpN9wiXAGv98AVXryMpwYF7h7lCOgtpq0jU/X8jOmU0p
 6GcrLMUiY4ZGWBS/fc+TkW/4JqZ8UL/bYa0Gc8y9ztEa5md4pNiiyGkyT
 Pvrzv4BJrfNQ6YZ30Zto1qgEmZJSYvKFaVl2rSaW1ucys9/qkXr7hiZBJ A==;
X-CSE-ConnectionGUID: xI9IbMHUSaS1UCFv55OI9A==
X-CSE-MsgGUID: TcrRKVC8S6KRFFH0GHTLYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="18428986"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="18428986"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 15:37:00 -0700
X-CSE-ConnectionGUID: rorGsqpmT3eNTggCP/3qpQ==
X-CSE-MsgGUID: bXxrr3fBTb2ToHuTZAIuAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="72090785"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 15:36:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 17/17] drm/xe/oa: Enable Xe2+ overrun mode
Date: Mon, 17 Jun 2024 15:36:51 -0700
Message-ID: <20240617223651.3220399-18-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240617223651.3220399-1-ashutosh.dixit@intel.com>
References: <20240617223651.3220399-1-ashutosh.dixit@intel.com>
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

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 35 ++++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_oa_types.h |  3 +++
 2 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 2d398b7231c1..34206e0b6a08 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -114,7 +114,14 @@ static const struct xe_oa_format oa_formats[] = {
 
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
@@ -288,7 +295,7 @@ static int xe_oa_append_report(struct xe_oa_stream *stream, char __user *buf,
 
 	buf += *offset;
 
-	oa_buf_end = stream->oa_buffer.vaddr + XE_OA_BUFFER_SIZE;
+	oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
 	report_size_partial = oa_buf_end - report;
 
 	if (report_size_partial < report_size) {
@@ -314,7 +321,6 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 	int report_size = stream->oa_buffer.format->size;
 	u8 *oa_buf_base = stream->oa_buffer.vaddr;
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
-	u32 mask = (XE_OA_BUFFER_SIZE - 1);
 	size_t start_offset = *offset;
 	unsigned long flags;
 	u32 head, tail;
@@ -325,21 +331,23 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
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
@@ -377,7 +385,6 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
 	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_head_ptr,
 			gtt_offset & OAG_OAHEADPTR_MASK);
 	stream->oa_buffer.head = 0;
-
 	/*
 	 * PRM says: "This MMIO must be set before the OATAILPTR register and after the
 	 * OAHEADPTR register. This is to enable proper functionality of the overflow bit".
@@ -1300,6 +1307,18 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
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
index 0981f0e57676..706d45577dae 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -170,6 +170,9 @@ struct xe_oa_buffer {
 
 	/** @tail: The last verified cached tail where HW has completed writing */
 	u32 tail;
+
+	/** @circ_size: The effective circular buffer size, for Xe2+ */
+	u32 circ_size;
 };
 
 /**
-- 
2.41.0

