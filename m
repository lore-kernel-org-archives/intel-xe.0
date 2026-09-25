Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9860C9830E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 17:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B27510FBB9;
	Fri, 25 Sep 2026 17:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1l3rcwN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FAF10FBAF;
 Fri, 25 Sep 2026 17:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790357902; x=1821893902;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s9SWHCDEWP5nnLpIrTvm4LyOCmA3heVkEjzrd/s1/nQ=;
 b=V1l3rcwN4ChS5/KBPMM5QRKdGrRHlje1kapcoo1PNYJPmR/OZ4vE2mbL
 LMmRu2EnxdmFhF94OarxWbSFgdTd6eqUS61tuE4S8SBVMS65x2q5SX5xX
 pPcl3NvRA3hF/N1VPbjBfi5qL1cvsV9sqhtsRtkR+3A+iyMePU3ILyhDG
 yjcWQI6dh3f7pbX8pJiBM+f0o+HTOIVqah8pbEt5z98USYxFx02FiMXUk
 KIZL0E4yN0FPtrj0LDTq7RgWLeqgH9MqcpTHJqPTJlODftnLowbHR1nlw
 NgTtd0EQCW6dmFWQN7/RnyeF4jOAge+Yqw3pG3KH8HUwbvnpqhrISB1qL w==;
X-CSE-ConnectionGUID: SRnI0EyJRYiWvN1c52XB1Q==
X-CSE-MsgGUID: 9Mcbrls8TIOXR7KkKoqYVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="116677953"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="116677953"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 10:38:22 -0700
X-CSE-ConnectionGUID: cneZjOXgTUe7HTYN0IvWdg==
X-CSE-MsgGUID: mOgG3vZ+QaunO58zLopeYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="270874871"
Received: from chu13-desk.fm.intel.com ([10.80.209.189])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 10:38:21 -0700
From: Austin Hu <austin.hu@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, maarten.lankhorst@linux.intel.com,
 vinod.govindapillai@intel.com, huchao426@gmail.com
Subject: [PATCH v4 0/3] drm/i915/fbc: Dirty rectangle bounding and CFB
Date: Fri, 25 Sep 2026 10:36:55 -0700
Message-Id: <20260925173658.1042048-1-austin.hu@intel.com>
X-Mailer: git-send-email 2.34.1
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

v3 -> v4 changes:
  - Rebased onto latest drm-tip.

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

