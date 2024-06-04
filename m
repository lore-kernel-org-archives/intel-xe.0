Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1206C25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 11:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7387610E45A;
	Tue,  4 Jun 2024 11:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JdH4Efi3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB3F10E46A
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 11:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717499850; x=1749035850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+oc3jmpt6SQIglACK5TwMM+KM//oecjqyinfl6nX/58=;
 b=JdH4Efi3pdDZBAzdmvUXd5bHKy9kQXd1tAtVlSTQYLHviiB7tZfexjK3
 v3PPM5wipOdlIHG3pOg5XPtIt5+xCc74n0S+qqw3FuyOxkUys9W+Pfz4T
 Dei08L7GimSwxKqU78wbnyKlH9YNFtk0QUmCnRHo08oraawKtF/nPeMFn
 T5DlMINJssPUhOCJ4Hi+HxsqhYNAQt2gw2uBhPpODg5SpNenuL6Emfvq4
 domMi52BQwB62I96I7M0sYjneh7ODmJu9kk4M1Indtq4C10qHlfqf1dbr
 jfjc51OtUkOuTljof6qAtSOzvSrIxu5yCyuMdRDmdFFI1KNNV6NhfHIps w==;
X-CSE-ConnectionGUID: tS3mnQjhSa+cGJ5akET1Gw==
X-CSE-MsgGUID: Etr5INPYTpypLagI2UOtTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24701863"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="24701863"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:17:29 -0700
X-CSE-ConnectionGUID: oH+Ih7/lTkC3oB0puUkmig==
X-CSE-MsgGUID: vHDcJ/BOTjKcXqa6e/yNKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37669738"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:17:28 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 9/9] drm/xe: Add __must_check for xe_force_wake_get
Date: Tue,  4 Jun 2024 13:02:25 +0200
Message-ID: <20240604110225.29495-10-nirmoy.das@intel.com>
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

Return value of xe_force_wake_get()  should not be ignored. So add
a __must_check attribute. Also add documentation for all related functions.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 27 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 9eef4ebaeccc..4d77f41fbf14 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -138,8 +138,20 @@ static int domain_sleep_wait(struct xe_gt *gt,
 					 (ffs(tmp__) - 1))) && \
 					 domain__->reg_ctl.addr)
 
-int xe_force_wake_get(struct xe_force_wake *fw,
-		      enum xe_force_wake_domains domains)
+/**
+ * xe_force_wake_get - Wake up the specified force wake domains if any are asleep
+ * @fw: Pointer to the force wake structure
+ * @domains: Bitmask representing the domains to be woken up
+ *
+ * This function ensures that the required domains are active and increments the
+ * reference count for each domain specified. If a domain was not previously active,
+ * it will be woken up. Logs an error message if any domain fails to acknowledge the
+ * wake-up request.
+ *
+ * Return: 0 on success, non-zero on failure.
+ */
+int __must_check xe_force_wake_get(struct xe_force_wake *fw,
+				   enum xe_force_wake_domains domains)
 {
 	struct xe_device *xe = fw_to_xe(fw);
 	struct xe_gt *gt = fw_to_gt(fw);
@@ -168,6 +180,17 @@ int xe_force_wake_get(struct xe_force_wake *fw,
 	return ret2;
 }
 
+/**
+ * xe_force_wake_put - Put the specified force wake domains to sleep when ref count becomes 0
+ * @fw: Pointer to the force wake structure
+ * @domains: Bitmask representing the domains to be put to sleep
+ *
+ * This function decrements the reference count for each domain specified. If a
+ * domain's reference count reaches zero, it will be put to sleep. Logs an error
+ * message if any domain fails to acknowledge the sleep request.
+ *
+ * Return: 0 on success, non-zero on failure.
+ */
 int xe_force_wake_put(struct xe_force_wake *fw,
 		      enum xe_force_wake_domains domains)
 {
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 3f918a09f029..90948bf0054f 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
 			   struct xe_force_wake *fw);
 void xe_force_wake_init_engines(struct xe_gt *gt,
 				struct xe_force_wake *fw);
-int xe_force_wake_get(struct xe_force_wake *fw,
-		      enum xe_force_wake_domains domains);
+int __must_check xe_force_wake_get(struct xe_force_wake *fw,
+				   enum xe_force_wake_domains domains);
 int __must_check xe_force_wake_tryget(struct xe_force_wake *fw,
 				      enum xe_force_wake_domains domains);
 int xe_force_wake_put(struct xe_force_wake *fw,
-- 
2.42.0

