Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D75DC0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 11:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9CE10E936;
	Thu, 30 Jan 2025 11:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cGfXrY9q";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730E210E935
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 11:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EXWToQJNldVDWC8DEiMkUMsS5CLsgZFE6/cN8yYSQ4A=; b=cGfXrY9q17RtIWFQCxKode22J3
 VXG0OepuI/YZO40LP7lzoG0X7h5Qe9ThbFApB3gciLiOd4Y7Gr7ljXFuT14l4TyzJkRx5CcRC5VQJ
 d8YwPWamI1nM+g3vOal65bjB4YmsNqnW8fss01dW7Fcynp/VL/ucn/aP9jN0HsWnnSl7NjyRZVylR
 Ia63bE8GWyL4Owurgde0RwG/RnZHp30PjNbHAkwaOXg3rqDFtR/V8GcUISQeWh9lVcKeq7N5qIN8l
 PUuxSft2NphgubW4UoI06mwLWjaT0l037ViZkbVcP8L8udcS6aHyjiTuzeJJQum41sXJRIKv8Q3ve
 3BeUhj7A==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tdSKc-000zzE-DV; Thu, 30 Jan 2025 12:03:40 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 0/4] Workaround fixes, improvements, additions
Date: Thu, 30 Jan 2025 11:03:33 +0000
Message-ID: <20250130110337.11237-1-tvrtko.ursulin@igalia.com>
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

A few things here.

0001:
I think per engine GT workarounds are broken. None apply since engines are not
set up yet.

0002-003:
I did a small audit of i915 vs xe workarounds and tunings with focus on ADL-P
and found some deltas. But without access to the internal database and even
up to date PRMs it is required if someone double checks the two.

Motivation being that there is some interest to make xe work on ADL-P as good as
possible.

0004:
With the split between workarounds and tunings it feels useful to expose the
list of latter in debugfs too.

v2:
 * Attempt to fix first patch.
 * L3 hashing patch tidy.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

Tvrtko Ursulin (4):
  drm/xe: Fix GT "for each engine" workaround handling
  drm/xe/gen12: Add Wa_1604555607
  drm/xe/gen12: L3 recommended hashing mask
  drm/xe: Add performance tunings to debugfs

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  5 +-
 drivers/gpu/drm/xe/xe_device.c       | 18 +++++++
 drivers/gpu/drm/xe/xe_gt.c           | 10 ++--
 drivers/gpu/drm/xe/xe_gt_debugfs.c   | 11 +++++
 drivers/gpu/drm/xe/xe_gt_types.h     | 10 ++++
 drivers/gpu/drm/xe/xe_tuning.c       | 73 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_tuning.h       |  3 ++
 7 files changed, 120 insertions(+), 10 deletions(-)

-- 
2.48.0

