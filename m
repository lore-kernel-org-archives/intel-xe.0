Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962EEC88E40
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 14:24:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5028210F49C;
	Thu, 10 Sep 2026 14:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="pYgHYVYY";
	dkim-atps=neutral
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com
 [74.125.225.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392F910E557
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 17:36:10 +0000 (UTC)
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-499db17b40eso2293695e9.2
 for <intel-xe@lists.freedesktop.org>; Wed, 09 Sep 2026 10:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788975368; x=1789580168; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=K5xZwe6BB14FgiUoJeEDcecfAKoT6SnPT8CWcokGDbQ=;
 b=pYgHYVYY2dfe/B1aGHFWYO3Lih0hLkN4BYmv1xPWKQvKAv3cujppK9ztTQEOttMDD4
 Ivoau9NRtrydbOdJ5/OqgTCGeQo1WR7V6jLNCfdH8N3TNGEMC3RZWxLx8IdO8xiuLT0W
 wBVA59uO/dYIVmoqLRdu92JoQfK3YomWS4uJcqX7ZQb5d2BXV1i/JH5dmwNkDT7WaTet
 6tVQvO/6EwoTEp+ifxxIVLKhVDvZkPkm1EUCtrBS5TkP/VEWwdwrzs1gBEgBFTr7qb0r
 t0AnRU3cMTxRFQ0WYs9zEUZw+ZQF0tI4SInF2ikec5qbpLUBkreljBPy45TU7Jq0X5Np
 YKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788975368; x=1789580168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=K5xZwe6BB14FgiUoJeEDcecfAKoT6SnPT8CWcokGDbQ=;
 b=E7JZPkSn8XVgSeibl35iycoBPco4aDqzJWyBjc+1tovOdE2vaNDe22E/vIufJHeuCw
 OoPzDPkj3oJlgQauuyxvTaezhvW0HtJ952cblFQNaFPCiFedOUSPXZcepmd1VcS5mzQM
 QTdqjlwGqb/hT8DesxhSQP92eJD9F3QnuelGbx2+9f2gjr8zDcCtF1yG635mGBl0ERQ9
 K5bZ1SwDevQ4F45jbxGPKvkPWthwdaKaHsMr45RowsjOOXaahUPxKxTBg17nYHIsZyYQ
 PXyA3p2WmHIwPEb1OSeDFOYsvh6caiLhpaAw9tYKIXHVr9shBNWX0xTBUSyeqt1A2Bm/
 gFoA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxTWccmRhOUIn1oOelJ7dXOm5N+1W8Mi0bqnxYc0yWVS5Cj9G03dBoEuDoblS85Unsj5oWh5fyVew==@lists.freedesktop.org
X-Gm-Message-State: AFuF++lziF2U22BZ5VlJz3gzETLED7zsbVIlnIo3+gquW+HStNId3d5+
 1mZ+Sb4b3u6JGm3ExFQnjk2PVFSmRgMOu1cKJvMVuQ3cwVIqeCsKKBT5
X-Gm-Gg: AYBFou2V8Xk9uUm1WYB8IhIpdt+kjiGMHSJsg8UFiVUgGaUhdVWx84gywVk3WRaihEb
 tTX/3UqML/eAzW8pbghHsQOel5NqqFeCzal56DotC9oZWkUU2ElpjY01msFae0UTylnGCACq31u
 YLZSStGHjCaoh7NEt2zO92fcVbfMzJGo8KriXEs4p5LSGKl4cxaBGku06SUChawrk9tQYRNcJsG
 F43fSWjSxe0Ui/QPxEo5z8jVfFAxpHYE1uP57Ebngq9qQtsTKzHA1YLTqJgkwGTnK4nxtnVU2ZB
 xns2VJGRMwaS6Lrpxnrh1kW1GwLebBD0rH7jEMHjTbHSx0Qw+rf047+FjpzQZ+Lzzac5Bl2AYfV
 xw9t4dOk3jWc0pST7l1JkPPZod9V/qSt42OumZXj4PN8GOGr8pmLJradHMrlOhD/Q03SgdA5YoQ
 nDtqrgMdBSc0kb2EivadZAIzWJhrvgSYbyXP3Ae3u5YxNbcx/M0TNacV20ACNx3ggPN0fzNflZc
 HuIQmW2PGvHb5waXfpcKuqdLia+LUHDi53r3F/PTKYuvcnvfx/A3EBrObe9KTz2lwV4qVbb43Om
 0w==
X-Received: by 2002:a05:600c:8485:b0:499:5b0f:72b with SMTP id
 5b1f17b1804b1-49d01dcc32cmr256409415e9.1.1788975368210; 
 Wed, 09 Sep 2026 10:36:08 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME
 (20014C4E1B836900B0110705BF092680.dsl.pool.telekom.hu.
 [2001:4c4e:1b83:6900:b011:705:bf09:2680])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26c06f04sm6876575e9.13.2026.09.09.10.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 10:36:07 -0700 (PDT)
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
Subject: Re: [PATCH v2 0/3] drm/dp: shared HDR metadata SDP helper,
 and max bpc for dw-dp
Date: Wed,  9 Sep 2026 19:35:37 +0200
Message-ID: <20260909173542.14030-1-royalnet026@gmail.com>
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

The three patches of this series never reached the lists. The mistake
is mine: when sending, only the cover letter carried the recipients,
so the patches went to nobody but my own inbox. I noticed while
checking the archive after the fact.

Resent below as replies to this cover, byte-identical to what should
have arrived with it. Sorry for the noise.

Igor
