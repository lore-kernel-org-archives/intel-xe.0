Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C7ACDB471
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 06:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A48789131;
	Mon, 22 Jun 2026 06:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKfhvq8r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C19789131
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 06:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782111578; x=1813647578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dTzRi3r9G7CHAkM5TwfKxZ+uu/rEU5y0+ARVpd58/18=;
 b=PKfhvq8r4O56xWD5eDpsxRbHch3+iz0VCovG/EfU7P6C2WGFtNwA9M05
 8aRN1uyUdhxZaizBzX2nJhUGNUW5/n5gZTY5ovcrIxMbtIjAPnU+JbkP5
 VmhNIi1syRIjkhACk7kva429GyPqZ9PwCWCU0tsNUxt2btw86iHvV+nTd
 qRH7QMMocIBAZ65tm1JR+W5Dl5mrWcil2dPn+g142ITWGqHEcKW5Kx2CK
 qW5qi4SVCH0EzmkpWWRrtX9p63jt196RNVKyfeCMpJWifPAuwMnncRd7a
 U1hg7aEdecI705TVzw6pJ2+/hnFFffUR2Fj8/KbncFWuiT6fHNwMCiA3d A==;
X-CSE-ConnectionGUID: QdO7oVOHQbiyoDOEKxwUrg==
X-CSE-MsgGUID: VtzI8tLXT7SUdqPiw8faFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82928709"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82928709"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 23:59:37 -0700
X-CSE-ConnectionGUID: Ip3ibomhT3GUpwZtgAA8iw==
X-CSE-MsgGUID: sAeBKB8wTlWmwGmyiUXXQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="251068094"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa004.fm.intel.com with ESMTP; 21 Jun 2026 23:59:35 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 2/9] drm/xe: add helper for multi page-size support
Date: Mon, 22 Jun 2026 12:30:24 +0530
Message-ID: <20260622070031.2445502-3-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622070031.2445502-1-naresh.kumar.g@intel.com>
References: <20260622070031.2445502-1-naresh.kumar.g@intel.com>
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

