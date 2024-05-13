Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086A1C25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 08:42:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F9989E2A;
	Mon, 13 May 2024 08:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQSCJOtU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EED610E525
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 08:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715589751; x=1747125751;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cor83xpvgTWILi/7Ns3GKlKDGalLz1T9m8cw9uOiwFQ=;
 b=RQSCJOtUunxAhYdViRaudZDyWa0stEEtmAT/vsVBT70JIALDXMJzHyV7
 WSJzySnHz9hZEQCkgKqJc+WwI+U/hPtvxlxBQyN51q9B+bBTdJgfiu0Rc
 iUbkJJz/E5buHmsqPxujsaFUIeeRJdZCRLKB5WkR13A4xttZbW+i8+nwX
 iSeqYgfX3MCHk7duhjKj6h5/HXOHXFieeit9k2b2RUT9SRKn0QNZO1mPQ
 eff15CznSdbVTrch4x7kTlCi+AKldslUSbbPqU5265hYV0KlbtzPA6emP
 GPLrEh+icj1hSQlRi/sNfo0JG91edmWUsrrDus+O+i4NgII9Fn/niitJY Q==;
X-CSE-ConnectionGUID: e5svAhR1QBaKKFD2Tvx+mQ==
X-CSE-MsgGUID: EotARXDVSyWgysnEdCo7JQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11452639"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="11452639"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:42:31 -0700
X-CSE-ConnectionGUID: Nc3zNNL8Seubf/p4yzFbgg==
X-CSE-MsgGUID: GP4FQV0kRSWiDUqcKBb9MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30306529"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:42:30 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/4] drm/xe: Fix xe_reg_sr.h
Date: Mon, 13 May 2024 10:42:18 +0200
Message-Id: <20240513084218.2084-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240513084218.2084-1-michal.wajdeczko@intel.com>
References: <20240513084218.2084-1-michal.wajdeczko@intel.com>
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

Prefer forward declarations over #include xe_reg_sr_types.h

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
index e3197c33afe2..51fbba423e27 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.h
+++ b/drivers/gpu/drm/xe/xe_reg_sr.h
@@ -6,8 +6,6 @@
 #ifndef _XE_REG_SR_
 #define _XE_REG_SR_
 
-#include "xe_reg_sr_types.h"
-
 /*
  * Reg save/restore bookkeeping
  */
@@ -15,6 +13,8 @@
 struct xe_device;
 struct xe_gt;
 struct xe_hw_engine;
+struct xe_reg_sr;
+struct xe_reg_sr_entry;
 struct drm_printer;
 
 int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe);
-- 
2.43.0

