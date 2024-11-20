Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C878ED743F3
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 23:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919DF10E183;
	Wed, 20 Nov 2024 23:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RSu6hcqG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7DE10E817
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Nov 2024 23:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732146251; x=1763682251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N88ohx6TEXhOjdWhpMkVp12wpGF/+AmIPVSSl3k6tt4=;
 b=RSu6hcqGG/NvpNNGxEVKQbU9PT436NvPE1e4pQ+RhwTtR9e8eAXWKvYY
 hnkvsI0wFRe8yLe4qwusb13Q3zTepSCPS0N8YIE0M9aaAr0dlGFXdEYuT
 xQ/V6yshjrslcXHrbKezViah9FaDmZ7RFpzVw6m3n/CFr5oynPF/OrEYP
 Tr2g/QrtbD5AZ4HICZ1+Fka3C4chYr1Ib7GFlwUllDbXXijpQ+IJGeKDT
 wisdQeTrkgYHq9hPTpgVIJ/NH1G6HWLu87UIrzTvqcD/jOdCze92kFWfA
 ExHyvHt/Dap7gLxgBWhbXMm8Zn78TVuTg8NCsbBS0LbJnJBYsLlZpfbxd w==;
X-CSE-ConnectionGUID: vmgBs/TeSFW/pvvu7o4hqw==
X-CSE-MsgGUID: 3TM4UihURe281I4NENXJeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="54733288"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="54733288"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 15:44:11 -0800
X-CSE-ConnectionGUID: 1naHIT/gSqW2drHBa/edhA==
X-CSE-MsgGUID: 6w4uGnYaSN23EL7pHUL26g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="90453679"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 15:44:11 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 12/12] drm/xe/pxp: Enable PXP for MTL and LNL
Date: Wed, 20 Nov 2024 15:43:52 -0800
Message-ID: <20241120234353.1037180-13-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
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
index de5034979ec3..206be1a1a705 100644
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

