Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85788C88E47
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 15:48:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3876810F1F0;
	Wed,  9 Sep 2026 15:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/bFHytv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF7E10F1E0
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 15:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788968879; x=1820504879;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oLSU59ScGc4fReM/vHKENeNZ64rIz08b847IWNPXf7Y=;
 b=G/bFHytvdzjwewBX0RoatPxcIkSC1g/ekVjc1iuwL7YhXXvxw2gy4sUd
 X/FRDf1DqdiSTeeIF06qwRF6dOsS7qPOIpXy1x5cMX42wB+CQ9RsxkOcA
 4zJAkZodVl/uQWiZxs5fvWpieeSUvbwmbvacFIrJIw5T7Z3T/M5kusEft
 BLbl7foU18ETwjHrNknRPs2xjduMVDTYtNo6Iu/FblpkUiEpwvyC+ikQQ
 Xy5d8H+htMK6Ul2FArWiiKxmn5ey4jywqvhSR01EGh95/bpxVIJ96GYf4
 /iypvfmScGr1KjcXkm5lZL4GqK4+yYGMAn52cuNv/ekrHoQzw0kKLX2uL g==;
X-CSE-ConnectionGUID: iIBoUqOkRn2b0EyVBfu/CQ==
X-CSE-MsgGUID: nsrkg4QATMSg7/u+i7yzzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93091823"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="93091823"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 08:47:58 -0700
X-CSE-ConnectionGUID: W+FRGdgbQhmNu/MDfHUFyg==
X-CSE-MsgGUID: 4CsNGzIPT0CJVuA7DrIWkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="268102511"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 08:47:57 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v7 07/20] drm/xe/vsec: Correct locking order
Date: Wed,  9 Sep 2026 08:47:46 -0700
Message-ID: <20260909154739.1515514-29-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
References: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
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

Xe locking order is power state first, and then local locks.

Reorder locking to correct usage.
Use explicit functions because of multiple locks.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 71bc359b2ad1..dd7723ba6c1c 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -158,16 +158,19 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	telem_addr += offset + user_offset;
 
-	guard(mutex)(&xe->pmt.lock);
-
 	/* indicate that we are not at an appropriate power level */
 	if (!xe_pm_runtime_get_if_active(xe))
 		return -ENODATA;
 
+	mutex_lock(&xe->pmt.lock);
+
 	/* set SoC re-mapper index register based on GUID memory region */
 	xe->soc_remapper.set_telem_region(xe, mem_region);
 
 	memcpy_fromio(data, telem_addr, count);
+
+	mutex_unlock(&xe->pmt.lock);
+
 	xe_pm_runtime_put(xe);
 
 	return count;
-- 
2.43.0

