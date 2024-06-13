Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E93C27C75
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 15:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB9810EACD;
	Thu, 13 Jun 2024 15:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qddl+rGu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA6510EAE8
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 15:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718292049; x=1749828049;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=BBMkC39BkEGRsBw9Mdr32+8ynwsD8554cYfNGh3Y26I=;
 b=Qddl+rGubTegJvNh7SgCCMlN6S7WAVyuWld3WYKgDU6XnTMSQL3g0F9d
 hQ/FPbLnL5RMSDquRt8uy0ldtVcA3KD6Rh3J2nCqV35SUmj4eZDr8tOOv
 0gZMSpljGSobnNS/0UohiMhZvSl3uRJLW0ZEG/s/2dAkVGYJHTYqMoGgK
 nrn/4J6fA38/fBCbgg3haosiDX2v39dj8/2Ibzasz7se2tCaK2nmg1Zbc
 UBX2GWmnQQKpvjvrMmxoYNwOWgnFJyOTXCkSCftpDLfWYoll9Z/SktVA9
 oKUyuA9wKFDd2HvfPiCdxcqWqFhO241zOM7HhVaGfngKU1qrqdR/jjDiu Q==;
X-CSE-ConnectionGUID: zayjGTZXTa+zpJrmAbn+Qg==
X-CSE-MsgGUID: GFGOzCdTRxuDQUq+gdhSbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15348676"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="15348676"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:44 -0700
X-CSE-ConnectionGUID: 3xtqvjtURYCxqK8lu1uxvA==
X-CSE-MsgGUID: xjwvxGtzQUmuAaL14pqepA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40135132"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:43 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 42/42] drm/xe: Enable system allocator uAPI
Date: Thu, 13 Jun 2024 11:31:28 -0400
Message-Id: <20240613153128.681864-42-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613153128.681864-1-oak.zeng@intel.com>
References: <20240613153128.681864-1-oak.zeng@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index afb7d78a2260..9f2384cccaa8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2871,12 +2871,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u16 pat_index = (*bind_ops)[i].pat_index;
 		u16 coh_mode;
 
-		/* FIXME: Disabling system allocator for now */
-		if (XE_IOCTL_DBG(xe, is_system_allocator)) {
-			err = -EOPNOTSUPP;
-			goto free_bind_ops;
-		}
-
 		if (XE_IOCTL_DBG(xe, pat_index >= xe->pat.n_entries)) {
 			err = -EINVAL;
 			goto free_bind_ops;
-- 
2.26.3

