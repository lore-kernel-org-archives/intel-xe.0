Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C05AC531DB
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 01:54:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6095F10EA57;
	Sat, 10 Aug 2024 01:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H68kvlvF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C32910EA55
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Aug 2024 01:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723254894; x=1754790894;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XGC4jZmjjEvG19FWjJ98hSgqRASZ7huPqvsWIbEpjPk=;
 b=H68kvlvFl7uO4cc5U+PNR0cxylGNao8lJvANKLxxN3RVzcElAgq+TZzi
 E9zr2WEYmkSmixB3sUDV8mlCH9WmA4075tIc7Q+g3PfNCRcQyGZAP4wN2
 umweWL8Anc3nuRpWAhIYt0A4dGvtVH/jWy4WfOLJty8DX3/bILqYc3QdZ
 m154xURnxeqU4a+wyoAcFLgfLkB/9VBN2MyMGdInuffffX3a3z+fr81OF
 SjTdIiBorp89+AX9mUecmDjYQWInJ7lzaRjXi3Gu5uAh+vw9Lg2OZad6W
 p8RGCkS+oMJPRdYwk+k+EhA+NzhjsxJm1tfJpSRYor6a5rAl7V6akSAw2 w==;
X-CSE-ConnectionGUID: nqILnwUIQXmheAsIIUsx2w==
X-CSE-MsgGUID: l1tjWDOdSKiHiUi/SOeCpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21420030"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="21420030"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:53 -0700
X-CSE-ConnectionGUID: KUTh+1vlTg6hizd2ABBh0w==
X-CSE-MsgGUID: SbmMdwAyQ6G8mweTC1wXmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="57813387"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 07/11] drm/xe: Set firmware state to loadable before
 registering guc_fini_hw
Date: Fri,  9 Aug 2024 18:55:40 -0700
Message-Id: <20240810015544.3443258-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810015544.3443258-1-matthew.brost@intel.com>
References: <20240810015544.3443258-1-matthew.brost@intel.com>
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

The guc_fini_hw registered calls __xe_uc_fw_status which is only
expected to be called after initializing fw state. Move this before
registering guc_fini_hw.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 980691c178c4..9f2a7de47b9b 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -350,6 +350,8 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
+	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
+
 	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
 	if (ret)
 		goto out;
@@ -362,8 +364,6 @@ int xe_guc_init(struct xe_guc *guc)
 
 	xe_guc_comm_init_early(guc);
 
-	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
-
 	return 0;
 
 out:
-- 
2.34.1

