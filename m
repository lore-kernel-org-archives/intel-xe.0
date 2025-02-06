Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677FEC02196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 23:24:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332FC10E9C6;
	Thu,  6 Feb 2025 23:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQnJP1eV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D9B10E9A0
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 23:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738884236; x=1770420236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T9V5d89bG44rjA3zePATdr2ZR5HdXKS+b8V/JJnWVQA=;
 b=LQnJP1eVzPS/HJ/DPY6A2Gj4TuZ0p+zwQDfkvGYgSwsaBarN9dTYrZo3
 nmDFYOW+iIX9DnH3iN/odYrLD4F5vJDiBO72+FriWwDBhunCKTPcJhsT+
 OAm6bRNqxtad9fP5dOI9e197niGYBj8xjilPWTZjgykUN7z2R30BUc12T
 nWclEF+nHvTm7RUX9UWZyDrz58u/BQf6jErFD3P8eMANVd83FwvFU2yNI
 pFAVzj44uAVMDRKMD/3iOIfr++yeUrbjU0izQWQZzTnd2AOJgyqayDjEi
 jPXm2fw11+grBB1cLgHK00fV0l7EW+MYIrIvEsyrwIVT5lXpBOk37vmCG Q==;
X-CSE-ConnectionGUID: vth22sRMRJOPTBouL7dhHA==
X-CSE-MsgGUID: Dxc91hCGTUuGg5iYTXxZBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61993722"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="61993722"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 15:23:56 -0800
X-CSE-ConnectionGUID: FigACiEzTJ6bv59MlhI+eg==
X-CSE-MsgGUID: tDfM3urySgqKbxbsPCSOJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134594795"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 15:23:54 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 05/14] drm/xe: Remove leftover pxp comment
Date: Thu,  6 Feb 2025 15:23:23 -0800
Message-ID: <20250206232333.2660325-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206232333.2660325-1-lucas.demarchi@intel.com>
References: <20250206232333.2660325-1-lucas.demarchi@intel.com>
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
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9c97f88bc0455..90275531653fe 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -869,7 +869,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_fini_oa;
 
-	/* A PXP init failure is not fatal */
 	err = xe_pxp_init(xe);
 	if (err)
 		goto err_fini_display;
-- 
2.48.1

