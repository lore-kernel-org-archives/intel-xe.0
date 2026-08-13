Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBE0C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 16:10:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D2F10F3FC;
	Thu, 13 Aug 2026 16:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lc10SKMI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AC110F40A;
 Thu, 13 Aug 2026 16:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786637418; x=1818173418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LaJFOK0G6yNH0L366sJ2vLhoutyHXH4l/rzJyXu94wo=;
 b=Lc10SKMIUDwVTaTFY8qwPIIIg/5KU+c9I6kw+e7xcav16ecQ71VIxDtr
 tow+MDPalVt3r7xu6StCu5s3/oIzUdj/S92esRTlwFej2F9/ltpwFZxY9
 kuDv3El1HNyP93TFlakboJBpIA8sSbm8Cz/4SnURYqhAQBJsdhA/kFhEv
 o/EWqR66cFOXPrmERFTylPBnEH4PxnWjDQnhAIYTVXofLgxdrww9WS/ul
 UykpgMYqYSEN88snAg9DI8giO9msL825a8cL1DrKC94RaHWIlENeCQzcg
 76BNHdSESUlxpA0LqA6zE4tUV8AemW7C+g81xPd+Vd80AjwnsP83wFiBY A==;
X-CSE-ConnectionGUID: NWT6R4oBQkaGuzzKbNEhsA==
X-CSE-MsgGUID: ZBEZo9OoRv6bPorYSCoGNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97882447"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="97882447"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 09:10:18 -0700
X-CSE-ConnectionGUID: Mlm1wS8qTK27immwyECs3Q==
X-CSE-MsgGUID: jXl1FV3rTtaxX/6Wy1idVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="260175393"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 13 Aug 2026 09:10:17 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v11 5/8] drm/i915/buf_trans: add vfunc for VS/PE-O
Date: Thu, 13 Aug 2026 18:09:15 +0200
Message-ID: <20260813160918.918857-6-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260813160918.918857-1-michal.grzelak@intel.com>
References: <20260813160918.918857-1-michal.grzelak@intel.com>
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

Choosing correct table for Vswing / Pre-emphasis Override is platform
specific. It also requires different checks that are already used for
choosing predefined tables.

Add new get_buf_trans_override() vfunc into intel_encoder returning
deparsed table from VBT#57. In next patches, set it inside already
present if-ladder from intel_ddi_buf_trans_init() instead of duplicating
it.

Note that get_buf_trans() cannot be overwritten since there are cases
when we need to rollback although VS/PE-O was requested, eg. DP is not
connected or feature is not yet implemented for the platform. Assume
that vfunc returns NULL on rollback and return predefined tables.

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c | 8 ++++++++
 drivers/gpu/drm/i915/display/intel_display_types.h | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
index 4cd1e4d76c7af..f31283a0331b7 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
@@ -1857,5 +1857,13 @@ const struct intel_ddi_buf_trans *intel_ddi_buf_trans_get(struct intel_encoder *
 							  const struct intel_crtc_state *crtc_state,
 							  int *n_entries)
 {
+	if (encoder->get_buf_trans_override) {
+		const struct intel_ddi_buf_trans *override;
+
+		override = encoder->get_buf_trans_override(encoder, crtc_state, n_entries);
+		if (override)
+			return intel_get_buf_trans(override, n_entries);
+	}
+
 	return encoder->get_buf_trans(encoder, crtc_state, n_entries);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 20a07ea06b5ef..bad3ff471423c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -289,6 +289,9 @@ struct intel_encoder {
 	 */
 	enum icl_port_dpll_id (*port_pll_type)(struct intel_encoder *encoder,
 					       const struct intel_crtc_state *crtc_state);
+	const struct intel_ddi_buf_trans *(*get_buf_trans_override)(struct intel_encoder *encoder,
+								    const struct intel_crtc_state *crtc_state,
+								    int *n_entries);
 	const struct intel_ddi_buf_trans *(*get_buf_trans)(struct intel_encoder *encoder,
 							   const struct intel_crtc_state *crtc_state,
 							   int *n_entries);
-- 
2.45.2

