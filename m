Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FABC71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 07:09:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C994210E72F;
	Thu, 12 Jun 2025 07:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NyOnfAmA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EB610E049
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 07:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749712159; x=1781248159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n9MA9Mbd5vDesZ3tD5xkaviinzgsBfC7TKVLRWO0Pxc=;
 b=NyOnfAmAXwJETkWEbra/cCbnqHtGPhMcF47aFJi4kP1vcPDU9xwQDXIb
 FNFpGiotYJ9jaB9jmu3x6O0iAvwcVWLT7Y8MPov2J16sl02H9YeIbUXu0
 xJsXg+/F+wTyh0/GHnALbEgkW0vavOynkP8EmVLFrJF6vRQycAySrNxQh
 InTbxy32nHxBAHdoAIqTm0KyT4/OOcJITMn7D3EtTODoiIkQqB+82bvuk
 LYIdhgT/CNjd17X2kKa6hfKUb85aHlDXd98dvnIaqxPAOVKwaipY6yyGM
 u6c0hIQxdkeFJxQbLiZou0M6gNDoxym78BSFxsN7dANMF8Nc+fSPSIQGz w==;
X-CSE-ConnectionGUID: e3jEWRt8RTGrBq+KMkbx5A==
X-CSE-MsgGUID: w3ZBdS1bQJ6J1bYhurOXyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51792683"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51792683"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 00:09:17 -0700
X-CSE-ConnectionGUID: laiK3ErTSa218fFDvddLYQ==
X-CSE-MsgGUID: G8oSiBN7Ss6H5UsvtGBwSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152197771"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 00:09:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v4 2/3] drm/xe/bmg: Update Wa_16023588340
Date: Thu, 12 Jun 2025 00:09:01 -0700
Message-ID: <20250612-wa-14022085890-v4-2-94ba5dcc1e30@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612-wa-14022085890-v4-0-94ba5dcc1e30@intel.com>
References: <20250612-wa-14022085890-v4-0-94ba5dcc1e30@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-7a402
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

From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

This allows for additional L2 caching modes.

Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 858b5398c01b7..9752a38c0162a 100644
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
2.49.0

