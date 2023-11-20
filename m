Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C8DC2BB3F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 21:28:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0067010E1B6;
	Mon, 20 Nov 2023 21:28:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E7710E10B
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 21:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700515680; x=1732051680;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Vb5+nfG1Os5FXcHIQVLREwFTuUHvBbe+aou2Hl6Z/hM=;
 b=UdVS7aiFZ+BhX0FyQ+MoRXINOwpAXZTHOrH5xRBOqgPN/5VqzG9uZQ5e
 UB+QsXsLb81uBeJnnV1iE2dnNe3ZbU981+0gnGirW0EYWXHRkBAPbB6wH
 4UgInGaPKtWlZqMm0iYMbab/WGVLsuFz0K0e+Lh7NzRFFLXNQG2EGhDzG
 g6xg4GlaPdi4+AvmeEj9KdzKYiCT8JLPTFT6i3ZK9O66MaQ6RUHZBTBDH
 fLYi5/Z456dzsxWco/ISgdjl43hoTPvuu0tQKXn2nm/kuUIavRLMgyVpM
 Pk13hPgP+lrxCftZCzKX0WhuirquqgLLKaEv58N4lP5dHv5/a0nRxvfmF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="13256890"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="13256890"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 13:27:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="883984473"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="883984473"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 13:27:57 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Nov 2023 13:27:36 -0800
Message-ID: <20231120212741.2634679-8-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231120212741.2634679-1-daniele.ceraolospurio@intel.com>
References: <20231120212741.2634679-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 07/10] drm/xe/gsc: Trigger a driver flr to cleanup
 the GSC on unload
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
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 0def7c1ae84d..1bb0de0a24f4 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -130,6 +130,23 @@ static int gsc_upload(struct xe_gsc *gsc)
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

