Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D00E9B24D
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 10:30:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C0589083;
	Tue, 24 Feb 2026 10:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kcdQaz4u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE8D10E25B
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 10:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771929028; x=1803465028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VIJtmVUYgs9qt2g0z6h/ZKhxavzP2tpXvciaupXQP+o=;
 b=kcdQaz4urfqB0cDOw7upLTlhca22RcTxvp0O4gTu5q8NJy1znrzV7uXx
 /zCSt9CV2pzLf+rvYLDUpGh5W6jUSZVYo9fFhXhj4THfgfXVbKL3gnDOD
 f3uKqV02x336Tl9IBM/Jzabc9VuBFcb8LdblLDN0MJZtM9mlj53LAhrKI
 B4ZihojhfyBFWHBhQ1BNakQlb8ug6O/K1nE4vpFMp+mCukD38di10Xje/
 V5nxDGedptfxSHUrjqfQHHqGY7Fs7/UGN+tZXVa013VrKoqjL1mEdJX+6
 kmF48AJfsM1oNkYM7CBVbwV8bv6LViJU4dYFeWFFODN0AA9WFM7/SGK4n g==;
X-CSE-ConnectionGUID: y5gzDOilQraXIpB43yE46w==
X-CSE-MsgGUID: eUrbszwSQIyJMk0loEYQwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73046383"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="73046383"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 02:30:27 -0800
X-CSE-ConnectionGUID: qWdLgmkjT4+/syJU/9Dppw==
X-CSE-MsgGUID: +BNjlGIlTnS8r375xnG2Vg==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 24 Feb 2026 02:30:25 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 4/6] drm/xe: Introduce xe_device_assert_lmem_ready()
Date: Tue, 24 Feb 2026 15:55:17 +0530
Message-ID: <20260224102618.3105171-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224102618.3105171-1-raag.jadav@intel.com>
References: <20260224102618.3105171-1-raag.jadav@intel.com>
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

In preparation of usecases which require checking for VRAM readiness after
FLR, introduce xe_device_assert_lmem_ready() helper.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 drivers/gpu/drm/xe/xe_device.h | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index eee183732950..94a26eff0024 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -650,7 +650,7 @@ static int xe_set_dma_info(struct xe_device *xe)
 	return err;
 }
 
-static void assert_lmem_ready(struct xe_device *xe)
+void xe_device_assert_lmem_ready(struct xe_device *xe)
 {
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
 		return;
@@ -738,7 +738,7 @@ int xe_device_probe_early(struct xe_device *xe)
 	 * is flagged after full initialization is complete. Assert if lmem is
 	 * not initialized.
 	 */
-	assert_lmem_ready(xe);
+	xe_device_assert_lmem_ready(xe);
 
 	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
 			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 39464650533b..44db00d0ad55 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -140,6 +140,7 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 	return &gt->pm.fw;
 }
 
+void xe_device_assert_lmem_ready(struct xe_device *xe);
 void xe_device_assert_mem_access(struct xe_device *xe);
 
 static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
-- 
2.43.0

