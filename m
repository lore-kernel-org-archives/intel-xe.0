Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC99C48BC3
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 19:06:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F227510E515;
	Tue, 20 Feb 2024 19:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y62WqU0I";
	dkim-atps=neutral
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22C110E514
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 19:06:08 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-607d9c4fa90so59460657b3.2
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 11:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708455968; x=1709060768; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FqbWBojOxNxmodBmyheWK78bpyU1XZWA8MIuZ3ABrLU=;
 b=Y62WqU0I7khakIH1inSUn81IdOm7fjBvVh5xUt27FB5SEUdeCxyHx9krgODallIcHe
 aoF7zF4wDNj93mMyH9pYWgkH8DmLxC9PgpVnupOFYzX+xfIfkQY2Em41aJOaVimExhKC
 hUR+r8JVy9LSkN143Y9HcISfVh9mUy7az9XOTP0AOkQQsObw90JAJVGNsg/HAUG8v3DN
 TvoZLVscaj5qTXPN7KCFWuIwrOYSrC840FFglHSdP8GFiYVi+qLB7jRxm9TCDnPYiyc1
 KyZyWaaFDNj5uUFLVwKkxuyHaPAQxj2Hp5/zzF8+tIs11wew6Gwv8toLf+fRwnRVYGRw
 O5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708455968; x=1709060768;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FqbWBojOxNxmodBmyheWK78bpyU1XZWA8MIuZ3ABrLU=;
 b=SjI2+FjOAz286lqRhnORs2hOBU/RCcbf9QlrKQziluALfD5N8DXlN/QW/W7wHDbgBT
 2JwM018fMcbkutxXCwwDHCjo/FPOd1HItoDxEzTqyuDw48L76LfbC3F0o66I6jzFa7Wi
 Z0btie9zyEFbO7EzBCy/6nH6vkRc6N3G+MEnwNQmSsgxaqjiMzklRknGB9NiTk3LuqHF
 cqgBPPWdoM+VKoA5Ah3Ii/qbLaH8B5HMcpIODJ18DimnMBsdqS+HZSgOo6xx8yRcwVXj
 0ctuI8aQvNNlsj7QGHBVGPJsWwY4Y0lSct95A8vjQRW0MiaCGPlF6lbccwsyZ5eqbvcq
 Yv2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1ZbGDksbBJm2VcsVqUt50elGI2fuKKPI/388ZwPnamJmuFBV2UlyN7EZS2LPDi5WLxEm/CZT6tn+1zjKQXbif1/xxv/5fz4pO8rhlSo4=
X-Gm-Message-State: AOJu0YxP36li9D5CbhQMLs3t7Ga2ySX4Cgar4qPBtoxAK73pN3Gu9qSa
 WtpRjpRoB9o11Zswfh6UrLHIYff9MvXb2yYPNk8PbIgsfsVvrkQzC6YBVnjAJy/75A2HW50lNZK
 ApxeuaCceWSLk6OchO4OxlB3huIaaXm4QKehD6g==
X-Google-Smtp-Source: AGHT+IGCO1F9zun/vDWXopm6gAPN6SOyj4ssXPYwfBGVfMSRD3cjVgDDI2QGkBvOlcrbG3wB8s9mVzvLx/l2sr/cQqM=
X-Received: by 2002:a81:7184:0:b0:604:230a:a823 with SMTP id
 m126-20020a817184000000b00604230aa823mr15975734ywc.50.1708455967733; Tue, 20
 Feb 2024 11:06:07 -0800 (PST)
MIME-Version: 1.0
References: <20240215190834.3222812-1-quic_abhinavk@quicinc.com>
 <CAA8EJppQquHgSgCrxKZHPHk248Pxg7Q8mvmmjbcpUxpreQkcuA@mail.gmail.com>
 <d3674c10-5c29-d917-44f5-758d90d9e679@quicinc.com>
In-Reply-To: <d3674c10-5c29-d917-44f5-758d90d9e679@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 20 Feb 2024 21:05:56 +0200
Message-ID: <CAA8EJpqaG+fBA_FO-L7Bimtjqqg3ZDQtyJL0oPFEueb-1WxjUw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/dp: move intel_dp_vsc_sdp_pack() to generic helper
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, robdclark@gmail.com, 
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 ville.syrjala@linux.intel.com, quic_jesszhan@quicinc.com, 
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 20 Feb 2024 at 20:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/20/2024 10:49 AM, Dmitry Baryshkov wrote:
> > On Thu, 15 Feb 2024 at 21:08, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> intel_dp_vsc_sdp_pack() can be re-used by other DRM drivers as well.
> >> Lets move this to drm_dp_helper to achieve this.
> >>
> >> changes in v2:
> >>          - rebased on top of drm-tip
> >>
> >> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > v1 had an explicit comment before the ack:
> >
>
> Yes, I remember the comment. I did not make any changes to v2 other than
> just rebasing it on drm-tip to get the ack from i915 folks.
>
> >>     From my side, with the promise of the size fixup.
> >
> > However I observe neither a second patch removing the size argument
> > nor it being dropped as a part of this patch.
> >
>
> Yes, now that in v2 we got the ack for this patch, I can spin a v3 with
> the addition of the next patch to remove the size OR as another series
> so as to not block the main series which needs this patch.
>
> I would prefer the latter.

It doesn't work this way. The comment should have been fixed for v2.



-- 
With best wishes
Dmitry
