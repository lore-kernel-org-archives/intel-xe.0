Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4362FEEA850
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 20:42:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED03510E2AD;
	Thu, 12 Feb 2026 20:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HuDAm8Pj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31C210E2AA
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 20:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770928961; x=1802464961;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kNrw09A9fK/gZB31tM0dM5sUnmvOY5zMfX8iy5bzo7M=;
 b=HuDAm8Pj+/520vmRyOFJVGtFJCcZ95wykeSGO3aJkywSTfDF4vdscKOE
 7Zyi+DJd9of4nPehlG1iL43vEMzePch2Zn9HGfl98fRI8JBOeUFuAkHlK
 1X1xjDz9qCz8Yp3B6aW7kG339kPhi95wbPEgKrpiVBfqWn8LuVqA63F9w
 7eurjfU8hnb6mcVRVaMS5a+0QOjfLRpsd9yOwnWutLLr3cAXnTdacElqk
 AtYLKHBV2evwz4t4NelNkmxyLW831CLhDCFaOdDfSPPWSSWPDJtx0J9Ob
 c439zlvnEYO8L7smu2+amF3H9+zB3jH7GTFlL4MiY7unVrQIbOXUFK/0I g==;
X-CSE-ConnectionGUID: RGz/79/7RnCDq6RTfxv/bA==
X-CSE-MsgGUID: ww7BT3MNSdWrZB78LtDQbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89696424"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="89696424"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 12:42:35 -0800
X-CSE-ConnectionGUID: B60V3s0lSRuv9sbTivPSLA==
X-CSE-MsgGUID: Ogg4HWNARPm08CA55EYtag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="211527616"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 12:42:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe: Avoid touching consumer fields in GuC pagefault
 ack
Date: Thu, 12 Feb 2026 12:42:27 -0800
Message-Id: <20260212204227.2764054-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260212204227.2764054-1-matthew.brost@intel.com>
References: <20260212204227.2764054-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The GuC pagefault acknowledgement code is designed to extract the fields
needed for the acknowledgement from the producer-stored message so that
the consumer fields can be overloaded to return additional information.
The ASID is stored in the producer message; extract it from there to
future‑proof this logic.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pagefault.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index 1166b0a5fa21..d48f6ed103bb 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -17,6 +17,7 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
 	u32 pdata = FIELD_GET(PFD_PDATA_LO, pf->producer.msg[0]) |
 		(FIELD_GET(PFD_PDATA_HI, pf->producer.msg[1]) <<
 		 PFD_PDATA_HI_SHIFT);
+	u32 asid = FIELD_GET(PFD_ASID, pf->producer.msg[1]);
 	u32 action[] = {
 		XE_GUC_ACTION_PAGE_FAULT_RES_DESC,
 
@@ -24,7 +25,7 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
 		FIELD_PREP(PFR_SUCCESS, !!err) |
 		FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
 		FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
-		FIELD_PREP(PFR_ASID, pf->consumer.asid),
+		FIELD_PREP(PFR_ASID, asid),
 
 		FIELD_PREP(PFR_VFID, vfid) |
 		FIELD_PREP(PFR_ENG_INSTANCE, engine_instance) |
-- 
2.34.1

