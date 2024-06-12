Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53D4C2BA1A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 02:05:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B7010E763;
	Wed, 12 Jun 2024 02:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l72jT9tt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619D310E1FA
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 02:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718157939; x=1749693939;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=EGDv3Wbd3JNA1FM2+kY7QQ0fDZVv42ItqPLgW7E/a3Q=;
 b=l72jT9tt45OS1BdhLs7anIIY+l3Riv9Cja5KKWAcc2191h/rvUwZ5rJH
 vfHrq3nYMIuHyTjUpqcpndCXhZP1twEYZlvuKo+cenPoR2xPkL/MYsjKi
 8s5c99jSjED1ysPSluMvVF1YwmVMlzpHLP1QNfPpF+QwqDLy6c2/rtCN5
 9meE7AkNw1T84qd2tOBGBRGwV46gA+UIEXwixTg7XIuWVIfMRH5S0dg3k
 2jQmQxhOru1AuhTeaB2NLV37w8HSl0HQk2dyRnSPvVOrAg+RC7xIgOv1z
 cM38W6mHTHnqA0jr7VF3lmh/f3xTCHWZXvRP2cbgpgvEtHppx4UPwbQWc g==;
X-CSE-ConnectionGUID: j/bm+sBgSh2U7iISO74ZPw==
X-CSE-MsgGUID: WPQaBkDIQve8hOYAOReTyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15028671"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="15028671"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:05:39 -0700
X-CSE-ConnectionGUID: rcp8GKAuQruP8Axi68gxBA==
X-CSE-MsgGUID: 3OgF966jRg2CS9ZC/191Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="39738475"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:05:38 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 16/17] drm/xe/oa: Changes to OA_TAKEN
Date: Tue, 11 Jun 2024 19:05:30 -0700
Message-ID: <20240612020531.2680081-17-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240612020531.2680081-1-ashutosh.dixit@intel.com>
References: <20240612020531.2680081-1-ashutosh.dixit@intel.com>
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
index 4e3eabc09bd1..992170b2945d 100644
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

