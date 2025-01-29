Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABDCC0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 17:42:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CC410E862;
	Wed, 29 Jan 2025 17:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ge/FZi4S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774E110E85F
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 17:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738172522; x=1769708522;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ItM7MnIkzcuphlZZYc8Bbtj0gF7wrHsLJTbA00+OUZc=;
 b=Ge/FZi4SE1KGj9Kux5/179cCmdgw4lEdN2ZqUZYAUlxm0Ly404aXhxmv
 aXKHOx52ZM8exh6sHGWxRgDBEKu/CafY+HwhSNFa8Z98KTtobzpYd86z9
 3oSUZdKhLPJCkeoftfHwF0KqCcLJRq3PPDKTsAVDvthjS9ra9vy/w1CbL
 e1z2S3WjMOg+kVJmPzHDxqXG919cvtLPShM6RNng/CPpD4jC80V6V8UfX
 l7zu9aCQYZuK0mAdp1Jios3IJ0w5lyaFYnzhUo3XO6BRsrFLbJ6sXlpaj
 V2gSvOG6Ya2F4PsqECFeO95f+p940O80PkRzeyKD8TjfsV/e0rI2t51C7 w==;
X-CSE-ConnectionGUID: nEp2oo95RAmHKPecRjqdwA==
X-CSE-MsgGUID: zmCImsabR0iMJ5o53lVV6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="49354476"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="49354476"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 09:42:01 -0800
X-CSE-ConnectionGUID: Fu5Wlln8RT2byJNK5mmXGA==
X-CSE-MsgGUID: +8+NpQXqT7uXsMbJ0kr06A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="108991717"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 09:42:01 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 13/13] drm/xe/pxp: Enable PXP for MTL and LNL
Date: Wed, 29 Jan 2025 09:41:37 -0800
Message-ID: <20250129174140.948829-14-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250129174140.948829-1-daniele.ceraolospurio@intel.com>
References: <20250129174140.948829-1-daniele.ceraolospurio@intel.com>
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
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index fb3780adfad3..d31e0057f770 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -337,11 +337,13 @@ static const struct xe_device_desc mtl_desc = {
 	.require_force_probe = true,
 	PLATFORM(METEORLAKE),
 	.has_display = true,
+	.has_pxp = true,
 };
 
 static const struct xe_device_desc lnl_desc = {
 	PLATFORM(LUNARLAKE),
 	.has_display = true,
+	.has_pxp = true,
 };
 
 static const struct xe_device_desc bmg_desc = {
-- 
2.43.0

