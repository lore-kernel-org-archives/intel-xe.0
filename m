Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33ED6C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 21:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022E410EDA9;
	Fri, 12 Jul 2024 21:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mR7AxTrl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876B610ECDC
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 21:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720819773; x=1752355773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OXTMPRTYVVEC6+A3HXptL47d/zIocm9VQnaPiQeyai0=;
 b=mR7AxTrlDAor1N0cI/MwW8r9B7GleWb4wtWNlOYXOzMYvIuscF3RYuNU
 y1T9WNGua8XlZ4ivVL6XI1LItwpkVS/DaNpgzeYEFW5xPJcXZeeWsRgIx
 VozdXOP/dYWrrtIfgyDvr6Zd2MQE+CC9gLi6kQrN1V/ddEdAOusOfWs+o
 LKbPOjNPaxDl2x9LhLUAMD970wT5D04IQPS6tkPr6XfFjvdOVOHfnpCw6
 5jE9mTXPGWhY4cCWkCfsTO8uxx3XvNsR74ZHZ3VoOnEfhnMzj4lnjD0DC
 Iuxw32xCMyGnrkM4b1mD0ZfgVvDG56IU7qCW28gPEuvCel/SXdGT1hpOz w==;
X-CSE-ConnectionGUID: 6eZJocg0TgKmcGBTiRzU0Q==
X-CSE-MsgGUID: 9R8wpQdvSPmuSdH/oO/oXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="17990181"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="17990181"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:33 -0700
X-CSE-ConnectionGUID: Tbo9U7VITbG2SBGT0MTxJQ==
X-CSE-MsgGUID: oF6rdfl+QxOWdv5atCasxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="53864616"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:33 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [RFC 14/14] drm/xe/pxp: Enable PXP for MTL
Date: Fri, 12 Jul 2024 14:28:58 -0700
Message-ID: <20240712212901.2684239-15-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
References: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
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
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index de0d9f8bba2c..764f58003bea 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -333,6 +333,7 @@ static const struct xe_device_desc mtl_desc = {
 	.require_force_probe = true,
 	PLATFORM(METEORLAKE),
 	.has_display = true,
+	.has_pxp = true,
 };
 
 static const struct xe_device_desc lnl_desc = {
-- 
2.43.0

