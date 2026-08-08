Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B42DC5AD44
	for <intel-xe@archiver.kernel.org>; Sat,  8 Aug 2026 16:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0014210E4DB;
	Sat,  8 Aug 2026 16:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GmSmE0wA";
	dkim-atps=neutral
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B647B10E028
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Aug 2026 09:58:18 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-47c2ae992beso20908f8f.2
 for <intel-xe@lists.freedesktop.org>; Sat, 08 Aug 2026 02:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786183097; x=1786787897; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=IsmdHGBBN2+wKUl5FWJM6Pw9aztZUCcwWWnKCiJWwQo=;
 b=GmSmE0wAhCTJYAeSNf5wiXsrD5RbxRMB29gK6dVaxqPLyjNuWWTWALbehFopcietA6
 keP/nfBcEudb0U5Ul+q+W7fp7vyNVSfbm2yUJnPvATdUhXuYIOR2dtv0y+IG7eSVd64l
 bMvwnMEYMQYY047TRH0C4QFjP8mY165dUfyWLCO42vb3RbG6S2wSJOovi1j6pBHfCaMZ
 zOTtJ2gPeGYkz/n9SWgjdBOlrUSfNqYgASQWaUzkcu+zX2TJdNlXR8EvC18TEkw3ezwH
 L9TkpITGvjRDaWOC7WR+T5bVluR6gnTlaSIZ6cX3OXcxktdqRASyl6nKycFzOAiUtOI9
 8hFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786183097; x=1786787897;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IsmdHGBBN2+wKUl5FWJM6Pw9aztZUCcwWWnKCiJWwQo=;
 b=ZK0wmhdpBbY5KnhTDzU6zQnLCWvfz+BX/PTEiAaplXFF9/+4UqdLJVoyUEkmbEyKdk
 +DlI/WrYvrDmwnTFa2Imxzl8FwXiNj04JnXfDW85q9dnlYFB6zVBtn7n1zQMwTUMEIIB
 vMd0+PW/iXAyuMxoCE5Sil+wx5cmgQRACVZHDHBS7ueAmz0b5fjdK0+SH6wGFUlkatd8
 o0J6XW4DNLV+pTg1qCCYBGa2awvMXlhlmI2gBVW92v9NfcakCRuu/ryFn4jT+5KVsUxE
 t6wpgOtmv4E+ye+kmbmj1BPsDrZMcN7KbhiXd/fQBmlUMvNsSRq35XvblAXMk6tYEiEl
 CZYA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrUswbXMa5hRF7Mic34kTmu2Mq8IyU+oHTIKGidPmnDbrA3YUcwShTw6WUWZgxiWUm6FAkxLjNtzg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDaNRBiawy4Tp5o+rRZEoUEZBx22lzXkU7AxrVl/BlE1U3izhC
 9y29+TWJek2Kt4TXGOoUOZh3n+KQFkNjSFuBoaQ4tg9FtPBALfMq72Jf
X-Gm-Gg: AR+sD13nZ22S6LSgvEmi4+GzwQ1xxt2mpqJ4TbNJJtb8cX/IsU1DrEjAitIjNTI0Dl+
 hitvM6jyTNTxtOLnNf7EwBljTkNfRSahzt/lV2/XqKDZfLlgWYrBtFuvqs9rwPo7PtnjCcC+nRI
 SYnHD//eZDOZYdapu8iKsP4V6DxloRJGBWLP32Hf+tf0qnxfDIPaykyxljHnkXYB5N0yFrwnOkt
 VATheEhWgk0vRhGzGeNOPwphIVtAaIcoP/sFBmtM4mrkSqd+mfs5PbbuMgys52moawOI6kGdt23
 1KpyYsHLtN1fIUIMVh2l21E4hf6j78gHHiOxnu9XXJYYI4NPPS/SGbCLFgwjIgnLsHF1XmEQtYb
 wlburxN1JAJ42lIP9LMoLF/fvhCcBvbZ9yXU7eKFxXy448dGmlCm6O/ZBilJTq2kFxKQ1BK5s/w
 OduDdBEzluxzmMwFs3w4ZviYa4fx4KRCkmJ2YjzkUxdL9+1jQVzKaxkQDsUjIJa+ApPRerWaMWd
 S6L+z8hZUIfyTwxe3Aklgs/WyaxzZErMlWB30EEKqpgwqVPD6VfvDJ/f20hc5mp0v544U/LdL88
 jWWG
X-Received: by 2002:a05:6000:1447:b0:47f:921f:397f with SMTP id
 ffacd0b85a97d-47fec63e5bbmr22556379f8f.4.1786183096888; 
 Sat, 08 Aug 2026 02:58:16 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME
 (20014C4E1B8E20009911270F4BEC2300.dsl.pool.telekom.hu.
 [2001:4c4e:1b8e:2000:9911:270f:4bec:2300])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480020be8f3sm13255725f8f.0.2026.08.08.02.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2026 02:58:16 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH 0/5] drm/bridge: synopsys: dw-dp: Add HDR support
Date: Sat,  8 Aug 2026 11:57:19 +0200
Message-ID: <20260808095749.9428-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 08 Aug 2026 16:23:30 +0000
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

