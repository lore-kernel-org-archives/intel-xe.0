Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6549C61D9C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 12:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7890410E080;
	Wed, 22 Nov 2023 12:20:54 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F7210E602
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 12:20:51 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5098e423ba2so9404699e87.2
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 04:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700655650; x=1701260450; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gV94WbTnMN4gQ5g5Xr2JxyAyJR/xLPxaLoDwaUbd8nI=;
 b=ECUHbVcEEwN/2usYWA5Q1yYASeB935hcLCtbblJr9eDHUT6grd3h18NDN9j5wOz9vv
 +TNA81daswqvZUKpp5ZzM44aV3h9SV15AjhHzGaEeYfKZFpJtXMqb3Ra4TGr6GFsVm9K
 desFFQIZW8F9ibyN1oM/7nkvjXvIzA1wwAqezc3VzEiY1KjPjFLN3iQXodvcTS9bq9tA
 bLH+csfpAz7yIh0nw/Nrcm3NbpBF179CJJMPsqdpF/yoWMxKTyvifO1sqXNX83arWr7u
 STfxh+gLP0W2IJILDER/L1k+1HyRxnjxD4NVKlIqXU1WMBEgX9lehSXu/3C/PCfemXhH
 +Ayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700655650; x=1701260450;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gV94WbTnMN4gQ5g5Xr2JxyAyJR/xLPxaLoDwaUbd8nI=;
 b=L8v1rqMNPXjMvgWQSWYvIysw8E3G/lJD69MFK7zkQj+kJaEBJnrADYkfVvcT/01hpx
 6LyvAzDIPvk0D9c7E62kZnJqcAk0jdahO2QlhI1N4iC7h71UGm8bjon/3u4gCcfHs+PU
 p7NeUEacM5msfrZEZoygBYs+oNJ6Ue1TO6xv545tiuyYOjYA0EHExpTPde35ZbQN2cAc
 yxWiYtGoRzXl8lAV9r1nfOoIXkeeLGNvLzVtASiCBi88MzK/MDGLTL4EGNnkV+QQSZcn
 H7J7I+ZAYl/6Z1GO8bZVmA71KDJ8kX6j9WbrH1tGUnAoEeh1zO0TNyaZ7/iN6FfZ16Y5
 sUZQ==
X-Gm-Message-State: AOJu0Yy6Z8BDhzm0F00PjbEdLAHAWM1CoYIvP7qWAImvxAuxee7bn/5j
 6j3zbEtQsMfDcgj7Kmtdnh0hFo1MwMY8XqId+EY=
X-Google-Smtp-Source: AGHT+IH0129/wBDUhmCy3682g3bcm5u4F1OS84V/+RhEwutUzbFSW8du68XB1dt9K3rF2FKn6dYMez3k/KG3eNfDeDE=
X-Received: by 2002:a05:6512:10c5:b0:50a:ba8a:ec12 with SMTP id
 k5-20020a05651210c500b0050aba8aec12mr1525428lfg.49.1700655649716; Wed, 22 Nov
 2023 04:20:49 -0800 (PST)
MIME-Version: 1.0
References: <20231122110359.4087-1-thomas.hellstrom@linux.intel.com>
 <20231122110359.4087-2-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231122110359.4087-2-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 22 Nov 2023 12:20:22 +0000
Message-ID: <CAM0jSHM9-mVYUh00gWKcdaQVuLzESwpY+OKrg_t=O92xcg4wCQ@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe: Ensure that we don't access the
 placements array out-of-bounds
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

On Wed, 22 Nov 2023 at 11:04, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Ensure, using xe_assert that the various try_add_<placement> functions
> don't access the bo placements array out-of-bounds.
>
> Suggested-by: Ohad Sharabi <osharabi@habana.ai>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/946
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4305f5cbc2ab..915910b87faa 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -121,9 +121,11 @@ static struct xe_mem_region *res_to_mem_region(struc=
t ttm_resource *res)
>         return to_xe_ttm_vram_mgr(mgr)->vram;
>  }
>
> -static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
> -                          u32 bo_flags, u32 *c)
> +static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
> +                          struct ttm_place *places, u32 bo_flags, u32 *c=
)
>  {
> +       xe_assert(xe, *c < ARRAY_SIZE(bo->placements));

Should we also refer to bo->placements directly, and drop the places argume=
nt?

Anyway,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +
>         if (bo_flags & XE_BO_CREATE_SYSTEM_BIT) {
>                 places[*c] =3D (struct ttm_place) {
>                         .mem_type =3D XE_PL_TT,
> @@ -172,6 +174,8 @@ static void add_vram(struct xe_device *xe, struct xe_=
bo *bo,
>  static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
>                          struct ttm_place *places, u32 bo_flags, u32 *c)
>  {
> +       xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
> +
>         if (bo->props.preferred_gt =3D=3D XE_GT1) {
>                 if (bo_flags & XE_BO_CREATE_VRAM1_BIT)
>                         add_vram(xe, bo, places, bo_flags, XE_PL_VRAM1, c=
);
> @@ -188,6 +192,8 @@ static void try_add_vram(struct xe_device *xe, struct=
 xe_bo *bo,
>  static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
>                            struct ttm_place *places, u32 bo_flags, u32 *c=
)
>  {
> +       xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
> +
>         if (bo_flags & XE_BO_CREATE_STOLEN_BIT) {
>                 places[*c] =3D (struct ttm_place) {
>                         .mem_type =3D XE_PL_STOLEN,
> @@ -210,11 +216,11 @@ static int __xe_bo_placement_for_flags(struct xe_de=
vice *xe, struct xe_bo *bo,
>         /* The order of placements should indicate preferred location */
>
>         if (bo->props.preferred_mem_class =3D=3D DRM_XE_MEM_REGION_CLASS_=
SYSMEM) {
> -               try_add_system(bo, places, bo_flags, &c);
> +               try_add_system(xe, bo, places, bo_flags, &c);
>                 try_add_vram(xe, bo, places, bo_flags, &c);
>         } else {
>                 try_add_vram(xe, bo, places, bo_flags, &c);
> -               try_add_system(bo, places, bo_flags, &c);
> +               try_add_system(xe, bo, places, bo_flags, &c);
>         }
>         try_add_stolen(xe, bo, places, bo_flags, &c);
>
> --
> 2.41.0
>
