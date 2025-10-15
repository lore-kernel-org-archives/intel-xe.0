Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69812CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 08:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3BE10E74C;
	Wed, 15 Oct 2025 08:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j3S6nPeE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C105310E755
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 08:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760515383; x=1792051383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RCJDPC3KKO3McUyWYl+T4hKLPNTUO5NjLHbVV8W3fOk=;
 b=j3S6nPeEPvQsM8OooWde7Zw0V6IRtsarvPq3khO1APXfVf85416T9t0p
 M7K09b8RIiwTMunSlIO44XG+qsCCSU6PzIqIgtt6pH/Yo8wNTYdt2mzNH
 dmBJT8h1hKa6RD9g0TMNqUikr/xWWcnOAkxkKToDVBUiAR9doYvy1ABTm
 rgOYXsb2X+CBs5OOJIJCeL911D5QNp4C6DCRIGzQQeHvypGshQd/fdelp
 q9SQOcZQc1/lIeNqcF1kUsVBpX0t+ACBd7DhGeQkbmdCZNUnQZ9Clnn2x
 MUKNCEIX9MrW48xbrFvRwtKADxrNE/OQnU3gTktF6hgl/gW6xx1jdGqnS A==;
X-CSE-ConnectionGUID: Q/PY1V/8SomARIKiKesYZQ==
X-CSE-MsgGUID: BE0pVg9qQ+iRUWltaX8ENg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="61891515"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="61891515"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 01:03:03 -0700
X-CSE-ConnectionGUID: 1f7ZIKrISBSCkSgAP1S9PQ==
X-CSE-MsgGUID: /BiNBmYoS8ikkdXOTmLNOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="205805474"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 01:02:59 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, varun.gupta@intel.com,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 karthik.poosa@intel.com
Subject: [PATCH v5 09/12] drm/xe/pm: D3cold target state
Date: Wed, 15 Oct 2025 13:37:07 +0530
Message-Id: <20251015080710.1468409-10-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015080710.1468409-1-badal.nilawar@intel.com>
References: <20251015080710.1468409-1-badal.nilawar@intel.com>
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

From: Anshuman Gupta <anshuman.gupta@intel.com>

Trade-off D3cold target state based upon current vram usage.
If vram usage is greater than vram_d3cold_threshold and GPU
is VRSR capable target D3cold state is D3cold-VRSR
otherwise target state is D3cold-Off.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index aa38dbe1e368..f599513edca6 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -167,6 +167,14 @@ static void xe_rpm_lockmap_release(const struct xe_device *xe)
 			 &xe_pm_runtime_d3cold_map);
 }
 
+static void xe_pm_suspend_prepare(struct xe_device *xe)
+{
+	if (pm_suspend_target_state == PM_SUSPEND_TO_IDLE)
+		xe_pm_d3cold_target_state_toggle(xe);
+	else
+		xe->d3cold.target_state = XE_D3COLD_OFF;
+}
+
 /**
  * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle
  * @xe: xe device instance
@@ -183,6 +191,8 @@ int xe_pm_suspend(struct xe_device *xe)
 	xe_pm_block_begin_signalling();
 	trace_xe_pm_suspend(xe, __builtin_return_address(0));
 
+	xe_pm_suspend_prepare(xe);
+
 	err = xe_pxp_pm_suspend(xe->pxp);
 	if (err)
 		goto err;
@@ -1077,10 +1087,14 @@ void xe_pm_d3cold_target_state_toggle(struct xe_device *xe)
 
 	if (total_vram_used_mb < xe->d3cold.vram_threshold)
 		xe->d3cold.target_state = XE_D3COLD_OFF;
+	else if (xe->d3cold.vrsr_capable)
+		xe->d3cold.target_state = XE_D3COLD_VRSR;
 	else
 		xe->d3cold.target_state = XE_D3HOT;
 
 	mutex_unlock(&xe->d3cold.lock);
+
+	drm_dbg(&xe->drm, "Xe D3cold target state %d\n", xe->d3cold.target_state);
 }
 
 /**
-- 
2.34.1

