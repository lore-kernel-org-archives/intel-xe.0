Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B04CD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 12:08:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9BE10E0A6;
	Mon, 18 Sep 2023 12:08:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C5810E044
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 12:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695038889; x=1726574889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4sUheGN/tM5tdwQnaLggRjvowXEC7DIKmSf3SNyf1wY=;
 b=M+dQ9LgukbL+/hViTyAdFgq6M21CFKU2hXU1AVdDx1hu6mXyiCrVx/UF
 AN4CETpBR/c7GvtTnEjkh09yNqYkyE4zlak0INXko0eglinTeZfVT6InZ
 C3n1tS3/V541U0Qoc75J8AAxfTTVw/E1ETX/sBwE+5zWdBnjXkspDEMI/
 qnlJbO6AlYBc4k5Fx4UgCEUNGqsSU5y2P9yRFdZxmyrqkuqsvQGfAR/9o
 cHGGU2COrAds7TC0ew2zDmUIXlHL9mhoI+GqW0a97e4xP4heVbOCk7mQ7
 qrlyBfhY76I1aHAcGMXOgFAX9KqQYKf6YSsM5d0/fTudm2QnGymumLXmb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="359887486"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="359887486"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 05:08:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="835992503"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="835992503"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Sep 2023 05:08:08 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 18 Sep 2023 17:32:28 +0530
Message-Id: <20230918120229.338270-3-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230918120229.338270-1-chaitanya.kumar.borah@intel.com>
References: <20230918120229.338270-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 2/3] drm/xe: Add wrapper over intel_step_name
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

To maintain compatibility between xe and i915, let's create a
wrapper with same name over driver specific calls made to
retrieve the step name.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/xe/xe_step.c | 5 +++++
 drivers/gpu/drm/xe/xe_step.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index 371cac951e0f..9a79451ccf52 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -254,3 +254,8 @@ const char *xe_step_name(enum xe_step step)
 		return "**";
 	}
 }
+
+const char *intel_get_step_name(struct drm_i915_private *i915)
+{
+	return xe_step_name(i915->info.step.display);
+}
diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
index a384b640f2af..3e78d46566a0 100644
--- a/drivers/gpu/drm/xe/xe_step.h
+++ b/drivers/gpu/drm/xe/xe_step.h
@@ -17,5 +17,6 @@ struct xe_step_info xe_step_gmdid_get(struct xe_device *xe,
 				      u32 graphics_gmdid_revid,
 				      u32 media_gmdid_revid);
 const char *xe_step_name(enum xe_step step);
+const char *intel_get_step_name(struct drm_i915_private *i915);
 
 #endif
-- 
2.25.1

