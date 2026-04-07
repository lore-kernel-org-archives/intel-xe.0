Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFE6FF510D
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 15:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E2110E47B;
	Tue,  7 Apr 2026 15:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6ratbIv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F62410E478;
 Tue,  7 Apr 2026 15:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775577075; x=1807113075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=no2LDq2BQ4Xzyn9tPy5jxjdH0GAm0YBJaf4pr5BuS5M=;
 b=a6ratbIvDzKBE5rg0DiAnbA4/2F3pVwDRh6FbPVfQc+axBNoyYNHPVpq
 +jzZiD3/MInIZw8WrV2UqkdYJPHHehwmJDk9GV7xZ4B9p6404nQfJ3V//
 bV+lKf+1pK7Gj8U/rOEG5Rs3UdobZVDPbFftcIcHO+EgHYRyMiyH0KSC9
 XaZKsgX4yZpOEvsTh8bsSrjeqsIFAPI2XmZRxL6wC0RkiQXi6kcMIhUob
 WPMAiZSJDBDniPs7YsR7jaK8MrF0XeY2GLQHUztc/um4TSGJuIM/iFlAM
 QTsL+z2a36D1rAy5wTqUmDp3n6/UEbZ16EnhwBti5kIEOR+tujzhWh6jt Q==;
X-CSE-ConnectionGUID: H/A0HpfzSxiMB7ke2RAwcw==
X-CSE-MsgGUID: yEVecJmcSoSYTeVEel8keQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="101999130"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="101999130"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 08:51:15 -0700
X-CSE-ConnectionGUID: XHKqiiAAQJeFLPh9320ePQ==
X-CSE-MsgGUID: 1ROR7ne0QIi5G9tywqklTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="221633766"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.211])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 08:51:14 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 05/12] drm/xe/fb: Remove weird VMA end alignemnt
Date: Tue,  7 Apr 2026 18:50:46 +0300
Message-ID: <20260407155053.32156-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
References: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

For some reason xe is also alining the end of the vma. That
should not be necessary, so don't.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 35e5c322f8b0..72efafb189f7 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -307,8 +307,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 		size = intel_rotation_info_size(&view->rotated) * XE_PAGE_SIZE;
 
 	pte = xe_ggtt_encode_pte_flags(ggtt, bo, xe->pat.idx[XE_CACHE_NONE]);
-	vma->node = xe_ggtt_insert_node_transform(ggtt, bo, pte,
-						  ALIGN(size, align), align,
+	vma->node = xe_ggtt_insert_node_transform(ggtt, bo, pte, size, align,
 						  view->type == I915_GTT_VIEW_NORMAL ?
 						  NULL : write_ggtt_rotated_node,
 						  &(struct fb_rotate_args){view, bo});
-- 
2.52.0

