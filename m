Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B785DCAC5BB
	for <intel-xe@archiver.kernel.org>; Sun, 28 Sep 2025 17:48:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5565410E158;
	Sun, 28 Sep 2025 17:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dnTKjHWV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE8610E153
 for <intel-xe@lists.freedesktop.org>; Sun, 28 Sep 2025 17:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759081708; x=1790617708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PZqdVBjWOQmrmrhgPwptmjoa5TDw3JFonbYSLh9pthw=;
 b=dnTKjHWVIcLE4qOkqRXHvt141KlkTRzc/HOuJ18r6cv5/Coyf9pXgvLP
 3N0+GirEppC7VRhklMND2wejIabshQ5lcuMThcUJFZhDXWMRzKYBhc8O7
 +DZdN4AzHBcL+bGCcrpZBtsSLyN3PQ+JX7AAiZerPtiKMYqnTlWjhSJ+J
 2cn6zF2QcpeDlTLVyxpk8D+bKt1UHRTYQPLAzTv+aG247PVSqXXn4SyCh
 W3/pnCc5J/3bgtM/6729lpMljnYYrvGxDi9xBd59ksAHoYd84RpgsTi40
 wJxl5+TsRG7DZJXcyK0HuoFq/7WxpbuVgpik3Tb+rSzTnbk65RMVSLmGw w==;
X-CSE-ConnectionGUID: uGaOiElYRWGCtkHWajsfyg==
X-CSE-MsgGUID: 6ZWmFFIqQ72JQUYpFUpaiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="61226668"
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; d="scan'208";a="61226668"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 10:48:27 -0700
X-CSE-ConnectionGUID: FfHcHroITFqVBtGnMFNhwQ==
X-CSE-MsgGUID: +nvricGTR4qS33VG4Z+Hfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; d="scan'208";a="182459560"
Received: from jkhalil-mobl.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.85])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 10:48:26 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH 2/2] drm/xe/vf: Don't claim support for firmware late-bind if
 VF
Date: Sun, 28 Sep 2025 19:48:11 +0200
Message-ID: <20250928174811.198933-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250928174811.198933-1-michal.wajdeczko@intel.com>
References: <20250928174811.198933-1-michal.wajdeczko@intel.com>
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

In general, the VFs can't load firmwares so attempt to initialize
the firmware late-bind component leads to errors like:

 [] xe 0000:03:00.1: [drm] *ERROR* Late bind component not bound

Fixes: 918bd789d62e ("drm/xe/xe_late_bind_fw: Introduce xe_late_bind_fw")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6190
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0421042597a2..386940323630 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -695,6 +695,7 @@ static void vf_update_device_info(struct xe_device *xe)
 	xe->info.probe_display = 0;
 	xe->info.has_heci_cscfi = 0;
 	xe->info.has_heci_gscfi = 0;
+	xe->info.has_late_bind = 0;
 	xe->info.skip_guc_pc = 1;
 	xe->info.skip_pcode = 1;
 }
-- 
2.47.1

