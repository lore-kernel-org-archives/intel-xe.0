Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5292EEB365A
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 02:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FC710E0B4;
	Tue,  3 Mar 2026 02:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eb2+I+WU";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E8710E0B4
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 02:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772505922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nyIiPvo1Hi6sPVeMJBvore0WWbDttn+oJaE6w0roYKA=;
 b=eb2+I+WUqZG68L+IjL6diu0J4NYpG48IGuf1m0mfMC9j/WauAI1vJIgxNwAi+2JTqQscMG
 EiESDp3f1SpCNkOL0KT1seUv4XOfVoLL+gD7IyDppRCe6fTLTLfUHBXsF+8UbffDtfswqT
 u6dsXSXsdk2iMgBfxJghfpNA4KC0Ynk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-KJfYi2EAN1WuLrTGzzAlHQ-1; Mon, 02 Mar 2026 21:45:21 -0500
X-MC-Unique: KJfYi2EAN1WuLrTGzzAlHQ-1
X-Mimecast-MFC-AGG-ID: KJfYi2EAN1WuLrTGzzAlHQ_1772505921
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-506549eb4b7so481314821cf.3
 for <intel-xe@lists.freedesktop.org>; Mon, 02 Mar 2026 18:45:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772505921; x=1773110721;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nyIiPvo1Hi6sPVeMJBvore0WWbDttn+oJaE6w0roYKA=;
 b=nHU/vwKoVvOf6jnnPHU/G0lhXVI9ADTNeDob2tn2JWV4JrEGpxMIdw2Wq++3vP1fyw
 CQlKhKGMhoUX3Yf0v33EK8qe9JIKHGNE5chDPVzdY8+K7GjehWrt7YpdScgcojyQAKzh
 yfhe8XUr67YGSl0/1P5kkVMvZ80Lu/Rv5O0ywGhyQUyhkPHwpwObS/Yv2TI5irKJvAyp
 alpsmqK0z9B9a9D6otHzu3prk0FdUlqcHaD78XpaTc8TwOTWQanPPzmXvWxxd9c8u5AI
 3CHLzlum2BOPTXnwMPrDFrYm9ELGGd23Gciq7NM7AXkAliHlKDBVXujgHf1VKEvgY6Ur
 kIXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVapzNYVt7CxhVwf0+J9kWdy6mvbeJqnTvGrHN4z4g2/MSqU/RZ/SxX4SCidtZlzPihMTaJg7qR1Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxknFrBNWONo6225yUXpU7Lgwi6fwMCaCnxK+dG93LbPCsydLOM
 7f66AYe3LeXz0OSaZVEg8aKDS19yxAxUsljaqi7kr+JmvNq2d64K4A2xSPvxahfyS9xLx+kTkDK
 Af1BA9+eoMonZjnfE2m0cRjVt6LUyRH26bhOJsmxVwG7F6rCtZub9l6Baq8IA8zNZoSvZqHc2Yz
 xan0Rytsr9BzcgSuBVbrSyC7A2GRIHnai7k0MPAdu9Ev4=
X-Gm-Gg: ATEYQzyMonkRaSTiD08td+t8il12bsgjKMZKQnfD8fMWzOccRa6k5hfAunWZ0w1yl7e
 j8oCttWAwVkGqsAnT49TMLIU/9h7AJ2l+j8Y6T5jRcZFUzy9Z9dEtWx+bAaVYBjMr8rN+MfgK8C
 U1upjYNGtMhWwClZVlOCBM7pFt61nOR5jqD2oO0NJ1x03yybp72Vy7vdCGDUe84r7OfgVm5MtlI
 P4L5bc=
X-Received: by 2002:a05:622a:138d:b0:506:6e65:2334 with SMTP id
 d75a77b69052e-50752884908mr162390181cf.7.1772505920864; 
 Mon, 02 Mar 2026 18:45:20 -0800 (PST)
X-Received: by 2002:a05:622a:138d:b0:506:6e65:2334 with SMTP id
 d75a77b69052e-50752884908mr162390021cf.7.1772505920456; Mon, 02 Mar 2026
 18:45:20 -0800 (PST)
MIME-Version: 1.0
References: <20251202183950.2450315-1-jani.nikula@intel.com>
 <20260302174849.1541350-1-imre.deak@intel.com>
