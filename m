Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA30C678D5
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 00:55:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40A710E14C;
	Wed,  8 Mar 2023 00:55:18 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B02410E320
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 00:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678236917; x=1709772917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7apDiNUgeSMlfyfPoS3C8ElPJt0REAPEmrs+dj7pybE=;
 b=VxSfambgRLViZLMnC0vyNDrFoCgakw0hjZQ/gxnuBb2FWGUwFhoBpS2T
 n6GIzCzrDJdj+/HS6IDawmO8opvmWIM7XrVSCSAd/LsWwALN56tIo7lNn
 sTlBkRmtpZIQ5FltVQ+UpUnt/Ikcs1y5KJNr8oFZoJdL8QYrRVFB2i9wF
 wG3IwgdISRcLJsR6xAuOLUq4risPThlIHIeB6PED8e2IpjOdn+5r5XfQ6
 pRsCPpMNsg0rVgEBJikxUniOcbO2XPf8J2m6D0Oa7vwCc+AVA2PwdOst6
 7m+wcYE4Mk+Z3dpQZa/DMs6Uz2U7G0fCKUBAfMwXF62soyzrFwfR7wmAZ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="319847502"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="319847502"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 16:55:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="800559698"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="800559698"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 16:55:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  7 Mar 2023 16:55:09 -0800
Message-Id: <20230308005509.2975663-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308005509.2975663-1-matthew.d.roper@intel.com>
References: <20230308005509.2975663-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Allocate regset space for
 Wa_1607983814 unconditionally
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

As part of commit 6f2c0e92587b ("drm/xe/mocs: LNCF MOCS settings only
need to be restored on pre-Xe_HP"), the regset allocation was slimmed
down to not unnecessarily include extra LNCFMOCS space in the regset
area for the platforms and engines that don't need to save/restore those
registers.  Unfortunately this change is causing a driver load
regression on Xe_LP platforms:

  ------------[ cut here ]------------
  WARNING: CPU: 4 PID: 1677 at drivers/gpu/drm/xe/xe_hw_fence.c:91 xe_hw_fence_irq_finish+0x35/0x120 [xe]
  Modules linked in: xe(+) drm_ttm_helper drm_suballoc_helper gpu_sched
  drm_buddy video drm_display_helper drm_kms_helper syscopyarea
  sysfillrect sysimgblt ttm fuse x86_pkg_temp_thermal coretemp
  kvm_intel mei_pxp mei_hdcp kvm irqbypass wmi_bmof mei_me mei
  crct10dif_pcl mul crc32_pclmul e1000e ghash_clmulni_intel ptp
  i2c_i801 i2c_smbus pps_core intel_lpss_pci wmi [last unloaded: ttm]
  CPU: 4 PID: 1677 Comm: modprobe Not tainted 6.1.0-CI_DRM_12746-g6ce36b596fa7+ #474
  Hardware name: Intel Corporation CoffeeLake Client Platform/CoffeeLake S UDIMM RVP, BIOS CNLSFWR1.D00.X212.B00.190824175

  RIP: 0010:xe_hw_fence_irq_finish+0x35/0x120 [xe]
  Code: 54 4c 8d 67 60 55 53 48 83 ec 10 48 8b 47 60 49 39 c4 75 13 48 83 c4 10 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc
 f9 37 e1 48 89 ef 88 44 24 07 e8 78 ea 77 e1 48 8b 55
  RSP: 0018:ffffc90001967bc8 EFLAGS: 00010206
  RAX: ffff88811058f698 RBX: 00000000ffffffc2 RCX: ffff88810c8289a8
  RDX: 0000000000000000 RSI: ffffffff822868c2 RDI: ffff888115524a98
  RBP: ffff888115524a98 R08: 000000000000011f R09: 00000000ffffffff
  R10: 0000000000000000 R11: 000000006243100e R12: ffff888115524af8
  R13: ffff888115524b10 R14: ffff888115523c38 R15: ffffffffa04ecfbe
  FS:  00007f6ca9483740(0000) GS:ffff88844dc00000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: 0000557fefd93020 CR3: 00000001157ea004 CR4: 00000000003706e0
  DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
  DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
  Call Trace:
   <TASK>
   xe_gt_init+0x343/0x390 [xe]
   xe_device_probe+0x233/0x2a0 [xe]
   xe_pci_probe+0x351/0x480 [xe]

The reason for this failure hasn't been identified yet (the smaller
regset allocation is still more than large enough to hold all of the
registers; it isn't an overflow problem) so let's revert the problematic
optimization to restore proper behavior while we investigate further.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index fd9911ffeae4..304a9501b447 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -224,10 +224,7 @@ static size_t calculate_regset_size(struct xe_gt *gt)
 		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
 			count++;
 
-	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
-
-	if (needs_wa_1607983814(gt_to_xe(gt)))
-		count += LNCFCMOCS_REG_COUNT;
+	count += (ADS_REGSET_EXTRA_MAX + LNCFCMOCS_REG_COUNT) * XE_NUM_HW_ENGINES;
 
 	return count * sizeof(struct guc_mmio_reg);
 }
-- 
2.39.2

