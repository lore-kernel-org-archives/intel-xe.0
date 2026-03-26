Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A312510A88E0
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 16:40:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5B310EB0C;
	Thu, 26 Mar 2026 16:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="CCRnA2hF";
	dkim-atps=neutral
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6157D10EB02
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 16:40:45 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-89a6ac6f389so13198066d6.3
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 09:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774543244; cv=none;
 d=google.com; s=arc-20240605;
 b=VusvVMg4mubjBMisLX1UQXKbfQoQSvFRbJDpBzxDVjA5xuFixHZRG6QffGORH9wYX8
 pmnDxeNVni5wgUJRG2B2fopxLHCOxSr7aJuMoFdX7yDM8jk1mdDgZQkPA5tYkKsA6FVj
 bYnfQQU2aauutZhN2Je4NjOnBU2PhF1lgS0tYB/cqEN6yTQWXd6FuHY6t6QGRw5UGUc1
 F7oySpXSg/jnBmmSrmWX43GcUxIUw0VxlzanMRT21epce4cnbpza9jmFFWzplMYhHTN8
 VVByY0zdrH3jR5xX9sEQrQEq6dfJsr9AAqwyfp+qFLE0D2cnwA9FEGxx0CpySLSZEJds
 v6mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=lMVh41/flJhHXUmskY74HI0cHDnV8XVUzcIyI3Tc5Ws=;
 fh=d50QpHUUg8W9HOHJy/Flu7RsRYytsQviEzmK92EzBCE=;
 b=cUxL9jsALCp3DQc2YXf7cBXTTKLWtDzTlvOkjj9pWPY65sqgKvZ4ff6VwbtB6BTX8y
 SVeDGJfIMVJzK1VXBmypueRRLH0b5qo7pHfkpwJ6oRJcH9n1XU6N9l0rVQCEMZvJrsGZ
 xtB93f9IXlUseV1cY8G4xTkBVcsHoRXuxXCx0JboTrTPQk/Jvlm963TgcZ2Y7oJb7KFu
 uvSvfZ9YC90eMLOgTRtgu9YCckyK0sB2mqocHSWMCYpOlTLPYKkI0PzLajwicf5hkS/w
 qQ8Ydl0K6TB7ONHn+q35aZ+oUhZ/TWRo2Ft76PvsqOJulov5ImakR6UOI6iGbdXqVNK3
 eJtQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1774543244; x=1775148044;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lMVh41/flJhHXUmskY74HI0cHDnV8XVUzcIyI3Tc5Ws=;
 b=CCRnA2hFRv8yoU+thC0FZQwtVam9IbfB8aV6s+OhgYJdS0vJd8AOFSWnEQwWzHMe9L
 aePWY1t4zBjB3WYdaBlCnj+PVARLWcFI7TWvh+B1EP1zeLVdxLgvo0LhzQLiLOeNrhZM
 dJD5LYifRu5evPeaQFgKLZJqu09YtC7PqoZTFsxBAc6PYs8CEsrceYOCqgze4z/eiImf
 0VeB0uNaK39cjl9V7+q4jRTc17s9jIUB2tABKoIfIXysGCumCPOWMyrh/OWujL+9BZBK
 qwo52qm/3B0Td1twsYG+1zYfqqNBHbtquKQY9NdLBe8GMJgB93XzV29gq+5KFOaDaM0C
 3Emg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774543244; x=1775148044;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lMVh41/flJhHXUmskY74HI0cHDnV8XVUzcIyI3Tc5Ws=;
 b=nP8pmPRTltQywUR+kKeI53PiRwxjq7jVoJRGI3fDoAaNRWyUy7Clt2//57sQgJ5jiy
 6qPJKiWDFM8vlo07Rv+VpBxrAIaY+icL8ALnyDigH3r3uRab4H20oZR10eIhKvASgMkx
 VNRQw0hqEvGw+HtakiyfwY0ANu+wLMNaslHV7kTWd+qPGTwN8rJdiWDEihJhaP4RyQi+
 Ne9gA30yjACAqowSPIlZj4lP7puAcBZgXtuggDnIkxfMAQF0QM774WgrDCgl9SN+p+CB
 L7JUaakmgDPEb/FCpUX/u5MVxO+0RxZ3HZqAiOk75YM0K+yoZ96XBm+ZP3Rl//qSysqj
 8zzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9IwKR4I8uqYUjUmFxHHaycwsxhzE87H8fFIriFHUttGyAPVd77SUfIcjX1zI54M/zuHVff/cICA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGfo83cYHDUhiayIWEKc62rnxE8vEOV87YtDvDyC0D5I/U0jKJ
 3rS/s0Js43BSxCYD4wfAZGllyA3fTUe0ueBL89l1MHxfouQmWzqLndWq7drcifNln140+Ll8CBP
 hmnqN5paVu5241FUpHIElabnQgqf5mFmovwpR10FP5A==
