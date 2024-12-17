Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66413E77187
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 09:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFA710E8D3;
	Tue, 17 Dec 2024 09:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kq32K+ji";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E894710E8CB
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 09:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734428833; x=1765964833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mXrzc3QhCX2jfkvBfXO5O0z4nwjAzeIBxWcu9FV+WZI=;
 b=Kq32K+jidzOfdxAATA8Vg6qOfO1A2VQJjd1PiBvZe7rUYzmVjiulrG/C
 4kP1db4wiWh2ySumSMnlLajcWKNvpmwZxujb4gIevdTtoLt3/AfTgNJqT
 AcT5AlGDrOCy7V3fV0Wm/4POhwwqUOQ3M6f376RCcHnfQ1mu5vHrGaVUT
 EMOj6YekRsNvkD6wpxQhcMuZxozER+DR62el3c3pOf6SqCBnyWFS5wHBw
 DQ5kPsyFnv6atUNmiAYVRf9TLG/zchM+at6uR8guabmu4bsHoLN/4o1/5
 nwvKw76OFCJ3dgVqBv3IbGlx9kiq+c5P5rTNn76fzQ6ai6EWXPQJsqJvL g==;
X-CSE-ConnectionGUID: Y+1yIWssRmmms4uJecPutg==
X-CSE-MsgGUID: nFb7utuTTuOB3BLT+yk8Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46238184"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="46238184"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 01:47:12 -0800
X-CSE-ConnectionGUID: 6cl4DskkQW2Mjvr4Rb0tjA==
X-CSE-MsgGUID: qyKuO//MQjud1ONwBREsjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="97364660"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 01:47:12 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 matthew.d.roper@intel.com, matthew.olson@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v6 4/7] drm/xe/eustall: Return -EIO error from read() if HW
 drops data
Date: Tue, 17 Dec 2024 01:46:54 -0800
Message-ID: <42806e64c19aaf6ca80f408843782db64c0d6a95.1734427624.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1734427624.git.harish.chegondi@intel.com>
References: <cover.1734427624.git.harish.chegondi@intel.com>
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
index 1d13219a3eb0..868f75a53b60 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -472,6 +472,7 @@ xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *stream,
  * before calling read().
  *
  * Returns: The number of bytes copied or a negative error code on failure.
+ *	    -EIO if HW drops any EU stall data when the buffer is full.
  */
 static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
 				       size_t count, loff_t *ppos)
@@ -485,6 +486,16 @@ static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
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
@@ -680,6 +691,7 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
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
2.47.0

