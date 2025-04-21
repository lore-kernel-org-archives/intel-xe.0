Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA88C369AB
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 13:50:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4093E10E3A8;
	Mon, 21 Apr 2025 13:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMPI+pNl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B7A10E3A8
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Apr 2025 13:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745243452; x=1776779452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gTg0yEoWo82CO0QguctE1OTS91ZYDNzB3cRP+P+RdkE=;
 b=iMPI+pNlti5ZBpQlOsHeXX0+yGo4aw+HCUmzf4O6BrI0YVEH9Rg4b1nP
 QBWHwT4IAZi9p51fQiFaKk42G/X7WAL5i4DHssC1CVOuqCkcihMh7i8pR
 kZ6rYlBSlGbIQqObvF+CeIZP4mD9a/PU9ZGvqnFok6YUpf3QxOTrMdik5
 J5fvs3uwrQZ8KQgUFpBB2tNPg3LlttvPpYIQzH15bp9Py8Q8YGhGpcHW9
 UnnUQEzBhegw/qLoea3bpp6FUFEcNYmhPKgL7pRZq+VVGc7atyfnZu1wk
 6wI6cSbAVvkopVdEt0hrduVrg2xEWxsZOoI8uGcmdtzncF69dHTpXeIqI Q==;
X-CSE-ConnectionGUID: L27UoWNKShmszvJZY/eIBg==
X-CSE-MsgGUID: DH+qqz5XTZ6xsKX+gI0tKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="34393139"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="34393139"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 06:50:52 -0700
X-CSE-ConnectionGUID: /RjWUuAaQ1SWlKfJD5DNzw==
X-CSE-MsgGUID: 8Eb7n9r0RBe6cXSxEyb+AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="162681604"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 06:50:50 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 riana.tauro@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v1 2/2] drm/xe/pm: Wait for vram ready in resume
Date: Mon, 21 Apr 2025 19:20:29 +0530
Message-Id: <20250421135029.3489950-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250421135029.3489950-1-karthik.poosa@intel.com>
References: <20250421135029.3489950-1-karthik.poosa@intel.com>
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

Add wait for vram ready during system and runtime resume.
This wait is there in probe and is missing during resume.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 4e112fbacada..479cbccf9ed5 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -182,6 +182,10 @@ int xe_pm_resume(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = wait_for_vram_ready(xe);
+	if (err)
+		goto err;
+
 	xe_display_pm_resume_early(xe);
 
 	/*
@@ -478,6 +482,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		if (err)
 			goto out;
 
+		err = wait_for_vram_ready(xe);
+		if (err)
+			goto out;
+
 		xe_display_pm_resume_early(xe);
 
 		/*
-- 
2.25.1

