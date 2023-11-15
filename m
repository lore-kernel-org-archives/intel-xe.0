Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9A7C3DA7A
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 00:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD38010E4E7;
	Wed, 15 Nov 2023 00:46:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F55710E23C
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 00:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700009193; x=1731545193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vb5+nfG1Os5FXcHIQVLREwFTuUHvBbe+aou2Hl6Z/hM=;
 b=i9t7aFOOKKUJmQbBhOS0p24gUCVQ5+DJi30381qQk35oG9K2GZpxKStB
 8cV+n0SZ+2Z2I5Rj9t47fLp92PfqBxJf3D+RhP2l8v1aMYT0jyfz1aQ2w
 LDxmSwvD/WujiSmEF+MPuNxN78iNfcjdkvXhG0riWLE31IUrnHhx4rIDn
 gucRKoG8+1g8MeQz/R8OBI7ijSrV0yYjJqdo6+wBcav7gQ/RsdS9zOkpX
 muHK5OjMOGv3VhCvWyIBzrfulU1OrnU+EnvfOot8F76y6B3kmzy0ZOYLZ
 HogM+XUFIG69JhCf3juf493UygaK808YYNfGMZIYMOaW5jJ9YjKsN/OYO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="3890974"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="3890974"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 16:46:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="12609390"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 16:46:33 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Nov 2023 16:46:10 -0800
Message-ID: <20231115004615.2424177-8-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231115004615.2424177-1-daniele.ceraolospurio@intel.com>
References: <20231115004615.2424177-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 07/11] drm/xe/gsc: Trigger a driver flr to
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

