Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191D2D6408B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 21:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928C810E170;
	Fri,  8 Nov 2024 21:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SeIKs9Qy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41ADB10E170
 for <Intel-Xe@lists.freedesktop.org>; Fri,  8 Nov 2024 21:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731101258; x=1762637258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x6v9N1Dn3Ca0w0wUg6w71ysGPKop9Rwd1JpF+Pw5S34=;
 b=SeIKs9Qy0QRMAZluhl2k7f2xeJmyyb+qZbZjNV2o4PExq05NjmlDuN8a
 B/AHxGoRta0YOtZ5Wl3yUJhFPGVo4k9waXixbAild5QQ01a07ii3bWVsY
 Y6u2S1mvZ+TAW9Hnvg2gUiZ+WTg7OAcd9LOM4UUbtB7HciT/531OwqjLv
 77i0SELdgLpPwZUQkz1N7aWHiKi5cC/6+qVr1qsuIE6EFxnZa7DFX3Md4
 9YI44ASdQEJmQ4vFShBNPmxr4YAryyamN0wS7pTf7ap2ClALp8cXSvDlc
 I5FhnRJ+oA2ck5cY0yU2I5EVaR8esOxCXMKI1l+8ciiH7gCWGdC9FjGEF Q==;
X-CSE-ConnectionGUID: gKXhO5sZQ8C09r5+uH/Maw==
X-CSE-MsgGUID: PlpHhzyqRyG1YDSbMF3Abw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30854864"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30854864"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 13:27:38 -0800
X-CSE-ConnectionGUID: hMi2zDSFRE6oqhSD1OHrbQ==
X-CSE-MsgGUID: qfc5Jh/eTjemSArrKxcJwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="85744258"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa010.jf.intel.com with ESMTP; 08 Nov 2024 13:27:38 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 1/2] drm/xe/guc: Reduce default GuC log verbosity
Date: Fri,  8 Nov 2024 13:27:36 -0800
Message-ID: <20241108212737.2044007-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108212737.2044007-1-John.C.Harrison@Intel.com>
References: <20241108212737.2044007-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Drop the default verbosity from 5 (max) to 3 as the extra verbosity
generally doesn't provide anything vitally important but does cause
rapid log overflow.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 77ce9f9ca7a5..0f2c20e9204a 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -19,7 +19,7 @@
 
 struct xe_modparam xe_modparam = {
 	.probe_display = true,
-	.guc_log_level = 5,
+	.guc_log_level = 3,
 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
 #ifdef CONFIG_PCI_IOV
 	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
-- 
2.47.0

