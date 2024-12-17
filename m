Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E9CE77184
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 23:33:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EC410EA8D;
	Tue, 17 Dec 2024 23:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z4q4q5Uq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D09210E41B;
 Tue, 17 Dec 2024 23:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734478389; x=1766014389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iwX0eipER2lX/plSJH/5FlCnY8J5v2QV4BC06zKxeiw=;
 b=Z4q4q5UqrKwX2aYlvYWZ+Z1kAzLWLuNZI7CTC7QYQhhYTpWk7lJH4W75
 P7QsZK4CNLgftaSf0n8624XaEz03emh/HsghpQKWt4VsFephzDI3CdBLZ
 E7TfkR68M3Q2GfDCR9rxVPIt8RXxHI5BXxs/vuWFlOFDMHnZHilDK0lMk
 nss5HE+56fAZcyXUIs6pMviIVNct0sI/MiJM6RCDQfGXkjcR9oLMgzvYH
 /INpx3sdXHwuS338cpahhlYynTQVsvHCnQ0m6EVcPqOd1/R6QaROZ3Wu+
 GitITRedBK1QYaMNd6hoYiTPIEA3JpewYydUo6Z6SZ1a8dQv60E4BRyv1 w==;
X-CSE-ConnectionGUID: ZjPSKdOIRRaC4RHTLnKHhQ==
X-CSE-MsgGUID: 2Jgd/mUfQDOXAjbF+0A85Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22517361"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="22517361"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:08 -0800
X-CSE-ConnectionGUID: 7/lmRPctSLOEkaXeg0c09Q==
X-CSE-MsgGUID: C3XwpzROSPK8ZZPKsULtHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102273428"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v3 06/30] drm/xe: Select DRM_GPUSVM Kconfig
Date: Tue, 17 Dec 2024 15:33:24 -0800
Message-Id: <20241217233348.3519726-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217233348.3519726-1-matthew.brost@intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
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

Xe depends on DRM_GPUSVM for SVM implementation, select it in Kconfig.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index b51a2bde73e2..3a08e16bfada 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -39,6 +39,7 @@ config DRM_XE
 	select DRM_TTM_HELPER
 	select DRM_EXEC
 	select DRM_GPUVM
+	select DRM_GPUSVM
 	select DRM_SCHED
 	select MMU_NOTIFIER
 	select WANT_DEV_COREDUMP
-- 
2.34.1

