Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F10FC531DC
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 19:00:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B17D10E82B;
	Fri, 16 Aug 2024 19:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="exQv83HE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE0E10E831
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 19:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723834856; x=1755370856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fvGhLqrmie/ivovlf1JiESxZrIeri3RJfcVNACtNFYw=;
 b=exQv83HE8M7JmdXQwyjXLWHO9zdDO1Rhq9OcRATa/R2CjzRERCw29808
 byIW2+94DD2+yU9AeFxYp14J03IL+dlddBlHbRFd99Bq0x54hRey5Jyot
 E8VJ7mqd9Z/MBVfeuZkBIObl83s5+EniWePVDXjwrUmzxzj3qOYUZRYgO
 CnRQZHkO/qXyvpBb3m9W/v/HuyiMA1e9vHyFpo8rG7J1X8a4hMo6zNY2D
 59hsum6A1RJJla2SQF6TsbPmCxhgWWKebrBg9S+xIME9kGERT5P5hzvXy
 20EjBHAGSytUlgL6aNtBQMzzS/zGTnGfOMxmqmBhsddNLhYPdcuIvWKLj w==;
X-CSE-ConnectionGUID: ifEElHVuR0Sg8mLjKIJS/A==
X-CSE-MsgGUID: kCZFVs6wRXSJsW+MmYIUzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21772471"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="21772471"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 12:00:56 -0700
X-CSE-ConnectionGUID: g9+IJpYXTKu8rbo1kNzaSw==
X-CSE-MsgGUID: xbubTc1RQ6uqDW9AVW4x/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="59767992"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 12:00:56 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 12/12] drm/xe/pxp: Enable PXP for MTL and LNL
Date: Fri, 16 Aug 2024 12:00:21 -0700
Message-ID: <20240816190024.2176976-13-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
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

Now that are the pieces are there, we can turn the feature on.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d1453ba20dcd..0807e8a11585 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -338,11 +338,13 @@ static const struct xe_device_desc mtl_desc = {
 	.require_force_probe = true,
 	PLATFORM(METEORLAKE),
 	.has_display = true,
+	.has_pxp = true,
 };
 
 static const struct xe_device_desc lnl_desc = {
 	PLATFORM(LUNARLAKE),
 	.has_display = true,
+	.has_pxp = true,
 	.require_force_probe = true,
 };
 
-- 
2.43.0

