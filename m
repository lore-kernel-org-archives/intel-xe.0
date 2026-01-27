Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF60D2FED2
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 19:37:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512C210E5B3;
	Tue, 27 Jan 2026 19:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GyF7+P3i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0841310E5B3
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 19:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769542657; x=1801078657;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TgvbMyL6dVajDcvocR7y9cZu0Tio7NObDQWqza9wkWE=;
 b=GyF7+P3itGtwhSsLHc8aEDDVmC0Joua8RzJ+Wqj+G5lt75XQWY1aGW1t
 Huamdgn13NbzxqCVuw8KLexkn44VWEqo+bnw8nOI4J92ssJcHGWfDCOjs
 notNlHfwOn7+7DQp+tFBSW48ULQv99mGzWbO/Odt71XSGI6R9NuFVVKq1
 NwYXRaDG30iPDRamgx9mMQnLM7ZWHI5Rff/FyMgh/kFGUh4GfOH0ltC4U
 iRBBgSs7v3n/AUHD1NJsAeLc7QN/Q3/1ggK2+lau5nq/f3MwbhQt2Amp8
 xocAVt3bGIb3GllVA1PdYtnlzVdUc6cgHOzhRz3oP0eAltYSjgYwJrXnh A==;
X-CSE-ConnectionGUID: KfgqksYsQkGoMzHNpsIzrw==
X-CSE-MsgGUID: vl/B4ZSgTyOUdBY+sSR9ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="69764777"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="69764777"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:37:36 -0800
X-CSE-ConnectionGUID: Hwy7184GSyuZRh/95/UG2A==
X-CSE-MsgGUID: tPAABzAoTQ2q4WXDnBJtvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="207958936"
Received: from mahadzix-mobl.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:37:35 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 0/6] drm/xe/guc: Make MMIO communication more robust
Date: Tue, 27 Jan 2026 20:37:20 +0100
Message-ID: <20260127193727.601-1-michal.wajdeczko@intel.com>
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

v1: https://patchwork.freedesktop.org/series/160377/#rev1
v2: follow sleep algorithm from wq_wait_for_space (Matt)
    update sleep algorithm in GuC CT (Matt)
    promote exponential sleep algorithm to helper (Michal)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Michal Wajdeczko (6):
  drm/xe: Promote relaxed_ms_sleep
  drm/xe: Move exponential sleep logic to helper
  drm/xe/guc: Limit sleep while waiting for H2G credits
  drm/xe/guc: Drop redundant register read
  drm/xe/guc: Wait before retrying sending H2G
  drm/xe/guc: Allow second H2G retry on FLR

 drivers/gpu/drm/xe/xe_guc.c        | 25 +++++++++----
 drivers/gpu/drm/xe/xe_guc_ct.c     | 12 ++++---
 drivers/gpu/drm/xe/xe_guc_submit.c | 28 ++-------------
 drivers/gpu/drm/xe/xe_sleep.h      | 57 ++++++++++++++++++++++++++++++
 4 files changed, 85 insertions(+), 37 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sleep.h

-- 
2.47.1

