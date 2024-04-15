Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6473EC04FF8
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 23:20:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9FD1128B2;
	Mon, 15 Apr 2024 23:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XUQ2f8DA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394001128AF
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 23:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713223205; x=1744759205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UXCZaMnG4A+/6nJ7yL0n/H54LthULPInAMAd68LplC8=;
 b=XUQ2f8DAZuSuZlQxNACv9lSfrhseRPd1x+S9QDo5fpWWnC8ZNSQHTQ06
 ZGvOo3owJ4IWEMoc1NtmcIYRn6lUG/PJusWi8lj3CcVIAtnh0yJFtzXbA
 RYtL/R5Bva+CcYfzTqiwHRA8BUJlYPQRPmTT0qb3GxiyUKU2ttK6rEz0k
 tzeleCWoigDo7umQsCc9CbgDSP8orz8d0Iitkf9cvKQKOyqeS+cxAqHb6
 FdqvTtJ7HgFhbSpqc4AxWR2cZ7gYI7gVn5MxtU6/Jj9+KeWYvHmZBH7md
 tT03UqahP+ozyHMgee+Fi/rlniC3H3gxics9UIl79FpTqunanFSewd6fv Q==;
X-CSE-ConnectionGUID: rZS5rJ4iRtSagOZ8OzmcGg==
X-CSE-MsgGUID: l8YGRNK+Tx2BIdNMUEsrxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8496775"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="8496775"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 16:19:59 -0700
X-CSE-ConnectionGUID: OQpo1VYFTJik1b2+w8OXcw==
X-CSE-MsgGUID: 25/hDVV5Sey4sED5hA10xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="22141841"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 16:19:59 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [xe-for-ci 2/3] drm/xe/gsc: Skip GSC proxy init
Date: Mon, 15 Apr 2024 16:19:46 -0700
Message-ID: <20240415231947.1230707-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240415231947.1230707-1-daniele.ceraolospurio@intel.com>
References: <20240415231947.1230707-1-daniele.ceraolospurio@intel.com>
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

The mei support for LNL hasn't landed yet, so we can't use the GSC proxy
component. Note that the lack of the GSC proxy means that the content
protection features (PXP, HDCP) won't work.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc_proxy.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 35e397b68dfc..3a7ba63b5bf2 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -446,6 +446,15 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
 
 	mutex_init(&gsc->proxy.mutex);
 
+	/*
+	 * FIXME: mei support for LNL hasn't been merged yet so we can't use the
+	 * GSC proxy component yet.
+	 */
+	if (xe->info.platform == XE_LUNARLAKE) {
+		xe_gt_info(gt, "skipping GSC proxy init due to missing LNL mei support\n");
+		return -ENODEV;
+	}
+
 	if (!IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY)) {
 		xe_gt_info(gt, "can't init GSC proxy due to missing mei component\n");
 		return -ENODEV;
-- 
2.43.0

