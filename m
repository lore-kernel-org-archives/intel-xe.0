Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB5AC021B8
	for <intel-xe@archiver.kernel.org>; Sat, 22 Feb 2025 00:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5870610E10F;
	Sat, 22 Feb 2025 00:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T7y8R7Hk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E9310EB46
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Feb 2025 00:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740183070; x=1771719070;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=PZLJd0ZamPsoMWVPXPN8X1pAdjU8pBD5rOo2NxXXJQI=;
 b=T7y8R7Hk/DVxvnvgbiJbsa+X5uysjFfWprEgoNQjAbd7MTG1imj3jZ9C
 4zOs/FBsqTyqpcANd5Po7fAvM2Tia1VrqA+iKEYKa1DuvLffBwloRCTbG
 OzRGRT/8y6/dbq1UCKEnrgj33/vQ8MFN5XxQXYqhW+QtUSWv2R7wdO72N
 Txj8y3HQlV97Lg7lmPt0+I/o0Z7zfVtbISiu0ZQwxbfR6gw/7ncz4AGog
 lyULrfwRrg4nxnY9J0aAh6yOLBNRV15jc5mfIbaFufji5q3mRaHDQ7PPr
 urFA3EHciAVy3ocyaDktTqGCWYCvXPQNBFbSinmQ+LZKB40S4PQ1fA4Ad A==;
X-CSE-ConnectionGUID: Nme6xWA9QYebMFrqfVNIvA==
X-CSE-MsgGUID: R9qPWXOIQS6apyX6MkD2Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44926398"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="44926398"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:11:09 -0800
X-CSE-ConnectionGUID: p0XQA0rNTAmRanG0zFox+g==
X-CSE-MsgGUID: Qz86cAjZQYiHYxV7tDEymA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="115704961"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:11:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2 10/11] drm/xe: Rename update_device_info() after sriov
Date: Fri, 21 Feb 2025 16:10:50 -0800
Message-ID: <20250222001051.3012936-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222001051.3012936-1-lucas.demarchi@intel.com>
References: <20250222001051.3012936-1-lucas.demarchi@intel.com>
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
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1de611fc5240e..79525bc4c6962 100644
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

