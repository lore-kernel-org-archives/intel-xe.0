Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E89EC77B7D
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 15:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387BD10E213;
	Mon, 15 May 2023 15:16:09 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE2D10E213
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 15:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684163768; x=1715699768;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CJcRhru83vVh2tWdwhpQH6sXpKnuG14dCo0ZFZZYi54=;
 b=WxX0Cm+bfZdY0mFrHCWPF3Y9/CpHOWNvGQ/JNGAFJO9KvNODl0OBHix/
 eQWEaCG3RwmKB7uFZskc6NoFq4gNotL8+Q7pBhoYpoiSFN77qKY1j1Xgu
 xpJJOz25NZZUsIR9Jg11HY2F0XdlzmRtZIocdvAf14MDFLLIJSnH1eagA
 5Xg3xhidvGAFgT4/c8vppBk9rAbUFJR6EMASKErfK/GAsvKtglo9bjWal
 i6OuRdgxtT1S34f5M9PF36528kp1R13+Tk+H81lc/7V21jQityli7uLia
 DjpKPLyBwYujPkSphErFabosK+ChhcpWv6SZpHShFGJakLv++g4yyQo21 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="350066642"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="350066642"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 08:16:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="770655877"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="770655877"
Received: from nawras-intel-hp.ger.corp.intel.com (HELO
 4dee81237d25.intel.com) ([10.251.220.163])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 08:16:05 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 15 May 2023 15:15:48 +0000
Message-Id: <20230515151548.13-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe: Introduce a new DRM driver for
 Intel GPUs
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
Cc: Dugast@freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: "Dugast, Francois" <francois.dugast@intel.com>

The driver contains code under GPL v2 license and code under MIT license.

Link: https://www.kernel.org/doc/html/latest/process/license-rules.html
Cc: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Dugast, Francois <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 6860586ce7f8..ae37c229a0b7 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -79,4 +79,4 @@ module_exit(xe_exit);
 MODULE_AUTHOR("Intel Corporation");
 
 MODULE_DESCRIPTION(DRIVER_DESC);
-MODULE_LICENSE("GPL and additional rights");
+MODULE_LICENSE("Dual MIT/GPL");
-- 
2.34.1

