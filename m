Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A868AC7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 12:51:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830C310E939;
	Wed,  5 Apr 2023 12:51:05 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B22110E939
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 12:51:04 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id br6so46449477lfb.11
 for <intel-xe@lists.freedesktop.org>; Wed, 05 Apr 2023 05:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680699062;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S1BvsBd6qzwet8cGEPRC4PnUmkz56yS9JZBdglo+KhI=;
 b=G5Sm0A1kWWCtBg8aPCWjrDL+KPW5s8Z7uI2QIWo/k4IgMGvzQB1YydZUnxpj5ux03q
 2VWLudCH9CGbWifZWQnkneE/JATMPef/YuqdtjV7vOgAm90chRc+l2P9Nfwt19WFLNvJ
 7KnvbNGbM9EcgdbuFu9iTksyjiiJfr54zxgSQVJMWmTELI+qPT1bgiXzafBS/MHhedda
 f4CD7e9ecHldvhpVmm2SisIAYVlOzRX8s4oqF6tZsf34N9yvtvQjj5zlEk/IJGuUXLto
 wufqtv/LM2EMTM4SAGb6VGLuClQSTnaXROppo5KfV7csJ5sDTiReh/zIjO/yVbLfBkWZ
 H1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680699062;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S1BvsBd6qzwet8cGEPRC4PnUmkz56yS9JZBdglo+KhI=;
 b=tMTO7IQymUjvIdo86f32OvX0WtDj2xKB0KxiCeCbBnV5tJkHYQ8BRwPW7SeojMQ/eW
 G9FKHWW8WyYd1xgBs0nBUT4JSD0GaUmJAicK2+9Lol6O4MTtULsSoeAiqeSicd/yXafo
 Vn67f7nv/tX7aKm0uiAj6GqlAeO/GUkyL5ReyJ0s59GEzGCr47tiJ7dqdSrsF8SmAWBY
 SdYCt/KhgWb/xJlIe0kpwUhxeJCx07wm6JAFsYch3PxG6JdsXEgVrplZ1FVBw8e8OkrM
 5ynai9REeWN+VbUBbjqBFPy96F2fPh4PmVa2PwipayRItzMyJOTAcQf5k4GpfevhiuYg
 sthQ==
X-Gm-Message-State: AAQBX9cgo1M8YTsSVsu3LOg1xN5JfBmg3D8DKozUyXODSrGRcaIJWejk
 G7GtXAKQGmy8/RQuDFCUD5Vw4nmzRiAaFmkunDc=
X-Google-Smtp-Source: AKy350Y+FbEB6JlPZ1BGChyfzrubjJF8QZUx5BaR+FQIfADRXO7cUZGIt0o1PYR0skjQ1wjk2jzs1RKdiYFwCPEjjVY=
X-Received: by 2002:ac2:522c:0:b0:4ea:2dce:fa0a with SMTP id
 i12-20020ac2522c000000b004ea2dcefa0amr1925153lfl.10.1680699061618; Wed, 05
 Apr 2023 05:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230405024036.3969996-1-matthew.brost@intel.com>
 <20230405024036.3969996-2-matthew.brost@intel.com>
In-Reply-To: <20230405024036.3969996-2-matthew.brost@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 5 Apr 2023 13:50:34 +0100
Message-ID: <CAM0jSHPX3FCEo9uF1A_exQ8nptj1a93A_YeMTXLnh-SppQADRQ@mail.gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe: Always invalidate GGTT on map
 during driver load
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

On Wed, 5 Apr 2023 at 03:40, Matthew Brost <matthew.brost@intel.com> wrote:
>
> Coalescing GGTT invalidations should work but it creating an issue where
> the driver sporadically fails to load. For now just disable coalescing
> during load.
>
> Should fix:
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/232
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Any idea why we don't currently add any 4K padding for
insert_special_node() users? Don't we need padding for all GGTT
allocations due to overfetch + coalescing?

> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index a430d1568890..55d0c2554f7b 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -263,6 +263,7 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>
>  void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  {
> +       struct xe_gt *gt = ggtt->gt;
>         u64 start = bo->ggtt_node.start;
>         u64 offset, pte;
>
> @@ -278,8 +279,12 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>                 xe_ggtt_set_pte(ggtt, start + bo->size, pte);
>         }
>
> -       if (ggtt->invalidate) {
> -               xe_ggtt_invalidate(ggtt->gt);
> +       /*
> +        * XXX: Unsure why without invalidation on every map during driver load
> +        * we can fail the driver load.
> +        */
> +       if (ggtt->invalidate || !gt->uc.guc.submission_state.enabled) {
> +               xe_ggtt_invalidate(gt);
>                 ggtt->invalidate = false;
>         }
>  }
> --
> 2.34.1
>
