Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E7DD78773
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 13:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1CE10EF8F;
	Fri, 19 Dec 2025 13:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hLSSfWoF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E2410EF8C;
 Fri, 19 Dec 2025 13:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766149561; x=1797685561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jZSkKAsCHAYvcxMb9IwZdhmSg4Y1RQopAykb5XbKlbM=;
 b=hLSSfWoF9OZoysJVB1HtSKtPBjSSG2sO+9cshR9tbfFNeRhOKDOiapMy
 2Jiwgb+FDImNxj6MoqgB/TeO3gfa4G35J81NusQU+NhkzYK3lr2PPTV7K
 WE5uh7YRiOOH+vdowWAKH5aJEkh8fChtFJuLlEmGtHgwbqXSmuhc5mp2G
 ff67qf/6g92AtWUmLCmBCJlgcX9mfZrr0yQUjWyIPkkyTkNhiwsmV4O+X
 on6Ns3Pxwra9jBdXD95CWFdKHfx+Pu5eLAH3KVjP9QWJrsEqBXQ45VPJM
 ompkWQLMzwmwLZUr7TXCwSpUbGHfwND2uU2qhOzbnyRfIgEukbnq6kLhS A==;
X-CSE-ConnectionGUID: EnENWdadRaGncGRrrRNj9g==
X-CSE-MsgGUID: gDeyLzrRSCG4K2jVWgtnjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68086563"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="68086563"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 05:06:00 -0800
X-CSE-ConnectionGUID: 6xdhnILzQM6kOuSdxBgyiA==
X-CSE-MsgGUID: smfsvLE4Q6qqEvf6k61/Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="199337687"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.49])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 05:05:58 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v8 1/7] drm/i915/psr: Add TRANS_PUSH register bit definition
 for PSR
Date: Fri, 19 Dec 2025 15:05:31 +0200
Message-ID: <20251219130537.3024373-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219130537.3024373-1-jouni.hogander@intel.com>
References: <20251219130537.3024373-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Add TRANS_PUSH register bit LNL_TRANS_PUSH_PSR_PR_EN definition for PSR
usage.

v2: add bspec reference

Bspec: 69984
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr_regs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr_regs.h b/drivers/gpu/drm/i915/display/intel_vrr_regs.h
index ba9b9215dc11..a67b2eb125ce 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_vrr_regs.h
@@ -97,6 +97,7 @@
 #define TRANS_PUSH(display, trans)		_MMIO_TRANS2((display), (trans), _TRANS_PUSH_A)
 #define   TRANS_PUSH_EN				REG_BIT(31)
 #define   TRANS_PUSH_SEND			REG_BIT(30)
+#define   LNL_TRANS_PUSH_PSR_PR_EN		REG_BIT(16)
 
 #define _TRANS_VRR_VSYNC_A			0x60078
 #define TRANS_VRR_VSYNC(display, trans)		_MMIO_TRANS2((display), (trans), _TRANS_VRR_VSYNC_A)
-- 
2.43.0

