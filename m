Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770BACDB484
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 22:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F2510E464;
	Wed, 18 Oct 2023 22:57:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE70689C0A
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 22:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697669838; x=1729205838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hZJRfyfqsBm1vuUuUEcOIMATDq4i5TYpMk57El/MiR4=;
 b=SB/9DUvUM6II6qYUjDHmLKJ4T4+bpLKHBEYTEE3b+WtzjsUMFat/m25T
 YdNC4gIGeEFTw7mYVQ+6pl5YXOc9Cn0dxbxUkQTcM7W/jZeSHFMUCkT2p
 8pTYOOk45r3tkPVMGR+IYr1BuKLrlzoUgdszps4xfJfVabACJYCMcnz5Z
 GkwUl93EkUkY43tVFANM5Q8GV+Sv8zvupjsYWFnFLUEG086o4wwZ3a/R6
 u7yCltxMuTsgM7Lb5Xv3gVjKRIMKwpT2n7zhTwYd0y9rQcQIQr6S7hezW
 UbWNU6ILp7oc485L4mNWBBgZKN9Jd1uZuZYjoj27ktVR75ZRZz3PCSHvl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="450353335"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="450353335"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 15:57:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="822613262"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="822613262"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 15:57:18 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 18 Oct 2023 15:57:05 -0700
Message-ID: <20231018225707.1685294-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018225707.1685294-1-daniele.ceraolospurio@intel.com>
References: <20231018225707.1685294-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/5] drm/xe/huc: HuC is not supported on GTs
 that don't have video engines
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On MTL-style multi-gt platforms, the HuC is only available on the media
GT, so we need to consider it as not supported on the render GT.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_huc.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 293403d16f25..386efa180c1c 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -35,10 +35,19 @@ huc_to_guc(struct xe_huc *huc)
 
 int xe_huc_init(struct xe_huc *huc)
 {
-	struct xe_device *xe = huc_to_xe(huc);
+	struct xe_gt *gt = huc_to_gt(huc);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = gt_to_xe(gt);
 	int ret;
 
 	huc->fw.type = XE_UC_FW_TYPE_HUC;
+
+	/* On platforms with a media GT the HuC is only available there */
+	if (tile->media_gt && (gt != tile->media_gt)) {
+		xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_NOT_SUPPORTED);
+		return 0;
+	}
+
 	ret = xe_uc_fw_init(&huc->fw);
 	if (ret)
 		goto out;
-- 
2.41.0

