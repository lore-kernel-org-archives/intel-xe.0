Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58FDEA4E3B
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 16:21:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B81B10E540;
	Mon,  2 Mar 2026 16:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=yngvason.is header.i=@yngvason.is header.b="XTK0VG55";
	dkim-atps=neutral
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com
 [74.125.224.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E3810E522
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 15:07:50 +0000 (UTC)
Received: by mail-yx1-f53.google.com with SMTP id
 956f58d0204a3-64aea64bf15so3888268d50.2
 for <intel-xe@lists.freedesktop.org>; Mon, 02 Mar 2026 07:07:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772464070; cv=none;
 d=google.com; s=arc-20240605;
 b=WUkmHM53RlrPKbgKZAIiFvByhtr5eq3xzTbAT8SHVX3ICYkP5KRuYHM6BiZEUacIQL
 0OSTch8aEH8yngg2i/1KaTf9bqVZ2LOZ6jywU+4tlFMfs8Y2RgpPLk9N+807M8Yke1Tb
 KpZnUzcRsW4Xx/bpz4MNFWhcFveXl9SHjl8wDy/l7wcJsVqE/7MCF2GJWLBY3Qf8/V0a
 BStzX9qMl9q+fx3WgHQlZ3mUhWn6LBrfq05w6hr2T5TIu4hqzuJ8sh9YP6MTsIKegKBx
 Ip0rNrDueQwhhCtDY9JiIAWZ6ZgtwEt87s5Ha9QoQGI4j9jyDA9J4W1/UUB/e3XB2jQj
 U6zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=+gDTORrI2pQyWVeOn4meK1oMBrguCe1b/ScMwN2EmY8=;
 fh=R5B+mxv0FaRRztNVxKAjVUiys298jwxzL+LDI162whY=;
 b=QFj+eocviw8QPi4L5Jps8MUg05MXmcfPkgAH4guhmwccm7AMJNJZSD2jTJpwlQ2gKg
 y0ljpNF1M2Bb/8ZsnsQLCqV+MOshUvd43sPAeE+RTEttvZM07k2qEJ02gZ9+4kpMLA6V
 WKbXDJjsDl8ijtfz+24hrBQ0Iq2ksI3xVkkMCkjANxC6KQpATYm87pAQv6X9RMjrAoSv
 VO+rT55pUkBg8CJ28o1Y5uVxFm/P2FBIJhK/o2ajIuDQK6tYK570CBEHE/uPpwOYOUX5
 7w/w8q67CDd8cKHXgm/K0kauySFpjIJj5vc6PUHhtsL58mOoNEikWmKP16+zn/h6ou3q
 jI+Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yngvason.is; s=google; t=1772464070; x=1773068870; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+gDTORrI2pQyWVeOn4meK1oMBrguCe1b/ScMwN2EmY8=;
 b=XTK0VG55hePAbMb19t8yRWiq0ocGIb6Q0hk42Co9/9oi++86Oelhu532rQObN6hH+a
 deT+Bgi2MDiDubVofKCtSe9Tbbm5cHrzXGqPke44mMqiFFD40kp7hiNFE7dg9c3VHrgF
 2SYctykfde//3kG9NAYjUK1c8X5qikuArzis8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772464070; x=1773068870;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+gDTORrI2pQyWVeOn4meK1oMBrguCe1b/ScMwN2EmY8=;
 b=oa6QEk7ZfG487wAPV1J/07625hNj4TskjfvEb+XjgTiHT7Bxfw8l4O7KEoEgmDPhDd
 rqDYQnv72CpV/QSy8OuzSLr1Ew1OGg024q/+a5Fmesl2p8ZYhdv9licC/tzKeB/AtZ/e
 6rw0ADkHLirJrC9790Wisajma1OHMtlYjoClKcnJ2djCdhimxDLNxdvDpbsYM1dxpInW
 qY8XmDqd1O+JIjCC+1BHwn8UcK381fI+oz6+g5fOMIU9ezkws9Bx6OnsQeIgH7X6Th3p
 enyQlJpKxFvWrAJ81hILDDTYVpHrlr7D7HTiGRnC7AJ1drNXNJZUopn4K9wgO3W7DNoJ
 Ui4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo4iY0kRLuD1TbXqrf1FSa7Tv8lskGqFeajy4NFPoSeB/+fmP4Fql0QNvsqILDPl/1bggyZhTIuw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaJjJnz1a9cjw+GmdW8njTggBQ17QeU8Xjypk6OuWX6rbwB+0d
 5RUaVor/Yc43L7ajkFQ/1MA5Uy8vbWqbHJoj/MCC/f0mBi+ABQO8TSwEPevVTUSJnwMXYihhEsq
 Fr2f+03rhiEdp207j33+EGtfaA5N8b/RvuXE+swgsVg==
X-Gm-Gg: ATEYQzz+sSvUjw2eSNHxh5kY2Js+FBZn6cxaWLPHQTJYgAWlKmDUJlBlk/f0kOnIIXi
 8F40ymtQAimK5MIEU4WzW3tJDPwulmxeH/gOQBQIXdfErTTpmqJHAMknNuGtfHCiy1FBphgW3Fe
 fQx/QteO4s28lj86wSmRfvZJ6uCVjPlVyr8Va2GrztzL6cSo0DSBSvtyyYEI4H12VUmQwy8LwqO
 Ys9MoLpWq/iFSdXuIIwiWGP6sm0PfkADrkaWxFtzbJMBsbW6Gnr1HoLb9Wx1Zbjbrpl5Lrp0X2S
 RpvT8C5xt0uB1zRZ2+ofkOoLXp0kDr48hUGb1U8=
X-Received: by 2002:a53:ab0a:0:b0:64c:c1b6:714c with SMTP id
 956f58d0204a3-64cc2379297mr8671268d50.70.1772464069335; Mon, 02 Mar 2026
 07:07:49 -0800 (PST)
MIME-Version: 1.0
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-2-658c3b9db7ef@collabora.com>
 <y5ybjitphwydvtcjdtrmpcx7t7hwevjszpktcnmyvjqkgzinmu@hoitkl7lghxh>
 <5081457.31r3eYUQgx@workhorse>
In-Reply-To: <5081457.31r3eYUQgx@workhorse>
From: Andri Yngvason <andri@yngvason.is>
Date: Mon, 2 Mar 2026 15:07:12 +0000
X-Gm-Features: AaiRm531VbuvPlDMvL8ehAEpeh4QP_0yXJbIL2OEHZWnP0es8QNn2W0TYwz5fEU
Message-ID: <CAFNQBQymuv0roy_xupcgU1bHygfBeE3S1FepQYxpobLq8O0yEA@mail.gmail.com>
Subject: Re: [PATCH v9 02/19] drm: Add new general DRM property "color format"
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 kernel@collabora.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 Werner Sembach <wse@tuxedocomputers.com>,
 Marius Vlad <marius.vlad@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 02 Mar 2026 16:21:36 +0000
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

Hi Nicolas,

Thanks for carrying this forward.

m=C3=A1n., 2. mar. 2026 kl. 12:36 skrifa=C3=B0i Nicolas Frattaroli
<nicolas.frattaroli@collabora.com>:
>
> On Sunday, 1 March 2026 17:47:48 Central European Standard Time Dmitry Ba=
ryshkov wrote:
> > On Fri, Feb 27, 2026 at 08:20:07PM +0100, Nicolas Frattaroli wrote:
> > > From: Andri Yngvason <andri@yngvason.is>

N.b. this patch was originally from Werner Sembach, but it has grown
considerably since either of us touched it, so I think that
Co-developed-by tags would be more appropriate here.

Best regards,
Andri
