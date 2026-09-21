Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E5BC982E6
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 14:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29B810E79C;
	Mon, 21 Sep 2026 14:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="CPuzR1aY";
	dkim-atps=neutral
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AEB10E79C
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 14:31:48 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2d8facae850so158675ad.0
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 07:31:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790001108; cv=none;
 d=google.com; s=arc-20260327;
 b=Rg8uyLqyqBrR9FHRhjyIl0GhdINOxb4ZsaJmCvrpEYdTlbK2PrYGFFLBaV4n+Jc55q
 ysCQb0xP6e4xrZz89fegmENkykyi7DC9bFtqoexwS5kkpD7Y/l7DbBSK96DWExsktR3d
 kMdj0WDRxjJjLHtiUwzi6vyNWnLRy/58tHqHPJDLfE06A7oBTD1/cTStXWK1sAyGfrvg
 cBtG6jo2bGbRJp3BuDmeCXm4zlPlIU7JtvjWDY0jV0i+P/6pDPtVl11iDMWgeRw4ifo6
 E5nuJn/oKaGSFI8fs+e3J6NdmBfMea4/pGYqMPdbrjy0Gdw2hpiULe5nBQAHsJGv0s2D
 Sjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=/jne4rJNrIV3zuB5XDfQAq/6mlVqaFg6phL0RhLyZig=;
 fh=OU8LJJoNaE6FRjp5gEW6RihE78BzSZkYoTHgJ4OFPmg=;
 b=L+NgTWPGQ69TuXlxAeNFarN7aic56szoOZoB7Z0ajmld6+z7r4O/EBQVIeqhhVKpgi
 0+QDwkCjOacaF+1OxWJCGTqCwN3JioQmcs5ppcAXlMGTenFQZRt7fN4/IXgJ0Xg9xdOR
 F6CirL4UZInU2sMiG/QALGCxucWMCyKl6hDnxxfCCd1giG/QdhBFGMQzI39UWzuXklTX
 ma0h+3nEpdijaMWaNKUhO6emtLwz0MUKRqSVrnoHZb5noiplAWM8cYFY6IeimW5+sM9Q
 cOv7diP71Gh7YrVPNn8tVNqFf2wW3GKkZjBIZaSmUNLs1GrtoRaOd2n/mrlRNt9Zcpcw
 Dy4g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1790001108; x=1790605908;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=/jne4rJNrIV3zuB5XDfQAq/6mlVqaFg6phL0RhLyZig=;
 b=CPuzR1aYaT8QEBf8L8KWkP75y5IdtMLOGteDaqMr1XQuDM+nw+5dF/DNOZLL2FWBJ6
 QUoRAlQiiSANNUhqKcEALPqvfwwbEdtyllQNHfxTn7RsyIfRIXBetsDo2Xsulsnmo5yf
 wfnxyTnVwFtkUDY5eWBFeBacbr9ZtxRrOpTUUAljIbeHBBlnJl0pGLlzc17325rb6yyM
 p0eYx84cQ3So62JRfVXj3/WCWrmVlNp+EHh3VbUats0KLCVK4hheM42JUYXYqtJD0fgk
 BLMnWO+S3hSAnaR/BpfoneZAhV6mEk/h1VCJ8BkOQwPQFQy9waccQ3uVR3kziu3czRTP
 kbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790001108; x=1790605908;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=/jne4rJNrIV3zuB5XDfQAq/6mlVqaFg6phL0RhLyZig=;
 b=VHhpcTCfZiyrOamTIM9RqNbfKf97MpwxtGD/13PY/e5s4pQr997Op1uylALu8awoFw
 5g1ka2vnMTBmipaAd+3IO+DSTuLo1oomdQo7ytiJ32y43DxmGAHSA0BshowAolCVoEG2
 BQz2mwni2UW2MWVlphDhGpZ54Lb6/aESmbZUGTMuOgTwOPc8sCkBxSKPTkaycPXGh9UQ
 8IrCpmuY6S8b7ksQo7XNkerX3pdkdDQnfMsqg0wkT8f4dMsEKy4/AIjD8YT6FY2PRVr9
 fapq1YjyQ1jkvuK+3xnrU2ItaWFvhRBuN412oatend6Hq/uln45b1AWvVqZfsO39TfO+
 8TzQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw722vxvVygNWjdu+VKAlAVAUpuyONdSHHCqlITcF+aR+7WO9YVhzSN1tQsl2p2btNmbyPe/i87HQ==@lists.freedesktop.org
