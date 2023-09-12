Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32451CA0EC3
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 11:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41DA10E406;
	Tue, 12 Sep 2023 11:46:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D62210E401
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 11:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694519217; x=1726055217;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=02KDY76xrKtqgelttd2JgxHZOLqXjcrwkpym6r0q7oY=;
 b=DWErqzd0XuylrDDPXuS9f2rDZuVpgBWyeFX+wX0ozXumUo7k2OPndGpC
 HnaAk0z3lACVThm+p3vyqGDXBUtNadyF7CEr+4PB5cQK3cs8iK71iR91x
 zZ+wFJ5M0mq050C2SQfUR2sUMW1D667q+zNu+FATx6gXUnOx68uUOpMAS
 bUITpQVybu3Q+qAofLRfldJ3X6EQaaInAe16ZIc0Y1FfK6ltOcfKftt2I
 3nOTyCLt6DTI04VOL83Bi/RfozvBC5V9z+8GGGZ+XAzuOzUJTUh0lfCjH
 vtmODYIc0JJDWDQAPZou40+EzGOqvXyiGi6hRWBKDDI5TQQ6z7A/L1qW3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444784446"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="444784446"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:46:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="778767963"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="778767963"
Received: from sptommas-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.216.207])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:46:54 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 14:46:40 +0300
Message-Id: <20230912114641.2990078-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912114641.2990078-1-jouni.hogander@intel.com>
References: <20230912114641.2990078-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] fixup! drm/xe/display: Implement display
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

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index d629fd48a14c..22d019fbdaa0 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -18,6 +18,7 @@
 #include "i915_reg_defs.h"
 #include "i915_utils.h"
 #include "intel_uncore.h"
+#include "intel_runtime_pm.h"
 #include <linux/pm_runtime.h>
 
 static inline struct drm_i915_private *to_i915(const struct drm_device *dev)
-- 
2.34.1

