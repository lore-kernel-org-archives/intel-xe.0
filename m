Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C97BC87FCA
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 11:42:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A676B10E61C;
	Tue, 29 Jul 2025 11:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NyJEMAVG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B898810E619
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 11:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753789360; x=1785325360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jOPUnk7z9Hl1VDo4JM1D78urLHhWkL5vAl1YeYOCZyg=;
 b=NyJEMAVGqzbuYZPqQJ/z6z6qohyWjVsFs2TEo52aO5kbcMIqospXT9c6
 Py4oZtMG2S+BxC+3vl8Se6PEyham86mOwfgy4i4e6xelnv4mSdzSbvdWV
 XIBy2kvpctYO5QbMTZmuwnpGQhQYJ056T3ZikjnfASBCYTSofnwpzY0ap
 /UupX4n1BiOnXsDGiWywXUOM+gzfaCXOMFAPAz3YuSkAfyTea5hHtv4kV
 n/8PU3dK5l84Y68oLzHlJIiWiU7kCAdwh/uicsmRjCQdHfwQxq+jVuNW3
 OSm5F7wcA2+MvTyi/iG4QC759QDN3LRm4Bnx7XWxJL9iJppqVjWxw6DsY w==;
X-CSE-ConnectionGUID: EKeEVWfsQ+qaTC7Rwd4fBA==
X-CSE-MsgGUID: M/8TKTXnQci7ZYGqkpkLIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55755592"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="55755592"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:42:40 -0700
X-CSE-ConnectionGUID: hwXl3ODJQei5Q7fcGxSNqA==
X-CSE-MsgGUID: rvMV+a2DSvyibXxUfDxc6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="161946952"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:42:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v5 08/11] drm/xe/configfs: Keep default device config settings
 together
Date: Tue, 29 Jul 2025 13:42:12 +0200
Message-ID: <20250729114215.177586-9-michal.wajdeczko@intel.com>
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

For easier maintenance add a placeholder where we can keep all
default device configuration settings in one place.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 7ad9fc65e21d..150e7f2becc8 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -97,6 +97,16 @@ struct xe_config_group_device {
 	struct mutex lock;
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
@@ -288,8 +298,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 	if (!dev)
 		return ERR_PTR(-ENOMEM);
 
-	/* Default values */
-	dev->config.engines_allowed = U64_MAX;
+	set_device_defaults(&dev->config);
 
 	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
 
@@ -345,7 +354,7 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
 	bool mode;
 
 	if (!dev)
-		return false;
+		return device_defaults.survivability_mode;
 
 	mode = dev->config.survivability_mode;
 	config_group_put(&dev->group);
@@ -389,7 +398,7 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
 	u64 engines_allowed;
 
 	if (!dev)
-		return U64_MAX;
+		return device_defaults.engines_allowed;
 
 	engines_allowed = dev->config.engines_allowed;
 	config_group_put(&dev->group);
-- 
2.47.1

