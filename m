Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53961CD8C92
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 14:12:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9B710F44C;
	Mon,  8 Jun 2026 14:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQ06Yqyk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7A510F44C;
 Mon,  8 Jun 2026 14:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780927936; x=1812463936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2LfJpOFJQDWmPPAUg0jJ6VMu58gz/1tf1ZamPn5pAHE=;
 b=YQ06YqyknkssY+KfrdwDOpNFNRHiim+weEaocCDH5/lZKGb5z3WnBak2
 lZGdkBLBF6QtWIpXfAl7X57Gcdn4wPhJkpXbcI7Qfjr2kkQ1U8wdBfTB1
 cWHRp+g1+JZdLIG4sY8saSlwoUGT0KL9UKueUpao8T6ER2onCqS1BKDqx
 ylI3sGC7NI6pevsTsMC7/5RIrLAIkyLks4Oi8F/cxzD6w5IbTRWxJpFxx
 x103lEcDG4piLZ4Tht53DVpxkgJwH/9cbcENUM0O0HaSQg0Iajx2IyT3G
 Td3cJvH85iu626bESRLPfCAYSNsG9ySzLZuxQj6ydpX7i624QoeOwbTqx g==;
X-CSE-ConnectionGUID: pp4rC1I2RDiX/KH6dan1XA==
X-CSE-MsgGUID: 2fkkcFxqSwOetHzIDf7/rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81781290"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81781290"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 07:12:16 -0700
X-CSE-ConnectionGUID: r99k8BmtQlWewM47HMEAIw==
X-CSE-MsgGUID: 1Cej73C3RuCKLmrD+n70mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="241113691"
Received: from carterle-desk.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.213])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 07:12:15 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 0/7] Enable FEC when using DP Panel Replay
Date: Mon,  8 Jun 2026 17:11:17 +0300
Message-ID: <20260608141124.144878-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

This patch set is doing necessary modifications to enable FEC when DP
Panel Replay is in use. Based on DP specification FEC usage is
mandatory when Panel Replay is enabled.

Jouni Högander (7):
  drm/i915/psr: Check FEC support for DP Panel Replay
  drm/i915/psr: Stop using intel_dsc_enabled_on_link to detect crtc DSC
    status
  drm/i915/display: Rename compression_enabled_on_link and
    link_dsc_pipes
  drm/i915/psr: Split PSR compute config
  drm/i915/psr: Move DP/eDP Panel Replay compute config to pre compute
    config
  drm/i915/psr: Add PSR specific pre compute config
  drm/i915/psr: Enable FEC if using DP Panel Replay

 drivers/gpu/drm/i915/display/intel_display.c  |   2 +-
 .../drm/i915/display/intel_display_types.h    |   2 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |   7 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  20 ++--
 drivers/gpu/drm/i915/display/intel_link_bw.c  |  16 +--
 drivers/gpu/drm/i915/display/intel_link_bw.h  |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c      | 108 +++++++++++++-----
 drivers/gpu/drm/i915/display/intel_psr.h      |   3 +
 drivers/gpu/drm/i915/display/intel_vdsc.c     |   8 +-
 drivers/gpu/drm/i915/display/intel_vdsc.h     |   2 +-
 10 files changed, 119 insertions(+), 51 deletions(-)

-- 
2.43.0

