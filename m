Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E0AC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 22:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B155710F3D9;
	Tue, 16 Apr 2024 22:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N3RwY79e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CB410F3DC
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 22:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713306131; x=1744842131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UXCZaMnG4A+/6nJ7yL0n/H54LthULPInAMAd68LplC8=;
 b=N3RwY79eZGBJQvuja/rk4hh9pYAynVGOx50v0UpCCUdHd8Y0nzCVAIWk
 gkUNvCK7Sd8MA59lGw76zHF01EBUC9SvjtjyQEIF67Nwnhuogw/Lmk7ci
 blYO7LPh/aoon9zEc9HTc1vZLyf5hnth52eN2R/FST41hJbl2YDCwnJeQ
 W7zQiwKLD/xh+rYYzOg7Pjfeu88uKKwlE+2YIpcJ4OqywFvsLZMCQKyjg
 dtMLI8vytriUa1k5VirMi/Ch5NOa/telIDTKV7s3PEcmSpVEuXKkhv6N8
 Ixw/kNWThAyjRLi8xa7lmTiN7xHV9AUALWOxZsloptniHFk8ZcHScY6Z0 g==;
X-CSE-ConnectionGUID: ILAjoEEnTBi10CTpNOI50g==
X-CSE-MsgGUID: 40e/ee09SjKCj807PGma0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="11719803"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="11719803"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 15:22:11 -0700
X-CSE-ConnectionGUID: cICbRHlZRzKeH0pWCtKC0A==
X-CSE-MsgGUID: T2ocuZO2RLSJA/nQs9jMUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="22463215"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 15:22:11 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [xe-for-ci v2 2/3] drm/xe/gsc: Skip GSC proxy init
Date: Tue, 16 Apr 2024 15:21:58 -0700
Message-ID: <20240416222159.1332619-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240416222159.1332619-1-daniele.ceraolospurio@intel.com>
References: <20240416222159.1332619-1-daniele.ceraolospurio@intel.com>
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

