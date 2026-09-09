Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5E5C79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 14:24:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C556E10E171;
	Thu, 10 Sep 2026 14:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="frB7x9l8";
	dkim-atps=neutral
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com
 [74.125.225.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9EC10E557
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 17:36:14 +0000 (UTC)
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-499db1740e4so2944785e9.0
 for <intel-xe@lists.freedesktop.org>; Wed, 09 Sep 2026 10:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788975372; x=1789580172; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WLa/2IhG0uPxKott5hiW6gEdbabkA+pAUSYZZS+3kb0=;
 b=frB7x9l8Crenbt1bg+sjXRoqk1/L1pkejdGVTvTEPszl/LLrAaP6eIwpQQj6DltEEA
 W3Rxq3CRHhJA/W7g/Zm11RybkK9V6p9qVjFeoCW46HkFHmiPPRFe3XuouRKAbSgHo08g
 3O0nmuGfmpF1E5wgvObakfjsFWEvnsGoHH6VszfEx8WjczdzRmtvDS5hG5Xk3hwdxXqI
 pPAg6HSA0YlC15RTgOTqyUWvBGnYzeXZtTeX+c/WM1YFFZstcH/xWAqnZACpDX/Nuonh
 tUOFBARu7Vik6B7XA/ryrPIbBCmtGTdFJF1cmMgf36QnEAh/laxCweL+zjqCiUCuBmJy
 Oa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788975372; x=1789580172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=WLa/2IhG0uPxKott5hiW6gEdbabkA+pAUSYZZS+3kb0=;
 b=kWx0VpDLSzciGCZAPeU5lEh14NzleSoTLFyMpFJIdPEY6sJv+NqgGXpw4/ZObEhfs8
 o6+zAdeD5UlrGm+UM3QD6MyuJjwwE8JvWq/vTYdYrMi20rtwZf5cFIrs/F2RDx43ZyIa
 tug9+M1zhcyfzS/uMYCF52hX26W5ewoxfilCNywt4mFrvtXqCpWTY6ySNhVSkquR4apq
 r89tM1WHX4dereaZFpcJwDKVZKgG40iYklrvjhS0hPtour6/O5OYuGSoEtDOu9OmO+zi
 VrwvzCkvqas3ezbsbdwyJ9OpisEfdb2HVW+mnt6FtGJPPVkQF0cPEYIJf9t9NLJNFg5C
 VSMQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxgQ5UyJsN016ZGTv+av3lNKOZbn+aYODniQK0KXPZO0j+92r+JPwJvPGYB8GatexBkX8dWSSza6Q==@lists.freedesktop.org
X-Gm-Message-State: AFuF++nZHlrwD2Hyk94qYPqxPPvlh0Lf/p9yU26g03754krFUt6VC8AG
 +lEVOSsqmM8IzpjUD2Sf53WaQ0c44mUJKEinpvMnIjdfQNB+ybnl6DWw
X-Gm-Gg: AYBFou3RN1ndFutWz9WkmCsh6QY+xMFzRLNTUPmHfZ3ewMkcNj+k5KEhth+0aaQddpi
 ehf7zRfSVbFYOykS5HoAmLjeCrRyaqb8v4PLXSVPV+hckXdlOmvvIxLybNID3HFt7Ztr/hiaElU
 gnkQTtbwhI6IPnwuVrRX9xeT7QP1SyNCLCjQ+yXgvaRJmVFGmOiL+WugJ4W1GTammUZRCEpkj44
 iTyLh/73UOhy/S0tN0PwpgCQTu5Sug3fsX+mr0y8pamZ0h+KOOJ+cUwAVmw+FlbuTgKgXWqnkKI
 Sl3DYcOYLP6XyunCIX2TG9vLKfQrSmHWqBCblJt2JlTvvj+/DU7g+Pi9mJgX5bUDxgxyg/EqsKU
 UVA4K6QDtkc9LSiqkdkipMiqfsbgKUL24gFJ5uhO8DArdt2/+U3GlmExwXBByQpUE3gU0d5cTwJ
 TsKdzz+0NYOBzKeEN92mOpV+D+HksaOjeWPUxGd46Y9Ngjs4ne1TtSKdYCSWce92hEZCCUF6pgh
 vHydbNU5aYXS5n0XYPMJ+8OPdaW9At6Qb9GrJ7jO6DeCDsj6QipCDMYDZfDsry8uCeRfYnuerHC
 Lw==
X-Received: by 2002:a05:600c:a305:b0:49c:ff81:e062 with SMTP id
 5b1f17b1804b1-49cff81e076mr237967455e9.2.1788975372348; 
 Wed, 09 Sep 2026 10:36:12 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME
 (20014C4E1B836900B0110705BF092680.dsl.pool.telekom.hu.
 [2001:4c4e:1b83:6900:b011:705:bf09:2680])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26c06f04sm6876575e9.13.2026.09.09.10.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 10:36:11 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Igor Paunovic <royalnet026@gmail.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
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
 Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 2/3] drm/display: bridge-connector: Preserve max bpc across
 connector reset
