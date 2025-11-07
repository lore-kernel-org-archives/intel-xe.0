Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4C0CD1288
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EEE10EB9B;
	Fri,  7 Nov 2025 18:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L+e9vJsy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825F410EB7B
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539211; x=1794075211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+syolvU5UNcO56a5H6a0zZWWM3pyM1ldX5RsI7uRFaI=;
 b=L+e9vJsybpbmagR3XJgZjP1vLCu77Txl/yz1INbvfdc1TKGIESShU36D
 bkEBOKlSOZucWLjHPqLNoHoDsY0ZqGuwsJEWUeTU+2FcD6Gnkqc8IRKTy
 O3sQgvVpkGQHd7ZMIVoEXNfkcdE6CMkpeCakOnFWs7NXptL/KuyTSu2Pj
 OyI7R5RSyw/haXeioP6YmX33/mCQeP6Sqk9VAfketnUmsfoR8foa1m8Os
 vO1fHWGaWninbOOePcbKC1xqCmVzWQFfdZoiTpjvWKv7kSDGx8aTCLFOW
 9J/jGkRpk7iCdekHCdDpKKiNlTmvK3SCnHg9DW4MBPB9HLtf/sVi76/MY A==;
X-CSE-ConnectionGUID: Tc5F/NZVTfircVmgWUObnw==
X-CSE-MsgGUID: bgp8Dc/qQiSQfwijIwOhBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64733161"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64733161"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:31 -0800
X-CSE-ConnectionGUID: 5sgygdp3QC+S03dvfv9VdQ==
X-CSE-MsgGUID: AApy1CnQRU+XZIOBpkuY8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271234"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:31 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 27/33] drm/xe/bo: Use scope-based runtime PM
Date: Fri,  7 Nov 2025 10:13:43 -0800
Message-ID: <20251107181315.631642-62-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
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

Use scope-based runtime power management in the BO code for consistency
with other parts of the driver.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b0bd31d14bb9..03d81664706a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2035,9 +2035,8 @@ static int xe_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 	struct xe_device *xe = xe_bo_device(bo);
 	int ret;
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 	ret = ttm_bo_vm_access(vma, addr, buf, len, write);
-	xe_pm_runtime_put(xe);
 
 	return ret;
 }
-- 
2.51.1

