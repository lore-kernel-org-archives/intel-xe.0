Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95128C83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 16:01:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6129710E3A5;
	Fri, 11 Jul 2025 16:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="OCy/35Sd";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E256E10E3A5
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 16:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w5nNk2G++KIv/sms+vp64ckdSmUiO7hddJK6rLaF6Uc=; b=OCy/35SdTQJLCFsLCSivWfXpUm
 t6iJ5o7cbgRfa1J8k22u55pFARXV1vpmotB8HrVl6mHVbLehR2Be8KQmkXjUP5Zn15NAz511UB/MT
 pzvDm5dbAMhTjZmxCPtDGSjP4IOCcwKZHOc77biJRL0YZVF0O8tkc8B5VY0ZsPnsYIT8EnsXiCyTF
 uux1xVsIEWXGaK3VsqFwDs69dWS2LB8owOYLqcd9ENwZS5mWNCjoS61OCop+7/JMyle5mmb5+e6oL
 mXeLgarDTqO0uRTsVmzZX6cMiFDjST37yN2QWMQZ+Clqv/w9JcMJ+L2x7Fvw8Ei4b3fmbyYjnxPEr
 IyfujJ7A==;
Received: from [84.65.48.237] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uaGCA-00FR5i-WB; Fri, 11 Jul 2025 18:01:55 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v10 0/8] More missing XeLP workarounds
Date: Fri, 11 Jul 2025 17:01:45 +0100
Message-ID: <20250711160153.49833-1-tvrtko.ursulin@igalia.com>
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

Some more missing XeLP workarounds. This time including some which need to go
into indirect context, which also means some plumbing had to be added.

Includes a fix to use iosys helpers for existing wa bb emission since there is a
code dependency on it.

v2:
 * Use iosys helpers.
 * Split indirect context plumbing as a separate patch.
 * Tweak where and how Wa_16010904313 is emitted.
 * Move Wa_18022495364 into the wa_bb.

 v3:
 * Rewrite on top of Lucas' wa bb changes - use same infrastructure.

v4:
 * Rework due 3a1edef8f4b5 ("drm/xe: Make WA BB part of LRC BO").

v5:
 * Fix indirect ring state offset calculation.
 * Removed extra space in one patch.

v6:
 * Fixed indirect ctx MI_NOOP padding to 64B cacheline.
 * Do not add negative errors codes to reported emitted counts.
 * Renamed workaround emission functions. (Lucas)

v7:
 * Rebase for removal of bo->size.

v8:
 * Rename bo emission helpers. (Lucas)
 * Drop XELP prefix from LRC layout define. (Lucas)
 * Drop first patch from the series as it was merged.

v9:
 * Contain emission helpers arguments in a struct. (Lucas)
 * Use REG_FIELD_PREP for CTX_INDIRECT_CTX_OFFSET_DEFAULT. (Lucas)
 * Coding style tweaks. (Lucas)
 * Improved comment. (Lucas)
 * Split indirect ctx bo size defined from maximum hw supported size.

v10:
 * Tweak code formatting in last two patches.
 * Drop LRC_INDIRECT_CTX_SIZE. (Lucas)
 * Use reserve_dw = 0 for the indirect ctx. (Lucas)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

Tvrtko Ursulin (8):
  drm/xe: Generalize wa bb emission code
  drm/xe: Pass wa bb setup arguments in a struct
  drm/xe: Rename utilization workaround emission function
  drm/xe: Track number of written dwords from workaround batch buffer
    emission
  drm/xe: Allow specifying number of extra dwords at the end of wa bb
    emission
  drm/xe: Add plumbing for indirect context workarounds
  drm/xe/xelp: Implement Wa_16010904313
  drm/xe/xelp: Add Wa_18022495364

 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   3 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   5 +
 drivers/gpu/drm/xe/xe_lrc.c                   | 263 +++++++++++++++---
 drivers/gpu/drm/xe/xe_lrc_types.h             |   3 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules            |   2 +
 6 files changed, 240 insertions(+), 37 deletions(-)

-- 
2.48.0

