Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853A4C87FCC
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 19:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2AD10E7D5;
	Thu, 31 Jul 2025 19:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VKSRfuKL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CAE10E7D5
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 19:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753990433; x=1785526433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3lP/2Zgg4LVOMZzMYMWDfrwDj94Zn2ZFn0siOrPTTxo=;
 b=VKSRfuKLv/9emv5UfBRkAtj5zYrS9sEW6yAb9cT6Xg9umGMcAp3nX1Kd
 WlOmPwvT82fVe+7UVH0j2unNyDyo4xoD/p9UWMpxwxXIz6a5Ds0g+McPV
 XP84NT6h5pa+klL/ZEhwPrNGembIa+jHGgU1QZmSM/JWWx5Kx2C7aHPck
 ilYz2wVrBb/gJJS6PEWWZQ0nPDkqvrOwHnmgBCGBaP7trPhfXZ2Iz2xes
 vxTsEohTNybMdL53IK6PeXh7tO7GvxdAP+GUdDfv+BWDGE2B3KI4SVUWQ
 JPsKY/eRHsmUzHGI5cGdBw5OYG9n8QctG/SgYn2QMzUlSBM8yV4svef8r Q==;
X-CSE-ConnectionGUID: csAnPimbQ1SAg20HlSuvMQ==
X-CSE-MsgGUID: 0sN4ZfglR+ine+RGR3bTsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55395021"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="55395021"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:33:53 -0700
X-CSE-ConnectionGUID: VWT6yMaMQqCl/ckCDeka8A==
X-CSE-MsgGUID: M4OL9aDWQIaWfJIl6/RJwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="194333952"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:33:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v6 01/11] drm/xe: Simplify module initialization code
Date: Thu, 31 Jul 2025 21:33:29 +0200
Message-ID: <20250731193339.179829-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731193339.179829-1-michal.wajdeczko@intel.com>
References: <20250731193339.179829-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
v2: use clearer pointer logic (John)
---
 drivers/gpu/drm/xe/xe_module.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index d9391bd08194..cfed36361613 100644
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
+		err = xe_call_init_func(init_funcs + i);
 		if (err) {
 			while (i--)
-				xe_call_exit_func(i);
+				xe_call_exit_func(init_funcs + i);
 			return err;
 		}
 	}
@@ -176,7 +169,7 @@ static void __exit xe_exit(void)
 	int i;
 
 	for (i = ARRAY_SIZE(init_funcs) - 1; i >= 0; i--)
-		xe_call_exit_func(i);
+		xe_call_exit_func(init_funcs + i);
 }
 
 module_init(xe_init);
-- 
2.47.1

