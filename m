Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A3FC44529
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 11:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E208310E754;
	Tue, 21 Jul 2026 11:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VVQBCWBl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F1210E34B
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 11:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784633934; x=1816169934;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B14pjgEqrJymoRFVZIBkt30/lslSrdvyv+pKaDQDCuQ=;
 b=VVQBCWBlPvL7xOLAyToTFdXb2me+3sjdwy0LN9S5alJVjL8ri4d7n5uG
 1QbW0oE3z7XDUuy+50Bdf0n6B8JkOjlGYe9R9eb6EhLQKgKLSKvTv6msm
 nnaC6Oc0EbuLvLx9gmN43IXuqmoLZHIUHixpcjXJ0E4pquYjC4rcDdz/k
 1J0aUJ5jLp3YMqd/TvRRJ2VTkECQmb1oEEbnRIJlg1L8gTzNePqVUNGyR
 T2N02isx53rdMUOy9o/Iq7e5d8qEYdqG7ydA3T6NQ4sdg2b4ufj2/gAvL
 OnX3aQvaOh2CqfODo3MToJ+xmddMJAaLKXjOfemAv7v1/76ZYGJnW2LOe Q==;
X-CSE-ConnectionGUID: nhr033kxQx+ObQxoqPH+6Q==
X-CSE-MsgGUID: FYEKvXLLRl6/60DIxH6IIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="95884875"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="95884875"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 04:38:54 -0700
X-CSE-ConnectionGUID: sSmZtKNDQSCqospU+bjaOg==
X-CSE-MsgGUID: cdGbPJbWQRa2SUjyaWtbcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="255096778"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 21 Jul 2026 04:38:52 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: heikki.krogerus@linux.intel.com, matthew.d.roper@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/i2c: Allow per domain unique id
Date: Tue, 21 Jul 2026 17:04:38 +0530
Message-ID: <20260721113438.651100-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

PCI bus, device and function can be same for devices existing across
different domains. Allow per domain unique identifier while registering
platform device to prevent name conflict.

Fixes: f0e53aadd702 ("drm/xe: Support for I2C attached MCUs")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index bd956776b10b..a26c38bb17a1 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -95,18 +95,21 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 	struct platform_device *pdev;
 	struct fwnode_handle *fwnode;
 	int ret;
+	u32 id;
 
 	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
 	if (IS_ERR(fwnode))
 		return PTR_ERR(fwnode);
 
+	id = (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
+
 	/*
 	 * Not using platform_device_register_full() here because we don't have
 	 * a handle to the platform_device before it returns. xe_i2c_notifier()
 	 * uses that handle, but it may be called before
 	 * platform_device_register_full() is done.
 	 */
-	pdev = platform_device_alloc(adapter_name, pci_dev_id(pci));
+	pdev = platform_device_alloc(adapter_name, id);
 	if (!pdev) {
 		ret = -ENOMEM;
 		goto err_fwnode_remove;
-- 
2.43.0

