Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516E3CDD55C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 22:10:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F0410E659;
	Wed, 18 Sep 2024 22:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nn//8MAB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BC110E659
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 22:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726697420; x=1758233420;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oyff3PRPL5X+G+S0Qt+IBmcJA+mJGiAs+Eyqhpzj2Kw=;
 b=Nn//8MABatRb8c7ooXSvPqP+VS9BC+J2q6ZVtq0km9tZmHsu2Pt2igvQ
 XYaipAZLsKBSIZuKxLcgLtRNc57k6DkmMO52uSAuzGTG0Cj0D8fqD6/Dg
 /kOTQEs3n15X6iNdrdcA26xUobO4W5bj+ikkYyQHhFuMq7DWQQE48kD2f
 Yjwj89S/5G/hKBmw+Arlgq+Dj63oQUiAHRVqWpIP7hcuasinC7HG6mgpN
 GNBJ6tgtbbgufgo9RDQNDU53GGZsY4DtDAnue7FmqO1O25FdRT7J78sXg
 BYkShpMIZPuX53nyRqqSJw/0z20ZprhSXfZiHd5NswJ/77QKmtv8x0Rcu A==;
X-CSE-ConnectionGUID: SMXCP1NPTKus3VoT0mH2jA==
X-CSE-MsgGUID: 0ZGcAIKKQKyeFwG2mZF/lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="48164383"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="48164383"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 15:10:04 -0700
X-CSE-ConnectionGUID: ocKkCi3YTySlzl4QU/OlBw==
X-CSE-MsgGUID: 03lKy5K0REe1FTq3eXaa2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="69963012"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa010.fm.intel.com with ESMTP; 18 Sep 2024 15:10:03 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 0/1] drm/xe: Add null pointer check for xe_migrate_copy
Date: Wed, 18 Sep 2024 15:09:59 -0700
Message-Id: <20240918221000.1124248-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add null pointer check for parameter src.
Update lack source flag to include resource is null case in xe_bo_move
before xe_migrate_copy called.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

Zhanjun Dong (1):
  drm/xe: Add null pointer check for xe_migrate_copy

 drivers/gpu/drm/xe/xe_bo.c      |  4 ++--
 drivers/gpu/drm/xe/xe_migrate.c | 24 ++++++++++++++++--------
 2 files changed, 18 insertions(+), 10 deletions(-)

-- 
2.34.1

