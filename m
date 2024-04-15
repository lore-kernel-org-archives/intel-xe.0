Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9375FC00A94
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 19:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2F511218A;
	Mon, 15 Apr 2024 19:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ErJOt6b+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951D010FF80
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 19:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713207687; x=1744743687;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QRdn782d0K9F0PqK1lmQy4d/YF3s8KrQ/yJFV55UZC8=;
 b=ErJOt6b+KjrCw9qDlzMSauOIJvBLtqr1zKYBNb0x7BoinwnxwVpO/03y
 guBngCSpWvAO74GRyihAcRqnChKN7yqrWwVQZh1flUep2tU6KyIrzmcPT
 M0cXVu/4yPeN2zt7CoMWlJXsWAvsRimii5reGvzbkTqciDLEK/WQmbUxX
 AvtfmSOHJptDO5xKHqRM3Eq1nlp4cYGHjP3At8pG/8f2LyvaIzBCoP/Ha
 NdbWdzLZct3ZGQN4CLzgGz/B+GhBtwNSeNoPG5+V3MFRlUu0exUD0EZk3
 IzwghJCas/oOInyrILuU8ZG/rI65AWL78sbkiLhzusfx5NWhntIT8yEO5 Q==;
X-CSE-ConnectionGUID: x5FE+kETTYaGBO1cZoq1Sw==
X-CSE-MsgGUID: WsFlFXSWTZ6OiO9wOkZaqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19765668"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="19765668"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 12:01:26 -0700
X-CSE-ConnectionGUID: SIPjlhHJQrqkklFb8CiOWA==
X-CSE-MsgGUID: IlLQ2dD3QdWcJV6rFdG1hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22094960"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 12:01:26 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
 niranjana.vishwanathapura@intel.com, brian.welty@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 john.c.harrison@intel.com
Subject: [PATCH v5 1/4] drm/xe/lrc: Add xe lrc ring tail function definitions
Date: Mon, 15 Apr 2024 11:46:05 -0700
Message-Id: <20240415184608.2918959-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add defintions for the functions xe_lrc_set_ring_tail and
xe_lrc_ring_tail to match the definitions for xe_lrc_set_ring_head and
xe_lrc_ring_head, respectively, except tarting the lrc tail.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: Brian Welty <brian.welty@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_lrc.h |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 615bbc372ac62..e91ecbcceba5c 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -834,6 +834,16 @@ void xe_lrc_finish(struct xe_lrc *lrc)
 	xe_bo_put(lrc->bo);
 }
 
+void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail)
+{
+	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, tail);
+}
+
+u32 xe_lrc_ring_tail(struct xe_lrc *lrc)
+{
+	return xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL) & TAIL_ADDR;
+}
+
 void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head)
 {
 	xe_lrc_write_ctx_reg(lrc, CTX_RING_HEAD, head);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index d32fa31faa2cf..f355b0eeb5658 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -24,6 +24,8 @@ void xe_lrc_finish(struct xe_lrc *lrc);
 size_t xe_lrc_size(struct xe_device *xe, enum xe_engine_class class);
 u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
 
+void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail);
+u32 xe_lrc_ring_tail(struct xe_lrc *lrc);
 void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head);
 u32 xe_lrc_ring_head(struct xe_lrc *lrc);
 u32 xe_lrc_ring_space(struct xe_lrc *lrc);
-- 
2.25.1

