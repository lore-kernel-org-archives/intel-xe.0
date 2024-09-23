Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456A1CF9C72
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 18:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BA510E465;
	Mon, 23 Sep 2024 18:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PiGqcje3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3883810E458;
 Mon, 23 Sep 2024 18:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727115130; x=1758651130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VCzN22J9VeeG5w1Lr/JYSKbj5GYkFxRNDVUXh7n/i2I=;
 b=PiGqcje3VUphuEhpM9+ufa+F0s6wCsiP4DX53OGLZnMV4P69RY9+hnkw
 s/CYOcjnQbeJgPdrtbDiB/HJUB7cAA0N85MJUfGbu12bdBf7katitaq5W
 B1GNu5olRy6l6q9MXi81Cnyv9Cjzc7qHn8+DN+nj+1xIRz4V1TLCxILzV
 pi2B66G36xND6i+9rXJDNRAK7zIRfxIkf0NFumHp/UHjuYebv96Ve+LHA
 Wp/Y58xKrST2fdtFwq2cVM8699ntVbYY0N/ZjzM4VvLJGMmaX8DEBCQWj
 x/q2llNIVnqUMh16whVTKcra1IQpTSZS/2n0icvT0KT7PPJXxl9G2Oj3o g==;
X-CSE-ConnectionGUID: Fumltr92Sdq/NtlFpQJ9ig==
X-CSE-MsgGUID: aKhhjBOETuSbiwQAFJwO+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29866301"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="29866301"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 11:12:08 -0700
X-CSE-ConnectionGUID: GgU8Qdo+Q+2QVxkIq+z7ow==
X-CSE-MsgGUID: ctLQrRxxSyeE5sSjZyCWPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="70734441"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 11:12:06 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, suraj.kandpal@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH 13/16] drm/i915/dp: Modify helper to get slice count for
 ultrajoiner
Date: Mon, 23 Sep 2024 23:43:33 +0530
Message-ID: <20240923181336.3303940-14-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240923181336.3303940-1-ankit.k.nautiyal@intel.com>
References: <20240923181336.3303940-1-ankit.k.nautiyal@intel.com>
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

From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

ultrajoiner needs 2 bigjoiners to be enabled, so modify the helper
intel_dp_dsc_get_slice_count for ultrajoiner.

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index a853f975bda1..115d8468bb91 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -996,8 +996,11 @@ u8 intel_dp_dsc_get_slice_count(const struct intel_connector *connector,
 		    drm_dp_dsc_sink_max_slice_count(connector->dp.dsc_dpcd, false))
 			break;
 
-		/* big joiner needs small joiner to be enabled */
-		if (num_joined_pipes == 2 && test_slice_count < 4)
+		/*
+		 * big joiner needs small joiner to be enabled,
+		 * and ultrajoiner needs 2 bigjoiners to be enabled
+		 */
+		if (num_joined_pipes > 1 && test_slice_count < num_joined_pipes * 2)
 			continue;
 
 		if (min_slice_count <= test_slice_count)
-- 
2.45.2

