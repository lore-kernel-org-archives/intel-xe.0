Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1874CD4F5E
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 23:59:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57EF10F19A;
	Wed, 20 May 2026 23:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TJrg2id1";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B39E10F194;
 Wed, 20 May 2026 23:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QZVneoNntdUpE4xvmWXYwKpPmpxRqUQMOuBIOqci0zM=; b=TJrg2id1HrytEQgcMNJyKS9P62
 hpd0TFEBG5JDYUialq19Pz6f7a8qcZ153HHxP9RF0t/vEI9XKjFMYfnmnFh65uA69bDk/wY6xZJe7
 TRi1CH76iBN+dGtkXmUo8YKHGYmgR+nVFXr8gzPu8oy9huMLeDO+t+4P/OelqL01GoNg9B3w9dhDU
 Dec9OS/UGZWeNANqXY+g9pzoy2STWak0P0dl3lYJ9K6TZ1MVwJczlRhOtdIiK8w/NZyY9cYfQguBn
 GdREKB8K7bE7KHLoTaQZWwcZj5Sov7KjLxxEQAPFoCrnECC+aZJITC/1ZOoOmPPzTZC/GNfpZ/WeA
 t0oUwjuQ==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wPqpD-00456i-Jg; Thu, 21 May 2026 01:59:44 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Rodrigo Siqueira <siqueira@igalia.com>
Subject: [PATCH 5/9] drm/i915/display: Disable pixel_rate check for writeback
Date: Wed, 20 May 2026 16:58:16 -0700
Message-ID: <20260520235820.2313192-6-John.Harrison@Igalia.com>
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

From: Rodrigo Siqueira <siqueira@igalia.com>

Fix for 'drm/i915/writeback: Modify state verify function'.

That patch disables a bunch of checks for writeback connectors as they
are not relevant. One is the pixel rate. However, rather than just
putting an 'if(!writeback)' around the existing check, a new check was
added with the if. Or more likely, a rebase somewhere re-instated the
original check without the if. Either way, the original check was
still present and still firing.

Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 787566c8a743..35ca757c76e6 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5445,12 +5445,11 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 		PIPE_CONF_CHECK_RECT(pch_pfit.dst);
 
 		PIPE_CONF_CHECK_I(scaler_state.scaler_id);
-		PIPE_CONF_CHECK_I(pixel_rate);
+		if (!is_writeback)
+			PIPE_CONF_CHECK_I(pixel_rate);
 		PIPE_CONF_CHECK_BOOL(hw.casf_params.casf_enable);
 		PIPE_CONF_CHECK_I(hw.casf_params.win_size);
 		PIPE_CONF_CHECK_I(hw.casf_params.strength);
-		if (!is_writeback)
-			PIPE_CONF_CHECK_I(pixel_rate);
 
 		PIPE_CONF_CHECK_X(gamma_mode);
 		if (display->platform.cherryview)
-- 
2.43.0

