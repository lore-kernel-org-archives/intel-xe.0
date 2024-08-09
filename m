Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD2CC531DB
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 16:52:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFA210E995;
	Fri,  9 Aug 2024 16:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SxkCoDEu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A9B10E997
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 16:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723222343; x=1754758343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PyQuEum/nmCTJZ8TUqTg/8/geDKg0VOHkqMvYFJpbxQ=;
 b=SxkCoDEufWNDwV084FOHKBYZKYtQ0VAHNNE2QIV2MZIo8xeJkoblNSsi
 Uhyo43j3p2dRd1L06XeO27goWtveWJX3IxzlUjv4VI9woAnNN3x5Cz4Fj
 KIEHePLab7C9NA4rotes0V2W2n5cTok46sQaRt8YuExSe3aHJ/tX9V4WX
 4E9swSmK2q4ewgoq/5uBn7GIrxYsaCyMCLoi+b0yrXgDaW/o2sko2xDdE
 17tAvO03ZWAiIt/i7VkdbMxgwRGJXL2NQeXtG+B/Uw5JQhen3vyvB5rg9
 KGWld3Ut66onIJdBqmtJw6eL+LEPVKFmmjgg0hpS27p8r0mKS1FA/sYC4 w==;
X-CSE-ConnectionGUID: Mb79IPY9SnC5Ahx9VIZHyw==
X-CSE-MsgGUID: Zhg69MXgSZub+0ALE9qQhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21379408"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21379408"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:23 -0700
X-CSE-ConnectionGUID: IrlwcEwzRLyMqkzynUtW7Q==
X-CSE-MsgGUID: C3RlNQKERH+0tEAoQ2PbCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57569286"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:17 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 02/12] drm/xe/pf: Fix documentation formatting
Date: Fri,  9 Aug 2024 18:51:49 +0200
Message-Id: <20240809165159.662-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240809165159.662-1-michal.wajdeczko@intel.com>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
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

Current formatting of "The VF FLR Flow with GuC" only looks fine,
but it will not render properly when included in htmldocs due to:

  WARNING: Block quote ends without a blank line; unexpected unindent.
  CRITICAL: Missing matching underline for section title overline.

Fix that by adding proper indent and using list markup.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 54 +++++++++++----------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index ebf06e037750..d11839d9e7d4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -153,33 +153,35 @@ int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid)
 /**
  * DOC: The VF FLR Flow with GuC
  *
- *          PF                        GUC             PCI
- * ========================================================
- *          |                          |               |
- * (1)      |                         [ ] <----- FLR --|
- *          |                         [ ]              :
- * (2)     [ ] <-------- NOTIFY FLR --[ ]
- *         [ ]                         |
- * (3)     [ ]                         |
- *         [ ]                         |
- *         [ ]-- START FLR ---------> [ ]
- *          |                         [ ]
- * (4)      |                         [ ]
- *          |                         [ ]
- *         [ ] <--------- FLR DONE -- [ ]
- *         [ ]                         |
- * (5)     [ ]                         |
- *         [ ]                         |
- *         [ ]-- FINISH FLR --------> [ ]
- *          |                          |
+ * The VF FLR flow includes several steps::
  *
- * Step 1: PCI HW generates interrupt to the GuC about VF FLR
- * Step 2: GuC FW sends G2H notification to the PF about VF FLR
- * Step 2a: on some platforms G2H is only received from root GuC
- * Step 3: PF sends H2G request to the GuC to start VF FLR sequence
- * Step 3a: on some platforms PF must send H2G to all other GuCs
- * Step 4: GuC FW performs VF FLR cleanups and notifies the PF when done
- * Step 5: PF performs VF FLR cleanups and notifies the GuC FW when finished
+ *	         PF                        GUC             PCI
+ *	========================================================
+ *	         |                          |               |
+ *	(1)      |                         [ ] <----- FLR --|
+ *	         |                         [ ]              :
+ *	(2)     [ ] <-------- NOTIFY FLR --[ ]
+ *	        [ ]                         |
+ *	(3)     [ ]                         |
+ *	        [ ]                         |
+ *	        [ ]-- START FLR ---------> [ ]
+ *	         |                         [ ]
+ *	(4)      |                         [ ]
+ *	         |                         [ ]
+ *	        [ ] <--------- FLR DONE -- [ ]
+ *	        [ ]                         |
+ *	(5)     [ ]                         |
+ *	        [ ]                         |
+ *	        [ ]-- FINISH FLR --------> [ ]
+ *	         |                          |
+ *
+ * * Step 1: PCI HW generates interrupt to the GuC about VF FLR
+ * * Step 2: GuC FW sends G2H notification to the PF about VF FLR
+ * * Step 2a: on some platforms G2H is only received from root GuC
+ * * Step 3: PF sends H2G request to the GuC to start VF FLR sequence
+ * * Step 3a: on some platforms PF must send H2G to all other GuCs
+ * * Step 4: GuC FW performs VF FLR cleanups and notifies the PF when done
+ * * Step 5: PF performs VF FLR cleanups and notifies the GuC FW when finished
  */
 
 static bool needs_dispatch_flr(struct xe_device *xe)
-- 
2.43.0

