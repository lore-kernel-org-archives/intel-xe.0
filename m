Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B28CA0ECA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 11:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0464D10E40A;
	Tue, 12 Sep 2023 11:47:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A931A10E40A
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 11:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694519217; x=1726055217;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9v7bEtls9eGkEB5ULdhNlV7oYcQtNkzKNsBGV/zWtqk=;
 b=G/IF83vFpxrhhNcy3kIh88cXP9zgSIcS2RmC2W5UwRHOeX9mwEaolTYo
 zgUT9qFrylXoHvIb/IErr7ErtEEZX35pUdYqPg4F3iwfsY6O4r1xXH8/w
 YUYuCVK2JvUHhDE8e06shRmZOeuVl2niDKRw1er4K8kThLBxO28wFm8bY
 vniM/WCfr3SCy32e5+kMLGqoNO1CO+OOlIz/brxbM5ubBpNOBPt+etfh3
 OqabIxNwlgY3pl/L4FfqmadBcIXO7X1lM0SMB7RUCNsVxaEBfJwx+m9hk
 An7dLlopYI+ovH17u+Vi0f3+jPxwtLHoORw1wH5z861+pfwd6XFQsiq3p g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444784451"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="444784451"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:46:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="778767971"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="778767971"
Received: from sptommas-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.216.207])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:46:55 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 14:46:41 +0300
Message-Id: <20230912114641.2990078-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912114641.2990078-1-jouni.hogander@intel.com>
References: <20230912114641.2990078-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] Revert "FIXME: drm/i915: add a lot of
 includes in intel_display_power.h"
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

This reverts commit 304baa8c20cfad330a6c7cad47d86043e968642c.

We can revert this now as missing includes are added into
compat-i915-headers/i915_drv.h.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
index b51442fe5976..ec2b5560877f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -10,11 +10,6 @@
 #include <linux/workqueue.h>
 
 #include "intel_wakeref.h"
-#include <linux/types.h>
-#include <linux/bitops.h>
-#include <linux/mutex.h>
-#include <linux/workqueue.h>
-#include "intel_runtime_pm.h"
 
 enum aux_ch;
 enum port;
-- 
2.34.1

