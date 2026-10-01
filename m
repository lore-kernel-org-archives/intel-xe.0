Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0053ECA5FDD
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 21:35:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7AFC10E453;
	Thu,  1 Oct 2026 21:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fNsb71c8";
	dkim-atps=neutral
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4C410E1B4
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 21:35:04 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-93cb88344aeso80690185a.0
 for <intel-xe@lists.freedesktop.org>; Thu, 01 Oct 2026 14:35:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790890503; cv=none;
 d=google.com; s=arc-20260327;
 b=knhwfp7i7LzJ3Nc23riD9VPoLatW9zrjQU4zcA0DKi9ZgDU/3Owi0e4Pwc/1plNNST
 cpm/knJEtbeBkbjTVqcMLGPP2+1Y35ltLei3cx3KstsSjHqZXnxTUDEeNOKILdWfWDsY
 Fms60ol0lYF8dDtbBGmIChK8ES1RDIBvPIGK1V6vU0yjVlp06fz450RJzZji39HvqD19
 rAxsl1RlRRR0O+MG1Ys4ffKRJpmKzc2aoMO9adum6EYWyMdSgz3YeDcXmB/Srq/2jo+8
 b84dhe9QwWcCdt7nN4VK7hogkTkqzOu7qV0jAv6nore/BLP7h3Pz+2nO+rAYiMBgOdOU
 mRXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=C5P6G3fALTBzxItABXwCNl4OlA639uqK4OV5m5XMW0A=;
 fh=PaEHZCs9VtXl7nYXfaNWVGV1bCYCePTQWYq0YCmf7XM=;
 b=SwYHw+SNcZbOpfFQQ4QJWVM+oRzc6pkoVaGaHhT6M7gdJuu14JlSTcyw/Nar9xYmtC
 sRbmn4HUa3M4bS4KD5OBtrLnFfsw8hCnX3+h780hbY6OXEFUVLjOmRtc69SiyS5jbieV
 rPOrl83iHqCuIStsBI6h7kGJ7lmSdlXJz/4HipSTxWdFz7a+eUDeMNiNgcibokrfDXbA
 L7myYXntmAd6c2nMPFi51OcQiMN3HHbQhBLodtwzHbBTq3WZU3vz9ipM8ueTpimIEqHE
 1m7huRI/Fgo+4vexJEcu7QpTOAO/4fSYI6OYgXSC2Zr9afzJm7cZ4rv9bBVfCnmKR1AB
 a/AA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790890503; x=1791495303; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=C5P6G3fALTBzxItABXwCNl4OlA639uqK4OV5m5XMW0A=;
 b=fNsb71c894pD+Pk9YhOo1I2/oFoVRTnpQZ4fzlh6Ff/yogC6pCQ1pQiKSATCybr1tN
 KCDaWjJfMasS31OqbYFbJ85Px7oO38uSRSRzXPfpkmcA2OIl9AQHCa9hd0Grog80uwKG
 wjkDIQ6EFbTflm9t2RKoEIhcjgljYR/CmVdYHX5VrHrlONmgxGyMW5MftCAv+DfOUf7r
 D3waiCIhsAY6MIJvkbzemMyYEU5ctDytM8g6RtQwhMKHjDlURX/EZzqI5kpgQmG8LGcP
 UY2H1Qy8hiyB2nZKYU4YmsdpZKTbU1yosQlZ6HTjrBJRKLxUljn0kBWQu2hh0ae1PQsW
 R+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790890503; x=1791495303;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=C5P6G3fALTBzxItABXwCNl4OlA639uqK4OV5m5XMW0A=;
 b=c6DU+ayJefQ5XsdM+Qm9eFvoKtyhB8wXEnYjmhLc0g+3se2v0cW6kVhmUC+6wrjWkY
 wH/m8mYLg5dsJQu7d3LQJFeMmTZ8mTitllaSMZ9PrBDAELmJHyieg3007V0HxLQpxQVp
 7MdBmCNEjCqmjL7aa8k+3/+QX20fXkVmZoItNcfRccZlcpIz+zXIPyGi1zyzjuHHgsC5
 fXz/T9SYboeBFJnXZxsuN/duTtiVWdIvH0dcluyUEL7KSgGWzZwnt4HiyUpFWW6LO0a5
 U6nrdioHLzs4XhB3yX1WgeeQMyn111MWj2a07GpNt4jbj3FvHotknDDnr2KYHecdhQD1
 kxmw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwY8/A5zBwvwBkBLMOUdnYlfiXPdMfNdLrHFERIQUoEtLZgQo8mr3TIFhRctuuhRj23i9E+VQ4FAw==@lists.freedesktop.org
