Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D6ED43FFB
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 09:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDDE10E46B;
	Mon, 18 Nov 2024 09:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TkxpiFSg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7225810E451
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Nov 2024 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731920846; x=1763456846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6SBDslFOXO9C8+dpSdyRI7j5CXVYOp9ZqjM/gnoF4uE=;
 b=TkxpiFSgQL/rUPjm7NVzXc0cATRdK28McMU1RF8rnLp+QzeDREhlnnf6
 2T8EZrDSKZNnuJcSAgbqqW3YZe7QMVSqxDtPJbeOMYWMpmLz9gEB6/cL+
 4JuiUjuUSR9ZctcjYpfHhgVaQqP4NxSZA9yUylnmrWrSuVzVogTNmkkQn
 mUwPfokmOau+/HiZMFhZm+q5vrFEwBUdzbu1WPJnuyYv252NsmwbVe9ua
 /n/6xBz2d5RiQWkNWbFzy6PwAZZc1egl7v/mcDM2iTPg59/fpG0NY3fhS
 LFh3FVbvXXPvnSd3B4Qtoyf5+pGosdZ4sQz01egqAIqtuJjvh7h3gw5uJ A==;
X-CSE-ConnectionGUID: ttPRBVpVRLeaMkwjkHdr8Q==
X-CSE-MsgGUID: 3mWBMHHuThmZOr5vgbQ0dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31242927"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="31242927"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 01:07:25 -0800
X-CSE-ConnectionGUID: ksGrKWWES42khP/SSUXWkw==
X-CSE-MsgGUID: 2dg0t9fKTv6LiNvfpm+/dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="126705155"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 01:07:24 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, jose.souza@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 matthew.d.roper@intel.com, matthew.olson@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v5 4/7] drm/xe/eustall: Return -EIO error from read() if HW
 drops data
Date: Mon, 18 Nov 2024 01:07:16 -0800
Message-ID: <4f0339304d9593b0143c484e2bdee9d3c6029917.1731919693.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1731919693.git.harish.chegondi@intel.com>
References: <cover.1731919693.git.harish.chegondi@intel.com>
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

If the user space doesn't read the EU stall data fast enough,
it is possible that the EU stall data buffer can get filled,
and if the hardware wants to write more data, it simply drops
data due to unavailable buffer space. In that case, hardware
sets a bit in a register. If the driver detects data drop,
the driver read() returns -EIO error to let the user space
know that HW has dropped data. The -EIO error is returned
even if there is EU stall data in the buffer. A subsequent
read by the user space returns the remaining EU stall data.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_eu_stall.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 5c69f68acb98..96ac08cc7bf2 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -468,6 +468,7 @@ xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *stream,
  * before calling read().
  *
  * Returns: The number of bytes copied or a negative error code on failure.
+ *	    -EIO if HW drops any EU stall data when the buffer is full.
  */
 static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
 				       size_t count, loff_t *ppos)
@@ -481,6 +482,16 @@ static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
 		return -EINVAL;
 	}
 
+	if (bitmap_weight(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS)) {
+		if (!stream->data_drop.reported_to_user) {
+			stream->data_drop.reported_to_user = true;
+			xe_gt_dbg(gt, "EU stall data dropped in XeCores: %*pb\n",
+				  XE_MAX_DSS_FUSE_BITS, stream->data_drop.mask);
+			return -EIO;
+		}
+		stream->data_drop.reported_to_user = false;
+	}
+
 	if (!(file->f_flags & O_NONBLOCK)) {
 		do {
 			if (!stream->pollin) {
@@ -672,6 +683,7 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
 	if (!stream->xecore_buf)
 		return -ENOMEM;
 
+	stream->data_drop.reported_to_user = false;
 	bitmap_zero(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS);
 
 	xe_pm_runtime_get(gt_to_xe(gt));
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
index 00896812db41..d9482e1b522b 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.h
+++ b/drivers/gpu/drm/xe/xe_eu_stall.h
@@ -31,6 +31,7 @@ struct xe_eu_stall_data_stream {
 	struct xe_bo *bo;
 	struct per_xecore_buf *xecore_buf;
 	struct {
+		bool reported_to_user;
 		xe_dss_mask_t mask;
 	} data_drop;
 	struct hrtimer poll_check_timer;
-- 
2.45.1

