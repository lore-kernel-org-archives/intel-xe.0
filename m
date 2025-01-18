Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906A5C02183
	for <intel-xe@archiver.kernel.org>; Sat, 18 Jan 2025 00:54:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B65F10E352;
	Sat, 18 Jan 2025 00:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Huz0dThJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0247F10E352
 for <Intel-Xe@lists.freedesktop.org>; Sat, 18 Jan 2025 00:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737161645; x=1768697645;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L7CIQH3KNjmpxUE5abYIv9NlE0h7I9FsrMp7GFDXTv0=;
 b=Huz0dThJyH675YqxIheuWJCND03HXPE9SeBuCPg94Ss0YHTkEM/EO6EH
 AQPmvZlZ5ezdYqlNZBIMDYINgfNWIOnncNVBmX3JmJ36Ork5jHxax7ecx
 fEPnaLeJIK9DCj9PQIqUXz4iBiQYzW/iWU9r8SPre/1ZHkc8r8x7lC0Z6
 QSf4bonweu7alioJNoYsehw9qlBKhVicgzbYzlF7Azmp25kX6/TR3l+Si
 SdttUS7A4PW6o4CJY7s8aqgjgx4AUFTNZv25ibNS8MS7MStU8onLzY8rd
 4ROh7sLvq0U2PDIEXV0zLdeELrvpuI+Y+Qhg0freSkCD8yXt8CsTImSKY g==;
X-CSE-ConnectionGUID: fZzeZcCRRrmbConiW2WZhw==
X-CSE-MsgGUID: TGP8euhhSxmzG7fYO8KKzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37490110"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="37490110"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 16:54:05 -0800
X-CSE-ConnectionGUID: Ws6fo0bPTFeEp4hNcYNm3Q==
X-CSE-MsgGUID: wIwv2oIBTquyGrkzr4+AsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="105806813"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2025 16:54:04 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe: Upgrade complaint about missing slice info
Date: Fri, 17 Jan 2025 16:54:03 -0800
Message-ID: <20250118005403.2960807-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

The steering code needs to know slice/subslice counts and this
information should be retrieved from the hwconfig table. However,
earlier platforms don't have it, hence the KMD has a fallback path.
Newer platforms really should have the entries and if they are missing
that is a bug that needs to be fixed in the table.

So update the complaint to be an error on newer platforms and remove
it completely for older ones that we know are bad (but are not POR for
the Xe driver anyway). Also, re-word the message a little to make it
clearer what the issue is.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index a1676b787fdc..605aad3554e7 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -341,7 +341,13 @@ static unsigned int dss_per_group(struct xe_gt *gt)
 	return DIV_ROUND_UP(max_subslices, max_slices);
 
 fallback:
-	xe_gt_dbg(gt, "GuC hwconfig cannot provide dss/slice; using typical fallback values\n");
+	/*
+	 * Some older platforms don't have tables or don't have complete tables.
+	 * Newer platforms should always have the required info.
+	 */
+	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000)
+		xe_gt_err(gt, "Slice/Subslice counts missing from hwconfig table; using typical fallback values\n");
+
 	if (gt_to_xe(gt)->info.platform == XE_PVC)
 		return 8;
 	else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
-- 
2.47.0

