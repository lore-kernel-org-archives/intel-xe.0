Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6C3C25B48
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 22:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF5310E111;
	Fri, 27 Oct 2023 22:29:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445F910EA5E
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 22:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698445784; x=1729981784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rYp07gsyw2KexnFvywkxUQaXids7T3e87ETcsebymnE=;
 b=hBC6ORIz5zIxZJULw6uzhiqTtYqyWXRLGqv6yzxWfRS2dv+7x8pLUvrL
 mky0tyuvzKWSOUQAyRNXWaFf3WzCcl55DKFsoJWxnAXpgrDzO5W+uf8FX
 tOckljdrIFeuSNiPpm/SKWgQlMsRseBpjfKG1qLqUrZ29ny1HmWYpZ/Uy
 X4Rin84s9gp/jvcxQQcZrWOtZsFL+hHrkABWHR6olEBYFELODLvGywBSb
 cdd6vFnaLxjCnmXbr139M+/fiR+3/izBrLRD6Z65p81E0peS/Sktyjjfd
 /W4St6F1xCvTd4sgSKkomp+3egXifxrzpwM0cNxfQ0DKGv166/57RnMj4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="9397781"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="9397781"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 15:29:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="763360374"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; d="scan'208";a="763360374"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 15:29:44 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 15:29:22 -0700
Message-ID: <20231027222928.1981633-9-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 08/12] drm/xe/gsc: Trigger a driver flr to
 cleanup the GSC on unload
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

GSC is only killed by an FLR, so we need to trigger one on unload to
make sure we stop it. This is because we assign a chunk of memory to
the GSC as part of the FW load, so we need to make sure it stops
using it when we release it to the system on driver unload. Note that
this is not a problem of the unload per-se, because the GSC will not
touch that memory unless there are requests for it coming from the
driver; therefore, no accesses will happen while Xe is not loaded,
but if we re-load the driver then the GSC might wake up and try to
access that old memory location again.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 7e5ba9039163..edf74780322a 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -106,6 +106,7 @@ static int gsc_fw_wait(struct xe_gt *gt)
 static int gsc_upload(struct xe_gsc *gsc)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
+	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	if (XE_WARN_ON(!xe_uc_fw_is_loadable(&gsc->fw) || !gsc->q || gsc_fw_is_loaded(gt)))
@@ -117,6 +118,23 @@ static int gsc_upload(struct xe_gsc *gsc)
 		return err;
 	}
 
+	/*
+	 * GSC is only killed by an FLR, so we need to trigger one on unload to
+	 * make sure we stop it. This is because we assign a chunk of memory to
+	 * the GSC as part of the FW load, so we need to make sure it stops
+	 * using it when we release it to the system on driver unload. Note that
+	 * this is not a problem of the unload per-se, because the GSC will not
+	 * touch that memory unless there are requests for it coming from the
+	 * driver; therefore, no accesses will happen while Xe is not loaded,
+	 * but if we re-load the driver then the GSC might wake up and try to
+	 * access that old memory location again.
+	 * Given that an FLR is a very disruptive action (see the FLR function
+	 * for details), we want to do it as the last action before releasing
+	 * the access to the MMIO bar, which means we need to do it as part of
+	 * mmio cleanup.
+	 */
+	xe->needs_flr_on_fini = true;
+
 	err = emit_gsc_upload(gsc);
 	if (err) {
 		xe_gt_err(gt, "Failed to emit GSC FW upload (%pe)\n", ERR_PTR(err));
-- 
2.41.0

