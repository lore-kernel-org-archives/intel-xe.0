Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855C7C3DA70
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 00:32:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E257110E203;
	Thu, 25 Jul 2024 00:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IzfKk7Vs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B7810E1AA
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 00:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721867557; x=1753403557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=92nJP/O1jklBh51fU/gF/qAMJ9I+vEgyH3ltOsofZKM=;
 b=IzfKk7VsMp6kFgOgGRNl0W41CsGnj5IVhWQwNcncSIi/k/ZrL7kMPtPN
 3rLl1BTFPiG8Or8e2xt0ZVOm1gRo1ar9GEo+HFLCHVgLJJiu1D8bC4dp4
 0RjGYbJ5eP+BHTi/hR8jWNaiR3q2rutQLQ6WgbS7xxzEscUsV7aJ7UWj4
 GavYNh3Zcfgc9ToTDOSL1+FSNkEvGwO6Uae7EPOmkwSrOikIy1dO3pocX
 cTTcZyy/oyy0+qFBfRFomF/SbD9lE5W4ZlEjXZgGEihkBUpgSCzfL1ool
 bQ4oUIMb/Uup9zOeL1mg9PLQemGg5v7lRBoeSval1YfYJZo1VpHvP4Un/ w==;
X-CSE-ConnectionGUID: JtD0T3W4ROSDwOKLu76kAw==
X-CSE-MsgGUID: 1KLZcPY3QfSjAKlKyZ8zEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19192535"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="19192535"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 17:32:37 -0700
X-CSE-ConnectionGUID: WOEYdhHRTnSH48dOgL2XKQ==
X-CSE-MsgGUID: EC88UPGZTPmJDW5y1JcUdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="75976360"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 17:32:37 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 1/6] Revert "drm/xe/huc: Define BMG HuC"
Date: Wed, 24 Jul 2024 17:32:18 -0700
Message-ID: <20240725003224.516233-2-daniele.ceraolospurio@intel.com>
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

This reverts commit 35380fda665130c94063731c249473c414bca251.
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index c1dcf58d25d7..62ed413bf1c3 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -118,7 +118,6 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
-	fw_def(BATTLEMAGE,	mmp_ver(intel-ci/xe, huc_gsc, bmg, 8, 2, 6))	\
 	fw_def(LUNARLAKE,	mmp_ver(intel-ci/xe, huc_gsc, lnl, 9, 4, 6))	\
 	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
 	fw_def(DG1,		no_ver(i915,	huc,		dg1))		\
-- 
2.43.0

