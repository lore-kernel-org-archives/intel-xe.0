Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D64C021A7
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 21:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E66110ED47;
	Fri, 14 Feb 2025 21:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kqVhcO1L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A199810ED44
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 21:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739568225; x=1771104225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kxOdQQfbuvKmFqSIVqyHfTLxTt8Use1SxWn+CTtG5Fs=;
 b=kqVhcO1LJWdC2AXVwJWmaZefH8MBofPYjWfwXz/Mym+/8jDcAjU+D11r
 9ccZix8rK1xnnkCn314pzqwcyscmQkZ6UHUeMqvCRG93VUyG5/o4M+J0r
 ee4FUsDco3hMxCMaUHFvzDcP3ctCFc5fEYlEIV4wWO9KAEVUdjHDeQv29
 Mi+BeFc5srh6SQOPGUJSBGLX5OnVJaAhxN8oOSQlqPo2CdybkatPUgS18
 RMm3gwHShQdAxopHU4tscbR3wtL11U90/rk00QwFqxUa4tu/OKj5Pl/hX
 AUzMDDVnHB6hEESs3UMIQSLz6CxMGgFOpdLR/KGigOTuyiug0n4GRGawh Q==;
X-CSE-ConnectionGUID: UNWbZxG9Rai/VDJjrmGgFg==
X-CSE-MsgGUID: fVHSGrZURA2CaWi5kngdGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40447024"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40447024"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 13:23:45 -0800
X-CSE-ConnectionGUID: jcTaRqhWQRmIc6ZQM/E/Cw==
X-CSE-MsgGUID: pJyzZ4XVSBa8SOpZPotO8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="113757049"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 13:23:45 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 8/9] drm/xe: Rename update_device_info() after sriov
Date: Fri, 14 Feb 2025 13:23:12 -0800
Message-ID: <20250214212313.1767562-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214212313.1767562-1-lucas.demarchi@intel.com>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
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

This is only changing info flags for SR-IOV reasons. Rename it
accordingly, because there are several other places in probe where the
flags are updated, which is not inside this function.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4af4b526a2801..3255c36700f60 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -660,7 +660,7 @@ static int wait_for_lmem_ready(struct xe_device *xe)
 }
 ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO); /* See xe_pci_probe() */
 
-static void update_device_info(struct xe_device *xe)
+static void sriov_update_device_info(struct xe_device *xe)
 {
 	/* disable features that are not available/applicable to VFs */
 	if (IS_SRIOV_VF(xe)) {
@@ -691,7 +691,7 @@ int xe_device_probe_early(struct xe_device *xe)
 
 	xe_sriov_probe_early(xe);
 
-	update_device_info(xe);
+	sriov_update_device_info(xe);
 
 	err = xe_pcode_probe_early(xe);
 	if (err)
-- 
2.48.1

