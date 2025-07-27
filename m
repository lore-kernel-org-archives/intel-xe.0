Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF89CC87FCE
	for <intel-xe@archiver.kernel.org>; Sun, 27 Jul 2025 17:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5235610E315;
	Sun, 27 Jul 2025 17:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5WVHmRa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2569A10E309
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 17:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753636820; x=1785172820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w13TK+C0WAbRe/7oYOyobxnjpce3Aa4UVeD0uwEybT0=;
 b=f5WVHmRaer6Pk9grS4ZIxUx6k8ACgA+sWbdeaC8ha7nmvCrkF2Ty8RJP
 kIR5S0/sjKziWfH620OBwLkAiQxnLxG3t8uCauKY6AD1Cj8cPikG/nJEa
 IXNSbfIg49u1ztbIVbWIyFJQzfWXw5GM4sjJVWKneVla6kOrGSuaCmCb7
 UMylc1WOLhahnet2hTInIdG7ZneuisOQVtVzvuT1unUE2CuWpMb4f6+VU
 +izxOdvNm7B81CFOxYzUt1z/h+89ref3RtmFpZz1vI21Np7pRDxIXTKoW
 K+rLQ83207Bi9mFHeXSVculFGCBctQ+p4JyqnuDRNRfSfojM6aPYVMay8 w==;
X-CSE-ConnectionGUID: NsuCb/8sSTWaJuTrc56Cmw==
X-CSE-MsgGUID: 0QofBC+8Sg2hf1a2KhcHzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56046721"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56046721"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:20 -0700
X-CSE-ConnectionGUID: 81JY4GYQTA6EVFUZ3G9JQg==
X-CSE-MsgGUID: di8ujSTxQaCjFOyUKT/Kgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="167556815"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:18 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 01/11] drm/xe: Simplify module initialization code
Date: Sun, 27 Jul 2025 19:19:58 +0200
Message-ID: <20250727172009.587-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727172009.587-1-michal.wajdeczko@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
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

There is no need to have extra checks and WARN() in the helpers
as instead of an index of the entry with function pointers, we
can pass pointer to the entry which we prepare directly in the
main loop, that is guaranteed to be valid.

  add/remove: 0/0 grow/shrink: 0/4 up/down: 0/-180 (-180)
  Function                                     old     new   delta
  xe_exit                                      109      79     -30
  cleanup_module                               109      79     -30
  xe_init                                      248     188     -60
  init_module                                  248     188     -60
  Total: Before=2774145, After=2773965, chg -0.01%

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index d9391bd08194..593bc9e5851a 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -135,24 +135,17 @@ static const struct init_funcs init_funcs[] = {
 	},
 };
 
-static int __init xe_call_init_func(unsigned int i)
+static int __init xe_call_init_func(const struct init_funcs *func)
 {
-	if (WARN_ON(i >= ARRAY_SIZE(init_funcs)))
-		return 0;
-	if (!init_funcs[i].init)
-		return 0;
-
-	return init_funcs[i].init();
+	if (func->init)
+		return func->init();
+	return 0;
 }
 
-static void xe_call_exit_func(unsigned int i)
+static void xe_call_exit_func(const struct init_funcs *func)
 {
-	if (WARN_ON(i >= ARRAY_SIZE(init_funcs)))
-		return;
-	if (!init_funcs[i].exit)
-		return;
-
-	init_funcs[i].exit();
+	if (func->exit)
+		func->exit();
 }
 
 static int __init xe_init(void)
@@ -160,10 +153,10 @@ static int __init xe_init(void)
 	int err, i;
 
 	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
-		err = xe_call_init_func(i);
+		err = xe_call_init_func(&init_funcs[i]);
 		if (err) {
 			while (i--)
-				xe_call_exit_func(i);
+				xe_call_exit_func(&init_funcs[i]);
 			return err;
 		}
 	}
@@ -176,7 +169,7 @@ static void __exit xe_exit(void)
 	int i;
 
 	for (i = ARRAY_SIZE(init_funcs) - 1; i >= 0; i--)
-		xe_call_exit_func(i);
+		xe_call_exit_func(&init_funcs[i]);
 }
 
 module_init(xe_init);
-- 
2.47.1

