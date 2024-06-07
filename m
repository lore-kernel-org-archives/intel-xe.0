Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4852C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 20:43:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653E510ED17;
	Fri,  7 Jun 2024 20:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H14rKOpz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF2E10ED0A
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 20:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717793007; x=1749329007;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LB1yl8/hmITztaARpTaGvTmvC0xsjhbL2EfPEMlcFOw=;
 b=H14rKOpzd4z7FyaT+gc1ES3TkMy67Wukyip3CAvGV8GbOknyVzwvXDRC
 Fyqcn9wi0c39UhxS1R1Gq/5s34lMdYH4tTzjp1tcLAW2n4LQtRaf2DMWT
 gBBknNRfn5slt3HoqEeEX6WnCh7a0xj+BH8cPIX0QCSHDN2p3W0vGQY2y
 moIblj0Y/ZAh++kHuXrQvVxa00XJv433H5an3DVIQIuF0lIzLgslkgD9C
 9fGP6bJzc0qsca/qj+e3UohLnPeQcY+Jhg2acZZxZb5ujUeKW++jSuLrT
 YZJK52X5O8r3MoKl0Tyz1Whg6UACRPwBKuEfgDj0BkUMxWRMl0KBXKAjd A==;
X-CSE-ConnectionGUID: 2MqrsfguT+e2swf/uWT/5g==
X-CSE-MsgGUID: +/njKj9SQniR/byTj8pg+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14651058"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14651058"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:43:26 -0700
X-CSE-ConnectionGUID: EZuiS0QsRVi29zIf1/nGYA==
X-CSE-MsgGUID: 4WcVu0dwTv2eUJ68XelnCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="43368455"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:43:26 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 16/17] drm/xe/oa: Changes to OA_TAKEN
Date: Fri,  7 Jun 2024 13:43:21 -0700
Message-ID: <20240607204322.1966831-17-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240607204322.1966831-1-ashutosh.dixit@intel.com>
References: <20240607204322.1966831-1-ashutosh.dixit@intel.com>
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
index c89b11f5e01e..f4531e2d4de6 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -33,7 +33,6 @@
 #include "xe_pm.h"
 #include "xe_sched_job.h"
 
-#define OA_TAKEN(tail, head)	(((tail) - (head)) & (XE_OA_BUFFER_SIZE - 1))
 #define DEFAULT_POLL_FREQUENCY_HZ 200
 #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
 #define XE_OA_UNIT_INVALID U32_MAX
@@ -110,6 +109,11 @@ static const struct xe_oa_format oa_formats[] = {
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
@@ -214,11 +218,11 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
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
 
@@ -230,24 +234,24 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
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
 
@@ -320,7 +324,7 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 
 	xe_assert(stream->oa->xe, head < XE_OA_BUFFER_SIZE && tail < XE_OA_BUFFER_SIZE);
 
-	for (; OA_TAKEN(tail, head); head = (head + report_size) & mask) {
+	for (; xe_oa_circ_diff(stream, tail, head); head = (head + report_size) & mask) {
 		u8 *report = oa_buf_base + head;
 
 		ret = xe_oa_append_report(stream, buf, count, offset, report);
-- 
2.41.0

