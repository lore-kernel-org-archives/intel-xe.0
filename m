Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC30CD3446
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 18:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B219C10F258;
	Thu,  7 May 2026 18:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FjoEiwep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2452B10E2B7
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 18:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778177182; x=1809713182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0J7OUEwjlFDd0P/VPmFEOPoCqgXUbGDLh4Hyx2jatp8=;
 b=FjoEiwepJD2oxIIKG9fyvFTvdSDrI/jO3CPznFJnyph4JISAyv6JlnXo
 xCOVEFePK+xTSt/IeJMywH2izffwn0JDgVbpiN9H9dSZeHCITWP1YyFpl
 AmaX1nLrvxEi7cEa4PTwsi863J32eM2e/u5qasSxcjeCmLg4YYdJX6KeP
 PLqGYzOfDaWzFvpJnfW9JP4cMrELZ/OoyM59mbkl+wbiKQR8BxnHkMj21
 d2SIhSWDyQIl9cfBhbefEN/4jf9EE/ckt3yYdz2jmiECCYNSI7G2z+Ez+
 T1mlEmPuMpPgvdQMOQPECw8peitPxjOQwpTHEygIFYyqWUhDGNHpL9c3c Q==;
X-CSE-ConnectionGUID: E6tvORnoQVGfAxXIDVWl/w==
X-CSE-MsgGUID: //hWbe6VTrGTfGugolWusw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79325190"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79325190"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 11:06:21 -0700
X-CSE-ConnectionGUID: hl5hhXouTAOe/5kxnPWZSw==
X-CSE-MsgGUID: f6O4hmSyQymp0wPHWT43dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="259968796"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa002.fm.intel.com with ESMTP; 07 May 2026 11:06:20 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH 3/3] drm/xe/guc: Reduce GuC log size from 8MB to 2MB
Date: Thu,  7 May 2026 14:06:18 -0400
Message-Id: <20260507180618.1420986-4-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507180618.1420986-1-zhanjun.dong@intel.com>
References: <20260507180618.1420986-1-zhanjun.dong@intel.com>
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

Reduce the default log buffer size to improve system responsiveness and
readability. The previous 8MB threshold caused significant delays during
log output and imposed a heavy load when printing to dmesg.

By reducing the size to 2MB, we maintain a sufficient history while
ensuring faster flushing. With a typical 4:1 compression ratio, this 2MB
buffer will result in approximately 512KB of compressed data, providing an
efficient balance between log depth and system performance.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index d231def50692..44e81a54681f 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -17,7 +17,7 @@ struct xe_device;
 #define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_1M
 #define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_2M
 #elif IS_ENABLED(CONFIG_DRM_XE_DEBUG)
-#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_8M
+#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_2M
 #define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_1M
 #define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_1M
 #else
-- 
2.34.1

