Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FD5F53D83
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 17:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22D310E2CB;
	Mon, 16 Mar 2026 17:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WraK+xZz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513FF10E2CB
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 17:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773683950; x=1805219950;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D4nQrusnacyYm+MWumDHhSWXjQiuS93w9FupOLYvUj0=;
 b=WraK+xZz8Qh3MuzVNp7mwbnLfVHsYDfgZrTsf7pyg6CZvlfX+UKsOXbD
 p9fDRyFp6o1EaDeZv5gAiF5mXZcTEpfPMScSQX9OtIQQpjsq7q9BllnKf
 McvKj18EZHbCCJnG/Vgir+u+6TaeXT1U/ZhfStale9UrYAM5y1UKNulPP
 FZpUW78kvCdqMz3/5ZN5TIVszMaOT5LbOVag8kgGk1mpzqW0YG4Y062oK
 HFODyE1m+G4RJR4gTGNYL6nFNeH6/L5dCbpKVjzIbXxy9ADACZOqVP2Xf
 UVmicY65l93ECQiT4yF5jEQGhkdcwJ0Uk/FYtGRAX2Na7Rodfed/YkRCl w==;
X-CSE-ConnectionGUID: Az9SXbQpQhqjTFtr5SFY7Q==
X-CSE-MsgGUID: SOOrU5mcTF26IQFbVqnF8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74681282"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74681282"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 10:59:04 -0700
X-CSE-ConnectionGUID: UhlEmDpTRKyJeXoZVYhfDA==
X-CSE-MsgGUID: 01fF06M3SFGOka/GoGUvXw==
X-ExtLoop1: 1
Received: from hchegond-desk.jf.intel.com ([10.88.27.198])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 10:59:03 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: felix.j.degrood@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH v2 1/1] drm/xe/eustall: Return EBADFD from read if EU stall
 registers get reset
Date: Mon, 16 Mar 2026 10:58:56 -0700
Message-ID: <52d991cc7e8bec514bb582717a1c42033672d4a5.1773683739.git.harish.chegondi@intel.com>
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
If this happens, return EBADFD from read() upon which the user space
should close the fd and open a new fd for a new EU stall data
collection session.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
v2: Move base register check from read to the poll function

 drivers/gpu/drm/xe/xe_eu_stall.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index c34408cfd292..7e14de73a2c9 100644
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
@@ -428,6 +429,17 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
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
+	if (unlikely(!xe_gt_mcr_unicast_read_any(gt, XEHPC_EUSTALL_BASE))) {
+		stream->reset_detected = true;
+		min_data_present = true;
+	}
 	mutex_unlock(&stream->xecore_buf_lock);
 
 	return min_data_present;
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
@@ -692,6 +713,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 		xecore_buf->write = write_ptr;
 		xecore_buf->read = write_ptr;
 	}
+	stream->reset_detected = false;
 	stream->data_drop.reported_to_user = false;
 	bitmap_zero(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS);
 
@@ -717,7 +739,7 @@ static void eu_stall_data_buf_poll_work_fn(struct work_struct *work)
 		container_of(work, typeof(*stream), buf_poll_work.work);
 	struct xe_gt *gt = stream->gt;
 
-	if (eu_stall_data_buf_poll(stream)) {
+	if (stream->reset_detected || eu_stall_data_buf_poll(stream)) {
 		stream->pollin = true;
 		wake_up(&stream->poll_wq);
 	}
-- 
2.43.0

