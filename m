Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCEACCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 20:08:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BE010E159;
	Fri, 24 Oct 2025 20:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BuLYCmu+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0DF10E159
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 20:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761336519; x=1792872519;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t7rB1+p2B6+pHSkdCRT1oc87kS7ov6jbTTdIukZ07w4=;
 b=BuLYCmu+Atl2PpchdhshT27nDQiilP+duU1YOnW1AjPIIR5gkdq5cyq+
 A+Sx0Lrgru8r2PLmZOox9MdYCdv8eR3tX3Z0cFIIcM5d/VawZPoFIYaLh
 nbM62UHKMGCyJdoQdVMImndWFiDD5JifmSiSUsuZwmuBSDsvyx5w3yZUS
 OdKPVWLkfMaPlZ7+AGvKzy/EMM8X21k8j3xS31009PmR5gwEK2fFPWi0A
 LqDOPvagcZqtUAE+7a8hibmIZjXzv7F+XHRCV34eEmC5frGNpirfmyUQ0
 tpyXHGzy5Es0RLFAYauOJZPHmXXy8FZEUoQmrWq5nDTB6yQl/pHwifeSS g==;
X-CSE-ConnectionGUID: lNtmJjo4QpGJUOmfUV2xrQ==
X-CSE-MsgGUID: QDxThNGkT7WKaKGpYlqY9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63557340"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="63557340"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 13:08:39 -0700
X-CSE-ConnectionGUID: 46SiVDYzQZ2frTOF8rHU4A==
X-CSE-MsgGUID: lI40Gx1kTrSv0hxMqrW8sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="184220801"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 13:08:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH] drm/xe/configfs: Drop MAX_GT_TYPE_CHARS constant
Date: Fri, 24 Oct 2025 13:08:35 -0700
Message-ID: <20251024200834.1512329-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
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

Early revisions of commit 7abd69278bb5 ("drm/xe/configfs: Add attribute
to disable GT types") used MAX_GT_TYPE_CHARS not only to size the
constant name field, but also for some of the string matching logic.  By
the time the patch finally landed, the constant was no longer needed for
parsing.  Stop using it for the string field definition as well; this
eliminates the risk that we forget to update the constant if we ever add
a GT type name longer than seven characters.

Suggested-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index c1419a270fa4..fad75650f3dd 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -301,7 +301,6 @@ struct engine_info {
 /* Some helpful macros to aid on the sizing of buffer allocation when parsing */
 #define MAX_ENGINE_CLASS_CHARS 5
 #define MAX_ENGINE_INSTANCE_CHARS 2
-#define MAX_GT_TYPE_CHARS 7
 
 static const struct engine_info engine_info[] = {
 	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK, .engine_class = XE_ENGINE_CLASS_RENDER },
@@ -313,7 +312,7 @@ static const struct engine_info engine_info[] = {
 };
 
 static const struct {
-	const char name[MAX_GT_TYPE_CHARS + 1];
+	const char *name;
 	enum xe_gt_type type;
 } gt_types[] = {
 	{ .name = "primary", .type = XE_GT_TYPE_MAIN },
-- 
2.51.0

