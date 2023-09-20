Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15EBC04FEE
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E4710E54B;
	Wed, 20 Sep 2023 19:55:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A9A10E549
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695239731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B4J53NK1t5KhGI1TnHwkaVd0lQKHDJgF5XTO7UHGanc=;
 b=hkynfraHxGLqN7toHQD+7OPz1SX1YoAGBunyzxCCD5vjttIPviJVVH8zB0dcd3gUz3PGkd
 hQUnYrKaL5Czq1s7GXmMnpmTLeEFwm9bmr4YNvHHu/dt4akv1jB4lqB3clBQXnM3Msnhzz
 G7UE6J3r8Ree6lxYIZCuuPdoMRcqm4s=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-Q4y_S-DSP06f97wzsE8fSQ-1; Wed, 20 Sep 2023 15:55:30 -0400
X-MC-Unique: Q4y_S-DSP06f97wzsE8fSQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-770ef1f4511so16788385a.0
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 12:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695239730; x=1695844530;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zJZmsvzM8P9qQ9GyO18P95CXMZ4S9NvYNTHRzBKce4E=;
 b=OdYQDpZM4+NsiNoqf169+TKSxWW/DXwWjykluSZCHeugQS5bIp1rWHbFFdacJ49R8D
 4fahTxgW1GxgOr5m5TGnmoI/6RtViOV3zTP+vh6VTE000yhCcaUF8blu7xAtFUXSlfTO
 YDziBWkYG+qUolz4A7xNU0TLQsgVX9Yp+Loa7UlgOx65hIqXJ3NYHzAxW1BvcU+Q5sFT
 88WZmD0ncqtllviuKs2A2TWi1CtfV2GWS6yj3tOe6EXGPTXuKzYhfkAK9BNCcqItz8Ut
 v9FcV5XfOCrdDLGLtVKZ+EluIikgvDrhn/gIG9+u/c2VQpx2VU+5UGhz4Ldwra+Od/CG
 jhUg==
X-Gm-Message-State: AOJu0YwI85YfzGgQYwmxeT1iZ4/wbqIPnFewOPheL32Q4/iLkwUAkaxy
 h2YaVKAI1oACzHXkS7zYfeJkVpGXpakHhXMlhKiXxBiszieXDQiIXbxzTvPmAETFyfh4n9xfPRg
 /Kf/H4gwDpLtMYGZ0jN++1QcvfN6N0xxmymY=
X-Received: by 2002:a05:622a:14d3:b0:412:27a1:88d2 with SMTP id
 u19-20020a05622a14d300b0041227a188d2mr4495092qtx.57.1695239729768; 
 Wed, 20 Sep 2023 12:55:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFckleXM6YSECeJTi3+w9h+AAdPMZGU+TNeFcNGieAtCmxEX+GRgJoJ0hi6XrZPjjG6DN5SQ==
X-Received: by 2002:a05:622a:14d3:b0:412:27a1:88d2 with SMTP id
 u19-20020a05622a14d300b0041227a188d2mr4495077qtx.57.1695239729406; 
 Wed, 20 Sep 2023 12:55:29 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05620a13f000b0076d6a08ac98sm5067408qkl.76.2023.09.20.12.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 12:55:28 -0700 (PDT)
Message-ID: <391fcadb309b9ac381336a5676506a701f8cc1c5.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 intel-xe@lists.freedesktop.org
Date: Wed, 20 Sep 2023 15:55:28 -0400
In-Reply-To: <20230920140339.28322-2-ville.syrjala@linux.intel.com>
References: <20230920140339.28322-1-ville.syrjala@linux.intel.com>
 <20230920140339.28322-2-ville.syrjala@linux.intel.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 2/3] drm/vblank: Warn when silently
 cancelling vblank works
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

Good point!

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Wed, 2023-09-20 at 17:03 +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> Silently cancelling vblank works is a bit rude, especially
> if said works do any resource management (eg. free memory).
> WARN if we ever hit this.
>=20
> TODO: Maybe drm_crtc_vblank_off() should wait for any
> pending work to reach its target vblank before actually
> doing anything drastic?
>=20
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_vblank_work.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vbla=
nk_work.c
> index bd481fdd6b87..43cd5c0f4f6f 100644
> --- a/drivers/gpu/drm/drm_vblank_work.c
> +++ b/drivers/gpu/drm/drm_vblank_work.c
> @@ -73,6 +73,9 @@ void drm_vblank_cancel_pending_works(struct drm_vblank_=
crtc *vblank)
> =20
>  =09assert_spin_locked(&vblank->dev->event_lock);
> =20
> +=09drm_WARN_ONCE(vblank->dev, !list_empty(&vblank->pending_work),
> +=09=09      "Cancelling pending vblank works!\n");
> +
>  =09list_for_each_entry_safe(work, next, &vblank->pending_work, node) {
>  =09=09list_del_init(&work->node);
>  =09=09drm_vblank_put(vblank->dev, vblank->pipe);

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

