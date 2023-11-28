Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E168C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 15:15:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3236910E56D;
	Tue, 28 Nov 2023 15:15:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C17210E56D
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 15:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701184522; x=1732720522;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=sneBSbIM7c1l7wju18THLZnhqjVv9Nmrt/VhWoxaLE8=;
 b=Fv2x1oaj5bHvRWTf6r2gabcGF6ogY9M77hVg5awhd54tChvVGhigxb4A
 +N/N5dHQKcZbIB77f9X+kbQDkQ8xyKTAIRtJvair8FdI9qtebaAJkZunL
 lnOOdd1HmVpi1I/X67Oycz3ec7WKOZURnivHPD7ssrwRodOF0LphqD62O
 HGhWyUQ0MWK/joLn3TSK7LxNO9xFQ+UdWAqKVQGpMpsJiGZBVSpA2Tw8c
 7JticOVQv3Q+nuuPtpO7n/BCqzEaK/+Cpr7CAYw5W9xfhpIBna41cCo9+
 rRJtEWqZ7O3VsQmlEI2nnqVISNGTIxhpRtrKItvP84c8Th7McgztPhyJp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="11637943"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="11637943"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 07:15:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="744937018"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="744937018"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.140.124])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 07:15:20 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 16:15:03 +0100
Message-Id: <20231128151507.1015-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231128151507.1015-1-michal.wajdeczko@intel.com>
References: <20231128151507.1015-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/5] drm/xe: Define DRM_XE_DEBUG_SRIOV config
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

We will be using extra logs during enabling of the SR-IOV features
or when adding support for new platforms. Define separate config
flag to keep that low level logs disabled if we're not debugging.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 11bb13c73e7b..549065f57a78 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -40,6 +40,16 @@ config DRM_XE_DEBUG_VM
 
 	  If in doubt, say "N".
 
+config DRM_XE_DEBUG_SRIOV
+	bool "Enable extra SR-IOV debugging"
+	default n
+	help
+	  Enable extra SR-IOV debugging info.
+
+	  Recommended for driver developers only.
+
+	  If in doubt, say "N".
+
 config DRM_XE_DEBUG_MEM
 	bool "Enable passing SYS/VRAM addresses to user space"
 	default n
-- 
2.25.1

