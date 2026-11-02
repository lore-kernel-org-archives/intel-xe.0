Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF3F606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 10:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DNCELma4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CAB10E5D3;
	Mon,  2 Nov 2026 10:01:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B8E10E5CD;
 Mon,  2 Nov 2026 10:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793613666; x=1825149666;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1DkADTmSrES6Oy4S3+VUiHyS0tpIBEVIXCettri5kfo=;
 b=DNCELma4KXqFMagAEPOV3ozFMZvzEzBOa1mzYRnEG/eBghX5sD6s/vNn
 HN8VEBcPxe6Dw6sJkvTUaqyX4/zYmboIaihNu2YoFL8kje27F3/LnwKRa
 8fGUBLy693Et+18tuWt3CDg2Q8+cbH0USVzOq9ctCyiRrAxlCISGfuohV
 6yk8lHMSnpBvm/4D3KgGaHsKC8FsO+u0ttGGqpBMqNC1hGwb1W3oFkErH
 /XB1hfMi9/J3rIN9VgrzPZgX0kssmV5sS8UsVNdIobXbK1Xzi6w4vIbyZ
 PoVaakzB0vaYXLEvjdGC2pk8Z9XO/wnZbwevR3VTHnnx0l+xhzjt/rfki w==;
X-CSE-ConnectionGUID: fFjMPGRsRX+o2bs7bcpaMQ==
X-CSE-MsgGUID: I7gKR2DISLGzihEv0voU3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2204569"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2204569"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 02:01:06 -0800
X-CSE-ConnectionGUID: qEUhlbUNSd6s0ve+TzQ5Tw==
X-CSE-MsgGUID: MCsTFYMlTWqThqzkaMyTgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6068263"
Received: from bradocaj-mobl.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.122])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 02:01:04 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v2 0/4] Frontbuffer tracking fixes
Date: Mon,  2 Nov 2026 12:00:47 +0200
Message-ID: <20261102100051.272137-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two frontbuffer tracking paths can leave display power saving inactive:
flip flushes may not re-arm PSR, and fbdev updates may leave busy bits set.
Re-arm PSR after every flush and flush fbdev updates once
complete. Former scenario is also leaving CFF bit set on older
platforms. Fixes for these are in this patch set.

Also fix for problems with Panel Replay full frame update issue on
cursor update is included in this set.

v2:
  - Clear CFF flag
  - Add old related cursor update patch

Jouni Högander (4):
  drm/i915/psr: Flush on cursor update also when not using Selective
    Fetch
  drm/i915/psr: Re-arm PSR after flush
  drm/i915/psr: Clear CFF state on flip flush
  drm/i915/display: Flush the fbdev frontbuffer

 drivers/gpu/drm/i915/display/intel_fbdev.c | 13 +++---
 drivers/gpu/drm/i915/display/intel_psr.c   | 46 +++++++++++-----------
 2 files changed, 31 insertions(+), 28 deletions(-)

-- 
2.53.0

