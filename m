Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121D9C2BB9A
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 22:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC3E10E51A;
	Mon, 17 Jun 2024 22:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CAIm/wfn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9A710E524
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 22:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718663821; x=1750199821;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=SopJ+qvByY8u+iheTACLed3w3CkkLkTinpOvuhPlTWY=;
 b=CAIm/wfnGipStCjrHZEgH92mSWNhy7JYemveBh5PbuBs8Iw3b8f8RMHe
 xydNlepz6ARIha+V7dINHC7GfYhiGA9t1IT1iWYJlydlEihJGVuy2+8q6
 sg9eWbpCVRF2c9oAzS7KJ13Uqn+iEqJPOyUZhdkeqbJYSlnhfnf9w3Azk
 vDX2Aewpn+iYoYv5+mTI7vgc5dcSqd9+za06Zyf9L8JRsEoyi3Adx73UY
 ZQyDGG3SOKVdtYiZmPj+PUqOmk30Yn2Ov6DUotcfwnJ8LYkidPQIiww/a
 trSeJzSdm0OjCV3ZWIz89PXn/viISVVEFztTuJsJgMpUNOVmg9ptk2Yg+ Q==;
X-CSE-ConnectionGUID: KO23JoD7TLSYKGl03F2snA==
X-CSE-MsgGUID: zbVPZvj/SsCjiWXlmn97LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="18428985"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="18428985"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 15:37:00 -0700
X-CSE-ConnectionGUID: sDuplyVuTZeR9u92qKY+zQ==
X-CSE-MsgGUID: haKVBdcjTIOfhxoNNLkElA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="72090784"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 15:36:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 16/17] drm/xe/oa: Changes to OA_TAKEN
Date: Mon, 17 Jun 2024 15:36:50 -0700
Message-ID: <20240617223651.3220399-17-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240617223651.3220399-1-ashutosh.dixit@intel.com>
References: <20240617223651.3220399-1-ashutosh.dixit@intel.com>
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

Rename OA_TAKEN to xe_oa_circ_diff, since xe_oa_circ_diff better describes
what the macro actually does. Also convert to function and add xe_oa_stream
arg. These will be used in the following patch.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index be6502066e53..2d398b7231c1 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -36,7 +36,6 @@
 #include "xe_pm.h"
 #include "xe_sched_job.h"
 
-#define OA_TAKEN(tail, head)	(((tail) - (head)) & (XE_OA_BUFFER_SIZE - 1))
 #define DEFAULT_POLL_FREQUENCY_HZ 200
 #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
 #define XE_OA_UNIT_INVALID U32_MAX
@@ -113,6 +112,11 @@ static const struct xe_oa_format oa_formats[] = {
 	[XE_OA_FORMAT_PEC36u64_G1_4_G2_32]	= { 4, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
 };
 
+static u32 xe_oa_circ_diff(struct xe_oa_stream *stream, u32 tail, u32 head)
+{
+	return (tail - head) & (XE_OA_BUFFER_SIZE - 1);
+}
+
 static void xe_oa_config_release(struct kref *ref)
 {
 	struct xe_oa_config *oa_config =
@@ -217,11 +221,11 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 	 * increments. Also report size may not be a power of 2. Compute potential
 	 * partially landed report in OA buffer.
 	 */
-	partial_report_size = OA_TAKEN(hw_tail, stream->oa_buffer.tail);
+	partial_report_size = xe_oa_circ_diff(stream, hw_tail, stream->oa_buffer.tail);
 	partial_report_size %= report_size;
 
 	/* Subtract partial amount off the tail */
-	hw_tail = OA_TAKEN(hw_tail, partial_report_size);
+	hw_tail = xe_oa_circ_diff(stream, hw_tail, partial_report_size);
 
 	tail = hw_tail;
 
@@ -233,24 +237,24 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 	 * This is assuming that the writes of the OA unit land in memory in the order
 	 * they were written.  If not : (╯°□°）╯︵ ┻━┻
 	 */
-	while (OA_TAKEN(tail, stream->oa_buffer.tail) >= report_size) {
+	while (xe_oa_circ_diff(stream, tail, stream->oa_buffer.tail) >= report_size) {
 		void *report = stream->oa_buffer.vaddr + tail;
 
 		if (oa_report_id(stream, report) || oa_timestamp(stream, report))
 			break;
 
-		tail = OA_TAKEN(tail, report_size);
+		tail = xe_oa_circ_diff(stream, tail, report_size);
 	}
 
-	if (OA_TAKEN(hw_tail, tail) > report_size)
+	if (xe_oa_circ_diff(stream, hw_tail, tail) > report_size)
 		drm_dbg(&stream->oa->xe->drm,
 			"unlanded report(s) head=0x%x tail=0x%x hw_tail=0x%x\n",
 			stream->oa_buffer.head, tail, hw_tail);
 
 	stream->oa_buffer.tail = tail;
 
-	pollin = OA_TAKEN(stream->oa_buffer.tail,
-			  stream->oa_buffer.head) >= report_size;
+	pollin = xe_oa_circ_diff(stream, stream->oa_buffer.tail,
+				 stream->oa_buffer.head) >= report_size;
 
 	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
 
@@ -323,7 +327,7 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 
 	xe_assert(stream->oa->xe, head < XE_OA_BUFFER_SIZE && tail < XE_OA_BUFFER_SIZE);
 
-	for (; OA_TAKEN(tail, head); head = (head + report_size) & mask) {
+	for (; xe_oa_circ_diff(stream, tail, head); head = (head + report_size) & mask) {
 		u8 *report = oa_buf_base + head;
 
 		ret = xe_oa_append_report(stream, buf, count, offset, report);
-- 
2.41.0

