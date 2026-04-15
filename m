Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AD3F42131
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 18:27:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF7110E729;
	Wed, 15 Apr 2026 18:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hddyRI6t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689EE10E729
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 18:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776277643; x=1807813643;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ijcHoZE1wgkRFlCR3UnPt2DVJGW1nmnL/+/d4585q04=;
 b=hddyRI6tVhTEqvggaiSHcIxqc1xsVWFVCiq5DaxBp7S7v2uWRn0br2V3
 HvwzMpQq6edimuR5aEhK4EtUSKqJqEaAZ6VPFa9PAMr+a9quQQRQqRVdb
 /n3WlTUg96UkKW6QvKq3bqA3NJ/eNQrvQtQq8jTQOiCicD5bjZOcvluJO
 JJyN2PVafT7Gjf+yA1oQb9EFrpSZf8pa2E7NCbqRH8FWfPV7Gt8KzmZrP
 5FwVdo4e48SzY5N9fEYdwDn7hmK5wRYukYySfhMvByeoiPoz/vV396kVR
 7dHTskSYGc4zcOMEnnMYZKt9bbsNK2Wv67HBPd3IJZKG9Te5Ty5Bcazhw Q==;
X-CSE-ConnectionGUID: 5KvJ0RRsRIK13uas9378WA==
X-CSE-MsgGUID: hd/TkF0lQ8yzBTWPKDU48A==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="99912505"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="99912505"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 11:27:23 -0700
X-CSE-ConnectionGUID: OX2zNlFSRyaz6qqS7jJjEg==
X-CSE-MsgGUID: BuUPxfUkTHqV82tkpDnACA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234881997"
Received: from hchegond-desk.jf.intel.com ([10.88.27.198])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 11:27:23 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: felix.j.degrood@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, ashutosh.dixit@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v5 1/1] drm/xe/eustall: Return ENODEV from read if EU stall
 registers get reset
Date: Wed, 15 Apr 2026 11:27:17 -0700
Message-ID: <6935698d70b6c7c347ff8b138209d601030c2c9f.1776200094.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.43.0
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

If a reset (GT or engine) happens during EU stall data sampling, all the
EU stall registers can get reset to 0. This will result in EU stall data
buffers' read and write pointer register values to be out of sync with
the cached values. This will result in read() returning invalid data. To
prevent this, check the value of a EU stall base register. If it is zero,
it indicates a reset may have happened that wiped the register to zero.
If this happens, return ENODEV from read() upon which the user space
should disable and enable EU stall data sampling or close the fd and
open a new fd for a new EU stall data collection session.

This patch has been tested by running two IGT tests simultaneously
xe_eu_stall and xe_exec_reset.

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
v2: Move base register check from read to the poll function
v3: Don't reschedule work item after reset detected (Ashutosh)
v4: Return ENODEV as errno instead of EBADFD
    Reset reset_detected in enable()
v5: Move reset_detected check above data drop check (Ashutosh)
    Rebase

 drivers/gpu/drm/xe/xe_eu_stall.c | 40 +++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index c34408cfd292..d7982d893c49 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -44,6 +44,7 @@ struct per_xecore_buf {
 struct xe_eu_stall_data_stream {
 	bool pollin;
 	bool enabled;
+	bool reset_detected;
 	int wait_num_reports;
 	int sampling_rate_mult;
 	wait_queue_head_t poll_wq;
@@ -428,9 +429,20 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
 			set_bit(xecore, stream->data_drop.mask);
 		xecore_buf->write = write_ptr;
 	}
+	/* If a GT or engine reset happens during EU stall sampling,
+	 * all EU stall registers get reset to 0 and the cached values of
+	 * the EU stall data buffers' read pointers are out of sync with
+	 * the register values. This causes invalid data to be returned
+	 * from read(). To prevent this, check the value of a EU stall base
+	 * register. If it is zero, there has been a reset.
+	 */
+	if (unlikely(!xe_gt_mcr_unicast_read_any(gt, XEHPC_EUSTALL_BASE)))
+		stream->reset_detected = true;
+
+	stream->pollin = min_data_present || stream->reset_detected;
 	mutex_unlock(&stream->xecore_buf_lock);
 
-	return min_data_present;
+	return stream->pollin;
 }
 
 static void clear_dropped_eviction_line_bit(struct xe_gt *gt, u16 group, u16 instance)
@@ -544,6 +556,15 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
 	int ret = 0;
 
 	mutex_lock(&stream->xecore_buf_lock);
+	/* If EU stall registers got reset due to a GT/engine reset,
+	 * continuing with the read() will return invalid data to
+	 * the user space. Just return -ENODEV instead.
+	 */
+	if (unlikely(stream->reset_detected)) {
+		xe_gt_dbg(gt, "EU stall base register has been reset\n");
+		mutex_unlock(&stream->xecore_buf_lock);
+		return -ENODEV;
+	}
 	if (bitmap_weight(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS)) {
 		if (!stream->data_drop.reported_to_user) {
 			stream->data_drop.reported_to_user = true;
@@ -554,7 +575,6 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
 		}
 		stream->data_drop.reported_to_user = false;
 	}
-
 	for_each_dss_steering(xecore, gt, group, instance) {
 		ret = xe_eu_stall_data_buf_read(stream, buf, count, &total_size,
 						gt, group, instance, xecore);
@@ -609,7 +629,8 @@ static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
 	 * We don't want to block the next read() when there is data in the buffer
 	 * now, but couldn't be accommodated in the small user buffer.
 	 */
-	stream->pollin = false;
+	if (!stream->reset_detected)
+		stream->pollin = false;
 
 	return ret;
 }
@@ -692,6 +713,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 		xecore_buf->write = write_ptr;
 		xecore_buf->read = write_ptr;
 	}
+	stream->reset_detected = false;
 	stream->data_drop.reported_to_user = false;
 	bitmap_zero(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS);
 
@@ -717,13 +739,13 @@ static void eu_stall_data_buf_poll_work_fn(struct work_struct *work)
 		container_of(work, typeof(*stream), buf_poll_work.work);
 	struct xe_gt *gt = stream->gt;
 
-	if (eu_stall_data_buf_poll(stream)) {
-		stream->pollin = true;
+	if (eu_stall_data_buf_poll(stream))
 		wake_up(&stream->poll_wq);
-	}
-	queue_delayed_work(gt->eu_stall->buf_ptr_poll_wq,
-			   &stream->buf_poll_work,
-			   msecs_to_jiffies(POLL_PERIOD_MS));
+
+	if (!stream->reset_detected)
+		queue_delayed_work(gt->eu_stall->buf_ptr_poll_wq,
+				   &stream->buf_poll_work,
+				   msecs_to_jiffies(POLL_PERIOD_MS));
 }
 
 static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
-- 
2.43.0

