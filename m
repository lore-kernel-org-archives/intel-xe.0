Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E65C5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 20:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7A110F3BF;
	Fri, 21 Aug 2026 20:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XQqewQFl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CE010E34F
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 20:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787342858; x=1818878858;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=v6MI65bDN4t3gvXgr2BIb8fDhXYWBqx061zRItjJn20=;
 b=XQqewQFlp+sZtwZjZoxwXeKM7gBdgUf33MHyA3nah4FkwVnZtAH5MClb
 VQ8KAA9WUJoONZNg7V16blKlvL/4iGBOCxfXnEu8PDG++eJjLMsaaR7LQ
 mpQ59lQsSJhw78apZq4FJcTMNvz9y70hDp+QIH5pgAm05iwv0Kdh2Y4vy
 Mvyq9qMsKepe2jAEr+1IovwpgY5tIBuUlKhtTLVBJqzXLqUCIwE/s7Iof
 0z7dfYwFVE8watjUlSyTDms6X9V3CjLLPkTLAEk1vWgXUMJSKwm/vu9SS
 ZT/qRXwzq3V7XktlkoZz8r1kpRZoCEMVBRdrLreOSLnlWZNKRjwr7i0OS Q==;
X-CSE-ConnectionGUID: IBQzqM05QIyYLrcZkh4zEw==
X-CSE-MsgGUID: g4XRsuyYRi+f8rWPPo0Ywg==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87957215"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="87957215"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 13:07:37 -0700
X-CSE-ConnectionGUID: 4r/bo8TySkmSX13y3yLDQg==
X-CSE-MsgGUID: Gq1eVsdnSUSRRmGuqsQMQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="266491047"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 13:07:38 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 2/3] drm/xe/xe_oa: Avoid checking and setting fields in the OA
 report
Date: Fri, 21 Aug 2026 13:07:31 -0700
Message-ID: <20260821200728.1048699-7-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260821200728.1048699-5-umesh.nerlige.ramappa@intel.com>
References: <20260821200728.1048699-5-umesh.nerlige.ramappa@intel.com>
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

OA unit updates the HW TAIL register to indicate that a new report is
available, although it does not guarantee that the report is visible in
memory. Also the currently running workload contributes to some latency
in seeing this report in memory. In the past we would set some fields in
the OA report and check if the fields are populated to non-zero values
by the HW, but this is no longer sufficient since some parts of the
report may land out of order under heavy workloads. Drop this WA and add
a new logic in subsequent patches to return updated reports to the user.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 79 +-------------------------------------
 1 file changed, 2 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 024940478c06..d7647f37ab02 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -216,42 +216,6 @@ static u32 xe_oa_hw_tail_read(struct xe_oa_stream *stream)
 #define oa_report_header_64bit(__s) \
 	((__s)->oa_buffer.format->header == HDR_64_BIT)
 
-static u64 oa_report_id(struct xe_oa_stream *stream, u32 report_offset)
-{
-	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
-
-	return oa_report_header_64bit(stream) ?
-		xe_map_rd(stream->oa->xe, map, report_offset, u64) :
-		xe_map_rd(stream->oa->xe, map, report_offset, u32);
-}
-
-static void oa_report_id_clear(struct xe_oa_stream *stream, u32 report_offset)
-{
-	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
-
-	oa_report_header_64bit(stream) ?
-		xe_map_wr(stream->oa->xe, map, report_offset, u64, 0) :
-		xe_map_wr(stream->oa->xe, map, report_offset, u32, 0);
-}
-
-static u64 oa_timestamp(struct xe_oa_stream *stream, u32 report_offset)
-{
-	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
-
-	return oa_report_header_64bit(stream) ?
-		xe_map_rd(stream->oa->xe, map, report_offset + 8, u64) :
-		xe_map_rd(stream->oa->xe, map, report_offset + 4, u32);
-}
-
-static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 report_offset)
-{
-	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
-
-	oa_report_header_64bit(stream) ?
-		xe_map_wr(stream->oa->xe, map, report_offset + 8, u64, 0) :
-		xe_map_wr(stream->oa->xe, map, report_offset + 4, u32, 0);
-}
-
 static bool mert_wa_14026633728(struct xe_oa_stream *s)
 {
 	return s->oa_unit->type == DRM_XE_OA_UNIT_TYPE_MERT && XE_DEVICE_WA(s->oa->xe, 14026633728);
@@ -260,7 +224,7 @@ static bool mert_wa_14026633728(struct xe_oa_stream *s)
 static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 {
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
-	u32 tail, hw_tail, partial_report_size, available;
+	u32 hw_tail, partial_report_size, available;
 	int report_size = stream->oa_buffer.format->size;
 	unsigned long flags;
 
@@ -280,29 +244,7 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 	/* Subtract partial amount off the tail */
 	hw_tail = xe_oa_circ_diff(stream, hw_tail, partial_report_size);
 
-	tail = hw_tail;
-
-	/*
-	 * Walk the stream backward until we find a report with report id and timestamp
-	 * not 0. We can't tell whether a report has fully landed in memory before the
-	 * report id and timestamp of the following report have landed.
-	 *
-	 * This is assuming that the writes of the OA unit land in memory in the order
-	 * they were written.  If not : (╯°□°）╯︵ ┻━┻
-	 */
-	while (xe_oa_circ_diff(stream, tail, stream->oa_buffer.tail) >= report_size) {
-		if (oa_report_id(stream, tail) || oa_timestamp(stream, tail))
-			break;
-
-		tail = xe_oa_circ_diff(stream, tail, report_size);
-	}
-
-	if (xe_oa_circ_diff(stream, hw_tail, tail) > report_size)
-		drm_dbg(&stream->oa->xe->drm,
-			"unlanded report(s) head=0x%x tail=0x%x hw_tail=0x%x\n",
-			stream->oa_buffer.head, tail, hw_tail);
-
-	stream->oa_buffer.tail = tail;
+	stream->oa_buffer.tail = hw_tail;
 
 	available = xe_oa_circ_diff(stream, stream->oa_buffer.tail, stream->oa_buffer.head);
 	stream->pollin = available >= stream->wait_num_reports * report_size;
@@ -387,23 +329,6 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 		ret = xe_oa_append_report(stream, buf, count, offset, head);
 		if (ret)
 			break;
-
-		if (!(stream->oa_buffer.circ_size % report_size)) {
-			/* Clear out report id and timestamp to detect unlanded reports */
-			oa_report_id_clear(stream, head);
-			oa_timestamp_clear(stream, head);
-		} else {
-			struct iosys_map *map = &stream->oa_buffer.bo->vmap;
-			u32 part = stream->oa_buffer.circ_size - head;
-
-			/* Zero out the entire report */
-			if (report_size <= part) {
-				xe_map_memset(stream->oa->xe, map, head, 0, report_size);
-			} else {
-				xe_map_memset(stream->oa->xe, map, head, 0, part);
-				xe_map_memset(stream->oa->xe, map, 0, 0, report_size - part);
-			}
-		}
 	}
 
 	if (start_offset != *offset) {
-- 
2.51.0

