Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2361BFB5166
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 21:18:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC63510E2DA;
	Mon,  6 Apr 2026 21:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZ3Uw5mo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8388D10E2D8
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 21:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775510308; x=1807046308;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iAyh/aLC6HOIUrlVa3qWxAwZnd93xCnhMoJDKtem4Xc=;
 b=YZ3Uw5mozdlbiqVT2gaqw7TAetqXG/q54rv3ikV0+wc0dVl9/ZdRWAYT
 /7m0adTDDoMoGXo9yNMA1DQZU0hrDm2Y9IdSIPF2d7gA5eMI6MvOXsb0Z
 Ll1m6TMLOpGp4lqqonRfzK768mxzos/nGImQ0VrA1rgrGPv3rS9cowqes
 k7NgR4it/HCr+iQ0ho6oVB7oWTIYT9iYKAqov6B7yF0dFDX/Msboh6kFb
 Xyfl7wJjwmaX4hMdY1EMGLuy8kSP4oFHxcVnvYNCLPTBuyi2Wg2o+zcLa
 ByIlNt38QCXwDl9qWT86J4vzfHeHLA3kTHWjWUqP6bfNNDpLnInKp6AFq g==;
X-CSE-ConnectionGUID: TWY34AZBQEGkrxAQgXV00A==
X-CSE-MsgGUID: LcP9pw9mQZmve0QuAT36mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76653340"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="76653340"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 14:18:28 -0700
X-CSE-ConnectionGUID: dq7c+qwuRomcaSRiJ4+ZRA==
X-CSE-MsgGUID: MPRMkEJWQLOHkzNxggeLiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="227888175"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 14:18:27 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 0/7] drm/xe/guc: Recommend GuC v70.60.0 for LNL, BMG, PTL
Date: Mon,  6 Apr 2026 14:17:24 -0700
Message-ID: <20260406211759.817577-9-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
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

Recommend newer GuC firmware for LNL, BMG, PTL. UAPI version: 1.31.0

Update NVL-S, CRI to used matching GuC version v70.60.0 (Only applies
to xe-for-ci topic branch).

Platforms NVL-S, CRI, NVL-P are not merged to upstream at present. The
GuC definitions for those only exist in the for-ci topic branches
drm-xe:topic/xe-for-ci and drm-intel:topic/core-for-ci. This patch set
reverts those patches, updates the recommended GuC versions for fully
upstream platforms, then re-adds the CI only platforms definitions.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

v2: Added RB for main patch. (Daniele)
    Update xe-for-ci platforms NVL-S, CRI to use v60 as well.

Julia INTEL (7):
  Revert "drm/xe/nvlp: Define GuC firmware for NVL-P"
  Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
  Revert "drm/xe/nvls: Define GuC firmware for NVL-S"
  drm/xe/guc: Recommend GuC v70.60.0 for BMG, LNL, PTL
  Reapply "drm/xe/nvls: Define GuC firmware for NVL-S"
  Reapply "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
  Reapply "drm/xe/nvlp: Define GuC firmware for NVL-P"

 drivers/gpu/drm/xe/xe_uc_fw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.51.0

