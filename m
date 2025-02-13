Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE4DC021AC
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 19:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CDB10EB91;
	Thu, 13 Feb 2025 19:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQCFA03q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D26E10EB8B
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 19:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739474975; x=1771010975;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=TUAETL15Jzf/aG3rbcyM9TvCl0ioxk3ty37CLah98R8=;
 b=RQCFA03qbBrpYSlU5yiEoMBa81MKC/2zt95B4E15MgpwcFRbEXJHD4dQ
 wCFoBOiyostWp00GIRf3mOA1lAgCYadEjDdhBj/vtR60dlrGeYZR6d4HJ
 g8LQMPIxiKPt7npaszBxRxKPnEh+smEUkHiPcSY9bI0GkaOU5uh7WEFMo
 HIDNN9jkvSqu9rhIkCai6uI132OApdNi4CVqUhyUA4MW9pXB7qdfSmJFV
 Xng+rY3CYHiCZ4hWyCaiL/55NxJFfD8GlaYU/fryfiPVBUFnqg4y4X+VH
 AN43Euu2IepzYxWJkGuB7w2+2WkAXOE+7ijXc5Kso/Oamd+eCxMZw3aNu w==;
X-CSE-ConnectionGUID: wsCHn6wXSHmpCOUJVnK4/g==
X-CSE-MsgGUID: g9do6syoQ6C0WPy3keKA/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40127926"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40127926"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 11:29:35 -0800
X-CSE-ConnectionGUID: og+/y7OBReqwiZbAt21k1A==
X-CSE-MsgGUID: +sZUyfpVT5WyDKgVWhnhBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="150416872"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 11:29:35 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI 06/13] drm/xe: Remove leftover pxp comment
Date: Thu, 13 Feb 2025 11:29:02 -0800
Message-ID: <20250213192909.996148-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213192909.996148-1-lucas.demarchi@intel.com>
References: <20250213192909.996148-1-lucas.demarchi@intel.com>
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

Not being able to initialize pxp is fatal if the platform is expected to
have it. Update comment after commit 9c9dc9ba4a00 ("drm/xe/pxp: Fail the
load if PXP fails to initialize").

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7e87ef52489a6..50e16a3b489ef 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -878,7 +878,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_fini_oa;
 
-	/* A PXP init failure is not fatal */
 	err = xe_pxp_init(xe);
 	if (err)
 		goto err_fini_display;
-- 
2.48.1

