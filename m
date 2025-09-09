Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04BECA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 22:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B533310E80E;
	Tue,  9 Sep 2025 22:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BzxuoeF7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1787C10E80E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 22:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757455971; x=1788991971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WpnF7WOTE9GdhwNUJqR71hf/HUWjH4mkJ/LayBIA/dA=;
 b=BzxuoeF751JPZehsMZZknF6kZs9ZoOcHsOu6e5KBwY5MoCybo22fDIFS
 sVCwDpPzI9cBxzY2tJqA2jM9n690+VA4CLkRCdjlpMti0PdDqhtXVw/Pl
 hTmaqkqoBqiiBHSBuCHInOuZhVOrNEXQO6iuUulAxioOGpkgcdnMF+eKC
 SC4a38r9I8q/QXtT29oXLfY8L/FAm88Hq5SjVAnzZMGHE/7W4qXv2Hm1y
 FdNdT6UXAHbcGpwzBiM9PNztN3azgg5IR+olXWOhngID1IKNqcyjrTT5J
 9xhSoBy4WmrcaTmckAWS6Mg+4lPadwn7jR03YTpiWdBTZDCWcjT8vXkIW A==;
X-CSE-ConnectionGUID: BAvtAnBOTHGq7on6xmIv4w==
X-CSE-MsgGUID: qlYu3zYfSrqKuFS3noV8Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="71135507"
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="71135507"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 15:12:50 -0700
X-CSE-ConnectionGUID: Unsd2pF2T461kZ35FWGoyw==
X-CSE-MsgGUID: iMHauV3SShGTSJRdpuMQKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="210349019"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 15:12:51 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [CI 2/2] drm/xe: Allow error injection for xe_pxp_exec_queue_add
Date: Tue,  9 Sep 2025 15:12:41 -0700
Message-ID: <20250909221240.3711023-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909221240.3711023-3-daniele.ceraolospurio@intel.com>
References: <20250909221240.3711023-3-daniele.ceraolospurio@intel.com>
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

This will allow us to simulate this function returning an error like
we do for other functions called in the exec_queue_create path.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_pxp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index 3d62008c99f1..bdbdbbf6a678 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -688,6 +688,7 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
 
 	return ret;
 }
+ALLOW_ERROR_INJECTION(xe_pxp_exec_queue_add, ERRNO);
 
 static void __pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q, bool lock)
 {
-- 
2.43.0

