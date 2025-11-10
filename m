Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369C2CD13DA
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:20:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F0010E47D;
	Mon, 10 Nov 2025 23:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EK2YITSP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1004C10E385
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762816832; x=1794352832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pEcKDdU6XlzOCUpmkujVhgcON59W9LyxEMtmzEBurms=;
 b=EK2YITSPBH646GtpmYDbg30XQTT4DToIWXZamALDoh6amoC0nj6zWZYY
 GVFI7dd/I+657gaPE7fDXI0OYthQsXClHtDRREySi//Y6E3Utfqn7mkhS
 PgxtMAkpsG+0mKPlx4v7UkLWEqVFAaEyBUGgz1eqKxeiOwttEzg2avg2H
 EqAapw5ZLZmmGhAaUcHsGiSc03F4IY0eyQa6fKOofGY4HkllUgWGpP9hy
 KdDA0H/79cKVoAsz/3+skYCsz7TlcVQ4fxUVHKoI368XwO3iLTdyAJnJa
 HnBrUGCEVbNjGbEMYwZSJrEvwUvSG+4Gx4zD3zdWMufF6S5aTnKjDPqxu g==;
X-CSE-ConnectionGUID: IuHkiEvIRJmMpnUjWur9GQ==
X-CSE-MsgGUID: JMU564Y0TfCnw1wYDacXew==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64914841"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="64914841"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
X-CSE-ConnectionGUID: zpk1Oh7DSnChtsXS5atz2g==
X-CSE-MsgGUID: y4q3mMBHQ1yG2ikxv9zTLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189243948"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:31 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 01/30] drm/xe/forcewake: Improve kerneldoc
Date: Mon, 10 Nov 2025 15:20:19 -0800
Message-ID: <20251110232017.1475869-33-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110232017.1475869-32-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
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

Improve the kerneldoc for forcewake a bit to give more detail about what
the structures represent.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake_types.h | 26 ++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
index 12d6e2367455..9cfa28faf7bc 100644
--- a/drivers/gpu/drm/xe/xe_force_wake_types.h
+++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
@@ -52,7 +52,22 @@ enum xe_force_wake_domains {
 };
 
 /**
- * struct xe_force_wake_domain - Xe force wake domains
+ * struct xe_force_wake_domain - Xe force wake power domain
+ *
+ * Represents a individual device-internal power domain.  The driver must
+ * ensure the power domain is awake before accessing registers or other
+ * hardware functionality that is part of the power domain.  Since different
+ * driver threads may access hardware units simultaneously, a reference count
+ * is used to ensure that the domain remains awake as long as any software
+ * is using the part of the hardware covered by the power domain.
+ *
+ * Hardware provides a register interface to allow the driver to request
+ * wake/sleep of power domains, although in most cases the actual action of
+ * powering the hardware up/down is handled by firmware (and may be subject to
+ * requirements and constraints outside of the driver's visibility) so the
+ * driver needs to wait for an acknowledgment that a wake request has been
+ * acted upon before accessing the parts of the hardware that reside within the
+ * power domain.
  */
 struct xe_force_wake_domain {
 	/** @id: domain force wake id */
@@ -70,7 +85,14 @@ struct xe_force_wake_domain {
 };
 
 /**
- * struct xe_force_wake - Xe force wake
+ * struct xe_force_wake - Xe force wake collection
+ *
+ * Represents a collection of related power domains (struct
+ * xe_force_wake_domain) associated with a subunit of the device.
+ *
+ * Currently only used for GT power domains (where the term "forcewake" is used
+ * in the hardware documentation), although the interface could be extended to
+ * power wells in other parts of the hardware in the future.
  */
 struct xe_force_wake {
 	/** @gt: back pointers to GT */
-- 
2.51.1

