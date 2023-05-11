Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0196CC77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 19:48:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD2C10E0D3;
	Thu, 11 May 2023 19:48:49 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E04810E0D3
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 19:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683834525; x=1715370525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WF4jnobwy1dPOGmLc698lQc12scTG0yZCQWsHfXoAr8=;
 b=KubXxZb7oi/5oktniXOh2E1qkX5uK/lWU0FCQWF6lumxnWjO1Y7Cdyda
 Q1QGlHVOUDaiKcbWebXwwFfoF/DDTGKOvUpdguuxqBTc0Hzty98GuYJAp
 jzdS/+URK87uWK1Npm68ddNpfkKfYsrZU+XCR6x5q3xTWYBFlGfDVy0Ek
 6iZzw7KVHHlTFppidoqpNPbN0f8Ko9TY7vWPFcJ1pgU9/g+hMx41CbUDM
 3t7jhoXyZuHJwJUfOWMqPJCd+BqFEn7ZOyqTp3xh976XNzapAoqvDn99z
 Xy4VmFOPLLCePA9kYzMVXgMPd9zjETwV+6XWOFZdrUItW1T75Mc+MdE3H w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="436948184"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="436948184"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 12:48:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="789512316"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="789512316"
Received: from manojsix-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.255.34.137])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 12:48:43 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 11 May 2023 16:48:22 -0300
Message-Id: <20230511194822.626036-3-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511194822.626036-1-gustavo.sousa@intel.com>
References: <20230511194822.626036-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe: Call exit functions when
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Move xe_register_pci_driver() and xe_unregister_pci_driver() to
init_funcs to make sure that exit functions are also called when
xe_register_pci_driver() fails.

Note that this also allows adding init functions to be run after
xe_register_pci_driver().

v2:
 - Move functions to init_funcs instead of having a special case for
   xe_register_pci_driver(). (Jani)

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 0b4541639bd1..75e5be939f53 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -49,6 +49,10 @@ static const struct init_funcs init_funcs[] = {
 		.init = xe_sched_job_module_init,
 		.exit = xe_sched_job_module_exit,
 	},
+	{
+		.init = xe_register_pci_driver,
+		.exit = xe_unregister_pci_driver,
+	},
 };
 
 static int __init xe_init(void)
@@ -64,15 +68,13 @@ static int __init xe_init(void)
 		}
 	}
 
-	return xe_register_pci_driver();
+	return 0;
 }
 
 static void __exit xe_exit(void)
 {
 	int i;
 
-	xe_unregister_pci_driver();
-
 	for (i = ARRAY_SIZE(init_funcs) - 1; i >= 0; i--)
 		init_funcs[i].exit();
 }
-- 
2.40.1

