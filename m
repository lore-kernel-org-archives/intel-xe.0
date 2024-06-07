Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C58C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 12:41:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497EC10E138;
	Fri,  7 Jun 2024 12:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CzWlXEVl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D4910E12E
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 12:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717764096; x=1749300096;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eJTnvVSUzwNiQFf2F0tg/9Lptfq8+dLRef4OQUDCIns=;
 b=CzWlXEVlNCS+d/uoeL4YqPJTVP/cAFSEj+/Qlg/W5AbVAta2nwegNw+w
 Zh3iEhqIjlRZLT30OGAYjj+WR/99Jt0HGuGoJXPbSst+cCOOVCG6cvgS8
 /ec1hQlwxbBYcDpqEsq8dXg1hEn3BVSXtB0UGhbVReAYTI8qABFVcomrM
 UQ3MjFqDQ1LyQW4tZ268XJ+CSv9jTUp6FQAt2K4CbkSKN739YieNmlMxs
 E5Q/wRI1mzko64TBAHhfbtC79rApQyZ/Azr2iu6e01fZ9UAoPZEWWo9vG
 lbzPhvBimFYi8Uk+/6iEl3F5njrG9qeNEiG2uDo+Z0m3I4r89IJMNrSm0 Q==;
X-CSE-ConnectionGUID: kis0CCG7Q+yor56HCwf6hw==
X-CSE-MsgGUID: 5Fp7U2QGSjuErQIRzla0Sw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="11964232"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="11964232"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 05:41:36 -0700
X-CSE-ConnectionGUID: KgtQQUxAS5eJDlZSJY6AoQ==
X-CSE-MsgGUID: cnxTaUweRTay2sTWM+YXaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38386626"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa009.jf.intel.com with ESMTP; 07 Jun 2024 05:41:33 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [CI 1/2] drm/xe: Ensure caller uses sole domain for
 xe_force_wake_assert_held
Date: Fri,  7 Jun 2024 18:27:40 +0530
Message-Id: <20240607125741.1407331-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

xe_force_wake_assert_held() is designed to confirm a particular
forcewake domain's wakefulness; it doesn't verify the wakefulness of
multiple domains. Make sure the caller doesn't input multiple
domains(XE_FORCEWAKE_ALL) as a parameter.

v2
- use domain != XE_FORCEWAKE_ALL (Michal)

v3
- Add kernel-doc

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 83cb157da7cc..f088cc6a4002 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -28,10 +28,21 @@ xe_force_wake_ref(struct xe_force_wake *fw,
 	return fw->domains[ffs(domain) - 1].ref;
 }
 
+/**
+ * xe_force_wake_assert_held - asserts domain is awake
+ * @fw : xe_force_wake structure
+ * @domain: xe_force_wake_domains apart from XE_FORCEWAKE_ALL
+ *
+ * xe_force_wake_assert_held() is designed to confirm a particular
+ * forcewake domain's wakefulness; it doesn't verify the wakefulness of
+ * multiple domains. Make sure the caller doesn't input multiple
+ * domains(XE_FORCEWAKE_ALL) as a parameter.
+ */
 static inline void
 xe_force_wake_assert_held(struct xe_force_wake *fw,
 			  enum xe_force_wake_domains domain)
 {
+	xe_gt_assert(fw->gt, domain != XE_FORCEWAKE_ALL);
 	xe_gt_assert(fw->gt, fw->awake_domains & domain);
 }
 
-- 
2.25.1

