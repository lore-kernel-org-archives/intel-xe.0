Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCDFCAC598
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 18:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3013010E1AF;
	Wed, 17 Sep 2025 18:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPaOgM9x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F414D10E1C8
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 18:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758132615; x=1789668615;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q1X5mGe04swWlldDn4TIZm+RWifLerKeT5bJlgKkIoo=;
 b=TPaOgM9xS85wtQtuLTGV2jDbSUa3IxtdSTswS162eCJGOzwPGn2JDynI
 MkCE8J1G7Ycot1JrCH0CDyXBO9Evrl1mQb0BjvvC7paS0v4ljxQ3uJ/qo
 tUdFnjbjxFg+NSreI6Ge+CRdOSzG9XleEbnfl+lljgSCeSXeos/Mg6rFf
 pN/XV1gIMPz0RX/4oDSGFDk2IfJRwmzOMSJxvaUJsSdhniYRZr988dU2b
 SI0lf8p+ueyXwytybFLID/j/JiQvA+qsJAbPTYubaF289jVsI50wOliJX
 Eg8790AJh9Cud+Y9LTy6JGF+/fzjgBCbGV6qGMVy7dhGGJvHWtIZbtyZW Q==;
X-CSE-ConnectionGUID: 7uFLqjYLTKCMrljuJQIYOQ==
X-CSE-MsgGUID: zcJrdr77S5KqWsyvwlcbxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60366369"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60366369"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 11:10:14 -0700
X-CSE-ConnectionGUID: mt3CbUqYTquJxQPLYhTowg==
X-CSE-MsgGUID: myH4U0X1QP2IbVSMcv3xKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="175727061"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 17 Sep 2025 11:10:12 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/i2c: Rely on d3cold.capable flag in system PM path
Date: Wed, 17 Sep 2025 23:39:29 +0530
Message-Id: <20250917180929.2906157-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

We don't consider allowed flag for D3cold transition in system PM path.
Rely on capable flag instead, which reflects root port capability.

Fixes: 0ea07b69517a ("drm/xe/pm: Wire up suspend/resume for I2C controller")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 17c7dd024343..0014b5f4ad07 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -198,7 +198,7 @@ int xe_pm_resume(struct xe_device *xe)
 	if (err)
 		goto err;
 
-	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
+	xe_i2c_pm_resume(xe, xe->d3cold.capable);
 
 	xe_irq_resume(xe);
 
-- 
2.34.1

