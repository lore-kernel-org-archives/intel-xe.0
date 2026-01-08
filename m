Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C7AD185F6
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 13:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C20310E711;
	Thu,  8 Jan 2026 13:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EdCJyCAJ";
	dkim-atps=neutral
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F3510E6EE
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 11:11:30 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-64b58553449so4608708a12.1
 for <intel-xe@lists.freedesktop.org>; Thu, 08 Jan 2026 03:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767870689; x=1768475489; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1BkJysBnNZhs5NyTGbETBkSrANeMxDweJaKqNNZ1pKs=;
 b=EdCJyCAJXCUPE8w0Azf5xvitR4fIuflo85tnqv/BCnEwT2zg9TxaYoAvays+9yHWwQ
 kdDKH+gsoX59Gawg23zz8Xyror5j1o/HMfJf5ljBiTQ2ASvcEhn+z6VkkYcFRftjRZLa
 kNTcDdGE8GnCuiGmnNR0qBjunGJyiQov62BoT+qAAriSxUSwyNEGdAUe5C/2/2CDSujl
 rxZMo+WNPBkO3D7dHv02rP3VdPNPPlt0HzW2R0Q8BfpkOgoFrAzML9nI/R9WhN1Wx9lB
 /IXJ95LYi6jB1XJCJXKDrdpztNgbhhQgzoJN8fb2cSMWiVI4yDrHLh60RxAqNPQKutac
 Cf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767870689; x=1768475489;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1BkJysBnNZhs5NyTGbETBkSrANeMxDweJaKqNNZ1pKs=;
 b=VcWXl0s2BJ3EiRW7A9q2qGKN7/2bivo61oIuI0jWFx3FLxxjz3wMv7jiu0bpqT98PQ
 zkng4YuDuKV+PIzUXSL6mWaq0isFvHuWI9pUCkbap8RURBHvUVQAfkQZlocqre1UZjPe
 uU7hyspbgwivGmtDHCbSZXtf/Lxe4gn6tpwoE85pJtGDOLVXchYFypn2F8Z3MpDBEs7f
 llXbcTC/Xw9UplIEtu18LqW93qeB/DbN00faUCzgcswtYOg818ouaVhsRmG6zS3NfO/R
 D7HHEqfOJnedTwEfs2fN9eieFMG+QfeoCMyAObu1SE2mv395PT6xBK74S/rwVp3lRKDq
 UtGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkhS2dwVQsD+WCRiwbSOWBMFpxTErj57/EzRAG+uEXTxKnpZTMJlGfzS/hnMpzz7L1iXm66I6AeQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcaOBz3ezCJMk/loDEqCYhO/U8TVdpYCsVEb3GeK1eD/pD74jr
 vB0NUK1Q6nZvK4Ny9m9q5RV2JqtkeJ5aEoRUvaks3g3ZaM/N8JwiDXuiEVZEw4uaRswv9C0UnPQ
 CLLeRoyXhD433d3Z/WeLiQagBMp2ZooQ=
X-Gm-Gg: AY/fxX40cAInUD5OCrjaNiEFiI/riBTzuAMs0VRqSkEoE4y8tR9zXIzb98oNxBKpqCW
 hChludjPWkKD05cdgJkKR37TAT1r0NHki44OieJENcHLddqFMVmCFbqN1MEu0IPBT4E6a0aXDrs
 srH05PWZ5kvo6eB5gRiGfAKwq58YIGWCxFAXJY8q8N76K25XuNaSeIei1VHXJH81ohFQ6Ly7EPh
 J0hquQCTN/kChhhKTHEBTYsweeDmj/KQsq8CPskUTIvVM8hzBYWMy2Gy43mMK1+EvC4DY+tn1/r
 Y4mOiXxcBCipYdRuaSN1lierG7z/
X-Google-Smtp-Source: AGHT+IG4n9ByaeEZgm/hmqvGtffWXbfGj6FBDt+/MmPyym5l8YKUUzk1uCtz1udF/ON0TcdaDRZ8K0oWqVvFjpXNdaI=
X-Received: by 2002:a17:907:2d90:b0:b79:e4db:2e9 with SMTP id
 a640c23a62f3a-b844541de18mr553306566b.60.1767870688410; Thu, 08 Jan 2026
 03:11:28 -0800 (PST)
MIME-Version: 1.0
References: <CADN_a6OKUQ6fgu-JjNvwFb_MV8dxTDhppoq4DDnQ9p_t-JZ8yg@mail.gmail.com>
 <1afd1c1c255e96c95687175e9cc0c92041f8ccbc@intel.com>
In-Reply-To: <1afd1c1c255e96c95687175e9cc0c92041f8ccbc@intel.com>
From: =?UTF-8?B?SsOpcsO0bWUgVG9sbGV0?= <jerome.tollet@gmail.com>
Date: Thu, 8 Jan 2026 12:11:16 +0100
X-Gm-Features: AQt7F2rx2B0B8IzgQBg-SzIMfZ9CcRnceID_Qa_FEKZ9X5TDoYpAKDBcME-AW5M
Message-ID: <CADN_a6PDou4FOB43yt=9Q2vgc9x8-qTmObNn-OuVdDzFZ=Zxtw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915/hdmi: Poll for 200 msec for
 TMDS_Scrambler_Status
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: rodrigo.vivi@intel.com, ankit.k.nautiyal@intel.com, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 08 Jan 2026 13:08:00 +0000
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

 Hi Jani,

 Sorry about that - Gmail mangled the whitespace. I'm resending it
 properly using git send-email.

 Thanks for catching this!

 Jerome

