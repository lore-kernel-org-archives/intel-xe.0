Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B924FE7AD5E
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 14:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8036C10E2AB;
	Tue,  3 Oct 2023 14:35:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923B310E2AB
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 14:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696343750; x=1727879750;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0qxtnIHDhCL2gCmy1cg1E5x/yZH2Ew/5+ihBLf6jloY=;
 b=KkChgvhWQt+jffufPD2z/70Ra0Mh4rdoCXb/pNB1BQA6Pa/Rij3gXAXd
 9/BQE2brMzin+VfnJOomfliV+xTHIKLkcC3dKVIwxgu2Dt5vWM1EsrQ2j
 483ymnRcW2OjXr5pl4UYzOiJCTQUuPhnNONrgBN16KHQmjA0SrMyF4sjo
 swzNLyVDF1E8xngE3hAMh4UJgOTlvK53DzVcQ62km42jQoMSbmOBCdwY9
 3j4QDclHPtSfsMGHXTKd6yjaTx3c4sTHjNw7htqsdxIfJk76BIKBAkXxa
 x4tM5HGGASlLj3TtW5N07QYL+scy108uBC3TsUL6y5TZGgpnFcuNFd+fh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="449375176"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="449375176"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="754462288"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="754462288"
Received: from akorotox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.199])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:35:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 17:34:57 +0300
Message-Id: <a96154bff006a4bc7d498347c8b6602b7524482d.1696343521.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1696343521.git.jani.nikula@intel.com>
References: <cover.1696343521.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 10/10] fixup! drm/xe/display: Implement display
 support
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

These checks no longer make sense, as has_display() has already been
checked.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 70e7afc0a890..f8ca8ad65ef7 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -349,8 +349,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	 * properly.
 	 */
 	intel_power_domains_disable(xe);
-	if (has_display(xe))
-		drm_kms_helper_poll_disable(&xe->drm);
+	drm_kms_helper_poll_disable(&xe->drm);
 
 	intel_display_driver_suspend(xe);
 
@@ -395,8 +394,7 @@ void xe_display_pm_resume(struct xe_device *xe)
 
 	intel_dmc_resume(xe);
 
-	if (has_display(xe))
-		drm_mode_config_reset(&xe->drm);
+	drm_mode_config_reset(&xe->drm);
 
 	intel_display_driver_init_hw(xe);
 	intel_hpd_init(xe);
@@ -406,8 +404,7 @@ void xe_display_pm_resume(struct xe_device *xe)
 	intel_display_driver_resume(xe);
 
 	intel_hpd_poll_disable(xe);
-	if (has_display(xe))
-		drm_kms_helper_poll_enable(&xe->drm);
+	drm_kms_helper_poll_enable(&xe->drm);
 
 	intel_opregion_resume(xe);
 
-- 
2.39.2

