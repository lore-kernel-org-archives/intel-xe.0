Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC9BF483D7
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 20:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08DD10E3E8;
	Mon, 23 Mar 2026 20:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ntNCwkHz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F347E10E3E8
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 20:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774296947; x=1805832947;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B6xrbVMfa+UIaUpL100Ugx0F8BZfkQbNc9i3x6y/2BE=;
 b=ntNCwkHzDRQ7ig5recmQmnXhNunxnC5m3AhlquknuxsWU61p3YC9EvN7
 mjoAj1NQy/2zYxgiW3hyYXa0Dm8RQ8XfUivj49v6NlxooAUoP6IMIAlsf
 RdRJn+Ulqjp8FuHf2mmLeSl3VnIb6smNtXZADutfqdy/PBc9Bf6KeV3fP
 Y5X+11C56utwyFN+7xw79ySPrjihGpxLpBzSjU7XyHWAxynXpOsnbvI+K
 zngjJlvhylovJYNWYXk6VW0YKv4etMagv3fWjLRDvbhXDgvel8/dUA+Z2
 gwu47oP4v0Zma8bdrd+NMI/x9Y8ecY7aRZTRuF2xDvjFp79HGRi1sqRFI A==;
X-CSE-ConnectionGUID: kbR2ADj+R3CL3sT3PKQOqw==
X-CSE-MsgGUID: 5yhov4OlQxqFGDtu1i4V3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="92878447"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="92878447"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 13:15:47 -0700
X-CSE-ConnectionGUID: Wmx73FYtQGeQoCz77LAXCQ==
X-CSE-MsgGUID: U8te/1EuTKukT4+7fAY8Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="217610317"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 13:15:46 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v3] drm/xe/eustall: Return EBADFD from read if EU stall
 registers get reset
Date: Mon, 23 Mar 2026 13:15:41 -0700
Message-ID: <20260323201541.3735214-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

From: Harish Chegondi <harish.chegondi@intel.com>

If a reset (GT or engine) happens during EU stall data sampling, all the
EU stall registers can get reset to 0. This will result in EU stall data
buffers' read and write pointer register values to be out of sync with
the cached values. This will result in read() returning invalid data. To
prevent this, check the value of a EU stall base register. If it is zero,
it indicates a reset may have happened that wiped the register to zero.
If this happens, return EBADFD from read() upon which the user space
should close the fd and open a new fd for a new EU stall data
collection session.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
v2: Move base register check from read to the poll function
v3: Don't reschedule work item after reset detected (Ashutosh)

 drivers/gpu/drm/xe/xe_eu_stall.c | 38 +++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index c34408cfd292c..de72a90f0a93e 100644
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
@@ -554,6 +566,15 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
 		}
 		stream->data_drop.reported_to_user = false;
 	}
+	/* If EU stall registers got reset due to a GT/engine reset,
+	 * continuing with the read() will return invalid data to
+	 * the user space. Just return -EBADFD instead.
+	 */
+	if (unlikely(stream->reset_detected)) {
+		xe_gt_dbg(gt, "EU stall base register has been reset\n");
+		mutex_unlock(&stream->xecore_buf_lock);
+		return -EBADFD;
+	}
 
 	for_each_dss_steering(xecore, gt, group, instance) {
 		ret = xe_eu_stall_data_buf_read(stream, buf, count, &total_size,
@@ -609,7 +630,8 @@ static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
 	 * We don't want to block the next read() when there is data in the buffer
 	 * now, but couldn't be accommodated in the small user buffer.
 	 */
-	stream->pollin = false;
+	if (!stream->reset_detected)
+		stream->pollin = false;
 
 	return ret;
 }
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
2.48.1

