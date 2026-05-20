Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17E2CD4F3D
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 23:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1EB10E449;
	Wed, 20 May 2026 23:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RloGA8Tt";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2DC10E428;
 Wed, 20 May 2026 23:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eKLIhSolDC8zJkpGX9QTk3vclLz8FzLPwzLHcopfc7E=; b=RloGA8TtHxdny4pnr/W4XJBg/y
 0Q3wWXEyz5KFSp2xVi6dnOJGiSbDgnuD8ZhVp7pEUz/9zgIk0sD57+jT17XxcAcO8CYWg0dCmzK4P
 ypxmflXYfZMQ53M4KQRvCqCghIYA7dss19SeAI4q7AidA0qqUWBOUr46I6LGQHKwuYQj/2G4ngByD
 6IveCh1t3U023FJhTrbPHpzeDTeXSZe5d3+ddMIY9a9dTxbm9ANu483558xkSNeIiDKeMBuZutnWk
 tjVVXUAa7YIxCy5353CunX4dbWckce8mM7uwO1gtLnp1cR4LpMHXpBnrJ7DWClOM0SgFih+zJZ0WI
 t2zPptAg==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wPqp5-00456i-EW; Thu, 21 May 2026 01:59:35 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
Subject: Re: [PATCH v3 00/26] Enable Pipe writeback
Date: Wed, 20 May 2026 16:58:11 -0700
Message-ID: <20260520235820.2313192-1-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325110744.1096786-1-suraj.kandpal@intel.com>
References: <20260325110744.1096786-1-suraj.kandpal@intel.com>
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

This is a set of follow up patches to the series to fix a bunch of
issues and extend support to LNL. Some of them are stand alone
patches, some of them should be folded down into the original patch.

CC: Suraj Kandpal <suraj.kandpal@intel.com>
CC: Rodrigo Siqueira <siqueira@igalia.com>

John Harrison (5):
  drm/i915/writeback: Fix null pointer problems with writeback jobs
  drm/i915/display: Use an unbound workqueue for atomic clean up
  drm/i915/display: Fail writeback setup if no transcoder offsets
    defined
  drm/i915/display: Fix vblank wait timed out with writeback
  drm/i915/writeback: Enable for more hardware than ADL

Rodrigo Siqueira (4):
  drm/i915/display: Add writeback transcoder offsets for DG2 family
  drm/i915/display: Disable pixel_rate check for writeback
  drm/i915/display: Fix XBGR2101010 bpc
  drm/i915/display: Ensure only supported writeback modes pass

 drivers/gpu/drm/i915/display/intel_crtc.c     |  4 ++
 drivers/gpu/drm/i915/display/intel_display.c  |  9 ++-
 .../drm/i915/display/intel_display_device.c   |  7 ++-
 .../drm/i915/display/intel_display_driver.c   |  2 +-
 .../gpu/drm/i915/display/intel_writeback.c    | 56 +++++++++++++------
 5 files changed, 53 insertions(+), 25 deletions(-)

-- 
2.43.0

