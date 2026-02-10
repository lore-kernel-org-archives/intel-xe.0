Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4687AEA3F0C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 05:50:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D0810E1A6;
	Tue, 10 Feb 2026 05:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WaaOv+wf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CED10E1A6
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 05:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770702649; x=1802238649;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=afRSzeYF6/V3vfhnw4aOmOwWwYNWpnmFmuInDrmQww0=;
 b=WaaOv+wfVUgCx4jPmfr4kUVOfQrO34WA8AqRHdqsPeCVT/cTWvX5TXPC
 kBcH0e43yRfJYUIqDtg1qwoIPvulM0b7+AOiTEa2VtJQ9Pj9OUfUTp4bH
 /gxwH3t/TL4RLE4mUdzgewKHfR9GQijrlif7gDWl+wVuNlCidcVGEemfQ
 rxW2YDYNzi+YbDoiW4F1R27a3fA9na4oyfopw+wDR/y2mj8zuiKAUd7tE
 9KZKqjOuB99HmLNU7uTRFHsK8KdoyykfdoBWtK4wjKyDTuLL+V5nA34GE
 FQPinYSTKo/Pu5XE9it8YOhIb5O9buCKYME7qumNQdgX/+JCjYRo+oa8N g==;
X-CSE-ConnectionGUID: FK9qnek1R7SdrR6kSvWNFg==
X-CSE-MsgGUID: 2yN1SuILQUSROyhQik413Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="70838053"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="70838053"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 21:50:49 -0800
X-CSE-ConnectionGUID: 2zPVP8m+RqagKy85GUGWmw==
X-CSE-MsgGUID: VIqcznibTfCRJyfbL6MJJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216335423"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 21:50:47 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, nitin.r.gote@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3] drm/xe/xe2: Apply Wa_14024997852
Date: Tue, 10 Feb 2026 11:20:23 +0530
Message-ID: <20260210055023.890477-1-arvind.yadav@intel.com>
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

Applied Wa_14024997852 to Graphics version 20.01 to 20.04
Whitelist registers needed for userspace to control autostrip on xe2.

v2:
   - set Bit 31 of FF_MODE, for TE autostrip disable (Nitin)
v3:
  - Need to whitelist these for Xe2 IPs (MATT R)

Cc: Nitin Gote <nitin.r.gote@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 1d36c09681aa..9881a2d2f10c 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -75,7 +75,8 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 	  XE_RTP_ACTIONS(WHITELIST(CSBE_DEBUG_STATUS(RENDER_RING_BASE), 0))
 	},
 	{ XE_RTP_NAME("14024997852"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER), OR,
+		       GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(WHITELIST(FF_MODE,
 				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
 			 WHITELIST(VFLSKPD,
-- 
2.43.0

