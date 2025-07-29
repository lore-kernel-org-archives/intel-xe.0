Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE20C83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 11:42:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E3D10E611;
	Tue, 29 Jul 2025 11:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OwZM0YQ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF65010E16F
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 11:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753789349; x=1785325349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DqgrEshgQrNOk/V8x5G3V0eYmyJxRcKFP3nwidUZ4s0=;
 b=OwZM0YQ8V6rmFmAbtRX0ZrOH66yoKgwsQNOV2igJXxb79Brf9qFMyCyz
 EfttOv3TDyk8xrnQ65cWVf0/MxnMHxqtIAyUQTW6hEH4a7HOxi1ew9cMP
 UYUrEn+1WG91IBsMF8tcPKN/V2LyXPDjJLDdHB4tbJ7IglEzOADTxSou4
 wrx/bNwWAle1MxlBlQu1yTxm+7whza91+oMMYVYnthNxCXuaS21wuABME
 ohoCJ7QBbrTokiNAOfNliyIh5Hbi/rCbHJzyeadco7cTUuJS2nbAmwYvW
 A8uUqZN5ln34TwsK/+uPgMT3X4JCTvBZyriYV4FZq9QpDfZCnV603XqhL w==;
X-CSE-ConnectionGUID: yNx8nvLaTc6JMcuSzCD99g==
X-CSE-MsgGUID: 6IuNOqthTEqV2L9fTy3/8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55755575"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="55755575"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:42:29 -0700
X-CSE-ConnectionGUID: tCgKRZBPTjuFKw61CixOxg==
X-CSE-MsgGUID: NvOoSaCYTNaDC8rv+kJKRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="161946873"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:42:27 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v5 02/11] drm/xe: Print module init abort code
Date: Tue, 29 Jul 2025 13:42:06 +0200
Message-ID: <20250729114215.177586-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250729114215.177586-1-michal.wajdeczko@intel.com>
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
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

