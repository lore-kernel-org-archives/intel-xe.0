Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3A6606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 10:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nd3vjFLT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6844D112AAC;
	Fri, 23 Oct 2026 10:01:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F158C112A9B;
 Fri, 23 Oct 2026 10:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792749668; x=1824285668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LRGY9SjZgAzka1raaukBCY49BmAgw70kyfqY1RCTCJw=;
 b=nd3vjFLTWtCZ6vj9tClqvi7SNAui1hb1VqkXYbJJZSYf9sp51VYlTmmE
 gJWcbAnLGpMSNq0zUNWypOvEmMU8UKdRoyPN7o6Xg6m1+t8sJh7xEV0yl
 0xBOLajom8qERTcAz4+dx3El+lmPT1pnyONY5vtBEho9OK9V8Qkcb0xwx
 fRdAfkiqJCKJ+D6b7583tCQCHLDyRssCeLV1ldG4rrojRidY85Qq0czLt
 wyasjDW1L9ZIBsF+RcCJ3AhecBSrqlMfDTs0RYjfvsThQMzmkJOfOtSmp
 bgBH2xojk7mNvH5/z6pJ612B7nw990uVSg4qT3bWblfp5g9oIlgf5pscl Q==;
X-CSE-ConnectionGUID: XnRaX5cURP6xdggNZVdstg==
X-CSE-MsgGUID: lQ1qfVPjT/u2jFdVOs9CZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1384280"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1384280"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 03:01:06 -0700
X-CSE-ConnectionGUID: heB+kIJsSZKb4g3tfvQXbA==
X-CSE-MsgGUID: C9kcrRbKRxW1IzdFoySuog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3932739"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa001.fm.intel.com with ESMTP; 23 Oct 2026 03:01:04 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 7/9] drm/i915/psr: Resolve the PSR encoders through the
 joiner primary
Date: Fri, 23 Oct 2026 10:00:50 +0000
Message-ID: <20261023100052.683192-8-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023100052.683192-1-mika.kahola@intel.com>
References: <20261023100052.683192-1-mika.kahola@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A joiner secondary has no encoders of its own, uapi.encoder_mask is
zero, so for_each_intel_encoder_mask_with_psr() iterates nothing on its
crtc_state. intel_psr_lock()/intel_psr_unlock() then take no lock at
all, intel_psr_wait_for_idle_locked() never waits, and
intel_psr2_program_trans_man_trk_ctl() skips the cff check and hands the
encoder list head to intel_dsc_su_et_parameters_configure().

PSR is a transcoder level feature driven by the primary, so take the
encoders from there for a secondary.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 26 ++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index ffbb1e55c2b5a..f1d52c39d8834 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2638,6 +2638,24 @@ static void intel_psr_force_update(struct intel_dp *intel_dp)
 	intel_de_write(display, CURSURFLIVE(display, intel_dp->psr.pipe), 0);
 }
 
+/*
+ * The joiner secondary has no encoders of its own, its uapi.encoder_mask is
+ * zero. PSR is a transcoder level feature driven by the primary, so take the
+ * encoders from there. Only valid once the state has been swapped in, i.e.
+ * from the commit phase.
+ */
+static u32 psr_encoder_mask(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *primary_crtc;
+
+	if (!intel_crtc_is_joiner_secondary(crtc_state))
+		return crtc_state->uapi.encoder_mask;
+
+	primary_crtc = intel_primary_crtc(crtc_state);
+
+	return to_intel_crtc_state(primary_crtc->base.state)->uapi.encoder_mask;
+}
+
 void intel_psr2_program_trans_man_trk_ctl(struct intel_dsb *dsb,
 					  const struct intel_crtc_state *crtc_state)
 {
@@ -2650,7 +2668,7 @@ void intel_psr2_program_trans_man_trk_ctl(struct intel_dsb *dsb,
 		return;
 
 	for_each_intel_encoder_mask_with_psr(display->drm, encoder,
-					     crtc_state->uapi.encoder_mask) {
+					     psr_encoder_mask(crtc_state)) {
 		struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 
 		if (!dsb)
@@ -3464,7 +3482,7 @@ void intel_psr_wait_for_idle_locked(const struct intel_crtc_state *new_crtc_stat
 		return;
 
 	for_each_intel_encoder_mask_with_psr(display->drm, encoder,
-					     new_crtc_state->uapi.encoder_mask) {
+					     psr_encoder_mask(new_crtc_state)) {
 		struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 		int ret;
 
@@ -4109,7 +4127,7 @@ void intel_psr_lock(const struct intel_crtc_state *crtc_state)
 		return;
 
 	for_each_intel_encoder_mask_with_psr(display->drm, encoder,
-					     crtc_state->uapi.encoder_mask) {
+					     psr_encoder_mask(crtc_state)) {
 		struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 
 		mutex_lock(&intel_dp->psr.lock);
@@ -4132,7 +4150,7 @@ void intel_psr_unlock(const struct intel_crtc_state *crtc_state)
 		return;
 
 	for_each_intel_encoder_mask_with_psr(display->drm, encoder,
-					     crtc_state->uapi.encoder_mask) {
+					     psr_encoder_mask(crtc_state)) {
 		struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 
 		mutex_unlock(&intel_dp->psr.lock);
-- 
2.43.0

