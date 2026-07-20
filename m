Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C54AC44524
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 09:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010E710E839;
	Mon, 20 Jul 2026 09:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQ73JG0c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6872910E838;
 Mon, 20 Jul 2026 09:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784538722; x=1816074722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fI6gewrjTQiM5X+F315hSQlIkPxBTH7YriwOAH4SDLc=;
 b=KQ73JG0cX+saTpGgWqwyMQWzjGiWKOK+CgxKuTfU6m+CeiV3uuMRQ9h5
 IlOMv9Mhch6eiSEzGTuZkweXoegFEYOLIp5KX8RkzGCN52TLcr1EFilSH
 8ejWAokD5oVTfFBZ2kan6sW/5ASZYq091ZYTmkpB/yQ6Mq0+tqvUx43aF
 vpKI8NYSCaLL6GJAXisRJBy0GVf7qu/K4gurJfBh2uigGBlvLuhJNJakm
 LneDrWzurOV3ynn81254wGTc6rxbUeh67HgbRAgAEBmDhJvxm5WQ10tHM
 9PK4ARRWQuyZxbjQHLdoLrJQLEuf37CuorxvdYNIYSYwZbJeLvVh/VLYA w==;
X-CSE-ConnectionGUID: Mcked7G9RyiXzWyWww67oQ==
X-CSE-MsgGUID: I5kEtwGWQ0WVfanZT43NPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="102664761"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="102664761"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 02:12:02 -0700
X-CSE-ConnectionGUID: WwRDPk5GQSORLV6ktoivJw==
X-CSE-MsgGUID: xXzIf+xFSyqDAGrR26L/QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="260963364"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa003.jf.intel.com with ESMTP; 20 Jul 2026 02:12:01 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v4 1/9] drm/i915/vrr: Return from CMRR compute config in case
 of PSR2 enabled
Date: Mon, 20 Jul 2026 14:31:33 +0530
Message-ID: <20260720090142.2864289-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260720090142.2864289-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260720090142.2864289-1-mitulkumar.ajitkumar.golani@intel.com>
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

CMRR is mutually exclusive to PSR2, do not enable PSR2 when CMRR is
enabled.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

--v2:
- Restrict selective update config check (Ankit)
- Commit message change

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 40e3d7095996..6a90ded5d1fa 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1587,6 +1587,12 @@ static bool intel_sel_update_config_valid(struct intel_crtc_state *crtc_state,
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct intel_display *display = to_intel_display(intel_dp);
 
+	if (crtc_state->cmrr.enable) {
+		drm_dbg_kms(display->drm,
+			    "Selective update cannot be enabled when CMRR is enabled\n");
+		goto unsupported;
+	}
+
 	if (HAS_PSR2_SEL_FETCH(display) &&
 	    !intel_psr2_sel_fetch_config_valid(intel_dp, crtc_state) &&
 	    !HAS_PSR_HW_TRACKING(display)) {
-- 
2.48.1

