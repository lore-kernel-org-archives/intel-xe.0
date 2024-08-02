Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A570BC52D6D
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 22:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DDE10E1F7;
	Fri,  2 Aug 2024 22:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hIQCSx3t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E19510E08C
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Aug 2024 22:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722637293; x=1754173293;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+4nmA/aR8Lo8w1jlSaSU0k8bi9BMHHRtj8e3Zib+vi4=;
 b=hIQCSx3tefj5qgCas5xHekUfudt++Uv97en3NIQF6NWBe2DMghQbAJ90
 50ezR5oHBGlOSM2E6pcpXdL7M50iY+ut8egovygmgsHA5hm/R92DUQQFi
 oThZByYpNa84ZxAsKBtWScJU1xZJcN/wTCZqa4DyihmuTGwF4RAtHHjh3
 YTqbZHxEjl1avS/9WfjZCR/4faEc9aVMRMhE/wuV57c8yWQ7d9fgM0iGe
 AiwykllKNi2QgGKCv3jLdiCy7eCgJsY+sWnw8V4wphNbHjRLZzPlWprCJ
 ddoyO/8LOmEWqgOWiZBRJVBgQP/j4YGyeYJJe14dVBA5Ti16a4j37iaux Q==;
X-CSE-ConnectionGUID: 9u4Z+p2RRe2rNajNCOptvg==
X-CSE-MsgGUID: FEdksy9WQnCwEBKIhyex4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20808502"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; d="scan'208";a="20808502"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 15:21:31 -0700
X-CSE-ConnectionGUID: Hm2hB6MDRv+Vq9OUibfIIA==
X-CSE-MsgGUID: rJ82tNnjQl6zEEGSz0UbEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; d="scan'208";a="60385234"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa005.jf.intel.com with ESMTP; 02 Aug 2024 15:21:30 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v4 0/4] Update to GuC v70.29.2 as minimum for Xe (support LNL,
 BMG)
Date: Fri,  2 Aug 2024 15:21:25 -0700
Message-ID: <20240802222129.3976212-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.45.2
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

Update driver check for new minimum version.

Reverted patch to use 'intel-ci/' directory for cleaner merge into tree
under 'topic/xe-for-ci', and to keep PVC as unsupported but testing.

Final patch 'PATCH xe-fo-ci' will only be merged into CI branch.

v2: Update fw_def for all supported platforms.
    Split BMG into separage commit.
v3: Replace revert direct changes end explanation.
v4: Tweak commit messages and make numeric version checks GuC only -
review feedback from Daniele (done by JohnH).

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


Julia Filipchuk (4):
  Revert "drm/xe/guc: Pre-release GuC firmware v70.24.0 for LNL/BMG/PVC"
  drm/xe/guc: Bump minimum required GuC version to v70.29.2
  drm/xe/guc: Define GuC version v70.29.2 for BMG
  drm/xe/guc: Pre-release GuC firmware v70.29.2 for PVC

 drivers/gpu/drm/xe/xe_guc.h   | 10 ++++++++++
 drivers/gpu/drm/xe/xe_uc_fw.c | 31 ++++++++++++++++---------------
 2 files changed, 26 insertions(+), 15 deletions(-)

-- 
2.45.2

