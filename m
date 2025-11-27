Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26911D116E6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 01:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAAE810E716;
	Thu, 27 Nov 2025 01:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eglE0Jjy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAFD10E716
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 01:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764207919; x=1795743919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=59YiIAM3jtMs8Jf6wxHdBuOkTJP/g0PbnV+AL8mNb+I=;
 b=eglE0JjypxM8l5pRf/8BeUfLqa3+F00EQ4Y7Rq03T9S+L9Hx/hW/mETE
 OLDQNxgyQNJ9A2omDEN8br8tpww3Xz+7TNWmRCqn7OIBhrRPZGBgYN8D0
 1iu+au1CBu/Dj+PGsSLj/3g7GnOvbfeMwyu4BIFWFVJXNm9R6bgOpy1A9
 1MeJxxHvN/fd6gIgSVLwfqMp6PZbn3eJ2YinFVFFlW6/wjHooeKVmY8CT
 Bb123T3pHqQCsfZJj0lFxcErr02AieeIv0kZXFmKPV+MQuxqFxbK/6cno
 yyz2p8TBNGMiGekrzdHqR1lbsSqAV/W6D48oSzWXrMlrwf+6m9NKW0iJc A==;
X-CSE-ConnectionGUID: IwSJMeTcTmC3Jn9UaB4pGA==
X-CSE-MsgGUID: fiQR6ur8Tkqa/BuK+6H3Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70114841"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="70114841"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 17:45:19 -0800
X-CSE-ConnectionGUID: jyjy9OoxTdybwhswIUbC4A==
X-CSE-MsgGUID: RuKEw5sbRB2WPMd31E5sRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="192753342"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 17:45:19 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 01/10] drm/xe/gt: Add engine masks for each class
Date: Wed, 26 Nov 2025 17:45:07 -0800
Message-ID: <20251127014507.2323746-13-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
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

Follow up patches will need the engine masks for VCS and VECS engines.
Since we already have a macro for the CCS engines, just extend the same
approach to all classes.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 9d710049da45..e70789dfac6e 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -20,7 +20,14 @@
 		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
 			  xe_hw_engine_is_valid((hwe__)))
 
-#define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
+#define __ENGINE_CLASS_MASK(gt, name) \
+	(((gt)->info.engine_mask & XE_HW_ENGINE_##name##_MASK) >> XE_HW_ENGINE_##name##0)
+
+#define RCS_MASK(gt) __ENGINE_CLASS_MASK(gt, RCS)
+#define VCS_MASK(gt) __ENGINE_CLASS_MASK(gt, VCS)
+#define VECS_MASK(gt) __ENGINE_CLASS_MASK(gt, VECS)
+#define CCS_MASK(gt) __ENGINE_CLASS_MASK(gt, CCS)
+#define GSCCS_MASK(gt) __ENGINE_CLASS_MASK(gt, GSCCS)
 
 #define GT_VER(gt) ({ \
 	typeof(gt) gt_ = (gt); \
-- 
2.43.0

