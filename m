Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36904C5B559
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 00:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A8410E1CD;
	Wed,  4 Jun 2025 00:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdCuUIy/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095E789EAE
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 00:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748996704; x=1780532704;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oaEsCvNfSIgf8qEoLris+kmZeMwl6X/B70J94ehEKCo=;
 b=KdCuUIy/0P3AUMxo++i4vi6EhfGFZWLiLSiCUIugHoGNMXeGa0rfaScy
 WxQB2rJXY8NEtjLbx4ePSkvLNWgezW9n7rE/cp+u1obLdur0QQcaNolZa
 gq0+3CrKt8WB3eb679S1ZERkKnq0QVNdzHFsDJdtesSa5zyok9zumX9Dy
 snfBBYR1EY9MyfMSBjCm/HadbaQkeHhxyqQhrDgak1Kva+zyBN+T4mwz5
 zuPaX1QrF0uaWA1jIUmMqi1XbmLdar2QtSSIg3gPBsgrD0lfeFupnvABl
 kk7wW/aXAoXWLbRd4/VZE45SzJlXMGRRgGOgiBAsAHNHek2nPMkN+CdUb Q==;
X-CSE-ConnectionGUID: vznJr1UPQQ+fOQ0OU0nlWA==
X-CSE-MsgGUID: e86wIoWGTTymuJKqeHvgwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="61324099"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="61324099"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 17:25:02 -0700
X-CSE-ConnectionGUID: YJ+U/f8LRuyiKEmt2bwT4A==
X-CSE-MsgGUID: psSAhurmRpC2tN0r4eEIUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="150168586"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 17:25:02 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 0/2] Enable GuC opt-in features
Date: Tue,  3 Jun 2025 17:24:55 -0700
Message-ID: <20250604002454.743404-4-daniele.ceraolospurio@intel.com>
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

The GuC supports a H2G to opt-in to extra features on a per-VF basis.
We're interested in 2 of those features:

1 - Extended CAT error info (extra debug info)
2 - Dynamic ICS (optimization)

More details on what those do in the respective patches.

This series adds code to conditionally enable those features in both
native/PF and VF. Note however that for the VF enablement to actually
work we need another series to correnctly set the GuC compatibility
version ([1]), but these patches can be merged in parallel as there is no
direct dependency in code.

v2: rework common KVL emission code.
v3: switch to guc_buf_cache instead of using a dedicated allocation.
v4: limit dynamic ICS to single engine cases.

[1] https://patchwork.freedesktop.org/series/149613/
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Daniele Ceraolo Spurio (2):
  drm/xe/guc: Enable extended CAT error reporting
  drm/xe/guc: Enable the Dynamic Inhibit Context Switch optimization

 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  4 ++
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h    | 28 ++++++++
 drivers/gpu/drm/xe/xe_guc.c              | 86 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h              |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c       | 16 ++++-
 drivers/gpu/drm/xe/xe_uc.c               |  4 ++
 6 files changed, 136 insertions(+), 3 deletions(-)

-- 
2.43.0