In-Reply-To: <20260302174849.1541350-1-imre.deak@intel.com>
From: Tao Liu <ltao@redhat.com>
Date: Tue, 3 Mar 2026 15:44:43 +1300
X-Gm-Features: AaiRm53OebrURJ-3U3Cm7zHgAwIYzvZZvrjnJgud4bVF_XJhK0QR7JJ_X9W5ZWM
Message-ID: <CAO7dBbU8CS7EC8+m9v-RMMs7u4XgUHvFyaRnZtyYV1BKmzQA1A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915/dmc: fix an unlikely NULL pointer deference
 at probe
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Gqn7DfPh_7v22SM7kaAopjGpwLkyonzNIOYwxgMLywE_1772505921
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

I have tested this patch can work for my kdump case as described in
Link: https://lore.kernel.org/all/20260228130946.50919-2-ltao@redhat.com.

Tested-by: Tao Liu <ltao@redhat.com>

On Tue, Mar 3, 2026 at 6:49=E2=80=AFAM Imre Deak <imre.deak@intel.com> wrot=
e:
>
> intel_dmc_update_dc6_allowed_count() oopses when DMC hasn't been
> initialized, and dmc is thus NULL.
>
> That would be the case when the call path is
> intel_power_domains_init_hw() -> {skl,bxt,icl}_display_core_init() ->
> gen9_set_dc_state() -> intel_dmc_update_dc6_allowed_count(), as
> intel_power_domains_init_hw() is called *before* intel_dmc_init().
>
> However, gen9_set_dc_state() calls intel_dmc_update_dc6_allowed_count()
> conditionally, depending on the current and target DC states. At probe,
> the target is disabled, but if DC6 is enabled, the function is called,
> and an oops follows. Apparently it's quite unlikely that DC6 is enabled
> at probe, as we haven't seen this failure mode before.
>
> It is also strange to have DC6 enabled at boot, since that would require
> the DMC firmware (loaded by BIOS); the BIOS loading the DMC firmware and
> the driver stopping / reprogramming the firmware is a poorly specified
> sequence and as such unlikely an intentional BIOS behaviour. It's more
> likely that BIOS is leaving an unintentionally enabled DC6 HW state
> behind (without actually loading the required DMC firmware for this).
>
> The tracking of the DC6 allowed counter only works if starting /
> stopping the counter depends on the _SW_ DC6 state vs. the current _HW_
> DC6 state (since stopping the counter requires the DC5 counter captured
> when the counter was started). Thus, using the HW DC6 state is incorrect
> and it also leads to the above oops. Fix both issues by using the SW DC6
> state for the tracking.
>
> This is v2 of the fix originally sent by Jani, updated based on the
> first References: discussion below.
>
> Link: https://lore.kernel.org/all/3626411dc9e556452c432d0919821b76d999121=
7@intel.com
> Link: https://lore.kernel.org/all/20260228130946.50919-2-ltao@redhat.com
> Fixes: 88c1f9a4d36d ("drm/i915/dmc: Create debugfs entry for dc6 counter"=
)
> Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Tao Liu <ltao@redhat.com>
> Cc: <stable@vger.kernel.org> # v6.16+
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_power_well.c | 2 +-
>  drivers/gpu/drm/i915/display/intel_dmc.c                | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/dr=
ivers/gpu/drm/i915/display/intel_display_power_well.c
> index 9c8d29839cafc..969b2c421d308 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> @@ -852,7 +852,7 @@ void gen9_set_dc_state(struct intel_display *display,=
 u32 state)
>                         power_domains->dc_state, val & mask);
>
>         enable_dc6 =3D state & DC_STATE_EN_UPTO_DC6;
> -       dc6_was_enabled =3D val & DC_STATE_EN_UPTO_DC6;
> +       dc6_was_enabled =3D power_domains->dc_state & DC_STATE_EN_UPTO_DC=
6;
>         if (!dc6_was_enabled && enable_dc6)
>                 intel_dmc_update_dc6_allowed_count(display, true);
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i=
915/display/intel_dmc.c
> index c3b411259a0c5..90ba932d940ac 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -1598,8 +1598,7 @@ static bool intel_dmc_get_dc6_allowed_count(struct =
intel_display *display, u32 *
>                 return false;
>
>         mutex_lock(&power_domains->lock);
> -       dc6_enabled =3D intel_de_read(display, DC_STATE_EN) &
> -                     DC_STATE_EN_UPTO_DC6;
> +       dc6_enabled =3D power_domains->dc_state & DC_STATE_EN_UPTO_DC6;
>         if (dc6_enabled)
>                 intel_dmc_update_dc6_allowed_count(display, false);
>
> --
> 2.49.1
>

