Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C586F10FC462
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 23:44:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A6910E70B;
	Wed,  8 Apr 2026 23:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fHQK9oIL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1695110E6FD
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 23:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775691869; x=1807227869;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=J9SGbtYTBtYhwqtU2UK+IKWL1tGgnbPy4e4O8sgefxg=;
 b=fHQK9oIL7JKoQwIH/eBIgVgVWHP2X/+gr2VLL0k6wbIFYLa8tNF/Q98g
 +WqSzQuMIsc34S5Qr+SnmAXFK13tIH3eep6C+p8lsDZ6+Q1Rl7SpNMe+r
 +xqu/WomqsMbAgbjrCX90fCeUQsGjSuKhy4vcV4IDSuvzTsRUoyLw4QMH
 3AW3mW/AGJ1iFiDYf5HNgm/wlBeCXi0UhTb8BbK+gHKeWz9cUp962lYv3
 sNOyjxZ5/wxBM8tioedLThAtJgk21m/Pn8BL1G13yd8ohnGBRqHwA2I5y
 MEaYckMqJYoiveKOIg9wy9VHz2u4VHP8de63Q2jFTKxuYBYqQVFxjIS8Z Q==;
X-CSE-ConnectionGUID: yzvIfZVhQf6GC34MIt9Qnw==
X-CSE-MsgGUID: mTMTn0IKShe+jx7lqpk0Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94272799"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="94272799"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:28 -0700
X-CSE-ConnectionGUID: esNeBVLoRiGp96cue1t8Eg==
X-CSE-MsgGUID: sNHsdo67S8iIsgj5X9AahQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="227616916"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 08 Apr 2026 16:43:04 -0700
Subject: [PATCH v2 05/10] drm/xe: Add WHITELIST_RO macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-oa-whitelist-cleanup-v2-5-db4a06aae8b0@intel.com>
References: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
In-Reply-To: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=J9SGbtYTBtYhwqtU2UK+IKWL1tGgnbPy4e4O8sgefxg=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp1uhamKZlO5NIoaeBuvg91ozsd06nn6gIdTVT2
 DuPk6wLHMOJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCadboWgAKCRBNeSQFyHKQ
 BBrFEAC6o3oufaaBWCo9ZRSno05ucMdUSmRgJy5NxsB7j37wwUE4n2UZPSek9XbkKw3vob+CtHh
 zFsq+CmW8mQLp7psjMEW7OUboxT0lZEmcmjVmRXShYQzjncXCTYcoAAIN4r9KmQk1+b3JGetvx+
 293VwlovKrPo3JomuXht4iTA2SZFnOuNH0Ktizt6kjKr92kNUG0fSwcmNoiGzp3wbxL1eR7EP1K
 x3U27mNoCJDYsOGGopHT048yu1cOOHwLHDKG7dpi0G+hzWAx8mjBkSSM4qu1W0BL4AjxxuR+Tt7
 H3vNc8cI6FKGr2FB0dasGdU5vK2S4JBmtZb8GVERfu0d7kk50owu+jMiHiXCJiw5ap0Wr/qkIjs
 87PGa+pWHuTU3Ub8g9Af9oIlfiqcDXRjRf3qEF40dhxERZyA5B51jirmf/QNW47nBTt2FmiEt0o
 L8D5qoCbmEFRYP/wqNrJskdHLCBu+/yl81PK6rye+VZIrMSHpdExu3uiNMSCJfYvig3mlI5wD8F
 8bRFqQsEnBdmBq6Z9gN30eXv9AyK6P1SEShzx6rmQdzdB6Bbj0gwOgJIow+8xbnvDubXFaGS86b
 7kvou9Upo2uk2d+JHAtgk3vVT18CfC0tzBdQRbAdJjyEPIMlJQxv/cuon5sJryUjIgl8SXPh5ug
 m1zgl3VNB0k3fKA==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Passing the full RING_FORCE_TO_NONPRIV_ACCESS_RD flag name to every item
in a long list of whitelist entries can make the lines very long and
hard to read.  Create a shorter WHITELIST_RO helper macro that can be
used in cases where we want a read-only entry with no additional flags.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 423370afab73..d6f8f907ddaa 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -98,8 +98,11 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
 	},
 
+#define WHITELIST_RO(reg) \
+	WHITELIST(reg, RING_FORCE_TO_NONPRIV_ACCESS_RD)
+
 #define WHITELIST_OA_MMIO_TRG(status, head) \
-	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
+	WHITELIST_RO(status), \
 	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
 
 #define WHITELIST_OAM_MMIO_TRG \

-- 
2.53.0

