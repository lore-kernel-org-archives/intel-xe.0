Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00A8C18E7C
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 11:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DFF10E1D8;
	Wed, 26 Feb 2025 11:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TOHfkSZv";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9645A10E132
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 11:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j1sYgLtbFs+7AGd7hwQ/4PWfxQezRq61i0/2QcKiJ80=; b=TOHfkSZvs2DQ3E4EZETedAFhtd
 6OR+xrhyHDrUIWHmm4KV82XGNoKV4GMHiUCdBQVuN4znUwsIMk476HmXFZo/i0cp6TH+2OvDOqMZ+
 k9oI1LQJ1TnhYc/Ka7+aakVawLLs+A0OlywWJ3kS3z0bIIcFHR04TKzIDPLJqREqYwoRNQwR5BO3/
 sj566oZNfKpFpjQBXcX/tqIPTEdPOiUOuD1P3PUTBTonlBDehOs8vSbOpQVGdTYqiAOFRZtmiI4I4
 JMedeTuyygwYgqhsrTcFfhN3sJPJclAht4IAI5M8fYEUOAd1NzleTUEeGkPjufAxIlFBOu2UjsMW6
 BTYO4CDw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tnFTM-000vLi-Pt; Wed, 26 Feb 2025 12:21:10 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v3 0/4] Workaround fixes, improvements, additions
Date: Wed, 26 Feb 2025 11:21:02 +0000
Message-ID: <20250226112106.28173-1-tvrtko.ursulin@igalia.com>
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

v3:
 * New approach for "drm/xe: Fix GT "for each engine" workarounds".
 * Review comments for "drm/xe/gen12: L3 recommended hashing mask".

Tvrtko Ursulin (4):
  drm/xe: Fix GT "for each engine" workarounds
  drm/xe/gen12: Add Wa_1604555607
  drm/xe/gen12: L3 recommended hashing mask
  drm/xe: Add performance tunings to debugfs

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  5 +-
 drivers/gpu/drm/xe/xe_gt.c           |  8 ++-
 drivers/gpu/drm/xe/xe_gt_debugfs.c   | 11 +++++
 drivers/gpu/drm/xe/xe_gt_types.h     | 10 ++++
 drivers/gpu/drm/xe/xe_tuning.c       | 73 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_tuning.h       |  3 ++
 6 files changed, 104 insertions(+), 6 deletions(-)

-- 
2.48.0

