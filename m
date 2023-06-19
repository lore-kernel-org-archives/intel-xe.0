Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E46EB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 16:46:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4DC10E221;
	Mon, 19 Jun 2023 16:46:55 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0CB10E221
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 16:46:53 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f849a0e371so4679922e87.1
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 09:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687193211; x=1689785211;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IWbXQrXdCXXPv8yYADVXozKSC74+8mzCsnDMoWqrA2c=;
 b=IqxlmRuLGDmXdo7DfBXegbaKZmfg7WEWWzUtrh/H6VAr7cPU3wDVDjeo8M+XOw/UqY
 /7G0v5Kn3s0dEpLy8CZAjIJHKG6cihSyid+iI1jxPgGRv/WoOObi8YT3QuKWFSdmQ867
 NEhYHc0s3vjcU6CMSormXNJ4+qpqkDLzaCbpI6L7AsbPFBAb0s6WENiinr0VEnQHpyUw
 ess/SL4hwOPCUm+Gq3ICRvDo362gI9HjF6eMGkj9tJvqD1+Zk62k+IO+kF4eHMGaNHku
 5fWr3SXzYvLc5sRupuWk8w9owxZTDgwKrrHLzD2cI7hVShdrI5/5oVmyoV0yiwdfyg6X
 kVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687193211; x=1689785211;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IWbXQrXdCXXPv8yYADVXozKSC74+8mzCsnDMoWqrA2c=;
 b=MwtF5kF8NgvwcfuP58RBC8/3G6PjICbjBTlcIzeLFmZyGCn449YdTKY4tQ2lUpcA0n
 gxjOcSgWOR3IZ1O7cNgsAjIrZO5wr2qvcBhTzJoyc0HervskldrWkFdENhIcTgziyp/0
 P5QXadRT4udbDgO/Kv3CN8G8nONzGRs2Q1geTgljpXyt2YyuzVxru9JfWgF4w0wagxCC
 mGft5V+df/FOKfFrdANh0DV+4VaOdV8DMPcPr/B10aO9NduTpyaUpRT9GHXkpvC6OJS3
 qlVczafNknfQtg0LqbCLMAUfC0K7x+lfVGTD8Ak+8kWWaXu+1/r67Lf/MBlxGRVVkoRy
 1ojQ==
X-Gm-Message-State: AC+VfDxJidO9tL/6nyUjerI5jxtPhmuh5eyAUJ6RKckSY60fQ7qwOXOl
 heHiL0qr777fBP5dd2U5ThZMJOh9ggbTvili5ohg/25ixkE=
X-Google-Smtp-Source: ACHHUZ7rONy43m93M4HOryKgxwtBiRqBE5cqoUqHTF1Y6ewWVuhh58jZnS7aCRd9Dzyf7Kr+qAdz9VisZOO0YTQmToI=
X-Received: by 2002:a05:6512:32ab:b0:4f8:7796:623b with SMTP id
 q11-20020a05651232ab00b004f87796623bmr402236lfe.39.1687193211138; Mon, 19 Jun
 2023 09:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230619152222.11733-1-thomas.hellstrom@linux.intel.com>
 <20230619152222.11733-2-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230619152222.11733-2-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 19 Jun 2023 17:46:24 +0100
Message-ID: <CAM0jSHM2E2jb9s1T+38zsQBHnvULFSGRFhZ_hThOaUfxC2905w@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH v2 1/6] drm/xe/bo: Don't limit the TT manager
 to half of system memory
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 19 Jun 2023 at 16:22, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> TTM enforces this limit a page-allocation time, swapping out TT memory
> if needed.

It seems that limit can be exceeded by just creating one crazy big
object, or having a few as part of the same exec() call. If unable to
lock an object it seems to just skip it (-EBUSY), and if there are no
objects left to iterate over it just carries on with the allocation.
The hard limit in sys_mgr seemed to prevent that. Do we know if this
new behaviour is now expected?

>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_=
ttm_sys_mgr.c
> index 3e1fa0c832ca..961bbc29dcdf 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> @@ -106,8 +106,6 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
>
>         si_meminfo(&si);
>         gtt_size =3D (u64)si.totalram * si.mem_unit;
> -       /* TTM limits allocation of all TTM devices by 50% of system memo=
ry */
> -       gtt_size /=3D 2;
>
>         man->use_tt =3D true;
>         man->func =3D &xe_ttm_sys_mgr_func;
> --
> 2.40.1
>
