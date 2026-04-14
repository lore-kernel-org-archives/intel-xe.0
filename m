Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3EEF531EE
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 03:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF6410E115;
	Tue, 14 Apr 2026 03:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FLNQtXO+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAFB10E09C
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 03:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776138769; x=1807674769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RLAiZFqt6uwWWAXS4oOoctTWgtk3TfUW8+MAD1onYfw=;
 b=FLNQtXO+i3/CF25FxAqrOTAXa+UGGcK8bzGROwwVRC4a+3ZFPhK9NqVt
 rjFZI7ozbcpCYaYv6fUdQ9yXaRHvnim/4hoNA7K/2N4xixyS36s1YVG1V
 2ZYXm1z4/WrqzNuI5tl5WquQE3f5iLYJ9y+kV7oRetSfYj+LrVwWv6cIQ
 a9XICZHzP+cY24TouMPINfPC5FfAPTJcSHpTXQkhN1AKGYn6vZOQg3ylq
 utP6LFfOVrR/kiL0J6QGI5/fkI6GtyLEtfmYDMDVr+c3dfv6u+9V4IObI
 lG3XrVmMdJdaCQxTi7v8k9WGvHRjRB3ud0vksDkLJNbNT3TIAkEUF5jQF g==;
X-CSE-ConnectionGUID: sD+XsUaCQPSt2Jtojjyx8w==
X-CSE-MsgGUID: ApUj9nFaR2u+ThdD3TjyJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77050330"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="77050330"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 20:52:48 -0700
X-CSE-ConnectionGUID: r9zg1z+aRMyF77rykBYBXA==
X-CSE-MsgGUID: 0pTrpp9uRgSlnwotd1c94A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="225667134"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 20:52:47 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 2/3] drm/xe/rtp: Don't whitelist OA head pointer registers
Date: Mon, 13 Apr 2026 20:52:43 -0700
Message-ID: <20260414035244.741342-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260414035244.741342-1-ashutosh.dixit@intel.com>
References: <20260414035244.741342-1-ashutosh.dixit@intel.com>
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

OA head pointer registers are not used by UMD's and do not need to be
whitelisted. Only MMIO trigger, tail pointer and OA buffer registers need
to be whitelisted. OA head pointer is sometimes provided to the
WHITELIST_OA_MMIO_TRG to have the correct register offset alignment for
RING_FORCE_TO_NONPRIV_RANGE_4.

Fixes: ed455775c5a6 ("drm/xe/rtp: Refactor OAG MMIO trigger register whitelisting")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index a4124f00c467f..09dcb6a422797 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -90,9 +90,9 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
 	},
 
-#define WHITELIST_OA_MMIO_TRG(trg, head) \
+#define WHITELIST_OA_MMIO_TRG(trg, tail_buf) \
 	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
-	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
+	WHITELIST(tail_buf, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
 
 #define WHITELIST_OAG_MMIO_TRG \
 	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OAHEADPTR)
-- 
2.48.1

