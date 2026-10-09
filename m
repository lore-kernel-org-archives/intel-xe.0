Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F4ECA9EBE
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 21:30:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35E41122BC;
	Fri,  9 Oct 2026 21:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="a99PBy7e";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026BF1122B4
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 21:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791581397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bAvzGIU7FEezK0icpYGYUEuQaRBPrUf0xbgMecnC+cI=;
 b=a99PBy7ehzpppLN0DmdT8FcpLuGCJ8dZP2VAEUUznSjwpHOb+UMKrg9QXvR30W8oRpXtap
 UVSsDSNC8plEuSISBUO8pyIoct9JYulTogSSn8/d4gJA9Ow8ptspxzA4VRxQeGWB9tBTIL
 inzrNPrxaMIBz75Bk8fB/0jWsZnNm3g=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664--rdR7AclOkqQx1aPB92fSQ-1; Fri, 9 Oct 2026 21:29:56 +0000
X-MC-Unique: -rdR7AclOkqQx1aPB92fSQ-1
X-Mimecast-MFC-AGG-ID: -rdR7AclOkqQx1aPB92fSQ_1791581395
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-934963b2bc0so27427385a.3
 for <intel-xe@lists.freedesktop.org>; Fri, 09 Oct 2026 14:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791581395; x=1792186195;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=90v506ynVqpQuSb78Sb7L2PEOo/OX2zZTfrHiXi251Q=;
 b=pv/uYijUlz8MqXGFkI2U8GfjNRIevxyjtojs5bLu78Zsut6qyc8djpvv0xd6LrD07C
 UlzAZj8Win3JxPfwkmY5XgDN3QHT+gQiNCETfsU7YOAWCo8jgYL/QQrvibVXDxRXB6rZ
 Sl77JdnwNGYMxQHxJKCl9J9ZKWbnxtKHX5YLbqPwbk67I9K/6NileCiZXbvZGYYQkcMH
 nUZyWSX5PROEQi2AIIiTsgfaSPa6ejav2F668PfFoEyeGNE6jK6HX9RMKWD8e6hXUpuI
 f8kCZ5+tWQkIq++jnigZA0O1Aj5vTbi3n13d58/kioQgNtUuwc/+5RLvKlcHuYhM2SrO
 P55Q==
X-Forwarded-Encrypted: i=1;
 AKwUvByMd5CJEpsgVTPpfQgH8BDygQo//C8ZJeNlFUdgRxUtClQYvjll0K4/Yh+5BRsmfm3CxNPkO9KrRg==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKPkQFLqq1gAYzkOGJOfrjxWZBMGfY/Lo5/hVS8Nk/mMYmdEm+w
 Ufa9/H5W54ev5Kc3xF5yUoMobtOptilQvds614W4GFRaErB/7TTmgu9Bkx6xRcZrDhH9Do1BnkN
 YQCnxugdBmv/hf1BVKCx0n5Dt0lt5Vyku9WSbmfojfumBfyMOLrwBbnDTMltST+GJGCyz
X-Gm-Gg: AYBFou2J5jQjzKoK6f7ZNRXxHIqe3ffktfC3dBGO5rZmjRbEmBiBAR9CMKVr/N3evDa
 t7y7KuEkc9iqFQV3qD5nQ+JSg0LlbhlCpThj+OdtyX0lJ6X5k0xGVDgypgOyhBmigaueTA3hBIa
 olTblNfUDi64pdqJHBY0ej9GC522bB6WdIsoH8uGDn+elRwJAWRLlYCpkc8BgNiIzab9Zh/apWg
 fXuRV0Sxl4OVvGYGCENmiugRSzv0ZXw3R4PyDI30ox8lXGr73oUKmXJTfaKgfI+DuE6Ncc/YPr7
 VWYWLgyUEwwgJ9B4ALk+VdsbC5WQx5CKyw/3wH5MHh1aa++xA2QERLqrAq0hojrYs3naTu8=
X-Received: by 2002:a05:620a:8389:b0:93b:d79a:c463 with SMTP id
 af79cd13be357-93ebd26b5e0mr483817285a.59.1791581395428; 
 Fri, 09 Oct 2026 14:29:55 -0700 (PDT)
X-Received: by 2002:a05:620a:8389:b0:93b:d79a:c463 with SMTP id
 af79cd13be357-93ebd26b5e0mr483813285a.59.1791581394787; 
 Fri, 09 Oct 2026 14:29:54 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93eb9903845sm281181985a.45.2026.10.09.14.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 14:29:54 -0700 (PDT)
Message-ID: <beed5319dd3d29ddc983e236e4edf0f2e2cb4007.camel@redhat.com>
Subject: Re: [PATCH] drm/i915/dp: limit UHBR link rates to the cable's
 capability
