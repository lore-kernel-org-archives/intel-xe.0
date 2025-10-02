Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F32CCA471
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 15:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2375F10E7F6;
	Thu,  2 Oct 2025 15:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TCJCy/Lf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F0510E1B8
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 15:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759417385; x=1790953385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=arg6c71h6qJeIi4gYNXxWiUChwbgIUY6pXoxhc0Vd+k=;
 b=TCJCy/LfBbntXStFI/ai7kHLoDFHnU1UvnPsNZjrv7burzoKdIuaBmeT
 rKJqP34S+qspCTrdjbpC9JsGPfO5tDhCXq7LHlbq5eNsf2UzFKl56ZakE
 zsmijgw/kWUND7XA45iIULQJmBC8Fex4Hkx7Z9ocPNyR5V7oPnMo+ViCa
 N72Ai8yBdi37XJAoVEOz76uRoRoAzrfRB8UEvWlsOuU1Xo85HY2aN+2lx
 iF988jOTITE/Fj6Su1T30savFUc1NH/wmzs1eVooE90oKrRetAX4/paZs
 facnOwUojI0KD6ghMlhBxG/CDHwiWeJprsuEwgjMpmhB0L22wWz6q3rjL Q==;
X-CSE-ConnectionGUID: MZZ2vh21SJianYFpsxlf9Q==
X-CSE-MsgGUID: yDlgH1I3TeqpWdEwaRyX7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="60741285"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="60741285"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 08:03:05 -0700
X-CSE-ConnectionGUID: hwX8nU8STka/bV8MVN1HvQ==
X-CSE-MsgGUID: hhLDezn2RlqhNFjVM2+LMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="178334921"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa010.jf.intel.com with ESMTP; 02 Oct 2025 08:03:04 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v4 2/2]  drm/xe/guc: Update GuC log buffer type value
Date: Thu,  2 Oct 2025 11:03:02 -0400
Message-Id: <20251002150302.99524-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002150302.99524-1-zhanjun.dong@intel.com>
References: <20251002150302.99524-1-zhanjun.dong@intel.com>
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
Rename GUC_LOG_BUFFER_DEBUG to GUC_LOG_BUFFER_EVENT_LOG.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_log_abi.h | 2 +-
 drivers/gpu/drm/xe/xe_guc_log.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
index 554630b7ccd9..1a487164b980 100644
--- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
@@ -10,8 +10,8 @@
 
 /* GuC logging buffer types */
 enum guc_log_buffer_type {
+	GUC_LOG_BUFFER_EVENT_LOG,
 	GUC_LOG_BUFFER_CRASH_DUMP,
-	GUC_LOG_BUFFER_DEBUG,
 	GUC_LOG_BUFFER_CAPTURE,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index fa1d490dca0d..900b39fc734f 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -293,7 +293,7 @@ u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_typ
 	case GUC_LOG_BUFFER_CRASH_DUMP:
 		offset += XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE;
 		fallthrough;
-	case GUC_LOG_BUFFER_DEBUG:
+	case GUC_LOG_BUFFER_EVENT_LOG:
 		break;
 	}
 
-- 
2.34.1

