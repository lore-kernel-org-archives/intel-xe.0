Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127D1CDB479
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 05:55:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8ED110E178;
	Thu, 25 Jun 2026 05:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="Hg1NhNZm";
	dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E865F10EC87
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 05:55:39 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3A0093F96E
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 05:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1782366938;
 bh=hrK/hqc0KTSs3qSmB6J+wib7JPcAUEvvkJ6klAPWA3M=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=Hg1NhNZmiyR300zXNDW4D6Elo2/dqLNXIz6fr9g76cMvu1syrG9cWkdPT/5N3aLLW
 +efcaZRzphnyOP3EEtmOx7eCSjBBHK0A1sNC1QN/fR2D5E7/yCv0wd6YDO37nKjDeW
 jqPEm2ATMAPapj8qe4eyIs0iybLWr6/YlBHpjZEWz2jdIybfNimV2iWsqEN5vOHsJs
 6Rgg4bt5QWMhFatUB+yimh+NXXpcpwFD56JygGZ0q77XrvJX/vpBlH6X5owmEeS/UL
 d594U8lFcn9wLR+5sxhzNh2qcVdWoNLxlwDgFM0f8h0BK6htdtIxYzkOiNuUPkmADr
 WVK9s3dAtOxldA+jc2zfDCLgKGYSny/8VRrOcm12tV/GXdLQrGaVN6fu82m9OUzzjX
 LeoQ324x6B+DoYxpUVGz5dg5OxAly7o4OjZriGw7j+YOAfSWu9dAkGIgScj3VXxkDz
 /WhtboeqPZlNkNYlxKiTZz0qpXz7G21bGrtJaYH/7yVP04jK1WZfFiOYa0UmRbvgat
 D0HV8Xff6jJezhH2voGZNgvBr+UG6Wb6stEXZOcrM22OM5qrkhNMsqG4rzKHX0MfzM
 BvPl2XP7YJ2xN4ilsfgOYMOQSfVrGjFhHjwjP+AebKaBgJ+DNgHL1PVLhB7XKzXdlB
 xeFsyVp1vrFh1heUGqemstWw=
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8db6a7471baso36198156d6.0
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 22:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782366937; x=1782971737;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hrK/hqc0KTSs3qSmB6J+wib7JPcAUEvvkJ6klAPWA3M=;
 b=nGlD/DIfJfCSiBuFpEfKwv0Kut4RB5Pesa6K/t8SPx9N7bZdaFfQY86QBHbDNFdyu8
 m9NtVmiN21BNA08YtNvcBiHwFY1mKGTanl+X7NiYdPi8U2p8sRymGuR6D61D6Ts62L3W
 1aQ+aU/a/2WRNafCN990vzSHv8ByuiMzJMnu8vgyUJuz2u322122koLBXeHlLt8+Vkfo
 LnDZu4yPuty8ZkjX6dZUMQNXosd6qEe8v4JN/zVBVljbdvgZOXz2TQkQ8yHG7t1pOu64
 t8EmTGxQY80OA9TJkFFPiCkDfMo6FD2RNovp+/lzG5YfTrArxmtuhacVR/uQoL6UCXau
 vG/Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9TRRgxVuLASSdDaJ8+maCcU7uwhSNZMZ8grRav1u8ffxzdZErBkMsscVjSwFCu4IQaTs0LVqWMuA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh8XKLR1GF+5/W9MI3lgAN1kypHrodFrBx+ttl9THT49SibI4r
 s2j7Q33kfhJ+2DN69dRajATdHSAzoOqYMRdxtD5sNO/VXYcWIh5lFCx+rXsuqvUuV03/kY4OYwI
 pC4hYjpBn+swQX+fYxIAsiQrCJk1l2zIioHYZbVPxBLHuUcm36LORoQK9gkTLBylinOXZSbr7J/
 JDfJX43gx6
