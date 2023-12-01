Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB0DC10DC1
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 15:39:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317BF10E8C8;
	Fri,  1 Dec 2023 15:39:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB4210E096
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 15:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701445188; x=1732981188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=px6y6yLvdRQ7i1AIXz297+gGnbRBjYzIxzbQGS6PB7E=;
 b=CgTo4VHH3510N/WdBKbWnjSGJKvpafEo6gERtUnZxWh6I5CTvFoTRorM
 GUR76RmEcKRFHvTsO6U5Oi3uXp62fdJdajRHKSqoNS0wDIFZRljLN9dJ5
 ERhgcK/oLudtkzdi+bwm9JDzmGxFkl26b5a2wjabUQyxBrGNZkt68jIkq
 iPrIqeWiWgdxV8NFUCuwfUppisMov/NylulXzL0Su84hOW31YhZrXLxFp
 SgrkDyARDqbQobRLRC81JYqEg4BgaosKC718X3KNjUq38/AC0rh+msztL
 Ghd/K8vvdnm44bl52begmd1vTTjhTD/HpzqDV1U5C3I3ym6fQl/yjtjgb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="533583"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="533583"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 07:39:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="840224127"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="840224127"
Received: from wpastern-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.45.65])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 07:39:47 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Dec 2023 17:39:20 +0200
Message-Id: <20231201153923.3433110-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201153923.3433110-1-jouni.hogander@intel.com>
References: <20231201153923.3433110-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] Revert "drm/i915/display: use
 intel_bo_to_drm_bo in intel_fbdev"
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 866520a50df6c22a2af9254e39770517cb874495.

We are about to backport same patch from upstream. Revert local
version.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 05f614f992d6..252f254345a2 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -332,12 +332,12 @@ static bool intel_fbdev_init_bios(struct drm_device *dev,
 			continue;
 		}
 
-		if (intel_bo_to_drm_bo(obj)->size > max_size) {
+		if (obj->base.size > max_size) {
 			drm_dbg_kms(&i915->drm,
 				    "found possible fb from [PLANE:%d:%s]\n",
 				    plane->base.base.id, plane->base.name);
 			fb = to_intel_framebuffer(plane_state->uapi.fb);
-			max_size = intel_bo_to_drm_bo(obj)->size;
+			max_size = obj->base.size;
 		}
 	}
 
-- 
2.34.1

