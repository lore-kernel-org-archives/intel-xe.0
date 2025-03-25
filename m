Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2142DC36005
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 22:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A9E10E2EA;
	Tue, 25 Mar 2025 22:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a8TKZOj3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE10010E2EA
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 22:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742942600; x=1774478600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r58/CjQoF5LM/ncaFBY1n9pOVW0sv3qiEhj1O2987Ck=;
 b=a8TKZOj3Y3Tp4OCwrV4DlivNSt4zJNTc7Yf0uWm3CaDo/jm7CyXOkpjn
 fRG75DGEGv7fikS9MQs56CL5poQ52/2xCI6Oy6Yn9WYjy/EizO8tXLHxE
 Bdeyks7YAGdaG1X9jEJJriQO6Yr+JcBKUy5Zx3o2Ug3PSVkRDDGHHnQjL
 XaA/DbcEG2sMW/4uqjrnQWlDa1Ov02/2ciiRlsSBjhN2k4t0Qloo8enw+
 shCrOIOzGU5ebJOnzA3cfj7zT9HHTfOUgKfJQr6H1lwRcc1w149DdDzfV
 Czksw9J/BzwSpbNGl5oceRQovGk/3JP+o93LZ9shtFQtGyVS3ezL0e0g8 w==;
X-CSE-ConnectionGUID: 2YbxwshLQI6eY2QdC6M0SA==
X-CSE-MsgGUID: x5XHhsgUQPO9VTfvJbC9LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="54875976"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="54875976"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 15:43:15 -0700
X-CSE-ConnectionGUID: b9R5fxJ6QbOI6R3Ziv8n0g==
X-CSE-MsgGUID: m4dEbE0xS8anC8HQVDdVQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="125447055"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 15:43:15 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3] drm/xe/xe3lpg: Apply Wa_14022293748, Wa_22019794406
Date: Tue, 25 Mar 2025 15:43:05 -0700
Message-ID: <20250325224310.1455499-1-julia.filipchuk@intel.com>
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
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
v2: Update commit message to specificly mention Graphics IP version.
v3: Add review from v1 as only commit message has changed.

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

