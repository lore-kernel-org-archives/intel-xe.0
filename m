Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF07C88E6B
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 08:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E28010E3A2;
	Mon, 26 Jan 2026 08:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dJa1vpaG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E0710E39F;
 Mon, 26 Jan 2026 08:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769414435; x=1800950435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J1yRZcBZ39zxOnP4u+JOqe3o8vvahB1l8dPe682vYk8=;
 b=dJa1vpaG0L/ta0CexyMhmuwI9cjP82gCzRCyMzEwPYdjIwCePnpArrq4
 dbaVrjMFknDbdBrNspsOqKoXk1e3D4/yl9ysogxuGDgq/Sgj74/fer4TV
 k0piv94NzNlSCqS72Vr9wlgip4v6xHiAemH0jVRlNsGFbbgohKqYRHVna
 PMvqtSteEmObJEVgBaBvvVgzAV11XDlr27DEQjJcXLiLERuxi6rnUhEk9
 /LQfGxGPn7J+eNNk6EqG812x9vj/2Fqv5kPvBH9egJIPgYVn8+ypeftXT
 GQv9QAtrHjTyAnzlAIiV4EG4yahM48gKCpoxr0tNliRsE5u1ruWjRMU4k w==;
X-CSE-ConnectionGUID: xGIiLG5iTfm+4U5nuURU5A==
X-CSE-MsgGUID: zWXCyNwJR4+VjLgte6nw+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70682840"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; d="scan'208";a="70682840"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 00:00:34 -0800
X-CSE-ConnectionGUID: Y0v+gnTqRSu9EA4jaCH5UQ==
X-CSE-MsgGUID: cCi8YCoTQU6Q1JkEhF2h3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; d="scan'208";a="207867650"
Received: from krybak-mobl1.ger.corp.intel.com (HELO jhogande-mobl3.intel.com)
 ([10.245.246.56])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 00:00:32 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v10 01/10] drm/i915/psr: Add TRANS_PUSH register bit
 definition for PSR
Date: Mon, 26 Jan 2026 09:59:50 +0200
Message-ID: <20260126075959.925413-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126075959.925413-1-jouni.hogander@intel.com>
References: <20260126075959.925413-1-jouni.hogander@intel.com>
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
index 427ada0d3973..9d4d6573a149 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_vrr_regs.h
@@ -165,6 +165,7 @@
 #define TRANS_PUSH(display, trans)		_MMIO_TRANS2((display), (trans), _TRANS_PUSH_A)
 #define   TRANS_PUSH_EN				REG_BIT(31)
 #define   TRANS_PUSH_SEND			REG_BIT(30)
+#define   LNL_TRANS_PUSH_PSR_PR_EN		REG_BIT(16)
 
 #define _TRANS_VRR_VSYNC_A			0x60078
 #define TRANS_VRR_VSYNC(display, trans)		_MMIO_TRANS2((display), (trans), _TRANS_VRR_VSYNC_A)
-- 
2.43.0

