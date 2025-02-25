Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC13C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 19:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC2410E7C5;
	Tue, 25 Feb 2025 19:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDjz2p9X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AD610E7C5
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 19:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740513576; x=1772049576;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xrV2mwDhskKXp9iBy9Xz6/cwF9/R4E5asixRixueJWs=;
 b=RDjz2p9Xj3At26tTj1st61oYjJDtHIRXAYkNxr6ZGSjf31gFj2M9305C
 kqr874FQOfmUblyjmrS5RAeECz5T9Eq7UfFOvY0wa4iZW/QXsvdGR/wGm
 22cdJYXSxzDFTXzPYlXHaJm0gDRM/NBtwyK+RmPwoDH8ulkoXpEzoz2BN
 61XOiTaGtzsu3jCnofcjiQ+pu8v65qs5lSOSWqMnB/OklRei3tqjIADaA
 Svvk9ZhR5w9X4QW2H5F2hSd8RW1SvXKYEALznnfVodxwVJppKvh8/0n0y
 xq7HrlleXfAbyuEJjI3y9MyBOQuIDPYQ0IreECLh49w4JQV2o6CPRX4M1 A==;
X-CSE-ConnectionGUID: O1Qa06JQRDmbfQbtRE6Byw==
X-CSE-MsgGUID: sjLxlWOZQkmRzavBzW1U4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45252977"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="45252977"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 11:59:34 -0800
X-CSE-ConnectionGUID: 0jGQ4XqAR16kE8wP4HHOvA==
X-CSE-MsgGUID: KdGEnHYYSKW7i8tgLukgIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="147396707"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.239])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 11:59:33 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v2 0/2] Minor improvements to GT stats
Date: Tue, 25 Feb 2025 20:57:32 +0100
Message-ID: <20250225195902.1247100-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

This series is a follow-up of that comment:
https://patchwork.freedesktop.org/patch/635671/?series=144412&rev=2#comment_1162103

v2: Remove patch 1/3 and resend reviewed patches 2/3 and 3/3 for CI

Francois Dugast (2):
  drm/xe/gt_stats: Use atomic64_t for counters
  drm/xe/gt_pagefault: Change vma_pagefault unit to kilobyte

 drivers/gpu/drm/xe/xe_gt_pagefault.c   | 2 +-
 drivers/gpu/drm/xe/xe_gt_stats.c       | 8 ++++----
 drivers/gpu/drm/xe/xe_gt_stats_types.h | 2 +-
 drivers/gpu/drm/xe/xe_gt_types.h       | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.43.0

