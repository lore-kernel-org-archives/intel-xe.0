Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F411C71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 15:36:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2138B10EA1C;
	Fri, 13 Jun 2025 15:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BBepYziQ";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A427F10EA14
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 15:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z24U60q/FEslsJ7C6nAgXhreBU1FuFiBbCvmyevYxm0=; b=BBepYziQpKTyxZcUwA+B7TDMbZ
 fRvpBqoYOr2IKB031RDvvmzMCgglJ+lmjcixpMaj6HKEc7g0ptaiC+0Vg6Jak3t8zZ1dnVBVBIxK9
 vUj8piMF8NpASWRXMufh2rqL3LELArnazKQdT0B5c4gfJtBxBDYzLkuuKE3nHKuPa7CejvuPqBYEw
 0fE4w33WMLZRx9gMu8jm0IhH/FW2IQ3oH8SilIz78pVpJWZ5AK5y0SM1rJg+cpJmfxx1WU61mhmGI
 4p6zOGgnmjHvxQKR9KUIZxpPfsjCw0EaJQf0deKdpy2EkvU6Qtz6wnXGUsBSYVg0U4LKru4VyZP0l
 w7E4+clw==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uQ6Rk-0034p0-Mk; Fri, 13 Jun 2025 17:36:00 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v4 0/7] More missing XeLP workarounds
Date: Fri, 13 Jun 2025 16:35:51 +0100
Message-ID: <20250613153558.68350-1-tvrtko.ursulin@igalia.com>
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

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

Tvrtko Ursulin (7):
  drm/xe: Consolidate LRC offset calculations
  drm/xe: Generalize wa bb emission code
  drm/xe: Return number of written dwords from workaround batch buffer
    emission
  drm/xe: Allow specifying number of extra dwords at the end of wa bb
    emission
  drm/xe: Add plumbing for indirect context workarounds
  drm/xe/xelp: Implement Wa_16010904313
  drm/xe/xelp: Add Wa_18022495364

 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   3 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   4 +
 drivers/gpu/drm/xe/xe_lrc.c                   | 260 ++++++++++++++----
 drivers/gpu/drm/xe/xe_lrc_types.h             |   5 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules            |   2 +
 6 files changed, 226 insertions(+), 49 deletions(-)

-- 
2.48.0

