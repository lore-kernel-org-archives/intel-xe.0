Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D19AC28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 17:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E7B89C28;
	Fri, 28 Mar 2025 17:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n5sRPegd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A233689C28
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 17:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743182927; x=1774718927;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vvGHJ4adXw7Xh9GMCv5VIyC6ZV7X+exzUNdoxOO769U=;
 b=n5sRPegdEgGoL14XiIVQ6kWkEbjNaeG0GnCQzBsFeuqliPaDAb1f2zBi
 uhSdHiOGQpSldCr+DbXxU7JaBL0S2ifYOPlMD4ZZeIBWApeAB15iCN8cR
 aI3Fjtgx67Wd0RTdULoDQG/iFvcwuFBlC89cWCMdFg0rMI2WZsU0gWgTF
 MjtubPDlFOkv/14NtZmyF7O8fVh4QDIfpe8NH78s1KlOMtcuJHQBGXXkX
 wPl3nSl5uIZfwqaAeh+4oiuIhjH89GWMf5DIsQJU46YwajHX3pn+Bgj9e
 42Wg5+FjkX3+yLo0lcLl/1taIXoNfbJAeMNqSCH1Id0BGTx7vZuDamAj2 g==;
X-CSE-ConnectionGUID: SuHIRnKdRW2I6//pjmTpRg==
X-CSE-MsgGUID: hv+KqmeJR0iJxnuVmN8aaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55198118"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="55198118"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 10:28:47 -0700
X-CSE-ConnectionGUID: 42WxgOnISsKOKgUkR/hjWA==
X-CSE-MsgGUID: JkIP9isqTgq48Z+leKlX6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="162734647"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 10:28:46 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH v3 0/2] Enable GuC opt-in features
Date: Fri, 28 Mar 2025 10:28:35 -0700
Message-ID: <20250328172837.2607990-1-daniele.ceraolospurio@intel.com>
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
v3: switch to guc_buf_cache instead of using a dedicated allocation

[1] https://patchwork.freedesktop.org/series/145406/
[2] https://patchwork.freedesktop.org/series/145667/
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Daniele Ceraolo Spurio (2):
  drm/xe/guc: Enable extended CAT error reporting
  drm/xe/guc: Enable the Dynamic Inhibit Context Switch optimization

 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  4 ++
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h    | 28 ++++++++++
 drivers/gpu/drm/xe/xe_guc.c              | 68 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h              |  1 +
 drivers/gpu/drm/xe/xe_guc_buf.c          |  4 --
 drivers/gpu/drm/xe/xe_guc_submit.c       | 16 ++++--
 drivers/gpu/drm/xe/xe_uc.c               |  4 ++
 7 files changed, 118 insertions(+), 7 deletions(-)

-- 
2.43.0

