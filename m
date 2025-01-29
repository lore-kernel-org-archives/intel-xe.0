Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FB5C02190
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 15:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B7E10E831;
	Wed, 29 Jan 2025 15:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bJBD9kiQ";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FD010E833
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 15:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a6kk++9FKtvkvr4q/RInwcE+9mn5e+XWPdtZDk4Ifog=; b=bJBD9kiQowSMPCBY6A44iM3g5G
 rP5OmghrLUtK/9nfMJpPoaUoMWs9D1INav9J8U1XLbdFhi3USDb71h41x4vSgcf40G0Rs7cU/mozq
 Evr/7KBJkse8HZbx8syjS3d3qRFudLXZ3cG+IwRaQLZtle/STzmYjlznVB69IEuEkPzF2JO1uINd1
 PK6qC6Y/LvStKxXhgYDdpWiNrd9aeh8E+LFz8gurvKvzWU00gGDQ0eB3XrK+YqYLurvyOtB0Lo1K1
 rx1XPCO4PbkDLftP1dXaesGoa9jUQ6eQ7IXdUEMkjj1ttBWGmgyDQFo3QBMpj1ImGfNrEK3pnc3cH
 Hy2VcyqQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tdAQV-000e7J-Gw; Wed, 29 Jan 2025 16:56:33 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 0/5] Workaround fixes, improvements, additions
Date: Wed, 29 Jan 2025 15:56:22 +0000
Message-ID: <20250129155627.93827-1-tvrtko.ursulin@igalia.com>
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

0005:
Sadly there is still a mix of runtime vs static workarounds/tunings (so not
everything can be listed in debufs in a nice forma), some of
which look unavoidable such as MOCS and bits in
xe_hw_engine_setup_default_lrc_state.

But I thought on general it would be good to move everything that doesn't need
to be on those smaller sprinkled around lists to the central ones in
xe_workarounds.c/xe_tuning.c. It consolidates and adds visibility in debugfs.

Although again, it is still not perfect and maybe I missed some other reason
those I moved were where they were.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

Tvrtko Ursulin (5):
  drm/xe: Fix GT workaround handling
  drm/xe/gen12: Add Wa_1604555607
  drm/xe/gen12: L3 recommended hashing mask
  drm/xe: Add performance tunings to debugfs
  drm/xe: Move a couple static workarounds/tunings to the static list

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 ++
 drivers/gpu/drm/xe/xe_gt.c           | 10 ++--
 drivers/gpu/drm/xe/xe_gt_debugfs.c   | 11 ++++
 drivers/gpu/drm/xe/xe_gt_types.h     | 10 ++++
 drivers/gpu/drm/xe/xe_hw_engine.c    | 22 --------
 drivers/gpu/drm/xe/xe_tuning.c       | 81 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_tuning.h       |  3 ++
 drivers/gpu/drm/xe/xe_wa.c           | 16 ++++++
 8 files changed, 128 insertions(+), 28 deletions(-)

-- 
2.48.0

