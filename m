Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6EFCD5BAC
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 20:04:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A315310E2BC;
	Fri, 22 May 2026 20:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hzcME4Q8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721AD10E2BC;
 Fri, 22 May 2026 20:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779480273; x=1811016273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7uL8luzHMNAsbyyAVwTGNpBOirPpXnDpRrhTlOcl/ps=;
 b=hzcME4Q82CmZSfgFmzwI2YpW0C3KSylW4O2L3mF+me/m8efiF0zLRXYn
 Bh3E7vgZLo+sEk6XA81x56v9ta6Ft8m+2y2ucbYntqe3Y75MDcMB9BKvv
 kwt52W33kAxcKqtXjztZ3K/e3/spwlnZsciyNBEUarIHQylGKDcvxGoi5
 71y2aXjVvKnXM0neVibTY/8CUqioPkkNTp3aLWhWX16b93riEbavLnRj3
 ojLTDfdXf/Hq0Wu6VpVTvo7tUO0CKCZaf3ClEH8+Bar3a64ouWRVDrE9O
 mb2UtUmNG/X7v17UJCirga8ufsoISynOSWHgxr8Baay35N5vLiILpIsHN w==;
X-CSE-ConnectionGUID: LosNFgHFQoKnAQQMspkzKw==
X-CSE-MsgGUID: 4JOAWgyFT5uuQkqMSQKRPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80396815"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; d="scan'208";a="80396815"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 13:04:32 -0700
X-CSE-ConnectionGUID: IUIqwtwMToixXV4ZnxWDhA==
X-CSE-MsgGUID: fkwG694zRyWhfFUXylvdOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; d="scan'208";a="234649154"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 13:04:31 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 09/10] drm/i915/bw: Remove deinterleave fallback for TGL+
Date: Fri, 22 May 2026 23:03:45 +0300
Message-ID: <20260522200346.17377-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260522200346.17377-1-ville.syrjala@linux.intel.com>
References: <20260522200346.17377-1-ville.syrjala@linux.intel.com>
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

Remove the deinterleave fallback calculation from the TGL+ codepath.
The fallback is using the ICL deinterleave calculation which was never
in the TGL+ algorithm. All supported memory types have the correct
deinterleave already specified for TGL+ anyway, so this is dead code.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 39191f8579df..8256ad8bcc8b 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -608,8 +608,6 @@ static int tgl_get_bw_info(struct intel_display *display,
 	    (dram_info->type == INTEL_DRAM_LPDDR4 || dram_info->type == INTEL_DRAM_LPDDR5))
 		num_channels *= 2;
 
-	qi.deinterleave = qi.deinterleave ? : DIV_ROUND_UP(num_channels, is_y_tile ? 4 : 2);
-
 	if (num_channels < qi.max_numchannels && DISPLAY_VER(display) >= 12)
 		qi.deinterleave = max(qi.deinterleave / 2, 1);
 
-- 
2.52.0

