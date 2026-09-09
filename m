Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C83C88E45
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 14:24:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC96F10E2D2;
	Thu, 10 Sep 2026 14:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fDddcE1h";
	dkim-atps=neutral
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com
 [74.125.225.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415C010E557
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 17:36:16 +0000 (UTC)
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843af75de5so621941f8f.3
 for <intel-xe@lists.freedesktop.org>; Wed, 09 Sep 2026 10:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788975375; x=1789580175; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EqyOJwWDc9siUyUIf9HLEiRZ/UBmYkZ2bG5NW9K2GYU=;
 b=fDddcE1hBH0aV7gxmYszw66V+DtDfxbheCNsiJvmvNvo45OJoLmieY0HRE8UkdnvWV
 8iDq+j+lo7oW6LrXsffpwr5zH7tWQjSsaY/krOmVQ8V8VCeoFTD3D9RplDQ9IJA4eTg7
 qRWkDYrwatkhcDxyzlnoxkSAWtxRbQ/WOctLaxb3T+Uej3h/3GMLMfhgWAfzV1hIJTX5
 fDVAyM5kUn9pij5liMk8UIk3KvHnVU35+L+0sIr6ubz3js2beQicC7eBi2v8c4IbREpw
 h2zSJXPVh2h8YQP1dX7gLJwz/GCvaymOYIc2WYo9MKxsV2x9y+osA1s26wS1Hc4xpogm
 OUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788975375; x=1789580175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EqyOJwWDc9siUyUIf9HLEiRZ/UBmYkZ2bG5NW9K2GYU=;
 b=YO7MS52ig5uNX2ypfOL7yBNjtDZ3A6lxDRqkTmF3YP2Q8nbPip/S+rToPSS8xPGkdB
 rNY/ZSbQ1+qONlEqr48G/6wLwz/O10SbZ4sIBKGeQxATncXnd3gFGhOneIFX2q7NjoE8
 4501KwsB71D/oIZMM4/1aUbh1SqQUaQA9ADDbZ3lMIakZWBpJKLaA4twBK1shsdH6YxQ
 XRrMCJeMyAj/+3laooKFQe9IsYZm2E9xpAdQoI7GB2imQNbyUc8A2OnOgqLaEj4lxkAh
 WqZUeIdvN8qrbXfAKkh8F1YlGBf+zgLvQkA5IKoisWnV6IIQtYIqLbR12da4bh7O/1c5
 WTCg==
X-Forwarded-Encrypted: i=1;
 AKwUvByWEHjwZDnT/ZKZB3HtioCsT4Z0ucXBVAs/wSk214X76V6VdY5SOvy0nfx3CG24XmgpzOKKOIKRng==@lists.freedesktop.org
X-Gm-Message-State: AFuF++nxEWRKmP99auvQprjJTMRoaKdMH289hH8dX47yMGEdQzV32059
 y1ZNDGp16zsuqpQRliiM3om3N3WNy3knya8tYMqxdj1qV0Hj7WNq3/Ee
X-Gm-Gg: AYBFou2VtMJZ7Nw0cPhgnFS+hYrnB/bfWQAlUo6D2P6jn1a/aYsKxMlHqkMKKTEdHvu
 mTT6NioX/xCGnfoIw58NXq9tXcbe4qyA2C4qj3a1hiMpMGpO7KKMEKAbgjM3pILwJthxDMtIvUE
 Q/PhfkmQUyCa44ZDbAXWj02FgJoXO91qZHdOHDe47tyXmmPwyur2I5dO4xpVzgCUgpo3xMYnRDL
 rB2qknEN4F7l1KivRakCkvdxIoTn/yszG9+iCFNCSofwAuModbwC6/nIW++RjceFFNgC5/9R+Oy
 PKb3d5tsWQ1rAS5sU6F1DlFjlINaYSwl26avFWKhhteQuk54sqJ/44JOHH9W1eIvadACLNLpFby
 USNCL81jSSJ8sOb2z9P5JU8bON4tL+yV7lxD7FPgzQ/54N5ctYwz+FBu66obTUPEVyd9GcywKHv
 mOAGIXW/MROMocPjXcWgVCDw7tRy7Q1i+Ags/JKt1CoqCVLnc1dR0/qKJ+mUWkb7KYzbJhRIi2G
 UFOOw1uGufSZuoz5OFRBLl6rG5IF9umbyRt8UXK2TY0m7mdaxV/Fb3NgkwhK+8FWn8C7T+Oq02x
 rg==
X-Received: by 2002:a05:600c:620f:b0:49c:eac2:ddad with SMTP id
 5b1f17b1804b1-49d2570acaemr24678895e9.1.1788975374390; 
 Wed, 09 Sep 2026 10:36:14 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME
 (20014C4E1B836900B0110705BF092680.dsl.pool.telekom.hu.
 [2001:4c4e:1b83:6900:b011:705:bf09:2680])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26c06f04sm6876575e9.13.2026.09.09.10.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 10:36:14 -0700 (PDT)
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
Subject: [PATCH v2 3/3] drm/rockchip: dw_dp: Attach "max bpc" connector
 property
Date: Wed,  9 Sep 2026 19:35:40 +0200
Message-ID: <20260909173542.14030-4-royalnet026@gmail.com>
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

The dw-dp bridge already filters candidate output formats on
conn_state->max_bpc in dw_dp_bridge_atomic_get_output_bus_fmts() and
validates the result against the link bandwidth, but the connector
never exposes the "max bpc" property, so userspace cannot limit the
bit depth. Attach the property with a range of 6 to 10, matching
dw_dp_output_formats[]: the smallest entry is 6 bpc RGB and the
deepest entries are 10 bpc.

drm_connector_attach_max_bpc_property() initializes
connector->state->max_requested_bpc and therefore requires the
connector to have a state. Rockchip binds its components before
drm_mode_config_reset() runs, so the freshly created bridge connector
does not have one yet - create the connector state before attaching
the property, exactly like drmm_connector_hdmi_init() does for HDMI
bridge connectors. The later drm_mode_config_reset() then re-creates
the connector state, and the preceding patch makes
drm_bridge_connector_create_state() restore max_requested_bpc from
connector->max_bpc, so clients that never set the property (fbcon in
particular) keep the full range instead of ending up with 0.

With the property attached, compositors such as KWin write "max bpc"
on every atomic modeset; any in-range value is handled by the existing
format filter and bandwidth checks.

Assisted-by: LLM checkpatch
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index b23efb153c9e6..8ff27353b1417 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -112,6 +112,32 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
 				     "Failed to init bridge connector\n");
 	}
 
+	/*
+	 * The components are bound before drm_mode_config_reset() runs, so
+	 * the connector has no state yet, but
+	 * drm_connector_attach_max_bpc_property() requires one. Create the
+	 * connector state first, like drmm_connector_hdmi_init() does.
+	 */
+	if (connector->funcs->atomic_create_state) {
+		struct drm_connector_state *state;
+
+		state = connector->funcs->atomic_create_state(connector);
+		if (IS_ERR(state)) {
+			dw_dp_unbind(dp->base);
+			return PTR_ERR(state);
+		}
+
+		connector->state = state;
+	} else if (connector->funcs->reset) {
+		connector->funcs->reset(connector);
+	}
+
+	ret = drm_connector_attach_max_bpc_property(connector, 6, 10);
+	if (ret) {
+		dw_dp_unbind(dp->base);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.43.0

