Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E1ACCD193
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A1E10E1BF;
	Tue, 14 Oct 2025 03:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b9N0erTL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96DE10E1A5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412330; x=1791948330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+GlVtwev7+9xv7C6elwryuQ7LuwOqWo/tt1peV0C8GA=;
 b=b9N0erTL4yDPFjvRf586Soq2j2JX4HYv4PXPqsmM1UQIZ7nbM5gVJJ8J
 GIoaC0aOlt1BpoPGWcxEIv7J/WYcK7P9xfGolq29XC+Ip+R1ndMYRhJzf
 JIRbDDju5IAvEZ7wqrQKUBkQ2S3o0eW6SacCKxSKHu/PCe6BT5N/P8Odo
 lUDk6G3DfdZ8ggiCJNHVNdf3qbHFySj0MN4A15JIl/u0CSkGQ6nWc5cjr
 rk3B/sMfn9RN4VrxDlcGlBWjQ2I7/DahtKHkVxKgVIiqlwzMy6EYkotyp
 XG0RDQE4naqEOmqFM4w3eHipsnBZGR1R7d3RMiKr0O9Kw51XWA5Z1Fkap w==;
X-CSE-ConnectionGUID: bS8kPcePSBa2m/hh8GxNCQ==
X-CSE-MsgGUID: HwrXuYSJSLGzkDe4iYJVdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414872"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414872"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
X-CSE-ConnectionGUID: ewkeSA5HTESjfZwQ8PhGdQ==
X-CSE-MsgGUID: PMCpdP2jTLWYvO38zOys2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567286"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 08/23] drm/xe/xe3p: Stop programming RCU_MODE's fixed slice
 mode setting
Date: Mon, 13 Oct 2025 20:24:40 -0700
Message-ID: <20251013-xe3p-v1-8-bfb74f038215@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Matt Roper <matthew.d.roper@intel.com>

Since the hardware load balancing is no longer supported, the
programming in RCU_MODE is no longer necessary.

Bspec: 60382
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 1cf623b4a5bcc..5544d91c21e8e 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -349,6 +349,13 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
 						 const struct xe_hw_engine *hwe)
 {
+	/*
+	 * Xe3p no longer supports load balance mode, so "fixed cslice" mode
+	 * is automatic and no RCU_MODE programming is required.
+	 */
+	if (GRAPHICS_VER(gt_to_xe(gt)) >= 35)
+		return false;
+
 	return xe_gt_ccs_mode_enabled(gt) &&
 	       xe_rtp_match_first_render_or_compute(gt, hwe);
 }

-- 
2.51.0