This series teaches the Synopsys DesignWare DisplayPort bridge driver
(dw-dp) to drive HDR sinks: it attaches the "max bpc",
HDR_OUTPUT_METADATA and Colorspace connector properties and transmits
the matching HDR Metadata InfoFrame SDP and BT.2020 VSC SDP
colorimetry on the link. With the series applied, a Wayland compositor
(tested with KWin 6.6.5) recognises the DP output as HDR capable and
can enable HDR with wide color gamut on it.

The series applies on drm-misc-next with Sebastian Reichel's
"Synopsys DisplayPort Controller improvements" v11 [1] applied; the
SDP infrastructure this series builds on (per-slot tracking, locking,
the drm_output_color_format conversion) comes from that series. Happy
to rebase on a future revision.

Patch 1 lifts i915's HDR Metadata InfoFrame SDP packer into
drm_dp_helper.c as drm_dp_hdr_metadata_infoframe_sdp_pack() and
converts i915. Nothing in it is i915 specific.

Patch 2 fixes a latent bridge-connector problem that attaching
"max bpc" would otherwise expose: a connector that attached the
property before drm_mode_config_reset() comes out of that reset with a
freshly zeroed state and nothing restores max_requested_bpc. A driver
that filters formats on conn_state->max_bpc then rejects every format,
and property-naive clients (fbcon in particular) end up with a black
screen. The HDMI bridge-connector path already restores the value from
connector->max_bpc in drm_bridge_connector_create_state(); patch 2
mirrors that on the non-HDMI path. The meson no-regression analysis is
in the commit message.

Patches 3-5 are the dw-dp/Rockchip side: attach "max bpc" with range
(6, 10) - the driver's format table tops out at 10 bpc - then send the
HDR Metadata InfoFrame SDP once per frame while HDR metadata is set,
and signal BT.2020 colorimetry via VSC SDP revision 5, including the
VOP2 CSC selection in the Rockchip glue. BT.2020 requests are rejected
in atomic_check() when the sink's DPCD lacks
DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED, so a userspace TEST_ONLY
probe learns the configuration is impossible; i915 instead silently
omits the VSC SDP in that case (patch 5 has the details).

About the base, so that the test results below are not read too
widely: the runtime testing was done on a rockchip-devel based kernel,
which carries the v9 generation of the dw-dp series, with this series
on top.  The series as posted is rebased onto drm-misc-next + v11,
where it applies without conflicts and the touched objects build
cleanly, but I have not repeated the runtime tests on that base.  I
did test v11 itself on the same board separately [2].

Hardware: Rockchip RK3588 (Orange Pi 5 Plus), Samsung Odyssey G70B
connected over USB-C DP alt mode through a USB-C to HDMI 2.1 protocol
converter (DPCD ext rev 1.4, HBR2 x4, VSC SDP colorimetry supported):

- KWin 6.6.5 flips the output from "HDR: incapable" to HDR capable as
  soon as the properties appear, and enables HDR + wide color gamut:
  the monitor switches to HDR mode and the picture visually matches
  the same panel driven from the board's HDMI output (dw-hdmi-qp) with
  HDR enabled. DRM state while HDR is on: "max bpc" = 10, Colorspace =
  BT2020_RGB, HDR_OUTPUT_METADATA blob with SMPTE ST 2084 EOTF.
- Twelve consecutive HDR off/on cycles (24 modesets): no link or SDP
  errors and no -EBUSY from SDP slot allocation.
- Plain SDR behavior is unchanged. Once the properties exist KWin
  writes Colorspace=Default, a NULL metadata blob and "max bpc" on
  every atomic modeset - verified to be a no-op.
- The board boots to a working display with the properties attached,
  i.e. the boot-time config-reset path that patch 2 protects.

Bandwidth note, for why "max bpc" matters here: on this HBR2 link
4K60 RGB 10-bit does not fit (17.82 Gbit/s payload vs 17.28
available), so 10-bit output needs YCbCr subsampling on this
converter; native HBR3 links have the headroom for 4K60 10-bit RGB.

[1] https://lore.kernel.org/dri-devel/20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com/
[2] https://lore.kernel.org/all/20260808094138.7205-1-royalnet026@gmail.com/

Igor Paunovic (5):
  drm/dp: Add drm_dp_hdr_metadata_infoframe_sdp_pack()
  drm/display: bridge-connector: Preserve max bpc across connector reset
  drm/rockchip: dw_dp: Attach "max bpc" connector property
  drm/bridge: synopsys: dw-dp: Add HDR static metadata support
  drm/bridge: synopsys: dw-dp: Add BT.2020 colorimetry support

 drivers/gpu/drm/bridge/synopsys/dw-dp.c        | 86 ++++++++++++++++++++++---
 drivers/gpu/drm/display/drm_bridge_connector.c |  6 +-
 drivers/gpu/drm/display/drm_dp_helper.c        | 88 ++++++++++++++++++++++++++
 drivers/gpu/drm/drm_connector.c                |  5 ++
 drivers/gpu/drm/i915/display/intel_dp.c        | 84 +-----------------------
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c      | 66 ++++++++++++++++++-
 include/drm/display/drm_dp_helper.h            |  4 ++
 7 files changed, 248 insertions(+), 91 deletions(-)

--
2.43.0
