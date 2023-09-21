Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD584E70719
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 11:15:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA6F10E5C9;
	Thu, 21 Sep 2023 11:15:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1E310E5C7
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 11:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695294899; x=1726830899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CdqUZWer8NN81FJC3qvCgRk+66YJSEiYR6OzlCjW7II=;
 b=Uld1zufxu2kS+3zcwJxLOwaToG3q9UvbLhabFfId3HwRyV3iymebCYmJ
 djBUrxtvlY0RwixFaF88QRgbtYcw/EwafM0SLFtL6W1QZdjwycaxPWcUm
 7B5nyRIDe5Y8j97EFRJZvowf46FGq/Mha7q5a332F2Pd7F5ftON/jqZMu
 YbT3fWBHKM5lx+1zfcaeTR5O/tnHc+FeImnDXJFZlJ/cSs/jUAx61l227
 pUHYRitb3YG4t7dTJnA7lZcTsjlHVNZn33a2tXz/u44sZUMjPOQhx/T8B
 QtD/SGrtyktrekFIiswh0XBaEM5xdT2ZaqF3meoi7bksIe6086knteI7t w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359872817"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="359872817"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:14:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="994040717"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="994040717"
Received: from jhogande-mobl1.fi.intel.com ([10.237.72.74])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:14:57 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 21 Sep 2023 14:14:33 +0300
Message-Id: <20230921111434.3051325-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921111434.3051325-1-jouni.hogander@intel.com>
References: <20230921111434.3051325-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/4] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
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

Introducing xe_runtime_pm doesn't really belong into drm driver
introduction patch. Let's remove it from here and add back in display
implementation patch where it's needed.

v2: Remove xe_runtime_pm completely from DRM driver patch

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a82f28c6a3a0..c0d5ca62df7b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -401,9 +401,6 @@ struct xe_device {
 	 */
 	u32 edram_size_mb;
 
-	/* To shut up runtime pm macros.. */
-	struct xe_runtime_pm {} runtime_pm;
-
 	/* For pcode */
 	struct mutex sb_lock;
 
-- 
2.34.1

