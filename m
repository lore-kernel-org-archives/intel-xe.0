Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0AAD597AF
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 22:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A07D10E1D0;
	Tue, 12 Nov 2024 22:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Upl/Z5oU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6390910E672
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 22:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731448857; x=1762984857;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=P/bbItVDwPdykY0uPBwuT+CV1JY0ZZMIC55puf9s2Q0=;
 b=Upl/Z5oUOkMvNlAaKxbe9eDRYaSsyThSB0gpfXITbVV2W9xDqIqJkH9X
 +bCegX6K692dAgRA41xWT7aI40nutaa/K5TITnV11eYDFwSJ62TM2L16F
 SQtFwu4Yds26lj5KAT2Ln5dkum5sB2qGFk+xpb00GWBafJRpaeir/pspW
 YJBzR4R9Nyv/dc4s0u3fssI02uqaLZVJ1IyVSPX1z2rd1n7f7dD3Kk3ra
 T6keav23cp+Jv0vWlK4kg6JeFmfbs+nvVHks5pFwpL6QQIMuttUpAeoKg
 LMQAwtO1XpBFqyLKJbkIIPwPFqZj401CmoZb1fhgVCb+CiVNzoZGYqb7/ w==;
X-CSE-ConnectionGUID: X1F70qW8SHWqlbOK6YHvvw==
X-CSE-MsgGUID: CACGyrlgQ8Cq4PR522cxWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31403994"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31403994"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 14:00:57 -0800
X-CSE-ConnectionGUID: inXudNT5S1aTzHR65zIwtA==
X-CSE-MsgGUID: vvROVHPfTO6bTAEWBvHSxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="118605697"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 14:00:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 2/7] drm/xe: Add ring address to LRC snapshot
Date: Tue, 12 Nov 2024 14:01:22 -0800
Message-Id: <20241112220127.1369527-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112220127.1369527-1-matthew.brost@intel.com>
References: <20241112220127.1369527-1-matthew.brost@intel.com>
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

The ring is currently in LRC BO but this may change going forward.
Include the ring address in the snapshot protecting again any future
changes.

v2:
 - s/ring_desc/ring_addr (Jonathan)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 3 +++
 drivers/gpu/drm/xe/xe_lrc.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index e0d80e8201eb..cc77e5132157 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1636,6 +1636,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 		xe_vm_get(lrc->bo->vm);
 
 	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
+	snapshot->ring_addr = __xe_lrc_ring_ggtt_addr(lrc);
 	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
 	snapshot->head = xe_lrc_ring_head(lrc);
 	snapshot->tail.internal = lrc->ring.tail;
@@ -1693,6 +1694,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 		return;
 
 	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc);
+	drm_printf(p, "\tHW Ring address: 0x%08x\n",
+		   snapshot->ring_addr);
 	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
 		   snapshot->indirect_context_desc);
 	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 9d64cedc4d14..37ca321ed492 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -25,6 +25,7 @@ struct xe_lrc_snapshot {
 	unsigned long lrc_size, lrc_offset;
 
 	u32 context_desc;
+	u32 ring_addr;
 	u32 indirect_context_desc;
 	u32 head;
 	struct {
-- 
2.34.1

