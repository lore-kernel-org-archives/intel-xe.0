Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD05DCD3445
	for <intel-xe@archiver.kernel.org>; Sat,  9 May 2026 16:41:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E4310E239;
	Sat,  9 May 2026 16:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gGLrLJ4/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08ABE10E101;
 Sat,  9 May 2026 16:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778344907; x=1809880907;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rw5PNWOQSLptOBiIqvtLQiRrBKHsKjMfG0Y6YXJrmGI=;
 b=gGLrLJ4/hbLzXmnuff7UvJHe8AcVU3wcjxmfrpUHiRarhFyuOzFheFm+
 0YX2SpbDtT547PYCy9pQdaqzB2SvkxwtHVhaxHyp8esVoUUAil9/syzuC
 lMPkZajk+PVom2B8OpDsw8BZyCwFbt5G2cqXBJwTOXb9FqS6U+heXYwsM
 6qt5eFE+9XCWLmRSJ4MCm1DNhbrbsOTDcJZtiaPoewsCIy6gSJhdickz3
 vNKxbtObr8z8iP9XsTwIOcFzx3rC98Ypfuw38eeftuCoYoxB7dj9eGu9M
 P1fV+9jV9cD8CcjIVRBv+kpESPa8XIPL3xetKrPGnugjhQ86mavNoJ3b+ Q==;
X-CSE-ConnectionGUID: 8gVxoYSNTdivV9obAUfFsQ==
X-CSE-MsgGUID: gQOIM57yS7+WepiSj5rRIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="90763606"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; d="scan'208";a="90763606"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2026 09:41:47 -0700
X-CSE-ConnectionGUID: Wz4+3R+jSoSwONZP4bm/Xg==
X-CSE-MsgGUID: IK3tHoEjSCeuuQOoOwaX0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; d="scan'208";a="236212218"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP; 09 May 2026 09:41:45 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, nemesa.garg@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v3 0/9] casf & scaler refactoring
Date: Sat,  9 May 2026 18:40:39 +0200
Message-ID: <20260509164048.627399-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Next version of [1]. After consideration I squashed patches 7 & 8 from
previous series into one patch. Also resending because last time I
haven't included intel-xe. 

[1] https://lore.kernel.org/intel-gfx/20260411174526.2850179-1-michal.grzelak@intel.com/

BR,
Michał

---
Changelog:
v2->v3
- squash unlooping with inverting loop breaking condition (Nemesa)
- keep ctl inside the loop (Ville)
- separate impure function call from variable declaration block (Ville)

v1->v2
- rename intel_casf_scaler_compute_coef()
- check if any scaler was found (Ville)
- apply the rename to nearest neighbor filter (Ville)

Michał Grzelak (9):
  drm/i915/casf: fix comment typos
  drm/i915/casf: rename *_coef*() into *_coeff*()
  drm/i915: rename t into tap
  drm/i915/casf: rename sumcoeff into sum_coeff
  drm/i915/scaler: s/i/scaler_id/ where appropriate
  drm/i915/scaler: remove id in favor of scaler_id
  drm/i915/scaler: unloop scaler readout that is run once
  drm/i915/scaler: abstract scaler searching loop
  drm/i915/scaler: eliminate dead code

 drivers/gpu/drm/i915/display/intel_casf.c | 32 +++++-----
 drivers/gpu/drm/i915/display/skl_scaler.c | 76 ++++++++++++-----------
 2 files changed, 57 insertions(+), 51 deletions(-)

-- 
2.45.2

