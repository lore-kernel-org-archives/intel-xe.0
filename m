Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F39CC54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 05:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245DE112714;
	Tue,  5 Mar 2024 05:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hD0HXeuq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58F51126D2
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 05:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709616811; x=1741152811;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kehr7TbGET0dEuTJiqQej4AfvAspeFYfjH9o+pOVJVI=;
 b=hD0HXeuq26f1XsjWHb3PZGbzxfv1yTFQS5sDDFRPXPoh93cZ/RjTkY2S
 J3TA3OUj4row//sdfw5yPc7rzH6me9QbqIslY9mjoaW7QOEVueB+JxwS9
 SqpisNx3R0D6Wgg4wd8jKwGXndUaRgRj0rcebSt+tRdTUJChvgovCajvb
 NQgPKcQNcGWBuVTixAWIYe07u5kZnOo+kC7NlBIBfNx+x5WoBvBDDoFbS
 EGD/rsPRvykcdTWSv0oMi+jB0Dt6NCrT4OZvILE1XAh714huxS7BX6wpL
 lg3tQgU4sYlT9VjpNU/1OiW0x0LrPQKeJNYzwLFNBSLwFjF6MG9TYtIv5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21601506"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="21601506"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 21:33:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9660211"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 21:33:12 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 10/16] drm/xe/oa: Disable overrun mode for Xe2+ OAG
Date: Mon,  4 Mar 2024 21:32:54 -0800
Message-ID: <20240305053300.2406240-11-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240305053300.2406240-1-ashutosh.dixit@intel.com>
References: <20240305053300.2406240-1-ashutosh.dixit@intel.com>
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
index 00d0c9763e8d..09d6d4f169f5 100644
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
index 6e8f8bc97254..35260bffdae9 100644
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

