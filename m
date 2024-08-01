Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26330C3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 22:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E956C10E0A3;
	Thu,  1 Aug 2024 22:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hVbgGuLi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452C810E0A3
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 22:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722550178; x=1754086178;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I8z32nENetZCBCTubonXcdi+xu/8YX6kB2J3/izdULo=;
 b=hVbgGuLicW7FLUDL3L/5yukh7UrmjQQeyb2dSxr54IaFof3JBXlUykP7
 2B2FnVEHSRNj3hZLxyqopvM72ErnbsMJ7StwsK55YfB5OpQIby6C0xoZB
 xanl5kzprxoHbLyPnK3qmrnNSzxhMzzdbgIlwGWjq4A4NYRp9xetLDP76
 lpcTm5DvwPqd9ELOu6OT95HpIY+Bm7JPFDPXGZ2ZSH+sB5KpsamnxTcHv
 D3Oj8vPWp6CX3YtXnuehOWy7TLCGLC6v/pFoPL1J/u/vDu9rDIM//vZNe
 bj+QObE2q8ylTx8NG5muquQQGG6hgCQIXzsdIdKMtQ4OzhODtgthQgdJh Q==;
X-CSE-ConnectionGUID: nWeusNUwSuC+f6VbQOqBSQ==
X-CSE-MsgGUID: d3cw9h7DQD+F7GpwgamA4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31943317"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="31943317"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 15:09:37 -0700
X-CSE-ConnectionGUID: R9ml5xKISY2eCoG4SDSxbQ==
X-CSE-MsgGUID: E4nlFrgHSJadMVh8eWgu2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="54860457"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 15:09:38 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 0/4] Release GuC v70.29.2 as minimum for Xe (support LNL,
 BMG)
Date: Thu,  1 Aug 2024 15:09:30 -0700
Message-ID: <20240801220934.3048796-1-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.45.2
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

Update driver check for new minimum version.

Reverted patch to use 'intel-ci/' directory for cleaner merge into tree
under 'topic/xe-for-cu', and to keep PVC as unsupported but testing.

Final patch 'PATCH xe-fo-ci' will only be merged into CI branch.

Julia Filipchuk (4):
  Revert "drm/xe/guc: Pre-release GuC firmware v70.24.0 for LNL/BMG/PVC"
  drm/xe/guc: Release GuC v70.29.2 for Xe as minimum required version
  drm/xe/guc: Release GuC v70.29.2 for BMG
  drm/xe/guc: Pick for-ci GuC v70.29.2 for PVC

 drivers/gpu/drm/xe/xe_guc.h   |  3 +++
 drivers/gpu/drm/xe/xe_uc_fw.c | 30 ++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_uc_fw.h |  6 ++++++
 3 files changed, 25 insertions(+), 14 deletions(-)

-- 
2.45.2

