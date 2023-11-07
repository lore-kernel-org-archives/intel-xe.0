Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CCEC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 12:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BA910E155;
	Tue,  7 Nov 2023 12:01:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA4410E13D
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 12:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699358478; x=1730894478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6fhNklePg7S8fD8/mMstVWQzk0L7jCeSd5GbyjYlolE=;
 b=mRQ4ARlFDD6axI790+oO1GUvJ8ZEdHHnwpddEtr57B+F68s2ABDD+DwP
 dZD2/VF8kypYSsOu+8QXgkcnznoU5HFb061UHD0V9eQBFx5dgo1VsXa1+
 LpUhGImYWQslasprrqXqDOXLZtp2K4SSYrTIW4Lgam8pnJF2wSUm8NS9f
 itW+Q7TyiOfRm19bQgtBboSdUi+2ublaAE9ocBk4bB7aGhnZZtV2oHYUl
 cCTUqgjHg89JHYP0pr7zAlU609nCuq85jdxWP7xjmM0GP3D7tIA9ZlfA0
 0EibuXErWVtXdeB057lxJNOn2Lh6tFTIl+nvUFVdt2EMMmWXLA6qcvxHg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="11032749"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="11032749"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 04:01:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="756159022"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="756159022"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 04:01:16 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Tue,  7 Nov 2023 13:55:59 +0200
Message-Id: <20231107115559.248879-3-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107115559.248879-1-alexander.usyskin@intel.com>
References: <20231107115559.248879-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] fixup! drm/xe/gsc: add gsc device support
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