X-Gm-Message-State: AFuF++lWKfOJtCUUXPF4VErsQfl0WfGwJEGpjYML9X102MIcMwOymcKd
 BFJl/WKIypnjvTLjPknE03HtmTFf4V1WGw6jbpz8NOukddxarOcSS91M/bfjy1FtC3emeseSS5g
 aEpvpaqfqhHeDacfpKDsPBva8XAyJ0B4AOOdVWc6V
X-Gm-Gg: AYBFou0hOcMdP8KKz+/5abgzHJuWjVTLxxssVGzIfeeKwhyqbOAXudl7MxbaXXs0QCy
 giX/iRXg0N5MuGW+PzfAKVKVhkGqUGfsylETu3q4m4TFHzEw/rdINLLAPwPawrlAWP1145ShPmQ
 JYpKK59gFRLsb4ZA8iN61xyGk7PRJYWEQ4PsWdqKIki3gODVUjjRlcz4SarrgnspTYqNccjxXe0
 F3+JUk/v5ldfWeEXUnxT716e5leDSIPNhDEuKofR3RgipZl8tRLvMcIlh/DVnGHs+bTHzn2ln+O
 dhpQx+TeJyhTXIIllR/MBE6eoJWA8StGWSs4HjaHKjXRutWvvIsOKTnt5tE6Q/+96h7lx2Jt9Sh
 JcQd+B1uLgA==
X-Received: by 2002:a17:903:94d:b0:2dd:53ce:f2bc with SMTP id
 d9443c01a7336-2dea2e93febmr10006575ad.3.1790001107248; Mon, 21 Sep 2026
 07:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260601212613.3682640-1-jdsultan@google.com>
 <20260602205422.1792007-1-jdsultan@google.com>
 <68143a59-ca3f-4e57-997a-8342021ffd53@intel.com>
 <CA++eeRM5PbFq79Yw9xECRaat_Ju759Xrc_7=F-R1viCsLFREfg@mail.gmail.com>
 <1e2f1d5d-2b67-4fc0-8db2-e68a36989b19@intel.com>
In-Reply-To: <1e2f1d5d-2b67-4fc0-8db2-e68a36989b19@intel.com>
From: Gil Dekel <gildekel@google.com>
Date: Mon, 21 Sep 2026 10:31:35 -0400
X-Gm-Features: AcwNN1WOE9WUClNMUHksPvMJ09wHqrUecUP91wL6FHmJAYe9KB1mjNX1C4AFuCs
Message-ID: <CA++eeRMz3eA+c1Wu6OkpRGFD0yqz1aJ2TgO6MibhA35mf5vCwg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/i915/dp: Handle VSC SDP revision 7 in unpack
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 Juasheem Sultan <jdsultan@google.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@linux.intel.com>
Content-Type: multipart/alternative; boundary="0000000000002693ba065bff1c41"
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

--0000000000002693ba065bff1c41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you kindly!

On Mon, Sep 21, 2026 at 9:03=E2=80=AFAM Nautiyal, Ankit K <
ankit.k.nautiyal@intel.com> wrote:

