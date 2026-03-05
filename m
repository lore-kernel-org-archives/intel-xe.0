Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D081BEEF312
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 07:59:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8757510E21F;
	Thu,  5 Mar 2026 07:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="inGPyAKP";
	dkim-atps=neutral
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB79510E220
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 07:59:07 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-439a89b6fd0so4596701f8f.2
 for <intel-xe@lists.freedesktop.org>; Wed, 04 Mar 2026 23:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772697546; x=1773302346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=up1Dq1xg6gmNuKxcZqGmFJ9w/LNCPKzJ4m3SQCOPg0U=;
 b=inGPyAKP5xxRdV1I9NHGRIr9zbgxx1ooUmYHx9Bl+wEWG2BmMvMEJmnTKwJ1yjJKI0
 Gi4bsOP5gLxjmZ2gvFcAHL/nTEcBo4NUyJgJ/6CLPsSFTJdZoGIJXM0z8pTMegRO/1zO
 QP4y+rpO7W/gdfu2q+SsSnH48wBKkDHIFcBjWQlruiYlotV200Y6HhSh38dgCuE614xO
 95i4bFlzRXQEwVaYUqcezy4bsr4mIu4tqwQdHDuMKqxH3Y+nB0puDC/VU/A2X4pRFkum
 zk9e7Ff0COm34b6ZBQZjdNE8PJD4Hy+Cx89ObyvVb1zMbQ4pJlUEZgD56z3Qq6Qkf86q
 OhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772697546; x=1773302346;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=up1Dq1xg6gmNuKxcZqGmFJ9w/LNCPKzJ4m3SQCOPg0U=;
 b=JykeZs274WZVOXrGeLMo7T6GqtdgTN8g7x57v9B/4Mgy5iKuQNiEaCdmyojFnYqdIV
 8xOI8CcRyNChpSoYCX6GBadEDuhP7C52dXQOUIoLu2h7DST8t1TyY5zCC6aEVwcpoYNk
 8VTpzPhkJ4KcOMrb69SS4ri38vBwSagor6K+qJwyFoTmp6X5aIp+q44IAYYms3GwOyhO
 p8IdV0eTJUBZhYu2TDpzg9fxG2sLXerH7yNrhNArVme5WcUNvIua9QbyAH5sYAn/K67x
 kMLMS6Yh+YtW0+mMdiQGl56U+SM4njfArtJesGFtGOG1M+zMA4HNixCu/Er0Bksl+Fz6
 D9UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+0mZamREt8Ayv3RuzQYIuezofJY1t5PkuxdDJ9+sQLUjoeX+RRSzUAtUSHl4oVwL1mhO6mgyXBA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqX+k1jTZbtcdf+xsDbb7eXfXjLdeJ6UAqTcySEHBg/iw5/nXC
 zcRaVn6vj9ZRiPP8T4intvr20rYg6gv9s+6G6jWQDzUdX/QhU7qm9BY1
X-Gm-Gg: ATEYQzzx07Q1uORISijT3FRyxjCE0LncGsbltDUSpKW9vFFV2v/WxNgN8JrPm4KjoOy
 XNyprSFdAx7pbEiDPO7Z1OXtxYdhN2lduCGFmTkSxcLFbQgdmKRslVuE83RzWCYFn+1HRVt2Urd
 x++7WB1JmPPAK4rvV/gwKSCKB4q7uG15Dfb+NVDpVQK3eTZLuap08A2WYemhBytAoHgeduo2H1b
 rUkjxfnnj26wQlngcEHIaCoV7HFpr/1nA6W2Hm6rq/Y671bZCyDxc9Ufak0ruqXii9FQG+e301O
 PZoEa1daHEQc5Ll5ekdE0/ASTvEtyNruXo6DimIzIBQlwwJu1Mxs5637GXPPoVpwTJhCAobGjV0
 8YFI720+8ZlP84Ms2sKKvfO/OyhgTgpk5t7T7XLc5HdBLvcxzM00A+PqEPh0aJ5jrWtGIUU/ESp
 2knglSrg==
X-Received: by 2002:a05:6000:2c0c:b0:439:905e:1236 with SMTP id
 ffacd0b85a97d-439c7f99afamr9065426f8f.2.1772697546064; 
 Wed, 04 Mar 2026 23:59:06 -0800 (PST)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b0549600sm34180087f8f.35.2026.03.04.23.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 23:59:05 -0800 (PST)
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/lnl+/tc: Fix false disconnect of active DP-alt TC
 port during long HPD pulse
Date: Thu,  5 Mar 2026 15:58:57 +0800
Message-ID: <20260305075857.40077-1-acelan.kao@canonical.com>
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

On platforms using XELPDP+ (Lunar Lake and later), tc_phy_hpd_live_status()
reads the PICAINTERRUPT_ISR register to determine DP-alt live status. The
XELPDP_DP_ALT_HOTPLUG_MASK bit in this register reflects the live HPD signal,
which deasserts (goes low) during a long HPD pulse from the sink.

When an LTTPR dongle (e.g. HP Type-C to HDMI, 03f0:8a4a) fires a long HPD
pulse after link training, intel_tc_port_connected() reads PICAINTERRUPT_ISR
and returns false even though the PHY is still owned and the link is active.
Since intel_tc_port_handles_hpd_glitches() returns true for TC dp-alt ports,
the 4ms glitch-filter retry loop in intel_digital_port_connected_locked() is
bypassed immediately, giving no protection against this transient deassertion.

The AUX abort logic then fires (-ENXIO), the hotplug handler marks DP-1 as
disconnected, and the compositor responds by disabling eDP-1, causing the
internal display to disappear.

Fix this by trusting the PHY ownership register
(XELPDP_PORT_BUF_CTL1 & XELPDP_TC_PHY_OWNERSHIP) over the transient HPD
live status in intel_tc_port_connected() when the port has an active link
(link_refcount > 0). The ownership register is stable and does not toggle
during HPD pulses.

The TC cold power domain is guaranteed to be held when link_refcount > 0,
as __intel_tc_port_lock() already asserts and verifies this via tc_phy_is_owned()
before we reach intel_tc_port_connected().

Without this fix, triggering mirror mode via hotkey on HP ZBook with HP Type-C
to HDMI dongle (03f0:8a4a) causes:

  [drm:intel_dp_hpd_pulse] got hpd irq on [ENCODER:270:DDI TC1/PHY TC1] - long
  [drm:intel_tc_port_update_mode] Port D/TC#1: TC port mode reset (disconnected -> tbt-alt)
  [drm:intel_dp_hpd_pulse] got hpd irq on [ENCODER:270:DDI TC1/PHY TC1] - long
  [drm:intel_hotplug_detect_connector] [CONNECTOR:271:DP-1] status updated from connected to disconnected

With this fix, the port correctly stays in DP-alt mode:

  [drm:intel_tc_port_update_mode] Port D/TC#1: TC port mode reset (dp-alt -> disconnected)
  [drm:intel_tc_port_update_mode] Port D/TC#1: TC port mode reset (disconnected -> dp-alt)

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/gpu/drm/i915/display/intel_tc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index bd12148e42f70..0967cfc75f522 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -1732,6 +1732,11 @@ bool intel_tc_port_connected(struct intel_encoder *encoder)
 	if (tc->mode != TC_PORT_DISCONNECTED)
 		mask = BIT(tc->mode);
 
+	if (tc->link_refcount > 0 &&
+	    tc->mode == TC_PORT_DP_ALT &&
+	    tc_phy_is_owned(tc))
+		return true;
+
 	return tc_phy_hpd_live_status(tc) & mask;
 }
 
-- 
2.51.0

