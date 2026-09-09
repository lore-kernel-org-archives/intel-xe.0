Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB31C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854C710F1FB;
	Wed,  9 Sep 2026 16:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LB7Ds8lv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDD810F203;
 Wed,  9 Sep 2026 16:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788970667; x=1820506667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sEMTfa7wZiTj18jMEIU5QU76RkjRElCq+gWcX5/YGYk=;
 b=LB7Ds8lvptGDQ61u3HyoQUUHZcmqZNYGLF8jZo9aJ9/beo22fFOkD4YJ
 oofwfFBapPY+ckVoHE/EgwSZp/628oSITAL1ENS7X0LsplJebpzn1svX+
 RjVc9404DOcNhAsSjOFWCSqB8F+P2ZpeDgRsrDcALzPZl5Ukh0eum7r7r
 LKOplnIX9MWzXmatFCYPgP0JSOZeEB8WH7EDqVoeNK88dQJ+ZbNFdLSHl
 4iCWPDWEcEtUzlfIQ2vWz1kV3VKDE/3cGWg8PnVo5IQsENGQa84iVcWw9
 zdmLJgYUH09mL6n+QhiPpYXKGxRiVNb/6kMg9N/S5+DarQLQknrWxUw3Q A==;
X-CSE-ConnectionGUID: udlvs0CVSE2DJummxk4Cvg==
X-CSE-MsgGUID: 5FHYKQ9AQi6vKekXcnesGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100064566"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="100064566"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:17:47 -0700
X-CSE-ConnectionGUID: HKehXKPBT12xn2O9hEdT5Q==
X-CSE-MsgGUID: PC2Z7BrYT0m/meR3XPfuAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="275503178"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.137])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:17:47 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 03/13] drm/i915: Don't initialize flip queue on pre-LNL
Date: Wed,  9 Sep 2026 19:17:20 +0300
Message-ID: <20260909161730.12969-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
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

We only support flip queue on LNL+. Don't initialize the flip queue
stuff on pre-LNL to avoid leaving confusing debug messages in dmesg.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_flipq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_flipq.c b/drivers/gpu/drm/i915/display/intel_flipq.c
index bf278f60bba7..45788234fc83 100644
--- a/drivers/gpu/drm/i915/display/intel_flipq.c
+++ b/drivers/gpu/drm/i915/display/intel_flipq.c
@@ -130,6 +130,9 @@ void intel_flipq_init(struct intel_display *display)
 {
 	struct intel_crtc *crtc;
 
+	if (DISPLAY_VER(display) < 20)
+		return;
+
 	intel_dmc_wait_fw_load(display);
 
 	for_each_intel_crtc(display, crtc)
-- 
2.54.0

