Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6E2C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 16:35:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FCF10E434;
	Mon, 12 May 2025 16:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6en9KEa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2DD10E434
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 16:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747067719; x=1778603719;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kU+9rrU0rHaxAVxc3n3218nnSFNfySWxK+uZROjcvwQ=;
 b=V6en9KEa6jm2V95aYY9+tpNPnC70Qzh+ZzhrfiRcZ+oBrruX7pkLTk8a
 KkBXJRRrwIPZfNroAijfDSoFjXpUE+F01/7An80QVn5+lx6HpAF2Fb54e
 1haMlpr5roYqN09Dp3Flg4M/I3nOUK6a2h9mlkPji83JJS2JB0YKcFl0Q
 xqs6GzIhKtZCRDO1hUFJSDPvDecJ7lY1KPwBtMrpyDf+EwwAe6LQU3TVY
 VKAH7REAxG1iHESaSV1u1kbUJ4gwl7Q2e7Oipfay28D5bGfB5unih1QUm
 vNOankRTBJlhlNjargMfVuCWJzPXTnnjcsRxvhxDAuhKd+fmUY3GkRTZ+ A==;
X-CSE-ConnectionGUID: EKbP7ajzTLu/agA9M2Ohhg==
X-CSE-MsgGUID: dc34mPcXThChc9KLFxcVNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="36501019"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="36501019"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:35:19 -0700
X-CSE-ConnectionGUID: iqlAorG+R8KoXjZWsTNp1A==
X-CSE-MsgGUID: iNZrWPufSa2nVSl9Hw2/Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="137351558"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:35:17 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v2 0/4] drm/xe: Improve wedged mode handling
Date: Mon, 12 May 2025 18:34:28 +0200
Message-Id: <20250512163432.22678-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

Prevent the VF from attempting to update the GuC reset policy when
changing the wedged mode, as this operation is not supported on VFs.

Additionally, validate the wedged_mode module parameter input, update
the internal wedged.mode state only on success, and allow setting
wedged_mode=2 only in debug builds if running as PF.

Lukasz Laguna (4):
  drm/xe: Validate wedged_mode parameter and define enum for modes
  drm/xe: Don't update wedged mode in case of an error
  drm/xe/vf: Disallow setting wedged_mode=2
  drm/xe/pf: Allow wedged_mode=2 only in debug config

 drivers/gpu/drm/xe/xe_debugfs.c      |  9 ++++----
 drivers/gpu/drm/xe/xe_device.c       | 31 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_device.h       |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  6 +++++-
 drivers/gpu/drm/xe/xe_guc_ads.c      |  4 ++--
 drivers/gpu/drm/xe/xe_guc_capture.c  |  3 ++-
 drivers/gpu/drm/xe/xe_module.c       |  5 +++--
 drivers/gpu/drm/xe/xe_module.h       |  2 +-
 8 files changed, 48 insertions(+), 13 deletions(-)

-- 
2.40.0

