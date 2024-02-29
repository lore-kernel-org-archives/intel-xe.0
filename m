Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A316CC54798
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 10:39:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48ADB10E3E0;
	Thu, 29 Feb 2024 10:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NIaA/3ds";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6F810E3E0
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 10:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709203176; x=1740739176;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1gNhBa+yd0cP2/6rg7l0LBxCLN98MUGXAJagLzGjhNc=;
 b=NIaA/3ds2bEVzXtJV0B81mPRUXPfFZzca12qrsp+6JBySIkBRWlVVPC+
 s2BPOnWbhOlVT6Sg1I7pL3lwfD60H/RLq2h8FditHlghbT1HWcB2O3d0I
 B7OoZLo7PObRgK2HIu12eRrPbnZP10tABIH6BDMD+oxcTne8LX9MchuDf
 HdE9HXmYoCW+ikrNk+rAx3RKNW48XqhGw6sb1ifSgr44gbryuj8GZNwQU
 jGtafWC05IItK5PaKXdiJp/w0SqKrsa4RPfqtaH3pF5aWXSEfdCFu3re/
 7BNhyY5SE0cP9RGyTGFHD1EBnGLaYKUB0a2GAGmtGUxJXeMtLdaiqNeSB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="21207766"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="21207766"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 02:39:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8345364"
Received: from mhaehnex-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.3.131])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 02:39:34 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe/kunitconfig: enable drm kunit tests
Date: Thu, 29 Feb 2024 10:39:22 +0000
Message-ID: <20240229103921.249108-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.2
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

This ensures we run the kunit tests for components like drm_buddy,
drm_mm etc which we make use of. The slow drm kunit subtests look to
have been purged, so extra runtime should be minimal.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/.kunitconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/.kunitconfig b/drivers/gpu/drm/xe/.kunitconfig
index ad4b9b4a9f55..604e59b61338 100644
--- a/drivers/gpu/drm/xe/.kunitconfig
+++ b/drivers/gpu/drm/xe/.kunitconfig
@@ -4,6 +4,7 @@ CONFIG_PCI=y
 CONFIG_PCI_IOV=y
 CONFIG_DEBUG_FS=y
 CONFIG_DRM=y
+CONFIG_DRM_KUNIT_TEST=y
 CONFIG_DRM_FBDEV_EMULATION=y
 CONFIG_DRM_KMS_HELPER=y
 CONFIG_DRM_XE=y
-- 
2.43.2

