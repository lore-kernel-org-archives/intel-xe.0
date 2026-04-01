Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1455F1076374
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 06:15:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5DA10EC19;
	Wed,  1 Apr 2026 06:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VYvAoSt+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572A110EC14
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 06:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775024151; x=1806560151;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xXK9XjtwCP3IkWosug4u9I7/aHA/oidw5FFZwE7hZ3o=;
 b=VYvAoSt+u897S3AqIGBlbhLc/azVIy5KXgTvLZ6YSID1KYSl4tAL30OL
 aZaF9IhOZsHTUGy1czCfHfi7vggwy2mcrUOH+t54tOWachYY7UcplAaZE
 E0ewxhQGUaIZWgtt/sqeFYK6D8WJrr1ZEZeiFCaFP+cg/tU+h615McyrI
 DI5kyCyjFhBkQ7iXU7A9sHoL9Zc/aP1oPYTpGdHCpD1FEGd+zPKP+RSay
 YsbdxTjEG6yP6F4qyqJ3JMnNfJI7k0+wpPD4C+5RKnUDNfYC2vR1ZNgcj
 v0dCKkInM6VgSdjMiS79VJrQJUIwrY9lhUOvRXpReq2uujWRqH+iMeXhS g==;
X-CSE-ConnectionGUID: 1vuBeTemTta3l211lYh5RA==
X-CSE-MsgGUID: XyUnLCXDQcebD8Kbq7COMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="63603018"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="63603018"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 23:15:51 -0700
X-CSE-ConnectionGUID: C/nVhDpRQ4GqU0AKfIXt5Q==
X-CSE-MsgGUID: No3Dyzy/Ssi+5IZKvM3iWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="225575823"
Received: from hchegond-desk.jf.intel.com ([10.88.27.198])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 23:15:50 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: felix.j.degrood@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, ashutosh.dixit@intel.com,
 umesh.nerlige.ramappa@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v4 1/1] drm/xe/eustall: Return ENODEV from read if EU stall
 registers get reset
Date: Tue, 31 Mar 2026 23:15:44 -0700
Message-ID: <4360d082795f1e16e338de7f253926b1680e0beb.1775023744.git.harish.chegondi@intel.com>
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

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
v2: Move base register check from read to the poll function
v3: Don't reschedule work item after reset detected (Ashutosh)
v4: Return ENODEV as errno instead of EBADFD
    Reset reset_detected in enable()

 drivers/gpu/drm/xe/xe_eu_stall.c | 39 +++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index c34408cfd292..8863d8ebd5d1 100644
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
+	 * the user space. Just return -ENODEV instead.
+	 */
+	if (unlikely(stream->reset_detected)) {
+		xe_gt_dbg(gt, "EU stall base register has been reset\n");
+		mutex_unlock(&stream->xecore_buf_lock);
+		return -ENODEV;
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
@@ -692,6 +714,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 		xecore_buf->write = write_ptr;
 		xecore_buf->read = write_ptr;
 	}
+	stream->reset_detected = false;
 	stream->data_drop.reported_to_user = false;
 	bitmap_zero(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS);
 
@@ -717,13 +740,13 @@ static void eu_stall_data_buf_poll_work_fn(struct work_struct *work)
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

