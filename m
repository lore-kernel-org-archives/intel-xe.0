Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A68AC021A0
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 22:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9B910EBBC;
	Fri,  7 Feb 2025 22:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1zfUtgB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC78010EBB7
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 22:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738966803; x=1770502803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CsX27WQ17cEIol+8ZVctg9JTzs1Kv51s5ti9i1VFxXY=;
 b=b1zfUtgB5ibM1rEpDHu4RWrpbgRaOXVqGUh+Z6Xu1Atb74AAvjJOy98R
 aF5+7VC+UHGRn1y4Cfxb3UWQzdZiifO6R57OLLVIH4C0qbrtQ6iN3WHmE
 6vfqwYIwNRQOM9W6aCQ6HZ1k1efi9n0EW4VA1gLOOqIzU7qpGd3ukLzf7
 FvRKEhbnH80Q0G19Z5A1O5STKSi+Xhg+SD3dIlnrOUNC0zUhkGhHvB4pO
 Dj63050yprhnAG7uP5At0/PEoqg96EkLbTtEeA9EyrzN9lJVbDaGaB0gg
 kGiO2vO/xEmZ7fk06avQJu/Mzg65hKjdb1jp/YCLa0X0e7rDabHTnJgvs w==;
X-CSE-ConnectionGUID: ZYIEt8c2RE+MWp4YYUhiMA==
X-CSE-MsgGUID: wnpzSaA3TqC7hUu/ZzopsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51050685"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51050685"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 14:20:02 -0800
X-CSE-ConnectionGUID: mfTPSP/kQE2kHsbKTM1hiw==
X-CSE-MsgGUID: FOiWjaszSkCl0FVYhFtj8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="112158412"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 14:20:02 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 05/13] drm/xe: Remove leftover pxp comment
Date: Fri,  7 Feb 2025 14:19:37 -0800
Message-ID: <20250207221945.2878241-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207221945.2878241-1-lucas.demarchi@intel.com>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
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

