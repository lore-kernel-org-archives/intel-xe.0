Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0C5E7FDF5
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 21:44:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACF810E494;
	Mon,  2 Feb 2026 21:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbWDyVPS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC7D10E472;
 Mon,  2 Feb 2026 21:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770068659; x=1801604659;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=X3Jdk+aB7j8WBmvDYFK5IxhQRFVBJIfhTQQygLjXQiQ=;
 b=gbWDyVPScU0WKoUS43x54hSn5njyhOYi2Hqvgieh3jVP2V6yV6hfAQNh
 FBKaIPD1ZFyJA91ovugyD06MiGYM/i5WDJ26DDXRngr4kmqn3fHBCMsPV
 skjXqTAB372xKT4FAG3Yd9/u+nt0BpGTUJSN0iqNyBWMeR/fLRo0N7HjZ
 C+W55PswhblZ0660lM1jIif82s91dVlGVUGd21PKvPzU5YKl+peqmdaiy
 JQ/tNeqGCgXRwnQJxQ1bwAjeO48zQ1vBKa6ZxC7Y48XnXjav9FVdMf6YG
 6yQd7MiElmE1HJL6vbtKDqoFO+/s5dtP8LvZyABuDSWwH1WxcuSAOWG8W w==;
X-CSE-ConnectionGUID: Kt12GL8dR5+CJHmD82yZyw==
X-CSE-MsgGUID: j+lLuuznQUu4WnCPc9YBBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="58814352"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="58814352"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:19 -0800
X-CSE-ConnectionGUID: 3OodLMIwQk+dbYTbUdeWvg==
X-CSE-MsgGUID: 9ZFQLuFpSMGnUQq8qnNmxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="209646857"
Received: from smoehrl-linux.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.51])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:17 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 02 Feb 2026 18:43:15 -0300
Subject: [PATCH 09/16] drm/xe/xe3p_lpg: Extend 'group ID' mask size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-nvl-p-upstreaming-v1-9-653e4ff105dc@intel.com>
References: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
In-Reply-To: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

From: Matt Roper <matthew.d.roper@intel.com>

Xe3p_LPG extends the 'group ID' register mask by one bit.  Since the new
upper bit (12) was unused on previous platforms, we can safely extend
the existing mask size without worrying about adding conditional version
checks to the register programming.

Bspec: 67175
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index b5a7cc45f13d..19f053a7f9be 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -58,7 +58,7 @@
 #define   MCR_SLICE(slice)			REG_FIELD_PREP(MCR_SLICE_MASK, slice)
 #define   MCR_SUBSLICE_MASK			REG_GENMASK(26, 24)
 #define   MCR_SUBSLICE(subslice)		REG_FIELD_PREP(MCR_SUBSLICE_MASK, subslice)
-#define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
+#define   MTL_MCR_GROUPID			REG_GENMASK(12, 8)
 #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
 
 #define PS_INVOCATION_COUNT			XE_REG(0x2348)

-- 
2.52.0

