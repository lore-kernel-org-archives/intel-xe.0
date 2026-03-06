Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E35FCC04A
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 17:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A443D10EDCB;
	Fri,  6 Mar 2026 17:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GxZhJMEp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D548610E3EF;
 Fri,  6 Mar 2026 17:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772817539; x=1804353539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7d8ZsppGrUYbiMTl1HbrFV4tmhaJ1EWMYXz0WpUC3Ps=;
 b=GxZhJMEpoavbWqH2qwXxbsBr9/AV99F85ugVACKZHp0nWBrVs2Tx23Pm
 A2KbIAVgZgSeEcXQnPB63dOKV+SGDbfR8P6osHX2hnwblOkZS0vYdkrP1
 lTwnxOC8k7zwavaSU1hGeSq6v1Jhch50aMOcT5WRvIf8mqDv7UGxDZwfg
 FGQMy4Fe0Vy7JjjeagGBCGgS6tQ2oh/AS+l3SxyrrCusa+3DrhOdiYuoG
 lJXqDRP9oSa482Su8ne1827mrH+XJ9rXOWRcKu19A2zl+wSKvExEZuJpH
 stLxV4P6utOLFb0euGAEsufq+9PY3ycrzrAsphx+xxv2h789nSik+K2N8 Q==;
X-CSE-ConnectionGUID: oy6c0jwvRbO5a8giWfG2xQ==
X-CSE-MsgGUID: K8m2h33NSb6l8g+dojiNUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77530848"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="77530848"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 09:18:58 -0800
X-CSE-ConnectionGUID: Qb16sJnCSnilhro0Ahw4lg==
X-CSE-MsgGUID: APgppG4uRQOhPL6dslL4rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="216175186"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2026 09:18:54 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: harry.wentland@amd.com, louis.chauvet@bootlin.com, mwen@igalia.com,
 contact@emersion.fr, alex.hung@amd.com, daniels@collabora.com,
 uma.shankar@intel.com, maarten.lankhorst@intel.com,
 pekka.paalanen@collabora.com, pranay.samala@intel.com,
 swati2.sharma@intel.com, stable@vger.kernel.org
Subject: [PATCH 05/10] drm/i915/color: Fix HDR pre-CSC LUT programming loop
Date: Fri,  6 Mar 2026 22:23:02 +0530
Message-Id: <20260306165307.3233194-6-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260306165307.3233194-1-chaitanya.kumar.borah@intel.com>
References: <20260306165307.3233194-1-chaitanya.kumar.borah@intel.com>
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

From: Pranay Samala <pranay.samala@intel.com>

The integer lut programming loop never executes completely due to
incorrect condition (i++ > 130).

Fix to properly program 129th+ entries for values > 1.0.

Cc: <stable@vger.kernel.org> #v6.19
Fixes: 82caa1c8813f ("drm/i915/color: Program Pre-CSC registers")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index e7950655434b..6d1cffc6d2be 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3976,7 +3976,7 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 				intel_de_write_dsb(display, dsb,
 						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
 						   (1 << 24));
-			} while (i++ > 130);
+			} while (i++ < 130);
 		} else {
 			for (i = 0; i < lut_size; i++) {
 				u32 v = (i * ((1 << 24) - 1)) / (lut_size - 1);
-- 
2.25.1

