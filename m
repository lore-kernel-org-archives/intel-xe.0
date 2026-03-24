Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4125BF54AB0
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 13:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038A710E6D9;
	Tue, 24 Mar 2026 13:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R0fa3urE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8554210E6D5;
 Tue, 24 Mar 2026 13:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774360128; x=1805896128;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+h+Fp0rUYdOepLEjCFaZpH/29sN5LxYvCxuV4sS0EI0=;
 b=R0fa3urEmUdCFd5dqyLLJ6P/vLwwSZE9StRoMWcSjzLBYRsIvtFPcWRM
 gtIAaDphwEBEnoksxWRGkbexNnla/PUBRwx/r5WRNA/m9CgXgWetJ8v/q
 IzYqNeSYcMk8Pxo0BLLN6jVitLJk9nrx+lzc7zU5ECxu0OS1UBaLp87mY
 PKxwnjtPbaBcmaOCuY9QGfCmHwykPh6joLW9LSJsd4TG5rSlHgh4YkOFw
 NHt6KfnO/y+QGmSxaMuOgcDEoU9fWLIv6MTPItE5kW1Ki9obKJ2LLU+zQ
 fxSUChxwmKJnhYaeprH+72UZahreNVswnzyz6RZyIMBdCVL16hsVw5dBB w==;
X-CSE-ConnectionGUID: aQz8uxuQSjSEjVhR7ucyyw==
X-CSE-MsgGUID: YOPWMvqsQM+kf9/hEHnkWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75254799"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75254799"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:48:48 -0700
X-CSE-ConnectionGUID: gIKgDaPmRkir/N4T7e6ICQ==
X-CSE-MsgGUID: LCtExp70R9GVqxNJt4Np5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="224323783"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.220])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:48:47 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/9] drm/i915/wm: Watermark/SAGV fixes/cleanups/etc
Date: Tue, 24 Mar 2026 15:48:34 +0200
Message-ID: <20260324134843.2364-1-ville.syrjala@linux.intel.com>
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

Bunch of work around watermarks and SAGV. A few fixes, some
refactoring, and finish off by relaxing the SAGV requirements
on pre-icl hardware.

Ville Syrjälä (9):
  drm/i915/wm: Reject SAGV consistently when block_time_us==0
  drm/i915/wm: Don't compute separate SAGV watermarks for RKL
  drm/i915/wm: Consolidate SAGV pipe active/interlace checks to common
    code
  drm/i915/wm: Verify the correct plane DDB entry
  drm/i915/wm: Extract skl_wm_level_verify()
  drm/i915/wm: Extract skl_ddb_entry_verify()
  drm/i915/wm: Verify 'ddb_y' as well as 'ddb'
  drm/i915/wm: Reduce copy-pasta in skl_print_plane_wm_changes()
  drm/i915/wm: Allow SAGV with multiple pipes on pre-icl

 drivers/gpu/drm/i915/display/intel_bw.c       |  40 ---
 .../drm/i915/display/intel_display_device.h   |   1 +
 drivers/gpu/drm/i915/display/skl_watermark.c  | 292 +++++++-----------
 3 files changed, 117 insertions(+), 216 deletions(-)

-- 
2.52.0

