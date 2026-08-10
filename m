Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6002AC5AC82
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 07:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0FB10E6F3;
	Mon, 10 Aug 2026 07:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e1U+fhuL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888AB10E6E9
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 07:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786346305; x=1817882305;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m/U/GyGE2+e2RKvWTZyTF80fuYbsCfEQDS5h5GBDgyo=;
 b=e1U+fhuLvs4SfdwXxRGalL583GAgU4YhzUJRGmleym45QhpYvzSbw5Mk
 G3bDowFwEXiDld1A51tAqikf1O9hnKTOsHMls7Tpegl/Kvqx2IXeuXuvo
 IlNirS0Z0GXcPrK7s+Nko5yrwHImXoJRo7HDDSaZO6LVZncG1GYKQdr2Q
 /Gbq181atUo1fu6Gzy0ZZ3bvPjMkDsV2fYuXvNe2XIdh1cc18pcBBZxpI
 s69eHl6ih2jLHFNsgLIKYACxB+UKkPPKD9U1Od2HpcKut3Q/4bYw1CjAz
 gUHraBjZ4Nl34nx1ONxmbPFBWgApO15XZbB93Cp3T/sjL3YwFauXfsokU Q==;
X-CSE-ConnectionGUID: yVoq14hGSjC17jZsB73IKg==
X-CSE-MsgGUID: eNotH1sTTSaK4dlcxuDGSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="97507181"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="97507181"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 00:18:22 -0700
X-CSE-ConnectionGUID: 246FeAmgSKeK5HJK/GQqxg==
X-CSE-MsgGUID: GLN9W/MYTUymRvkFLjf0xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="287670594"
Received: from soc-5cg5233szh.clients.intel.com ([10.66.71.109])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 00:18:20 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: umesh.nerlige.ramappa@intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org
Cc: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v10 0/1] drm/xe: make CTX_TIMESTAMP TOCTOU-safe and handle
 sentinels
Date: Mon, 10 Aug 2026 07:18:13 +0000
Message-ID: <20260810071812.213358-3-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
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

Fix timestamp handling for Xe LRC contexts to avoid races and false
timeout detection. This patch documents and centralises the
CONTEXT_ACTIVE sentinel and makes MMIO reads of CTX_TIMESTAMP TOCTOU-
safe by verifying the LRC-stored timestamp before and after the MMIO
read.

Fixes: d243ef6a39c6 ("drm/xe/lrc: Refactor xe_lrc_timestamp to simplify logic")

v2:
Dropped the redundant second patch (Matt Brost)

v3:
Added the Fixes tag for the original commit (Umesh Nerlige)

v4:
Added Reviewed-by for the original commit (Umesh Nerlige)
Added Acked-by for the original commit (Matt Brost)

v5:
Fix incorrect 'From:' username in commit header (Kamil)"

v6:
Fix AI review comments from sashiko.dev
 - Fix torn read of CTX_TIMESTAMP from LRC
 - Fix ABA race on engine migration in context timestamp read

v7:
Fix review comments (Vivi Rodrigo)
 - Added Assisted-by coding assistant used
 - Removed extra comments
Added ldw check additionally to avoid torn read (sashiko.dev)

v8:
Fix git am merge issue with v7 patch series

v9:
Fix AI review comments from sashiko.dev

v10:
Dropped other patches and kept only TOCTOU Patch (Umesh Nerlige)
Updated commit message to include closes (Umesh Nerlige)
Simplified comments in code (Gajendra Uttamchand)

Gajendra Uttamchand (1):
  drm/xe/lrc: document sentinel and make CTX_TIMESTAMP read TOCTOU-safe

 drivers/gpu/drm/xe/xe_lrc.c | 22 ++++++++++++++--------
 drivers/gpu/drm/xe/xe_lrc.h |  7 +++++++
 2 files changed, 21 insertions(+), 8 deletions(-)

--
2.43.0

