Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0843CD318A0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE9A10E5B2;
	Tue, 13 Jan 2026 23:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ncxvhiou";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2711E10E567
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345421; x=1799881421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e3xhevBDYgMwlqEpRi3mPtIYyvKDIckb2A5BSlZom5M=;
 b=NcxvhiouV+uBsoZJ3AE/Ve2I+w+LLmo+Tc9pfISEupzWEihlSiW0hhVJ
 mpdqVYwevhYtRpnqy3OwW9ObkNOR/O4InX0fRfGwYEHTXi//p+Ld3uLY3
 VaiWtqzgoBUeMp3Jkgcwn+HgyQ5ravlkZgGfTMBb7Rr3E8s22kz9Li8PG
 tJXoQ+WZ1A91DUkqsZw4VKBc05Qi3dGiCLJVliNhPcSYZzXH8k3IKIuU2
 fyWtPoRHr+oSdhEzMh93jOptfJQoRzzZpeerB/JWQZRnk9lanMI6aNpK9
 KEEtyuq2dnNc5+WYgcBDcYBNWeHwXZoBNm4QQ7XB6mwdTj/JxHfCZ74ZA w==;
X-CSE-ConnectionGUID: RqrhBrKURpG1mAbRQqd8lQ==
X-CSE-MsgGUID: 0hZtBA0lQ8iCU+fCZDlaTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311127"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311127"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
X-CSE-ConnectionGUID: XdFzUqVZTFusoaOHUrfBgw==
X-CSE-MsgGUID: NePF1w18TYyQsTxoXJEOQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147352"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 22/79] drm/xe: Drop unused header in xe_gt_sriov_vf.c
Date: Tue, 13 Jan 2026 15:03:27 -0800
Message-ID: <20260113230315.3081153-103-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113230315.3081153-81-matthew.d.roper@intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
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

xe_gt_sriov_vf.c doesn't use anything from xe_gtt_defs.h.  Drop the
unnecessary include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index d91c65dc3496..30e8c2cf5f09 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -15,7 +15,6 @@
 #include "abi/guc_klvs_abi.h"
 #include "abi/guc_relay_actions_abi.h"
 #include "regs/xe_gt_regs.h"
-#include "regs/xe_gtt_defs.h"
 
 #include "xe_assert.h"
 #include "xe_device.h"
-- 
2.52.0

