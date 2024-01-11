Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46833C4707B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 10:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E5610E851;
	Thu, 11 Jan 2024 10:47:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C67A10E851
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 10:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704970043; x=1736506043;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IwrftUkwcbcFv/XsubE0JuaZxCS1vB4JcPZL3LBQ4Js=;
 b=bB+dE13aPQTarcLN5RWiuUIBIKHfKFNWZBMmuLxgoVxCqLeReiykSx4d
 Dl++PYk5/5fc3yZTyhCEANqoKZ7BmIr6z3DEfbikCABPjxF/wsChU6d1U
 04UfYvQiQOzQNphHTRTzFsckF28SSZnry8IerFFrMD9x6AHI+pdtrt3Lt
 LOfXoSuJWu1H7SH2I8RZvrYTACpD89LkiGl78AvADG2Nrbo1uG9a+KZoQ
 XO6S8KrnoomuZch4o26ggij2NI0nxwos5hf5tZEaKlZH3V41NE8GT4xIj
 qGUIAtwdGTUigj5M6jrwJdoMvWjBbk0/pAcbxdnGuBypvarLOsaGR/O2X Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="5575931"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="5575931"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 02:47:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="758715810"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="758715810"
Received: from gaertgee-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.206])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 02:47:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: display support should not depend on EXPERT
Date: Thu, 11 Jan 2024 12:47:16 +0200
Message-Id: <20240111104716.3548744-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove the DRM_XE_DISPLAY config dependency on EXPERT. I can only
presume the idea was only experts should be able to disable it, but the
effect is the opposite.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 1cced50d8d8c..e36ae1f0d885 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -47,7 +47,7 @@ config DRM_XE
 
 config DRM_XE_DISPLAY
 	bool "Enable display support"
-	depends on DRM_XE && EXPERT && DRM_XE=m
+	depends on DRM_XE && DRM_XE=m
 	select FB_IOMEM_HELPERS
 	select I2C
 	select I2C_ALGOBIT
-- 
2.39.2

