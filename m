Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BF6FDEE53
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 22:49:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C6610E121;
	Thu, 23 Apr 2026 22:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SqTxhlqu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663BF10E107
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 22:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776984548; x=1808520548;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=k2DJmSdKQwQFc6ITUJaj+7fApA3EYxUOY+DZ2LyL4Jw=;
 b=SqTxhlquOJlDjuA6V8krewsl9TPRISuCWgbfU9VfZQB2HQ0q+e8dBumx
 kR1cwaU7HMp9g8hRuMi0Vg/LFHnvW16xXPO6xmRN0+TqZxIb1kROK/6Nj
 m9C4NYpHwAPLgDKvdgB6Mipo4UCxyNpNeVT1C02B9snvSXfICjG+yk+X7
 vBK3IzajNz1P9zi0rjq8rk4iYK9Q+ATcXr4D8CtzUNuN2R+ZadVp9abzA
 q/oD1dOsrjGDcTbgrzQDyAEENho1Ay7gpg7i4xcSITo+R6A9ZYNAIyOLe
 5CsA1bCP21mlOP4gnMT1hUWrrhvz6ItoKo192jYO9t/H9WuM2M69kJzMM w==;
X-CSE-ConnectionGUID: PlhRz80MSk+BWl58w9YAEA==
X-CSE-MsgGUID: 4eDX7SVHRn2PnsOSHtHs+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="65497065"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="65497065"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:08 -0700
X-CSE-ConnectionGUID: ReuUHv3ER3ejaRzKhrX30w==
X-CSE-MsgGUID: kohc/DFwRym0eX3j0a9WNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="232696187"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 23 Apr 2026 15:48:49 -0700
Subject: [PATCH 02/10] drm/xe/rtp: Add "always true" match function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-engine-setup-v1-2-baa94014e3e5@intel.com>
References: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
In-Reply-To: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3029;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=k2DJmSdKQwQFc6ITUJaj+7fApA3EYxUOY+DZ2LyL4Jw=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp6qHeKT94/Q25Wz1sx0lqJG3JbwGhvTAYL9lkz
 7ttseOqW/+JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaeqh3gAKCRBNeSQFyHKQ
 BIM7EACOm7coN6o/+oQDIqNMnrJEHCSOF2k1VtW8ccEKV8cKi7I06rI6bPZp851I7A4bQfOVg9k
 PNfU8TbsWHjuRunkxhVOKnteC32HRpcojPBl8m5/RaubJb/J2iaRB2ilhEs+LfuODIMjlt7mIJA
 Y1U7QIRtt9BMzo394Gnoyl7vcuYYSVELQti3qTRvRz7sJMfWKVXO/UTkVv0UP1N/FI7vXMNaTsp
 59WKmDsoN8ZzeJ7nZbxpDCNObNwxdJFh0KE7pc3yXhEnVnWSAmuotudwoxV0HHExmhndJhVbXfv
 awb2Hy7iGV/t+6RUhv4KtFDGRwQW7xLkq3EYnm8Gl+3EVo3Ekl5KSbJBCSCDghAw0XMvm3ai498
 9sMSFIN1EaOPFHXXTdfy6h9Kh3/WjgtV1n5x727iBRQJWomM4k6yXx4VarkBKoRXFI76xW6E4y/
 mMtEvrbI+LG5h/L3Zm87St8sZ83TgY7mFExAx47hPoOCdvHMIQg03a2tm14F+9sisiRinL1sHCJ
 ZTWQdoCgFAzBVHhtUvREDeAVyyieXXrJP2vECXgzwzwxUkylt5uGQCkQ5hVc2SqBOrRfbmLNyv9
 HKMgPFSh6coOAoOnWGCHgseZu3ZNbds2/Ujq0bISe9CScZKureoS/BGrkhWswvZ2c6L91d2+1bT
 6Jbwup6b28NJg7g==
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

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c |  2 +-
 drivers/gpu/drm/xe/xe_rtp.c       |  7 +++++++
 drivers/gpu/drm/xe/xe_rtp.h       | 12 ++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 3d9931f54cee..48cb52a1ec2d 100644
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

