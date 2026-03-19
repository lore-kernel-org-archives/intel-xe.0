Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6961091927
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 21:31:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64E710E98D;
	Thu, 19 Mar 2026 21:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BCmuGC79";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE26510E988
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 21:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773955874; x=1805491874;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jb6lrK7ZbnOHWxNBL4K1uqztSSF4iz/g4lL31wkKrC4=;
 b=BCmuGC79IG50HX1+5eVYsOOPYRGwvq+ysx/XdiCMx28iq48bRSU0Ohi9
 VKyfFu0ME1ao+fTEkWHkUuexrfNbkHmQBq8mjaoNpujHiI+AdrhRcsf8v
 jms/nlH55mCJQKeYmKJO/Vqeup8V/N4wHT9RsI18v/UOCEqQvcW8rB+Jt
 QuJQz3LAgX00nr2QnXb6XsofopSD22iguef6dFp4idnc70piw2okNUKTI
 3vb++B3my0/swXn8BmXl4QRN7p22BlJuaBFWa/3/Sdo9Vr9i2txXYjs0U
 Sal1QDlMjm7iqjED3aAL82YRXwapr0KdSDwf4gpurBY+AXYkxiQnsBdDg w==;
X-CSE-ConnectionGUID: 4QgwNRhqSD611wixMz1PMw==
X-CSE-MsgGUID: 9GFxWQ+OSPesgAZN0WoMnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="92613556"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="92613556"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 14:31:14 -0700
X-CSE-ConnectionGUID: hiLI22AoT5OVKmKE4ws/Ag==
X-CSE-MsgGUID: QWRkjAdWT7iLsZ8x9qkUKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="218500711"
Received: from dut4407arlh.fm.intel.com ([10.105.10.118])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 14:31:13 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: piotr.piorkowski@intel.com, michal.wajdeczko@intel.com,
 michal.winiarski@intel.com, intel-xe@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 0/2] Add support for LMTT specific invalidation
Date: Thu, 19 Mar 2026 21:31:04 +0000
Message-ID: <20260319213110.259170-1-stuart.summers@intel.com>
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

Split this into a series from [1] to separate out the op
assert to apply to all TLB invalidation operations.

[1]: https://patchwork.freedesktop.org/series/163541/

Stuart Summers (2):
  drm/xe: Add an assert that the TLB invalidation op is available
  drm/xe: Add LMTT invalidation to VF provisioning flow

 drivers/gpu/drm/xe/abi/guc_actions_abi.h   |  2 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  6 +++---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c      | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_lmtt.c               | 16 +++++++++++-----
 drivers/gpu/drm/xe/xe_lmtt.h               |  2 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c          | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.h          |  3 +++
 drivers/gpu/drm/xe/xe_tlb_inval_types.h    | 12 ++++++++++++
 8 files changed, 71 insertions(+), 9 deletions(-)

-- 
2.43.0

