Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AB4EF99F0
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F61910E854;
	Fri, 13 Feb 2026 22:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RhKf06Bl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF66610E844
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021959; x=1802557959;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=EpIum5GoKyLPV+06xSTaZGo9748pFqBnkafP4NCtd0E=;
 b=RhKf06BlrJ1O9DLbUKNg30LblIqZLc5ZSou22e/lNa3gd0sYWHQQjaUK
 FoQI21Eejrr3JyJsJD0WWnUNP7dzuZDa2LKjFqnKYUyNsUSzZB+oqEECu
 be9OMQk+e6BaJ5QroILrhB9W4kJwz5CdTKOGdgKWFpSf/NS/Eg7133Eu9
 GRrvZH7RJskL8TsXwOjtuTmzWQje1Eb3DVEkwcfK6m0klAH3yJCT28V4E
 kjjPutknafKcgnByBPr8xwp8oP8Ury/kQ9rNCc6KkJEMdCr3HvIUTgif5
 pcUV5PUaBnLrYCU1zFOmgttIG/FrhqR/0IH9ffDtKDyLJ0odG9kXNiPoY w==;
X-CSE-ConnectionGUID: iWUjanP7RHeJCNhR8Cwt5Q==
X-CSE-MsgGUID: loJosBRkQFip9EfeppSlSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654450"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654450"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:38 -0800
X-CSE-ConnectionGUID: BTB9jvAURq2JBv6LWJsPfQ==
X-CSE-MsgGUID: eCVAzuKvSfmtIu2Yyq7QBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705685"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:57 -0800
Subject: [PATCH 22/22] drm/xe/wa_oob: Consolidate some OOB rules
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-22-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2888;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=EpIum5GoKyLPV+06xSTaZGo9748pFqBnkafP4NCtd0E=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aEYuPCcK1zJd5q3VhD7tNOzAImvVEzS5LCa
 iq3X9YlqG6JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mhAAKCRBNeSQFyHKQ
 BH6eD/4r0U8GiMizn7vn6kCBGf8bC1AQ64/biriWXrTlR0ywlgOJS02j7RYfQ449FlZEqRP8F2/
 g7p3KleiUwEk3gR3drIWx3vEjEDtyZ5bfP5zAwLBvBEIEgAht1R3dwsv2V1zgdquHC+vk21HGoR
 DOzr+f/UA3iBNw2Ll/ZT9b41EJM4fJZ345HympFSpl7Gj5Uq6GFG877i6cN9ijSxmWCBpeSeNVC
 eG35eZjFMVu8gUS8YUdsmcW6PcdoM80VhVbGkmNxuAd/PpyagKns34uiBcnkzWnzRUsK0L0CJpZ
 /VtAjurXdlZ/Z0JW65isgRpYAhqw+i+2nmVGa++c2rmCOB2CkIXPCOa5ZG8QrgP23TM9su8k47C
 0E/WarbQXPp3g6EeMNrRGV2yRw5EosBq8qVG1yrwg/AYkooCuGvROYPacF3BffzgTyC6bYmobvb
 zJouXoH6psup1ziOlFN8m8UxdAA7SMXJ3xlj6LIqu5jeLQ1+b0690jjcxeYrpZMpcjTfkUvf67K
 u/DPR8zrAFcU9ZFSH3VlAojKE7uUiN+xAX0N3BqaF3Jd4S2Ciw7I9yOBbzCx5CXVbrBYKfzmbgi
 LVacGTTiJulJLxmwjKlXDI0TKOZ0t5orG7bZs93knILKXpY9c8KyKDLhEE51+stbDdaY7lNeMOD
 KZ9XdHBvGTID5dg==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Given the new policy of allowing graphics/media IP ranges to extend over
unused IP versions, we can consolidate some of the OOB workaround rules
and simplify the table.  If new IP variants eventually show up that use
these unused versions (e.g., media version 30.01, graphics versions
20.03 / 30.02, etc.), and if an existing workaround does not extend to
that new intermediate version, the ranges will be split back apart as
part of the enablement work for that new IP version.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index c3222d9504889b5175fdfa73db0bf4e9910a277d..80b54b195f20c372a6816ce988b5e7e0b75270c2 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -24,18 +24,9 @@
 		MEDIA_VERSION(2000)
 16022287689	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
-13011645652	GRAPHICS_VERSION(2004)
-		GRAPHICS_VERSION_RANGE(3000, 3001)
-		GRAPHICS_VERSION(3003)
-		GRAPHICS_VERSION_RANGE(3004, 3005)
-14022293748	GRAPHICS_VERSION_RANGE(2001, 2002)
-		GRAPHICS_VERSION(2004)
-		GRAPHICS_VERSION_RANGE(3000, 3005)
-22019794406	GRAPHICS_VERSION_RANGE(2001, 2002)
-		GRAPHICS_VERSION(2004)
-		GRAPHICS_VERSION_RANGE(3000, 3001)
-		GRAPHICS_VERSION(3003)
-		GRAPHICS_VERSION_RANGE(3004, 3005)
+13011645652	GRAPHICS_VERSION_RANGE(2004, 3005)
+14022293748	GRAPHICS_VERSION_RANGE(2001, 3005)
+22019794406	GRAPHICS_VERSION_RANGE(2001, 3005)
 22019338487	MEDIA_VERSION(2000)
 		GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
@@ -52,18 +43,12 @@
 18013179988	GRAPHICS_VERSION(1255)
 		GRAPHICS_VERSION_RANGE(1270, 1274)
 1508761755	GRAPHICS_VERSION(1255)
-16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
-		MEDIA_VERSION_RANGE(1301, 3000)
-		MEDIA_VERSION(3002)
-		GRAPHICS_VERSION_RANGE(3003, 3005)
-16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
-		MEDIA_VERSION_RANGE(1300, 3000)
-		MEDIA_VERSION(3002)
-		GRAPHICS_VERSION_RANGE(3003, 3005)
+16023105232	GRAPHICS_VERSION_RANGE(2001, 3005)
+		MEDIA_VERSION_RANGE(1301, 3002)
+16026508708	GRAPHICS_VERSION_RANGE(1200, 3005)
+		MEDIA_VERSION_RANGE(1300, 3002)
 14020001231	GRAPHICS_VERSION_RANGE(2001,2004), FUNC(xe_rtp_match_psmi_enabled)
-		MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
-		MEDIA_VERSION(3000), FUNC(xe_rtp_match_psmi_enabled)
-		MEDIA_VERSION(3002), FUNC(xe_rtp_match_psmi_enabled)
+		MEDIA_VERSION_RANGE(2000, 3002), FUNC(xe_rtp_match_psmi_enabled)
 16023683509	MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_psmi_enabled)
 

-- 
2.53.0

