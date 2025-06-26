Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A7AC7EE39
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 18:28:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D8010E2E7;
	Thu, 26 Jun 2025 18:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7QW5RxF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8947510E8EC
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 18:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750962507; x=1782498507;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2cw7yc31eC3bVgFJao1A5fF+RRYRENwDpZbQ0zeRqbg=;
 b=B7QW5RxF4t75jMG7iQ109eXXvixSU4O5dQuiSknicTfaCREBt24VlPik
 Ic3mdmlGWdpc1rRly/1iasEw9LfxuwJDG5ftnppGsGMZtFzQDtc2yg/Qf
 32Kfqv7/FR6RwBOJUK91neR/hNbEJYSWx1lgegDZAgwEsa8aejhfmHr6K
 fW5Mu2ILcOSpFhRd5oswE7mfe5bdlBexLrLSPa0ctlV/LlbaxRb0FsFIV
 2n3XNdbD69pJit7z2jSQ7FOE8HsG8DJc8LG7ACet05l6OEQBXw82Xqluh
 n+l0RVmskl5YQsDoXdcBRs9pdSOLfiyM3gv7gmTnkWtYcOxKHkNCDmtOf A==;
X-CSE-ConnectionGUID: tuwCYEc1QgSjgf+r+C7fFw==
X-CSE-MsgGUID: VEkEQTA3RWW3fNzPRhOLIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64626698"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="64626698"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 11:28:27 -0700
X-CSE-ConnectionGUID: ZKkJYIEtRw+jYVqbrBpWOQ==
X-CSE-MsgGUID: DQ3qjQEaR8mrG29icr22Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="152766358"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 11:28:27 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 5/7] drm/xe/ptl: Add GuC FW definition for PTL
Date: Thu, 26 Jun 2025 11:28:11 -0700
Message-ID: <20250626182805.1701096-14-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250626182805.1701096-9-daniele.ceraolospurio@intel.com>
References: <20250626182805.1701096-9-daniele.ceraolospurio@intel.com>
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

The first official GuC relase for PTL is 70.47.0, which maps to
API version 1.22.4.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 4d3ace56f38a..2584ee3b0316 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,6 +115,7 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 47, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 45, 2))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 45, 2))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
-- 
2.43.0

