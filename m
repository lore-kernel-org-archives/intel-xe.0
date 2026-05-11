Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8E4CD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 12:46:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF8C10E705;
	Mon, 11 May 2026 12:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZOMtKRB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D59810E701;
 Mon, 11 May 2026 12:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778503610; x=1810039610;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zvrr48OqUDaLHhyYTx2+OHP2UoSL42OjMwXHoN/F3I8=;
 b=PZOMtKRBiwEdhlXZUpc0Ahm23RT8qGqYIRIvLPIsr6gmk+cPJE66cRU+
 gQiGsrwXO96Ct+kjZ6rWW3PKEzt9hSjvJYbD0fKEwH7g9kwDUviAtmjir
 UNK8/nCiA1PnC3gJ5C8j33QXISVwwwe4EQ7Ixft7tqgI/ymJxlZ8WWAL/
 8NW0V9HO9x+mWX08i8JRZ4INgYXW74k1tZa+AjrrVhGLWJphmz4nQqAti
 5BkHiVqj4mh1AySXLbIq5pQOK9pLyGpCCsag5isjvzIVOz0hw6ntjNshF
 3ThT1l4ZsYRMtD7vY8/bwwY4pNgMwH84pE8CA/STWvKQTUn43OSToF8WX w==;
X-CSE-ConnectionGUID: NMQ0XxkPREaKolUjHV5yuA==
X-CSE-MsgGUID: ORBnd0lXReiSeTh2ZmR5Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="90764811"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="90764811"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:46:50 -0700
X-CSE-ConnectionGUID: lfTTsMjASH6SoLdYNVYwhw==
X-CSE-MsgGUID: Q2cPZT5fSUCrN/KpO253MQ==
X-ExtLoop1: 1
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:46:48 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, mitulkumar.ajitkumar.golani@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 0/4] drm/i915/dp: Adaptive Sync SDP readback fixes
Date: Mon, 11 May 2026 18:02:14 +0530
Message-ID: <20260511123218.1589830-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series is a spin-off from the original series [1] addressing AS SDP
handling for Panel Replay and VRR.

It fixes target_rr readback and improves overall Adaptive Sync SDP
readback handling.

Split out for easier review and merging.

[1] https://patchwork.freedesktop.org/series/164512/

Ankit Nautiyal (4):
  drm/i915/dp: Fix readback for target_rr in Adaptive Sync SDP
  drm/i915/dp: Use revision field of AS SDP data structure
  drm/i915/dp: Set sdp_type in AS SDP unpack
  drm/i915/dp: Include all relevant AS SDP fields in comparison

 drivers/gpu/drm/i915/display/intel_display.c |  6 +++++-
 drivers/gpu/drm/i915/display/intel_dp.c      | 10 +++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)

-- 
2.45.2

