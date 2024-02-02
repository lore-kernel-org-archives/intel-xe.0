Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32076C4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 22:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EF010F140;
	Fri,  2 Feb 2024 22:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DWukIpqu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE75910F145
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 22:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706914303; x=1738450303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MTM7GasKa4ke1PKew9Bk65t75LVrciRlYcjpgF1OJiw=;
 b=DWukIpquZndippOanoJhteWqusIadRT/PmZJsHbpJADvwb29ere9YDbh
 HhOVQWfMuGYoGdPsroUgrcOpu4DAy4yOujZTWUxasujf4CFwrTTsp+WkE
 S7Fehjr8yOafzrZRn4d/t7Ews/vwB7TWOCCjseEt9ZiwoGaDkPp0omMNT
 EHFwRTVEUBpVwclOZ1ONc0TUnkyUzlVgovjpAtCnlZTvqyyvm8YTl7WUl
 gGM/T1Yk3v4uM5dXgpLq9Ph3zCdjD1+jZ1wKMQL/Cd67r3RXqDXh9krG8
 3I7CnruSzVLm9Osv7wR5emd1Qk4QrM5BnEoOPogjSCD7YrO4Mg+Ja7Dpf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="153790"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="153790"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 14:44:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="823332067"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="823332067"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 02 Feb 2024 14:44:30 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 03 Feb 2024 00:44:30 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Paz Zcharya <pazz@chromium.org>
Subject: [PATCH v4 13/16] drm/i915/fbdev: Fix smem_start for LMEMBAR stolen
 objects
Date: Sat,  3 Feb 2024 00:43:37 +0200
Message-ID: <20240202224340.30647-14-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202224340.30647-1-ville.syrjala@linux.intel.com>
References: <20240202224340.30647-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The "io" address of an object is its dma address minus the
region.start. Subtract the latter to make smem_start correct.
The current code happens to work for genuine LMEM objects
as LMEM region.start==0, but for LMEMBAR stolen objects
region.start!=0.

TODO: perhaps just set smem_start=0 always as our .fb_mmap()
implementation no longer depends on it? Need to double check
it's not needed for anything else...

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Tested-by: Paz Zcharya <pazz@chromium.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev_fb.c b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
index 1ac05d90b2e8..0665f943f65f 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
@@ -79,7 +79,8 @@ int intel_fbdev_fb_fill_info(struct drm_i915_private *i915, struct fb_info *info
 		/* Use fbdev's framebuffer from lmem for discrete */
 		info->fix.smem_start =
 			(unsigned long)(mem->io.start +
-					i915_gem_object_get_dma_address(obj, 0));
+					i915_gem_object_get_dma_address(obj, 0) -
+					mem->region.start);
 		info->fix.smem_len = obj->base.size;
 	} else {
 		struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
-- 
2.43.0

