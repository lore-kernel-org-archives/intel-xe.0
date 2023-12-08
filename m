Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37091C10F09
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D5310E9DF;
	Fri,  8 Dec 2023 06:43:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A42210E9D7
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702017816; x=1733553816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=igrlWUyaR2CdZf7Mp73vdP+ADyEPSCxWZNy6jAoakfA=;
 b=Vs0inhZSS7IZ8pqTRbfLwK41f8ijjq+IQMRW7O6o9ptH1ymoOgTCUVsy
 uFMlu7vO7H4sqFkXa+034qNXPIXckZshoTbgEybVqvrnXoMPDPHBbCInt
 HK3NpQ6kJ5epn4/LU96FVU9BkigHI/hhLyfOLYD4TfqU8r5sfU+CeZWkD
 hbF6dEH53KO8XomFS0kgSFJYp0GN5+6R49tThwDh2m6ha8WJdgRnnhVcD
 6SKHmpi3KlRlRlJ/j9NJdul2rTuyt5EwE3pnxu9G0oK6U2C3fyIj4y1Ka
 AzWh8ez5F2ZenTfsB9PDh0zLyan6edE2U1PgzLnyHccl/nt94xKuDPxQF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373866612"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="373866612"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="775699254"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="775699254"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:35 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 11/17] drm/xe/oa: Disable overrun mode for Xe2+ OAG
Date: Thu,  7 Dec 2023 22:43:23 -0800
Message-ID: <20231208064329.2387604-12-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
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

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_oa_regs.h | 1 +
 drivers/gpu/drm/xe/xe_oa.c           | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
index 4455a5a42b01b..7e2e875ccf80a 100644
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
index 5744436188dcd..073476721377d 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -408,6 +408,14 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
 			gtt_offset & OAG_OAHEADPTR_MASK);
 	stream->oa_buffer.head = 0;
 
+	/*
+	 * For Xe2+, OAG buffer is not a multiple of report size and there are no partial
+	 * reports at the end of the buffer when overrun mode is enabled. Disable overrun
+	 * mode to avoid this issue.
+	 */
+	if (GRAPHICS_VER(stream->oa->xe) >= 20 &&
+	    stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG)
+		oa_buf |= OAG_OABUFFER_DISABLE_OVERRUN_MODE;
 	/*
 	 * PRM says: "This MMIO must be set before the OATAILPTR register and after the
 	 * OAHEADPTR register. This is to enable proper functionality of the overflow bit".
-- 
2.41.0

