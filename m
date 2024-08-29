Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B42AC83011
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 22:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE2510E799;
	Thu, 29 Aug 2024 22:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ipPykfXI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C8F10E796
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Aug 2024 22:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724969188; x=1756505188;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4ZImvUKvVDxMgUlF+OTuEvxz1yOhA4iakdctl9VQ+ns=;
 b=ipPykfXIR46i4HHsuFsgDBo4dw1qjIJ61mnXe79U2K2eOVF6XS0W46gZ
 lWYQAUPixTypkfD8OjuSZn0T8HS8LR03n8ofyDfQh/3CjDntWRpeNp/KU
 kAbIHfvMy7BhxCveBqrjnfjl7a7v95kjU6l3GyPb4xB17HIKT26ZxRnvc
 7Yo6l/9O5r2C8iU7PdgSHgtDuZy+voChQe5K04BC4iLC9FBH79nXh/qQq
 Zokrd7RoyaRD2qr5lqEHnUvL2DXxCvaUk2yEeZVTRk64VWppyfDSPouqg
 L6oogKVsWauj2V862BunWuPK/rdSpTxbejvvOOzALIONKqXVYtvYAEc1/ A==;
X-CSE-ConnectionGUID: PUK4WGpUTzuAwAhT6X+fvQ==
X-CSE-MsgGUID: RYnL4Ue/THG8pOCHrPG2Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23737580"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="23737580"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 15:06:28 -0700
X-CSE-ConnectionGUID: wqQ2B/m3RKuKyB8AgHwaxw==
X-CSE-MsgGUID: 1ADnUiZkSeaRG+yMK3R4zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="63555966"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 15:06:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 0/2] Remove falsely GT-centric design in pcode and hwmon
Date: Thu, 29 Aug 2024 15:06:20 -0700
Message-ID: <20240829220619.789159-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
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

Both the pcode and the hwmon code was using a GT-centric design, even
though these are not GT-level concepts in the hardware.  Pcode has a
single instance per tile, and using a GT-centric design means that that
locking isn't actually preventing all of the concurrency that it should
be.  hwmon is a per-device concept (all information is always read from
the root tile's MMIO interface).

In both cases, these seem to be artifacts of the larger driver
(mis)design where 'gt' is used as the target for MMIO operations.
There's a much larger driver-wide refactor coming to address that, but
let's start by fixing up these two components in preparation.


Matt Roper (2):
  drm/xe/pcode: Treat pcode as per-tile rather than per-GT
  drm/xe/hwmon: Treat hwmon as a per-device concept

 .../drm/xe/compat-i915-headers/intel_pcode.h  |   8 +-
 .../drm/xe/compat-i915-headers/intel_uncore.h |   7 ++
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_gt.c                    |   2 -
 drivers/gpu/drm/xe/xe_gt_types.h              |   6 -
 drivers/gpu/drm/xe/xe_guc_pc.c                |   2 +-
 drivers/gpu/drm/xe/xe_hwmon.c                 |  95 +++++++++-------
 drivers/gpu/drm/xe/xe_pcode.c                 | 104 +++++++++---------
 drivers/gpu/drm/xe/xe_pcode.h                 |  16 +--
 drivers/gpu/drm/xe/xe_tile.c                  |   3 +
 drivers/gpu/drm/xe/xe_vram_freq.c             |   6 +-
 11 files changed, 136 insertions(+), 119 deletions(-)

-- 
2.45.2

