Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A77EECD99C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 19:59:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D96310E08C;
	Thu,  5 Feb 2026 19:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BdY9PYK6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFFC10E07D
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 19:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770321557; x=1801857557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G/qQRLGylmOYaSbK375gJD6x2U+NkJI7oMS5QhbnXqI=;
 b=BdY9PYK6J1Bd16Bv1vZjHSn5/bWYShmb+KadtsGv1dTT6TOlneBahevA
 deZXK+wazKsX9s6qde9+zDokRszusNcRmUC19Fm7/pqRmlQsrbQnBoZDi
 wXIhaS6ljRqs4lyFLjucovHjKrUn5R0uMlYN4eJRkhBi4hrSifMwn+yWR
 G+IeXCvfFfRn/l8y2l+5hjIjut2DDhPBwIcI/Mn8Q7WtlqbsBzYbNPDDK
 RsFlW4GEbIKMaZhpzXTI2iHlo802hR90Ck+Hh8RRkjAoZIdFJ4Wnz3Bln
 OFlfP4K5XUGrVk3jQYJrbSBYoZ6D+9RzKE0mun+tZUWCnzh1j7tpG3Q/l w==;
X-CSE-ConnectionGUID: WaGip8ZBQiWEDmmjodgViQ==
X-CSE-MsgGUID: E100TDt/TA2+mo6shbf9+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="70548530"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="70548530"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 11:59:17 -0800
X-CSE-ConnectionGUID: TD+0FZUSSlqf7Y+59cfnUg==
X-CSE-MsgGUID: XMRwgRMHQ0WIPgPOXPo9KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210705571"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 11:59:17 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 7/7] Reapply "topic/for-xe-CI: drm/xe/cri: Define GuC firmware
 for CRI"
Date: Thu,  5 Feb 2026 11:57:54 -0800
Message-ID: <20260205195833.2928038-16-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260205195833.2928038-9-julia.filipchuk@intel.com>
References: <20260205195833.2928038-9-julia.filipchuk@intel.com>
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

This reverts commit d3040547755510012b34fc2794063ca0fe5fd9f1.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index e4055ad73186..de1b93a99a32 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,6 +115,7 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 55, 4))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 55, 4))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 58, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 58, 0))	\
-- 
2.51.0

