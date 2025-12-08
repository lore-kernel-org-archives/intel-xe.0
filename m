Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C49CEBF88
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 06:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEE810E110;
	Mon,  8 Dec 2025 06:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oC0mqo1a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F89610E110
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 06:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765174577; x=1796710577;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EWKLymRMJ5OjGwNibvHEkj1CTAHFe++aiuxOTYgwJIk=;
 b=oC0mqo1a8AU73qIxRcmfEjj1qVyeugQN2s9FXg7z9sNA++GiTf0fuCHw
 kyP6QlpYxj1/3pRCaEFqq/qF708fx+61+H+NDK/Lj15geFiLSSszE1AV6
 HWg7KRQJrB0ivVrolNIhdDEd44lAg8ZoQ75LH1AAHXbeHuZWX+gIT/Xwa
 +g/3ZfiBYXwKcnstY19+0I3NxIFp4z18wzhRBiR6JMMuxzOQNCdP/3oDe
 OraQDKfPpEkB8WaT4Vwp+JsHWD5tssyR/ERgY1CUoBC2uI1ry22WmiJNR
 YI5Nkm8GwP2hq8YIWs5ugn0tt51qPc4JrphtrkTYGtN4D2MdhmspGo8tc A==;
X-CSE-ConnectionGUID: LMn3ok1JQrmVvLxKKGbADA==
X-CSE-MsgGUID: 6POSWVWdRT6A5YPgpE5FnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67277435"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="67277435"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 22:16:17 -0800
X-CSE-ConnectionGUID: Yf2dc7bGRhqxLQ14wZi5tA==
X-CSE-MsgGUID: ygA6vA1NRpic5xOcDwTruw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="200769129"
Received: from hchegond-desk.jf.intel.com ([10.88.27.198])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 22:16:16 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 1/1] drm/xe/eustall: Return EBADFD from read if EU stall
 registers get reset
Date: Sun,  7 Dec 2025 22:16:11 -0800
Message-ID: <6d78578c015b12e7ae243727ca7ed4b93551075d.1765174462.git.harish.chegondi@intel.com>
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
the cached values. This can result in read() returning invalid data. To
prevent this, check the value of a EU stall base register. If it is zero,
it indicates a reset may have happened that wiped the register to zero.
If this happens, return EBADFD from read() upon which the user space
should close the fd and open a new fd for a new EU stall data
collection session.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 97dfb7945b7a..02c0beb4559f 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -541,9 +541,24 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
 	size_t total_size = 0;
 	u16 group, instance;
 	unsigned int xecore;
+	u32 base_reg_value;
 	int ret = 0;
 
 	mutex_lock(&stream->xecore_buf_lock);
+	/* If a GT or engine reset happens during EU stall data sampling,
+	 * all EU stall registers get reset to 0 and the cached values of
+	 * EU stall data buffers' read and write pointers are out of sync
+	 * with the register values. This can cause invalid data to be
+	 * returned from read(). To prevent this, check the value of a
+	 * EU stall base register. If it is zero, return -EBADFD. The
+	 * user is expected to close the fd and open a new fd.
+	 */
+	base_reg_value = xe_gt_mcr_unicast_read_any(gt, XEHPC_EUSTALL_BASE);
+	if (unlikely(!base_reg_value)) {
+		xe_gt_dbg(gt, "EU stall base register has been reset to 0\n");
+		mutex_unlock(&stream->xecore_buf_lock);
+		return -EBADFD;
+	}
 	if (bitmap_weight(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS)) {
 		if (!stream->data_drop.reported_to_user) {
 			stream->data_drop.reported_to_user = true;
-- 
2.43.0

