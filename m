Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A16FC47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 23:00:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEBA11288C;
	Fri, 22 Mar 2024 23:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CpsRUORT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC281127AE
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 23:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711148448; x=1742684448;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jn2R5acc9FztujAfaN3KWVUHlBwJtjOqg/WBvfQMMoQ=;
 b=CpsRUORT8TtuwMHfajfL7GAJAt9T2dYqpHZGT2G1Q1YwzJKxyBh1JySW
 rTZf8DKECgn+7DrJGbIvjMes+dZRajg3wpXSEnX6mV8wDn25YI0qA9DJM
 2w8zVkWjgTxQprjENBarXyq96+SQN1oWx75zVNkwvVkds4Mgw7H5j50/M
 xgXaVBGZo0o9YDGETwZ4PHwZay07vA3ucHV4nhhEaVCS2IbbeKzxz2m/n
 szYCjhTZ19GEwqj/GJT2aImPM/8aJR5ah6O+Msc2FJZZAJv3SdCHjWE1n
 603yzWjrxaJbKm50IuPCxBxoWV5UknC4/NpKiwHgOreGbEpJdvp9deUe9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="17359455"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="17359455"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 16:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="15493365"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 16:00:47 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [xe-for-ci] drm/xe/huc: Define LNL HuC
Date: Fri, 22 Mar 2024 16:00:40 -0700
Message-ID: <20240322230040.370138-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

First HuC release for LNL.

This patch will need to stay in the xe-for-CI branch until we're
ready to publish the HuC firmware to linux-firmware, at which point
we can change it to use the unversioned file name and  move the it to
drm-xe-next.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1360
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 70bc3b313557..bb4f77c8a868 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,6 +115,7 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
+	fw_def(LUNARLAKE,	mmp_ver(intel-ci/xe, huc_gsc, lnl, 9, 4, 6))	\
 	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
 	fw_def(DG1,		no_ver(i915,	huc,		dg1))		\
 	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,		tgl))		\
-- 
2.43.0

