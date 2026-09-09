Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5CEC88E40
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 14:24:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FCC10E00D;
	Thu, 10 Sep 2026 14:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W1vAYdNT";
	dkim-atps=neutral
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com
 [74.125.225.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA79910E227
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 19:41:41 +0000 (UTC)
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843971bdd0so689492f8f.1
 for <intel-xe@lists.freedesktop.org>; Wed, 09 Sep 2026 12:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788982900; x=1789587700; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BMV0mMGaUxuAC5co0uH2uhYqExWWNSi7vJ8S06jVFgM=;
 b=W1vAYdNT03QcmCM0abY/2+j1pBXDbIWA6QNYGRlKzJfUAowxews0Bquh0vcmZH52V3
 YnPhZv131AVNiXi9HES5P/jFlvHXeW6qhR7MqxfggWKN3iNflTPpfnvwQHZ6v+Z8k67w
 CXOfrcVUlSmublkVBYsTAuQjw8gs3cACKmUlEWfFDI0s+2ZSInYbgFyATnUJnFe1U/Cc
 2wufGZ6hBBhlOUByF0tVsZF/I3AfDr87nB7OmDKgRV8EywuxCw2Ql+Bpha+0QViSSBUD
 XoQByjh19CxDw9Tu7KsLV+QQ+iyBzQDE8BzBrnoGlGQb4Ha7ROHY2fxKXq2PJQ0RXwHZ
 vVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788982900; x=1789587700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BMV0mMGaUxuAC5co0uH2uhYqExWWNSi7vJ8S06jVFgM=;
 b=PP/ha8RG14Pv+NTCtigQP/rpyAv/vlsbzCeL1bcXiqs2QtjnjFsD1YHnIMaWh5EFRM
 +wKeqddeO+gXyjx/olkaM4BbZU+qHPeV6gToX4wzm1eO7BWe34N1zxZby8DzLWGjvUsL
 ZnDaeBM9x3KJDf8L5gx9h5PWBNjAE4HU/jvWruzH0mPnoDRVcVkGzIJPYDqraSmns1iK
 JoiYJ4NqaW29Vrf6ejU7+7FR2G8tstPY4hZqWDdB2mRpTaKYr31+ctfMZuj62czfdWx8
 Kr69eE2KNf6d9hLMNomuO4Se4Mj7J9fhgSvAIbLhnDruxLXQkhRRjzeIWQa403tH5MVi
 Q/yQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByR0GRbvS/5hw2xsEdrS2PELofjGs1sy+ruKYv/qaahTgpyZWrY+xm++zUQvZhdfHUvby7HHUNw2Q==@lists.freedesktop.org
X-Gm-Message-State: AFuF++nJbxUXMJHX2gNoZPz6o06OovL5DP7bBXyhzbxZSFSJUlug5uCO
 LJyQqc6ci/tjoVhpIgGtZRgSlhZ3fUfSiR/JMtl+lT8AGqvCLFy8B7Go
X-Gm-Gg: AYBFou2kdrqiur+Dlf2X4Q1j4u7iqkzjWjJAP5dipgxzopgrVTb7bFLsPLxXAq+qmMk
 UcUHmUvEGCu08P445Z20nTl6EXU4RyaEf6lELys+gs60lXGRAV6NoFIF9IX96h5qFs+tk1lhBrH
 DAWlvzagm1QfaBCpzsK0U/1q67+C0Tacc4q8UG/pP8IXmcNFVWYmiiXAG+IaXn/5TjHq/U58Usy
 MVfvl1AnbbEjJu7nQBmXI/QDnpn9nI19StCEWPTaNoELJgRmKVisTpNpgURCBrKm+0+CiCUAUiU
 XoQNzxMzvdVAdSpyoUcyzHQlF3qKf/vpPG0yVFc0lBXufMrp4GQe6e7qEdj1Qqy+RMTTa1H6ozN
 WOgrm6paY8kewhKy1hgcV6OEnswdVU+mYrOEOLIgGSIolb14GBJnrBDKcZkh9lDAe28dyiqAJm0
 wUwKkFerrZ2KwV3B9d7VZoMvI3lp5epRri1XOoiMWhwqhf4brHQU4ipIOmYpwRVc13uWWUvX8lJ
 ypyiMlclZtOTxhJdXJzDI7V+PrKhPltuhkQg05JXBhvSE4Ur9AwJIbzMvWaCl62Mc32PMS1feSf
 Yckb
X-Received: by 2002:a05:600c:474a:b0:49c:ff81:e062 with SMTP id
 5b1f17b1804b1-49d276628c8mr3990025e9.2.1788982899647; 
 Wed, 09 Sep 2026 12:41:39 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME
 (20014C4E1B836900C06E5685D4591C35.dsl.pool.telekom.hu.
 [2001:4c4e:1b83:6900:c06e:5685:d459:1c35])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d20fce7a7sm167161505e9.4.2026.09.09.12.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 12:41:38 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Igor Paunovic <royalnet026@gmail.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v2 3/3] drm/rockchip: dw_dp: Attach "max bpc" connector
 property
Date: Wed,  9 Sep 2026 21:40:35 +0200
Message-ID: <20260909194036.8889-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909173542.14030-4-royalnet026@gmail.com>
References: <20260909173542.14030-4-royalnet026@gmail.com>
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

The bot is right, and it is worse than it reported. I went and read the
code rather than taking either its word or my own.

drm_bridge_connector_init() has two paths. With an HDMI bridge in the
chain it calls drmm_connector_hdmi_init() (drm_bridge_connector.c:1016);
otherwise drmm_connector_init() (:1027). And drmm_connector_hdmi_init()
already contains, at drm_connector.c:621-631, the exact block this patch
adds - same shape, same comment, because that is where I took it from -
and then calls drm_connector_attach_max_bpc_property() itself at :633.

So on a chain with an HDMI bridge my patch does two wrong things, not
one:

 - it overwrites a connector->state that has just been allocated, which
   is the leak the bot found;

 - it calls drm_connector_attach_max_bpc_property() a second time. That
   one is not a leak: the helper reuses connector->max_bpc_property when
   it already exists, so my 6..10 range is silently discarded and the
   8..max_bpc property created by the HDMI path stays. It does re-attach
   the same property to the object and overwrite state->max_bpc.

On the boards I care about there is no HDMI bridge behind dw-dp, so
neither fires today - but "does not fire on my board" is not a reason to
leave it.

For v3 both blocks get guarded on what is already there:

	if (!connector->state) {
		... create the state ...
	}

	if (!connector->max_bpc_property) {
		ret = drm_connector_attach_max_bpc_property(connector, 6, 10);
		...
	}

That leaves a question I would rather ask than paper over. The state
creation exists only in drmm_connector_hdmi_init(), while
drm_bridge_connector_init() leaves the plain path without a state - so
any bridge driver that wants a connector property at bind time has to
copy that block, as I did. Would it be better to move it into
drm_bridge_connector_init() so both paths get a state, and have drivers
just attach their properties? I am happy to write that instead, but it
touches shared code and I would rather be told than guess.

On the pre-existing [High]: the bot is right that the error path I add
inherits it. dw_dp_bind() takes devm resources on the component device,
including a non-shared devm_request_threaded_irq(), so a failed bind
leaves them held and the retry gets -EBUSY. My dw_dp_unbind() call does
not release devres. With the guards above the new path becomes hard to
reach, but it does not stop being wrong, and I did not introduce it.
I can send a separate patch moving those to the master device if the
maintainers want it - it is a different change from this one.

Igor
