Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8FBC4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 06:45:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2814610EB11;
	Tue, 13 Feb 2024 06:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJ66nw83";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A941A10EB4F
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 06:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806672; x=1739342672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qX8T2pU1Zy+ViRYVCrhrQml7LkjaiG/Xbn1eU5bOMTY=;
 b=FJ66nw835Nfejdf9NIBs+vdnzZLfi7xOfFqWH0TEQhLvt3YKlv1EA/xk
 Dtke6xb9uxLXQhBTZfGJuAFAYfdUdv7Z4815T76G1YLmquM0pBvugKC1s
 nDaqXmmXZBVQuq5DJx106nuUsWZlg/vlc40ZUcOcViHkQMmOpDHQIOOdp
 v7FZYYhn6t60ck6NGz7ccQqfAvmx0rfW2/xjRBkJEwvnShe2njp16kuic
 36UcjZ/gXSvwEhh75x33WgnGHrpe53xuZlv7KCV79VX4+eXmpRbi2+G38
 wKDWQxO33NK/sXlnpeJjJQfLpFTBbCtZ4GEvhtBIJTKToE966eG2lLkoA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="5621239"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="5621239"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:44:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="33599807"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:44:31 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 10/16] drm/xe/oa: Disable overrun mode for Xe2+ OAG
Date: Mon, 12 Feb 2024 22:44:17 -0800
Message-ID: <20240213064423.131601-11-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240213064423.131601-1-ashutosh.dixit@intel.com>
References: <20240213064423.131601-1-ashutosh.dixit@intel.com>
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

Xe2+ OAG requires special handling because non-power-of-2 report sizes are
not a sub-multiple of the OA buffer size and there are no partial reports
at the end of the buffer. This issue is present only when overrun mode is
enabled. Avoid adding this special handling by disabling overrun mode for
Xe2+ OAG.

v2: Disable overrun mode when time based sampling is enabled

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_oa_regs.h | 1 +
 drivers/gpu/drm/xe/xe_oa.c           | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
index 00d0c9763e8da..09d6d4f169f52 100644
--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
@@ -52,6 +52,7 @@
 #define  OABUFFER_SIZE_4M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 5)
 #define  OABUFFER_SIZE_8M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 6)
 #define  OABUFFER_SIZE_16M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 7)
+#define  OAG_OABUFFER_DISABLE_OVERRUN_MODE	REG_BIT(1)
 #define  OAG_OABUFFER_MEMORY_SELECT		REG_BIT(0) /* 0: PPGTT, 1: GGTT */
 
 #define OAG_OACONTROL				XE_REG(0xdaf4)
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 3349b9d6cde92..c7b86771d0c28 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -365,6 +365,14 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
 			gtt_offset & OAG_OAHEADPTR_MASK);
 	stream->oa_buffer.head = 0;
 
+	/*
+	 * For Xe2+, OAG buffer is not a multiple of report size and there are no partial
+	 * reports at the end of the buffer when overrun mode is enabled. Disable overrun
+	 * mode to avoid this issue.
+	 */
+	if (GRAPHICS_VER(stream->oa->xe) >= 20 &&
+	    stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG && stream->sample)
+		oa_buf |= OAG_OABUFFER_DISABLE_OVERRUN_MODE;
 	/*
 	 * PRM says: "This MMIO must be set before the OATAILPTR register and after the
 	 * OAHEADPTR register. This is to enable proper functionality of the overflow bit".
-- 
2.41.0

