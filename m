Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA57C61DB9
	for <intel-xe@archiver.kernel.org>; Sun, 30 Aug 2026 06:56:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5EC10E135;
	Sun, 30 Aug 2026 06:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8ABMRgR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E597110E135
 for <intel-xe@lists.freedesktop.org>; Sun, 30 Aug 2026 06:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788072982; x=1819608982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=155VzNZrntt7vhqMLydTO1RoOgjx6VpY6xmZRxZUXAg=;
 b=n8ABMRgRfwqpqvzzBXFMmTXEm2im5J2Z1mwvPpjZKlFtEvsOkmjKowz+
 VSG62wQBKBGICaH8V3QOoLwOn/lphqPdoF6o0w++0ULqIxQw1spKfc4vo
 oXtuaH3ZqcqwWLbSaqt9IT0p9KyTnbqHpoflnzb+v5ztPLC2zLypC1OYZ
 EWiUZgpFO9DGe8AwkCU/b/f0TEfYEOM5tYAJL0xSlk26GKZPKRBgIGMRP
 Q4l0mdQzAA6JNpy8IyIr88nBmZyRk40mLLn6o8xCtHwIKU9RosWWByBIS
 CTyLMqWE9Gb0jxMM/48/vcoCcOMQqpLH8hxEdIvUgevIat18+/fzOAxZ+ w==;
X-CSE-ConnectionGUID: 05fkTvEpSF22tv+tZAyfsA==
X-CSE-MsgGUID: C7ElYSxvTR2VuAnC+FYyUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="105890231"
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; d="scan'208";a="105890231"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2026 23:56:22 -0700
X-CSE-ConnectionGUID: fKul2xe4R6ifpFJPsbyVaA==
X-CSE-MsgGUID: 4bzLCOsrQHqpKAIkZPHbug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; d="scan'208";a="268560038"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2026 23:56:20 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com
Subject: [PATCH 2/3] drm/xe/hw_error: Initialize hw_error_work per tile
Date: Sun, 30 Aug 2026 12:26:06 +0530
Message-ID: <20260830065603.419055-7-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260830065603.419055-5-riana.tauro@intel.com>
References: <20260830065603.419055-5-riana.tauro@intel.com>
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

From: Raag Jadav <raag.jadav@intel.com>

Since hw_error_work is now being reused generically, initialize it per tile
so that we don't hit uninitialized work for non-root tile. While at it,
disable hw_error_work on fini to prevent UAF during unwind.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index df6275c3d316..5a57b7eaebc3 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -535,6 +535,16 @@ static void process_hw_errors(struct xe_device *xe)
 	}
 }
 
+static void hw_error_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+	struct xe_tile *tile;
+	u8 id;
+
+	for_each_tile(tile, xe, id)
+		disable_work_sync(&tile->hw_error_work);
+}
+
 /**
  * xe_hw_error_init - Initialize hw errors
  * @xe: xe device instance
@@ -544,12 +554,15 @@ static void process_hw_errors(struct xe_device *xe)
  */
 void xe_hw_error_init(struct xe_device *xe)
 {
-	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_tile *tile;
+	u8 id;
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
 		return;
 
-	INIT_WORK(&tile->hw_error_work, hw_error_work);
+	for_each_tile(tile, xe, id)
+		INIT_WORK(&tile->hw_error_work, hw_error_work);
 
 	process_hw_errors(xe);
+	devm_add_action_or_reset(xe->drm.dev, hw_error_fini, xe);
 }
-- 
2.47.1

