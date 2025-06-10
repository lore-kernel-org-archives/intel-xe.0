Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D40C61CE8
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 00:06:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9A410E24B;
	Tue, 10 Jun 2025 00:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="AvOfPEag";
	dkim-atps=neutral
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAC310E1A5
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 00:06:23 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-234f17910d8so47163415ad.3
 for <intel-xe@lists.freedesktop.org>; Mon, 09 Jun 2025 17:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749513981; x=1750118781;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V9szjAXGTYm8mZ2efiHdEJmH2XWeTxRw2f2AU7GDu0Q=;
 b=AvOfPEagK6RSOIVS5nI1miHdfzSihIDLlgsRFSGc5XYc4t8963qpgfqDHjAlNAnbZK
 Z6vDAffBlKGnWjIw8FubGdbgbW+Igg5OpTkTJ2e6Wl1XngD5dyieV1F6L0H+8vZaEuLg
 12mNaaUMdVVREx5+euUtLpAZvu0UcCzQdaVwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749513981; x=1750118781;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V9szjAXGTYm8mZ2efiHdEJmH2XWeTxRw2f2AU7GDu0Q=;
 b=Ti0v7UuXa9y2+LGyAh17+bBl31GG93tKaGtCqxHTwj9ONa5hC6xeUHyI5rRxoe3C1X
 PwE0E3CdMCf8rRoqXskfTsjrnTvGlU0oUm0TjVdDWTKKglNu2EAuXYlbsKcR9fMeL9ll
 1lKdngNsxSShxN0PU4Tt78wfahEj7WFqRcBipuweFV/CxLNoQKv2Wv4sygi1FNRixWV6
 iHHAcSbz23RdrB2Enhva7GyI3C8oe2zK+PlUO78+CuLfIAyaU5shetl2HOttDSifiKAA
 xLHLbK4lx0JCQsDXUy3Ctvgi7N++uI6f/6JLfL0V/QWlL2lpeJ7YV+fH7eHpYiJgLlSI
 Otww==
X-Forwarded-Encrypted: i=1;
 AJvYcCX32L+DmFOju13Gr5Usy5c4+wdIFj0knmx9+/e/bG00vg/1BIJbjv0kiNuKrHPu+JEXgxn3G2Hsrg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDwxLKYkgbFLket2UaBmF/w6GEg5KSdm6FVmYg424uOi5/7N8d
 Bb5RQsxfdHmZVDvaGq/jmDuoBqJiRe9nlIwXmn6GCLUlWDkXCVtop1kUHIUa+5M2BrK4GbFf0jD
 ZQvtv0Q==
X-Gm-Gg: ASbGncua0o1OfMOr5DujsG1mf0nGgluTQhUtc5TSNABxO7u1w+uJkGInbCk8pWdAeSt
 xytaGg/3wtjgQ67LQrTwDYsxQR9BGfEfVDNZNxKh3fs68qg+xduV773yJMBh5iPe4scNs3eRq6k
 DD4diV2zxvZNSLqYSYMWgP1MZDXU27nrZCS4ShvPSci1dvm1Bn98BNEIWsUIOeNmG46EJC117Ir
 PIHTh1LpPC70wLgrHaQyfUTso6yT4CLeBYk0uR5haJMLj8A0RVOVpmDi3dMYGSTTUeZhUNv+eE1
 FfAXcfpEXcNSijBIjHMo5udyiUEOsFWxIK7yCQ5xexX9CbLy9vLj1XB0HU0LtYKapAiNEiBKKTj
 kqMEy2klYmfU7JLLD+TmOrguWhw==
X-Google-Smtp-Source: AGHT+IFrMThc8G9xHgA7f6EGlu/wYAnr/li48vKD0X3Qtlnay2t/uBUz77Y7X/pPY8QGRJJQ9325Qw==
X-Received: by 2002:a17:902:f68e:b0:234:c22:c612 with SMTP id
 d9443c01a7336-23601de8746mr228098505ad.43.1749513981620; 
 Mon, 09 Jun 2025 17:06:21 -0700 (PDT)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com.
 [209.85.216.47]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2f5ed593f6sm4974698a12.1.2025.06.09.17.06.20
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jun 2025 17:06:20 -0700 (PDT)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-3122368d7cfso3868223a91.1
 for <intel-xe@lists.freedesktop.org>; Mon, 09 Jun 2025 17:06:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWSSd974QNZnwLnBhri4u19QsrGXgWkElQ3VnyIrEwe2z/5+KTWIpl6iG9XjE2SjKUu9SZK2u/Rtw==@lists.freedesktop.org
