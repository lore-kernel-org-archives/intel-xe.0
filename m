Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B39C021B5
	for <intel-xe@archiver.kernel.org>; Sat, 22 Feb 2025 00:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9FB10EB4A;
	Sat, 22 Feb 2025 00:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eEoUuqOI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BED210EB40
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Feb 2025 00:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740183070; x=1771719070;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=W2N7Z74Yggn3/q3LtVR3hvxjJ7GdiyJdMnU+vi2bXgw=;
 b=eEoUuqOIhx6mJzI5C0PpIV08SxjcG8qdA7NL6doSe29y7CyqKL0m634t
 jVP4T7cWlHCXF41a1fAJ/g5LBJy+vild1GlocR+yKwQSJy4egfNGPkKEb
 w/C4A0Zp3gzwchpCoqHg5L+E5vcnEzFawmM4Gki0yFdg8yi7LfmKlCnRs
 94hF1g5CMXJGH1pVjwGUHgG4q00YeBefN2JRPaQEIFwigtxRT8MqNuqNr
 o1eIO24DNc6sv97MxYanpYkcEAFilQFK0qoAVmLgpelo6od7LX1NE+cvP
 mSpleEvBvFB9oc3JtJypcZ2LdWn5YNoZdpi7sDbFuFf1HWk2RPbka54Ko w==;
X-CSE-ConnectionGUID: EpOg88r0R3+6dv3gEM/lcg==
X-CSE-MsgGUID: wy2OKgUeRiifHPF6hKJZWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44926390"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="44926390"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:11:09 -0800
X-CSE-ConnectionGUID: YgIMBT+ySGmCLEa035FEng==
X-CSE-MsgGUID: qdJwrCOrQB+Vq50eoRV7zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="115704941"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:11:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2 05/11] drm/xe: Switch from xe to devm actions
Date: Fri, 21 Feb 2025 16:10:45 -0800
Message-ID: <20250222001051.3012936-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222001051.3012936-1-lucas.demarchi@intel.com>
References: <20250222001051.3012936-1-lucas.demarchi@intel.com>
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

Now that component drivers are compatible with devm, switch to using it
instead of our own.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 2 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 02a413a073824..c26108f54389f 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -184,7 +184,7 @@ int xe_display_init(struct xe_device *xe)
 	if (err)
 		return err;
 
-	return xe_device_add_action_or_reset(xe, xe_display_fini, xe);
+	return devm_add_action_or_reset(xe->drm.dev, xe_display_fini, xe);
 }
 
 void xe_display_register(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 31c90577faf0b..8cf70b228ff3b 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -490,7 +490,7 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
 
 	gsc->proxy.component_added = true;
 
-	return xe_device_add_action_or_reset(xe, xe_gsc_proxy_remove, gsc);
+	return devm_add_action_or_reset(xe->drm.dev, xe_gsc_proxy_remove, gsc);
 }
 
 /**
-- 
2.48.1

