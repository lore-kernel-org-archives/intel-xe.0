Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F352DC5B549
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 07:55:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC1C10E1A3;
	Mon,  2 Jun 2025 07:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bfRh9GZc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B2B10E1E8
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 07:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748850933; x=1780386933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=saCUOgnL8yTN6kQBSAwGb7xBks8G5lxlXx8/tiuc698=;
 b=bfRh9GZc4WRNnjjoZKJYzfALAu1YC5QiW4IifGiu84A71DcUg5sAKf13
 uvz03hKS03WjlkR9PdS799Q7r/wbUyi246Txf6Xon8UYhNL9jHZ9NXwul
 U/0ccgK5m2iaW/dTxY4LCEHYRuNM0JN2V0/BnSPuCUHnQqTKSeNNuyLTu
 2gYpscanEFKP36/O2i7zQDtQBDoIqngke7SNHYBK/sB5HKz4oqLUEEVKI
 Bv2grS5rMCydo59+FfN//YvADbAfpC4A5up6eSSxptgDmL68SwuBiHtv/
 WgneQ6/KqvHl5M4BDtiMP1UUpk98cMZYc9MEPzD/vYgwZLCbvWkxpZZK5 g==;
X-CSE-ConnectionGUID: pTwloUL9S36IOjyru+nQqw==
X-CSE-MsgGUID: Glrk3uLfTPWsTuA5UfkjPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="68403899"
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; d="scan'208";a="68403899"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 00:55:33 -0700
X-CSE-ConnectionGUID: xPgE3pJFS1KpEY9GCEzsPQ==
X-CSE-MsgGUID: oFW2ENX2Q0+WW4hx/rVcHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; d="scan'208";a="167647581"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa002.fm.intel.com with ESMTP; 02 Jun 2025 00:55:33 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 3/3] drm/xe/bmg: Update Wa_16023588340
Date: Mon,  2 Jun 2025 00:53:30 -0700
Message-Id: <20250602075330.1728243-4-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250602075330.1728243-1-vinay.belgaumkar@intel.com>
References: <20250602075330.1728243-1-vinay.belgaumkar@intel.com>
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

This allows for additional L2 caching modes.

Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 858b5398c01b..9752a38c0162 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -118,7 +118,7 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
 	}
 
-	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0x3);
+	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0xF);
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
-- 
2.38.1

