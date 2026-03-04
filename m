Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399EFEDEBF7
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 00:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0234B10E8FF;
	Wed,  4 Mar 2026 00:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iPeh5lz0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D94910E8FF
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 00:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772584484; x=1804120484;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kXs2yFjiUtBkC6coOaej3X1Er6GWksLoOnJmnJVf69c=;
 b=iPeh5lz0C8nott6S5FqnIO6K7pwoGudd3DESS6mJzkT1QzFvWIFHgwEI
 8VuwV8WTfdX1TNXXq116xNQR98ocI+ZZCp8rG/8Q54Ve28bRwddlRVd6b
 CSvKF94qM28wUqZwccfETMkoFTdam+4sTTnnfgNne/sqMQh4vSbotdZnj
 PlzjoxRJJzCyk7o9/QDxv6/pRLG7o8Yl4V/ct13YkebPB8THa8gTUHJSx
 vKRD64ygW9PlA2aVqFSwThWfSJxYcWvTiMQoILh2mtNL6ldZA97si8Sn0
 PFgBRJSVQsnQQnkBq+BR+dmxBHEtK1TEYTMK/fVE+kuqQa2cCbk/34xV4 g==;
X-CSE-ConnectionGUID: WJjNdGCeScuHge4dlXtaHA==
X-CSE-MsgGUID: vILs5VNvTKyO/3Dywn/Cyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73546077"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73546077"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 16:34:44 -0800
X-CSE-ConnectionGUID: wT9Bcjh6Ra+talFfIfHZQg==
X-CSE-MsgGUID: C2nGrnB5R9eDR/7T4xHn8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="248651601"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 16:34:42 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v8 0/1] drm/xe: Enable Wa_14025515070,
 Enable indirect ring state for XE2+
Date: Tue,  3 Mar 2026 16:34:23 -0800
Message-ID: <20260304003431.758201-3-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
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

Enable workaround 14025515070 to fix idle command streamer state on
context register. This allows user of indirect ring state on XE2+
platforms. Currently only enabled by default on XE3+, can be enabled for
XE2+ if ever needed.

v2: Enable for GT 20.04. Use range for media versions.
v3: Shorten KVL name, notice. Correct versions for WA. (Daniele)
    Reorder revert and applies for correct bisect. Added explanations.
    Add additional macros for XE_RTP_PASTE longer expansion.
v4: Move indirect_ring_state disable earlier in init cycle. (Daniele)
v5: Remove extra lines.
v6: Check against submit guc version. Formatting. (Daniele)
v7: Remove enable of indirect_ring_state for XE2+
    Check for Wa before clearing indirect_ring_state. (Daniele)
v8: Style correction. Add Reviewed-by. (Daniele)

CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>


Julia INTEL (1):
  drm/xe: Enable Wa_14025515070

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc.c           | 8 ++++++++
 drivers/gpu/drm/xe/xe_guc_ads.c       | 3 +++
 drivers/gpu/drm/xe/xe_rtp_helpers.h   | 2 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 7 +++++++
 5 files changed, 21 insertions(+)

-- 
2.51.0

