Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD07DCA5FCE
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 12:23:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBF710ECAD;
	Mon,  5 Oct 2026 12:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BSxrdjbF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395C210ECAC;
 Mon,  5 Oct 2026 12:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791203001; x=1822739001;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KeUXObBD8gLkvpJ91KBSDQ1hX7GST1kfeLjMCZQ7XT4=;
 b=BSxrdjbFw5q6dm3nzVT3NqlXHsP3LXoQPdt42iSijz++f3E2MFlgcFnf
 l1Wfxg19nub5gjtc7ZapRkkptcEiTfL/irLUD9qSn9TOorlL/JqxZKbqA
 /AKnfa7l6JInUWSb+KbskdIa6UtBNC/w97F52u6oDCcSAxkKHD2TMFuJ+
 w2BLRSXMJI+mB9oky3KRjtmGwJJZs0GGLI8PZKA9liLOQcffi2j97HkPY
 +kWyZI+BMDbLnLC2hlUPo3TjK9pVeMnKctzpMJVqCdGaD7uzJHaJ605s0
 9n3qiFYcUxxd/QUAkumeS8fK9wbhuzhQHhx46GkSi/b+GkoGtn8MYRFjJ Q==;
X-CSE-ConnectionGUID: bGwD9GTETAifa9fxyKItfw==
X-CSE-MsgGUID: xejgybnyTn6tVOic0WqtqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="109361051"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="109361051"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 05:23:21 -0700
X-CSE-ConnectionGUID: 4f+TIqJpQDGcsac5VggNiw==
X-CSE-MsgGUID: PGnI8WcYQqitLfiz7ZEeng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="304763349"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.184])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 05:23:19 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/dp: only complain about a busy AUX engine when
 it's unexpected
Date: Mon,  5 Oct 2026 15:22:09 +0300
Message-ID: <20261005122302.110968-3-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005122302.110968-1-luciano.coelho@intel.com>
References: <20261005122302.110968-1-luciano.coelho@intel.com>
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

When intel_dp_aux_xfer() gives up on a transaction because the AUX
engine is still busy, the DRM helpers retry almost immediately.  If
the engine still hasn't recovered by then, the pre-transaction busy
check reports "not started" as an error, even though this is the
expected outcome of our own earlier decision to leave the engine
alone.

Remember that we left the engine busy and only log a debug message in
that case.  Keep the error for the unexpected cases, namely when
someone else is using the channel or the engine is hung without us
having given up on it first.  A permanently hung engine is still
reported by the 100ms timeout error.

Assisted-by: LLM
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h |  2 ++
 drivers/gpu/drm/i915/display/intel_dp_aux.c        | 14 +++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 0e3083e852d5..1987b2dbd151 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1891,6 +1891,8 @@ struct intel_dp {
 	struct drm_dp_desc desc;
 	struct drm_dp_aux aux;
 	u32 aux_busy_last_status;
+	/* we left the AUX engine busy and are waiting for it to recover */
+	bool aux_left_busy;
 	u8 train_set[4];
 
 	struct intel_pps pps;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index 2e8261cd641a..d0d37ef7556f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -359,7 +359,16 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 	if (try == 3) {
 		const u32 status = intel_de_read(display, ch_ctl);
 
-		if (status != intel_dp->aux_busy_last_status) {
+		/*
+		 * If we left the engine busy ourselves, this is expected
+		 * while it recovers.  Otherwise someone else is using the
+		 * channel or the engine is hung.
+		 */
+		if (intel_dp->aux_left_busy) {
+			drm_dbg_kms(display->drm,
+				    "%s: not started, still waiting for the AUX engine to recover (status 0x%08x)\n",
+				    intel_dp->aux.name, status);
+		} else if (status != intel_dp->aux_busy_last_status) {
 			drm_err(display->drm,
 				"%s: not started (status 0x%08x)\n",
 				intel_dp->aux.name, status);
@@ -370,6 +379,8 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 		goto out;
 	}
 
+	intel_dp->aux_left_busy = false;
+
 	/* Only 5 data registers! */
 	if (drm_WARN_ON(display->drm, send_bytes > 20 || recv_size > 20)) {
 		ret = -E2BIG;
@@ -402,6 +413,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 			 * alone, the caller will retry the transaction later.
 			 */
 			if (status & DP_AUX_CH_CTL_SEND_BUSY) {
+				intel_dp->aux_left_busy = true;
 				ret = -EBUSY;
 				goto out;
 			}
-- 
2.53.0

