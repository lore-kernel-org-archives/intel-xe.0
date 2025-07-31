Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8CFC83F17
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 11:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF3D10E777;
	Thu, 31 Jul 2025 11:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TVXkcknH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C2410E777
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 11:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753960339; x=1785496339;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Fg+8Pvxy255PjcxU0enWusUCGGylayVD73MdEJlPEJs=;
 b=TVXkcknHUEASzI8zHHPBkMFBSWVntLOY2jfr4muhF/bzLS2lOJ0DUZFs
 9CFKY88yWo/LpXEhoQOD+xoTikwBS+oMqdNZukLtoZPc7bNJEWhR/JPan
 3p3L6EVQGAAL/euXqQtM4hjU4EWvNNdUdjhVyh9s4MmdaGPvgdOdeE+H8
 9guK3janJFrs/IeFQgVnsJ4Y4Dw1C0M5ChyHrOHEsX1wNz1AJ7CNZxrMc
 dTO25OfG21FbLNuChVus23+4RQf3WZ/0b+/oKWV2a9F/9iCp1hagmjQpQ
 /NMGAr0QQRTisxJMYw4yvC+gANz/VaVX8Jkz98OIhA69JZuP8CJxaEKEX Q==;
X-CSE-ConnectionGUID: trKO6uTDQoiMxrn6ocnnNA==
X-CSE-MsgGUID: 5IbG1TUNTlyD22HgPDTniA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="59927838"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="59927838"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 04:12:19 -0700
X-CSE-ConnectionGUID: E1ez+uSrSSuEN0YDXhm96w==
X-CSE-MsgGUID: L+3KqdGnTHmE4KgY5SGAng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="164034964"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.108])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 04:12:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/xe: fix stale comment about unordered_wq usage
Date: Thu, 31 Jul 2025 14:12:14 +0300
Message-Id: <20250731111214.1130130-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Display has switched to its own workqueue, no longer using
xe->unordered_wq.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 38c8329b4d2c..01e8fa0d2f9f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -427,7 +427,7 @@ struct xe_device {
 	/** @ordered_wq: used to serialize compute mode resume */
 	struct workqueue_struct *ordered_wq;
 
-	/** @unordered_wq: used to serialize unordered work, mostly display */
+	/** @unordered_wq: used to serialize unordered work */
 	struct workqueue_struct *unordered_wq;
 
 	/** @destroy_wq: used to serialize user destroy work, like queue */
-- 
2.39.5

