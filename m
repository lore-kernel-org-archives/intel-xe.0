Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BFCC79F85
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 17:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39A610E2BD;
	Sun,  6 Sep 2026 17:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KbGNwPq7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA30E10E2BD
 for <intel-xe@lists.freedesktop.org>; Sun,  6 Sep 2026 17:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788714592; x=1820250592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cUBnOtYRBzmHSg+Yb5zM5bpXLiBMeX6wkjA9v7QR4x0=;
 b=KbGNwPq7NZf1k+r/mL9XwGd8AEb6DZR+tnXpwrd+f+0aVbr2xlvVUz6C
 hPsk4/ldTuOfot9Eel8wLqjE89hO8slh5Rlg1Xg0p6376+giT1G2VZ+u9
 qX8HPcYdrHpvkShO7oGRZU1FoemXOa13AvOUqgx5CRF1KpK0Nq/+EXntB
 L/GYaTGIq2P9Hcum8+RHaKx9AaqVJN4/d9u+0wTTi28oVlkQSWEjr7c4V
 8c+UacsNXgCawsyxtE7kb/BxkZvnXZ5OPEQHh0o0+nVFR5yNhrsJsMWYN
 AqO4MH7Y4wPpwwxrJn9GsDoAbl7xjL02+jwM5fPBRolCtH+Uvqu2OmXBo g==;
X-CSE-ConnectionGUID: 25sH4mdfTMKS+H8B5wuQCQ==
X-CSE-MsgGUID: /ikQomBjRwWssMmCUX4aQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88071459"
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; d="scan'208";a="88071459"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 10:09:52 -0700
X-CSE-ConnectionGUID: xSNfCYaoQSm/m14EgbNPgw==
X-CSE-MsgGUID: 9ohglVUBRZar+mVu5zwjGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; d="scan'208";a="269996148"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 10:09:49 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com, nitin.r.gote@intel.com
Subject: [PATCH v3 11/12] drm/xe/xe_ras: Report correctable errors using SIGID
Date: Sun,  6 Sep 2026 22:56:16 +0530
Message-ID: <20260906172604.2215987-25-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906172604.2215987-14-badal.nilawar@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
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

Use xe_log_* helper to report correctable errors.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index e93a989fc8f6..8cd6544b5336 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -464,8 +464,11 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 		if (!xe_ras_counter_is_valid(xe, &errors[id]))
 			continue;
 
-		xe_warn(xe, "[RAS]: %s %s detected\n",
-			comp_to_str(component), sev_to_str(severity));
+		xe_log_from(xe, ras_sev_to_cper_sev(severity),
+			    ras_comp_to_hw_sigid(component),
+			    component,
+			    &errors[id], sizeof(errors[id]),
+			    "error detected\n");
 
 		/* Send event once per component */
 		if (sent & BIT(component))
-- 
2.54.0

