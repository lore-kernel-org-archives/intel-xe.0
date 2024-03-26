Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AA1C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 16:41:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E63110E9B1;
	Mon, 25 Mar 2024 16:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j9wCFRCk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DB910E9B8
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 16:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711384913; x=1742920913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QoV+tEHkKMCkglE9AY/z3EGUzGr3JRYtxUQM6lGouAg=;
 b=j9wCFRCkGjAprQVaeSmlD/f415a7XjMGzCBXe/kzZHk6ynncw4MLDBhF
 xpLRO0BJ18lyax0uMe45YSQVZWs3SmpsbmucmBuj7qrQ0ZAjjsgCJUf1w
 NWqc7HznWG+jaavF33d7LxovHParE/nYWarfeiiCY6g/hpksb4diGBPq8
 d+cfhWDIz8nrkCGhfERFqiVL3Cx5QXJBY5/cPnPHRPeGxsRw0vOrgDtWY
 PUz8g8Tu+hAUzLkL7mhICV31Oa2Jknjp9Fa3MGm7eFktrQmiQGJ28gL3c
 pR13NhrRqRMmBCGxsSY6M1j8EI4Hh3jFSzdIWuwyETng/aX+1/iqx9wsU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6511143"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6511143"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 09:41:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="53146071"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 09:41:53 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 akshata.jahagirdar@intel.com
Subject: [PATCH i-g-t v1 1/1] drm/xe/xe2: Send flat_ccs value in config
Date: Mon, 25 Mar 2024 21:40:05 -0700
Message-Id: <c760d8126f9384f2cfce49856b50878af193c9bf.1711427514.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711427514.git.akshata.jahagirdar@intel.com>
References: <cover.1711427514.git.akshata.jahagirdar@intel.com>
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

In igt tests such as xe_ccs, we need to check if the platform supports
compression before running the test.
Else, just skip the test.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 3 +++
 include/uapi/drm/xe_drm.h     | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index e80321b34918..8a3a3117491c 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -332,6 +332,9 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->num_params = num_params;
 	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
 		xe->info.devid | (xe->info.revid << 16);
+	if (xe->info.has_flat_ccs)
+		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
+			DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS;
 	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index f44a19ae9333..08783234bae1 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -405,6 +405,7 @@ struct drm_xe_query_config {
 #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define DRM_XE_QUERY_CONFIG_FLAGS			1
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS	(1 << 1)
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
-- 
2.34.1

