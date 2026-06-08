Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB48CD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 06:30:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C94210ED76;
	Mon,  8 Jun 2026 06:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hEqMl7aT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5A810ED74;
 Mon,  8 Jun 2026 06:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780900221; x=1812436221;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fowjj0KLtFEBDohmb8i4ym/D7ypkc91SdYzeoDlOYzc=;
 b=hEqMl7aTBxiynZk1IHHWmgDRBi9YpDLnpkO2Rz4u036WFgFUhl+BezYI
 1Cv9OKAKYGlLKZyoEQWIWtDgPUzkV41QyOwKycJyItgfjaO3mqZU7DYh2
 0/qWurXBu0lcudMZVe0g9VoDXEXD4/+cPIVFbp39Ha/Qyvkwvwu8YTEIJ
 XYdsFs6LYIr0cz79vEbPHlw96JpHPHhR3j36Gj3qpSFBg+IPQDc8vtcuT
 KtkpKnxM6ovJZZtfAr611oqiVrAb0NuVvCpa3hYAzC9KUC4bYcV4uvP27
 ktqrqMXwaDEZTuE20NIiecooRhdwo49mEDgUaa57qxiKeKELnKo/Zvg7s Q==;
X-CSE-ConnectionGUID: fODzdTCvThCoc3RlA5KnRQ==
X-CSE-MsgGUID: X4o8dmZvSjKW3+SqQ4riEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="85482614"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="85482614"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 23:30:21 -0700
X-CSE-ConnectionGUID: +foNFU3YTNG8The/1A6n0Q==
X-CSE-MsgGUID: Nh2DIdRxRmWKOM2p4CUk0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="269158507"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa002.fm.intel.com with ESMTP; 07 Jun 2026 23:30:20 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 0/6]  Enable joiner cursor fast updates
Date: Mon,  8 Jun 2026 11:56:23 +0530
Message-Id: <20260608062629.820477-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
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

     This series enables the cursor fast path for joiner mode
and adds the missing secondary-plane handling to keep updates
correct and synchronized.

Nemesa Garg (6):
  drm/i915/cursor: Check joiner cursor commit status
  drm/i915/cursor: Add helper to update cursor plane
  drm/i915/cursor: Handle secondary cursor state
  drm/i915/cursor: Sync joiner secondary cursor state
  drm/i915/cursor: Program secondary cursor planes
  drm/i915/cursor: Allow joiner cursor fast path update

 drivers/gpu/drm/i915/display/intel_cursor.c | 281 ++++++++++++++++----
 1 file changed, 235 insertions(+), 46 deletions(-)

-- 
2.25.1