X-Gm-Gg: ATEYQzzIkf+TNdteLQ2etyZFXaet18gaDc+kxnKkxYo8h5kFeM6SOSpVZ3ds0n7kTm2
 7oJXDnxSTHGfInp9ztkSVxJPtfvo5QWVpL1Mo9dYvSSMkR6LWiXS0rWft7mDk2kSEncl9c6yLes
 zM4u5Zk+99yXWN6Y+D0fR6kCINDsJC536bQO/G0lHmkmhn1dKntYLtIowzSqDsjs1OgQO6fpc38
 GB3t8tyG4CB5JbdDf8KV8C3aSk2StkmohX8auCPe0M5W/BtFxXjyNfIHDSsDck04hB7Cf/wHBrc
 lRmqGfE=
X-Received: by 2002:a05:6214:d6f:b0:89c:866d:15c9 with SMTP id
 6a1803df08f44-89cc4b07bc2mr122325186d6.56.1774543244239; Thu, 26 Mar 2026
 09:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
 <20260325-neat-elegant-raven-ebc9ab@houat> <acPA60Ci3n_t__xF@intel.com>
 <3979783.tdWV9SEqCh@workhorse>
In-Reply-To: <3979783.tdWV9SEqCh@workhorse>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 26 Mar 2026 16:40:32 +0000
X-Gm-Features: AQROBzB2J1rLcK9oOY95uN7pO5Y8iJWro7kBrTyJSKQV06IZlwAC79afqJRLPi8
Message-ID: <CAPj87rMpu-ZL45_uNPcZe3gu8Eqn2ALp3r0zRgghvT08-6RGVg@mail.gmail.com>
Subject: Re: [PATCH v11 03/22] drm: Add new general DRM property "color format"
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>,
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
 Werner Sembach <wse@tuxedocomputers.com>, Andri Yngvason <andri@yngvason.is>, 
 Marius Vlad <marius.vlad@collabora.com>
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

Hi there,

On Thu, 26 Mar 2026 at 12:44, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> On Wednesday, 25 March 2026 12:03:07 Central European Standard Time Ville=
 Syrj=C3=A4l=C3=A4 wrote:
> > But I'm not really concerned about documenting struct members.
> > What I'm talking about is the *uapi* docs. Surely userspace
> > will want to know what the new property actually does so the
> > uapi needs to be documented properly. And down the line some
> > new driver might also implement the wrong behaviour if there
> > is no clear specification.
> >
> > So I'm thinking (or perhaps hoping) the rule might be something like:
> > - YCbCr limited range
> > - RGB full range if "Broadcast RGB" property is not present
> > - RGB full or limited range based on the "Broadcast RGB" property
> >   if it's present
> >
> > I think the "Broadcast RGB" property itself might also be lacking
> > proper uapi docs, so that may need to be remedied as well.
>
> Alright, so in v12 I'll do the following:
>
> - Add a line to all YCBCR connector formats that specifies they're
>   limited range as long as Broadcast RGB is limited. Whether it's limited
>   range when Broadcast RGB is full is purposefully left undefined.
>   In the future, we can expand this to state they're limited range by
>   default unless some other property is set. If we're not re-using
>   Broadcast RGB for that, this will work out fine, because users who
>   don't know about the eventual new property won't have this behaviour
>   changed. If we do re-use "Broadcast RGB" for that, then only users
>   relying on things we explicitly left undefined will get surprise
>   full range YCBCR.
> - Add a line to the RGB connector format that specifies its range
>   depends on the "Broadcast RGB" property
>
> This is a bit of a mess, because it's entirely reasonable that a
> future YCBCR range property would want to default to full range
> so that users get the most color out of their monitors. But with
> this description of the connector color formats, we can't do that.
>
> If there are alternate suggestions, I'm open for them. We can't
> really rename "Broadcast RGB" but if I had a time machine, that'd
> be my first choice.

'Broadcast RGB' isn't what you want even if it could handle YUV, since
it also sets up colour transforms to modify the data ... so we need a
separate, orthogonal, property which only affects the HDMI infoframe,
rather than applying any transforms.

Cheers,
Daniel
