Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D722C282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 05:32:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D3A10E84A;
	Thu,  6 Mar 2025 05:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WFMwsUjK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DA610E84A
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 05:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741239178; x=1772775178;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ttzx5n3+0NTQ0gtLpP5waXgwaaZlixuSNqna1qY2t7o=;
 b=WFMwsUjKfn49uRAHLJQ1Erw/qRKRDgzoekhy5fdnv+2j4I603FyWjgYZ
 7lLjiEUiuKqx1WcSTnjU6CLY4jLMAPrV5Cw7+NdDZ8oMJTKzyDFhJlpsu
 onaYPNHe6yT/1JSaQrUG+M7BeGDvaROXEMLooGZtGIOWL1up4zdIQmLdu
 lmO5YK2V/KqVH5y957ROhabGsrbwhJ2E3Oqfg577FdgBVS81NxlJlpLaq
 zaU5xC+N3dvBMg6UJcUg0R/kHbsrpNJSSMgbq+r1GSaDFfDG1WF0vhZa2
 57yVtygDV6AE5OQ4SUTjopoGNAdrrDL/nvfPAbgLk0Cow+RE3JZQYtghp A==;
X-CSE-ConnectionGUID: z9hrXtMMQO+cS5DQ43tmBg==
X-CSE-MsgGUID: 7tVJHApmQYmJAyAGnl60bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64680512"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="64680512"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 21:32:58 -0800
X-CSE-ConnectionGUID: tTctRK9XQ5mTDdnCBCeYhw==
X-CSE-MsgGUID: R6Rn1DzTQ126q2LCEKqFgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="124000377"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 21:32:55 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH] drm/xe: fix enable survivability mode
Date: Thu,  6 Mar 2025 11:24:07 +0530
Message-ID: <20250306055407.511405-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

The current implementation skipped entering survivability mode even when
survivability enable returned success. Enter survivability mode
if enable returns success

Fixes: d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6b5fa067b39b..ee0665e54489 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -857,9 +857,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	 * HW to be enabled. In that case enable it and return success.
 	 */
 	if (err) {
-		if (xe_survivability_mode_required(xe) &&
-		    xe_survivability_mode_enable(xe))
-			return 0;
+		if (xe_survivability_mode_required(xe))
+			return xe_survivability_mode_enable(xe);
 
 		return err;
 	}
-- 
2.47.1

