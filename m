Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732C9C83F17
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 20:29:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3612410E194;
	Fri, 18 Jul 2025 20:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ra+tSZtH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E474C10E194
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 20:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752870594; x=1784406594;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ppGcmXUW/g9BxxotVjh5I9TE+C0I6iDtelgbRm9tt/0=;
 b=Ra+tSZtH1Ztjf45qkYrHELp5H4+0u2H3g07HQAwGDdEjtbj+lQ6nj+Vg
 cG8Osvaor1hS/LCMmszAfOeblIglhbDsjYRa4Ay/CsrjIhnNzUdwfedj+
 rLOlid4aHviuJjRYYgoVVNyX9+dcovnfJweKIPKH+3x7dlDsxadfHufVA
 DW9s7WtbC3srht53E1aQWN6eNBALJgVERVnVWfSRl7XoFm8ShNTAW01vv
 OOZNhQCThfTBn9RmZab0thY960DUO4O5fvR2xIUebRAw6pO1vMad9kmgD
 0ZcpfPdiLCMGhHYSQsQwvfrmm5npF0nuCvAXgfkA/bAcwmTUrfIAD5jeO w==;
X-CSE-ConnectionGUID: 005oVQuMShCLDoqeT8j15g==
X-CSE-MsgGUID: oAHZ9ytOSpi1yGyRG/s/Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="58957013"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="58957013"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 13:29:53 -0700
X-CSE-ConnectionGUID: CgKfl3KZTDyFEJTp11YMzw==
X-CSE-MsgGUID: tvNaRJeGTIO7zGHgVPEuQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="162700498"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 13:29:52 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 1/1] drm/xe: Remove unnecessary EU stall debug message
Date: Fri, 18 Jul 2025 13:29:47 -0700
Message-ID: <dfb6a080b3442d481c567489aabe47e72f3e784c.1752870172.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
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

The EU stall debug message may cause CI to complain on
unsupported platforms. Remove it.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 56ef3ee2806f..44d44bbc71dc 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -749,10 +749,8 @@ static int query_eu_stall(struct xe_device *xe,
 	u32 num_rates;
 	int ret;
 
-	if (!xe_eu_stall_supported_on_platform(xe)) {
-		drm_dbg(&xe->drm, "EU stall monitoring is not supported on this platform\n");
+	if (!xe_eu_stall_supported_on_platform(xe))
 		return -ENODEV;
-	}
 
 	array_size = xe_eu_stall_get_sampling_rates(&num_rates, &rates);
 	size = sizeof(struct drm_xe_query_eu_stall) + array_size;
-- 
2.48.1

