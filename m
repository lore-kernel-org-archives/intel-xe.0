Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD9DC19F2E
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 10:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B600810EA88;
	Thu, 27 Feb 2025 10:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="iaNbXpw4";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9532F10EA86
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 10:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nuwlWNpaMGJQez15pacmAKC5WVheMImm9+l2B4D4H/8=; b=iaNbXpw4y6zoDymICm1xFj3T5z
 P5l/xoqR9t7luifcN7+qM6UTNwHpOiDX1bWqY+wsnDFTXkhmGUqL09CCUx8BhVFrDzIxbkUFwap/8
 FbtJIvxiMMRnGz2D3Mz8GvR1rZcjr/sD2mQ98nmW4kp0LivFas/x0WQyKUEOguL9ZndhE+tykkok9
 +FEa/Hrm8qR/frtny2li4YfeiGcCTDRarV7L4s9QXurNEgCyWtMaWkktFbslAkAcza8NGLc11VMIc
 34ntU6Y9wc9Kp77oU9UbPWaEY50nuHTEwglb7p3VSOYfUuldQpdLcE9GXXGprhGcEEp6cDZaI6SRP
 C9raR5VQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tnat2-001XVd-QR; Thu, 27 Feb 2025 11:13:06 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v4 0/5] Workaround fixes, improvements, additions
Date: Thu, 27 Feb 2025 10:12:59 +0000
Message-ID: <20250227101304.46660-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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

A few things here:

1)
I think per engine GT workarounds are broken. None apply since engines are not
set up yet.

2)
I did a small audit of i915 vs xe workarounds and tunings with focus on ADL-P
and found some deltas. But without access to the internal database and even
up to date PRMs it is required if someone double checks the two.

Motivation being that there is some interest to make xe work on ADL-P as good as
possible.

3)
With the split between workarounds and tunings it feels useful to expose the
list of latter in debugfs too.

v2:
 * Attempt to fix first patch.
 * L3 hashing patch tidy.

v3:
 * New approach for "drm/xe: Fix GT "for each engine" workarounds".
 * Review comments for "drm/xe/gen12: L3 recommended hashing mask".

v4:
 * Move 16011163337 from tunings to workarounds in a separate patch.
 * Implement 1604555607 as a separate workaround.
 * Move "L3 recommended hashing mask" to an engine workaround.
 * Tidy naming s/gen12/xelp/.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>

Tvrtko Ursulin (5):
  drm/xe: Fix GT "for each engine" workarounds
  drm/xe/xelp: Move Wa_16011163337 from tunings to workarounds
  drm/xe/xelp: Add Wa_1604555607
  drm/xe/xelp: L3 recommended hashing mask
  drm/xe: Add performance tunings to debugfs

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  5 +-
 drivers/gpu/drm/xe/xe_gt.c           |  8 +++-
 drivers/gpu/drm/xe/xe_gt_debugfs.c   | 11 +++++
 drivers/gpu/drm/xe/xe_gt_types.h     | 10 ++++
 drivers/gpu/drm/xe/xe_tuning.c       | 72 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_tuning.h       |  3 ++
 drivers/gpu/drm/xe/xe_wa.c           | 14 ++++++
 7 files changed, 112 insertions(+), 11 deletions(-)

-- 
2.48.0

