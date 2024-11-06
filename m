Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A9DD59F7A
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 21:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9692B10E785;
	Wed,  6 Nov 2024 21:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NlasH6t1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B6110E784;
 Wed,  6 Nov 2024 21:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730929974; x=1762465974;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gblMFi7k1ciNl7gDnJeDgveJoXp/r65q6MhSu3U/WNY=;
 b=NlasH6t1NCLt3OiIiQSf6sc3dyfVwkppXmXg+4Ca5tR0Kk2hjjdwmGo5
 q4WgD4thUrEy+ztojcC/yMCGEbipqBWy5EMZ050WSQYOr4qlpvagGRLuj
 Tkq42cPoA+QGsPCCzNmXMXX3s7Og5/riFP7aA23ap0gU9NKukKxzYvNvT
 /Udb9Owgm8Al7VPrRnwiIaM6ESDPIJGxQNkwAvU/bWxZUQGevVKUDnnKK
 WFURvtPYicMcwQQPDix+uqOBQAJea6v0KHWianMVIAgR/AFE1ml94DeCO
 eSrbQfxNmyxMIPINqRLInaaZaJ3oB8kNUAPRIjNnv8XORGFdzcsvffr+U Q==;
X-CSE-ConnectionGUID: zxVxX1TeSOCp4abaJC9XXw==
X-CSE-MsgGUID: Ru8k3mF0SraWChuzJKAbxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48212163"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="48212163"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 13:52:53 -0800
X-CSE-ConnectionGUID: 6OB8XN3qRv6XYe8iN5CbvA==
X-CSE-MsgGUID: Z3pU3/wWSQySm+MugHGJ0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="84882476"
Received: from puneetse-mobl.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.110.118])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 13:52:52 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 06/17] drm/i915/dmc_wl: Use sentinel item for range tables
Date: Wed,  6 Nov 2024 18:50:32 -0300
Message-ID: <20241106215231.103474-7-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241106215231.103474-1-gustavo.sousa@intel.com>
References: <20241106215231.103474-1-gustavo.sousa@intel.com>
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

We are currently using ARRAY_SIZE() to iterate address ranges in
intel_dmc_wl_check_range(). In upcoming changes, we will be using more
than a single table and will extract the range checking logic into a
dedicated function that takes a range table as argument. As we will not
able to use ARRAY_SIZE() then, let's make range tables contain a
sentinel item at the end and use that instead of having to pass the size
as parameter in this future function.

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc_wl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
index e837c39491bb..1753c334f3fd 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc_wl.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
@@ -53,6 +53,7 @@ struct intel_dmc_wl_range {
 
 static struct intel_dmc_wl_range lnl_wl_range[] = {
 	{ .start = 0x60000, .end = 0x7ffff },
+	{},
 };
 
 static void __intel_dmc_wl_release(struct intel_display *display)
@@ -104,7 +105,7 @@ static bool intel_dmc_wl_check_range(i915_reg_t reg)
 	bool wl_needed = false;
 	u32 offset = i915_mmio_reg_offset(reg);
 
-	for (i = 0; i < ARRAY_SIZE(lnl_wl_range); i++) {
+	for (i = 0; lnl_wl_range[i].start; i++) {
 		if (offset >= lnl_wl_range[i].start &&
 		    offset <= lnl_wl_range[i].end) {
 			wl_needed = true;
-- 
2.47.0

