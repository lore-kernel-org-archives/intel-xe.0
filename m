Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F53AC2D0CD
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 23:32:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D29710E2F3;
	Mon, 19 May 2025 23:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8ReJ6bl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C350610E047
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 23:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747697575; x=1779233575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0HWuAOv9XyzOjE8YoWtgOxAZaxCBj4uY9xrjqSjHEYk=;
 b=N8ReJ6blnSt9yyN1q1847FshdPQEg/FtyndfSpDI6XDOUvqXa6K238S9
 UuZ5BZ563A2bViyCo+xJvZroBYpOIZfakrueCtFqiMeqgwrnCHiBqOtZ8
 U1Mf7owz4qAbvbLGJIkdUgmNVFU3RcdNRg3GNn1/IQp/q4Lp4acSjUQzc
 z2mltgLJ85vMZK+4634fBs4/JPO9OnBFSAYIc7H8/78Us9HSsZJ5peUOf
 Dc0e0+eh40hTIbN2TWH2V5wU/jvLYjgUqAnv4rGDFCZyEJ7RqLaa/9Xd4
 jP3LLIEQCpINsBAAzK98JIdRup8c+2rrcPeAnMclKvfRB2HnJMW3evP7w w==;
X-CSE-ConnectionGUID: 4MDOm+BATZ+qlPKQ36Nelg==
X-CSE-MsgGUID: lASukAbNSOqBK59bdWvWqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="52244897"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="52244897"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 16:32:54 -0700
X-CSE-ConnectionGUID: 4jfvw6/PQwSmpZFB2hp8iQ==
X-CSE-MsgGUID: PO3ijlthRaejA23AFqHHow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139419034"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 16:32:45 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 2/3] drm/xe/pxp: Clarify PXP queue creation behavior if PXP is
 not ready
Date: Mon, 19 May 2025 16:32:31 -0700
Message-ID: <20250519233228.3754667-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250519233228.3754667-5-daniele.ceraolospurio@intel.com>
References: <20250519233228.3754667-5-daniele.ceraolospurio@intel.com>
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

Fixes: 72d479601d67 ("drm/xe/pxp/uapi: Add userspace and LRC support for PXP-using queues")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
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
index 9c08738c3b91..2708eb73c590 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1210,6 +1210,11 @@ struct drm_xe_vm_bind {
  *    there is no need to explicitly set that. When a queue of type
  *    %DRM_XE_PXP_TYPE_HWDRM is created, the PXP default HWDRM session
  *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if isn't already running.
+ *    The user is expected to query the PXP status via the query ioctl (see
+ *    %DRM_XE_DEVICE_QUERY_PXP_STATUS) and to wait for PXP to be ready before
+ *    attempting to create a queue with this property. If a queue is created
+ *    before PXP is ready, the ioctl will return -EBUSY if init is still in
+ *    progress or -EIO if init failed.
  *    Given that going into a power-saving state kills PXP HWDRM sessions,
  *    runtime PM will be blocked while queues of this type are alive.
  *    All PXP queues will be killed if a PXP invalidation event occurs.
-- 
2.43.0

