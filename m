Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06E7CE79AD
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 07:22:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE3F10E161;
	Wed, 20 Sep 2023 07:22:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216AD10E162
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 07:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695194525; x=1726730525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tM5DLAMRs1DtNRpvS420qWpDJ6DubR9zfj8l1PBpt0M=;
 b=jAMV14UTy+Gmb6bUy2swpaEMWzfmNBH7MJcQxfV6WrZPQYWB5OM0a+Kh
 2JO7LWHeDyBHaFBLxpkjjy9gektOmK7hIp7y2MXYgk01IIGgJiH5DW1cJ
 f0GpmiCvR7cEKQWcS5M6V4hYwonY7KwDxscs3uQpXnpCln5gVHbJb8dcc
 pFZOj4wvwwzulcLKiK0JtVxcVosTvimE3Lqbs5M7Ao+4eS3RyQkwLlLLZ
 grMP2dfS11+36PChheXHXU7lX/YC2dZWHEug6DCy8n8JIpIOD8glYDRYc
 YaW19fr5cMgGadvHawvPJnZn65CkDpD+kPJBWqKxGhclopPVtrx+vWJkU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="383994062"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="383994062"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 00:22:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="870264416"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="870264416"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orsmga004.jf.intel.com with ESMTP; 20 Sep 2023 00:22:03 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 20 Sep 2023 12:46:59 +0530
Message-Id: <20230920071700.434195-3-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230920071700.434195-1-chaitanya.kumar.borah@intel.com>
References: <20230920071700.434195-1-chaitanya.kumar.borah@intel.com>
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
index 371cac951e0f..23ca9e4f2fa6 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -254,3 +254,8 @@ const char *xe_step_name(enum xe_step step)
 		return "**";
 	}
 }
+
+const char *intel_get_step_name(struct xe_device *xe)
+{
+	return xe_step_name(xe->info.step.display);
+}
diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
index a384b640f2af..277947f61f71 100644
--- a/drivers/gpu/drm/xe/xe_step.h
+++ b/drivers/gpu/drm/xe/xe_step.h
@@ -17,5 +17,6 @@ struct xe_step_info xe_step_gmdid_get(struct xe_device *xe,
 				      u32 graphics_gmdid_revid,
 				      u32 media_gmdid_revid);
 const char *xe_step_name(enum xe_step step);
+const char *intel_get_step_name(struct xe_device *xe);
 
 #endif
-- 
2.25.1