X-Gm-Gg: AfdE7cnXwbV0jU/NapMKRcdtoPSqbbEhq5jh5FrNaKEJYWKgCJVkZvOmiehhGxsg8LK
 l6+ksVA6mfrXnSR17AZD9G6rYHKI7+fLTxelRZVRQJh3wdDJDw8TLi9mk+Lsk90CM4FqX2fY8An
 LBOejwHvqs/S3FpQDR1BZBOCzlK/L5k7VKJTFOPwscGrIO/bd3BvWC631cacsUC2OO2HJaDuBju
 Nyd4UdP43Oy7b/pivvuOc5pAUsm962OMV0wMTRDfYiCLWBoDRblaRU7QO/wzIhRTMkeGUIZMIFY
 +byLNpMPJNzhhz7YkYiIXCorMh9mJ4EURIO84Hjb2LhQNgFEv7bTNAeeUh02s65HO4MNqA3/nCp
 1Kr7Dn6qhMyo0szmNgJ5L6US8nKpUHc1HUKCV61k1Htiewke33/gckCTNBprvFZ9oupY3Llkx7l
 J6KD4qBf4=
X-Received: by 2002:a05:620a:1b95:b0:918:419:4b49 with SMTP id
 af79cd13be357-9293d4b31aemr151566685a.32.1782366937139; 
 Wed, 24 Jun 2026 22:55:37 -0700 (PDT)
X-Received: by 2002:a05:620a:1b95:b0:918:419:4b49 with SMTP id
 af79cd13be357-9293d4b31aemr151562685a.32.1782366936736; 
 Wed, 24 Jun 2026 22:55:36 -0700 (PDT)
Received: from localhost.localdomain ([103.155.100.9])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926000c2a09sm720088185a.31.2026.06.24.22.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 22:55:35 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v2] drm/i915/psr: Skip PSR exit for legacy cursor updates on
 LunarLake onwards
Date: Thu, 25 Jun 2026 13:55:14 +0800
Message-ID: <20260625055514.3636380-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.43.0
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

ORIGIN_CURSOR_UPDATE falls through to _psr_flush_handle() on
DISPLAY_VER >= 20, which calls intel_psr_exit(). Cursor plane updated
via legacy ioctl (drmModeMoveCursor) does not dirty the primary
frontbuffer, no PSR2 state change is needed. Match the existing
ORIGIN_FLIP behavior by returning early on DISPLAY_VER >= 20.

Before this, the psr2_sel_fetch_enabled guard only prevented the early
return when PSR2 selective fetch was active, sending cursor updates
through intel_psr_exit() and causing a black line artifact on some
panels during the exit/re-enable transition.

Preserve the fallthrough for pre-LNL platforms with PSR2 selective
fetch, where intel_psr_force_update() (CURSURFLIVE write) is needed
for cursor tracking.

Fixes: ef39826c12b4 ("drm/i915/display: Fix glitches when moving cursor with PSR2 selective fetch enabled")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
Changes in v2:
- Add DISPLAY_VER >= 20 guard to only skip PSR exit on LunarLake onwards,
  preserving the intel_psr_force_update() fallthrough for pre-LNL platforms
  with PSR2 selective fetch (addresses Sashiko review about cursor trailing
  artifacts on pre-LNL)

v1: https://lore.kernel.org/r/20260623084137.3421894-1-aaron.ma@canonical.com

 drivers/gpu/drm/i915/display/intel_psr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index e138982dc91f6..ba8c427f45463 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3772,7 +3772,7 @@ void intel_psr_flush(struct intel_display *display,
 
 		if (origin == ORIGIN_FLIP ||
 		    (origin == ORIGIN_CURSOR_UPDATE &&
-		     !intel_dp->psr.psr2_sel_fetch_enabled)) {
+		     (DISPLAY_VER(display) >= 20 || !intel_dp->psr.psr2_sel_fetch_enabled))) {
 			tgl_dc3co_flush_locked(intel_dp, frontbuffer_bits, origin);
 			goto unlock;
 		}
-- 
2.43.0

