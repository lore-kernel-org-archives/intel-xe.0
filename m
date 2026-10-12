Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4E2CC6B19
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 17:49:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A36010F93C;
	Tue, 13 Oct 2026 17:49:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639A210F93C
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 17:48:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 36C361A1216
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 17:48:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E7EC76075C
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 17:48:57 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 8597711D71873; Tue, 13 Oct 2026 19:48:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1791913737; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=P/Q4nFBYsii5RLmePNAPJ+fdVFCY7TJHBVJr5R7oOUU=;
 b=lusD5toFih8JhPwJzHOEw2mRyk/6gy8es0jUP+GrtN+FAORE6L2p5SdFYr2E3ewUMWoWNJ
 R8SFPBP2qsMZtEwF/5H7Fm/3Sm1/0mEYOt/E1x1vv0+8J0j0SZP3bQnWbKP/QthcziJJio
 j3Qzaoai4fBc30YPySiZy7WZxpb99JSk10+aQqr+fzpYo0bF/XgbHIOCcZWkGWgT0rnOT1
 JcuateDgPLnqfKizuPvvDoj7qc9rmv/M0NjhCh6MEKODsLB78t2iVV6xvwlIsP0Zpck37q
 xz5uqq67d0G2DUtehBJ0irqSic9h0Fye7ZCfNk4OUSTb8kgaSXJXntDRxOzjyg==
Authentication-Results: mail.galae.net;
	none
Received: from mail.galae.net ([172.22.1.253]) by 9e7fea892943 with LMTP
 id MF/BGNH4zGp+jREAtaWaaQ (envelope-from <kory.maincent@bootlin.com>)
 for <kory.maincent@bootlin.com>; Mon, 12 Oct 2026 17:12:17 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AFF8411D70CD6; 
 Mon, 12 Oct 2026 17:12:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1791817935; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=P/Q4nFBYsii5RLmePNAPJ+fdVFCY7TJHBVJr5R7oOUU=;
 b=QEw4ceLzWeB8qinUu3mC0wNsLS4KwoVzdMeNR1LuDZOqpeG4PwWut/oihiBkHGQnbMZxhl
 OZp32Dlsdo/K2c61sEs2QPrVvPALXX8V2EcPeErhamuicCpfdVR20vOzkjxnlgKCaJU0Yr
 exCKtpfmW3UbWGlASwH576cy09yT7rUudgRtXAeGCZNYkyHiGgHQwOTi9/PvsrPO8E6Lls
 N2qpi/NxPYL9Cm/9PeF0JNTF7bdFq7AaEr90/6sAOncIfSe0wPcROPU/Prd7nCb56dQ7c9
 rdyz+0CVJcpxqT964ronT75nEzdCaq9aXxGrcGzf01uBswPl3tFKxLGSMOIsqA==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Mon, 12 Oct 2026 17:11:03 +0200
Subject: [PATCH RFC v3 8/8] drm/mediatek: Use dp_connector helpers to
 expose link training state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-feat_link_cap-v3-8-7517f4aba0f3@bootlin.com>
References: <20261012-feat_link_cap-v3-0-7517f4aba0f3@bootlin.com>
In-Reply-To: <20261012-feat_link_cap-v3-0-7517f4aba0f3@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Daniel Stone <daniels@collabora.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>, 
 Manasi Navare <navaremanasi@google.com>, 
 Drew Davenport <ddavenport@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.16.1-dev-17221
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 8597711D71873
X-Spamd-Result: default: False [2.32 / 30.00]; SUSPICIOUS_RECIPS(1.50)[];
 DATE_IN_PAST(1.00)[26]; BAYES_HAM(-0.18)[65.19%];
 RCVD_NO_TLS_LAST(0.10)[]; MIME_GOOD(-0.10)[text/plain];
 BCC(0.00)[]; TAGGED_RCPT(0.00)[];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FORWARDED(0.00)[kory.maincent@bootlin.com]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[35]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,linaro.org,ideasonboard.com,kwiboo.se,bootlin.com,pengutronix.de,collabora.com];
 MID_RHS_MATCH_FROM(0.00)[];
 PREVIOUSLY_DELIVERED(0.00)[kory.maincent@bootlin.com];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_DN_SOME(0.00)[];
 URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,bootlin.com:mid,bootlin.com:email];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 RECEIVED_HELO_LOCALHOST(0.00)[]; NEURAL_HAM(-0.00)[-1.000];
 FROM_EQ_ENVFROM(0.00)[]
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

