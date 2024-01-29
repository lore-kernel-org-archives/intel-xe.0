Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC67C47DB3
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 21:45:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C6410F031;
	Mon, 29 Jan 2024 21:45:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD07810F031
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 21:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706564711; x=1738100711;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=85gtKhMOBnfI1URfZNpTMzsdL2cbJ7XkTQKLd0KINIY=;
 b=H76YWX3O+ysH6OZmiPInZZsMNAVNF/40aRVOXXUZXIynbDmr7Bg2DegJ
 oueNAq0/MBF6H0cEW1jw6+u8qptIyMLQI02cngVlGALx0E4gfGQF9jvp+
 GUokr+NWnid085Oo1N9Tt9cfz6oAolq8YwO9ip3hp4VQiplDVvjJ72p8A
 779uv8WsNPOrwk2y07PDtYsJNq+gU7QH3vFd3e5jsGcY/geeQ4ABT3huM
 q4XT3Vtbj3okz2WmeZYY5eVsmd0/UqF7xEJSVQt+M99bqmQKvVlkK/XNp
 GAAj4/2M21S2wi07j30ZfZtB1QsyPsC3sQ0m4JILaElWE6zszBiHTRbw1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="406813078"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="406813078"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 13:45:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="931225118"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="931225118"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 13:45:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/xe/xe2: Enable has_usm
Date: Mon, 29 Jan 2024 13:45:10 -0800
Message-ID: <20240129214510.123829-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

When xe2 support started to be added, USM was still not functional. This
has changed, and now USM can be enabled for xe2. Remove FIXME leftover
to allow VM to be created with DRM_XE_VM_CREATE_FLAG_FAULT_MODE.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 62b5e5d0fb62..cde3a63bdc7f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -165,7 +165,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 	.has_asid = 1, \
 	.has_flat_ccs = 1, \
 	.has_range_tlb_invalidation = 1, \
-	.has_usm = 0 /* FIXME: implementation missing */, \
+	.has_usm = 1, \
 	.va_bits = 48, \
 	.vm_max_level = 4, \
 	.hw_engine_mask = \
-- 
2.43.0

