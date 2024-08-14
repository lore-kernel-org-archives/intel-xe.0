Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38586C3DA4A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 09:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0572E10E1F9;
	Wed, 14 Aug 2024 09:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxRtDSPk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D36310E1F9
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 09:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723629250; x=1755165250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GQ32WQ9XV7CumN2MwxfHDJ1sz+xRFhO7jhbcWg4YlOs=;
 b=hxRtDSPkvRAfdmCMnOIvlsdoetLdYQQ6P8/Sq887RpXibtg6UUsfURZx
 ol+2wzqGpGX9YxCKeoicLLvdce/4MeTbICoUI3lqXVybsaa1JaL7JdVn7
 aQ1Uu8AmG7xjT5BYTHgOWNHNsn2QYAw5aThwpzP6OioXuE0IH5WZBsIrs
 rcOXSa62MUb2FtTrvlNS9VES5/9fzCiWyHPc0t1Laz0Wk28q6WFkHM/JX
 IeHc5aqp+QSwyeaKLOkwxJJKi6t0wwDQnku6lX0tnyMtWJryxe0Gz59QI
 7ePOZOJHiyUpT/nguKB4bF2xrePiMMK0CFetsXqbgqsw0bXrGc5JIJ1b7 Q==;
X-CSE-ConnectionGUID: LzhSjZDHT2STqT1GiKV3eg==
X-CSE-MsgGUID: lAH0PNmoS4OYV+QkH9oNEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32510057"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="32510057"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 02:54:09 -0700
X-CSE-ConnectionGUID: ieJFGKHmSm6wyNeevpEg4g==
X-CSE-MsgGUID: UOL1q3i6SFinGTyoTmc/DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="63624183"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa004.fm.intel.com with ESMTP; 14 Aug 2024 02:54:07 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2 3/3] drm/xe: Define STATELESS_COMPRESSION_CTRL as mcr
 register
Date: Wed, 14 Aug 2024 15:26:14 +0530
Message-Id: <20240814095614.909774-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814095614.909774-1-tejas.upadhyay@intel.com>
References: <20240814095614.909774-1-tejas.upadhyay@intel.com>
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

Register STATELESS_COMPRESSION_CTRL should be considered
mcr register which should write to all slices as per
documentation.

Bspec: 71185
Fixes: ecabb5e6ce54 ("drm/xe/xe2: Add performance turning changes")
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index aeb17fcb27ac..0d1a4a9f4e11 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -80,7 +80,7 @@
 #define   LE_CACHEABILITY_MASK			REG_GENMASK(1, 0)
 #define   LE_CACHEABILITY(value)		REG_FIELD_PREP(LE_CACHEABILITY_MASK, value)
 
-#define STATELESS_COMPRESSION_CTRL		XE_REG(0x4148)
+#define STATELESS_COMPRESSION_CTRL		XE_REG_MCR(0x4148)
 #define   UNIFIED_COMPRESSION_FORMAT		REG_GENMASK(3, 0)
 
 #define XE2_GAMREQSTRM_CTRL			XE_REG_MCR(0x4194)
-- 
2.25.1