>
> On 9/19/2026 1:07 AM, Gil Dekel wrote:
> > Hi all,
> > If I'm reading this correctly, it seems like this patch was LGTMd but
> > hasn't been merged yet.
> > We would really like to pull this patch into our kernels as it is the
> > source of a lot of log spam around seamless modesets.
> >
> > Is there a reason this hasn't been merged yet?
> > Thank you in advance.
>
>
> Thanks for the patch and the reviews. Pushed to drm-intel-next.
>
> Regards,
>
> Ankit
>
>
> >
> > Sincerely,
> >
> > On Wed, Jun 3, 2026 at 7:40=E2=80=AFAM Borah, Chaitanya Kumar
> > <chaitanya.kumar.borah@intel.com> wrote:
> >
> >     On 6/3/2026 2:24 AM, Juasheem Sultan wrote:
> >     > VSC SDP revision 7 (Panel Replay + Pixel Encoding/Colorimetry
> >     Format)
> >     > unpacking is missing in intel_dp_vsc_sdp_unpack(). This causes pi=
pe
> >     > state mismatches during state readout because the VSC SDP state
> >     is not
> >     > properly recovered when Panel Replay is active with colorimetry.
> >     >
> >     > Add the missing case for revision 7 to intel_dp_vsc_sdp_unpack()
> >     > so that the state is correctly recovered.
> >     >
> >     > v2: Rebase onto latest upstream
> >     > v3: Fix git commit description
> >     >
> >
> >     LGTM.
> >     Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com=
>
> >
> >     > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> >     > Cc: Chaitanya Borah <chaitanya.kumar.borah@intel.com>
> >     > Cc: Gil Dekel <gildekel@google.com>
> >     > Signed-off-by: Juasheem Sultan <jdsultan@google.com>
> >     > ---
> >     >   drivers/gpu/drm/i915/display/intel_dp.c | 6 +++++-
> >     >   1 file changed, 5 insertions(+), 1 deletion(-)
> >     >
> >     > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> >     b/drivers/gpu/drm/i915/display/intel_dp.c
> >     > index 6ef2a0043cda..b8746dab051c 100644
> >     > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> >     > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> >     > @@ -5343,11 +5343,15 @@ static int
> >     intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
> >     >                *   VSC SDP supporting 3D stereo + Panel Replay.
> >     >                */
> >     >               return 0;
> >     > -     } else if (sdp->sdp_header.HB2 =3D=3D 0x5 &&
> >     sdp->sdp_header.HB3 =3D=3D 0x13) {
> >     > +     } else if ((sdp->sdp_header.HB2 =3D=3D 0x5 ||
> >     sdp->sdp_header.HB2 =3D=3D 0x7) &&
> >     > +                     sdp->sdp_header.HB3 =3D=3D 0x13) {
> >     >               /*
> >     >                * - HB2 =3D 0x5, HB3 =3D 0x13
> >     >                *   VSC SDP supporting 3D stereo + PSR2 + Pixel
> >     Encoding/Colorimetry
> >     >                *   Format.
> >     > +              * - HB2 =3D 0x7, HB3 =3D 0x13
> >     > +              *   VSC SDP supporting 3D stereo + Panel Replay +
> >     Pixel Encoding/Colorimetry
> >     > +              *   Format.
> >     >                */
> >     >               vsc->pixelformat =3D (sdp->db[16] >> 4) & 0xf;
> >     >               vsc->colorimetry =3D sdp->db[16] & 0xf;
> >
> >
> >
> > --
> >
> >
> >
> > Gil Dekel
> > *AluminiumOS*
> > Desktop Experience
> > Laptop & Tablets Display
> >
> > Software Engineer
> > gildekel@google.com
> > +1 (650) 861-2933 <(650)%20861-2933>
> >
>


--=20

Gil Dekel
*AluminiumOS*
Desktop Experience
Laptop & Tablets Display

Software Engineer
gildekel@google.com
+1 (650) 861-2933

--0000000000002693ba065bff1c41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you kindly!</div><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 21, 202=
6 at 9:03=E2=80=AFAM Nautiyal, Ankit K &lt;<a href=3D"mailto:ankit.k.nautiy=
al@intel.com">ankit.k.nautiyal@intel.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><br>
On 9/19/2026 1:07 AM, Gil Dekel wrote:<br>
&gt; Hi all,<br>
&gt; If I&#39;m reading this correctly, it seems like this patch was LGTMd =
but <br>
&gt; hasn&#39;t been merged yet.<br>
&gt; We would really like to pull this patch into our kernels as it is the =
<br>
&gt; source of a lot of log spam around seamless modesets.<br>
&gt;<br>
&gt; Is there a reason this hasn&#39;t been merged yet?<br>
&gt; Thank you in advance.<br>
<br>
<br>
Thanks for the patch and the reviews. Pushed to drm-intel-next.<br>
<br>
Regards,<br>
<br>
Ankit<br>
<br>
<br>
&gt;<br>
&gt; Sincerely,<br>
&gt;<br>
&gt; On Wed, Jun 3, 2026 at 7:40=E2=80=AFAM Borah, Chaitanya Kumar <br>
&gt; &lt;<a href=3D"mailto:chaitanya.kumar.borah@intel.com" target=3D"_blan=
k">chaitanya.kumar.borah@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 6/3/2026 2:24 AM, Juasheem Sultan wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; VSC SDP revision 7 (Panel Replay + Pixel Encod=
ing/Colorimetry<br>
&gt;=C2=A0 =C2=A0 =C2=A0Format)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; unpacking is missing in intel_dp_vsc_sdp_unpac=
k(). This causes pipe<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; state mismatches during state readout because =
the VSC SDP state<br>
&gt;=C2=A0 =C2=A0 =C2=A0is not<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; properly recovered when Panel Replay is active=
 with colorimetry.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Add the missing case for revision 7 to intel_d=
