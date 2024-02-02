Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D52C48291
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 21:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912F410E850;
	Fri,  2 Feb 2024 21:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PEEurHGA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C48410E850
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 21:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706909140; x=1738445140;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A07w5yhPGLGd6TCSh/3bfuhh1VUZ9BXF7fo+62mRi8Y=;
 b=PEEurHGA5SqP9NtnZIOertMGdpFelGIMfQ483DsxRBfvkjhfjk1o0DS9
 dxrNQ2sc2I0j15YEQ1CUKj1rpjwRqAIadIYIeQo42KtZ+j7nXzTU7GAN9
 UC50X5PYrQRMVuz50fng1s5I0NC9RAcAlhiJe98tpIZ0sx3iVwDetpz2c
 o9OxyOQfQcdZpoai6c2eOtkPLEyttyVDNRVfJW+t3tekvelK2TnWrWrX/
 5bUrB+sWSkU40H7jvvOUXA6MZ85GBUfJnp6eLv+EngVKrRdb7rjThO2cM
 qkEHohTNryNjlHV3CIeWwFu3fX8nWxJlKjVv0u4Ige2Q4VlKrbSpt+kV7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="148967"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="148967"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 13:25:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4783243"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 13:25:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/trace: Remove extra newline from GuC CT trace points
Date: Fri,  2 Feb 2024 13:26:18 -0800
Message-Id: <20240202212618.2544150-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

TP_printk includes a newline at the end, no need for an extra one.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_trace.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index e4e7262191ad..7858ca0d0720 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -578,7 +578,7 @@ DECLARE_EVENT_CLASS(xe_guc_ctb,
 			    __entry->_head = _head;
 		    ),
 
-		    TP_printk("gt%d: H2G CTB: action=0x%x, len=%d, tail=%d, head=%d\n",
+		    TP_printk("gt%d: H2G CTB: action=0x%x, len=%d, tail=%d, head=%d",
 			      __entry->gt_id, __entry->action, __entry->len,
 			      __entry->tail, __entry->_head)
 );
@@ -592,7 +592,7 @@ DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
 		   TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
 		   TP_ARGS(gt_id, action, len, _head, tail),
 
-		   TP_printk("gt%d: G2H CTB: action=0x%x, len=%d, tail=%d, head=%d\n",
+		   TP_printk("gt%d: G2H CTB: action=0x%x, len=%d, tail=%d, head=%d",
 			     __entry->gt_id, __entry->action, __entry->len,
 			     __entry->tail, __entry->_head)
 
-- 
2.34.1

