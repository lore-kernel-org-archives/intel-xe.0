Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BB1CCF9FE
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 01:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E01810E38F;
	Sat,  1 Nov 2025 01:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GA2WttrS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D16810E119
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Nov 2025 01:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761958954; x=1793494954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dXsbb0MSGbNc0T1a5B+RlXuII/X1q3DXmEIvZyq/q+c=;
 b=GA2WttrSorh2HCAmBBPAWLgGT3fCIaAXREUskGrjyM9ZV7H3IoQmbMU/
 W+YnRnJa5BUWnYq0yJI+NM6MVdCqxcLE3mV0iWmXcxcZFFW2xKVIRNiL8
 R+PAgyVgZtgK5NOcWJU1NKilBXfQY9bI781hcaaUimT3YH3h5yYWUuZnb
 C+oEZmYXIj7COqkYtcOe8AxRC/j9GmcHz2UFL89UETk39NwB/V3n4BI1f
 ZHg6ik0j4KL9IawTfgvwPWdgSrizQwzcorgeQ4QEARyVGYnX6oEa6DlQu
 PyJqGVPnRoC+ae/UoaacuCUoDC9bgajkBQ+QXtRe5qZS4uOmpIcv9LsY/ g==;
X-CSE-ConnectionGUID: tYwe+1opQ2yVy/1YJK6jqQ==
X-CSE-MsgGUID: XmU8XUlVRb+bepqGiXeDZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75575699"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="75575699"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:32 -0700
X-CSE-ConnectionGUID: 5CAtnNRNRk+THKeggnq05Q==
X-CSE-MsgGUID: ZT5duF1USTeKVFMJLdVO0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="217020197"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH 12/12] drm/xe: Enable context TLB invalidations for CI
Date: Fri, 31 Oct 2025 18:02:25 -0700
Message-Id: <20251101010225.3095457-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251101010225.3095457-1-matthew.brost@intel.com>
References: <20251101010225.3095457-1-matthew.brost@intel.com>
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

Do not review, CI only.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 9a11066c7d4a..7d643233a6fa 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -95,6 +95,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 	.has_asid = 1, \
 	.has_atomic_enable_pte_bit = 1, \
 	.has_range_tlb_inval = 1, \
+	.has_ctx_tlb_inval = 1, \
 	.has_usm = 1, \
 	.has_64bit_timestamp = 1, \
 	.hw_engine_mask = \
-- 
2.34.1

