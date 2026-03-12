Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FF8105A59D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 13:25:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B86F10E9F3;
	Thu, 12 Mar 2026 13:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yv4OEN3H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2121810E9EB;
 Thu, 12 Mar 2026 13:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773321927; x=1804857927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vgE7Qc2MF6JmssB/Pt5Hj68iQH5CC1RjdrS8QHzp//E=;
 b=Yv4OEN3Hf20E5idcuv+AHqWwLVc8GHXjkATiaKJahjpMtcY6K1wpzDTS
 5O3kjEkkZ0G4fibkPU91dpymrqcOADARQYGQr8W69MqsGAMJJ+GwoIPOE
 XxenKqlnetstESFZ6M7SptYx1fCuv0UqD/bys7tOti7tFYUiYColDVCos
 L3InoWdhc7VzEorHriMGSo3YzYEgNlMmcpu2ea6YbbNpKPBwt3o4qDogt
 E43cnkARUFsQJ6dOe3ulYzOoiqcuKQATL7G7eKhdV9iUKhis6/pOzBcDZ
 iclYzi47AjlMyiDIte3cpXn6WFt+0g7KMx/HjehHPxUr2vo+MojoNL0uS w==;
X-CSE-ConnectionGUID: YyeM/8FKQamqWqWDrglfSQ==
X-CSE-MsgGUID: BH8pwx/rQrKb4TQUCeKA0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74524923"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="74524923"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 06:25:27 -0700
X-CSE-ConnectionGUID: aZI6F1W+RCa+bbrf6Neqiw==
X-CSE-MsgGUID: +IsywUTxThqQlwH7bKABdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225794535"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 06:25:24 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 swati2.sharma@intel.com, suraj.kandpal@intel.com
Subject: [PATCH v3 1/2] drm/i915/dmc: Remove invalid PIPEDMC interrupt bits
Date: Thu, 12 Mar 2026 18:56:53 +0530
Message-ID: <20260312132654.2614433-2-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312132654.2614433-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260312132654.2614433-1-dibin.moolakadan.subrahmanian@intel.com>
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

On display version 35+ PIPEDMC_ATS_FAULT and
PIPEDMC_GTT_FAULT interrupt bits are no longer defined.

Update the interrupt mask to drop these.

Bspec: 70296

Changes in v2:
- Move PIPEDMC_ERROR interrupt enable to a separate patch (Ville Syrjala)
Changes in v3:
- Add Bspec reference (Suraj Kandpal)

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index c3b411259a0c..38b284a0db82 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -509,6 +509,9 @@ static void pipedmc_clock_gating_wa(struct intel_display *display, bool enable)
 
 static u32 pipedmc_interrupt_mask(struct intel_display *display)
 {
+	if (DISPLAY_VER(display) >= 35)
+		return PIPEDMC_FLIPQ_PROG_DONE;
+
 	/*
 	 * FIXME PIPEDMC_ERROR not enabled for now due to LNL pipe B
 	 * triggering it during the first DC state transition. Figure
-- 
2.43.0

