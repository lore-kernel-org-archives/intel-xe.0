Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B416CCD183
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 21:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C03210EB2C;
	Thu,  9 Oct 2025 21:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1qlV56g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C8310EB2C
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 21:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760047071; x=1791583071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tz2LanOmHXkZZtmuDAa7CgNdJNsE50yoZgW+6KOPoNQ=;
 b=b1qlV56gXZBL7mVaQGv0FuubIitROsEPaAKGIFbobzyu4NQGhFVG2bfY
 MTRS6BH3RgXA706wqGwwpOHylQhVxYtFSPVSXG0VGlrn5/OBk0EOP3QCQ
 o7uzwuGjx3yb2mguH/6z9M1B+7BRjVndmOhC4l6OfZe8kKOUwRPZ+E2Cs
 ++xFi41bxa3fpev9A5sNoCcIagHJOdiHyeckSy7yvvWckuXrVkQf94D4p
 pzaMl5zTxOREpDd0F89IbONVQqBm4MX/Sg/UFGbGR6/9tRD40gIBe99/f
 p5Y0Bh4Y0ZW5FPWBT5haKkj01eQ+FfK1sR3andCZxVe7Z1kljMOi/3GnY A==;
X-CSE-ConnectionGUID: /2o9quGNR72eN3hYrZk3nw==
X-CSE-MsgGUID: MnRLCU24T1itCY2OQFkwoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="64889887"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="64889887"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 14:57:51 -0700
X-CSE-ConnectionGUID: ajsrYLR9Sh653f2OAJCS8g==
X-CSE-MsgGUID: jR+H0WLpSeiSflHhDSiY7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="185199882"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa005.fm.intel.com with ESMTP; 09 Oct 2025 14:57:51 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
	Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v5 1/2]  drm/xe/guc: Update GuC log buffer type value
Date: Thu,  9 Oct 2025 17:57:48 -0400
Message-Id: <20251009215749.378905-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009215749.378905-1-zhanjun.dong@intel.com>
References: <20251009215749.378905-1-zhanjun.dong@intel.com>
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

Update GuC log buffer type value, to align with the GuC specification.
Update buffer offset calulation.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_log_abi.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_log.c      | 13 +++++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
index 554630b7ccd9..b1819679fa35 100644
--- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
@@ -10,8 +10,8 @@
 
 /* GuC logging buffer types */
 enum guc_log_buffer_type {
-	GUC_LOG_BUFFER_CRASH_DUMP,
 	GUC_LOG_BUFFER_DEBUG,
+	GUC_LOG_BUFFER_CRASH_DUMP,
 	GUC_LOG_BUFFER_CAPTURE,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index c01ccb35dc75..b5d837efaf74 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -330,10 +330,15 @@ u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_typ
 	enum guc_log_buffer_type i;
 	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
 
-	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
-		if (i == type)
-			break;
-		offset += xe_guc_get_log_buffer_size(log, i);
+	switch (type) {
+	case GUC_LOG_BUFFER_CAPTURE:
+		offset += XE_GUC_LOG_CRASH_BUFFER_SIZE;
+		fallthrough;
+	case GUC_LOG_BUFFER_CRASH_DUMP:
+		offset += XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE;
+		fallthrough;
+	case GUC_LOG_BUFFER_EVENT_LOG:
+		break;
 	}
 
 	return offset;
-- 
2.34.1

