Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02058C83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 14:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0ACC10E6BB;
	Tue, 22 Jul 2025 14:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YCjmB6wa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DCF10E6A7
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 14:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753193494; x=1784729494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=19oKzh46aAoKv4n48IOVR7mkBqbiTJoOSlqG9huam8Q=;
 b=YCjmB6waugaM7SLPG+cWjNmvBELpBAook1V8DYe4Yo5JgqCkWIVsqWYl
 +ihv6dHG+awKVt5QyE2sAUkZckBh1dKwOsTTBCWalGO0OSOm3uaT33wb5
 LyJ1NXusOzgyyymsywzotzQXubpUEfyYhCh7OjEcCrtAWv0x+7FZDivmw
 V6Dg36+51ojUaPsBW/9p0Rr4I5ek42NSJsHmcrSDgAuTiWbPDxTuUvkqF
 pdWEhved6HGNdVxFQ/Hsjxi8cQgHeQ8iK7R/u2MGWgj1T2M7Suvc08U9W
 T1K76ZeTo3F2cumYZvPsNMirs4vo8t86RzgDDn+iKyM1JsVoBsl0OKFQc Q==;
X-CSE-ConnectionGUID: oyWOI+fiS3ulKNGtWN3YSQ==
X-CSE-MsgGUID: BNxSvOOWQ9ioc9uxodHI8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="54663029"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="54663029"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 07:11:34 -0700
X-CSE-ConnectionGUID: G0E+E2/nQJK1nDWE2/D9ug==
X-CSE-MsgGUID: 9hBW7eHhTQ2+0OywB9SyrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163396259"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 07:11:32 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v3 1/6] drm/xe/configfs: Fix pci_dev reference leak
Date: Tue, 22 Jul 2025 16:10:54 +0200
Message-ID: <20250722141059.30707-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722141059.30707-1-michal.wajdeczko@intel.com>
References: <20250722141059.30707-1-michal.wajdeczko@intel.com>
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

We are using pci_get_domain_bus_and_slot() function to verify if
the given config directory name matches any existing PCI device,
but we missed to call matching pci_dev_put() to release reference.

While around, also change error code in case of no device match,
to make it more specific than generic formatting error.

Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 8ec1ff1e4e80..e9b46a2d0019 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -267,7 +267,8 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 
 	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
 	if (!pdev)
-		return ERR_PTR(-EINVAL);
+		return ERR_PTR(-ENODEV);
+	pci_dev_put(pdev);
 
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
-- 
2.47.1