Adopt the DRM core DisplayPort helpers by setting DRM_BRIDGE_OP_DP and
populating the bridge dp_link_caps at probe time. Report the sink
capabilities on hotplug, reset them on disconnect, and report the link
parameters once link training succeeds.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Not tested. I believed I had a board with this device, but it actually uses
an anx7625 bridge. I'm unable to test it; it would be appreciated if
someone else could, so the change isn't dropped.

Changes in v3:
- Sync and report sink capabilities from the HPD thread for DisplayPort,
  or in atomic_enable for eDP. Reset them on unplug, or atomic disable
  and only report link parameters after successful training.
- Add connection_mutex lock for DisplayPort in the IRQ thread.

Changes in v2:
- Remove voltage swing and pre emphasis properties.
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 79 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 75 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index f656b85b84212..2e2596eaa342e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1812,6 +1812,35 @@ static void mtk_dp_train_change_mode(struct mtk_dp *mtk_dp)
 	mtk_dp_reset_swing_pre_emphasis(mtk_dp);
 }
 
+static void _mtk_dp_report_link_train(struct mtk_dp *mtk_dp)
+{
+	u32 rate, nlanes;
+	bool dsc = false;
+
+	rate = drm_dp_bw_code_to_link_rate(mtk_dp->train_info.link_rate);
+	nlanes = mtk_dp->train_info.lane_count;
+
+	drm_dp_set_cur_link_params(mtk_dp->conn, rate, nlanes, dsc);
+}
+
+static void mtk_dp_report_link_train(struct mtk_dp *mtk_dp)
+{
+	struct drm_modeset_lock *lock;
+	int ret;
+
+	if (!mtk_dp->conn)
+		return;
+
+	lock = &mtk_dp->conn->dev->mode_config.connection_mutex;
+	ret = drm_modeset_lock_single_interruptible(lock);
+	if (ret)
+		return;
+
+	_mtk_dp_report_link_train(mtk_dp);
+
+	drm_modeset_unlock(lock);
+}
+
 static int mtk_dp_training(struct mtk_dp *mtk_dp)
 {
 	int ret;
@@ -2015,6 +2044,8 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 			ret = mtk_dp_training(mtk_dp);
 			if (ret)
 				drm_err(mtk_dp->drm_dev, "Training failed, %d\n", ret);
+			else
+				mtk_dp_report_link_train(mtk_dp);
 
 			mtk_dp->enabled = true;
 		}
@@ -2145,9 +2176,12 @@ mtk_dp_bdg_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 	enum drm_connector_status ret = connector_status_disconnected;
 	bool enabled = mtk_dp->enabled;
+	int err;
 
-	if (!mtk_dp->train_info.cable_plugged_in)
+	if (!mtk_dp->train_info.cable_plugged_in) {
+		drm_dp_sink_reset_caps(connector);
 		return ret;
+	}
 
 	if (!enabled)
 		mtk_dp_aux_panel_poweron(mtk_dp, true);
@@ -2160,9 +2194,18 @@ mtk_dp_bdg_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 	 * whether we connect to a sink device.
 	 */
 
