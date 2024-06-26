Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3D1C30658
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 16:55:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F9B10E968;
	Wed, 26 Jun 2024 16:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nCbiyUJr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCF910E964
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 16:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719420950; x=1750956950;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HGDtOVZbCDFtbBPbGHbwv4oouhWTUEBcj/ccu+FMBcU=;
 b=nCbiyUJrfUdLP/S++6/GnHetCtlEJ9vgTdeNKQuafG+M8zkpIQzzSM58
 WWqT+ttzC8P/1hyFskg3LR51TaPCl7Rd1R+gFIOUs62sn1xZDC+yLHziN
 32ODdkev5ZtIjHvsYGYBiNd2Iawr2UOI88MJqAGxFVBoRMOHgjSXYSMcP
 1Owq/h6nwt5abh4d1BZePVCdO6MKnAVvMx4Tjym5mLbSCrNVs7Yj5Tgk8
 FVkvl0j3DB3+R1J5AWB1Aij87fQG/YsAD5QYH45dZeykT8x517hOjeKs3
 E9LUabaZI46RHu4TFvwLo7bumCLDSb3KnW6vppxtSULAWZxIPPGhYkSp4 A==;
X-CSE-ConnectionGUID: /jUJ7SjTT4qZcl1D/htz3g==
X-CSE-MsgGUID: bFrCGLtkS8WdpW3FeRLmdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="33962067"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="33962067"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 09:55:22 -0700
X-CSE-ConnectionGUID: pnYwbzsgSmyD2F0ZAkexfg==
X-CSE-MsgGUID: I1Uidru9TPeeoyd7GR5L8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="43959322"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 09:55:20 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 0/1] drm/xe/hwmon: Remove xe_hwmon_process_reg
Date: Wed, 26 Jun 2024 22:37:45 +0530
Message-Id: <20240626170746.2926011-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

 Removing xe_hwmon_process_reg as per review comments from Lucas in
https://patchwork.freedesktop.org/patch/587830/?series=131765&rev=7.

It was reviewed as an umbrella function which can be avoided.

v2:
 - Rebase.
 - Improve commit message of patch and cover letter. (Badal)

v3:
 - Rebase.
 - Add couple of comments. (Lucas)

Karthik Poosa (1):
  drm/xe/hwmon: Remove xe_hwmon_process_reg

 drivers/gpu/drm/xe/xe_hwmon.c | 89 ++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 49 deletions(-)

-- 
2.25.1

