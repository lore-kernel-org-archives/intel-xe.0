Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565A0C36014
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 03:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0EA410E113;
	Thu,  3 Apr 2025 03:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlHq+uO/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6837A10E113
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 03:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743652010; x=1775188010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PhNIrkmO+I7WAjze6TfMMXkT+IBuJpbu2yBYsfqvBqQ=;
 b=RlHq+uO/LGmpCWAFY60xTINnnbr0LDk8vv43LXdL+b6j1YbZLbSEojaM
 Kpjeax8Kt2hnOFPFWScsI3B4DzZQAsNs733sngyIv8A4oEaZW6gNUThI8
 PG/Ug6ND9y4MLRnJWCG9bPryJivuiWHmsPIyT8pYSl47tAYpERgJVIX9I
 f9JT4MGKF+dSuLRx+oOlmnwvkbY890zwEbBICW668jAGm92jP133TkFzg
 lHyZjgmSRrHl0vm2QUJiWNr0HmT0FhmLmWvb+E57yHAV67SwBPvT27K0M
 eR5/PdA+ED4qVIjuWpr0BZYKPRpZfgPqSQ+nJjLBqlR3BeYazVK+KL47S w==;
X-CSE-ConnectionGUID: /Mst7s8EQqqg9HZc4YX69Q==
X-CSE-MsgGUID: vX3E0Eo0RK+FvFlQLFb/rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56416698"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="56416698"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 20:46:50 -0700
X-CSE-ConnectionGUID: 6pziotXrQdKS2XgreAdUNQ==
X-CSE-MsgGUID: hvoSizedRn2q0Okg1cNDfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="127797132"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.96])
 by orviesa008.jf.intel.com with ESMTP; 02 Apr 2025 20:46:48 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4] drm/xe: remove unused LE_COS
Date: Thu,  3 Apr 2025 03:46:08 +0000
Message-Id: <20250403034608.332548-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250401205703.4179906-1-shuicheng.lin@intel.com>
References: <20250401205703.4179906-1-shuicheng.lin@intel.com>
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

value is missed for LE_COS.
The value for this field is universally "0" for every MOCS entry on
the old Xe_LP platforms, and the whole field has been removed from
Xe_HP onward. Just delete the line so that we don't have an unused
definition.

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index da1f198ac107..c1590e322ef3 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -62,7 +62,6 @@
 #define   LE_SSE_MASK				REG_GENMASK(18, 17)
 #define   LE_SSE(value)				REG_FIELD_PREP(LE_SSE_MASK, value)
 #define   LE_COS_MASK				REG_GENMASK(16, 15)
-#define   LE_COS(value)				REG_FIELD_PREP(LE_COS_MASK)
 #define   LE_SCF_MASK				REG_BIT(14)
 #define   LE_SCF(value)				REG_FIELD_PREP(LE_SCF_MASK, value)
 #define   LE_PFM_MASK				REG_GENMASK(13, 11)
-- 
2.25.1

