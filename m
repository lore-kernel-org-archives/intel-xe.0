Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13642C54E68
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 21:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75B910E32D;
	Thu, 14 Mar 2024 21:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJoi/7Gk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB5010E32D
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 21:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710450460; x=1741986460;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2ME1fVv0atNYwwIGa4AHtoFG4gH9f8lQIGwWnKyevGc=;
 b=EJoi/7Gk/0MW0Th7gTGOBeShjTuiAgXdRxHKAjFPL+Ivg0JAfo7YJ4Bv
 Mw0heh6aTi8/Q+vfRTJlL3FcNFxTh2wl8iEwTlFXl5T2gtreJRxvFQZsd
 UlxZK8/NLAzmvmRuSZL6DRG31zxaCiomt68YUah24Foq8/2lzFT0eXCCS
 2tpxeBqfH2HLk907xKn0xgY+gq6ZuRaN3xfyfz0dmrIjzdL65kFQxMZUF
 ChHRrC3unFd5TuVDD939l3qDqXH7VGUwDDhSIsqgg20jlDI+wbegv4/9U
 5N5cTr213U8I4pJqv+BcPyWY71U5h75IdxGz3FSfHa5qk+W+VT/Baw6zB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="27770149"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="27770149"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 14:07:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12510331"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa006.fm.intel.com with ESMTP; 14 Mar 2024 14:07:37 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>, Wajdeczko@freedesktop.org,
	Michal <Michal.Wajdeczko@intel.com>,
	Alan Previn <alan.previn.teres.alexis@intel.com>,
	Matt Roper <matthew.d.roper@intel.com>,
	Stuart Summers <stuart.summers@intel.com>,
	Jose Souza <jose.souza@intel.com>,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v12 0/1] drm/xe: Add helper macro to loop each DSS
Date: Thu, 14 Mar 2024 14:07:34 -0700
Message-Id: <20240314210735.258553-1-zhanjun.dong@intel.com>
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

Add helper macro to loop each DSS. This is a precursor patch to allow
for easier iteration through MCR registers and other per-DSS uses.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Suggested-by: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Jose Souza <jose.souza@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Changes from prior revs:
v12:Move for_each_dss to xe_gt_topology.h
v11:Optimized for_each_dss_steering macro and removed xe_gt_topology_get_next_dss.
v10:Change macro pointer type for uint to u16.
    Fix macro parameter typo. Updated function kerneldoc text. 
v9: Updated function kerneldoc text.
v8: Chang range check to assertion. Add function kerneldoc
v7: Updated commit message
v6: Optimized for_each_dss_steering macro
v5: Reduced 2 checkpatch warnings
v4: Revert function name with mcr back
v3: Rename functions with mcr removed
v2: Resend with cover letter

Zhanjun Dong (1):
  drm/xe: Add helper macro to loop each DSS

 drivers/gpu/drm/xe/xe_gt_mcr.c      | 34 ++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_gt_mcr.h      | 14 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_topology.c |  3 ---
 drivers/gpu/drm/xe/xe_gt_topology.h | 11 ++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h    |  6 +++--
 5 files changed, 57 insertions(+), 11 deletions(-)

-- 
2.34.1

