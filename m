Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358F6CCA474
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 06:38:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BB310E336;
	Wed,  1 Oct 2025 06:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kg9TBOE8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A837110E332
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 06:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759300731; x=1790836731;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EWuJzyiHpSEXDNrQVC329gUS9DuIOXEENTQ+/MN0oDY=;
 b=Kg9TBOE8TBs+t6wrY4zGE+BvUi51NenFMUtCsEIIl9w4D1YUmudNkWw/
 ox7YtqYczUhiR1ZTk4est++8d5KeFt42YPhYw1V1/3lyOvFJk6DuncgtJ
 54205AAym/6jsUvcR8yskVqA4P4a5ScYg1zaR07Vhh2zjTfE80nCKKfvp
 bpFgNv1yWXfdZ44jEXCCQZnStQ/KgFlNtPirTlTuqZ5fjDfycOzbPGxJ6
 aSMOL+DTfPUYdJHHcrA7Ryd1myaUhcqmDA5sQhZJYBlmszGiHnph/WOpk
 bGFoR1gTvwXsK1o9vFq1SXUlVc5yEAtdTvjRNQfpHUOxOmfm3ZFaWR+vq A==;
X-CSE-ConnectionGUID: hhtYrj2sTL+FLacnBUXgGQ==
X-CSE-MsgGUID: s/KJ6YwqSJOI5L+Nu7SdeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61615320"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61615320"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 23:38:50 -0700
X-CSE-ConnectionGUID: WkB2QwnjRfOUPgkd34klyQ==
X-CSE-MsgGUID: cTZ1sz/9R3mOeMDWwbkmoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="182997629"
Received: from hchegond-ivm1.jf.intel.com ([10.88.27.163])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 23:38:50 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 1/1] drm/xe/eustall: Return EBADFD from read if EU stall
 registers get reset
Date: Tue, 30 Sep 2025 23:38:43 -0700
Message-ID: <1ce99022596f054b0b248f5a9c5ece7c1084febb.1759300369.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.51.0
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
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index f5cfdf29fde3..39d5f2abe73b 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -516,9 +516,24 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
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
2.51.0

