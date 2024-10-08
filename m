Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59DACED273
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 06:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF1410E474;
	Tue,  8 Oct 2024 06:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="meA90U3y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8319610E474
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 06:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728370369; x=1759906369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S0PVXYj5PJERiFtxI+SsluLxlIMW+f+T2tPe3EQE4Pw=;
 b=meA90U3y7Rq4Z9Wz1WGxTqzVZOUDZuMYgfr4O4JNbafBnkHxauqRWJEm
 RS+QfFKdsS1+rLCq9We3kKuYTI1EFVZsL1Q9bOF0C3LszXd/TzDZl74wV
 qdrPQJOHBoWeGSKQUQDabiduMRMXJ/S2T13bveWMxGD5mYJSMzPJOixf9
 3cBJDjOFKC1ah0bsdr84o1Y1NoidTf+/KbDgVqMod1fmzW9YwijUcsB6u
 ZlnzR3NOOgHTQftIJE0m2cDPplFnuDeH3TA4EwB4i5ifPtovWneO8+yzh
 ndHCZC/1A0JezEW+icV3c04QV4BhUByA7YCK8iTffe9+T82AnyNxzqPOQ w==;
X-CSE-ConnectionGUID: EhDk6iZxQ1Kg66wucpyvyQ==
X-CSE-MsgGUID: ENhK01LrQuCeZhPnr3mYRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31430366"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="31430366"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 23:52:49 -0700
X-CSE-ConnectionGUID: G/xZs0dIQZCaUMlkoaChNA==
X-CSE-MsgGUID: eAirNSkOSsqWZgHExIYsPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="106577646"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa002.jf.intel.com with ESMTP; 07 Oct 2024 23:52:48 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v8 03/26] drm/xe/forcewake: Add a helper
 xe_force_wake_ref_has_domain()
Date: Tue,  8 Oct 2024 12:40:52 +0530
Message-Id: <20241008071115.1862704-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
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

The helper xe_force_wake_ref_has_domain() checks if the input domain
has been successfully reference-counted and awakened in the reference.

v2
- Fix commit message and kernel-doc (Michal)
- Remove unnecessary paranthesis (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index a2577672f4e3..1608a55edc84 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -46,4 +46,20 @@ xe_force_wake_assert_held(struct xe_force_wake *fw,
 	xe_gt_assert(fw->gt, fw->awake_domains & domain);
 }
 
+/**
+ * xe_force_wake_ref_has_domain - verifies if the domains are in fw_ref
+ * @fw_ref : the force_wake reference
+ * @domain : forcewake domain to verify
+ *
+ * This function confirms whether the @fw_ref includes a reference to the
+ * specified @domain.
+ *
+ * Return: true if domain is refcounted.
+ */
+static inline bool
+xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains domain)
+{
+	return fw_ref & domain;
+}
+
 #endif
-- 
2.34.1