X-Received: by 2002:a17:90b:1c08:b0:313:287e:f1e8 with SMTP id
 98e67ed59e1d1-313472e5d83mr20241033a91.8.1749513979339; Mon, 09 Jun 2025
 17:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1749199013.git.jani.nikula@intel.com>
 <1ed7cfca02f8cf14347dadfe027197dc15791383.1749199013.git.jani.nikula@intel.com>
In-Reply-To: <1ed7cfca02f8cf14347dadfe027197dc15791383.1749199013.git.jani.nikula@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Jun 2025 17:06:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uuim4rO+dT3Yn=h0Dm4oawiMe9qfZfWt6yYMid3Y-_2Q@mail.gmail.com>
X-Gm-Features: AX0GCFufPSMlD42_Fj7Ceof7c-3jjE7ncGbUStK-hA2kgWz6xtQg_ijM9varnUs
Message-ID: <CAD=FV=Uuim4rO+dT3Yn=h0Dm4oawiMe9qfZfWt6yYMid3Y-_2Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/panel: use fwnode based lookups for panel
 followers
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Wysocki Rafael J <rafael.j.wysocki@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>, 
 simon1.yang@intel.com, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
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

Hi,

On Fri, Jun 6, 2025 at 2:06=E2=80=AFAM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
> Use firmware node based lookups for panel followers, to make the code
> independent of OF and device tree, and make it work also for ACPI with
> an appropriate _DSD.
>
> ASL example:
>
>         Package (0x02)
>         {
>                 "panel", \_SB.PCI0.GFX0.LCD0
>         }
>
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Lee Shawn C <shawn.c.lee@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_panel.c | 39 +++++++++++++++++++++++++++++--------
>  1 file changed, 31 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index fee65dc65979..3eb0a615f7a9 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -473,17 +473,40 @@ int of_drm_get_panel_orientation(const struct devic=
e_node *np,
>  EXPORT_SYMBOL(of_drm_get_panel_orientation);
>  #endif
>
> -static struct drm_panel *of_find_panel(struct device *follower_dev)
> +/* Find panel by fwnode */
> +static struct drm_panel *find_panel_by_fwnode(const struct fwnode_handle=
 *fwnode)

nit: It might be worth adding a comment that says it should be
identical to of_drm_find_panel() since that has a much richer
kerneldoc that talks about the corner cases.

>  {
> -       struct device_node *panel_np;
>         struct drm_panel *panel;
>
> -       panel_np =3D of_parse_phandle(follower_dev->of_node, "panel", 0);
> -       if (!panel_np)
> +       if (!fwnode_device_is_available(fwnode))
>                 return ERR_PTR(-ENODEV);
>
> -       panel =3D of_drm_find_panel(panel_np);
> -       of_node_put(panel_np);
> +       mutex_lock(&panel_lock);
> +
> +       list_for_each_entry(panel, &panel_list, list) {
> +               if (dev_fwnode(panel->dev) =3D=3D fwnode) {
> +                       mutex_unlock(&panel_lock);
> +                       return panel;
> +               }
> +       }
> +
> +       mutex_unlock(&panel_lock);
> +
> +       return ERR_PTR(-EPROBE_DEFER);
> +}
> +
> +/* Find panel by follower device */
> +static struct drm_panel *find_panel_by_dev(struct device *follower_dev)
> +{
> +       struct fwnode_handle *fwnode;
> +       struct drm_panel *panel;
> +
> +       fwnode =3D fwnode_find_reference(dev_fwnode(follower_dev), "panel=
", 0);
> +       if (IS_ERR_OR_NULL(fwnode))

nit: why IS_ERR_OR_NULL() instead of IS_ERR()? The kerneldoc for
fwnode_find_reference() doesn't mention anything about it returning a
NULL value in any cases...

Other than the nits, this looks reasonable to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I no longer have any easy access to hardware where panel-follower is
truly necessary, but I can at least see the panel-follower calls
getting made on sc7180-trogdor-lazor, so the of->fwnode conversion
stuff must be working.

Tested-by: Douglas Anderson <dianders@chromium.org>
