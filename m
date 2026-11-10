Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DDE606A32A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 10:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kGlRc/k+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048ED10EF4C;
	Tue, 10 Nov 2026 10:17:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F288F10EF57;
 Tue, 10 Nov 2026 10:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794305837; x=1825841837;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vsbsRUNgAlkNmpCYSJ24hB7XUBBsJhC9OvNlfCn5sqY=;
 b=kGlRc/k+wtozFli8OV2neOj3L0cYZx8C1v8mSiYv08xTFS+P9YLhndV9
 ZhHO02tZBdPcaSqduwCXMTFBLb7l6K7SZ+aG6txluhfc9zQPXHM1v5whd
 LiFn0V50LvsYk9lUfxB3GfuvPjcKF1LblaDMOuJMa0/1asMRojjcDI1Jh
 1G5jxZRrfIeVK3jr/X0dh/cqtWLLQ8iO7cbEQzQMDQ0RYF6pBHW4dTRgd
 rOnTVtWqBbrC/HZbq0EkhmMBRt9z9rYmqao3j+W2vIivc10GqIO0/jWtN
 0hALYBSV1s+qlNGED8kH1H1Qdf+TeQQpiQuYgTjB6/CwFZNVNhRY2KwuD Q==;
X-CSE-ConnectionGUID: HKKB8ugBTjiTi+MYr0X6bg==
X-CSE-MsgGUID: FNVG6nqPT1OzBwOt1rTIzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2940581"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2940581"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 02:17:17 -0800
X-CSE-ConnectionGUID: 8Wrii9qkROOp32/u7sY/CQ==
X-CSE-MsgGUID: txFWo7TFSiSbyUwDKsmajg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7979431"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa004.jf.intel.com with ESMTP; 10 Nov 2026 02:17:15 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>, Victor Carreras <vicajilau@gmail.com>
Subject: [PATCH] drm/i915/dp: Don't recheck the eDP link state after a passing
 link training
Date: Tue, 10 Nov 2026 10:17:13 +0000
Message-ID: <20261110101713.3684346-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On eDP, a link retrain power cycles the panel. If the panel reports a
transient link error after power-on, the link state recheck after a
passing link training ends up in a retrain loop. Skip this recheck on
eDP.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17737
Tested-by: Victor Carreras <vicajilau@gmail.com>
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 .../drm/i915/display/intel_dp_link_training.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index ac1aff6edf05..35bf29f7b996 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1800,12 +1800,23 @@ void intel_dp_stop_link_train(struct intel_dp *intel_dp,
 
 	intel_hpd_unblock(encoder);
 
-	if (!display->hotplug.ignore_long_hpd &&
-	    link_recovery_autoretrain_allowed(link_training)) {
-		int delay_ms = link_recovery_autoretrain_pending(link_training) ? 0 : 2000;
+	if (display->hotplug.ignore_long_hpd ||
+	    !link_recovery_autoretrain_allowed(link_training))
+		return;
 
-		intel_encoder_link_check_queue_work(encoder, delay_ms);
+	if (link_recovery_autoretrain_pending(link_training)) {
+		intel_encoder_link_check_queue_work(encoder, 0);
+		return;
 	}
+
+	/*
+	 * An eDP retrain power cycles the panel, which can retrigger
+	 * a transient link error after power-on, leading to a retrain loop.
+	 */
+	if (intel_dp_is_edp(intel_dp))
+		return;
+
+	intel_encoder_link_check_queue_work(encoder, 2000);
 }
 
 static bool
-- 
2.43.0

