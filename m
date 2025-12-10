Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105C4D3C92B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 16:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9BA10E70E;
	Wed, 10 Dec 2025 16:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="NqAVcTtC";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DF710E70E
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r5xjwiypPH8zsmOkacEQ4wDz5Qx0tgS7sM+7CIticXQ=; b=NqAVcTtCljl2iUeqrgLGUQghHw
 4kIdwllKCWWIZzwsDvQp+FHAk/fRwg+sM6wfpuvPbQ+qsldAYJjs3wnQ8IK2Mcx+oubUVrKOr5q+q
 hCijfF4kd+wLBmwVzw+ul+J7ZARqSBaZUSHdXhzd3nJ/Ca+v7/xVNWPaEvaDXBdm3URAAEUsINPfJ
 qR/+fG4x/aYP2DEySNETQifluMFBM64rx1sDsFEWzY/8FttJa9vu1budiHuzt4Nxb2EnMGBv8usCG
 2BO5WaovLTSkCo2FfIH681jdghrLZDwH8pQwvIlZDPY0unkCnElSm2EMOrshiBtIObU+ZLe89S8Ct
 xpzlKMDg==;
Received: from [86.33.28.86] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vTMqA-00B2f8-Je
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 17:14:58 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 00/11] auxccs dpt wc no stolen
Date: Wed, 10 Dec 2025 17:14:46 +0100
Message-ID: <20251210161457.14394-1-tursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

test run

Tvrtko Ursulin (11):
  drm/xe: Fix ggtt fb alignment
  drm/i915/display: Detect AuxCCS support via display parent interface
  drm/xe/xelpg: Limit AuxCCS ring buffer programming to Alderlake
  drm/xe/xelp: Quiesce memory traffic before invalidating AuxCCS
  drm/xe/xelp: Wait for AuxCCS invalidation to complete
  drm/xe: Export xe_emit_aux_table_inv
  drm/xe/xelp: Add AuxCCS invalidation to the indirect context
    workarounds
  drm/xe/display: Add support for AuxCCS
  drm/xe/xelp: Expose AuxCCS frame buffer modifiers on Alderlake-P
  use wc for dpt
  drm/xe: Do not use stolen memory for DPT on IGFX and AuxCCS

 .../drm/i915/display/intel_display_device.h   |   2 +-
 drivers/gpu/drm/i915/display/intel_fb.c       |   3 +-
 drivers/gpu/drm/i915/display/intel_parent.c   |   5 +
 drivers/gpu/drm/i915/display/intel_parent.h   |   2 +
 .../drm/i915/display/skl_universal_plane.c    |   9 +-
 drivers/gpu/drm/i915/i915_driver.c            |  10 ++
 drivers/gpu/drm/xe/display/xe_display.c       |   8 ++
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 135 +++++++++++++-----
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
 drivers/gpu/drm/xe/xe_hw_engine.h             |  24 ++++
 drivers/gpu/drm/xe/xe_lrc.c                   |  27 ++++
 drivers/gpu/drm/xe/xe_ring_ops.c              |  84 +++++++----
 drivers/gpu/drm/xe/xe_ring_ops.h              |   3 +
 drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
 include/drm/intel/display_parent_interface.h  |   3 +
 15 files changed, 249 insertions(+), 74 deletions(-)

-- 
2.52.0

