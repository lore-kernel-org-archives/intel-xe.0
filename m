Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1B1C83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 18:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7061010E6EE;
	Tue, 22 Jul 2025 18:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TyWOPyf9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CE110E6EE
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 18:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753208795; x=1784744795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e8YZfObYaHf6kYTaTc+1L2K8FpG7fnRPH6Va1Ocp970=;
 b=TyWOPyf9ZfhKALfnsiPyqz9dHmGeV87AoBhueLXNNfTn3mIv2fDm+NVC
 pOECLfWZzOIboui9wC80rCOaiIZGf7eEalFFYUuWdAeMkAUhiHPWzbP1C
 mwICPr8xB5A9fDmYm4pUwjP9IQ5ftQy8YtwXALEQslVV4R8kTavbaGv8y
 aI7GW1DDAEbmBFbU/0WMjXBSfwLt1Sf/DvDqLeC4tVrtq4FEXm6NLuKgg
 o6edfYI1Ycd7zALrq9MswV5IOodBTKZMpHkRSjL4FqSnBtYd0+96UzTiA
 wCI1AFVIwwfFzmW8fsTUHwuXNAvdUTldPoqlYQto3vJRNtRhCPCVuf5PC Q==;
X-CSE-ConnectionGUID: XbEgTKgdRLOa+68QGAqJYQ==
X-CSE-MsgGUID: n0QgFYNsTl2hxC98SbfzGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66045765"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="66045765"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 11:26:35 -0700
X-CSE-ConnectionGUID: mJGSc2p+Te6RGZfATGfWsA==
X-CSE-MsgGUID: LPEZs0Q5TQuiQdNnnjlCQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="159308237"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 11:26:33 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/4] drm/xe: Enable SR-IOV for ADL/ATSM
Date: Tue, 22 Jul 2025 20:26:17 +0200
Message-ID: <20250722182618.30811-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722182618.30811-1-michal.wajdeczko@intel.com>
References: <20250722182618.30811-1-michal.wajdeczko@intel.com>
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

We were already testing those two platforms for a while on our CI,
but enabling flag (has_sriov) was only available on the topic branch
and only for builds with CONFIG_DRM_XE_DEBUG config.

Since those two platforms are guarded by the another enabling flag
(require_force_probe) and we believe our SR-IOV support for them is
at sufficient level to start enjoying the feature, turn on the
SR-IOV enabling flag unconditionally.

Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 9645716562f0..5425a7c213ce 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -193,6 +193,7 @@ static const struct xe_device_desc adl_s_desc = {
 	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
+	.has_sriov = true,
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
@@ -210,6 +211,7 @@ static const struct xe_device_desc adl_p_desc = {
 	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
+	.has_sriov = true,
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
@@ -225,6 +227,7 @@ static const struct xe_device_desc adl_n_desc = {
 	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
+	.has_sriov = true,
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 };
@@ -270,6 +273,7 @@ static const struct xe_device_desc ats_m_desc = {
 
 	DG2_FEATURES,
 	.has_display = false,
+	.has_sriov = true,
 };
 
 static const struct xe_device_desc dg2_desc = {
-- 
2.47.1