-	if (drm_dp_read_sink_count(&mtk_dp->aux) > 0)
+	if (drm_dp_read_sink_count(&mtk_dp->aux) > 0) {
 		ret = connector_status_connected;
 
+		err = drm_dp_sink_sync_caps(connector, &mtk_dp->aux, NULL);
+		if (err)
+			drm_dbg_kms(mtk_dp->aux.drm_dev,
+				    "%s: error sink caps synchronisation (%d)\n",
+				    mtk_dp->aux.name, err);
+	} else {
+		drm_dp_sink_reset_caps(connector);
+	}
+
 	if (!enabled)
 		mtk_dp_aux_panel_poweron(mtk_dp, false);
 
@@ -2390,12 +2433,20 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	if (mtk_dp->data->bridge_type == DRM_MODE_CONNECTOR_eDP) {
 		mtk_dp_aux_panel_poweron(mtk_dp, true);
 
+		ret = drm_dp_sink_sync_caps(mtk_dp->conn, &mtk_dp->aux, NULL);
+		if (ret)
+			drm_dbg_kms(mtk_dp->aux.drm_dev,
+				    "%s: error sink caps synchronisation (%d)\n",
+				    mtk_dp->aux.name, ret);
+
 		/* Training */
 		ret = mtk_dp_training(mtk_dp);
 		if (ret) {
 			drm_err(mtk_dp->drm_dev, "Training failed, %d\n", ret);
 			goto power_off_aux;
 		}
+
+		_mtk_dp_report_link_train(mtk_dp);
 	}
 
 	ret = mtk_dp_video_config(mtk_dp);
@@ -2435,6 +2486,7 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 	if (mtk_dp->data->bridge_type == DRM_MODE_CONNECTOR_eDP) {
 		mtk_dp->enabled = false;
 		mtk_dp_aux_panel_poweron(mtk_dp, false);
+		drm_dp_sink_reset_caps(mtk_dp->conn);
 	}
 
 	mtk_dp_update_plugged_status(mtk_dp);
@@ -2740,11 +2792,14 @@ static int mtk_dp_edp_link_panel(struct drm_dp_aux *mtk_aux)
 	return 0;
 }
 
+static int mtk_dp_rates[] = {162000, 270000, 540000, 810000};
+
 static int mtk_dp_probe(struct platform_device *pdev)
 {
+	struct drm_connector_dp_link_caps *source_caps;
 	struct mtk_dp *mtk_dp;
 	struct device *dev = &pdev->dev;
-	int ret;
+	int ret, i, max_rate;
 
 	mtk_dp = devm_drm_bridge_alloc(dev, struct mtk_dp, bridge,
 				       &mtk_dp_bridge_funcs);
@@ -2758,6 +2813,20 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to parse dt\n");
 
+	source_caps = devm_kzalloc(dev, sizeof(*source_caps), GFP_KERNEL);
+	if (!source_caps)
+		return -ENOMEM;
+
+	source_caps->nlanes = mtk_dp->max_lanes;
+	source_caps->link_rates = mtk_dp_rates;
+
+	max_rate = drm_dp_bw_code_to_link_rate(mtk_dp->max_linkrate);
+	for (i = 0; i < ARRAY_SIZE(mtk_dp_rates); i++)
+		if (mtk_dp_rates[i] > max_rate)
+			break;
+
+	source_caps->nlink_rates = i;
+
 	/*
 	 * Request the interrupt and install service routine only if we are
 	 * on full DisplayPort.
@@ -2809,6 +2878,8 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	mtk_dp->bridge.of_node = dev->of_node;
 	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
+	mtk_dp->bridge.dp_link_caps = source_caps;
+	mtk_dp->bridge.ops = DRM_BRIDGE_OP_DP;
 
 	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP) {
 		/*
@@ -2849,7 +2920,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 			}
 		}
 	} else {
-		mtk_dp->bridge.ops = DRM_BRIDGE_OP_DETECT |
+		mtk_dp->bridge.ops |= DRM_BRIDGE_OP_DETECT |
 				     DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
 		ret = devm_drm_bridge_add(dev, &mtk_dp->bridge);
 		if (ret)

-- 
2.43.0