X-Gm-Message-State: AFuF++mf9pDVECC2r9JmrrgKFZI+n2DgBbD5do5Na2ay5Vb7PHDJ8e7n
 onh3GxPeoWrKXL0qdbp+xjNIaSVCWRFA0PW9X3mipWKNWxtuJgwjZgnnQC8nQdb/Q2ODiHaqYc1
 zgr82wShmO0fc/cZt7LaGvVb3Gyh/rzH0zkjU
X-Gm-Gg: AYBFou2LiGpe0PI6V6aY9NOdY/f5h2S5SdJtalcC+fQy/4kuSI0htkD8WJBbc1h2VA6
 ooioW35SfBCa8cuT5zHpqdU1/0q54R68d1e65YW6KU1pnbD1JkfIGl2pTupI7OeojzaDU3CuuZJ
 JRDZnRqV0GDe8LprQD8mA+WJdOO1zLfFm4QE3MfWlOGCd1GbRFoCrVSKKSrOd0iUFh2sRhlaCBL
 5jVhGKWLEdpnQ7PJdMCe5Ma5KCy8nhqSpiRE4JuTqb88Wk7vknJR76knAP8dzSr4psmCwzrdC/0
 KZdw8HdClgmR2gr7Ffz4qyEN39q41VvsISRd6qHON1+pdrn2pWUis5lyfktl0Chk2yU3ywt/5Xi
 8B7N4hAWuc1Bp5302QAnt98dbOfgnLlGDDKADkhDP
X-Received: by 2002:a05:620a:6086:b0:939:af12:f5a0 with SMTP id
 af79cd13be357-93cb5b4b547mr836218285a.23.1790890503405; Thu, 01 Oct 2026
 14:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20261001120401.GA491855@linux.fritz.box>
In-Reply-To: <20261001120401.GA491855@linux.fritz.box>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 2 Oct 2026 07:34:50 +1000
X-Gm-Features: AclHuK80wWhHLXC2R3NYuwxTC7RQcHWfveah_6PzIKdI8bMx59Om0P18FM2vJPw
Message-ID: <CAPM=9tzyih_6-TOOkr4ELKuOy3d3191Q8eDNEU3wXMbnsgUUwQ@mail.gmail.com>
Subject: Re: [PULL] drm-misc-next
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dim-tools@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, 1 Oct 2026 at 22:04, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi Dave, Sima,
>
> here's the week's PR from drm-misc-next. On the hardware side, we got
> support for the 10" RasPi Touch Display 2 and for the Renesas RZ/G3L
> SoC. For internal changes, there's a larger refactoring in how the panel
> code interacts with bridges. And, of course, there's the usual naumber
> of fixes and clean ups.

The broken missing of_get_bridge changes, break my builds here, can
you send me a new PR for drm-misc-next which has those fixes in it?

I won't merge this one.