Le jeu. 8 janv. 2026 =C3=A0 10:45, Jani Nikula
<jani.nikula@linux.intel.com> a =C3=A9crit :
>
> On Thu, 08 Jan 2026, J=C3=A9r=C3=B4me Tollet <jerome.tollet@gmail.com> wr=
ote:
> > Hello,
> > As per HDMI 2.0 specification, after scrambled video transmission begin=
s,
> >  the source must poll the TMDS_Scrambler_Status bit until it reads 1 or
> >  until a timeout of 200 ms.
> >
> >  Add a polling step after enabling the HDMI port to verify scrambling
> >  status, following the spec requirement.
> >
> >  Without the wait for the scrambling bit to set, some HDMI 2.0 monitors=
 fail
> >  to decode the signal at 4K@60Hz (594 MHz) when SCDC scrambling is not =
yet
> >  fully configured by the sink.
> >
> >  v2:
> >   - Instead of the fixed delay, poll for TMDS scramble status for 200 m=
sec
> >     as per the HDMI spec. (Ankit)
>
> The patch is whitespace broken.
>
> >
> >  Reported-by: Jerome Tollet <jerome.tollet@gmail.com>
> >  Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6868
> >  Link: https://lore.kernel.org/dri-devel/20251230091037.5603-1-jerome.t=
ollet@gmail.com/
> >  Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>
> >  Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >  ---
> >   drivers/gpu/drm/i915/display/intel_ddi.c  |  2 ++
> >   drivers/gpu/drm/i915/display/intel_hdmi.c | 25 ++++++++++++++++++++++=
+
> >   drivers/gpu/drm/i915/display/intel_hdmi.h |  2 ++
> >   3 files changed, 29 insertions(+)
> >
> >  diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> > b/drivers/gpu/drm/i915/display/intel_ddi.c
> >  index cb91d07cdaa6..c708b713f0e8 100644
> >  --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> >  +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> >  @@ -3506,6 +3506,8 @@ static void intel_ddi_enable_hdmi(struct
> > intel_atomic_state *state,
> >   }
> >
> >   intel_ddi_buf_enable(encoder, buf_ctl);
> >  +
> >  + intel_hdmi_poll_for_scrambling_enable(crtc_state, connector);
> >   }
> >
> >   static void intel_ddi_enable(struct intel_atomic_state *state,
> >  diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c
> > b/drivers/gpu/drm/i915/display/intel_hdmi.c
> >  index 055e68810d0d..958d939ae6ee 100644
> >  --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> >  +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> >  @@ -2694,6 +2694,31 @@ intel_hdmi_add_properties(struct intel_hdmi
> > *intel_hdmi, struct drm_connector *_
> >   drm_connector_attach_max_bpc_property(&connector->base, 8, 12);
> >   }
> >
> >  +/*
> >  + * As Per HDMI 2.0 spec: after scrambled video transmission begins,
> >  + * poll TMDS_Scrambler_Status until it reads 1, for up to 200 ms.
> >  + */
> >  +void
> >  +intel_hdmi_poll_for_scrambling_enable(const struct intel_crtc_state
> > *crtc_state,
> >  +       struct drm_connector *_connector)
> >  +{
> >  + struct intel_connector *connector =3D to_intel_connector(_connector)=
;
> >  + struct intel_display *display =3D to_intel_display(crtc_state);
> >  + bool scrambling_enabled =3D false;
> >  + int ret;
> >  +
> >  + if (!crtc_state->hdmi_scrambling)
> >  + return;
> >  +
> >  + /* Poll for a max of 200 msec as per HDMI spec */
> >  + ret =3D poll_timeout_us(scrambling_enabled =3D
> > drm_scdc_get_scrambling_status(&connector->base),
> >  +       scrambling_enabled, 1000, 200 * 1000, false);
> >  + if (ret)
> >  + drm_dbg_kms(display->drm,
> >  +     "[CONNECTOR:%d:%s] Timed out waiting for scrambling enable\n",
> >  +     connector->base.base.id, connector->base.name);
> >  +}
> >  +
> >   /*
> >    * intel_hdmi_handle_sink_scrambling: handle sink scrambling/clock ra=
tio setup
> >    * @encoder: intel_encoder
> >  diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h
> > b/drivers/gpu/drm/i915/display/intel_hdmi.h
> >  index be2fad57e4ad..0fa3661568e8 100644
> >  --- a/drivers/gpu/drm/i915/display/intel_hdmi.h
> >  +++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
> >  @@ -70,5 +70,7 @@ void hsw_read_infoframe(struct intel_encoder *encode=
r,
> >   const struct intel_crtc_state *crtc_state,
> >   unsigned int type,
> >   void *frame, ssize_t len);
> >  +void intel_hdmi_poll_for_scrambling_enable(const struct
> > intel_crtc_state *crtc_state,
> >  +    struct drm_connector *_connector);
> >
> >   #endif /* __INTEL_HDMI_H__ */
> >  --
> >  2.45.2
>
> --
> Jani Nikula, Intel
