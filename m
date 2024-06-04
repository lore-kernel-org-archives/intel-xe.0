Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB5AC27C50
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 11:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EAD10E45E;
	Tue,  4 Jun 2024 11:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hGUohZqP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5499010E45D
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 11:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717499841; x=1749035841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l4jrmqr2SK+woJ13dy0yJQwK09NEDzTe0kHn8g2Ynhs=;
 b=hGUohZqPKj5PV7zR+AVSSYqTX5D444EWMudIY3fqeNmtRCy4vlVW+ceY
 jStdZKYPJwWV8m9t0M2O+pxAMYhxqSVCyC/L/NIdxTpTei8pFM/twvpxQ
 DrbN72on7Kv0rV9Gbyh4OCHVayCRV9FdkE5n58xWDVyW7Rd+m25hSDxfj
 iKYblDw6HdKjexjUZEP/F91dDUnOJxHfnL3+5qBZWKq3ZCrWMrmsi9odF
 U6z0ATcZwmEv8cKxHT77Qt0pZP8aEATqmGPPhwQmNlR1jrHjriTN/MaqG
 xD4VhRNBCFjxxkrPAPl5r6EC2fP69wqp2Ij/i1S2ktEWbrBfQCWNuofSm g==;
X-CSE-ConnectionGUID: 6hZxdepGRjufZtc6vdu2ig==
X-CSE-MsgGUID: vblnX22MTAqCFwu+9gXlcw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24701849"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="24701849"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:17:21 -0700
X-CSE-ConnectionGUID: o7h5kdOIQbePu3C2IZdT5A==
X-CSE-MsgGUID: ttxvcIyFS2ORhjNUR1/JyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37669673"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:17:20 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 3/9] drm/xe/xe_reg_sr: Always call xe_force_wake_put/get in
 pairs
Date: Tue,  4 Jun 2024 13:02:19 +0200
Message-ID: <20240604110225.29495-4-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240604110225.29495-1-nirmoy.das@intel.com>
References: <20240604110225.29495-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

xe_force_wake_get() increments the domain ref regardless of success
or failure so call xe_force_wake_put() even on failure to keep ref
count accurate.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 440ac572f6e5..8fcc08658d89 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -201,13 +201,11 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 	xa_for_each(&sr->xa, reg, entry)
 		apply_one_mmio(gt, entry);
 
-	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
-	XE_WARN_ON(err);
-
-	return;
-
 err_force_wake:
-	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
+	if (err)
+		xe_gt_err(gt, "Failed to whitelist %s registers, err=%d\n",
+			  sr->name, err);
+	XE_WARN_ON(xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL));
 }
 
 void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
@@ -253,13 +251,11 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
 	}
 
-	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
-	XE_WARN_ON(err);
-
-	return;
-
 err_force_wake:
-	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
+	if (err)
+		xe_gt_err(gt, "Failed to whitelist %s registers, err=%d\n",
+			  sr->name, err);
+	XE_WARN_ON(xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL));
 }
 
 /**
-- 
2.42.0

