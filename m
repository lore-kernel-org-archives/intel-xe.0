Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5908C021A9
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 21:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9E910ED43;
	Fri, 14 Feb 2025 21:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9s/Yp8w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA65810E08A
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 21:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739568224; x=1771104224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9x1fFW6zL6n7aJNJK2rrZ0aj39qKExj29f+G85GpWJo=;
 b=X9s/Yp8wU8XrUNpsBF3NP+N4wtS37l/n2ERcK7SKfCkptEEuEfMJwgch
 JK8MBt13RXpVe52gLSrlSgj3B98j44LrBXFJts5QMHg/l4LFiOvW5G7aZ
 /d0TRz35c9tMbJrmjjIZudamCi8FWqVJn4U8sUdB6XxNibo5FUxe4X4SE
 XnHRgvEo6YQnC8pkCKvTEBLy4ckzow+2eZzOpOO5sUWFc6gHILuijFTSI
 aLVv1/Gi+0hOIvqOubW32Bz5jPMYyngJxgVTBif+fm/wRbV+MVrdQY7ZG
 R4tadroAcR3owjMP19Jy5TTEeZfGvByQ7xGTYDTp/7zM52D26O7o0HsOC w==;
X-CSE-ConnectionGUID: lQXiuA7DSGKVrvcqq43GOw==
X-CSE-MsgGUID: /Qdxs9jpR7mfn26ixgDXKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40447019"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40447019"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 13:23:43 -0800
X-CSE-ConnectionGUID: 8b6I4ZJxQM+o1UALzjwoxw==
X-CSE-MsgGUID: CZw/lCmIQrq4jPKED2BPlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="113757029"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 13:23:43 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/9] drm/xe: Switch from xe to devm actions
Date: Fri, 14 Feb 2025 13:23:07 -0800
Message-ID: <20250214212313.1767562-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214212313.1767562-1-lucas.demarchi@intel.com>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
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

Now that component drivers are compatible with devm, switch to using it
instead of our own.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 2 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index f2064cfb55cf2..5ad2c99a9ae74 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -184,7 +184,7 @@ int xe_display_init(struct xe_device *xe)
 	if (err)
 		return err;
 
-	return xe_device_add_action_or_reset(xe, xe_display_fini, xe);
+	return devm_add_action_or_reset(xe->drm.dev, xe_display_fini, xe);
 }
 
 void xe_display_register(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 31c90577faf0b..8cf70b228ff3b 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -490,7 +490,7 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
 
 	gsc->proxy.component_added = true;
 
-	return xe_device_add_action_or_reset(xe, xe_gsc_proxy_remove, gsc);
+	return devm_add_action_or_reset(xe->drm.dev, xe_gsc_proxy_remove, gsc);
 }
 
 /**
-- 
2.48.1

