Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5A8E77180
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 16:40:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B3D10E929;
	Tue, 10 Dec 2024 16:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhRSHVKI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930C210E929
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 16:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733848801; x=1765384801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tKaslLnuoq5ReJW4/bhRukChbLoxrOa27R0aThkQM+0=;
 b=ZhRSHVKIVBJ8bzPifyqNEqIS3Ar7w4eL+75+h76NggF8xmoqo74Ce8to
 GuoNNrNt90We+ryoFr7L95eWYiNNkayKWWOHnnxhQctEc7nhA6rHc/lOr
 iYS9hc7stb0UBxKhzhwydq7vkt5qYG5yahQa7PEYTY0tBTDA67t/1uQg/
 MDhzHfHRgbPToYOmzgHOO4WDgg7cthiI3w5Xpecry4Kr6hJlzhlD9Nj2l
 RHzB1qPjyymcy7B/x13z3t5AIp+Iww8tBZ4JVSzfuqfazw1DB2Yw1UN3z
 R0BbfVNV8+D1AS0DWowXk7yCwAzKCKIbAUb/ifNwF7JvFB8n7uNsYWwY7 Q==;
X-CSE-ConnectionGUID: eAnpQZmSQryrsRej8hu1PA==
X-CSE-MsgGUID: n42GkEveRna5fDxyDeE5SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44674073"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="44674073"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 08:40:01 -0800
X-CSE-ConnectionGUID: LrbbY9qBTtSnxX4MXl8hXg==
X-CSE-MsgGUID: T7V0Uj7YTDiB30lgbDLwKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="96276233"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:40:00 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH 1/1] drm/i915/dsc: Expose dsc sink max slice count via debugfs
Date: Tue, 10 Dec 2024 22:12:52 +0530
Message-Id: <20241210164252.2118155-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241210164252.2118155-1-swati2.sharma@intel.com>
References: <20241210164252.2118155-1-swati2.sharma@intel.com>
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

Expose dsc sink max slice count via i915_dsc_fec_support debugfs.
This debugfs entry is required in cases, where sink doesn't support
minimum of 8 slices in case of ultrajoiner and minimum of 4 slices
in case of big joiner.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3387
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 3eb7565cd83c..4823d27cafb5 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -1013,6 +1013,12 @@ static int i915_dsc_fec_support_show(struct seq_file *m, void *data)
 								      DP_DSC_YCbCr444)));
 		seq_printf(m, "DSC_Sink_BPP_Precision: %d\n",
 			   drm_dp_dsc_sink_bpp_incr(connector->dp.dsc_dpcd));
+		if (intel_dp_is_edp(intel_dp))
+			seq_printf(m, "DSC_Sink_Max_Slice_Count: %d\n",
+				   drm_dp_dsc_sink_max_slice_count((connector->dp.dsc_dpcd), true));
+		else
+			seq_printf(m, "DSC_Sink_Max_Slice_Count: %d\n",
+				   drm_dp_dsc_sink_max_slice_count((connector->dp.dsc_dpcd), false));
 		seq_printf(m, "Force_DSC_Enable: %s\n",
 			   str_yes_no(intel_dp->force_dsc_en));
 		if (!intel_dp_is_edp(intel_dp))
-- 
2.25.1

