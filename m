Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBF4C61DBC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 16:58:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6072910EAEC;
	Tue, 25 Aug 2026 16:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Na/MvBuo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1249410E5F7;
 Tue, 25 Aug 2026 16:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787677104; x=1819213104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DWlPvhgI1tH8jmwXiEjiiQ2I8HActgaQc4tjCQVFJZI=;
 b=Na/MvBuoTAgXekyS+cuvQ9NBX5HUWJhBpCSORaC3pdqRvzauzmb9zcgw
 GKN8oiQ7T2LW0Pq2ackeZcjBkNbijxtD2w3aZHtRfwySNeCseqfO8osZ4
 fdxWgnuShuVXQTTi1duIAhQirtd8dLm1ZNrR92T37v0qidTaNfFV0kmAM
 +fPSyKSYxs+oSJJMp7ccSCRoAIOslirXW5VGAF0XdvMvYYk7fn9P77lvj
 zLqgjjRBQQhd1dm45cWKKhKBiwZouTdSO+psWu4CKGHpxTiGtBc2NfwrZ
 VbuxCHMxQEu4bXyGWv5xRn+3x0k0ohGoDwPi9mT0mqT4T7s6Q45cUpK9j A==;
X-CSE-ConnectionGUID: LjG33XJWT+OlLv2mdiChkQ==
X-CSE-MsgGUID: wRtqApwiTaimZFJgrlII1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88206778"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="88206778"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 09:58:24 -0700
X-CSE-ConnectionGUID: LddbU/qqSJuG0qFFrsiHnw==
X-CSE-MsgGUID: cwnKkGL+T1aKBbIW6Eoq3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="270819778"
Received: from chu13-desk.fm.intel.com ([10.80.209.189])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 09:58:23 -0700
From: Austin Hu <austin.hu@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, maarten.lankhorst@linux.intel.com,
 vinod.govindapillai@intel.com
Subject: [PATCH v2 0/2] drm/i915/fbc: Dirty rectangle bounding and CFB nuke
 handling
Date: Tue, 25 Aug 2026 09:56:27 -0700
Message-Id: <20260825165629.1799744-1-austin.hu@intel.com>
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

This series fixes two issue areas in Intel FBC (Framebuffer Compression)
dirty rectangle handling:

1. Clamps FBC dirty rectangle bounds to valid surface limits [y_offset, y_end]
   and adds logging for out-of-bounds coordinates, including handling for 
   180-degree plane rotation.
2. Tracks plane state attribute changes during atomic commits. When FBC Dirty
   Rectangle mode is active, partial updates only apply to surface address
   changes (PLANE_SURF). Modifications to any other plane state parameters
   require fetching full-plane pixel data from memory to re-compress and
   update the entire CFB in stolen memory. Once fully re-compressed,
   subsequent atomic commits can resume selective dirty rectangle updates.

v1 -> v2 changes:
  - Reused intel_fbc_can_flip_nuke() for plane update state checks as suggested.
  - Added plane Y-coordinate plane view checking (color_plane[0].y) alongside X.

Austin Hu (1):
  drm/i915/fbc: nuke CFB if Plane setting (except for surf addr) changes

Charlton Lin (1):
  drm/i915/fbc: fbc_dirty_rect restrictions and logging

 drivers/gpu/drm/i915/display/intel_fbc.c | 192 +++++++++++++++++------
 1 file changed, 141 insertions(+), 51 deletions(-)

-- 
2.34.1

