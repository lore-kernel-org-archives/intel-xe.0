Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEEAE77188
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jan 2025 18:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBD810E31B;
	Fri,  3 Jan 2025 18:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aUtoFyF4";
	dkim-atps=neutral
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4B310E31B
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jan 2025 18:13:19 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-30034ad2ca3so118230881fa.1
 for <intel-xe@lists.freedesktop.org>; Fri, 03 Jan 2025 10:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735927937; x=1736532737; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=a4NhGUz7I3CAC37MMfl5it+wA4D/a3jTss78eeeM00E=;
 b=aUtoFyF4atmXkh8afGH/mufGsyPMa2oFR+r94e4XuBDzl83U7/cj3CUdkciM90NO0x
 CXVfmpWF0OWkn9e75O+o5CXwLObMPwlIJHWKTJzDCIIYTmCI46hJrtpHAtarnXsxMLv9
 F6qubo0xmr0/CizKvNL0rgCV0cYSD5QpaEeQ6TFT8LFf8qyxG4J6sBZoU4OJqwSgv0hK
 VZ2LQwyANg18HtGNJRV67kK4OpcImv+xHpl1v8jpuSYEq+0C50fwgpYf8JxJH73hMRGd
 KSiaq1kNgCC3J71XIeWfg8HYa8cj5rq9+MijCGpaHAmv3W/9Hj1eCkY+mwH4jlExxbkd
 Ancw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735927937; x=1736532737;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a4NhGUz7I3CAC37MMfl5it+wA4D/a3jTss78eeeM00E=;
 b=agRTByPYLaTQERorSN6Da+UbuOmtG76YyhY573i//zkoGDyMcBI5OrTVLUxxdoXQSm
 DdIwAiGpX+TcWYkEbWU4UGlNzGN2C77tGbeKnueqNWZ0/JpJK44PCR57bJSYDl+s1ExG
 81yb/sAp9nip6GPLPKVkZUV1BOLl0myT6VMeaPrA1DKZtY14YRiH8IiBQ5ceFZbCukgc
 FoRO5WmbQ91Ma/9VTtFif06Rj1KunmmCfL398T4YKosLJVwhu+pIp1vBCHoU2DBYztqC
 RnCUHgYjCEvx1H5qTGz023ohuyNrPetkccfW8WmdYte6UNzf30bmUt2U9CEuNYTgPE3K
 d+fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4rKYUfzD+t8K7ZKSIUPG9ez3ZmAd8hAeDwNGr4jkkfeolGXgwFGezuvcqvCAbVohQcTCLxFpWCQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1O2xJGEHZG7UyPUvopKafiGQ7LLafV7xtjXUWZaaUmwrAqAJV
 tTtmkGgCwlBrIQNGKUOoa/ogGAIASUlacZ9aQtzuxpLbMD0dA1ZWNjdBlgmAfFk=
X-Gm-Gg: ASbGncu/PPhMBzR81m1V5jL+ZPUhU7wL52wmZxBJ3SFnfDe4vro28/d4wrsUbOlMrca
 8WHHOZehfDP4Ef39uji+zlC+b6Bj2PdhUgkPdq4+KN1WZJ1XMtWiF4AKILE5PyU3yiD0OWb613D
 drYcO3CnSK7C1cZbB6DeYzbfHInuBbecfSvX5zScy6ndrsb73WBALofvjUuuV96kz+t2m5ehlKA
 GlYaye+KVyVQgXXQQt7mx6WGML50m65nQEgTL5i94kyAuq8giLobFGIGgv+7t+sqALJl1ajhdj2
 9YZzMEb8n8Ks3uepu6MfbUsTwkuj50rvMHZG
X-Google-Smtp-Source: AGHT+IHkyk31lkzWD+THb2q0kv0bZe0UEvMvlsqPvrWF0mIfBuAWDJmkYgVUK9JyXm1uBZasD7+P3A==
X-Received: by 2002:a05:651c:502:b0:300:3a15:8f2d with SMTP id
 38308e7fff4ca-304685dff04mr196263781fa.34.1735927937405; 
 Fri, 03 Jan 2025 10:12:17 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b083ebbsm47714751fa.115.2025.01.03.10.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 10:12:16 -0800 (PST)
Date: Fri, 3 Jan 2025 20:12:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 4/4] drm/msm/dp: Add support for LTTPR handling
Message-ID: <qsmcpai2uqfhmy6y5wks55p4fyqigndfzqfnapvdjf35gu4wg3@5aowfh3xaydn>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-4-5c367f4b0763@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-4-5c367f4b0763@linaro.org>
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

On Fri, Jan 03, 2025 at 02:58:18PM +0200, Abel Vesa wrote:
> Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
> 1.4a specification. As the name suggests, these PHY repeaters are
> capable of adjusting their output for link training purposes.
> 
> According to the DisplayPort standard, LTTPRs have two operating
> modes:
>  - non-transparent - it replies to DPCD LTTPR field specific AUX
>    requests, while passes through all other AUX requests
>  - transparent - it passes through all AUX requests.
> 
> Switching between this two modes is done by the DPTX by issuing
> an AUX write to the DPCD PHY_REPEATER_MODE register.
> 
> The msm DP driver is currently lacking any handling of LTTPRs.
> This means that if at least one LTTPR is found between DPTX and DPRX,
> the link training would fail if that LTTPR was not already configured
> in transparent mode.
> 
> The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
> that before link training with the LTTPR is started, the DPTX may place
> the LTTPR in non-transparent mode by first switching to transparent mode
> and then to non-transparent mode. This operation seems to be needed only
> on first link training and doesn't need to be done again until device is
> unplugged.
> 
> It has been observed on a few X Elite-based platforms which have
> such LTTPRs in their board design that the DPTX needs to follow the
> procedure described above in order for the link training to be successful.
> 
> So add support for reading the LTTPR DPCD caps to figure out the number
> of such LTTPRs first. Then, for platforms (or Type-C dongles) that have
> at least one such an LTTPR, set its operation mode to transparent mode
> first and then to non-transparent, just like the mentioned section of
> the specification mandates.
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
