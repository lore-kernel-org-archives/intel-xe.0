Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E13108E1F4
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 11:40:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4CF10E899;
	Thu, 19 Mar 2026 11:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D9T23iqd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872E410E919;
 Thu, 19 Mar 2026 11:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773920440; x=1805456440;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vyV3mULLdOsJ4DI2jTKljfKBsjo/G2yBg9TANU1ffUo=;
 b=D9T23iqd88F6Qb0W/JLnV6jsCHZBuL58bQBSbM+FI+2BImrpxn2ZWZTD
 sHNscepRGAi1MOutRuuABSclgf+XrPULvg2Gk4aR7WCXetiygWnIgLxXp
 g8sfN8ZsYt/mCi9o+E2U8OmtsNNfrEJHd1kRpEBXGKtoiK1iOjPqHTTSQ
 C8S9dmNo5kHqGf6tpmENx703jriCQNl5oWu4hwkl0Wn16KZ3Tulc7PYVs
 BB4EnmPu7lJOgvbj2VnLNJI/EgKc8vqYHdYCiLhFgLsbFeVRpvEzsJ44J
 pliPEtkX4iAqM0PD3JYR6APfiguQ2gJE2zgFawU3OqBK0K28jrvAwlKN9 A==;
X-CSE-ConnectionGUID: xNgQfmNGRuCh4yMJ/JIFSg==
X-CSE-MsgGUID: lGpcdn6hQUectMTkG2l2Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="78891615"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="78891615"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 04:40:39 -0700
X-CSE-ConnectionGUID: 7fPl5OIWQtCGoqJ1bBlFBQ==
X-CSE-MsgGUID: G+NFGfrkQKOoMGOUsVtBuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="222970839"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.169])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 04:40:37 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/9] drm/i915/wm: Clean up pre-icl NV12 watermarks
Date: Thu, 19 Mar 2026 13:40:25 +0200
Message-ID: <20260319114034.7093-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Clean up the NV12 DDB/watermark handling for pre-icl platforms.

Ville Syrjälä (9):
  drm/i915/wm: Nuke is_planar from skl+ wm structures
  drm/i915/wm: Reorder the arguments to skl_allocate_plane_ddb()
  drm/i915/wm: s/skl_check_nv12_wm_level()/skl_check_wm_level_nv12()/
  drm/i915/wm: Extract skl_allocate_plane_ddb_nv12()
  drm/i915/wm: Nuke wm->uv_wm[]
  drm/i915/wm: s/skl_print_plane_changes()/skl_print_plane_wm_changes()/
  drm/i915/wm: Extract skl_print_plane_ddb_changes()
  drm/i915/wm: Include ddb_y in skl_print_wm_changes() on pre-icl
  drm/i915/wm: Include .min_ddb_alloc_uv in the wm dumps

 .../drm/i915/display/intel_display_types.h    |   3 +-
 drivers/gpu/drm/i915/display/skl_watermark.c  | 160 ++++++++++++------
 2 files changed, 105 insertions(+), 58 deletions(-)

-- 
2.52.0

