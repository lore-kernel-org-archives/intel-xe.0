Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C725AC4167B
	for <intel-xe@archiver.kernel.org>; Sun,  5 Nov 2023 10:58:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9290110E108;
	Sun,  5 Nov 2023 10:58:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0001710E0E6
 for <intel-xe@lists.freedesktop.org>; Sun,  5 Nov 2023 10:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699181910; x=1730717910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6fhNklePg7S8fD8/mMstVWQzk0L7jCeSd5GbyjYlolE=;
 b=FVAlR+Sqgke72RX2VeqjesOpGoPiX1FTeQtBnnfOdPzmFrgGyinFvKyK
 kRSPtd0gyztXGteqtlcIr3CYoRN0BUHmbT93UX7L029ImFX3AC8LfIIYm
 AzVxziZuwQeYBD5CgXgnyYLcubDC9rQAotTYoIRlKjuXzKAjbddGsKUND
 7S8HaKmuhVKKpk+3Z1f9Q27gEAu2p+GEKl91v7Q+eTFVdXDn1i1b5tTiQ
 LFCKV7MGVks5QUeRCq2ksTrUyAN2/DDNhMvNErH7B85qiRRiwC+UdK2Bc
 Tj0LQnI83NHEBjpSAnqVBzYB4n0+npUzub2zRkmZj6QeJ/lXBz1L6QCaz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="379531574"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; d="scan'208";a="379531574"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 02:58:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="935541569"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; d="scan'208";a="935541569"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 02:58:27 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Sun,  5 Nov 2023 12:53:07 +0200
Message-Id: <20231105105307.3710560-3-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231105105307.3710560-1-alexander.usyskin@intel.com>
References: <20231105105307.3710560-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe/gsc: init heci gsc after interrupts
 are ready
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
Cc: Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Init HECI GSC only after GT enables interrupts.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 515cdf599fab..1202f8007f79 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -392,8 +392,6 @@ int xe_device_probe(struct xe_device *xe)
 			goto err_irq_shutdown;
 	}
 
-	xe_heci_gsc_init(xe);
-
 	err = xe_mmio_probe_vram(xe);
 	if (err)
 		goto err_irq_shutdown;
@@ -425,6 +423,8 @@ int xe_device_probe(struct xe_device *xe)
 			goto err_irq_shutdown;
 	}
 
+	xe_heci_gsc_init(xe);
+
 	err = xe_display_init(xe);
 	if (err)
 		goto err_irq_shutdown;
-- 
2.34.1

