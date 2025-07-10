Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678D4C83F1D
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 10:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D31E10E8AA;
	Thu, 10 Jul 2025 10:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IMrz7n73";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E840F10E8C7
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 10:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752144080; x=1783680080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d7P8gLIxNiS7uR+p0ueD5SdB22CjmVI8pb9sKb9TaY0=;
 b=IMrz7n733pcaYhv1WL2xdc4R5iStHax5GNQsr+OvZYkz3P4UYOOqiERK
 MBT/TkT+Zs0b89sn7FYZ5aMrg7sdwP5/5JNW9mKDi3oXzkODsGLiBQY7N
 KoIvj3UQZnOPD3ZavsotvXtpRMOUG5kjgQMo9zbm6dqVZUSeEIQHCShQm
 iMtuACCS/8yE5gO9BsbZjsjULt4B46B7iwlLg7xhkCjBUNh0P8CuXpOyc
 WmI1fi4aPNDO91gkz+Bcv9TzcPyu7LKm0EIrcsp4258whmb0/azwhlsP4
 QLtsz64rvhxYI2juL9Xf8Gb8qgawRITyusuxa7fjVYfQIxND770O8y5a0 A==;
X-CSE-ConnectionGUID: RqcW2Fv1RfqdkxzziWDRRg==
X-CSE-MsgGUID: 2MvIJKfJS8qiae9fVtt1BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54351979"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54351979"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 03:41:20 -0700
X-CSE-ConnectionGUID: agZG7uq1QeiqcB1TS0wFfw==
X-CSE-MsgGUID: 73uMYpIQS8GHQw3UQlZfXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="160055152"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 03:41:19 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 1/2] drm/xe/bmg: Don't use WA 16023588340 and 22019338487
 on VF
Date: Thu, 10 Jul 2025 10:30:39 +0000
Message-Id: <20250710103040.375610-2-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710103040.375610-1-jakub1.kolakowski@intel.com>
References: <20250710103040.375610-1-jakub1.kolakowski@intel.com>
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

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

These workarounds are not applicable for use by the VFs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Tested-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Acked-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 96cc33da0fb5..e7ed5d583d68 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -40,10 +40,10 @@
 		GRAPHICS_VERSION_RANGE(3000, 3001)
 		GRAPHICS_VERSION(3003)
 22019338487	MEDIA_VERSION(2000)
-		GRAPHICS_VERSION(2001)
+		GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
 22019338487_display	PLATFORM(LUNARLAKE)
-16023588340	GRAPHICS_VERSION(2001)
+16023588340	GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf)
 14019789679	GRAPHICS_VERSION(1255)
 		GRAPHICS_VERSION_RANGE(1270, 2004)
 no_media_l3	MEDIA_VERSION(3000)
-- 
2.34.1

