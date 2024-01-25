Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB18C47258
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 16:34:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB7310EC54;
	Thu, 25 Jan 2024 16:34:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0454710EC54
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jan 2024 16:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706200495; x=1737736495;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bLcq2uiGq9XDA5qvuG1KenGh0L951qU1weF0Em0yA2o=;
 b=OCPHOMk/lYzDwShEHXHheQWudCc0kJAayARIurvcclwZpDXkaRBmK6ad
 ZVAc0sLbpFNL6nfqLYC+IV21EfPj+RnVkW9GnTnQltwy9xFtNd/vPZ7/6
 9w1A340bJ2lUfCC/89wBj6moklkre2Uc5SCF4kP9XNXHYwpqle8iVKGTP
 icWb4AMQhf/yqNWuZ/yRiGDrXLdzc6AcLNnotJtcKg0H0OjeQqf3cbqQ9
 1ZmSE63xbc7y9FEaXkmBDK4OaIwQpY/PC/pxDtiWWqblMWf8hjkhlRotf
 TFX/33XM3eQonIjNcmNRr3U7Rthb2oYdlX4NIWzi7Ej/W/6WX4PQt3Gjo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="8866656"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8866656"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 08:34:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2288370"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 08:34:51 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/xe_guc: Reduce a print from warn to debug
Date: Thu, 25 Jan 2024 22:13:09 +0530
Message-Id: <20240125164309.3761661-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: lucas.demarchi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reduce debug print from warn to debug to avoid uncessary
warning message in dmesg (Lucas).

Fixes: c5a06c9169f3 ("drm/xe/guc: Enable WA 14018913170")
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 576ff2c1fbb9..f4e555611baa 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -174,8 +174,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 		if (GUC_VER(version->major, version->minor, version->patch) >= GUC_VER(70, 7, 0))
 			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
 		else
-			drm_warn(&xe->drm, "can't apply WA 14018913170, GUC version expected >= 70.7.0, found %u %u %u\n",
-				 version->major, version->minor, version->patch);
+			drm_dbg(&xe->drm, "can't apply WA 14018913170, GUC version expected >= 70.7.0, found %u %u %u\n",
+				version->major, version->minor, version->patch);
 	}
 
 	return flags;
-- 
2.25.1

