Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF44BC43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 16:33:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE2D10F05F;
	Wed,  1 Jul 2026 16:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="niY9R1Bx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420C710F05F
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 16:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782923593; x=1814459593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dTzRi3r9G7CHAkM5TwfKxZ+uu/rEU5y0+ARVpd58/18=;
 b=niY9R1Bx3s+2Qdbn8tQSD8PmtpRDghoU1XZLXuQOKRWqLBa+Gzw0Mgeo
 joUmMsPIZZRtKLiUToSWyQ67syi8K6O9HGSPXH1aOMBBaDQPuIrdyuXP3
 ZK16TIJlnhjAZ7ZpAdzLOHNhedUF5MSqmx2MR0QIKrQ5Dchf36vTLKLO0
 G6pXUwPL7QJk6T00fi4fBdaRNX72OBC3taVl84czh1/eoTxQ9nQd4fxOU
 9q2CgThQXXCPPDGiuaPEw70WIwpGAzVwZkblFL/rRo6qsgNS8X5lKz34o
 oCrpfLKR7Lw3mwkScR05+NgBV+AmyWn38mJz0fJy/4FtDqVlBb9229uu+ A==;
X-CSE-ConnectionGUID: h8K1rdhoQWCupv4ykYAsKg==
X-CSE-MsgGUID: 1d2N4rDzTHuh6GMyHmoMRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82779247"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="82779247"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 09:33:13 -0700
X-CSE-ConnectionGUID: iy0AKh/0TDO0x3hrXY9+PQ==
X-CSE-MsgGUID: PiruXv1cSUeXKDsew6UACA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="256196427"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa003.jf.intel.com with ESMTP; 01 Jul 2026 09:33:12 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v2 2/8] drm/xe: add helper for multi page-size support
Date: Wed,  1 Jul 2026 22:03:42 +0530
Message-ID: <20260701163348.3432358-3-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701163348.3432358-1-naresh.kumar.g@intel.com>
References: <20260701163348.3432358-1-naresh.kumar.g@intel.com>
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

Introduce xe_device_supports_multi_pagesize() in xe_device.h
to centralize the platform check for debug page-size
allocation capability.

The helper returns true for dGFX platforms with
GRAPHICS_VERx100(xe) >= 3511, making feature gate easier
to reuse and keeping the capability test consistent across callers.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 975768a6a9c8..a6ccc9043a83 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -197,6 +197,11 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 	return atomic_read(&xe->wedged.flag);
 }
 
+static inline bool xe_device_supports_multi_pagesize(struct xe_device *xe)
+{
+	return IS_DGFX(xe) && GRAPHICS_VERx100(xe) >= 3511;
+}
+
 void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
 void xe_device_declare_wedged(struct xe_device *xe);
 int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
-- 
2.43.0

