Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C99EC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 01:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5645810E2B6;
	Thu,  8 May 2025 01:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ERo1abk1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4F210E2B6
 for <Intel-Xe@lists.freedesktop.org>; Thu,  8 May 2025 01:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746668078; x=1778204078;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EHod8+IWdUwLoEu7E0bAVeHqhJhMxBZFWejCCoAd/m8=;
 b=ERo1abk1IAmx8E5v2Tpb/x2NgxSkud8i1c2FMLU0bHMKNdhAK4En4e15
 23UDPvJb28jkHTXUUM2r4aWOa6rDsyLIOX6a8BlX8ncfq31tqfMFUGmA7
 SfiSo0FxS0t2eOiug3QYTEl2nm3shGNhp+x4NAdV374h758v2K23KmPuo
 5snS+wbU28RJS26xGpmGpsDgI7sfPSbWwcXch5vkUxV6h+cOWEZ+mSpme
 1HwMQwuxvNCV3q2VtFB8FvG5h3hXUFMcosQ01sncyu2j9HF9VVjfTvKjD
 xsNjUTGwN5PNQSASFF86ZG281tRoyF6/Fzt5j3y6KqveypNL+zMhVFPgn w==;
X-CSE-ConnectionGUID: dqrbYOtSQ+WnioKobGZLeQ==
X-CSE-MsgGUID: j6/o+UgMTbqSJfKNyBC/AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48538276"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="48538276"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 18:34:37 -0700
X-CSE-ConnectionGUID: 8mWOu0JYS96tXJvQEfIgZw==
X-CSE-MsgGUID: v8lRSHxrQCKN5WuUAmtIig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="136094240"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 07 May 2025 18:34:37 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 0/4] Track FAST_REQ H2Gs to report where errors came from
Date: Wed,  7 May 2025 18:34:33 -0700
Message-ID: <20250508013437.652982-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Most H2G messages are FAST_REQ which means no synchronous response is
expected. However, errors can still be returned. Add support for
tracking the FAST_REQ H2Gs and matching up an error response to its
originator.

v2: Split RESPONSE define into separate patch, re-word
comments/prints, fix consistency of conditional compilation (review
feedback from Daniele & Michal W).
v3: Split into more patches, add more RESPONSE defines, improve
debug print message (review feedback from Michal W).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (4):
  drm/xe/guc: Remove double blank line
  drm/xe/guc: Add missing H2G error code definitions
  drm/xe/guc: Rename CONFIG_XE_LARGE_GUC_BUFFER
  drm/xe/guc: Track FAST_REQ H2Gs to report where errors came from

 drivers/gpu/drm/xe/Kconfig.debug        |  11 ++-
 drivers/gpu/drm/xe/abi/guc_errors_abi.h |  15 ++-
 drivers/gpu/drm/xe/xe_guc_ct.c          | 117 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_ct_types.h    |  15 +++
 drivers/gpu/drm/xe/xe_guc_log.h         |   2 +-
 5 files changed, 133 insertions(+), 27 deletions(-)

-- 
2.49.0

