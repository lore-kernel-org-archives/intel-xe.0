Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294D2C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 19:27:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F6210E5FF;
	Wed, 24 May 2023 19:27:01 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFC010E5FF
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 19:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684956419; x=1716492419;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U04EUa+spzMuRryY/TquCkOEKDSXPF0gKFbKkr4SdRo=;
 b=ANOQb0wC7kA5IeSNN6EoEGmwG/7sJV/BYhWV0OJy1mK/b9sfCshfa+HL
 3vrDNpr3YVTPWIF60nI/8S5DOqmxyEbxBS6JWc0xDTTrtSSQnrbSF7HHA
 e8sbDut4CnV+V6Ch7VK0zZJQ6oUXXkkIvDHn/5hqrgenSh1XEx+eNQfeI
 zZThc4PlOlzJAd1oa/rljVUjJDtTVphCvLlgpAnqoT/kY4CCKGcQC7L8Y
 U8TW2g1y7VMIrqcpR3ZDStIXUtdq4FtgTA9i+jT3XYLWSE8UeLrvYGsss
 laeJfArpnnZ228y0vybZ8i6RnsTAqmxawb3sBjKaZRfJVLV1HKcpAyfDk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="353693399"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="353693399"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 12:26:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="682027232"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="682027232"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 12:26:57 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 24 May 2023 12:26:35 -0700
Message-Id: <20230524192635.673293-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/pvc: Don't try to invalidate AuxCCS TLB
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Generally !has_flatccs implies that a platform has AuxCCS compression
and thus needs to invalidate the AuxCCS TLB.  However PVC is a special
case because it has no compression of either type (FlatCCS or AuxCCS)
so we should avoid writing to non-existent AuxCCS registers.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 74c1b5dfbaee..d2fa0b4c8bcc 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -190,6 +190,18 @@ static void __emit_job_gen12_copy(struct xe_sched_job *job, struct xe_lrc *lrc,
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
 }
 
+static bool has_aux_ccs(struct xe_device *xe)
+{
+	/*
+	 * PVC is a special case that has no compression of either type
+	 * (FlatCCS or AuxCCS).
+	 */
+	if (xe->info.platform == XE_PVC)
+		return false;
+
+	return !xe->info.has_flat_ccs;
+}
+
 static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 				   u64 batch_addr, u32 seqno)
 {
@@ -202,7 +214,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 	dw[i++] = preparser_disable(true);
 
 	/* hsdes: 1809175790 */
-	if (!xe->info.has_flat_ccs) {
+	if (has_aux_ccs(xe)) {
 		if (decode)
 			i = emit_aux_table_inv(gt, VD0_AUX_NV, dw, i);
 		else
@@ -248,7 +260,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	i = emit_pipe_invalidate(mask_flags, dw, i);
 
 	/* hsdes: 1809175790 */
-	if (!xe->info.has_flat_ccs)
+	if (has_aux_ccs(xe))
 		i = emit_aux_table_inv(gt, GFX_CCS_AUX_NV, dw, i);
 
 	dw[i++] = preparser_disable(false);
-- 
2.40.1

