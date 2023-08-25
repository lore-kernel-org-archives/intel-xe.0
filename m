Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14148C7EE2C
	for <intel-xe@archiver.kernel.org>; Fri, 25 Aug 2023 09:39:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15AE10E64C;
	Fri, 25 Aug 2023 09:39:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CBE10E64A
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Aug 2023 09:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692956365; x=1724492365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uaxKD3vzOoOUAvcH39BdyMWlxrWkeoS3dz7/6lx2sCA=;
 b=LJ+Nf7AzzA/gZRM7Hdx035i+Yj6QHw10XD8GsdlBj7SImCdC0kkDA7of
 JYjTEHU89xKn1aVHXtnJAb2wqwyLN9T/5HwNGDvj7/wgaeoea9x8GuFAX
 8+R7YR7R3NpUbC9+xbJ+3LYXcgELw2SEY/gx3yM3+ypnnu3urjnKWp6Wy
 jz1D8qT+5QzGLq/kO6D/Jzhw2+QGaprcD3snusbarn7lA3tZlPRyirYnJ
 tSmeCf6x2LuUwNJkYk79rz8tMIahE5apYNGP4E4S/lqqTKcnrb5E+bkaF
 pnpVIcrMl5kk02wMettwbvCgYLeVTJflLcliHW14Kww8bu3Ffmu7cJRIp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="461037107"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="461037107"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="687246768"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="687246768"
Received: from janlundk-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.56.87])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:23 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 25 Aug 2023 12:38:54 +0300
Message-Id: <20230825093904.1230143-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825093904.1230143-1-jouni.hogander@intel.com>
References: <20230825093904.1230143-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 02/12] drm/xe: Add macro to get i915 device from
 xe_bo
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add helper macro to kill couple of #ifdefs

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_types.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index f6ee920303af..2ea9ad423170 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -70,4 +70,7 @@ struct xe_bo {
 	bool created;
 };
 
+#define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
+#define intel_bo_to_i915(bo) to_i915(intel_bo_to_drm_bo(bo)->dev)
+
 #endif
-- 
2.34.1

