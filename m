Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D8EEEF314
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 07:42:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2425F10EB2D;
	Thu,  5 Mar 2026 07:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C+YM+nzv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE1510EB2B;
 Thu,  5 Mar 2026 07:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772696545; x=1804232545;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=EQd9Rf8uE/hSTMzbp+XoV/wKyKYJ7NNFkXwhOK8CIso=;
 b=C+YM+nzv1EroWQFLsqg19bkDiWJPI5l0hnOfJRFnNs4R9zeuRjBO7aVl
 ARcN2AOnsAljc3lghQZ8+fGxk04zfSx4xEqfAPJlc1Dxdwor1dC2Q9S9n
 R5kZWADQVIwpsUl48cKDhEZICC9RtQt0ep0vcdMs2UMV/xyP8PTq9AnTy
 c0t2NelnxWOpZN53yH0cCiEPKlJ7abLctIpR1Hff7x5CuJ1it57oEcx84
 g5HX3CYDJi3m+rUGng3obg/kBEf1Do81tkSdW8II2vDAQLS8UQSrY0kq2
 uoUyIKC/futLkXSj/3/uxi1njFfsfgurmfA/YptMURSZ30xRIfblMYWan A==;
X-CSE-ConnectionGUID: CkvqEyJ0TW2O22lyO7HPzQ==
X-CSE-MsgGUID: p2J1uEixQv6Nxy98nUaKbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77645837"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="77645837"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 23:42:24 -0800
X-CSE-ConnectionGUID: 1i9vcZEWS/Oc9jTm9H3tpA==
X-CSE-MsgGUID: Ndu871dWTb2loJY4aQrPog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="217743401"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.55])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 23:42:19 -0800
Date: Thu, 5 Mar 2026 09:42:15 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes
Message-ID: <aakz17Jx3Ye9Vqci@jlahtine-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

Hi Dave & Sima,

Here goes drm-intel-fixes PR toward 7.0-rc3.

Just one PSR display fix for Lenovo T17 G7 and a dependency patch.

Regards, Joonas

***

drm-intel-fixes-2026-03-05:

- Fix for #7284: Lenovo T14 G7 display not refreshing

The following changes since commit 11439c4635edd669ae435eec308f4ab8a0804808:

  Linux 7.0-rc2 (2026-03-01 15:39:31 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2026-03-05

for you to fetch changes up to a99cac460ddeb3705cb54a8421339f351586b25d:

  drm/i915/psr: Fix for Panel Replay X granularity DPCD register handling (2026-03-04 15:26:08 +0200)

----------------------------------------------------------------
- Fix for #7284: Lenovo T14 G7 display not refreshing

----------------------------------------------------------------
Jouni Högander (2):
      drm/dp: Add definition for Panel Replay full-line granularity
      drm/i915/psr: Fix for Panel Replay X granularity DPCD register handling

 drivers/gpu/drm/i915/display/intel_psr.c | 11 ++++++++---
 include/drm/display/drm_dp.h             |  2 ++
 2 files changed, 10 insertions(+), 3 deletions(-)
