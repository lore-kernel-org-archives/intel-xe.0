Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0797DE77180
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 06:42:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B104210E06B;
	Wed, 11 Dec 2024 06:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LLe7J/KO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B1010E06B
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 06:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733899355; x=1765435355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IYjuV0kS/NUiQF5kd8UrSciJgzfqjJ4/pvFoQjsSyBs=;
 b=LLe7J/KORZa2xZzov0wouICXm0M6FKrQ754p5msZql2WxRrMfT7dI8dL
 LiRtiotQgJyF52KhNjTizIz0s+pd8x1+iV5B4HpQbFfKzsMuwEkmPczq/
 KTazyEo9OM9AnMhG+9woCVlTzmAmv6VlqgGiDocuIsWoa7KEbwU3g5BdH
 hZbGe2F+4V1EFUA7U6Q4D6EjdKgW0M+ropiRUrYR+EIQE94sPdFZJc1OY
 apBJxp5+PAAMeUNDyxTUoPCaTuyv+wr+Ph6BpAxda5VZxyHpfPMM6EY1S
 mprFvIxbPl1YmeG4ZRUlUrRINkE9aoqV8lwzpXc3COOdtSojoaEtLQ8HM g==;
X-CSE-ConnectionGUID: vhRzxruRTPiXxxYOSdnHgA==
X-CSE-MsgGUID: EJz3djSNQUOaNXFi2aUnAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44936051"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="44936051"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 22:42:35 -0800
X-CSE-ConnectionGUID: luBihrNQQJWacqpkMKeJxw==
X-CSE-MsgGUID: QaRc9VhIRIqkg8O7t3iyNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100505815"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.97.233])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 22:42:31 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 Piotr Piorkowski <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH 2/3] drm/xe/rtp: Add match helper to omit SR-IOV VF device
Date: Wed, 11 Dec 2024 07:42:10 +0100
Message-Id: <20241211064211.781820-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241211064211.781820-1-marcin.bernatowicz@linux.intel.com>
References: <20241211064211.781820-1-marcin.bernatowicz@linux.intel.com>
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

Add a match helper that allows the application of a workaround
when the device is not an SR-IOV VF (Virtual Function) device.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c |  5 +++++
 drivers/gpu/drm/xe/xe_rtp.h | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index b13d4d62f0b1..7a1c78fdfc92 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -340,3 +340,8 @@ bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
 	return dss >= dss_per_gslice;
 }
 
+bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
+			       const struct xe_hw_engine *hwe)
+{
+	return !IS_SRIOV_VF(gt_to_xe(gt));
+}
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 827d932b6908..7dea10d732d7 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -476,4 +476,15 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
 bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
 					 const struct xe_hw_engine *hwe);
 
+/*
+ * xe_rtp_match_not_sriov_vf - Match when not on SR-IOV VF device
+ *
+ * @gt: GT structure
+ * @hwe: Engine instance
+ *
+ * Returns: true if device is not VF, false otherwise.
+ */
+bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
+			       const struct xe_hw_engine *hwe);
+
 #endif
-- 
2.31.1

