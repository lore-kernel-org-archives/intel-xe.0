Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196F1CD484E
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 19:49:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B8310E89E;
	Mon, 11 May 2026 19:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NydYADNX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC7110E582
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 19:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778528968; x=1810064968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0J7OUEwjlFDd0P/VPmFEOPoCqgXUbGDLh4Hyx2jatp8=;
 b=NydYADNXZQDZhAz3/EzTo7Vay70+tJN5sH14pg15AuViA+jROLd2wiHK
 DtcDgAoMmwFZFZ2qNdDF4NBjwzidYfKtq65eEghOsQ+Q4+8ydmQ8fKun6
 +gzFTbRLU+7YLZ0WIk4trhMFRnxyGOdTrxgy570WUnPys31Ri33TmT6nY
 QmMClmqlE0q9UN3CCocKQTCEGz8NEd4yjLoMAh3w8tP6xPyj3YOWiSW82
 HODHjhKM11ojpHULkXovaUI6xpSWotT3YFvLguE7IhdRy6sRBVqXoIsLp
 uig0zpQU68mxl1zANZ3i9HjbPsgKjxmMgJEJSqlbqdfhvS8FUV7OqAMM/ A==;
X-CSE-ConnectionGUID: 9c5imYgTSqqL3zNq9ioiMA==
X-CSE-MsgGUID: EeJRqN6fSV+iJId0ozZhIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79609910"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="79609910"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 12:49:28 -0700
X-CSE-ConnectionGUID: 54efiBkRRymy9hnJwlSHag==
X-CSE-MsgGUID: akjognYERpWQUwrIMmC+pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="242550370"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa005.jf.intel.com with ESMTP; 11 May 2026 12:49:27 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v2 3/3] drm/xe/guc: Reduce GuC log size from 8MB to 2MB
Date: Mon, 11 May 2026 15:49:24 -0400
Message-Id: <20260511194924.2016315-4-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511194924.2016315-1-zhanjun.dong@intel.com>
References: <20260511194924.2016315-1-zhanjun.dong@intel.com>
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

