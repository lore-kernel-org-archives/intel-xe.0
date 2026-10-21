Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94DF606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 07:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=df1oL4xk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB7289067;
	Wed, 21 Oct 2026 07:07:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4A889067;
 Wed, 21 Oct 2026 07:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792566423; x=1824102423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XsuqeYevWrDPOfPpzOGh/P70u/mZRNRLJUNqrjhvUio=;
 b=df1oL4xkKA9Hl1gMMpdG9Y2S+cG97S84KLItPp8fL6mcLVsbPccy11El
 CICW46E8dl/UjV1qRAgkhBL1zMm32918oKXz2hpcmhMy7Gg6KLKC+eZIY
 8B/orAiz4puFIWuzg3l7sdcOuFBg+Kp4jTR5S+cY97GoDkkSpb3WCQ54M
 D7wKrYmMgI375zJthcalgf8U0UsaJ45NIisMKjMP+1414Q84ZZmvsEXxm
 deeAsDMFp8NGnKQacpRYHrvdTXf7JQ9XUSnAOAlnAihfh/Ms+lIQGxF8o
 opW9W8QpoCV517iRt4Splp9a970Siv7RL8wp+vXw5XlLp1ZOIm3vPHoQT Q==;
X-CSE-ConnectionGUID: rQqlLLSMTvORGT/DeZBuIA==
X-CSE-MsgGUID: k1JI6RAKTuKcIUA942pIHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1264595"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1264595"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 00:07:01 -0700
X-CSE-ConnectionGUID: z9OR3Y+/S/ug3k/xRGp2dA==
X-CSE-MsgGUID: YyKHnUzLS1mPqls8cuUUMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3439823"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 21 Oct 2026 00:06:59 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v5 11/11] drm/i915/dp: Bump the max Link M/N ratio to 22 for
 DISPLAY_VER >= 35
Date: Wed, 21 Oct 2026 12:36:24 +0530
Message-Id: <20261021070623.1158624-12-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917050649.871960-1-suraj.kandpal@intel.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Starting Xe3p max M/N ratio has been increased to 22.

Bspec: 68922
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 045524994d85..5864e33456a7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1272,6 +1272,9 @@ bool intel_dp_has_dsc(const struct intel_connector *connector)
 static int
 intel_dp_get_max_m_n_ratio(struct intel_display *display)
 {
+	if (DISPLAY_VER(display) >= 35)
+		return 22;
+
 	if (intel_display_wa(display, INTEL_DISPLAY_WA_14014191401))
 		return 4;
 
-- 
2.34.1