Thanks,
Dave.
>
> Best regards
> Thomas
>
> drm-misc-next-2026-10-01:
> drm-misc-next for v7.4:
>
> Cross-subsystem Changes:
>
> Documentation:
> - Fix indention in display-related DT bindings
>
> Core Changes:
>
> - Provide helpers for calculating absolute and relative timeouts
>
> clients:
> - fbdev: Move helpers from drm_kms_helper.ko to drm_client_lib.ko
>
> display:
> - dp/mst: Improve DPCD compliance
>
> sched:
> - Fix locking
>
> Driver Changes:
>
> amdxdna:
> - Support AIE2 rev 9
> - Fix UAF access in scheduler fences
> - Update workqueue interface
>
> bridge:
> - Select DRM_PANEL_BRIDGE for various drivers that require it
>
> imagination
> - Clean up firmware interface
>
> imx:
> - Replace simple-display with regular atomic helpers
>
> ivpu:
> - Simplify NULL-pointer handling in cleanup code
>
> mxsfb:
> - Support bus formats plus DT bindings
>
> panel:
> - ebbg-ft8719: Fix MODULE_LICENSE() string; Improve initialization
> - edp: NV140WU2-M70
> - ilitek-ili9882t: Support Ilitek IL79600A plus DT bindings
> - simple: Support Truly TFT320240-229-E plus DT bindings; Support BOE
>   DV215FHM-R01 plus DT bindings
> - Refactor struct drm_panel to contain struct drm_bridge plus fallout in
>   various panel drivers
>
> panthor:
> - Validate user-space input against firmware limits
>
> renesas:
> - Support RZ/G3L SoC
>
> ssd130x:
> - ssd132x: Set correct hardware window when clearing screen
>
> tve200:
> - Fix interrupt DT bindings
> The following changes since commit 6e375de99d0c420169481fcd36064177ab55b0=
9d:
>
>   drm/v3d: Skip perfmon serialization while a global perfmon is set (2026=
-09-23 14:28:57 -0300)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2=
026-10-01
>
> for you to fetch changes up to 7c4bda20eb0f150315d19f1b51058820e75d3f3d:
>
>   drm: renesas: rz-du: Add support for RZ/G3L LVDS encoder (2026-10-01 10=
:46:01 +0100)
>
> ----------------------------------------------------------------
> drm-misc-next for v7.4:
>
> Cross-subsystem Changes:
>
> Documentation:
> - Fix indention in display-related DT bindings
>
> Core Changes:
>
> - Provide helpers for calculating absolute and relative timeouts
>
> clients:
> - fbdev: Move helpers from drm_kms_helper.ko to drm_client_lib.ko
>
> display:
> - dp/mst: Improve DPCD compliance
>
> sched:
> - Fix locking
>
> Driver Changes:
>
> amdxdna:
> - Support AIE2 rev 9
> - Fix UAF access in scheduler fences
> - Update workqueue interface
>
> bridge:
> - Select DRM_PANEL_BRIDGE for various drivers that require it
>
> imagination
> - Clean up firmware interface
>
> imx:
> - Replace simple-display with regular atomic helpers
>
> ivpu:
> - Simplify NULL-pointer handling in cleanup code
>
> mxsfb:
> - Support bus formats plus DT bindings
>
> panel:
> - ebbg-ft8719: Fix MODULE_LICENSE() string; Improve initialization
> - edp: NV140WU2-M70
> - ilitek-ili9882t: Support Ilitek IL79600A plus DT bindings
> - simple: Support Truly TFT320240-229-E plus DT bindings; Support BOE
>   DV215FHM-R01 plus DT bindings
> - Refactor struct drm_panel to contain struct drm_bridge plus fallout in
>   various panel drivers
>
> panthor:
> - Validate user-space input against firmware limits
>
> renesas:
> - Support RZ/G3L SoC
>
> ssd130x:
> - ssd132x: Set correct hardware window when clearing screen
>
> tve200:
> - Fix interrupt DT bindings
>
> ----------------------------------------------------------------
> Alessio Belle (2):
>       drm/imagination: Treat FW connection ctl like other interface struc=
tures
>       drm/imagination: Don't map FW interface structures unnecessarily
>
> Alexander Sverdlin (1):
>       dt-bindings: display: simple: Add Truly TFT320240-229-E panel
>
> Andrzej Kacprowski (1):
>       accel/ivpu: Make BO free helper NULL-safe
>
> Biju Das (7):
>       drm: renesas: rzg2l_mipi_dsi: Add dphyctrl0_init_val to hw_info
>       drm: renesas: rzg2l_mipi_dsi: Add activation_dly to hw_info
>       drm: renesas: rzg2l_mipi_dsi: Move global timings into hardware inf=
o struct
>       drm: renesas: rzg2l_mipi_dsi: Add support for DSI PWRRDY
>       drm: renesas: rzg2l_mipi_dsi: Add RZ/G3L MIPI DSI support
>       drm: renesas: rz-du: Add RZ/G3L (R9A08G046) DU support
>       drm: renesas: rz-du: Add support for RZ/G3L LVDS encoder
>
> Casey Connolly (1):
>       drm/panel: ebbg-ft8719: Set prepare_prev_first
>
> David Heidelberg (2):
>       drm/panel: ebbg-ft8719: Fix the MODULE_LICENSE() string
>       drm/panel: ebbg-ft8719: Split initialization into enable/disable fn
>
> Fabio Piparo (1):
>       drm/ssd130x: Set the address window in ssd132x_clear_screen()
>
> Francesco Dolcini (2):
>       dt-bindings: lcdif: Add endpoint bus-width property
>       drm: mxsfb: Add optional DPI output bus-width configuration
>
> Frank Bodammer (1):
>       drm/panel: simple: Add support for Truly TFT320240-229-E panel
>
> George Karagounis (1):
>       accel/amdxdna: Replace create_singlethread_workqueue with alloc_ord=
ered_workqueue
>
> Haikun Zhou (1):
>       drm/panel-edp: Support NV140WU2-M70 edp panel
>
> Krzysztof Kozlowski (1):
>       dt-bindings: display: Use consistent indentation in the example
>
> Linus Walleij (1):
>       dt-bindings: display: faraday,tve200: Use a level-high interrupt
>
> Lizhi Hou (2):
>       accel/amdxdna: Preallocate hardware context schedulers
>       accel/amdxdna: Add support for AIE2 revision 9
>
> Luca Ceresoli (28):
>       drm/bridge: tc358764: don't select unused DRM_PANEL
>       drm/bridge: ti-dlpc3433: don't depend on DRM_PANEL, select DRM_PANE=
L_BRIDGE
>       drm/bridge: nxp-ptn3460: select DRM_PANEL_BRIDGE, not DRM_PANEL
>       drm/bridge: parade-ps8622: select DRM_PANEL_BRIDGE, not DRM_PANEL
>       drm/bridge: tc358775: select DRM_PANEL_BRIDGE, not DRM_PANEL
>       drm/bridge: tc358767: select DRM_PANEL_BRIDGE
>       drm/bridge: tc358768: select DRM_PANEL_BRIDGE
>       drm/bridge: ssd2825: select DRM_PANEL_BRIDGE
>       drm/bridge: tc358764: select DRM_PANEL_BRIDGE
>       drm: of: move drm_of_find_panel_or_bridge() from drm_of.c to drm_pa=
nel.c
>       drm: of: remove now unnecessary forward declarations
>       drm/panel: move to a new module
>       drm/bridge: panel: move all code to drm_panel.c
>       drm/panel: embed a drm_bridge into every drm_panel
>       drm/bridge: remove devm_drm_put_bridge()
>       drm/panel: deprecate panel-bridge APIs
>       drm/todo: add entry for removing the panel_bridge API
>       drm/bridge: tc358767: don't create a panel_bridge
>       drm/bridge: waveshare-dsi: don't create a panel_bridge
>       drm/mcde: dsi: remove unused includes
>       drm/mcde: dsi: don't create a panel_bridge
>       drm/bridge: fsl-ldb: don't create a panel_bridge
>       drm/bridge: samsung-dsim: don't create a panel_bridge
>       drm/bridge: tc358768: don't create a panel_bridge
>       drm/bridge: ssd2825: don't create a panel_bridge
>       drm/omap: dss: don't create a panel_bridge
>       drm/tve200: don't create a panel_bridge
>       drm/bridge: analogix_dp: don't create a panel_bridge
>
> Marek Vasut (4):
>       dt-bindings: display: panel: Document 10" Raspberry Pi Touch Displa=
y 2
>       drm/panel: ilitek-ili9882t: Make enable GPIO optional
>       drm/panel: ilitek-ili9882t: Set prepare_prev_first
>       drm/panel: ilitek-ili9882t: Add support for Ilitek IL79600A-based p=
anels
>
> Ma=C3=ADra Canal (7):
>       drm: Move drm_timeout_abs_to_jiffies() to drm_timeout.c
>       drm: Add drm_timeout_rel_to_jiffies()
>       drm/amdgpu: Use drm_timeout_abs_to_jiffies()
>       drm/v3d: Use drm_timeout_rel_to_jiffies()
>       drm/i915: Use drm_timeout_rel_to_jiffies()
>       drm/vc4: Use drm_timeout_rel_to_jiffies()
>       drm: Rename drm_utils.h to drm_panel_quirks.h
>
> Osama Abdelkader (1):
>       drm/panthor: validate userspace queue count against initialized fir=
mware slot count
>
> Philipp Stanner (2):
>       drm/sched: Remove forgotten header
>       drm/sched: Protect entity->last_scheduled with spinlock
>
> Randy Dunlap (1):
>       Documentation/gpu: fix location of drm_panel kernel-doc
>
> Sasha Levin (1):
>       drm/panel: select DRM_KMS_HELPER
>
> Thomas Zimmermann (2):
>       drm/fbdev: Move fbdev module parameters next to module init
>       drm/fbdev: Move fbdev helpers into client library
>
> Vishnu Saini (2):
>       dt-bindings: display: simple: Add boe,dv215fhm-r01 compatible
>       drm/panel: simple: Add BOE DV215FHM-R01 panel
>
> Xiao Lu (1):
>       drm/dp/mst: reject DPCD read/write on ports with ddps=3D0
>
> Ze Huang (2):
>       drm/imx/lcdc: avoid duplicate clk_per enable
>       drm/imx: replace struct drm_simple_display_pipe with regular atomic=
 helpers
