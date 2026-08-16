Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7685AC5B572
	for <intel-xe@archiver.kernel.org>; Sun, 16 Aug 2026 22:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B3A10E377;
	Sun, 16 Aug 2026 22:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DIx4tfat";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3DF10E34B;
 Sun, 16 Aug 2026 22:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786920028; x=1818456028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/1w1T00Mjdasjce0YrJsdIg8clz2BXXHoea8pbfgWWI=;
 b=DIx4tfatTkUAwKDThxmNRHTs6roKHNltMiURKc8mCcb76PXa1vnsQpDB
 zMQntiqxr5aCaVtclUAzyHbY1fhvSjl3mdQhsSZiIjQeZkyUflzrvUOjJ
 0BuXDg6XRDeva8G9f7sbFhWgpH/R32l2L/oS51yDHd6aLWqwKmfzkwibI
 AHv3WY8Z9SJxn6QTo4JWkDWJzfYdOaycIDKENrHFnPHmNkffkQqBtkdtv
 odEJI4vPWTLQAOnq6cmg8u1s72mkU7G+1if5Kn1KSBHWAAfmdNoXEQss7
 hYgxlBqfDR3SXHusg80WtnI2OwQ2kScdBn8hfllv+MWsuDdU0Upliss1J Q==;
X-CSE-ConnectionGUID: QMysMk1WRY6lsQFdbTsTUQ==
X-CSE-MsgGUID: IVFz7nXaReWQEQvcc0ENfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98761678"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; d="scan'208";a="98761678"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 15:40:28 -0700
X-CSE-ConnectionGUID: 7JvLYe+hTpOFj51afWui7A==
X-CSE-MsgGUID: LSBenwaOQcKJXT+l9MyeQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; d="scan'208";a="269948348"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.249.236])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 15:40:26 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	imre.deak@intel.com
Subject: [RFC PATCH 2/5] drm/i915/display: add pme_capable() to the parent
 interface
Date: Mon, 17 Aug 2026 01:40:01 +0300
Message-ID: <20260816224005.886035-3-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816224005.886035-1-vinod.govindapillai@intel.com>
References: <20260816224005.886035-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

Add a provision to query the optional pme_capability to the parent
interface so that it could be called independently from xe or i915
based on the implementation.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_rpm.c | 7 +++++++
 drivers/gpu/drm/i915/display/intel_display_rpm.h | 1 +
 include/drm/intel/display_parent_interface.h     | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_rpm.c b/drivers/gpu/drm/i915/display/intel_display_rpm.c
index 0a331f89b4db..73d85384474e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_rpm.c
+++ b/drivers/gpu/drm/i915/display/intel_display_rpm.c
@@ -46,6 +46,13 @@ bool intel_display_rpm_suspended(struct intel_display *display)
 	return display->parent->rpm->suspended(display->drm);
 }
 
+bool intel_display_rpm_pme_capable(struct intel_display *display)
+{
+	const struct intel_display_rpm_interface *rpm = display->parent->rpm;
+
+	return rpm->pme_capable && rpm->pme_capable(display->drm);
+}
+
 void assert_display_rpm_held(struct intel_display *display)
 {
 	display->parent->rpm->assert_held(display->drm);
diff --git a/drivers/gpu/drm/i915/display/intel_display_rpm.h b/drivers/gpu/drm/i915/display/intel_display_rpm.h
index 6ef48515f84b..2d4071fb9282 100644
--- a/drivers/gpu/drm/i915/display/intel_display_rpm.h
+++ b/drivers/gpu/drm/i915/display/intel_display_rpm.h
@@ -21,6 +21,7 @@ void intel_display_rpm_put(struct intel_display *display, struct ref_tracker *wa
 
 /* Only for special cases. */
 bool intel_display_rpm_suspended(struct intel_display *display);
+bool intel_display_rpm_pme_capable(struct intel_display *display);
 
 void assert_display_rpm_held(struct intel_display *display);
 void intel_display_rpm_assert_block(struct intel_display *display);
diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
index d7d06dcaa699..563de403b102 100644
--- a/include/drm/intel/display_parent_interface.h
+++ b/include/drm/intel/display_parent_interface.h
@@ -196,6 +196,7 @@ struct intel_display_rpm_interface {
 	void (*put_unchecked)(const struct drm_device *drm);
 
 	bool (*suspended)(const struct drm_device *drm);
+	bool (*pme_capable)(const struct drm_device *drm); /* Optional */
 	void (*assert_held)(const struct drm_device *drm);
 	void (*assert_block)(const struct drm_device *drm);
 	void (*assert_unblock)(const struct drm_device *drm);
-- 
2.43.0

