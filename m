Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C503CED624
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 11:41:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F40510E353;
	Tue, 18 Nov 2025 11:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JD535xzD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAB910E353
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 11:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763466082; x=1795002082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0VluS1/5GzJcg4vOiZHDFXWyo6sfNiOn+K8zG07D90A=;
 b=JD535xzDh5YOzMRfaoD2bUS+0OYfAIbPv6h88G8lKx/un3GvE2h20t3V
 xNQCvHkLglfyjYNNElSRlJhvef3djQvNpM32Jl7cmkcHW5dhImKKXODWR
 h/6eIYAwzBeVXWLw9rRSWf7MY/h1p6ChA8DR1hZn0yaC3hyxe/P8NFHH+
 yZMsCDZlsdTQuPS01yQyvfp2mojlg7ySuUoI2CX4prWlWQtarZNcUg9zp
 l7/0zQ5jcyHQM3Q2vm1WbAEtFLphY6mnbnM6FVE963NYM/HCGAAQdOpAp
 EpHFoiT/9/EefhTTZCIj2nm+WBA6cOpBYx77ScVw9vsnueh3CgnEOiDrI w==;
X-CSE-ConnectionGUID: h6fEoUeDQX6QUUqv9XFd7g==
X-CSE-MsgGUID: n6SR9/8KTY2dq3Zu9qvQjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76163442"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="76163442"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 03:41:21 -0800
X-CSE-ConnectionGUID: VvlxtPKpQmyaPSZAgILjXA==
X-CSE-MsgGUID: kMKKbrC4SgmYl5Y1LCJAKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190763769"
Received: from gsd-build.iind.intel.com ([10.190.229.175])
 by orviesa007.jf.intel.com with ESMTP; 18 Nov 2025 03:41:19 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v4 1/3] drm/xe/vf: Enable VF migration only on supported GUC
 versions
Date: Tue, 18 Nov 2025 11:41:14 +0000
Message-ID: <20251118114116.3429730-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118114116.3429730-1-satyanarayana.k.v.p@intel.com>
References: <20251118114116.3429730-1-satyanarayana.k.v.p@intel.com>
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

Enable VF migration starting with GUC 70.54.0 (compatibility version
1.27.0). Gate the feature on the GuC firmware version and keep it disabled
on older or unsupported versions.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>

---
V3 -> V4:
- New commit

V2 -> V3:
- None.

V1 -> V2:
- None.
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 284ce37ca92d..b73498097df5 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -180,6 +180,18 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
  */
 int xe_sriov_vf_init_late(struct xe_device *xe)
 {
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct xe_uc_fw_version guc_version;
+
+	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
+	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 27, 0)) {
+		xe_sriov_vf_migration_disable(xe,
+					      "requires GUC ABI >= 1.27.0, but only %u.%u.%u found",
+					      guc_version.major, guc_version.minor,
+					      guc_version.patch);
+		return 0;
+	}
+
 	return xe_sriov_vf_ccs_init(xe);
 }
 
-- 
2.43.0

