Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4489CCF9F7
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 20:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9299210EA25;
	Wed, 25 Sep 2024 20:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RAp957oH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A64810EA77
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 20:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727297529; x=1758833529;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kkw5DU8qQXEMaxIITKRZOBKwTx1ZGAnFS21YQnZzF3Y=;
 b=RAp957oHr9Dk71+c4pTCmQWkcFhlFEhb5cTZ1M6Xr/KVJ5dVGe8gixP5
 U0s8KIyNTNmS4Nv3UqBU1bLlGPds7gxd6flYLzTs9ffzZg+9RCkFiXITV
 jbOkAJpreZJqejrjE5aoIXrrvk2WKvcekneDqmDFn7TwsaCy3M9QB4BkU
 tsmXYxUIV/PVzMyru7Zugu1N0ENPwYLUdNBAxvT67MPAB3L5wjgcFcvhr
 w3uBR+x2XmCW9Heuiz5cNOdTDXIghIAB7jL32/9uMT1JsgEDzZvNaNdui
 HdQHMUdBuTmZjOHCtYaGkd44s2izDo5P/Eqrj8yQnZclC83N9pkPg19it Q==;
X-CSE-ConnectionGUID: BeKg7LGYTGKTBRvC7lzulw==
X-CSE-MsgGUID: it+ks0QfR+2w9rDxVrYTKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26524893"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="26524893"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 13:52:08 -0700
X-CSE-ConnectionGUID: AVin0+EOSzqpvHOP9pZueg==
X-CSE-MsgGUID: GKZ9zzdWQXGvfPqTAfhn+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="95229473"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa002.fm.intel.com with ESMTP; 25 Sep 2024 13:52:08 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH] drm/xe: Restore GT freq on GSC load error
Date: Wed, 25 Sep 2024 13:49:18 -0700
Message-Id: <20240925204918.1989574-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

As part of a Wa_22019338487, ensure that GT freq is restored
even when GSC reload is not successful.

Fixes: 3b1592fb7835 ("drm/xe/lnl: Apply Wa_22019338487")

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 796b330ffd62..a5083ffc59f4 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -908,7 +908,9 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
 	int ret = 0;
 
 	if ((!xe_uc_fw_is_available(&gt->uc.gsc.fw) ||
-	     xe_uc_fw_is_loaded(&gt->uc.gsc.fw)) && XE_WA(gt, 22019338487))
+	     xe_uc_fw_is_loaded(&gt->uc.gsc.fw) ||
+	     xe_uc_fw_is_in_error_state(&gt->uc.gsc.fw)) &&
+	    XE_WA(gt, 22019338487))
 		ret = xe_guc_pc_restore_stashed_freq(&gt->uc.guc.pc);
 
 	return ret;
-- 
2.38.1

