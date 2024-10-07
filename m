Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8ECCCFB442
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 06:41:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B564110E309;
	Mon,  7 Oct 2024 06:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="me3rJ3QJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9F610E309
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 06:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728283312; x=1759819312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S0PVXYj5PJERiFtxI+SsluLxlIMW+f+T2tPe3EQE4Pw=;
 b=me3rJ3QJxIP5tLv2G/TCQ3hXhMSqJgbl3V+vsKlCMp4jdB4VrB8A8N7T
 jdaNvRAdqHb5kbeXTUvY0wQVurBaAYQB4irv9mLuJJCdrHIuZ2Pn3+M8J
 xU3HyMkLj93SZ+UeEpJMo//sOmnqLG0Zq8hh4DLo4b2YV8KLhlxMSWDeg
 8nZ0sraY2B+nwaYIrVIBoz+Sps+kqIB/SHwmToqJSYmWwkfLSFIflx5gr
 JVIq0Do0doa0bGyMZ5D9l+fw7gqrvZN7kHGs5RUb17pdtem/KDuUcxo3h
 FOpq9JxNknvPCTuyD16pezHdODdjcAARfRiWXkVD96j+i1GrGWzoKQnt6 A==;
X-CSE-ConnectionGUID: LBTKm3QMSVSpNRR1TcND/w==
X-CSE-MsgGUID: iO60ojRfRM+6WwUd5j+lbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38548432"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="38548432"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2024 23:41:52 -0700
X-CSE-ConnectionGUID: GHS04kPUR7SsGhySkVSFdA==
X-CSE-MsgGUID: K3z/mDvZQ8WQYXnHwBLuHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="112842323"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 06 Oct 2024 23:41:50 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v7 03/26] drm/xe/forcewake: Add a helper
 xe_force_wake_ref_has_domain()
Date: Mon,  7 Oct 2024 12:29:54 +0530
Message-Id: <20241007070017.1732886-4-himal.prasad.ghimiray@intel.com>
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

