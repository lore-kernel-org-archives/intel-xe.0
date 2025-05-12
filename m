Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D4BC3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 16:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11F410E434;
	Mon, 12 May 2025 16:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4M7rhh2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2658C10E434
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 16:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747066805; x=1778602805;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rTaC6BDnpYz50gZN5Cr4k+LqxKSOWVAh9CpIATTgwEE=;
 b=V4M7rhh2VXT4lPeF9bbiWFzWLyyWgEbiKvpLIdRLNw4UiCm0VRKnYqA9
 TjGuxiVZ9jiiWGOCU7GWrMVppG2dqU5lXqTUI6U0+oIiBfR442Fc75T3J
 DB9j212iNYRdxSNM973EVqZ//6iVfyKeVb43VE6Q6lcCz119VHknOcDLx
 YDgiVp6s8HX8+u3tpR9DENjz9h0hXVydzg/m+aekIRyAJv8MXBkLkP8Hy
 6fu2olX5+zpML2M8eVp5ejnn91xdM+k8iKLzKy/9y4pLwzEB6exlPRmLu
 g1JpGxkOHCEahD7ilLQD6x3dXLCc5grFffeoD6l2an9iIPB2RdRIV0B8R Q==;
X-CSE-ConnectionGUID: czdSCRLAT1G9cRW28AdqSg==
X-CSE-MsgGUID: JRLSBMsxQuSAv6nO/BLVXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66282557"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="66282557"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:20:05 -0700
X-CSE-ConnectionGUID: zAzMBI9dS7a1xgNHQKh+dw==
X-CSE-MsgGUID: dZGiMtnwTTy9FnaGMiGWIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142187501"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.179])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:20:01 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Subject: [PATCH 0/2] Suppress some dumps during fault injection tests
Date: Mon, 12 May 2025 18:19:45 +0200
Message-Id: <20250512161947.128-1-michal.wajdeczko@intel.com>
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

Inspired by the discussion during the review of [1]

[1] https://patchwork.freedesktop.org/series/148415/

Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>

Michal Wajdeczko (2):
  drm/xe: Introduce flag to indicate possible fault injection
  drm/xe/guc: Suppress Dead CTB Dump during fault injection tests

 drivers/gpu/drm/xe/xe_debugfs.c      |  5 +++++
 drivers/gpu/drm/xe/xe_device.h       | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++++
 drivers/gpu/drm/xe/xe_guc_ct.c       |  4 ++++
 4 files changed, 30 insertions(+)

-- 
2.47.1

