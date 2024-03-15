Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C946EC54E73
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 01:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF2710FF38;
	Fri, 15 Mar 2024 01:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KWx60uBm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8675710FF3B
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 01:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710466528; x=1742002528;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XPsPZDd44YW7F8g1mfzNm8OogZPfdun7KmL/gV+h3to=;
 b=KWx60uBmHbSMLoq//Pp7fAc0oSuJ0oXSqpJd1lS6JHVdueozZXBZ6NDi
 3guc91B0WPlKQCixvd2nrGVqo6NH1j9auu+FWHRPm+lnR29+MtG6gXYia
 7TP5Ie+8MyMQ6tNthDn+T8igpV8mbRnfLyRIhQW6lEyGN16JG/pKOBOw+
 jKEkL2tK45vsQG8NBXk7B8gbZuNsQAIQnKgxQeFZAZfM3R88PvjKUr2jT
 SgG6FS5Oat8bT/IjSRORi9EcjrvMO9ss3vYx4rruxDdNitQUKX2ve/YZe
 vneL0veSGsXUUDUY9rA6l2zpjmfetbLfbwI9BwS3pAx+wW4iANKp/N8A5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="15963138"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="15963138"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 18:35:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="43397273"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 18:35:24 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 16/17] drm/xe/oa: Changes to OA_TAKEN
Date: Thu, 14 Mar 2024 18:35:17 -0700
Message-ID: <20240315013518.2848986-17-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315013518.2848986-1-ashutosh.dixit@intel.com>
References: <20240315013518.2848986-1-ashutosh.dixit@intel.com>
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
index b33976db1da5..6f5bbb0787d9 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -28,7 +28,6 @@
 #include "xe_sched_job.h"
 #include "xe_perf.h"
 
-#define OA_TAKEN(tail, head)	(((tail) - (head)) & (XE_OA_BUFFER_SIZE - 1))
 #define DEFAULT_POLL_FREQUENCY_HZ 200
 #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
 #define XE_OA_UNIT_INVALID U32_MAX
@@ -105,6 +104,11 @@ static const struct xe_oa_format oa_formats[] = {
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
@@ -209,11 +213,11 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
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
 
@@ -225,24 +229,24 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
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
 
@@ -315,7 +319,7 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 
 	xe_assert(stream->oa->xe, head < XE_OA_BUFFER_SIZE && tail < XE_OA_BUFFER_SIZE);
 
-	for (; OA_TAKEN(tail, head); head = (head + report_size) & mask) {
+	for (; xe_oa_circ_diff(stream, tail, head); head = (head + report_size) & mask) {
 		u8 *report = oa_buf_base + head;
 
 		ret = xe_oa_append_report(stream, buf, count, offset, report);
-- 
2.41.0

