Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3F6C36005
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 22:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBDB10E291;
	Tue, 25 Mar 2025 22:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HqI5Ziq3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F0310E291
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 22:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742940001; x=1774476001;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oT7VJ3OR757T90yl+3DHBNGGcRYlX62qbZmS1feOGs0=;
 b=HqI5Ziq3Vgo5+2/amySsmt5KQypJ4+ovf3B3RofMAb8MJc1qwp2RBQa6
 iZID7d1K8YOBC2dQ88WahoGUkb6iYQYol6PRFcGCy6D73uxDGCZiQ8FqB
 UsXv9sXUYj/UKUbi+1ai9P8BqkbXtpaKVmPxZ65KMRVQWQIoF4Kb3OeWz
 qn/lUpBvWZzf7Pglf3AF4zmaRD/NRBCXpEOikmOl/beynMbdzdwldM1Ed
 4L4EUAyCpPgjnCzN3bR/ijG8rAWY6JBPWGQUS67+998GXYe4H+pswLspA
 z3HARVVbm3Gy1BhTnIaU+WBpaaLN7XOWA3SPZNsSlHAKhCv29sy3j5WPe w==;
X-CSE-ConnectionGUID: RefECcSdSfOPZIEa9BtEhA==
X-CSE-MsgGUID: K7n121oaSFWspAwfEgEMlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44310480"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="44310480"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 15:00:00 -0700
X-CSE-ConnectionGUID: zs10AI+NS1KBZlEwfV0Yhg==
X-CSE-MsgGUID: EpLX6IaDQ8OfRKzZ3hYNPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="155518391"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 14:59:59 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2] drm/xe/xe3lpg: Apply Wa_14022293748, Wa_22019794406
Date: Tue, 25 Mar 2025 14:59:05 -0700
Message-ID: <20250325215936.1454285-1-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250324223347.1433491-1-julia.filipchuk@intel.com>
References: <20250324223347.1433491-1-julia.filipchuk@intel.com>
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

Extend Wa_14022293748, Wa_22019794406 to Xe3_LPG

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
v2: Update commit message to specificly mention Graphics IP version.

 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 0c738af24f7c..9b9e176992a8 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -32,8 +32,10 @@
 		GRAPHICS_VERSION(3001)
 14022293748	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
+		GRAPHICS_VERSION_RANGE(3000, 3001)
 22019794406	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
+		GRAPHICS_VERSION_RANGE(3000, 3001)
 22019338487	MEDIA_VERSION(2000)
 		GRAPHICS_VERSION(2001)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
-- 
2.48.1

