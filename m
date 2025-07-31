Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4EBC87FCA
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 19:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9B610E7D9;
	Thu, 31 Jul 2025 19:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8X3pNKF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CB710E7D5
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 19:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753990435; x=1785526435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DqgrEshgQrNOk/V8x5G3V0eYmyJxRcKFP3nwidUZ4s0=;
 b=J8X3pNKFaK/CFpdspxB7ImagUWO0qgeszpR/5xe6Kd3cXlZoTbR9siJd
 5TR5R/UEli1DAGw280+AywyKUYLSJiqybSGN+Q1QZ7+SUdmDYhwIttuLd
 ea4lyaILjvuxHgKqLip58O0Wfs4kPJzrJu1KpkVuNEusH4bQqZQthg8A2
 IcqPx1+QkGiz31Qa4f/MLe4e/opmRn155Msx0mzSSGo/A3Q6364bHZEly
 aSk83/ix7MH8K2l+PhOyL+3wLco4a25vw1FTZBwmWwL6MsngRNMYPX+0e
 eHv7y7iEM/gPZozL0iDjv1MjmM04HLqzA8pfhEbzSS4YWYHeX0Ea4fqw3 g==;
X-CSE-ConnectionGUID: gQNQ7kD8S0+S7+lftCWAlQ==
X-CSE-MsgGUID: lZ8pBMOnRiyW3GGUdeCCAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55395022"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="55395022"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:33:55 -0700
X-CSE-ConnectionGUID: aoNNLlPMQiW4NEHdzb7/Xw==
X-CSE-MsgGUID: ezNZUrQ6TMygSx9i/2SUfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="194333959"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:33:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v6 02/11] drm/xe: Print module init abort code
Date: Thu, 31 Jul 2025 21:33:30 +0200
Message-ID: <20250731193339.179829-3-michal.wajdeczko@intel.com>
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

We should provide a hint to the user why the module refused to
load. This will also allow us to drop individual error messages
from init steps.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index cfed36361613..d08338fc3bc1 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -155,6 +155,8 @@ static int __init xe_init(void)
 	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
 		err = xe_call_init_func(init_funcs + i);
 		if (err) {
+			pr_info("%s: module_init aborted at %ps %pe\n",
+				DRIVER_NAME, init_funcs[i].init, ERR_PTR(err));
 			while (i--)
 				xe_call_exit_func(init_funcs + i);
 			return err;
-- 
2.47.1