From: lyude@redhat.com
To: Xiao Lu <xiaolu.xie@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com, 
 imre.deak@intel.com, jani.nikula@linux.intel.com
Date: Fri, 09 Oct 2026 17:29:51 -0400
In-Reply-To: <20261009130611.3268451-1-xiaolu.xie@intel.com>
References: <20261009130611.3268451-1-xiaolu.xie@intel.com>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f6N-bCOSf_Gd4zBHpe7AyljKrrcAhomkfNfQj9eQs3E_1791581395
X-Mimecast-Originator: redhat.com
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

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2026-10-09 at 21:06 +0800, Xiao Lu wrote:
> DisplayPort 2.1 defines the CABLE_ATTRIBUTES_UPDATED_BY_DPRX register
> (DPCD 0x2217), in which a UHBRx-capable DPRX reports the UHBR link
> rates
> the attached cable can carry. The DPRX determines this via the
> CONFIG2
> voltage handshake (for a DP receptacle) or by parsing the cable
> eMarker
> (for a USB-C receptacle), and updates the register before asserting
> HPD.
>=20
> Add the register definitions and a helper,
> drm_dp_128b132b_cable_uhbr_rates(), that reads the register and
> returns
> the set of UHBR rates (DP_UHBR10, DP_UHBR13_5, DP_UHBR20) the cable
> permits, and intersect the sink's 128b/132b rates with it. This
> avoids
> attempting link training at a UHBR rate the cable cannot carry and
> then
> falling back, e.g. a UHBR20-capable sink connected through a cable
> that
> only supports UHBR10/UHBR13.5.
>=20
> A register value of 0 ("not UHBR-capable or capability unknown", or a
> sink that does not implement the register) yields all UHBR rates, so
> no
> restriction is imposed and the normal rate fallback applies.
>=20
> See DP Standard v2.1b, Table 2-260 (DPCD 0x2217).
>=20
> Signed-off-by: Xiao Lu <xiaolu.xie@intel.com>
> ---
> =C2=A0drivers/gpu/drm/display/drm_dp_helper.c | 49
> +++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/i915/display/intel_dp.c |=C2=A0 7 ++++
> =C2=A0include/drm/display/drm_dp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++++
> =C2=A0include/drm/display/drm_dp_helper.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 1 +
> =C2=A04 files changed, 69 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> b/drivers/gpu/drm/display/drm_dp_helper.c
> index e623ccb4c..5898d21cc 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -382,6 +382,55 @@ int drm_dp_128b132b_read_aux_rd_interval(struct
> drm_dp_aux *aux)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_dp_128b132b_read_aux_rd_interval);
> =C2=A0
> +/**
> + * drm_dp_128b132b_cable_uhbr_rates() - read the UHBR rates a cable
> can carry
> + * @aux: DisplayPort AUX channel
> + *
> + * Read the CABLE_ATTRIBUTES_UPDATED_BY_DPRX register (DPCD 0x2217)
> and return
> + * the set of 128b/132b (UHBR) link rates the attached cable is
> capable of
> + * carrying, as a mask of %DP_UHBR10, %DP_UHBR13_5 and %DP_UHBR20.
> + *
> + * A UHBRx-capable DPRX updates this register with the cable's
> capability (via
> + * the CONFIG2 voltage handshake for a DP receptacle, or by parsing
> the eMarker
> + * for a USB-C receptacle). A source can intersect the returned mask
> with the
> + * sink's (and its own) supported UHBR rates to avoid attempting
> link training
> + * at a rate the cable cannot carry, saving the time otherwise spent
> failing
> + * and falling back.
> + *
> + * A register value of 0 means the cable capability is unknown, or
> the sink does
> + * not implement the register. No restriction can be derived in that
> case, so
> + * all UHBR rates are returned and the caller's normal rate fallback
> applies.
> + *
> + * Returns a mask of DP_UHBR* rates the cable permits.
> + */
> +u8 drm_dp_128b132b_cable_uhbr_rates(struct drm_dp_aux *aux)
> +{
> +=09u8 cable, rates =3D DP_UHBR10 | DP_UHBR13_5 | DP_UHBR20;
> +
> +=09if (drm_dp_dpcd_read_byte(aux,
> DP_CABLE_ATTRIBUTES_UPDATED_BY_DPRX, &cable) < 0)
> +=09=09return rates;
> +
> +=09/* Unknown / not implemented: impose no restriction. */
> +=09if (!cable)
> +=09=09return rates;
> +
> +=09rates =3D 0;
> +=09switch (cable & DP_CABLE_UHBR10_20_CAPABILITY_MASK) {
> +=09case DP_CABLE_UHBR10_20_CAPABLE:
> +=09=09rates |=3D DP_UHBR20;
> +=09=09fallthrough;
> +=09case DP_CABLE_UHBR10_CAPABLE:
> +=09=09rates |=3D DP_UHBR10;
> +=09=09break;
> +=09}
> +
> +=09if (cable & DP_CABLE_UHBR13_5_CAPABILITY)
> +=09=09rates |=3D DP_UHBR13_5;
> +
> +=09return rates;
> +}
> +EXPORT_SYMBOL(drm_dp_128b132b_cable_uhbr_rates);
> +
> =C2=A0void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux
> *aux,
> =C2=A0=09=09=09=09=09=C2=A0=C2=A0=C2=A0 const u8
> dpcd[DP_RECEIVER_CAP_SIZE])
> =C2=A0{
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 113d767e6..de8f38754 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -278,6 +278,13 @@ static void intel_dp_set_dpcd_sink_rates(struct
> intel_dp *intel_dp)
> =C2=A0=09=09=09}
> =C2=A0=09=09}
> =C2=A0
> +=09=09/*
> +=09=09 * Intersect with the UHBR rates the cable can
> actually carry
> +=09=09 * (DPCD 0x2217), to avoid training at a rate the
> cable can't
> +=09=09 * support. Unknown/unimplemented leaves the rates
> untouched.
> +=09=09 */
> +=09=09uhbr_rates &=3D
> drm_dp_128b132b_cable_uhbr_rates(&intel_dp->aux);
> +
> =C2=A0=09=09if (uhbr_rates & DP_UHBR10)
> =C2=A0=09=09=09intel_dp->sink_rates[i++] =3D 1000000;
> =C2=A0=09=09if (uhbr_rates & DP_UHBR13_5)
> diff --git a/include/drm/display/drm_dp.h
> b/include/drm/display/drm_dp.h
> index e63c7f075..70463572e 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -1240,6 +1240,18 @@
> =C2=A0# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_32_MS=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x05
> =C2=A0# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_64_MS=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x06
> =C2=A0
> +#define
> DP_CABLE_ATTRIBUTES_UPDATED_BY_DPRX=09=09=090x2217 /* 2.1 */
> +# define DP_CABLE_UHBR10_20_CAPABILITY_MASK=09=09=09(3
> << 0)
> +# define DP_CABLE_NOT_UHBR_CAPABLE=09=09=09=09(0
> << 0)
> +# define DP_CABLE_UHBR10_CAPABLE=09=09=09=09(1
> << 0)
> +# define DP_CABLE_UHBR10_20_CAPABLE=09=09=09=09(2
> << 0)
> +# define DP_CABLE_UHBR13_5_CAPABILITY=09=09=09=09(1
> << 2)
> +# define DP_CABLE_TYPE_MASK=09=09=09=09=09(7
> << 3)
> +# define DP_CABLE_TYPE_UNKNOWN=09=09=09=09=09(0
> << 3)
> +# define DP_CABLE_TYPE_PASSIVE=09=09=09=09=09(1
> << 3)
> +# define DP_CABLE_TYPE_LRD=09=09=09=09=09(2
> << 3)
> +# define DP_CABLE_TYPE_LTTPR_RETIMER_ACTIVE=09=09=09(3
> << 3)
> +
> =C2=A0#define DP_TEST_264BIT_CUSTOM_PATTERN_7_0=09=090x2230
> =C2=A0#define DP_TEST_264BIT_CUSTOM_PATTERN_263_256=090x2250
> =C2=A0
> diff --git a/include/drm/display/drm_dp_helper.h
> b/include/drm/display/drm_dp_helper.h
> index 5b05a7fbe..a70530696 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -59,6 +59,7 @@ void drm_dp_lttpr_link_train_channel_eq_delay(const
> struct drm_dp_aux *aux,
> =C2=A0=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const u8
> caps[DP_LTTPR_PHY_CAP_SIZE]);
> =C2=A0
> =C2=A0int drm_dp_128b132b_read_aux_rd_interval(struct drm_dp_aux *aux);
> +u8 drm_dp_128b132b_cable_uhbr_rates(struct drm_dp_aux *aux);
> =C2=A0bool drm_dp_128b132b_lane_channel_eq_done(const u8
> link_status[DP_LINK_STATUS_SIZE],
> =C2=A0=09=09=09=09=09=C2=A0 int lane_count);
> =C2=A0bool drm_dp_128b132b_lane_symbol_locked(const u8
> link_status[DP_LINK_STATUS_SIZE],

