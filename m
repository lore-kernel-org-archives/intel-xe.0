Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124D6CA5FA1
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 09:44:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9647B10E9DE;
	Tue, 29 Sep 2026 09:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdmXUkzA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D14010E9C8;
 Tue, 29 Sep 2026 09:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790675091; x=1822211091;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bE/UKk5dT3Sd6XLLSUewjFAePAmzk/7zztD1zaB5TK0=;
 b=KdmXUkzA9M8vzP2d3Y50Wicj2NpPHBYJe6yesEuf7aMwffWxV1BGZ7DN
 NJQvNKZO7px4pH89+QAUQcwf8Mxmu48OebITYCeezrzfuI0WDvqk6yEEm
 57+YNwwkAhiD5NZVv4aHvsRTaRYiMkhHULw4Q7AdjFRJMYVRpy5w1LaF5
 Dbo0XOBFghZmBkCknnPykZrtMl4dapdb7mnkdmwd1dW20xyr+EqpHp4bn
 HSuSOGGk+F1Wm34We+OKhXH60Ef+4nL1WuirEzHEEmJSiaDFJ5bXbFC0G
 YIKI5djrqBZ+mwpVlDR0uFY26uF3e/hoLSLltZ7+uyGiZn36AsQ+3z/GI Q==;
X-CSE-ConnectionGUID: gITtJaxJTBOtLeyk4V7N+Q==
X-CSE-MsgGUID: YfQwjgtkT46DhuOZwOPHjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91250027"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="91250027"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:44:51 -0700
X-CSE-ConnectionGUID: 3LUL/5Y0TQCUitKDw5y3+g==
X-CSE-MsgGUID: lzqvse9lTRW+aw0hWkWDUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="283414932"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.120])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:44:49 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 0/8] Selective fetch calculation fixes
Date: Tue, 29 Sep 2026 12:44:26 +0300
Message-ID: <20260929094434.77129-1-jouni.hogander@intel.com>
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

This set contains fixes for selective fetch area calculation.

Fixes in the set:

 - Clear plane selective fetch area on plane state duplicate and keep the
   area consistent on full update.
 - Add enabled pipe planes into the state before the plane checks to keep
   the UV and Y plane linking in place.
 - Set the selective fetch area for the linked Y plane also when selective
   fetch is being disabled.
 - Fix SFF_CTL and CFF_CTL register bit definitions.
 - Skip the plane selective fetch support check for invisible planes.
 - Don't write a zero sized area into the plane selective fetch area
   registers.
 - Remove misleading drm_info_once on zero sized selective fetch area.
 - Don't clip the cursor plane state destination rectangle when
   calculating the selective update area.

Jouni Högander (8):
  drm/i915/psr: Clear selective fetch area when duplicating plane state
  drm/i915/display: Add enabled pipe planes into state for selective
    fetch
  drm/i915/psr: Disable linked plane sel fetch as well
  drm/i915/psr: Fix SFF and CFF CTL register bit definitions
  drm/i915/psr: Skip sel fetch support check for invisible planes
  drm/i915/psr: Don't write 0 size area into plane sel fetch area
    registers
  drm/i915/psr: Remove drm_info_once on failed selective fetch area
  drm/i915/psr: Don't clip plane state destination rectangle

 drivers/gpu/drm/i915/display/intel_plane.c    |  11 ++
 drivers/gpu/drm/i915/display/intel_psr.c      | 106 ++++++++----------
 drivers/gpu/drm/i915/display/intel_psr_regs.h |   4 +-
 .../drm/i915/display/skl_universal_plane.c    |   3 +-
 4 files changed, 61 insertions(+), 63 deletions(-)

-- 
2.43.0

