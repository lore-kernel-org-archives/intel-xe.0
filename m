Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91DCC25B67
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 08:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916D910E958;
	Fri, 27 Oct 2023 08:00:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A2810E94F
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 08:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698393629; x=1729929629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4MJtr6XtgI8yIP6c4kQIUXG0nvHn/X2IFLT+2aZUS5k=;
 b=C4GvMmxkriXR0Vynw/fCzBXxHRGfGdzN8UGMLLwYYugJZCA80SyygO4Z
 80NH6CtlCyam0E6f99bvUHNmEBytq6d2pVyvoefps89LBUtElTPWShqTA
 cIquthEafja6gihtuWMMMcnv3eVrsySRr+uXGnWyvDVwNQr4qlgdozrqZ
 jeXWrQ+FJTvZwSrjqsbxU32E6gsvKBSL0SbyHhSj86R0D9XdGa0VJvWgd
 GUEYWDcZPrWuwagMvNxzB81/7sL7dAiZ/AbtAeq/VdTsqrEmMX6AiyYmQ
 m8gjy33Km8SQw3Cr+wnZr0krrHX5u7sWyOKPfrIOAROJ4oMOM7bTAVqLw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="391603891"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="391603891"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 01:00:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="794510428"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="794510428"
Received: from inyestex-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.212.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 01:00:28 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 10:59:17 +0300
Message-Id: <20231027075918.2206862-31-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027075918.2206862-1-jouni.hogander@intel.com>
References: <20231027075918.2206862-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 30/31] fixup! drm/xe/display: Implement display
 support
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

Call intel_display_device_remove. Intel_display_device_remove is freeing
memory used by device parameters.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 391f08c1caca..77c71c7612ce 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -276,6 +276,8 @@ void xe_display_driver_remove(struct xe_device *xe)
 		return;
 
 	intel_display_driver_remove(xe);
+
+	intel_display_device_remove(xe);
 }
 
 /* IRQ-related functions */
-- 
2.34.1

