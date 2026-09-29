Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2356CCA5FA1
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 09:45:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC40110EDF2;
	Tue, 29 Sep 2026 09:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZB9s6r/f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2062C10EDD5;
 Tue, 29 Sep 2026 09:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790675104; x=1822211104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ja/YuURfL/2mxMrcSCx4I35STmsYln5TBCCqoFunyEg=;
 b=ZB9s6r/fLlijICEbkjGShWW+YK9OfzR0cOwBOpJJGxRJ/GRCOCvl03Wl
 grYnx/xlogvrGAHFjfrkuScePeEFy3UJNuvsLgaoo/qvpUy9lCaSOw0ho
 7+FgnVGLK3W6TDUB5gvoUVmWtPM5UO3MFCFzj3miP9F96X8/D5n3y8m20
 IS+OjUSizQeg9/XoUpMcWs8np/LykFsSrWCX0BgaLMePjXwMAUDZQQ0zv
 fW4xnINpXCVsx7tDJQ9DC3y1NUdjGD/u7pEVK2RDyk/aRh6Cmo4mROo6b
 MPouBACIHdtmWeQdw8cVMouPnX2vy+9Xnxeq9B8Efltp7H3bNbRRA0MN6 Q==;
X-CSE-ConnectionGUID: 5CzVanlOSwuF7ozmqkHkfQ==
X-CSE-MsgGUID: JV6Ii1wvTw2zzOEHJFeKGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91250070"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="91250070"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:44:58 -0700
X-CSE-ConnectionGUID: H4D21wLrQXaJEtW2jcnVNQ==
X-CSE-MsgGUID: E8KJAXsLTAGYWdXDJcGwLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="283414995"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.120])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:44:56 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 4/8] drm/i915/psr: Fix SFF and CFF CTL register bit definitions
Date: Tue, 29 Sep 2026 12:44:30 +0300
Message-ID: <20260929094434.77129-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929094434.77129-1-jouni.hogander@intel.com>
References: <20260929094434.77129-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Single full frame bit in SFF_CTL and continuous full frame bit in CFF_CTL
are bit 0. Fix the definitions accordingly.

Fixes: 3b5bf853e309 ("drm/i915/psr: Add register definitions for SFF_CTL and CFF_CTL registers")
Cc: <stable@vger.kernel.org> # v6.15+
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr_regs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/drm/i915/display/intel_psr_regs.h
index bb577e7e3bbda..a57bc111290d1 100644
--- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
@@ -254,12 +254,12 @@
 #define _LNL_SFF_CTL_A				0x60918
 #define _LNL_SFF_CTL_B				0x61918
 #define LNL_SFF_CTL(tran)			_MMIO_TRANS(tran, _LNL_SFF_CTL_A, _LNL_SFF_CTL_B)
-#define  LNL_SFF_CTL_SF_SINGLE_FULL_FRAME	REG_BIT(1)
+#define  LNL_SFF_CTL_SF_SINGLE_FULL_FRAME	REG_BIT(0)
 
 #define _LNL_CFF_CTL_A				0x6091c
 #define _LNL_CFF_CTL_B				0x6191c
 #define LNL_CFF_CTL(tran)			_MMIO_TRANS(tran, _LNL_CFF_CTL_A, _LNL_CFF_CTL_B)
-#define  LNL_CFF_CTL_SF_CONTINUOUS_FULL_FRAME	REG_BIT(1)
+#define  LNL_CFF_CTL_SF_CONTINUOUS_FULL_FRAME	REG_BIT(0)
 
 /* PSR2 Early transport */
 #define _PIPE_SRCSZ_ERLY_TPT_A	0x70074
-- 
2.43.0

