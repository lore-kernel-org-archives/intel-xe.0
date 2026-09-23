Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C67CC9830B
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 17:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A21510E961;
	Wed, 23 Sep 2026 17:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RsVSZivz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563AF10E961;
 Wed, 23 Sep 2026 17:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790184571; x=1821720571;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=be16lI0gA8G4nTUz6A7dRLwgy6A7vuuQbPGdNato1Nc=;
 b=RsVSZivzouVSZNY4u3zBIlQ9Ca71piAOTUwAKte0adb/stNtMwX1CBbC
 Tb2PnHmTuMonHfsQLokX9/vqYfKw5vFnVzFx+HsGr+/KE2EY8j8KTQ79h
 svUsYBh+7XijJHAjhvYkHVSWcL7tUBBQ2atwnxvhPkXaVyEIGmlisYxBt
 wAy/KyH6gnmtYsCpoxAkv4DW8N9UM/xiCGS+CGjAoIguvGDt9lhfGP/bJ
 qtv/sGqf5sN6TiIuwA8huO/BS0NTFNE4P82xbeny3MqzDyP/Rd5v9FYUc
 oEFf2FD/kXfBSafHvV1MXjh1OY9R4wTgAAcz0MkbLO162LUKHNOc0CLmr A==;
X-CSE-ConnectionGUID: Ib9RSqSIRc+lnHA5RJ90pA==
X-CSE-MsgGUID: WtdimIkGS8qRSi6WeSiStw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91019970"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="91019970"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 10:29:30 -0700
X-CSE-ConnectionGUID: fQ3nG6jbQS+gCvaLyJhjZQ==
X-CSE-MsgGUID: O3Tb6d4aSIG/92ndPGrLOg==
X-ExtLoop1: 1
Received: from chu13-desk.fm.intel.com ([10.80.209.189])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 10:29:30 -0700
From: Austin Hu <austin.hu@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, maarten.lankhorst@linux.intel.com,
 vinod.govindapillai@intel.com, huchao426@gmail.com
Subject: [PATCH v3 0/3] drm/i915/fbc: Dirty rectangle bounding and CFB
Date: Wed, 23 Sep 2026 10:28:00 -0700
Message-Id: <20260923172803.1011636-1-austin.hu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260812215350.3753102-1-austin.hu@intel.com>
References: <20260812215350.3753102-1-austin.hu@intel.com>
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

This series updates Intel FBC dirty rectangle handling and refactors plane
update checks:

1. Moves intel_fbc_can_flip_nuke() higher up in intel_fbc.c to avoid a
   forward declaration in subsequent FBC checks. (No functional change)
2. Clamps FBC dirty rectangle bounds to valid surface limits [y_offset,
   y_end] and adds logging for out-of-bounds coordinates, including
   handling for 180-degree plane rotation.
3. Tracks plane state attribute changes during atomic commits. When FBC
   Dirty Rectangle mode is active, partial updates only apply to surface
   address changes (PLANE_SURF). Modifications to any other plane state
   parameters require fetching full-plane pixel data from memory to
   re-compress and update the entire CFB in stolen memory. Once fully
   re-compressed, subsequent atomic commits can resume selective dirty
   rectangle updates.

v2 -> v3 changes:
  - Split function reordering into a separate standalone commit (v3 1/3) to
    avoid mixing movement and functional changes, per maintainer feedback.
  - Rebased onto latest drm-tip.

v1 -> v2 changes:
  - Reused intel_fbc_can_flip_nuke() for plane update state checks as
    suggested.
  - Added plane Y-coordinate plane view checking (color_plane[0].y)
    alongside X.

Austin Hu (2):
  drm/i915/display/fbc: Move intel_fbc_can_flip_nuke() higher up
  drm/i915/fbc: nuke CFB if Plane setting (except for surf addr) changes

Charlton Lin (1):
  drm/i915/fbc: fbc_dirty_rect restrictions and logging

 drivers/gpu/drm/i915/display/intel_fbc.c | 192 +++++++++++++++++------
 1 file changed, 141 insertions(+), 51 deletions(-)

-- 
2.34.1

