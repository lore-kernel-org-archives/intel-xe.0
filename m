Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE90BCFB443
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 06:42:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD7910E308;
	Mon,  7 Oct 2024 06:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yv42zuqj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE3110E308
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 06:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728283337; x=1759819337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pL+jlMD+Ds/hu+Kv3acuV25PNGl3s1dLGcjTpmTADo8=;
 b=Yv42zuqjQwQkg6FCGWyb4M8C2CGZaPHdRC+f/2bAF9C7M1eoMan78Kz7
 Z3FURUNPcVjrQkVQ59/Bfyq2xRlimysdBzPEEvahQyqgZDFVDqmR8im4p
 ptB046CvGDPiqZokXI8y5/5PQ586MZrLHhZTbBp/FN9Fr7hDDN5NTKKPq
 XPu/No/K7NJDWNLd1MSyXyKxivyRBGfDN9CiOef9ya42z/fwZm3Gm+lqZ
 BoHmWkXqOeyz3Y+bg9qLsNfn/EJQd89iTKhYkQBqmA6r5X4XsyMWBvcRG
 oLz1JdS5u3KIBFpNCR1DMGaSEPQwY99sWXTaJIJV98FzJiP8z4Uba0WP+ g==;
X-CSE-ConnectionGUID: s1Qao8c4QEmMAm+Bk3dK5A==
X-CSE-MsgGUID: VaWswIUlQbOX9aMnKEFUHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38548449"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="38548449"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2024 23:42:16 -0700
X-CSE-ConnectionGUID: YGbYrKkkQ4OmyUt/F5VZBQ==
X-CSE-MsgGUID: 1zxsUSflQ3Wc98heauQxEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="112842474"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 06 Oct 2024 23:42:15 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v7 14/26] drm/xe/xe_drm_client: Update handling of
 xe_force_wake_get return
Date: Mon,  7 Oct 2024 12:30:05 +0530
Message-Id: <20241007070017.1732886-15-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
References: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
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

xe_force_wake_get() now returns the reference count-incremented domain
mask. If it fails for individual domains, the return value will always
be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
in the event of failure. Use helper xe_force_wake_ref_has_domain to
verify all domains are initialized or not. Update the return handling of
xe_force_wake_get() to reflect this behavior, and ensure that the return
value is passed as input to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- xe_force_wake_put() error doesn't need to be checked. It internally
WARNS on domain ack failure.

v5
- return unsigned int from xe_force_wake_get()

v6
- use xe_force_wake_ref_has_domain()

v7
- Fix commit message

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index fb52a23e28f8..22f0f1a6dfd5 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -278,6 +278,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	struct xe_hw_engine *hwe;
 	struct xe_exec_queue *q;
 	u64 gpu_timestamp;
+	unsigned int fw_ref;
 
 	xe_pm_runtime_get(xe);
 
@@ -303,13 +304,16 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 			continue;
 
 		fw = xe_hw_engine_to_fw_domain(hwe);
-		if (xe_force_wake_get(gt_to_fw(gt), fw)) {
+
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), fw);
+		if (!xe_force_wake_ref_has_domain(fw_ref, fw)) {
 			hwe = NULL;
+			xe_force_wake_put(gt_to_fw(gt), fw_ref);
 			break;
 		}
 
 		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw));
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 		break;
 	}
 
-- 
2.34.1