p_vsc_sdp_unpack()<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; so that the state is correctly recovered.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; v2: Rebase onto latest upstream<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; v3: Fix git commit description<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0LGTM.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Reviewed-by: Chaitanya Kumar Borah &lt;<a href=3D"m=
ailto:chaitanya.kumar.borah@intel.com" target=3D"_blank">chaitanya.kumar.bo=
rah@intel.com</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Cc: Jani Nikula &lt;<a href=3D"mailto:jani.nik=
ula@linux.intel.com" target=3D"_blank">jani.nikula@linux.intel.com</a>&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Cc: Chaitanya Borah &lt;<a href=3D"mailto:chai=
tanya.kumar.borah@intel.com" target=3D"_blank">chaitanya.kumar.borah@intel.=
com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Cc: Gil Dekel &lt;<a href=3D"mailto:gildekel@g=
oogle.com" target=3D"_blank">gildekel@google.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Juasheem Sultan &lt;<a href=3D"=
mailto:jdsultan@google.com" target=3D"_blank">jdsultan@google.com</a>&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0drivers/gpu/drm/i915/display/intel=
_dp.c | 6 +++++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A01 file changed, 5 insertions(+), 1=
 deletion(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/drivers/gpu/drm/i915/display/inte=
l_dp.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/drivers/gpu/drm/i915/display/intel_dp.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 6ef2a0043cda..b8746dab051c 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/drivers/gpu/drm/i915/display/intel_dp.c<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/drivers/gpu/drm/i915/display/intel_dp.c<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -5343,11 +5343,15 @@ static int<br>
&gt;=C2=A0 =C2=A0 =C2=A0intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *=C2=A0 =C2=A0VSC SDP supporting 3D stereo + Panel Replay.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0} else if (sdp-&gt;sdp_he=
ader.HB2 =3D=3D 0x5 &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0sdp-&gt;sdp_header.HB3 =3D=3D 0x13) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0} else if ((sdp-&gt;sdp_h=
eader.HB2 =3D=3D 0x5 ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0sdp-&gt;sdp_header.HB2 =3D=3D 0x7) &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sdp-&gt;sdp_header.HB3 =3D=3D 0x13) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * - HB2 =3D 0x5, HB3 =3D 0x13<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *=C2=A0 =C2=A0VSC SDP supporting 3D stereo + PSR2 + Pixel<br>
&gt;=C2=A0 =C2=A0 =C2=A0Encoding/Colorimetry<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *=C2=A0 =C2=A0Format.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 * - HB2 =3D 0x7, HB3 =3D 0x13<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *=C2=A0 =C2=A0VSC SDP supporting 3D stereo + Panel Replay +<br>
&gt;=C2=A0 =C2=A0 =C2=A0Pixel Encoding/Colorimetry<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *=C2=A0 =C2=A0Format.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0vsc-&gt;pixelformat =3D (sdp-&gt;db[16] &gt;&gt; 4) &amp; 0xf;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0vsc-&gt;colorimetry =3D sdp-&gt;db[16] &amp; 0xf;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -- <br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; Gil Dekel<br>
&gt; *AluminiumOS*<br>
&gt; Desktop Experience<br>
&gt; Laptop &amp; Tablets Display<br>
&gt;<br>
&gt; Software Engineer<br>
&gt; <a href=3D"mailto:gildekel@google.com" target=3D"_blank">gildekel@goog=
le.com</a><br>
&gt; <a href=3D"tel:(650)%20861-2933" value=3D"+16508612933" target=3D"_bla=
nk">+1 (650) 861-2933</a><br>
&gt;<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><table width=3D"90%" border=3D"0" cellspacing=3D=
"0" cellpadding=3D"0" style=3D"margin:0px;padding:0px;max-width:348px"><tbo=
dy style=3D"margin:0px;padding:0px"><tr style=3D"margin:0px;padding:0px"><t=
d style=3D"padding:0px 0px 5px;font-family:Arial,Helvetica,Verdana,sans-ser=
if;font-size:13px;line-height:15px;color:rgb(153,153,153)"></td></tr><tr st=
yle=3D"margin:0px;padding:0px"><td style=3D"padding:0px"><table border=3D"0=
" cellspacing=3D"0" cellpadding=3D"0" style=3D"margin:0px;padding:20px 0px =
0px"><tbody style=3D"margin:0px;padding:0px"><tr style=3D"margin:0px;paddin=
g:0px"><td valign=3D"top" style=3D"padding:0px 20px 0px 0px;vertical-align:=
top;border-right:1px solid rgb(213,213,213)"><img src=3D"https://www.google=
.com/logos/doodles/2015/inge-lehmanns-127th-birthday-5712482031108096.2-hp2=
x.gif" width=3D"200" height=3D"87"><br></td><td style=3D"padding:0px 0px 0p=
x 20px"><table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"ma=
rgin:0px;padding:0px"><tbody style=3D"margin:0px;padding:0px"><tr style=3D"=
margin:0px;padding:0px"><td colspan=3D"2" style=3D"padding:1px 0px 5px;font=
-family:Arial,Helvetica,Verdana,sans-serif;font-size:13px;line-height:13px;=
color:rgb(56,58,53);font-weight:700">Gil Dekel<br></td></tr><tr style=3D"ma=
rgin:0px;padding:0px"><td colspan=3D"2" style=3D"padding:0px 0px 5px;line-h=
eight:13px"><font style=3D"font-family:Arial,Helvetica,Verdana,sans-serif;f=
ont-size:11px"><font color=3D"#666666"><b>AluminiumOS</b></font><br><font c=
olor=3D"#383a35">Desktop Experience</font><br><font color=3D"#383a35">Lapto=
p &amp; Tablets Display</font><br></font><font face=3D"Arial, Helvetica, Ve=
rdana, sans-serif"><span style=3D"font-size:11px">=C2=A0</span></font><br><=
font color=3D"#999999" style=3D"font-family:Arial,Helvetica,Verdana,sans-se=
rif;font-size:11px">Software Engineer</font></td></tr><tr style=3D"margin:0=
px;padding:0px"><td colspan=3D"2" style=3D"padding:0px 0px 5px;font-family:=
Arial,Helvetica,Verdana,sans-serif;font-size:11px;line-height:13px;color:rg=
b(56,58,53)"><a href=3D"mailto:gildekel@google.com" target=3D"_blank">gilde=
kel@google.com</a></td></tr><tr style=3D"margin:0px;padding:0px"><td colspa=
n=3D"2" style=3D"padding:0px 0px 3px;font-family:Arial,Helvetica,Verdana,sa=
ns-serif;font-size:11px;line-height:13px;color:rgb(3,112,248)">+1 (650) 861=
-2933</td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody>=
</table></div></div>

--0000000000002693ba065bff1c41--
