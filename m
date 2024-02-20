Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BB3C5475B
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 19:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E2110E521;
	Tue, 20 Feb 2024 19:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gYisH/T+";
	dkim-atps=neutral
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DBC10E531
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 19:17:35 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dcd9e34430cso5876642276.1
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 11:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708456654; x=1709061454; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=owfyNv1TJxXYhYzgoZWH50Nlji30FNL3ho0Wn/WI7Hs=;
 b=gYisH/T+fvYIjqK3qPT3HATMe0tWV0EDcIuvKUdYrTWuW3kNdWOCxZUbAF+OEIfZIs
 H0DsUi6ytE5OdKNH4AHK2MZ7+o3pWO4oB6pQOY4v/xaFZg+y1xxdSZz5cXUvjMjsVD0F
 X9HEcZlWMeroiVXQvBDyV2mtyD6jw4yuGPcAAfh5gAS2vne7KlFkxGZqlnjzVrllVrkj
 +fVy9yHdV5mzvhNDhAs+1U4QoFuxEoxZRMW8OaU/Pm/N82VU+i9C5QMR15dAVEYpVqLS
 0Vcvgz49Dgu+SnstqUcHua2vS1fr07S1tsrqVT5nfEahsWJ6M0Y6j6rd7CFwMJ6ZRfGH
 Zdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708456654; x=1709061454;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=owfyNv1TJxXYhYzgoZWH50Nlji30FNL3ho0Wn/WI7Hs=;
 b=XguPaG8/0QiQlbaNSSjmTs/hqPS9kBBe0imoV9qR3PAZHXI+uI3si9U+9DSyoxuG3E
 2q5OigDA2Rhd/mJKKwwBzwJoCri9fn18c1ntKGIhsXy4Ja1OGPE6n8DdFQaYtQDv+v/4
 49ewykS9yQxbpbx+lyv1ZsPfwWJeG8p4vK+cVIFL+pYJptjWM06muTc12lRX8On+Y/ul
 tSZJwRi9hgRegrOovCW5SK1BemzdaAx7hpwosYKI3Ms1HmVlten3TYhwxqx4nDvlNn5k
 cTzoxb0Xif+dN7x1j2eR6xCqUS4zMl3mnhPm6ipiHmZPIcS+stFnD7EdhO+LU7Jegrbe
 b8aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+ZJRhwAKYe0UqDWm9mDJDcy1ch5hXLlEtZ0P9SRoNZgBbhvKXP5fKhD2v5nWg+/C2t0qXZk+zn+PvGx7fP6FuUxZjXBME6k0BTVe54Js=
X-Gm-Message-State: AOJu0YzmII7tRXg/NZNbmarmw0KD35dOAKItx3iV4++mzv0lkkaaRGsX
 TmfNYFySnBi05VU8lMAWDXG/qywECwiNRpNB2BYhOouG0okdSAjtenuHEev6Fv79hvLJoepmOh8
 Yp5Vdc92WGY18AFurBwlboAgyXUYMBvQMIgagxQ==
X-Google-Smtp-Source: AGHT+IE8vOzreFrHGur0jS728Ji3ZC+G2E6ohtg7f5EWmauJPRGX3K7oIaJ+B/vZwTHbfV04pJ1H+RxFa/SFzYZAjQo=
X-Received: by 2002:a25:e0d5:0:b0:dcd:97da:926e with SMTP id
 x204-20020a25e0d5000000b00dcd97da926emr14466623ybg.13.1708456654138; Tue, 20
 Feb 2024 11:17:34 -0800 (PST)
MIME-Version: 1.0
References: <20240215190834.3222812-1-quic_abhinavk@quicinc.com>
 <CAA8EJppQquHgSgCrxKZHPHk248Pxg7Q8mvmmjbcpUxpreQkcuA@mail.gmail.com>
 <d3674c10-5c29-d917-44f5-758d90d9e679@quicinc.com>
 <CAA8EJpqaG+fBA_FO-L7Bimtjqqg3ZDQtyJL0oPFEueb-1WxjUw@mail.gmail.com>
 <b1f4856a-ee08-c1fc-2db0-e22773633bcb@quicinc.com>
In-Reply-To: <b1f4856a-ee08-c1fc-2db0-e22773633bcb@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 20 Feb 2024 21:17:22 +0200
Message-ID: <CAA8EJppY3tmv5FchykWG+d3vUBcAoaqZ3zjgYDr8kF5D4C9c1w@mail.gmail.com>
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

On Tue, 20 Feb 2024 at 21:09, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/20/2024 11:05 AM, Dmitry Baryshkov wrote:
> > On Tue, 20 Feb 2024 at 20:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2/20/2024 10:49 AM, Dmitry Baryshkov wrote:
> >>> On Thu, 15 Feb 2024 at 21:08, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>> intel_dp_vsc_sdp_pack() can be re-used by other DRM drivers as well.
> >>>> Lets move this to drm_dp_helper to achieve this.
> >>>>
> >>>> changes in v2:
> >>>>           - rebased on top of drm-tip
> >>>>
> >>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>
> >>> v1 had an explicit comment before the ack:
> >>>
> >>
> >> Yes, I remember the comment. I did not make any changes to v2 other than
> >> just rebasing it on drm-tip to get the ack from i915 folks.
> >>
> >>>>      From my side, with the promise of the size fixup.
> >>>
> >>> However I observe neither a second patch removing the size argument
> >>> nor it being dropped as a part of this patch.
> >>>
> >>
> >> Yes, now that in v2 we got the ack for this patch, I can spin a v3 with
> >> the addition of the next patch to remove the size OR as another series
> >> so as to not block the main series which needs this patch.
> >>
> >> I would prefer the latter.
> >
> > It doesn't work this way. The comment should have been fixed for v2.
> >
>
> Ack, I can post a v3 now by adding the removal in patch 2 of this series.

Yes, please.

-- 
With best wishes
Dmitry
