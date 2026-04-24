Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E6DFB44D8
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 20:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6F410E405;
	Fri, 24 Apr 2026 20:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eDvyufce";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D7610E119
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Apr 2026 20:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777063832; x=1808599832;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=1txT5byins2zFeHQxV9f/WP3hB+w8nm6W3v0lCDxaMA=;
 b=eDvyufcePgTreICyS8mH6edyf86SQOUM+vkCYLHta5v9Va2cRB/ozbiA
 2UOSD/xjmMDKVj/XqiT58bKO6+chO5G2e0IKpRj9/X8lxXbKb/L6vfNsF
 /QSL9AuIFT21XalLgXYveqQn2bArhHbShENmp+z/2sBWssDewJ1WsbihN
 gWfBu4zzdHW3KytCSMd68Uj2DQcJbIUzk4w1PP4Jh2a2J7dObDfoqGDha
 F3YDsteK3tZ1y3a7ir3D4/SmyFARbEqbOpetDiLO4ZEoWgd8u84U0KaHv
 rFpEzD1q1POSrM1Zf9+uNBGTfKha3wXfE08QVF/4B0jrUVApD9R2CVEpS g==;
X-CSE-ConnectionGUID: A5Pe7fLbTNiHbG6AVtqKkQ==
X-CSE-MsgGUID: UUU0+pueRXWpFh+BFVJbyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="80633996"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="80633996"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 13:50:30 -0700
X-CSE-ConnectionGUID: OGAnFIS0RhKNzgbgBUin+A==
X-CSE-MsgGUID: ZoGrVuZbRKm3vQYr0fNOGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="256560128"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 13:50:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 24 Apr 2026 13:48:12 -0700
Subject: [PATCH v2 02/10] drm/xe/rtp: Add "always true" match function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-engine-setup-v2-2-59cc620a25f1@intel.com>
References: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
In-Reply-To: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 Shuicheng Lin <shuicheng.lin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3083;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=1txT5byins2zFeHQxV9f/WP3hB+w8nm6W3v0lCDxaMA=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp69eUgFvumj7mE2cJtqx4uH+vuZbcOgYb/k/BG
 fhfQHcvpKmJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaevXlAAKCRBNeSQFyHKQ
 BGGkD/4s3fmqe+JU8SlCyr2TavV7KtY7AQO4euS1zR2dXgrWHhzJpxqvMmczHqp1BR0bIfawsLe
 fqg8eNBUhxiylzwHEZ1eXbVJcys8Xmq6mJQmRKgMDww638bKNJyy/ta1oKtln+lUtH430hcVbNF
 eilVUPma6Xihc85VUkeWOgHGHkhy2WYGIse8IJjbQw1cp3O+OtJDxKB6OIIAhTy66BTM6NPs0sv
 mHM3SzQFcX4pdssE2U/+WxXF2qR2d1aufAbzeT10zA1lLRvsX1glRwcXRTxe8QdjAR7XIQkxEy/
 OlLzrhXs/pB3KcnSqof6HroVRQBcikhILqmoKH5o4ZXPZC1JSFfzjJmgV4i6DqLuFhHjCjyR5se
 DO7azWayckVjUDYSSSz8YEi/gJQnTJi9wjmy7YIriw2qyIJeyBYYONFO+T/nkQopQRQc2QAcPkc
 FtbF/1PTeQYhn+c8Gh2FaZ7cwI/rN9u6Oa3CYElYtB/6pNhdqBA50V03b3Cfb/tCZyDYiNpXu0p
 2BW8+jdvfHncSwDFoGNEdPe6v2jO8udBMV4ftkWHUYjdx72WUBBleJn++eg+WoudxCci23PQM5y
 Zdgy8X17MGP5cd8kxh3gi4tEtmQ7iOcK1YCChdnQadR2E6gkDMdSBE2np0DRzdJIBfA96fdWNz1
 e6ukLLRevHE53eg==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

All RTP table entries are required to have at least one rule.  In cases
where an entry should apply unconditionally across all platforms we've
been using a graphics version range of 12.00 - forever since this covers
all platforms supported by the driver.  However if the primary GT is
disabled via configfs (not actually possible today, but probably
possible in the future) or if we have a future platform that lacks a
primary GT and only supports media/display, this rule would cause
important programming to fail to apply on the media GT.

Add a simple match function that just always returns true
unconditionally.  This solves the worries above while also being more
immediately human-readable.

Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c |  2 +-
 drivers/gpu/drm/xe/xe_rtp.c       |  7 +++++++
 drivers/gpu/drm/xe/xe_rtp.h       | 12 ++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 74f29025dd6c..c7d211178300 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -430,7 +430,7 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
 	const struct xe_rtp_entry_sr engine_entries[] = {
 		{ XE_RTP_NAME("RING_CMD_CCTL_default_MOCS"),
-		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED)),
+		  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
 		  XE_RTP_ACTIONS(FIELD_SET(RING_CMD_CCTL(0),
 					   CMD_CCTL_WRITE_OVERRIDE_MASK |
 					   CMD_CCTL_READ_OVERRIDE_MASK,
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 991f218f1cc3..728933a1c34f 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -352,6 +352,13 @@ void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process);
 
+bool xe_rtp_match_always(const struct xe_device *xe,
+			 const struct xe_gt *gt,
+			 const struct xe_hw_engine *hwe)
+{
+	return true;
+}
+
 bool xe_rtp_match_even_instance(const struct xe_device *xe,
 				const struct xe_gt *gt,
 				const struct xe_hw_engine *hwe)
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 4537ff46a17f..d058a629cd3e 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -459,6 +459,18 @@ void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
 
 /* Match functions to be used with XE_RTP_MATCH_FUNC */
 
+/**
+ * xe_rtp_match_always - Match RTP entry unconditionally
+ * @xe: Device structure
+ * @gt: GT structure
+ * @hwe: Engine instance
+ *
+ * Returns: true, regardless of inputs
+ */
+bool xe_rtp_match_always(const struct xe_device *xe,
+			 const struct xe_gt *gt,
+			 const struct xe_hw_engine *hwe);
+
 /**
  * xe_rtp_match_even_instance - Match if engine instance is even
  * @xe: Device structure

-- 
2.53.0

