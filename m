Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8804C77B75
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 22:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9229810E42A;
	Tue,  9 May 2023 22:21:17 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6DB10E42A
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 22:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683670875; x=1715206875;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PSU9unbeAy9iPogzuhdelouDqVZzpz/0cjZHhHuN0UE=;
 b=a0ddWOsDBnJRaDePqYX9qOTUfVznsvp9DLF1m6fX09TfnP3ZR/gqLlOO
 OlMrF1p8uGKOCNxODwsL8wEoEmOlvAhW4tVbPWU/F+fHvpBhMHGUjERZU
 yR49uwCTkj1QqkB3rJMTHPvbRshn37gbQbkzC72BhBhJ9odglfq8/zQQe
 lLLjZqGEUznTWaDA5Vot2sE/FIY6KMGaY+KNZYRKLMLqKjxS/2VnjTuoC
 K+32gDwPDhy5/50kC7qhm+9+vilRsUEjnQxbVPvey4KpazFT3hbLeeBw/
 /l3C6JAahZXCse3qa5KRS/G0TY6Dc4axEniZ9pPDpVVfpzj3kljAaQaZD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="352243712"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; d="scan'208";a="352243712"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 15:21:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="731911418"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; d="scan'208";a="731911418"
Received: from sueelope-mobl1.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.255.32.114])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 15:21:13 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  9 May 2023 19:20:53 -0300
Message-Id: <20230509222053.1541049-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Call exit functions when
 xe_register_pci_driver() fails
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

Make sure all necessary exit functions are also called when
xe_register_pci_driver() fails.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 6860586ce7f8..9698875852d3 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -53,14 +53,18 @@ static int __init xe_init(void)
 
 	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
 		err = init_funcs[i].init();
-		if (err) {
-			while (i--)
-				init_funcs[i].exit();
-			return err;
-		}
+		if (err)
+			break;
 	}
 
-	return xe_register_pci_driver();
+	if (!err)
+		err = xe_register_pci_driver();
+
+	if (err)
+		while (i--)
+			init_funcs[i].exit();
+
+	return err;
 }
 
 static void __exit xe_exit(void)
-- 
2.40.0

