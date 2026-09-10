Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F40C88E47
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 14:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81E510E467;
	Thu, 10 Sep 2026 14:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="pZcE0QJ/";
	dkim-atps=neutral
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com
 [74.125.225.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D0E10F341
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 07:52:03 +0000 (UTC)
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b93204449so3706065e9.3
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 00:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789026721; x=1789631521; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hSvkvCa4QalyG2BNxJcMEEX0DpoCO16400N3JfxMgjQ=;
 b=pZcE0QJ/Bfd32reE+IVYJ0CkME3JCB/JSb8N6SS0ZNMqsC8/WJQSMFFzj0GOCWex/J
 Bsdge9YyICVEdtfj3xmR3OetQxHpbcglg4nWUfC9ksHr9wfs0ED0GHbCpLIKTFvIaA94
 MitcYxDS3ZG67tuz+MHPpefjLSXv/JgOKdpXeaElMJLLWhK7pHnGD0UYA5JmLb78GbbM
 1YT9v4aRu98zPYEBp9Ucf/a+AUdYkPN9sYyqkdhEOSJ8mg/pkNAvfuboawIKnhbZ+tj9
 rzMmZfobTWBv2DblpghFW/yU+4ceQCu5a2VZ9GPj4nQPc1ygDkg2kV1TlXPkrHcEgbXP
 LyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789026721; x=1789631521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hSvkvCa4QalyG2BNxJcMEEX0DpoCO16400N3JfxMgjQ=;
 b=hO+gmN9MbgX/ur05tvEhAXZr2H1yN/9DDOGSuM6Kns7//uKCKMF3BvdCl2WRbBVjts
 Gvd4njrAk4Y9gwWkPb+cfm3+srqtJbc9fjOkPmb3JDB8Uu69PalkQErEDtDoDXSdcksg
 xozjxez6R5XAaevsG+VkcIkZbvwzoAp9u8H/WuHITqu7lbV/b6swtc8d6ROAFjlT1OvJ
 sLLiBeYiRFHiChvBZawO2Tdv3n5PcG3+IQREK9ONiY518/Xz7Uv8KZeSqsLTB3ARQDXd
 iYJ5UYD+BJPlq5cjxJNV+lnE96jM6DKHo71dLmAhjDwhmRkNrGeCmKormsIFjUfXwsyv
 2xIQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx70Uhh70Ckbwhph6VRr3nnV5hX8kMwqKXaKXLWMp7jCcpsy/uJKflKiMMEN8nmN5F9OdScBbvmdg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++mup5C41KJW/FQaqGmNYRFDyExpZI+JvIwxQ43gqkchKY3xpTgs
 nsxFA6fshNSchoqZaV02c7VIwpks0qGY6yOY5kwiSV7/br9ZUb5UC3I5
X-Gm-Gg: AYBFou2GlfG0guxxdYZAD/P3+edev5LXNxuYHAA1iwT0Dc1dsMqUmsmi5g6fUebeGOB
 5jwsRnKlO/0CMWFyhnmhM6eamd97H1m3YnQETI2CM2dg+IROfEZxaa6YSzbMX0zU0hT3rbXNwla
 8HEs/e1LfPExaD0cZv4BWJH4OuPeWfCT6UZSlujjD+3epbOljBBvhYRkIT4Oy4roXy3iDI8uMMS
 C+Jc8X2mzqArbnP0vn7jYHxaUMFpMHPuCWIR5C1T/gpGu2deGafyEEQimgeScsOBMrZqs07YASd
 lsCD9ADacgoZMNHRoet+LWbvr8Pqc4nVHdSIYN7t2YG3ntnfBE2yF19RQMul60BpXNsfvl7ccKD
 Mr+ZqwhsBwFB9A86ZOf+JvJFRCoZpY6Py8TcEipl/kJcgfQqysFgU6Pp5jHhQFzpCEfToKRLm4r
 kWEl6x2sB7qLzFM9BTLtfZ7LbmgDsnOqm+C5k4KJfZ6lFSMEFJ88kJgI2nFU3NEQYbNN25d2O2+
 eZ1KRLuCmSZyXMD0QCeQQHbgk3DJP33E23boDknJk0pbRNJzb6z8auyXO7r3gwx9zx8hMswBBVX
 hi6H
X-Received: by 2002:a05:600c:530d:b0:49c:e363:c66e with SMTP id
 5b1f17b1804b1-49d01dce86fmr291744635e9.1.1789026720937; 
 Thu, 10 Sep 2026 00:52:00 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME
 (20014C4E1B9146001C92980EE71198AB.dsl.pool.telekom.hu.
 [2001:4c4e:1b91:4600:1c92:980e:e711:98ab])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d20fce7a7sm251593715e9.4.2026.09.10.00.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2026 00:52:00 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH v2 3/3] drm/rockchip: dw_dp: Attach "max bpc" connector
 property
Date: Thu, 10 Sep 2026 09:51:40 +0200
Message-ID: <20260910075141.48803-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <9e77b5c5-f1d9-484b-ae02-846fae1b3642@rock-chips.com>
References: <9e77b5c5-f1d9-484b-ae02-846fae1b3642@rock-chips.com>
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

Hi Chaoyi,

On 9/10/26 09:16, Chaoyi Chen wrote:
> I don't think this is the correct way to go.
>
> I believe max_bpc should be handled in drm_bridge_connector_init().
> Take a look at its implementation. HDMI already does max_bpc there,
> so DP should probably do something similar.

Agreed - that is the question I left open in my reply to the bot. v3
moves it into drm_bridge_connector_init() and drops this glue patch.

Three points I would rather ask than guess, since it is shared code:

1. How the bridge advertises it. drm_bridge.max_bpc is documented as
   "only relevant if DRM_BRIDGE_OP_HDMI is set" and the helper only
   reads it inside the OP_HDMI block. I intend to honour it on the
   non-HDMI path too, relax that doc sentence, and have dw-dp set
   bridge->max_bpc = 10. If you prefer to keep the field HDMI-only,
   a separate field is easy - I just did not want to add one unasked.

2. The range. HDMI attaches 8..max_bpc. dw-dp's format table goes down
   to 6 bpc RGB and i915 attaches 6..N on its DP connectors, so I intend
   6..max_bpc when connector_type is DisplayPort, 8..max_bpc otherwise -
   the same gate Dmitry used for the DP subconnector property in his
   msm series [1]. Nothing is attached unless a bridge declared
   max_bpc, so existing non-HDMI bridge connectors are unchanged.

3. Where the default lives. 2/3 restores max_requested_bpc from
   connector->max_bpc after drm_mode_config_reset(), but Cristian's
   v11 71/74 removes that field [2] (HDMI keeps it in hdmi.funcs). I
   intend to keep the value in struct drm_bridge_connector and restore
   it from there in drm_bridge_connector_create_state(), which folds
   2/3 into the same patch. 1/3 is unaffected.

The state still has to exist before the property is attached, so the
non-HDMI path gets the same create-state block drmm_connector_hdmi_init()
has. If you would rather see that block factored into a helper for both
callers, say so and I will do that instead.

[1] https://lore.kernel.org/all/20260722-drm-msm-display-interface-v1-24-368c10fe62fd@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260901-dw-hdmi-qp-scramb-v11-71-bc12954a0688@collabora.com/

Thanks,
Igor
