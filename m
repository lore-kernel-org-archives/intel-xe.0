Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FB9C3DA79
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 00:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB75B10E38A;
	Wed, 15 Nov 2023 00:46:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5291A10E235
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 00:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700009187; x=1731545187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eVRVZTtbXN6+IhllgbGN2XemYrKMVewcBfzjxeuX9aw=;
 b=M1HQsonBIRKkVaRENgJiYkX/fSRTkA6MtnEmXKucbvDuqr8OzfQ42crF
 obXvNMGMbifXlR+VLkjK12GkE6Z4go74IIlVctJ69oeuJLbGxc8aPBhaS
 QO9Nwrieh+vxaCGTDRiqHrcVJwJcgqyoVKznDyd1Fr+JTVyibzOEm99JM
 55ON0RNnazPnBptlI6ME/ep2Tswceofv4U7bjQ5ZD4PtIjGCZxj/m8IgZ
 YwBMILbdvLPTFVgnsKtD2RgQEFwLT0QfuB+5RS5sGYH1ksuTPTAxw20th
 LA9jo0/hV2fnmkuYygGUanQz6keUrMiY6od0inKvN3/axo4aDhTz0PREs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="3890956"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="3890956"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 16:46:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="12609370"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 16:46:27 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Nov 2023 16:46:04 -0800
Message-ID: <20231115004615.2424177-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231115004615.2424177-1-daniele.ceraolospurio@intel.com>
References: <20231115004615.2424177-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 01/11] fixup! drm/xe/guc: Report submission
 version of GuC firmware
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

Major GuC versions greater than 70 will have the submission version in
the herader irrespective of their minor version number.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 3032c4f148d4..91d4a2272ee7 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -278,7 +278,7 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
 	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
 	xe_gt_assert(gt, uc_fw->major_ver_found >= 70);
 
-	if (uc_fw->minor_ver_found >= 6) {
+	if (uc_fw->major_ver_found > 70 || uc_fw->minor_ver_found >= 6) {
 		/* v70.6.0 adds CSS header support */
 		guc->submission_state.version.major =
 			FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
-- 
2.41.0

