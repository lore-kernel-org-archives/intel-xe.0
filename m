Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BC7C021B6
	for <intel-xe@archiver.kernel.org>; Sat, 22 Feb 2025 00:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FFC10E0E9;
	Sat, 22 Feb 2025 00:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WMB7+u5B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAAC10E0E9
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Feb 2025 00:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740183069; x=1771719069;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cwSZu3HFifaf1Mb09pQGTs83vz8lobFRrr9DxWPGYj4=;
 b=WMB7+u5BtlZRrdpgTBjVwzfEhgvgAidOMHb1yHvx/MLkhTppOlH6ComK
 aG40cACsYxgC4WhLhXEGsvNsqelNe4VxxP+C4NV2m8i32atPY9lbisCCM
 6QxceabMkTEeIJpvS/L3ByHObvfCQeZ8u32GVtny2GLmtwxhdAQTfh9S6
 tolg4v7eqpLzeMbzjkiLJWY3az3x0RT1x0RNnFMs/S+H2yxqbEQBCjyod
 qhACRFLeoI3Zymp4YDOFYZ70g5orXjg/qktWdSbZmRQajgVpV2NhRaLWL
 nKbXDK2iaXCiZ6GpYjPOoQOegyPiFEP0Pa4VXoy3WNrMGsMCnBMN9KrK9 w==;
X-CSE-ConnectionGUID: kfONOEUxQ8i/ZxGW9xuAeg==
X-CSE-MsgGUID: jIk11Z6dRg2Pp+hQKTMSnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44926387"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="44926387"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:11:08 -0800
X-CSE-ConnectionGUID: gS2l0AsPTfe1+ugXWDXRnQ==
X-CSE-MsgGUID: XoZsZUOnQ4KT2D4EDGsMqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="115704931"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:11:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2 02/11] drivers: base: devres: Fix find_group() documentation
Date: Fri, 21 Feb 2025 16:10:42 -0800
Message-ID: <20250222001051.3012936-3-lucas.demarchi@intel.com>
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

It returns the last open group, not the last group.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/base/devres.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index b955a2f9520bf..d8a733ea5e1ac 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -576,7 +576,10 @@ void *devres_open_group(struct device *dev, void *id, gfp_t gfp)
 }
 EXPORT_SYMBOL_GPL(devres_open_group);
 
-/* Find devres group with ID @id.  If @id is NULL, look for the latest. */
+/*
+ * Find devres group with ID @id.  If @id is NULL, look for the latest open
+ * group.
+ */
 static struct devres_group *find_group(struct device *dev, void *id)
 {
 	struct devres_node *node;
-- 
2.48.1

