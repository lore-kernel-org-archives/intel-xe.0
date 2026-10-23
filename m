Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DEC606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 10:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BLLULf/o
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58622112A8E;
	Fri, 23 Oct 2026 10:01:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50AF112A82;
 Fri, 23 Oct 2026 10:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792749659; x=1824285659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gkWww/4h6Sae2nB2++c1gIjheasR8zm3cZEjMC95u2A=;
 b=BLLULf/o7DCVWqVi03TePd92g8Nzq9cYMA0zedn3LO9t1g+DyGc18D8k
 wz1KMb33YMilosoKtG+KZGGByrkZqD459YEtEEyeagqQOlH45ceIVhAz5
 1jS4e2txxmF1i1gQ1aWkFJAiFG/Kq9exyA5gks62ujawpCJEKmLXxRRD7
 BcUprRANvulc1kiH3+Epuu0cBkqyPyvsUR4YTGz6O+9bkilrTPEqQEGqG
 hdK7/8JB9kO+0VYtm32fFPCCM2ymj5Vx7hS7OepkLa5zK1jn6UqoM3EcQ
 22vz5NjCMZwOSI9gNFtJexur8ey5YlA7Wl4MyUR5CKTJx6KffS1Lw2ClM Q==;
X-CSE-ConnectionGUID: shu2Eh3RQFqnDRnTmKCgvA==
X-CSE-MsgGUID: /Q5RQ1h2T9ijs4qcHqShNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1384255"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1384255"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 03:00:59 -0700
X-CSE-ConnectionGUID: ZAWyDILPSMuBbp2rk3moHw==
X-CSE-MsgGUID: QWAq7U5CTNypDpauSFTplA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3932690"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa001.fm.intel.com with ESMTP; 23 Oct 2026 03:00:57 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 2/9] drm/i915/psr: Exclude the joiner secondary from
 active_non_psr_pipes
Date: Fri, 23 Oct 2026 10:00:45 +0000
Message-ID: <20261023100052.683192-3-mika.kahola@intel.com>
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

active_non_psr_pipes holds the pipes that are active but not driving
PSR. Masking out only the primary leaves the joiner secondary counted
as a non-PSR pipe, even though it belongs to the same PSR instance,
which blocks DC5/DC6 and keeps Wa_16025596647 applied.

No functional change, joiner is still rejected in compute_config().

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 27ccccdc72315..fb9b5013a9649 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1862,7 +1862,7 @@ void intel_psr_set_non_psr_pipes(struct intel_dp *intel_dp,
 	active_pipes = intel_calc_active_pipes(state, active_pipes);
 
 	crtc_state->active_non_psr_pipes = active_pipes &
-		~BIT(to_intel_crtc(crtc_state->uapi.crtc)->pipe);
+		~intel_crtc_joined_pipe_mask(crtc_state);
 }
 
 void intel_psr_compute_config(struct intel_dp *intel_dp,
-- 
2.43.0

