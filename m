Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FF4CD6E45
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 21:52:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F8810F655;
	Thu, 28 May 2026 21:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FM50GA+f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC4110F655
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 21:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780005175; x=1811541175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h3O4dmKiv2IV+ZjUzsPb2Vvy0d+mQOu4mkAdQZlSd1Q=;
 b=FM50GA+f76hD7dDP+FWHjv7BY1vN3zvPsTgVolhnfm1GqYsxTwwPhSn9
 JrgN9rOOrWis4R7HIA1IGbA7sT/HrYgLCYJHBL3/geuDaRzr99NL3DXA3
 QDAUpopLa4d3d0BknGcjw6HZA0Py780ZvMKg2Hw5CJmCMKUheEfNyptJA
 VyfmmGFEFqyqvdOY3MlglCDhyum8TZFs1J2GxQ4KFQbH5Jqay+0sIrDw4
 55xDocp0Oyi1h202noSh0eBTi+NW4oQWBkSPuI8DH1Wt1zyCqE+/hTpRd
 34LWnJ32Ve5XoYONouvpwZrdAf0FrkYKMsGJBfwbz9Pe3gs5dF9XGFMU4 w==;
X-CSE-ConnectionGUID: yvnwBzlpRBaCqeZZnoK6dg==
X-CSE-MsgGUID: Ikv2dPDXQpitEVshsPB9rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80710763"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="80710763"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 14:52:54 -0700
X-CSE-ConnectionGUID: 0533wERxTjKjR2i4whjjQg==
X-CSE-MsgGUID: E88C4cteS0qA4J/uCOnyBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="272994648"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 14:52:54 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 02/10] Revert "topic/for-xe-CI: drm/xe/cri: Define GuC
 firmware for CRI"
Date: Thu, 28 May 2026 14:51:29 -0700
Message-ID: <20260528215227.1282471-14-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260528215227.1282471-12-julia.filipchuk@intel.com>
References: <20260528215227.1282471-12-julia.filipchuk@intel.com>
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

This reverts commit cff5e8fa6b434bcc543d021d6f865221536ea9f8.

This is temporary to create a clean patch onto drm-xe-next.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 6268ca599ec4..70bccbc1af82 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,7 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 55, 4))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 55, 4))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
-- 
2.51.0

