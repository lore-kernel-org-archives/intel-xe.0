Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C55DEE6B6B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 22:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2419D10E95A;
	Fri,  6 Feb 2026 22:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xwea8kPp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7801210E958
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 22:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770418598; x=1801954598;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6ZsU/tZH7XqvUd8xzFj5jmQQ6FHpmIzsk45idpCB+sQ=;
 b=Xwea8kPpwqt+qzvEnGQ0rvF/zQ5dGVW9j11j6o4Adt7LEIndHiSi5yBB
 Y8zjHkdK6FPHjCfldJNs3WnhKBxd1dZpz/TcPv7p3M5PkxB0Utt8a49ZU
 zrbJxIRyCrZNU4oCvx6WXJiPp3RVAhbdWVflnYeUJMpDfvsbbBjvQr8dR
 vP7VO2td07psyx0IEt7pDVY+1PHNkSgCanIAy0NTgqnfyvK/3ljd5lUbz
 7Amg/zeldy+mbhI8bpqDBTZ174ktN59IQxTnv+KxK0TccDg3f6ZY0gZ6E
 btw6rAe8nSiA+h/AiGTzTvyEAbsex/RIT5yd64qNCpq4NNkvP5grEtdKU Q==;
X-CSE-ConnectionGUID: 7SzDmKvyQ8S5kZlqm0Zu6w==
X-CSE-MsgGUID: 64f59T7wTOeB9Ty9Hs6cDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71351664"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="71351664"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 14:56:38 -0800
X-CSE-ConnectionGUID: v/Wl7k4gQ9Wa/nj1npkfjA==
X-CSE-MsgGUID: mqIr2/W0TLmvcIhA9gRF1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="210762219"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 14:56:37 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v3 2/3] Reapply "drm/xe/xe2: Enable Indirect Ring State
 support for Xe2"
Date: Fri,  6 Feb 2026 14:55:23 -0800
Message-ID: <20260206225610.3232909-7-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260206225610.3232909-5-julia.filipchuk@intel.com>
References: <20260206225610.3232909-5-julia.filipchuk@intel.com>
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

This reverts commit 03d85ab36bcbcbe9dc962fccd3f8e54d7bb93b35.

Previously this was reverted due to failures on LRC context switch.
Issues should be root-caused and resolved with GuC WA 14025515070. Now
setting indirect ring state is available by default.

Note: Will be cleared if WA not available due to older GuC version.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 42f15cd394f6..2b8d2a2e81d7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -100,6 +100,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 #define XE2_GFX_FEATURES \
 	.has_asid = 1, \
 	.has_atomic_enable_pte_bit = 1, \
+	.has_indirect_ring_state = 1, \
 	.has_range_tlb_inval = 1, \
 	.has_usm = 1, \
 	.has_64bit_timestamp = 1, \
-- 
2.51.0

