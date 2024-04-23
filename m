Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C72C19F4E
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 18:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79E4113563;
	Tue, 23 Apr 2024 18:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kamDJfzH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698D2113560
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 18:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713895494; x=1745431494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m5hW6WU/xZsk/T8SohKuxSL0EG9qooj2XRWSQm0HyiU=;
 b=kamDJfzHW8WRhL74nc4Dljy9jeqlRCvvHHo8E8qw7pB1KYtOWoHr86Vd
 yjAuj9X5xxXBJ25HhXO4UtgPlwQUnsS7RmAYleGLx5y62V/LTpu3RyYui
 3sfmnl8bYOvgbeyvGSCr9+o3HaQai/LY+h315XrwVxGkIBhkQN7qmXRYI
 hhdvGQqSLpMQwpdST938iiUBiJlnegEcYP0g2GSmLPqtaYFT8/WFghmI9
 rjiME9Cd0RXE/WaZGztsX6Oir8etb8ijMSuwJ7BXW0+U4j+zeja+85sVF
 U8V7j25nxiwPsIffZtCIQghvNSLDpV6NcCyB1/G6nFEpMvxTaTZmg6SdY Q==;
X-CSE-ConnectionGUID: noftwUnuQzOaQ2qyUubSPQ==
X-CSE-MsgGUID: RILbuZGMTMy6Kio3m/m95w==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9363502"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9363502"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 11:04:53 -0700
X-CSE-ConnectionGUID: 5qZvFzyQTG+1A9p+cc//+A==
X-CSE-MsgGUID: UgvaMgAFQAOPebWS0NvDAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29105566"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.48.128])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 11:04:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 3/5] drm/xe: Add few more GT register definitions
Date: Tue, 23 Apr 2024 20:04:34 +0200
Message-Id: <20240423180436.2089-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240423180436.2089-1-michal.wajdeczko@intel.com>
References: <20240423180436.2089-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

While we are not using these registers right now, they are part
of some runtime register lists that PF driver share with VFs on
some legacy platforms that we might want to support as SDV.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 94445810ccc9..6eea7a459c68 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -173,8 +173,11 @@
 #define   MAX_MSLICES				4
 #define   MEML3_EN_MASK				REG_GENMASK(3, 0)
 
+#define MIRROR_FUSE1				XE_REG(0x911c)
+
 #define XELP_EU_ENABLE				XE_REG(0x9134)	/* "_DISABLE" on Xe_LP */
 #define   XELP_EU_MASK				REG_GENMASK(7, 0)
+#define XELP_GT_SLICE_ENABLE			XE_REG(0x9138)
 #define XELP_GT_GEOMETRY_DSS_ENABLE		XE_REG(0x913c)
 
 #define GT_VEBOX_VDBOX_DISABLE			XE_REG(0x9140)
-- 
2.43.0

