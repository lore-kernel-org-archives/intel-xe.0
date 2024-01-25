Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F40AC47258
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 15:38:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FB110E2A8;
	Thu, 25 Jan 2024 15:38:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2EA10E2A8
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jan 2024 15:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706197119; x=1737733119;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xLGu0bvSmo95twtG4PmX1ipUBHJBvTxGCsqJW0M2RCQ=;
 b=nK4r2xNHJZKkRFKhlmnNydhJSL+8A7yFpaLbqfLw2DobEDwhPbXSRNWW
 vhdF4quP8LXVTszYq6pr2PmgK9pLy/ZSUQ/M+e/YqnhIXCB8oqa7+LlfV
 zHQPFxwx+/XNCxK51eBGmKnsQtLaKa3F/Z6pLjHClsjccnvT6BDlUYMG7
 p6+OhGM0qFUCAlAhwul7wv0y3dO68S+SbBGXBJTRm6fj97Yg2CxW2LL+w
 A9HME5eybegc1umgLolR1Jd2Xi7S5Qjz8BkQOUBBgDT8zzbEHwdEJBocf
 wF/BL4oYJ/iOABk3GmkGe+PfPUJtdtwj0xwdA2WlEXtq6iKgQoRUw/BUC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9576844"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9576844"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 07:38:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2451852"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 07:38:33 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/xe_guc: Reduce a print from warn to debug
Date: Thu, 25 Jan 2024 21:16:47 +0530
Message-Id: <20240125154647.3743708-1-karthik.poosa@intel.com>
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
 drivers/gpu/drm/xe/xe_guc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 576ff2c1fbb9..6fbeddc557af 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -174,7 +174,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 		if (GUC_VER(version->major, version->minor, version->patch) >= GUC_VER(70, 7, 0))
 			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
 		else
-			drm_warn(&xe->drm, "can't apply WA 14018913170, GUC version expected >= 70.7.0, found %u %u %u\n",
+			drm_dbg(&xe->drm, "can't apply WA 14018913170, GUC version expected >= 70.7.0, found %u %u %u\n",
 				 version->major, version->minor, version->patch);
 	}
 
-- 
2.25.1