Date: Wed,  9 Sep 2026 19:35:39 +0200
Message-ID: <20260909173542.14030-3-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909163206.36409-1-royalnet026@gmail.com>
References: <20260909163206.36409-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 10 Sep 2026 14:24:03 +0000
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

drm_connector_attach_max_bpc_property() initializes max_requested_bpc
and max_bpc in the connector state, but nothing restores them when the
connector state is later thrown away and re-created:
drm_bridge_connector_create_state() returns a zeroed state for
non-HDMI bridge connectors, and drm_mode_config_reset() installs such
a fresh state on every connector that implements
&drm_connector_funcs.atomic_create_state instead of a .reset hook.

This matters because drivers can attach the property before
drm_mode_config_reset() runs. Rockchip, for example, binds its
component drivers (which create connectors and attach properties)
before calling drm_mode_config_reset(). After that reset,
max_requested_bpc is 0, so drm_atomic_connector_check() computes
max_bpc = min(info->bpc ?: 8, 0) = 0. Any driver that filters output
formats on conn_state->max_bpc then rejects every format, and clients
that never set the "max bpc" property - fbcon in particular - end up
with a black screen. meson already attaches the property on a
drm_bridge_connector before drm_mode_config_reset() and so already
boots with max_requested_bpc = 0 today. dw-hdmi's format negotiation
does consume the value there, but meson attaches the property with a
maximum of 8 and the 8-bit fallback formats are not gated on it, so
negotiation yields the same result for 0 and 8 - the change is a
no-op for meson.

HDMI bridge connectors are immune: drm_bridge_connector_create_state()
calls __drm_atomic_helper_connector_hdmi_state_init(), which
initializes both fields from connector->max_bpc. amdgpu likewise
re-initializes max_requested_bpc in its own .reset implementation.
Non-HDMI bridge connectors have no equivalent.

Mirror the HDMI helper on the non-HDMI path: record the upper attach
limit in connector->max_bpc (drmm_connector_hdmi_init() already stores
the same value there) and restore max_requested_bpc and max_bpc from
it in drm_bridge_connector_create_state() whenever the "max bpc"
property is attached. Connectors without the property behave exactly
as before.

Assisted-by: LLM checkpatch
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 6 +++++-
 drivers/gpu/drm/drm_connector.c                | 5 +++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 00feb73e63d7f..6197fb80f7cc2 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -279,9 +279,13 @@ drm_bridge_connector_create_state(struct drm_connector *connector)
 	if (IS_ERR(conn_state))
 		return conn_state;
 
-	if (bridge_connector->bridge_hdmi)
+	if (bridge_connector->bridge_hdmi) {
 		__drm_atomic_helper_connector_hdmi_state_init(connector,
 							      conn_state);
+	} else if (connector->max_bpc_property) {
+		conn_state->max_requested_bpc = connector->max_bpc;
+		conn_state->max_bpc = connector->max_bpc;
+	}
 
 	return conn_state;
 }
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 8b4baed060f3a..0400a6a92e2b7 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2866,6 +2866,10 @@ EXPORT_SYMBOL(drm_connector_set_link_status_property);
  * @max: The maximum bit depth supported by the connector.
  *
  * This is used to add support for limiting the bit depth on a connector.
+ * @max is also recorded in &drm_connector.max_bpc, so that
+ * &drm_connector_funcs.atomic_create_state and &drm_connector_funcs.reset
+ * implementations can restore the property default when re-creating the
+ * connector state.
  *
  * Returns:
  * Zero on success, negative errno on failure.
@@ -2888,6 +2892,7 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 	drm_object_attach_property(&connector->base, prop, max);
 	connector->state->max_requested_bpc = max;
 	connector->state->max_bpc = max;
+	connector->max_bpc = max;
 
 	return 0;
 }
-- 
2.43.0

