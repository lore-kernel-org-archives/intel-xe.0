Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3B8C04A6A
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 13:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168A610E581;
	Thu, 27 Jul 2023 13:26:46 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25ED710E123
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 13:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690464404; x=1722000404;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NA2Gd4qH70Mwtq0afa1HwxhaumKAbSargeON43f1g9E=;
 b=ED604hCbF3ndmJg8RnPAMiwgxqqzGy6SjKWW1o6bL2rzT+ul/SVQiMr8
 esFuG903g/y88j1ef8oh2h9nYmf/j66S9U+32V2OSaYeivwZZoPyx0lfq
 SObF9yr7aW4Y9E3hva2nM5GIzxn5arA/Fp+dYAOrIEXvrwPIGsgoxg58N
 x/a4eUCSA7QYla9tmJ2d8nTMdPAgDBjpMeuFd4GsAGEIJp8QchaJiwnc7
 fEzOt/qmmJFxQJ6azTcIZYtMrV32B/JZzGAhuJ8OoM4E7mEEZPyzA6iRN
 PyFxEOBotFevNMh0xcHOzngI4M7rEyfdP+JibZUF+U91LVsb7kAPZKAsj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="365765644"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="365765644"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 06:26:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="973547845"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="973547845"
Received: from cweger-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.37.139])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 06:26:42 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jul 2023 13:26:28 +0000
Message-Id: <20230727132630.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230727132630.7-1-francois.dugast@intel.com>
References: <20230727132630.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/3] drm/xe/macro: Remove unused constant
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
Cc: Francois Dugast <francois.dugast@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove XE_EXTRA_DEBUG for cleanup as it is not used.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_macros.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index 038cf28604ad..a7105050bce0 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -8,7 +8,6 @@
 
 #include <linux/bug.h>
 
-#define XE_EXTRA_DEBUG 1
 #define XE_WARN_ON WARN_ON
 #define XE_BUG_ON BUG_ON
 
-- 
2.34.1