>
>  .../display/allwinner,sun6i-a31-mipi-dsi.yaml      |  10 +-
>  .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml        |   4 +-
>  .../bindings/display/bridge/lontium,lt8912b.yaml   |   8 +-
>  .../bridge/megachips,stdp2690-ge-b850v3-fw.yaml    |   2 +-
>  .../bindings/display/bridge/nxp,tda998x.yaml       |   2 +-
>  .../bindings/display/bridge/toshiba,tc358764.yaml  |   2 +-
>  .../bindings/display/bridge/toshiba,tc358775.yaml  |  12 +-
>  .../bindings/display/faraday,tve200.yaml           |   2 +-
>  .../devicetree/bindings/display/fsl,lcdif.yaml     |  12 +-
>  .../devicetree/bindings/display/himax,hx8357.yaml  |   2 +-
>  .../bindings/display/imx/fsl,imx-lcdc.yaml         |   2 +-
>  .../bindings/display/imx/fsl,imx6q-ldb.yaml        |  54 +-
>  .../bindings/display/mediatek/mediatek,ethdr.yaml  |  90 +--
>  .../bindings/display/mediatek/mediatek,hdmi.yaml   |  24 +-
>  .../bindings/display/panel/ilitek,il79900a.yaml    |  13 +-
>  .../panel/panel-simple-lvds-dual-ports.yaml        |   2 +
>  .../bindings/display/panel/panel-simple.yaml       |   2 +
>  .../bindings/display/panel/samsung,ams495qa01.yaml |   2 +-
>  .../bindings/display/sitronix,st7567.yaml          |   4 +-
>  .../devicetree/bindings/display/st,stm32-dsi.yaml  |  46 +-
>  .../devicetree/bindings/display/st,stm32-ltdc.yaml |   6 +-
>  .../bindings/display/st,stm32mp25-lvds.yaml        |   4 +-
>  Documentation/gpu/drm-kms-helpers.rst              |   8 +-
>  Documentation/gpu/todo.rst                         |  33 +-
>  drivers/accel/amdxdna/aie2_ctx.c                   | 117 +++-
>  drivers/accel/amdxdna/aie2_msg_priv.h              |   1 +
>  drivers/accel/amdxdna/aie2_pci.c                   |  15 +-
>  drivers/accel/amdxdna/aie2_pci.h                   |   6 +-
>  drivers/accel/amdxdna/amdxdna_mailbox.c            |   2 +-
>  drivers/accel/amdxdna/npu4_regs.c                  |   1 +
>  drivers/accel/ethosu/ethosu_drv.c                  |   2 +-
>  drivers/accel/ivpu/ivpu_fw.c                       |  65 +-
>  drivers/accel/ivpu/ivpu_gem.c                      |   5 +-
>  drivers/accel/ivpu/ivpu_ipc.c                      |  11 +-
>  drivers/accel/ivpu/ivpu_job.c                      |   6 +-
>  drivers/accel/ivpu/ivpu_ms.c                       |  17 +-
>  drivers/accel/rocket/rocket_gem.c                  |   2 +-
>  drivers/gpu/drm/Kconfig                            |   7 +-
>  drivers/gpu/drm/Makefile                           |   5 +-
>  drivers/gpu/drm/adp/adp-mipi.c                     |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  20 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   1 -
>  .../amd/display/amdgpu_dm/amdgpu_dm_backlight.c    |   2 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_connector.c    |   1 -
>  drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |   1 +
>  drivers/gpu/drm/armada/armada_fbdev.c              |   2 +-
>  drivers/gpu/drm/bridge/Kconfig                     |  18 +-
>  drivers/gpu/drm/bridge/analogix/Kconfig            |   1 +
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  40 +-
>  drivers/gpu/drm/bridge/aux-bridge.c                |   1 +
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |   1 +
>  drivers/gpu/drm/bridge/fsl-ldb.c                   |  19 +-
>  drivers/gpu/drm/bridge/imx/imx93-pdfc.c            |   1 +
>  drivers/gpu/drm/bridge/panel.c                     | 563 ---------------=
--
>  drivers/gpu/drm/bridge/samsung-dsim.c              |  24 +-
>  drivers/gpu/drm/bridge/ssd2825.c                   |  23 +-
>  drivers/gpu/drm/bridge/tc358767.c                  |  64 +-
>  drivers/gpu/drm/bridge/tc358768.c                  |  25 +-
>  drivers/gpu/drm/bridge/ti-tdp158.c                 |   1 +
>  drivers/gpu/drm/bridge/waveshare-dsi.c             |  17 +-
>  drivers/gpu/drm/clients/Makefile                   |   3 +-
>  drivers/gpu/drm/clients/drm_fbdev_client.c         |   2 +-
>  .../drm_fbdev_helper.c}                            |  34 +-
>  drivers/gpu/drm/display/drm_bridge_connector.c     |   1 +
>  drivers/gpu/drm/display/drm_dp_mst_topology.c      |   6 +
>  drivers/gpu/drm/drm_bridge.c                       |  17 -
>  drivers/gpu/drm/drm_connector.c                    |   2 +-
>  drivers/gpu/drm/drm_crtc_helper_internal.h         |   9 +
>  drivers/gpu/drm/drm_fbdev_dma.c                    |   2 +-
>  drivers/gpu/drm/drm_fbdev_shmem.c                  |   2 +-
>  drivers/gpu/drm/drm_fbdev_ttm.c                    |   2 +-
>  drivers/gpu/drm/drm_kms_helper_common.c            |  39 ++
>  drivers/gpu/drm/drm_of.c                           |  63 --
>  drivers/gpu/drm/drm_panel.c                        | 664 +++++++++++++++=
++++--
>  drivers/gpu/drm/drm_panel_backlight_quirks.c       |   2 +-
>  drivers/gpu/drm/drm_panel_orientation_quirks.c     |   2 +-
>  drivers/gpu/drm/drm_syncobj.c                      |  35 +-
>  drivers/gpu/drm/drm_timeout.c                      |  95 +++
>  drivers/gpu/drm/exynos/exynos_dp.c                 |  36 +-
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |   2 +-
>  drivers/gpu/drm/gma500/fbdev.c                     |   2 +-
>  drivers/gpu/drm/i915/display/intel_fbdev.c         |   2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_wait.c           |  17 +-
>  drivers/gpu/drm/imagination/pvr_fw.c               | 130 ++--
>  drivers/gpu/drm/imagination/pvr_fw.h               |  18 +-
>  drivers/gpu/drm/imx/dc/dc-kms.c                    |   1 +
>  drivers/gpu/drm/imx/dcss/Kconfig                   |   1 +
>  drivers/gpu/drm/imx/lcdc/imx-lcdc.c                | 257 +++++---
>  drivers/gpu/drm/ingenic/Kconfig                    |   1 +
>  drivers/gpu/drm/lima/lima_gem.c                    |   2 +-
>  drivers/gpu/drm/logicvc/Kconfig                    |   1 +
>  drivers/gpu/drm/mcde/Kconfig                       |   2 +-
>  drivers/gpu/drm/mcde/mcde_display.c                |   1 +
>  drivers/gpu/drm/mcde/mcde_dsi.c                    |  45 +-
>  drivers/gpu/drm/msm/dp/dp_display.c                |   1 +
>  drivers/gpu/drm/msm/dsi/dsi.c                      |   3 +-
>  drivers/gpu/drm/msm/msm_debugfs.c                  |   2 +-
>  drivers/gpu/drm/msm/msm_fbdev.c                    |   2 +-
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |  43 ++
>  drivers/gpu/drm/mxsfb/mxsfb_drv.h                  |   2 +
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |  12 +
>  drivers/gpu/drm/nouveau/dispnv50/disp.c            |   1 -
>  drivers/gpu/drm/omapdrm/dss/omapdss.h              |   1 -
>  drivers/gpu/drm/omapdrm/dss/output.c               |  42 +-
>  drivers/gpu/drm/omapdrm/omap_debugfs.c             |   2 +-
>  drivers/gpu/drm/omapdrm/omap_fbdev.c               |   2 +-
>  drivers/gpu/drm/panel/Kconfig                      |   3 +-
>  drivers/gpu/drm/panel/panel-ebbg-ft8719.c          |  23 +-
>  drivers/gpu/drm/panel/panel-edp.c                  |   1 +
>  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c      | 234 +++++++-
>  drivers/gpu/drm/panel/panel-simple.c               |  57 ++
>  drivers/gpu/drm/panfrost/panfrost_drv.c            |   2 +-
>  drivers/gpu/drm/panthor/panthor_drv.c              |   1 -
>  drivers/gpu/drm/panthor/panthor_sched.c            |   3 +
>  drivers/gpu/drm/pl111/Kconfig                      |   1 +
>  drivers/gpu/drm/radeon/radeon_device.c             |   2 +-
>  drivers/gpu/drm/radeon/radeon_fbdev.c              |   2 +-
>  drivers/gpu/drm/renesas/rz-du/Kconfig              |  13 +
>  drivers/gpu/drm/renesas/rz-du/Makefile             |   1 +
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c       |  24 +-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h       |   3 +-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c   |  24 +
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     | 162 ++++-
>  drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c         | 275 +++++++++
>  drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h    |  25 +
>  drivers/gpu/drm/rockchip/Kconfig                   |   2 +
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  11 -
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |   2 +-
>  drivers/gpu/drm/scheduler/sched_entity.c           |  51 +-
>  drivers/gpu/drm/scheduler/sched_main.c             |   1 -
>  drivers/gpu/drm/sitronix/st7571.c                  |   1 -
>  drivers/gpu/drm/solomon/ssd130x.c                  |  30 +-
>  drivers/gpu/drm/stm/Kconfig                        |   1 +
>  drivers/gpu/drm/tegra/fbdev.c                      |   2 +-
>  drivers/gpu/drm/tegra/rgb.c                        |   1 +
>  drivers/gpu/drm/tegra/uapi.c                       |   2 +-
>  drivers/gpu/drm/tidss/Kconfig                      |   1 +
>  drivers/gpu/drm/tve200/Kconfig                     |   2 +-
>  drivers/gpu/drm/tve200/tve200_drm.h                |   1 -
>  drivers/gpu/drm/tve200/tve200_drv.c                |  31 +-
>  drivers/gpu/drm/v3d/v3d_bo.c                       |   3 +-
>  drivers/gpu/drm/v3d/v3d_drv.h                      |  10 -
>  drivers/gpu/drm/vboxvideo/vbox_mode.c              |   2 +-
>  drivers/gpu/drm/vc4/vc4_gem.c                      |   3 +-
>  drivers/gpu/drm/xe/xe_wait_user_fence.c            |   2 +-
>  drivers/video/fbdev/efifb.c                        |   2 +-
>  include/drm/bridge/analogix_dp.h                   |   1 -
>  .../drm_fbdev_helper.h}                            |   4 +-
>  include/drm/drm_bridge.h                           |  54 --
>  include/drm/drm_of.h                               |  15 +-
>  include/drm/drm_panel.h                            |  99 ++-
>  include/drm/{drm_utils.h =3D> drm_panel_quirks.h}    |  10 +-
>  include/drm/drm_timeout.h                          |  17 +
>  include/drm/gpu_scheduler.h                        |  10 +-
>  156 files changed, 2592 insertions(+), 1684 deletions(-)
>  delete mode 100644 drivers/gpu/drm/bridge/panel.c
>  rename drivers/gpu/drm/{drm_fb_helper.c =3D> clients/drm_fbdev_helper.c}=
 (97%)
>  create mode 100644 drivers/gpu/drm/drm_timeout.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
>  rename include/drm/{drm_fb_helper.h =3D> clients/drm_fbdev_helper.h} (99=
%)
>  rename include/drm/{drm_utils.h =3D> drm_panel_quirks.h} (57%)
>  create mode 100644 include/drm/drm_timeout.h
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> GF: Stefan Gaiser, Jochen Jaser, Abhinav Puri, (HRB 36809, AG N=C3=BCrnbe=
rg)
