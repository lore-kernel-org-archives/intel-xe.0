Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FE3CD3436
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 01:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CC610EF48;
	Thu,  7 May 2026 01:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gGR9nFAE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1B810EF49;
 Thu,  7 May 2026 01:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778117530; x=1809653530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A/rOSicLOlnKtrUmH+oMvSJl4hokAyaauVbnOKwDCgU=;
 b=gGR9nFAEM6oV3lX2SRkmiuAXl5oIrHwgU9Xc1zc+3MCWhP13FRgudwah
 5DFa991SheS+7qKgQrzuXx9t+lrLAp+w6H65/mgRmfu0EcWVzkUHg67Yh
 Vm8AgDq8H8dTlfJQNARzSVTHvRWN30X1KHLtifKYVMTqQo2EsrSdWtTeH
 Jv6+bzrBCYkPsl1PQGKWDAl3fZ3PqtTSVbL9yYwn3osKWINiB12KvNgLQ
 SOX317UjH0rLqLBEW+IcqrJ6pMIRQJLVla9HNRo0b0RmhBmiNjMnnNSFY
 XNYexgCt0XdhCFagbGAB3Yy9HrSxNDw6O/4/3v1euFA2ByQYbQ5Ll04po g==;
X-CSE-ConnectionGUID: RU0aFS1CSPWOeyks0pmpMg==
X-CSE-MsgGUID: SGtrnbmwTkOKOcMEEAYSkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78089035"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="78089035"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:32:10 -0700
X-CSE-ConnectionGUID: ih5unZMoSHiNuEKIfO9Bhg==
X-CSE-MsgGUID: OsKxE4mxR6yR00qXBh8kWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="266692793"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 06 May 2026 18:32:09 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v3 14/31] drm/i915/buf_trans: abstract VS/PE-O index
 computation
Date: Thu,  7 May 2026 03:31:20 +0200
Message-ID: <20260507013137.527510-15-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260507013137.527510-1-michal.grzelak@intel.com>
References: <20260507013137.527510-1-michal.grzelak@intel.com>
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

Move index computation for most appropriate VS/PE-O table into separate
function.

Unlike VS/PE-O tables' parsing, index computation cannot happen during
DDI ports parsing. It is because computation depends on link's port
clock, which can change with every modeset. Thus index computation must
be deferred to occur during intel_ddi_buf_trans_get(), after tables'
parsing has completed.

v2->v3
- break logging into two lines
- return -EINVAL instead of -1 (Suraj)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 .../gpu/drm/i915/display/intel_ddi_buf_trans.c   | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
index 38f2a030c018d..9ae7a780a7639 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
@@ -1786,6 +1786,15 @@ xe3plpd_get_lt_buf_trans(struct intel_encoder *encoder,
 		return intel_get_buf_trans(&xe3plpd_lt_trans_dp14, n_entries);
 }
 
+static int
+vspeo_compute_index(struct intel_encoder *encoder)
+{
+	drm_dbg_kms(to_intel_display(encoder)->drm,
+		    "VS/PE-O unsupported, using default VS/PE tables");
+
+	return -EINVAL;
+}
+
 void intel_ddi_buf_trans_init(struct intel_encoder *encoder)
 {
 	struct intel_display *display = to_intel_display(encoder);
@@ -1859,9 +1868,10 @@ const struct intel_ddi_buf_trans *intel_ddi_buf_trans_get(struct intel_encoder *
 							  const struct intel_crtc_state *crtc_state,
 							  int *n_entries)
 {
-	if (encoder->vspeo)
-		drm_dbg_kms(to_intel_display(encoder)->drm,
-			    "VS/PE-O unsupported, using default VS/PE tables");
+	if (!encoder->vspeo)
+		return encoder->get_buf_trans(encoder, crtc_state, n_entries);
+
+	vspeo_compute_index(encoder);
 
 	return encoder->get_buf_trans(encoder, crtc_state, n_entries);
 }
-- 
2.45.2

