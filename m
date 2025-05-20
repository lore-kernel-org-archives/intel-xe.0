Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8530DC3DA6D
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 14:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DDE10E49E;
	Tue, 20 May 2025 14:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AKbuBa+k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4BE10E49E
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 14:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747751085; x=1779287085;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IwVIJU8V3YdpTpNgcmQNWhcXNfUgneMngyuPiX+DKC4=;
 b=AKbuBa+k0EBdNPiI5GZEH8Z5+0NT5k+qr3bfliXunuKT3EnU5FzrRy61
 9TT1tv8hV+wqF+C+6wPQMpqJAqfL/26x0UUgqpI8TYdb/2zN8lOGS3y7p
 8qehySanL5hSRiv/QXYgPge9nqebc67Fpo8JuoDt7CpPGiWsP09En2gXO
 rS1dJlS3wMMfyqU4pfu2hNoKBEx1yPQcHSzzAkytMRLh/RM79NAvoh0zw
 OmTJzBSEOskh/pmDUK1V6Nbk467tGr+utkBNFhsNqnC/reKnuKA46HTuj
 O2kj+Q4/2pKOVGGKazVjtnMpVXSq7MBFLp83x7NKEJkHcc4I4Hl3SeD7b g==;
X-CSE-ConnectionGUID: HJg6L1CkSbOkOzfNtfRWzw==
X-CSE-MsgGUID: MiLQFLOOQd2ge9aMXKuEbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="53487407"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="53487407"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 07:24:45 -0700
X-CSE-ConnectionGUID: RB5K+rVAT7iOkYyT9OOvyw==
X-CSE-MsgGUID: /NBSzjcyQl+cLGtFNnY+ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139591947"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 07:24:43 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] drm/xe/mocs: Initialize MOCS index early
Date: Tue, 20 May 2025 19:54:45 +0530
Message-Id: <20250520142445.2792824-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
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

MOCS uc_index is used even before it is initialized in the following
callstack
    guc_prepare_xfer()
    __xe_guc_upload()
    xe_guc_min_load_for_hwconfig()
    xe_uc_init_hwconfig()
    xe_gt_init_hwconfig()

Do MOCS index initialization earlier in the device probe.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 0e5d243c9451..858b5398c01b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -417,6 +417,8 @@ int xe_gt_init_early(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	xe_mocs_init_early(gt);
+
 	return 0;
 }
 
@@ -634,8 +636,6 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	xe_mocs_init_early(gt);
-
 	err = xe_gt_sysfs_init(gt);
 	if (err)
 		return err;
-- 
2.34.1

