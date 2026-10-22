Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62172606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 03:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=StWe0t1h
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BFE1122F7;
	Thu, 22 Oct 2026 03:23:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3502F10E37B;
 Thu, 22 Oct 2026 03:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792639382; x=1824175382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nlp5tERVYpzrky90NGvR+RkCFdEVhOOnOP7OK+DYZ80=;
 b=StWe0t1hTj/AGD5VF3BKX8KQsktMQg0ynbJqy3vAdDsuZErc7/ltb2r4
 6YeiU/iFbg7VbIchnSV6bZYUhMrDIZYN4f39vopvr8e72Q+gGJR7vmZ0P
 XATnDqjgYqJQY/BqtjG8QM3IGzwrjnCef2mMDEu4JIoA8pdB0L6+XbHKR
 8U+hqyekSQdF+sLd9fGGo+CV36uHQwOztLHXAHeIHbKa3iorkDYeiR/g7
 pItMvrrQJyyTcygqWs0zz/AtJuuXGu5lRB0xHwblCoWtKo/REFE1Dhzst
 KcibScWwzSA4fTDfQd7NBVTJOHp9icrzwCzsGaDVkmPL8+NtrosoPSNFp g==;
X-CSE-ConnectionGUID: wbaJe7CvStuTIl2j1bSqUg==
X-CSE-MsgGUID: 0PdAxAc3TmGICSN8ZaZfjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1383488"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1383488"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 20:23:01 -0700
X-CSE-ConnectionGUID: C86G8e9HTrihOaPkNCIj1A==
X-CSE-MsgGUID: Ewu1mCbRQCOoUECEYLX0IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3197285"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa001.jf.intel.com with ESMTP; 21 Oct 2026 20:23:00 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v7 04/13] drm/i915/dp_mst: Limit M/N ratio for MST
Date: Thu, 22 Oct 2026 08:52:38 +0530
Message-Id: <20261022032247.1378809-5-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022032247.1378809-1-suraj.kandpal@intel.com>
References: <20261022032247.1378809-1-suraj.kandpal@intel.com>
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

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

The hardware does not support DisplayPort configurations where the
ceiling of the Link M/Link N ratio exceeds the limit. Enforce this
constraint for MST as well.

The compute config path needs no change: MST goes through
intel_dp_compute_config_limits() too, so the link config filter set up
there already excludes the configurations violating the ratio limit, and
MST fails there if none is left.

What is still missing is pruning such modes, so add the check to
mst_connector_mode_valid_ctx(), reusing the helper the SST mode_valid
uses. It walks the link configurations and only rejects the mode if none
of them can satisfy the ratio, rather than evaluating it at a single
link rate.

v2:
-Drop the checks in the MST link config helpers, redundant now that the
constraint is applied while computing the link config limits. (Imre)
-Share the mode_valid helper with SST instead of evaluating the ratio at
one link rate, since the link symbol clock is not monotonic in the link
rate and there is no single best case configuration.
v3:
-Now that intel_dp_mode_valid_m_n checks for all configs just call
that (Sashiko)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 7023619aaaba..f00edfb66a10 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1565,6 +1565,11 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 					   min_link_bpp_x16,
 					   bw_overhead_flags);
 
+	if (!intel_dp_mode_valid_m_n(intel_dp, mode->clock)) {
+		*status = MODE_CLOCK_HIGH;
+		return 0;
+	}
+
 	/*
 	 * TODO:
 	 * - Also check if compression would allow for the mode
-- 
2.34.1

