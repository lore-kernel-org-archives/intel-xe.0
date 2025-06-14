Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED8CC71136
	for <intel-xe@archiver.kernel.org>; Sat, 14 Jun 2025 01:55:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF79410E1EE;
	Sat, 14 Jun 2025 01:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3dP9MrZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B528010E1EE
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Jun 2025 01:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749866153; x=1781402153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=plXWoApz3hoMG52+XNkS/8vp2SwINQ8cLMoPWShNQOk=;
 b=H3dP9MrZfmXij89hLClibQh1pM4ChAXmjImB93j4KS8rCWPJjb8TitMG
 xb8G+aYZ6m7dCiFQmDb5JihMDe2WFvMLsLMGywJVlQ/01d52ZhvIqlfv6
 Wyu1qUG6OFx9ZacZmY7PAT1TXBTQYUqjdXbWx+3p1f3hR3LkYFovfj8mW
 B/XEbM7iCwGk4OiAbGjt5PqNmFrGhL32XnRtoVJpxnUzvPv9x5ScxSsDX
 3C9k2c7rjs6Btw2Vlk3fUQa3f4DbhiLwoOdH0WYnIApHcOcAfHShackqZ
 JVCpBxXYc4m9GFDCJQQi5sPQnX0K5IBTOk6z/qVEINPjtMTqmJZP1pBUg w==;
X-CSE-ConnectionGUID: f+wCofXHRiiX7JrLExHAnQ==
X-CSE-MsgGUID: JIgiJ7IlRN601heGGiUxoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="77481406"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="77481406"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 18:55:52 -0700
X-CSE-ConnectionGUID: ZmzWRRjiQsKARx7PwMYM2Q==
X-CSE-MsgGUID: BBDa7I1fTraBLwXBsz2TCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="148875038"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 18:55:52 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 1/7] Revert "drm/xe/ptl: Define HuC FW version for PTL"
Date: Fri, 13 Jun 2025 18:55:05 -0700
Message-ID: <20250614015511.691610-2-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250614015511.691610-1-julia.filipchuk@intel.com>
References: <20250614015511.691610-1-julia.filipchuk@intel.com>
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

This reverts commit cac442be6ecf55147008b369f43c84015b9cb12d.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index b9aec6c5d3d73..ec946727828fa 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -129,7 +129,6 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	huc,		ptl, 10, 3, 2))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	no_ver(xe,	huc,		bmg))		\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	no_ver(xe,	huc,		lnl))		\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc_gsc,	mtl))		\
-- 
2.49.0

