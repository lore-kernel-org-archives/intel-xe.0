Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B954C2BB9A
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 04:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7D210E210;
	Thu, 13 Jun 2024 04:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GvX2/WKy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6839A10E924
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 04:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718252035; x=1749788035;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NdkX3g5KN5UJnRU4hnFxtWqMqv35/JK2uVK3Zq1otwg=;
 b=GvX2/WKyUbPWjZt1fDs2cr/fZC8UNmPL/Q3QLGZWs1pOriKx30VzHhrf
 LdNlOAmqeQId6ogc5jpWk1TbIlV0DFTNKEBWHLC6a7vztVy1ZGrbFV9G4
 HF/YTUNA2G+D3my44ZamoXFRKA71z9IOCdKsVlUJTYJSW7d9spV+8lmwS
 fCabR4TCjfoRLwaY2Zv1pqgyePZhaRxRY4i+A+niZoH4pit5r3HJOWbpl
 jRH1v4uqJJPVfgU/JX5zq9sNhhR6sHmbb4K5B7CSAoCwJEqRrnm/XOdnY
 ARGCswN3ZcS//oWzxocrNPDQ92psePBCS7PyY9Na3EVx6JN0sOBX4B/Rj A==;
X-CSE-ConnectionGUID: RoyO9eVMRNyVze6cxtHMQA==
X-CSE-MsgGUID: A9KfHmPOSzegzaQa6j8lCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14847999"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14847999"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:49 -0700
X-CSE-ConnectionGUID: rJvCcHNJRRmA4lrT/9MY6w==
X-CSE-MsgGUID: QaGwRgRTQ+2PXZPWt7AJuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40476372"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:48 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 42/42] drm/xe: Enable system allocator uAPI
Date: Thu, 13 Jun 2024 00:24:29 -0400
Message-Id: <20240613042429.637281-42-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613042429.637281-1-oak.zeng@intel.com>
References: <20240613042429.637281-1-oak.zeng@intel.com>
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
index 617949313490..28ee7bf5d4c5 100644
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

