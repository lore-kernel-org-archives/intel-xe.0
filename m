Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A83C5AD4C
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 15:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0212510E610;
	Thu, 16 Nov 2023 15:12:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7EC10E28F
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 15:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700147573; x=1731683573;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tE76XVfk24QJGguBg1WrayRwu4Tj8Ip2dJBBTRH0YrM=;
 b=nh3NxjG5kmXl5QrUPRxMeaBaMXLDGClquDEEfbf+2aebtfe4m/FzKb4l
 a18wNOSVRvu7UnpRR1ingap/QTQAGow4VUvK6U0eKBt03kLD8RiF+ffo8
 ++33rNcySasRdNlP4OBR/Fn3ZmkV87fTGJoT9VJrBcVI7TWwMmaa604sC
 zxZSFBmjwNRHQG+GlfaSfvF2OrfD2f2jehOAygnB1FshguLpXKSfAAXzZ
 jmeSQSVsPP3ruiU59y/CJMw4xetjxW3rOiMchoEl+y5nAhS9NKtxtiHsQ
 Di2LBExiqvn8qKrUIzJTOeDEJSIcD3O66zzhautFj5rpKJg7wVl5GV3Cs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="388269209"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="388269209"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 07:12:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="938863149"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="938863149"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.152.135])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 07:12:52 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 16:12:40 +0100
Message-Id: <20231116151242.2125-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231116151242.2125-1-michal.wajdeczko@intel.com>
References: <20231116151242.2125-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/4] drm/xe/guc: Copy response data from
 proper registers
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 311c5d539423..aa4af536c1e9 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -703,7 +703,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 		response_buf[0] = header;
 
 		for (i = 1; i < VF_SW_FLAG_COUNT; i++) {
-			reply_reg.addr += i * sizeof(u32);
+			reply_reg.addr += sizeof(u32);
 			response_buf[i] = xe_mmio_read32(gt, reply_reg);
 		}
 	}
-- 
2.25.1

