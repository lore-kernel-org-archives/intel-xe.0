Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8638C3600B
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 23:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A5E10E95A;
	Thu, 27 Mar 2025 23:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l+hMYM/4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930AE10E249
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Mar 2025 23:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743118833; x=1774654833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/naip4LjsZCvIeIBwxGp+MiZczvOIbyydo7YS3OVRCA=;
 b=l+hMYM/4d70k18JYU3mDbRgzcGmxJv5tZ6IfP+PrdFs3B1UdkxLi+5OF
 GOJGGpJtB+4im4S52EfB5DruW36hce3+1pEv0Tn6HpqqC4wU7JZ7D/bYs
 Xmkx+sDTGdU4f8qUfPqoNAVRfryRM9YW/2qsreKAWI0hSJY6lHygGydQQ
 OB3v6XqfOLSIEMhfGS0ww2Xb4IygtTlOVE4QX8q7cWmmDqAcNSq2N4yKR
 w8d9DEcnqVxtDkkUMI2J286udAPbqWoVi3PNtjluNsNw0JbEVrQQwIaBD
 e9AMjtbQuOa9MgMMUxm2HyPPdMbBINBx/IC+zOjSovKoVPvUd8xU6WI7W w==;
X-CSE-ConnectionGUID: qmEjgoxjT6SfFpGd/XR2JQ==
X-CSE-MsgGUID: 4svFp9h8S1iB1gj4i0dNuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43714323"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="43714323"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 16:40:30 -0700
X-CSE-ConnectionGUID: rKs/ABN3Q6utNobjHOc8UA==
X-CSE-MsgGUID: xGEkqV+dRCKTjJgzicnPPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="125262918"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa007.fm.intel.com with ESMTP; 27 Mar 2025 16:40:29 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v2 2/2] drm/xe/guc: Only add GuC crash dump if available
Date: Thu, 27 Mar 2025 16:40:28 -0700
Message-Id: <20250327234028.249314-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327234028.249314-1-zhanjun.dong@intel.com>
References: <20250327234028.249314-1-zhanjun.dong@intel.com>
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

Add flag of GuC crash dump received. LFD only include crash dump
section when crash dump is available.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c        | 13 +++++++-----
 drivers/gpu/drm/xe/xe_guc_log.c       | 30 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_log_types.h |  2 ++
 3 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 72ad576fc18e..44c11ec662e5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1127,12 +1127,15 @@ static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
 {
 	struct xe_gt *gt = ct_to_gt(ct);
 
-	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
+	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED) {
 		xe_gt_err(gt, "GuC Crash dump notification\n");
-	else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
-		xe_gt_err(gt, "GuC Exception notification\n");
-	else
-		xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
+		ct_to_guc(ct)->log.crash_dumped = true;
+	} else {
+		if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
+			xe_gt_err(gt, "GuC Exception notification\n");
+		else
+			xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
+	}
 
 	CT_DEAD(ct, NULL, CRASH);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 5659d60e41ab..29684393a62d 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -536,6 +536,36 @@ static uint xe_guc_log_save_to_lfd_buf(char *buf, int size, u32 *guc_log_bin,
 		return len;
 	index += len;
 
+	/* For Crash dump, rd/wr ptr has no effect, only add if crash_dumped is true */
+	if (log->crash_dumped) {
+		struct guc_log_buffer_entry_list *entry;
+
+		entry = &entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH];
+		if (entry->buf_size) {
+			int i;
+			u32 *buf32 = (u32 *)&bin[entry->offset];
+
+			/* Check if crash dump section are all zero */
+			for (i = 0; i < entry->buf_size / 4; i++)
+				if (buf32[i])
+					break;
+
+			/* Buffer has non-zero data */
+			if (i < entry->buf_size / 4) {
+				len = xe_guc_log_add_typed_payload(&buf[index], size - index,
+								   GUC_LFD_TYPE_FW_CRASH_DUMP,
+								   entry->buf_size,
+								   &bin[entry->offset]);
+				if (len < 0)
+					return len;
+				index += len;
+
+				/* Clear flag */
+				log->crash_dumped = false;
+			}
+		}
+	}
+
 	return index;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
index b3d5c72ac752..d351f639727b 100644
--- a/drivers/gpu/drm/xe/xe_guc_log_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
@@ -46,6 +46,8 @@ struct xe_guc_log {
 	u32 level;
 	/** @bo: XE BO for GuC log */
 	struct xe_bo *bo;
+	/** @crash_dumped: Indicate if crash dumped */
+	bool crash_dumped;
 	/** @stats: logging related stats */
 	struct {
 		u32 sampled_overflow;
-- 
2.34.1

