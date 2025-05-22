Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04443C54E65
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 20:46:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B058810E19D;
	Thu, 22 May 2025 20:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VzUAOk5s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B379810E19D
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 20:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747946780; x=1779482780;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BC5r2z01/m37e6XjBmboFu9usGpqpkXy7AkOZGD/zbs=;
 b=VzUAOk5s5uQRBF1BbUc4T4kdRiujr5HJZOVwEgHjEmQ90f915CS0OSi0
 lP+Y769WDXNZ3l8D09sHuRjNnJlbmGqcuu6fFqDLTewJSUWBZECov7fz6
 oyrTT2bX5C4J1IJv3WQfT7jaQcu7+oxu+6hwvSawBgqGi8xts3JZ87UdE
 onfcPsJzNZzYRc1PjgTC4f+w/fq2MfEFyktbI8IwNWU/vor8FhVBBEsIV
 GI2D3GGWLxszcU/cBkzUh1odxGRrxfrMWfNbOZKGTRjvVAgtP6NDQ9T1b
 3ES9ay2APooZvuqNbXw3jWSNlxyUJpM+AnEiRgHygADtbk/03zdk+dAwt A==;
X-CSE-ConnectionGUID: WwLuP7PzQwaG8GnD3d8Wbg==
X-CSE-MsgGUID: At3d85xDRtqIlTKf284oeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50048350"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="50048350"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 13:46:19 -0700
X-CSE-ConnectionGUID: 6chicqjDQRa1q/5xCFjKrg==
X-CSE-MsgGUID: DpktphEjSmuhcqc0yl+KSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="141189008"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 13:46:16 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 2/3] drm/xe/pxp: Clarify PXP queue creation behavior if PXP
 is not ready
Date: Thu, 22 May 2025 13:46:05 -0700
Message-ID: <20250522204602.3921904-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522204602.3921904-5-daniele.ceraolospurio@intel.com>
References: <20250522204602.3921904-5-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The expected flow of operations when using PXP is to query the PXP
status and wait for it to transition to "ready" before attempting to
create an exec_queue. This flow is followed by the Mesa driver, but
there is no guarantee that an incorrectly coded (or malicious) app
will not attempt to create the queue first without querying the status.
Therefore, we need to clarify what the expected behavior of the queue
creation ioctl is in this scenario.

Currently, the ioctl always fails with an -EBUSY code no matter the
error, but for consistency it is better to distinguish between "failed
to init" (-EIO) and "not ready" (-EBUSY), the same way the query ioctl
does. Note that, while this is a change in the return code of an ioctl,
the behavior of the ioctl in this particular corner case was not clearly
spec'd, so no one should have been relying on it (and we know that Mesa,
which is the only known userspace for this, didn't).

v2: Minor rework of the doc (Rodrigo)

Fixes: 72d479601d67 ("drm/xe/pxp/uapi: Add userspace and LRC support for PXP-using queues")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pxp.c | 8 ++++++--
 include/uapi/drm/xe_drm.h   | 5 +++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index 454ea7dc08ac..b5bc15f436fa 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -541,10 +541,14 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
 	 */
 	xe_pm_runtime_get(pxp->xe);
 
-	if (!pxp_prerequisites_done(pxp)) {
-		ret = -EBUSY;
+	/* get_readiness_status() returns 0 for in-progress and 1 for done */
+	ret = xe_pxp_get_readiness_status(pxp);
+	if (ret <= 0) {
+		if (!ret)
+			ret = -EBUSY;
 		goto out;
 	}
+	ret = 0;
 
 wait_for_idle:
 	/*
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 9c08738c3b91..6a702ba7817c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1210,6 +1210,11 @@ struct drm_xe_vm_bind {
  *    there is no need to explicitly set that. When a queue of type
  *    %DRM_XE_PXP_TYPE_HWDRM is created, the PXP default HWDRM session
  *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if isn't already running.
+ *    The user is expected to query the PXP status via the query ioctl (see
+ *    %DRM_XE_DEVICE_QUERY_PXP_STATUS) and to wait for PXP to be ready before
+ *    attempting to create a queue with this property. When a queue is created
+ *    before PXP is ready, the ioctl will return -EBUSY if init is still in
+ *    progress or -EIO if init failed.
  *    Given that going into a power-saving state kills PXP HWDRM sessions,
  *    runtime PM will be blocked while queues of this type are alive.
  *    All PXP queues will be killed if a PXP invalidation event occurs.
-- 
2.43.0

