Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6A0C87FD1
	for <intel-xe@archiver.kernel.org>; Sun, 27 Jul 2025 17:20:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D9E10E315;
	Sun, 27 Jul 2025 17:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+8FJMbS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C54F10E31A
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 17:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753636830; x=1785172830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CMp1V9szMyJpkkm/w9eqqWVAS1H6s32s70dKMn4mjSk=;
 b=U+8FJMbSIAdOxIoSVcfEZ+krgU4qxH1X+hqm5V24aqDNLSVeXtwbNIsq
 0loh0iO1K1u1OcGLWwkGsr+WExX8ymk5iHcIo54x4jvvp2LQgUU9uVgCD
 /AJ634f2u0Ed4nYz3SsCA6AvPAVAKomHPm69Pa0qLRhYF0UC9aiNGoKTt
 zNGXg0oU8BnwiodY5yw7StNIKqLK65kJfeXraxHBVD2muTQWOxOppgOV8
 5CMUPqtsN+uWCxu7v1L5mWVe6/bXuKOzTxf4X1XEfMu4IVQ+Qay1LgmHN
 MD8TRXuk6nG3/d9TjsIVAfW9VApc8y6o2BRC6aHa9AJ9vw9oGBMv+vYHZ g==;
X-CSE-ConnectionGUID: 6yWS7wwvRvy13pt0RNdi8Q==
X-CSE-MsgGUID: Af3DMUVbRPCtkK3ie2OMqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56046733"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56046733"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:30 -0700
X-CSE-ConnectionGUID: OL6efdLgRdClxFWF4SJAOg==
X-CSE-MsgGUID: ddJzZwhZQMy825EzHpkdzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="167556843"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:29 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 08/11] drm/xe/configfs: Keep default device config settings
 together
Date: Sun, 27 Jul 2025 19:20:05 +0200
Message-ID: <20250727172009.587-9-michal.wajdeczko@intel.com>
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

For easier maintenance add a placeholder where we can keep all
default device configuration settings in one place.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index a5f13dd779c7..60d89d3ef656 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -98,6 +98,16 @@ struct xe_config_group_device {
 	} config;
 };
 
+static struct xe_config_device device_defaults = {
+	.survivability_mode = false,
+	.engines_allowed = U64_MAX,
+};
+
+static void set_device_defaults(struct xe_config_device *config)
+{
+	*config = device_defaults;
+}
+
 struct engine_info {
 	const char *cls;
 	u64 mask;
@@ -286,8 +296,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 	if (!dev)
 		return ERR_PTR(-ENOMEM);
 
-	/* Default values */
-	dev->config.engines_allowed = U64_MAX;
+	set_device_defaults(&dev->config);
 
 	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
 
@@ -339,7 +348,7 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
 	bool mode;
 
 	if (!dev)
-		return false;
+		return device_defaults.survivability_mode;
 
 	mode = dev->config.survivability_mode;
 	config_group_put(&dev->group);
@@ -382,7 +391,7 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
 	u64 engines_allowed;
 
 	if (!dev)
-		return U64_MAX;
+		return device_defaults.engines_allowed;
 
 	engines_allowed = dev->config.engines_allowed;
 	config_group_put(&dev->group);
-- 
2.47.1

