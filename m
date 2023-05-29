Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0094CC77B7E
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 08:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C665F10E241;
	Mon, 29 May 2023 08:29:58 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1822810E03A
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 08:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685348997; x=1716884997;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=isxSo1LXJChwYlCT0EoFcpV36aG49RhOJbi7zYPTxfE=;
 b=XzM7dQFcPFv46XycmVpESrfDQGz3S58iTw9jbw03iaYMG23W77lpzA94
 3alVbbs53S04IXmRdnDnn3qMwWVhww4bQiMddGby5Qa4C721bWLDfXqXP
 sryZLUHPdf+fN77xO4w7jKZHBxjlHJPnqHbUQG58lgJYg9wDjjfHBt5pN
 myGF9kb85eicoYZm9+gbQHc5/zFnrnO5XKXkfPbDCy3M9IsvmIJGOXpDd
 Xde1KiH0n8msrEHb/qjuFQs0/mXSub4LVBT3VWDdvEbg+KoCQSt73ZE3t
 e9SdYVz1V+KE3bLQJrYOzQJ5TL+VShzYGU6BKA6cNslbA4NrEmuAi27VP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="420411834"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="420411834"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 01:29:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="771066260"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="771066260"
Received: from ssavadax-mobl.gar.corp.intel.com (HELO bvivekan-mobl.fritz.box)
 ([10.213.96.191])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 01:29:54 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 29 May 2023 13:59:17 +0530
Message-Id: <20230529082917.490986-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/display: Add intel_cx0_phy.c to build
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
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

intel_cx0_phy.c added to Xe module build as there are upcoming changes
to intel_cx0_phy.c required for Xe display support.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index da1e447c08c7..6a3d30b30dba 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -212,7 +212,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_wm.o \
 	i915-display/skl_scaler.o \
 	i915-display/skl_universal_plane.o \
-	i915-display/skl_watermark.o
+	i915-display/skl_watermark.o \
+	i915-display/intel_cx0_phy.o
 
 ifeq ($(CONFIG_ACPI),y)
 	xe-$(CONFIG_DRM_XE_DISPLAY) += \
-- 
2.34.1

