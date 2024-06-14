Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE06C2BA16
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:48:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E44910E2B7;
	Fri, 14 Jun 2024 21:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gLVPQpBE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361BD10E2B3
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401662; x=1749937662;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4x9eRJn4CN1/9DDUXNxY+ZLfA82xiEnX3QkFROleKtY=;
 b=gLVPQpBEwxhlLEdWjsaeYQXGbCyQQPLX19t2nqwscOMmZ//h6NzvHzuZ
 riQCErEJxd67Tf/g8zpqTEJ9ZJvdzrL+XxTI5rpRLidxvduLfSK2OpJ9k
 DjG8F1hEIlI7ea1BKM31DjRcc+BF87edZbv2/9FMC7PLt9KCdOYE5aV5g
 6zFblRxSxiG0W1J8mNV/4O4JWmlYrZDGzgPDrG0yETApzTyuug5HrakLt
 iuBe05Z4lIgnC0ovrT4G5Angc9VyyYNErJPRMdPn1s7QzJ9PsRnPHZEX/
 rsgPQ19YcHCpfQ6wVQ44QXnoIJ6t0XIk3X84nbSvOUFtmRONlaWeNWowD A==;
X-CSE-ConnectionGUID: a7ftqtU1S2qBVcr0Jt6Hfg==
X-CSE-MsgGUID: r+OyLKo/QDKeDsubdu1GFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25886609"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="25886609"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
X-CSE-ConnectionGUID: bIasDGSAQIWSVeQy8BRfGw==
X-CSE-MsgGUID: +u/u7jEpTru+jPamQBJ/uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="45572439"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 44/44] drm/xe: Enable system allocator uAPI
Date: Fri, 14 Jun 2024 17:58:17 -0400
Message-Id: <20240614215817.1097633-44-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240614215817.1097633-1-oak.zeng@intel.com>
References: <20240614215817.1097633-1-oak.zeng@intel.com>
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

System allocator is now functional, so enable it from
uAPI level.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 29eb561de326..f54476038bd9 100644
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

