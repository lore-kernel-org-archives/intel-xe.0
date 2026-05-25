Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C72CD5BC9
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 16:05:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B0D10E3B0;
	Mon, 25 May 2026 16:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JtpeSOry";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B5210E3CE
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 16:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779725145; x=1811261145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QdEHkwuNUG3CO6FhGdIOJRNeQsH0OY/ErUx0/A4cIKg=;
 b=JtpeSOryUtIX1HUYV7qb0FPGDlbcUFw7ijA/V7gArq+FEPGL7D6Ii8Vq
 /HOrCqvkr+XojYjQgUEuz3tJThbNbCvZ4xrp2sgs6U52oxxp2TZB7NR7X
 95MtxMxQTzh8zJosbwL19JyGwcZ9Ht4qbmXmj0Z687geBEBtdVjAT2lTi
 8LMsHnkm3NE3UKFzsLx4DOKRUOH4zmAe8ZD+vIYRIERdScIwcE80MMYDy
 UU5YJA1h3GnW1skmrvft50tXqQTDbsgXG/UEOJuyV0DGCLCWRKSJQ7Cnf
 weVc+DQ7KaPfUjmtFTObpqihiH9U1zIMdrySe5+vKRLuFHxnYLuI0egxj A==;
X-CSE-ConnectionGUID: 6ltp+TJFTN2njyQI1ykRaw==
X-CSE-MsgGUID: ahf1kX9uRHKeAT292s83ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80275440"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80275440"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 09:05:45 -0700
X-CSE-ConnectionGUID: 1Nic6zd4QYmOG9iqZizs8Q==
X-CSE-MsgGUID: 4Y6m7vkBSIqV39jbvwHaEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="235275261"
Received: from gkearney-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.94])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 09:05:44 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 6/6] drm/xe/pm: Do early initialization in init_early()
Date: Mon, 25 May 2026 18:05:29 +0200
Message-ID: <20260525160529.15890-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525160529.15890-1-michal.wajdeczko@intel.com>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
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

There is no need nor gain in splitting mutex or list initializations
between two init functions as all of this is just pure software state
and all this could be done at once.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 5d1a3a26cb6e..99562f691080 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -363,6 +363,9 @@ int xe_pm_init_early(struct xe_device *xe)
 {
 	int err;
 
+	init_completion(&xe->pm_block);
+	complete_all(&xe->pm_block);
+	INIT_LIST_HEAD(&xe->rebind_resume_list);
 	INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
 
 	err = drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
@@ -373,6 +376,10 @@ int xe_pm_init_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = drmm_mutex_init(&xe->drm, &xe->rebind_resume_lock);
+	if (err)
+		return err;
+
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
@@ -484,14 +491,6 @@ int xe_pm_init(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = drmm_mutex_init(&xe->drm, &xe->rebind_resume_lock);
-	if (err)
-		goto err_unregister;
-
-	init_completion(&xe->pm_block);
-	complete_all(&xe->pm_block);
-	INIT_LIST_HEAD(&xe->rebind_resume_list);
-
 	/* For now suspend/resume is only allowed with GuC */
 	if (!xe_device_uc_enabled(xe))
 		return 0;
-- 
2.47.1

