Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9727110F92EB
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 18:34:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5572210EB13;
	Tue, 31 Mar 2026 18:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yjs/fmp5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343BC10EB09;
 Tue, 31 Mar 2026 18:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774982072; x=1806518072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HED23QZTBIh8aN2pgZToeFOzHgcQhA6fiI8jyCKxxlo=;
 b=Yjs/fmp5Cpuohz3MCTT5+HxX14u7nXPoRMqXteaCDVhyd8+BFm/fOnWE
 7i3UnykM8nXS5Ois/y7HD28ODD9RChSOGLafN0rkQEj/OybsZ3aBk8Bcd
 JnTVGxHz/shE3arethAUiaJx+EKVEOgQe6V/AdhwdL2ggy3JeaHLt1nfb
 G4A86Oi7V8dK5rhJnzBMwU9wlhtcpH1+bY676Vyi0LiAAOxXpyfeMDS30
 0MVQxNutNsjr+tsz0ltwlJ058bFdajK+gRTwz3ZOLoqs9dGXzNx6VP4xt
 RWTQeVL/kLVfRrnjKQliyq+Iq4iuIUGpbPr3LFVikFzlggCwG1lCPHyrU w==;
X-CSE-ConnectionGUID: SIaOw0u7QI6515RhcpMbiQ==
X-CSE-MsgGUID: 8L5GeBo4QHOasyzOgqgp8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86705161"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="86705161"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 11:34:32 -0700
X-CSE-ConnectionGUID: Eau3cGrER2m5rXW5Gtj0Cg==
X-CSE-MsgGUID: /1Sl8uOMSSqA1M1xShG+Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="256944446"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 31 Mar 2026 11:34:31 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v1 03/16] drm/i915/buf_trans: describe VS/PE Override layout
Date: Tue, 31 Mar 2026 20:33:19 +0200
Message-ID: <20260331183332.1773886-4-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260331183332.1773886-1-michal.grzelak@intel.com>
References: <20260331183332.1773886-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Name indices of each present VS/PE Override table. Reflect tables'
layout by grouping indices into enums. Pack & unify all enums into union
ddi_vswing_preemph_index.

Naming of the data structures is far from perfect and should be a
subject to renaming.

Capture Vswing / Preemphasis Override tables' layout from MTL onward.
Add a placeholder for ICL+.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 .../drm/i915/display/intel_ddi_buf_trans.h    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h
index bea6fb2ec6f4..20bf1d749344 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h
@@ -74,6 +74,41 @@ struct intel_ddi_buf_trans {
 	u8 hdmi_default_entry;
 };
 
+enum lt_vswing_preemph_index {
+        XE3P_VS_PE_UNSET = -1,
+	XE3P_VS_PE_DEFAULT = 0,
+        XE3P_VS_PE_EDP = 3,
+        XE3P_VS_PE_DP14 = 4,
+        XE3P_VS_PE_DP21 = 5
+};
+
+enum snps_vswing_preemph_index {
+        MTL_C10_VS_PE_UNSET = -1,
+        MTL_C10_VS_PE_DP14_RBR_HBR = 0,
+        MTL_C10_VS_PE_DP14_HBR2_HBR3 = 1,
+        MTL_C10_VS_PE_EDP_NON_HBR3 = 2,
+        MTL_C10_VS_PE_EDP_HBR3 = 3,
+
+        MTL_C20_VS_PE_DP14 = 4,
+        MTL_C20_VS_PE_DP20 = 5
+};
+
+enum icl_vswing_preemph_index {
+        ICL_VS_PE_UNSET = -1,
+        ICL_VS_PE_DEFAULT = 0
+};
+
+union ddi_vswing_preemph_index {
+        enum lt_vswing_preemph_index lt;
+        enum snps_vswing_preemph_index snps;
+        enum icl_vswing_preemph_index icl;
+};
+
+struct ddi_vswing_preemph {
+        struct intel_ddi_buf_trans *buf_trans;
+        union ddi_vswing_preemph_index index;
+};
+
 bool is_hobl_buf_trans(const struct intel_ddi_buf_trans *table);
 
 void intel_ddi_buf_trans_init(struct intel_encoder *encoder);
-- 
2.45.2

