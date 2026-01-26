Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21821CF65FF
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 12:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF7210E411;
	Mon, 26 Jan 2026 12:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="U7lRL4yM";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7787410E411
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jan 2026 12:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1769431929;
 bh=DqCV1HAVlwdgQkNxS6/xaHg17DjdtTAF938Geb94+rQ=;
 h=From:To:Cc:Subject:Date:From;
 b=U7lRL4yMsJ3Fda7wKp80AlZpxvitHSLosJpKPYFhNDRSiwzgeS0Y2sgdfy4Q3aeub
 v3SlM8unRF5fEDa9HDbhMW9i7cdD/Eg0rqy0knRhx+7vsiiik5J0Ro67E/9lSrYiwt
 vrQMcY8Sb2JmCnuX7Q+D6vMj+JPeCtXIjzbdKd2L07MBLSM2KY4ItozhyTxd4UwNPi
 I4yeheAjqIeHUEAJ2xSjyhsvpa4X/Gwr60w1v0T3KUluN8TilQVyCVvmJnuaDTdCru
 qSpYyKQPoBxpo2TiyEQlicspHmQ66PQR0x1XyD6UxNDvTduNAVogIm9QEyGcrS2Wgr
 L0XGoAx49uWXw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [RFC PATCH 0/3] drm/xe: Enable ATS.
Date: Mon, 26 Jan 2026 13:52:04 +0100
Message-ID: <20260126125207.1119351-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
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

RFC since I believe while the patches work, it might need some help to
validate the semantics, and whether we want to set ATS unconditionally.

Add the relevant wiring to enable the ATS flag in PASID, and add a minimal
selftest to validate ATS works and doesn't break on the first access to
system memory.

Last patch is untested, hope to see what CI thinks. :-)

Maarten Lankhorst (3):
  drm/xe: Force page fault
  drm/xe: Set the bits in PASID to enable ATS.
  drm/xe: Add migration selftest for validating job submission and basic
    features work

 drivers/gpu/drm/xe/regs/xe_gtt_defs.h   |  1 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  1 +
 drivers/gpu/drm/xe/xe_device.c          |  7 ++++
 drivers/gpu/drm/xe/xe_lrc.c             |  6 ++++
 drivers/gpu/drm/xe/xe_migrate.c         | 46 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h         |  1 +
 drivers/gpu/drm/xe/xe_pt.c              | 36 ++++++++++---------
 7 files changed, 82 insertions(+), 16 deletions(-)

-- 
2.51.0

