Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C519C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 05:46:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C4C10E69A;
	Thu,  1 Aug 2024 05:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NvEcYqq1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F6B10E69A
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 05:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722491184; x=1754027184;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PN3kJxdNr34wWnOmKPJvSrM3OqOmRwx7pO5B7bK1KxY=;
 b=NvEcYqq1i9hrejZHkHujIJ+fowspypaqgMyj75y8Tw5688dXKnxjnmZ1
 grhfydM/pHgxr6+fiYK/7oih4RWr2ezgD2A8EuLwZlWxOVonnZ1F+ePwJ
 ANjp5oSJc+kUV+aNKmLY2X0SVrtjqmCAZPJC1PqTpuSbZ/MldbJ0qoPgU
 sElCe8kgiaBRd5+maCKD3cBFczWKBUyue2ADX2OO4pceH6iyGd38Pqt1o
 ouR94uiRq/0Blnu1ST2t+VjGf4vqoqQ5PUAin54u96h3jFf4J107vMNSY
 Nd/ko/nTntMDSRvEn/ka4/aFbp275aS7dxTtuPUqEHSIBXWrb9iiLbIng w==;
X-CSE-ConnectionGUID: fGsd3GlzRP6KPjClk8fG6g==
X-CSE-MsgGUID: mWbGlHs2TyuRt2zE5LQxcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="23337213"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="23337213"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 22:46:24 -0700
X-CSE-ConnectionGUID: z5ICrCd/T2OsUYYGXJWTpA==
X-CSE-MsgGUID: Tu3xnxMoRIuXjfhbtHnFfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="54881416"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 22:46:21 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, karthik.poosa@intel.com
Subject: [PATCH v5 0/2] drm/xe: remove GuC reload in D3Hot path
Date: Thu,  1 Aug 2024 11:29:39 +0530
Message-Id: <20240801055941.1187878-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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

Power is not lost when only D3hot is allowed so remove GuC reload in
runtime suspend D3Hot path.

Rev2: Rebase
Rev3: fix review comments
Rev4: fix commit message and kernel-doc
      split patches
Rev5: add runtime suspend and resume pair in CT layer
      fix review comments

Riana Tauro (2):
  drm/xe: modify GuC CTB enable communication
  drm/xe: remove GuC reload in D3Hot path

 drivers/gpu/drm/xe/xe_gt.c     | 33 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt.h     |  4 +--
 drivers/gpu/drm/xe/xe_guc.c    | 49 +++++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc.h    |  4 ++-
 drivers/gpu/drm/xe/xe_guc_ct.c | 31 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h |  3 +++
 drivers/gpu/drm/xe/xe_pm.c     |  8 +++---
 drivers/gpu/drm/xe/xe_uc.c     | 32 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_uc.h     |  2 ++
 9 files changed, 149 insertions(+), 17 deletions(-)

-- 
2.40.0

