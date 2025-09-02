Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64105CA0FFE
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 13:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2721510E6DC;
	Tue,  2 Sep 2025 13:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZINwOxuy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8779D10E6D1
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 13:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756819077; x=1788355077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/ULdjakIbCdNNOwjezyvZ8NGHJq/Ow/hxb6JgmQFjv0=;
 b=ZINwOxuy0bWraNcGMw1RQU17TGzMiLBq6UKDnTUaFL1Gx4Mwgjdc0pFE
 +Xev5rrKOrLrRdLOiCqmXBSq6RyoD7V28dKvpj+aLJbyjs0XqOU+hMFMb
 QW361yvgAtAuEBZaJY38BWUDbP+KbUg34ArexZtSVuJlj5VLiwY2UYeWe
 zsBwEihbgMpDDp5z87U0S2dAO+l84Cie+kjYjQh3bdcdSLA+drRILpxGj
 VZPuYsXbInXZeRSWkZGvCXmpIE8SI2Nonf0tea87L7luLpLDoUc9/DH7c
 e+hBNWwmYga3jCmkicW9xJs8DeWOp5uqQfPHX0rBWQoJ8jX1lAmfIsJb/ w==;
X-CSE-ConnectionGUID: i5xdt4hpRZqF28DsKIya4w==
X-CSE-MsgGUID: JAs1kwfiS/21yhqqkKWMKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="76535161"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="76535161"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 06:17:57 -0700
X-CSE-ConnectionGUID: 1OipnDGCRPWUsno+eFQJ7g==
X-CSE-MsgGUID: y0wlYoIVS7y3pAXL/PksxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="175642826"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 06:17:56 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/3] drm/xe/configfs: Prepare to filter-out configfs attributes
Date: Tue,  2 Sep 2025 15:17:43 +0200
Message-ID: <20250902131744.5076-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250902131744.5076-1-michal.wajdeczko@intel.com>
References: <20250902131744.5076-1-michal.wajdeczko@intel.com>
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

Implement empty ops.is_visible hook to allow filtering-out any not
supported attributes, as not all of them are applicable on all xe
platforms.

Since during creation of each new configfs directory we are looking
for xe device descriptor to validate that xe driver supports given
PCI device, store reference to that descriptor to allow later use
while doing attribute filtering.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 1025d3979b06..43f000260752 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -134,6 +134,8 @@ struct xe_config_group_device {
 
 	/* protects attributes */
 	struct mutex lock;
+	/* matching descriptor */
+	const struct xe_device_desc *desc;
 };
 
 static const struct xe_config_device device_defaults = {
@@ -362,8 +364,21 @@ static struct configfs_item_operations xe_config_device_ops = {
 	.release	= xe_config_device_release,
 };
 
+static bool xe_config_device_is_visible(struct config_item *item,
+					struct configfs_attribute *attr, int n)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+
+	return dev->desc; /* shall be always true */
+}
+
+static struct configfs_group_operations xe_config_device_group_ops = {
+	.is_visible	= xe_config_device_is_visible,
+};
+
 static const struct config_item_type xe_config_device_type = {
 	.ct_item_ops	= &xe_config_device_ops,
+	.ct_group_ops	= &xe_config_device_group_ops,
 	.ct_attrs	= xe_config_device_attrs,
 	.ct_owner	= THIS_MODULE,
 };
@@ -442,6 +457,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 	if (!dev)
 		return ERR_PTR(-ENOMEM);
 
+	dev->desc = match;
 	set_device_defaults(&dev->config);
 
 	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
@@ -451,12 +467,12 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 	return &dev->group;
 }
 
-static struct configfs_group_operations xe_config_device_group_ops = {
+static struct configfs_group_operations xe_config_group_ops = {
 	.make_group	= xe_config_make_device_group,
 };
 
 static const struct config_item_type xe_configfs_type = {
-	.ct_group_ops	= &xe_config_device_group_ops,
+	.ct_group_ops	= &xe_config_group_ops,
 	.ct_owner	= THIS_MODULE,
 };
 
-- 
2.47.1

