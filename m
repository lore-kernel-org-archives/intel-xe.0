Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C97C07548
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 11:38:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B26F10E542;
	Wed, 15 Nov 2023 11:38:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F07310E500
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 11:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700048282; x=1731584282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nAe41v7sVJrDbDksGomWf2cBfm0L75FOr0CL66MhwrE=;
 b=iBGFNpS7l0JV8r+ArCsFsFBFPkm8+R7x6WGSMRZ5l4nMdmvEdBImLVSB
 a8okAU6yKIUoj8VdUezo/ipXxEYJSMfGUNEyRh0O9ZVWGTmXFsySE04J2
 /GtGYTNF6jj6PxHZFkc38abkF1dB6DIqjAPQZyFI9bIuTwusG9CSU0lXn
 d6kiYHGEim+Ly1wH3t7HPhI8S+OWctPTSspS7Ku+MUIR7W6EB2ah6Tvs+
 TDFAzr6/udmft83DetyAqlPWDT3hw/jcn36DWb4dk3Va/O9Ol6jmmHpfl
 0yYFfwOjHAsSZNTUowqc6L14ETNLDR+1DgQa/wPzpDbfleB1/MtYEbAzf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381255311"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="381255311"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 03:38:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="714863089"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="714863089"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.24])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 03:37:59 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 12:37:46 +0100
Message-Id: <20231115113748.1949-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231115113748.1949-1-michal.wajdeczko@intel.com>
References: <20231115113748.1949-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] drm/xe/guc: Copy response data from proper
 registers
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

While copying GuC response from the scratch registers to the buffer,
formula to identify next scratch register is broken. Fix it.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 84f0b5488783..ddbe64eb0f3b 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -715,7 +715,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 		response_buf[0] = header;
 
 		for (i = 1; i < VF_SW_FLAG_COUNT; i++) {
-			reply_reg.addr += i * sizeof(u32);
+			reply_reg.addr += sizeof(u32);
 			response_buf[i] = xe_mmio_read32(gt, reply_reg);
 		}
 	}
-- 
2.25.1

