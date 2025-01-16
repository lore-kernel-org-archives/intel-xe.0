Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D5DC02180
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 09:13:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582CB10E1CB;
	Thu, 16 Jan 2025 09:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cHQWTLzA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E82010E1CB
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 09:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737018805; x=1768554805;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eueMNGdS8blZc2txZP+oDZOxgw2QeExgWcbj5ySnV4c=;
 b=cHQWTLzA4SLdA3KMmt6tYB3uhhUeftcQaO+E7kRtw06lTYNVSRqOgqWJ
 D3fFL9or+C7/20KFTTXzwHboPW+Mwk25sYtAB/2Fn+ITzhFnQBcYNV5Pw
 7eKVs0Yak1Ffo4KI7W0Og0Ws7wr8ciFfupiw0Xn4iTE1tcvUVlBf/hgF0
 vw2mZw8KLbyXlGAS3csuNeCWgCaNurqVTpHReKcnbc6cpSLl+2Z+IVBkB
 RAQI8rhE8aolB63xC909NFSoeqIksRdqiEZKcllDJMpfmvSS1iKYpSuH+
 6vyxfd2uiLCQODzRkGCXZ/f495imJaSMuWrbN5bVkVxCgMFUDrL6xchHs g==;
X-CSE-ConnectionGUID: x2zjYsgXTn+nfzzZwGTd3g==
X-CSE-MsgGUID: /XJoltRbR9G6vfIMbCiZ9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37423999"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; d="scan'208";a="37423999"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 01:13:24 -0800
X-CSE-ConnectionGUID: JlEb2LNiQmmPbRRdKLVMGA==
X-CSE-MsgGUID: o61h3l6zR1O2fB2dmSWJmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="110399418"
Received: from aradhyab-desk.iind.intel.com ([10.145.169.55])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 01:13:22 -0800
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH v2 0/2] drm/xe: Add and refactor workarounds
Date: Thu, 16 Jan 2025 14:40:02 +0530
Message-Id: <20250116091004.3060996-1-aradhya.bhatia@intel.com>
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

Hello all,

This patch series adds the workarounds, Wa_16021333562, and Wa_14016712196. It
further refactors Wa_18013179988 and Wa_14015568240 to use the newer and cleaner
workaround check implementation instead of the platform switch select.

Thanks,
Aradhya

Change Log:
V2:
  - Add new patch (patch-2/2) which involves refactoring the WA implementation
    as suggested by Lucas De Marchi.
  - Expand the ranges of Wa_16021333562 and Wa_14016712196 as per WA database,
    in patch-1/2, and in that process add the WAs properly instead of porting
    them for a select few platforms.
  - Reword the commit subject and commit text in patch-1 accordingly.

 
Previous Revision:
V1: https://lore.kernel.org/all/20250115080048.2282183-1-aradhya.bhatia@intel.com/


Aradhya Bhatia (2):
  drm/xe/xe: Add Wa_16021333562 and Wa_14016712196
  drm/xe/oa: Refactor Wa_18013179988 and Wa_14015568240

 drivers/gpu/drm/xe/xe_guc_ads.c    |  5 +++++
 drivers/gpu/drm/xe/xe_oa.c         | 14 ++++++--------
 drivers/gpu/drm/xe/xe_ring_ops.c   |  3 +++
 drivers/gpu/drm/xe/xe_wa_oob.rules |  5 +++++
 4 files changed, 19 insertions(+), 8 deletions(-)


base-commit: 174e9ce0daf6af791386e96e76e743eb59e8a401
-- 
2.34.1

