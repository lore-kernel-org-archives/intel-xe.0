Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34D5C3DA63
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 00:33:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980DD10E6E6;
	Thu, 25 Jul 2024 00:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhA4EAVp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86D710E225
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 00:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721867559; x=1753403559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gXl4OvANfgAQjJgJRMwSjmlVsq5Fsz+ceqpkROG+S5M=;
 b=BhA4EAVpmY/6oIy7kIvRdjKJuFvhtVzr9/3LD7rqjXNG8qhS9axq/9VU
 AFcNxQeghPtB6qY1aagB4HgAUYf/c0pSkr2i7dlDr2pcXU3AHOh+ORBw3
 9enMFjGZBOsD4mz9joq6dL2k8EyAlSZclbNJhLyf3EEKmPTLF63FJOx4Y
 h8//1peEaq5dXmo7wWCBa7aqfCsDBksH2iDx2atU8de4rctU3cYSAGG9Y
 ust/Z/OChPrMQ2JeJO/fB0Br4WLY3m8KSTeIRd9m41v8qihzO6ow+JnKm
 jNQJnHl4VfX9j4wqxsxhEXLlEEMG8lIXp4AYZjP7MabsI/yLClxRadxbs A==;
X-CSE-ConnectionGUID: 3sAc8C+BSWmKBPdPPjefsQ==
X-CSE-MsgGUID: TSgRBLkvTyWg9W8h5GlWSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19192538"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="19192538"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 17:32:38 -0700
X-CSE-ConnectionGUID: aLABwXLpQF2ww1TvqETrbQ==
X-CSE-MsgGUID: 5SkSX8ckQhi5sgMZwk9+Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="75976369"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 17:32:38 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 3/6] Revert "drm/xe/huc: Define LNL HuC"
Date: Wed, 24 Jul 2024 17:32:20 -0700
Message-ID: <20240725003224.516233-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240725003224.516233-1-daniele.ceraolospurio@intel.com>
References: <20240725003224.516233-1-daniele.ceraolospurio@intel.com>
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

This reverts commit e83735f97c57a05f845ab8dd98a3e1c84955f6f4.
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index a69c61f6b064..aef0aae614b8 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -118,7 +118,6 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
-	fw_def(LUNARLAKE,	mmp_ver(intel-ci/xe, huc_gsc, lnl, 9, 4, 6))	\
 	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
 	fw_def(DG1,		no_ver(i915,	huc,		dg1))		\
 	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,		tgl))		\
-- 
2.43.0

