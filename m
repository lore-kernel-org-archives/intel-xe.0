Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FDFC25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 11:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B94610E46C;
	Tue,  4 Jun 2024 11:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VP+3hTnu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5804710E45B
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 11:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717499845; x=1749035845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hWJTSFOb4FQpqDQ5xY9ztIHIwZYvH1JEH9RHnmsrMOw=;
 b=VP+3hTnuvD03OGUPaiR5hXEqPH1lTwpTVlgW97RYm5v/2TmiXohCgcHU
 X20rOx8AzdTYFpTgMSGQ1Fg3XoVWQ2ZsTpPIrIY+113jytZ1UDQzyXIHQ
 Wdiq2wQbTiNRBOz/4uLBzJOZA55Q8O1x1bguXUEYN8vRhsJ5f5Wd+cVv8
 X+S/627cq3izITD+HkI+PFc4b5Xa9U4PgE4Y2tIZOd0ngXVj1YBnjZPU2
 en2oze1EX5wVGhsNBa9JWATTlc+19I1OioJj59LnhED6cGS4R1wuN1h+d
 ldYS55Q8h7M+XLjRd/hjTZSw4DOFVEVxVERWHZRUwGsLQe+/INYeR51Op w==;
X-CSE-ConnectionGUID: oDTve7EGTVqc7tFTSOMWhg==
X-CSE-MsgGUID: XImOSo4IRE29vRKzOutFsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24701854"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="24701854"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:17:25 -0700
X-CSE-ConnectionGUID: 2N+yVpgOT8Kn0JifDuxKnw==
X-CSE-MsgGUID: dVhYpdkEQQ+pc5JYhpH82w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37669695"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:17:24 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 6/9] drm/xe: Add xe_force_wake_tryget to simplify forcewake
 handling
Date: Tue,  4 Jun 2024 13:02:22 +0200
Message-ID: <20240604110225.29495-7-nirmoy.das@intel.com>
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

Add xe_force_wake_tryget() a caller of xe_force_wake_get() would like
to skip early and not have to worry about undoing changes made by
xe_force_wake_get() on error.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_force_wake.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 9bbe8a5040da..9eef4ebaeccc 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -197,3 +197,25 @@ int xe_force_wake_put(struct xe_force_wake *fw,
 
 	return ret2;
 }
+
+/**
+ * xe_force_wake_tryget - Attempt to wake up the specified force wake domains
+ * @fw: Pointer to the force wake structure
+ * @domains: Bitmask representing the domains to be woken up
+ *
+ * This function attempts to wake up the specified domains by calling
+ * xe_force_wake_get(). If xe_force_wake_get() fails, it calls xe_force_wake_put()
+ * to revert any partial changes and ensure system stability.
+ *
+ * Return: 0 on success, non-zero on failure, indicating one or more domains failed to wake up.
+ */
+int __must_check xe_force_wake_tryget(struct xe_force_wake *fw,
+				      enum xe_force_wake_domains domains)
+{
+	int ret = xe_force_wake_get(fw, domains);
+
+	if (ret)
+		xe_force_wake_put(fw, domains);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 83cb157da7cc..3f918a09f029 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -17,6 +17,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
 				struct xe_force_wake *fw);
 int xe_force_wake_get(struct xe_force_wake *fw,
 		      enum xe_force_wake_domains domains);
+int __must_check xe_force_wake_tryget(struct xe_force_wake *fw,
+				      enum xe_force_wake_domains domains);
 int xe_force_wake_put(struct xe_force_wake *fw,
 		      enum xe_force_wake_domains domains);
 
-- 
2.42.0

