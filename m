Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBC9C36002
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 22:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B14489207;
	Mon, 24 Mar 2025 22:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGxx51c0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7C189207
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Mar 2025 22:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742855633; x=1774391633;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=whKsNGDTNC6Tj79JC2jV4en/kM1OBjunRGDQviCJsYY=;
 b=JGxx51c0ZzIULocfSr3F1jcnZ1dgBWwMFCdFSCX4JakJJyyf/AKzNXGU
 8FbdnpFvMI7o1R+lwGcxQp+lo+uX5F4iwyDg8Z3BZCVT9FxpNP51mhWVr
 JTerMvTPF6IxwApEcTemLSN4+h4XNbrDG7MrWRkVRfBYDsDEhXlNGrWrO
 R6y7XWM6NWOrnrwc5JhYUxM4e/mX/14CAep9uh88YHfvNxx7aHquv1S9E
 8/gBnCWQvL+87d/sDz4w1bdJxL292Tdv9QpG9uwFuB8htO9WfUe0C+gRE
 c6NtKFQuy2MpkddNrg+zdzrsAZNuIGpIpQqZkgHx4SKkB9p4/Va259+p2 w==;
X-CSE-ConnectionGUID: 0RpY9mrkQ2alLlP3bBqFeA==
X-CSE-MsgGUID: mwOyggslQsWiaepBmNgXdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43240799"
X-IronPort-AV: E=Sophos;i="6.14,273,1736841600"; d="scan'208";a="43240799"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 15:33:53 -0700
X-CSE-ConnectionGUID: hnmM9LBUQ/aIXbv0BYMtLw==
X-CSE-MsgGUID: o910CZZbT7CuDM69oKOssw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,273,1736841600"; d="scan'208";a="129372576"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 15:33:53 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH] drm/xe/ptl: Apply Wa_14022293748, Wa_22019794406
Date: Mon, 24 Mar 2025 15:33:47 -0700
Message-ID: <20250324223347.1433491-1-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.48.1
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

Extend Wa_14022293748, Wa_22019794406 to PTL

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
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

