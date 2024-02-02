Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B341C4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 22:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2784310F13B;
	Fri,  2 Feb 2024 22:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2b+ZhA0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A582A10F13B
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 22:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706914276; x=1738450276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=004gMDCq85H4rSz3QNVNMG3UQSVU2XNCDQmtl6SN4IM=;
 b=d2b+ZhA0lKm4+f6+RJGS5xeQ8v965N3BUOGpkHQPtmuNRRt/HAsTtsSF
 ZidHHE6ccWWQ3lpYyEPVTNqNV1rm+gvx0k+1RS5PxvpNLZF7fTs+wxzsS
 MZAV2+5/3a84FvtkDEizCosFhwu7fPz+7pODU8qenpcZxqiuN+stocn36
 p2yi+NSsuFTeMPrkQ1+LaYMSjWqy6L5a2s5PnOfSOYgZkIdRX4Ynzo7gc
 iKuEOqegRhKVrWAoaKzWqCbev89XddecENIImcfvE4tYxVFaGCptVo64B
 yihWKJMqNrIF5g15oeLmiW/Bkmi2YEtXa0pN8zCZ1iAVGtoMozfiKyXs1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="153752"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="153752"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 14:44:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="823332033"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="823332033"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 02 Feb 2024 14:44:08 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 03 Feb 2024 00:44:07 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Paz Zcharya <pazz@chromium.org>
Subject: [PATCH v4 07/16] drm/i915: Fix PTE decode during initial plane readout
Date: Sat,  3 Feb 2024 00:43:31 +0200
Message-ID: <20240202224340.30647-8-ville.syrjala@linux.intel.com>
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

When multiple pipes are enabled by the BIOS we try to read out each
in turn. But we do the readout for the second only after the inherited
vma for the first has been rebound into its original place (and thus
the PTEs have been rewritten). Unlike the BIOS we set some high caching
bits in the PTE on MTL which confuses the readout for the second plane.
Filter out the non-address bits from the PTE value appropriately to
fix this.

I suppose it might also be possible that the BIOS would already set
some caching bits as well, in which case we'd run into this same
issue already for the first plane.

TODO:
- should abstract the PTE decoding to avoid details leaking all over
- should probably do the readout for all the planes before
  we touch anything (including the PTEs) so that we truly read
  out the BIOS state

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
Tested-by: Paz Zcharya <pazz@chromium.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_plane_initial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index a55c09cbd0e4..ffc92b18fcf5 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -72,7 +72,7 @@ initial_plane_vma(struct drm_i915_private *i915,
 			return NULL;
 		}
 
-		phys_base = pte & I915_GTT_PAGE_MASK;
+		phys_base = pte & GEN12_GGTT_PTE_ADDR_MASK;
 		mem = i915->mm.regions[INTEL_REGION_LMEM_0];
 
 		/*
-- 
2.43.0

