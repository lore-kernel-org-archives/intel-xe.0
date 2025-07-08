Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D822EC83030
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 02:16:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B2E10E0FF;
	Tue,  8 Jul 2025 02:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HH5g6+3z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA3710E0FF
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 02:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751940997; x=1783476997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ESA0SfhQro13l+PYvM7krFTooOsYwlGOIBdzoVOvFYc=;
 b=HH5g6+3z5H9YHoW6qii51Eh0XbS9lgxgD/Mx+fpFUMGPPNGR3faXrpr8
 efdjCOdIfsStEJzcjoOGJjY8zkA9JscSDt8OkPQIJBEGKV0rpSPxVMBvh
 xhf4CvPDdr9Vi4+spxCUaePnS+CqlLQ/by7Ahi+BDWWmi1iWziNGJHBXg
 iS05/p/DXDTwSNvjJSeKlVZEkphNEbAVPdiMdJ7P64tbPfno3NmkkBm44
 0sScODRF17j6qjO9Dm3TDTzFafWJZdhObwdLlc+JbHX/ISeMap7gPgJ4V
 Drt0KoI0xIQUnrSVVrrtkmKSjqWu1N+3tmy8VQRWkfd5WheE7P6Rx5FCF w==;
X-CSE-ConnectionGUID: MVZOEe9xRiWHihyFiZ5EuQ==
X-CSE-MsgGUID: MpEg1S91R66LHZyHoyDWHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64863312"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="64863312"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 19:16:33 -0700
X-CSE-ConnectionGUID: c2E412kTQmGnyTeRVZD4bg==
X-CSE-MsgGUID: GvGTEDeuTNiRXsJb6TLfiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="159909927"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa004.jf.intel.com with ESMTP; 07 Jul 2025 19:16:32 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2] drm/xe/pm: Correct comment of xe_pm_set_vram_threshold()
Date: Tue,  8 Jul 2025 02:14:51 +0000
Message-ID: <20250708021450.3602087-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707021510.3525028-2-shuicheng.lin@intel.com>
References: <20250707021510.3525028-2-shuicheng.lin@intel.com>
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

The parameter threshold is with size in MiB, not in bits.
Correct it to avoid any confusion.

v2: s/mb/MiB, s/vram/VRAM, fix return section. (Michal)

Fixes: 30c399529f4c ("drm/xe: Document Xe PM component")
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index bcfda545e74f..ad263de44111 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -752,11 +752,13 @@ void xe_pm_assert_unbounded_bridge(struct xe_device *xe)
 }
 
 /**
- * xe_pm_set_vram_threshold - Set a vram threshold for allowing/blocking D3Cold
+ * xe_pm_set_vram_threshold - Set a VRAM threshold for allowing/blocking D3Cold
  * @xe: xe device instance
- * @threshold: VRAM size in bites for the D3cold threshold
+ * @threshold: VRAM size in MiB for the D3cold threshold
  *
- * Returns 0 for success, negative error code otherwise.
+ * Return:
+ * * 0		- success
+ * * -EINVAL	- invalid argument
  */
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
 {
-- 
2.49.0

