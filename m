Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AC9C19F32
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 00:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C05A10E102;
	Thu,  6 Mar 2025 00:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gLm6rU04";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C588410E102
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 00:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741222675; x=1772758675;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Gqnvzgbbe8p85oB2MJQ8eofnpuxwRElUQvkDlxEYwfU=;
 b=gLm6rU04b+Cpd18wGk8Sc73CBDbHKd3HVaAwKEdHsgos6mRux1iC5/4k
 m4P/69SutuvV6MEhttgpq4WZop9FJqqxSIUZE26tyX56H61u3ejWTboFh
 RM/2DN1R2FjmiaSOsgxYZBReFI3i5wUiKJrKdlJ+/PWyQUvbI6a3GPStd
 YjfPZ0Ex4FvcRktxNcswnJBYFV2MV25SwKGXl0IFeTlCqdRx91y+xdQTX
 Nl0jOnSqXOQkLpFtfIbx7hrgxLDZHreOQBeLViOOHNb05kKyURcfT7k1w
 QYZJm/L9dyXxSvpirLd+0S6RNEib4aRD79jtwv7efkHb63laR13739vgb Q==;
X-CSE-ConnectionGUID: pJxKB8VVQUKr12LACUwRuA==
X-CSE-MsgGUID: GP80ZyvXSIO37vE8zOqeoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41465287"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="41465287"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 16:57:55 -0800
X-CSE-ConnectionGUID: HKhJNc/IT+6IQtwG5cYSNA==
X-CSE-MsgGUID: VTpB0jllQxSkzhdu2+Zk8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="123444022"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 16:57:55 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH v2 0/3] Enable GuC opt-in features
Date: Wed,  5 Mar 2025 16:57:42 -0800
Message-ID: <20250306005745.3520231-1-daniele.ceraolospurio@intel.com>
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
version (either [1] or [2]), but these patches can be merged in
parallel as there is no direct dependency in code.

v2: rework common KVL emission code.

[1] https://patchwork.freedesktop.org/series/145406/
[2] https://patchwork.freedesktop.org/series/145667/
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Daniele Ceraolo Spurio (3):
  drm/xe/guc: move KLV helpers to common file
  drm/xe/guc: Enable extended CAT error reporting
  drm/xe/guc: Enable the Dynamic Inhibit Context Switch optimization

 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  4 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h    | 28 +++++++
 drivers/gpu/drm/xe/xe_guc.c              | 94 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h              |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c          | 89 +++++-----------------
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c  | 45 ++++++++++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h  | 19 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 16 +++-
 drivers/gpu/drm/xe/xe_guc_types.h        |  3 +
 drivers/gpu/drm/xe/xe_uc.c               |  4 +
 10 files changed, 231 insertions(+), 72 deletions(-)

-- 
2.43.0

