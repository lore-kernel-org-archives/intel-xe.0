Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F7CC83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 11:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6160010E617;
	Tue, 29 Jul 2025 11:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VPwp/k2i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A065410E617
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 11:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753789351; x=1785325351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F3vFTkau3xp6zhfatJOFiorThzLjelNqx8Jf2ux4bMY=;
 b=VPwp/k2ip8loZB4W69w3V3RbqmbPZT7NSMXaga9AVeSwoJ66J8pEn0ba
 7UOq0mUjdnfNb26IZBk29FqK119Mep+HGfNT3fQ/GnZGYEhjZGcRHYh3Q
 4QruGc3z8tanqQZdxleY7Z2K2W2jz4jYpj9vlZBbiDa3B5GpkJPx3+jaf
 /i/DF5lklcJMNjHPfnGw+oCF4QSe5gLcEpgnm8i2qsiQgjd9sM736j9SW
 FGHGjxfCln0NpBODMtYP0PoVYVN8PYvW3eTn8evrWKxFgIF7PcC4p8qAO
 eeQ5ZYTohiXJxFRVFDifNAfOP+LtyZOVHbfrAVwT6karaKecZWlSZyqiY g==;
X-CSE-ConnectionGUID: xheu+cxpTf2889tKuMyCEQ==
X-CSE-MsgGUID: sIcXNY9XSwiizX9eRKGG0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55755580"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="55755580"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:42:31 -0700
X-CSE-ConnectionGUID: cghTyllHQiS3+Sz3s6Yz8g==
X-CSE-MsgGUID: kMQaedNWSdu+k0ejifmxrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="161946888"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:42:29 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v5 03/11] drm/xe/configfs: Destroy xe_configfs.su_mutex on
 exit/error
Date: Tue, 29 Jul 2025 13:42:07 +0200
Message-ID: <20250729114215.177586-4-michal.wajdeczko@intel.com>
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

While mutex_destroy() is NOP when CONFIG_DEBUG_MUTEXES is not
enabled, we should still call it.

While around, drop a traling line.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
v2: remove pr_err in separate patch (Rodrigo)
---
 drivers/gpu/drm/xe/xe_configfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 36e2b45b305f..56fbf4c1c37f 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -401,6 +401,7 @@ int __init xe_configfs_init(void)
 	if (ret) {
 		pr_err("Error %d while registering %s subsystem\n",
 		       ret, root->cg_item.ci_namebuf);
+		mutex_destroy(&xe_configfs.su_mutex);
 		return ret;
 	}
 
@@ -410,5 +411,5 @@ int __init xe_configfs_init(void)
 void __exit xe_configfs_exit(void)
 {
 	configfs_unregister_subsystem(&xe_configfs);
+	mutex_destroy(&xe_configfs.su_mutex);
 }
-
-- 
2.47.1

