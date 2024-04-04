Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C299DCD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 09:58:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDCD11B027;
	Thu,  4 Apr 2024 09:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i0GeMZEJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEBD10E67A
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 09:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712224682; x=1743760682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Hz3xZkJPp6TtKVP+QXZj+Lgm3MAMykcVHcFrqB2fN0=;
 b=i0GeMZEJJginC6ehg2ygdMfq6cbXeMgJPJqya9/va1n4Z5R25WzyLTNo
 VjQJ7QwLo0z9JYyd6S9ISXmZ27snHQju1W7vIBFhiIobkoIJw+njFE/kN
 USDxcXAiywvhoP4ZHZr4iFmyYsKUUdgTv6hr77V9rsNUpL+tlI1sd0iO1
 7+eq9eOMYnugGoo0ynq72wa2JK1v2xNbz3m3EiVFnZmTRXu8L5IO90cFu
 hCQZjE+6zWl4krwlZ7a4WowAYFNDdUeqrCbvQGFn2ng0eXYtq9o/TDGdA
 Wopem23w24tjiQn9Tj62Oy6bbjyFUaVqhXPmWyuMZAi1kUinPgb/vVYUs w==;
X-CSE-ConnectionGUID: gws35q5qQVypu6gIOZZW6g==
X-CSE-MsgGUID: ZaVmEQf9Qmm6hDNbG0yIBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18227726"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18227726"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 02:58:02 -0700
X-CSE-ConnectionGUID: LiyWYAW8T9CG7hOQKYMM4g==
X-CSE-MsgGUID: HcyuG/EwQNq0B4HG6eUamg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="23422143"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 02:57:57 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v6 1/4] drm/xe: Define XE_REG_IS_VALID
Date: Thu,  4 Apr 2024 15:38:24 +0530
Message-Id: <20240404100827.1109447-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240404100827.1109447-1-karthik.poosa@intel.com>
References: <20240404100827.1109447-1-karthik.poosa@intel.com>
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

Add macro to check if struct xe_reg has valid address.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_reg_defs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index c89ef2b79a3f..42078643be6b 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -131,4 +131,6 @@ struct xe_reg_mcr {
 				 .__reg = XE_REG_INITIALIZER(r_,  ##__VA_ARGS__, .mcr = 1)	\
 				 })
 
+#define XE_REG_IS_VALID(r)	((r.addr) ? true : false)
+
 #endif
-- 
2.25.1

