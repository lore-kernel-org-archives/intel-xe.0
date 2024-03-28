Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7713CD11DF
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 18:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DED112044;
	Thu, 28 Mar 2024 18:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bhz1/MNo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3328210F3BB
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 18:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711650717; x=1743186717;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=217lzjieogi3fRYVwlBlhH0J++rBwzZ081ylLzkRe6I=;
 b=Bhz1/MNo7jpVvwxfXVNGCENBMMYnBefGGAjtkN7qZIb16ghcfjvPMKrX
 3Lh5GlX4VcTrojYkrKqPNLqf0LcgiFy4emJYnakkFrYiz+mwwEAvaDiV+
 4Bu3Lsr5tCLTGsaKMp5Y6iUK3JfgBjg7Cpgde3wUF4UoLTz9CrrD/iiVx
 cVRfm6eqg/VV5pcGp76SNubYLFqaKJxA2xUJQyj37NjJj291Gu2cPnr8G
 YRnmW3THF26YgiQwdgRI5Hd+CMvCbcyPDhS5MlIDZcGCc4I7wzm4jwrBD
 pAf3VYKcARaL3AI9UtTgPIdDZpVCglqqd+7gAU3aFR15f6gEJMygTJ/0f A==;
X-CSE-ConnectionGUID: sdd0HEqnSzOe3w/H6DI6Bw==
X-CSE-MsgGUID: LIniOWuVTFuKOXAff7/Ilw==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="18205401"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="18205401"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:31:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="47700355"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.157.82])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:31:55 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/7] Update GuC ABI definitions
Date: Thu, 28 Mar 2024 19:31:40 +0100
Message-Id: <20240328183147.495-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

In upcoming patches we will use additional messages in communication
with the GuC firmware. Add necessary definitions to our ABI header.

Michal Wajdeczko (7):
  drm/xe/guc: Add PF2GUC_UPDATE_VF_CFG to ABI
  drm/xe/guc: Add PF2GUC_UPDATE_VGT_POLICY to ABI
  drm/xe/guc: Add GUC2PF_ADVERSE_EVENT to ABI
  drm/xe/guc: Add VF2GUC_MATCH_VERSION to ABI
  drm/xe/guc: Add VF2GUC_VF_RESET to ABI
  drm/xe/guc: Add VF2GUC_QUERY_SINGLE_KLV to ABI
  drm/xe/guc: Add GLOBAL_CFG_GMD_ID KLV definition

 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 289 ++++++++++++++++++
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  13 +
 2 files changed, 302 insertions(+)

-- 
2.43.0

