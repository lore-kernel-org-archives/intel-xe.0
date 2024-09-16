Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5131C3ABCB
	for <intel-xe@archiver.kernel.org>; Mon, 16 Sep 2024 19:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CE910E3CA;
	Mon, 16 Sep 2024 19:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UxEvgcr6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C53210E3CA
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Sep 2024 19:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726514518; x=1758050518;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1mMZOZVCkCslYfDO9LLS6xyZDb96C39EWBhIuf9YFts=;
 b=UxEvgcr65CCq8gfPwmClRC9Y9+Rnzk2XOOrpcEyW9xl5MloCB22uL3Gf
 2XMlglzjTxYBQvOBsOa1KaefWxuqJZc8zjwV9I+iQH9umJNOV0FTIZcc2
 mnQYV+EefcmJsCuHxVw0QOuqankay2/qR2yNZWvzi5CwgtahZU+ntWgtY
 355qbWVtoDyBvTBB/e0KtczmN4jqCcJiIAblHpjsmkkt5XIBWaaQQE4+Q
 Ng+XHqOoliSvdx7FZGPWapLLTp8lMOw7vTHNOuXhyKCoqnPVsj2JQjNDP
 c9ETGviBwme3vPh3Qn7aaoiDIozQAIjSqHZhW3oeE3HmJE4WT4dbAtC5A w==;
X-CSE-ConnectionGUID: f9HngHU7Q+289+1Ejqh8mQ==
X-CSE-MsgGUID: jfPdgC9EQJCIMJ7CMvOtEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25237839"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="25237839"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 12:21:57 -0700
X-CSE-ConnectionGUID: fz4GXAL/RN+cATaH2L7J2Q==
X-CSE-MsgGUID: kblw5pF6S6aoUqULlWWbpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="92262225"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 12:21:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/xe/rtp: Remove unneeded semicolon
Date: Mon, 16 Sep 2024 12:21:49 -0700
Message-ID: <20240916192149.855996-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Fix coccicheck report with regard to unneeded semicolon. This is
currently the only case according to

	make coccicheck \
		MODE=report \
		COCCI=scripts/coccinelle/misc/semicolon.cocci \
		M=drivers/gpu/drm/xe

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409151152.pJ4ukp5k-lkp@intel.com/
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 86c705d18c0d3..b13d4d62f0b1e 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -196,7 +196,7 @@ static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
 		*gt = (*hwe)->gt;
 		*xe = gt_to_xe(*gt);
 		break;
-	};
+	}
 }
 
 /**
-- 
2.43.0

