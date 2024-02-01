Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B97C47DDB
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 07:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A06C10E45E;
	Thu,  1 Feb 2024 07:48:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5BD10E45E
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 07:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706773687; x=1738309687;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HcBRpN1TH4V4qBu/BsWwTiYG83YLdLuwmOt3PHukGrk=;
 b=Te4rmSjzDDbscv7i2ZTH3kkwi3k2GgpdFxU9/ejWyb6cJaSrlJFobl8J
 DbOljgBunk1ufgU75M9Ag627ZMB7V3wMV4dIGVcePk48hVNb+qrvMxwRw
 VZzI1u9PpWg6sydtMTSY2NWg1hhrL7YoXEP95M3LnkIleVlJO4PKcC+Fx
 OL/CsJ1kVQxtB6VjqHhDKOJPwHi5Dazm05jgZsPp536C7Pz1wG4fwfuTN
 F0FaIpMXGNY/01x3gvj9qSv+s/JTVrbOm051jeVpm11WskgnFs5ZGUhh/
 MdZpXsuMZ6BvKmCBw19SRwaxtjR6GcHubI4N0v1wUR0xFDiZ0byknLkl8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="11212015"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="11212015"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 23:48:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788868145"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="788868145"
Received: from sbint17x-mobl.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.18])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 23:48:04 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/Kconfig: Select FB_CORE with FB_IOMEM_HELPERS
Date: Thu,  1 Feb 2024 08:47:54 +0100
Message-ID: <20240201074754.3336-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

FB_IOMEM_HELPERS depends on FB_CORE.

Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index e36ae1f0d885..e0bcf835e0a5 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -48,6 +48,7 @@ config DRM_XE
 config DRM_XE_DISPLAY
 	bool "Enable display support"
 	depends on DRM_XE && DRM_XE=m
+	select FB_CORE
 	select FB_IOMEM_HELPERS
 	select I2C
 	select I2C_ALGOBIT
-- 
2.43.0

