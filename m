Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB5DC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 09:43:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B5A10E0AE;
	Thu, 14 Dec 2023 09:43:42 +0000 (UTC)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF4810E0AE
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 09:43:41 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ca0715f0faso109549151fa.0
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 01:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702547019; x=1703151819; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j46Ou4TCFcBmvpwYY1O/nIyAKM5wBJvA7qCQ7kSb6CU=;
 b=CUHJ+kbCAbck40AtcBvyh5OSFlqaKWxX89xp3+Gv9dkmRBivVkplSJHd/BbLESPstH
 FaM7/uLxS9jKS9CJVpI+nX0N1m+bv+r8El75U2Gr/gEfBn04kmQZjHDIj7gSL6goqFFm
 W/IQDgo4O/a3VqpPpF3lBGy49nsBULMknrGZlvITpPLbAoHVN5/Mt1lyrQLGM2uFvKF5
 Mh1s3mBlqNVxcQ3TdhYEUZF245LG0LKDd62i6IbfW3bzF2ok0JWyhYD/Iip0jYqN1y9v
 t3EMBgxZk0K8F/bQLbHKhI9pwiK45K33qX416L34jrZwOo4QU+a1+0O6SA+3OR7873GB
 iPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702547019; x=1703151819;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j46Ou4TCFcBmvpwYY1O/nIyAKM5wBJvA7qCQ7kSb6CU=;
 b=HjmwxHPH6PItaasxL9E6GJ3ZO7Son00c61Unzyqas4Q6YZnkUQRKoBLnIqynGHaFPb
 TzG13nK53kIZNSJRDdR//8C0uuth7/BtSkn3SLTolN+94QSaCrAs5WEvVTlEB0vDmPwq
 AxaS2NI6mlJCEomHuNLsRs/+n2ES+3J65dCpJAcu0AhwKSCqVEjij896t9+Mj8ZT1FWF
 qwyUEkkZPSNkTj+n3ldGni8hFse0NSXQx8y20i8rl4M383lYxAw0gfuZdE9bGoij6vYP
 veiFCoXjMgrwYfTy03FWbzyBeMrlpOfbaITt6WAIMHx1JSMieD61Hi5jUl/Y5qfN8nX0
 L5nw==
X-Gm-Message-State: AOJu0YzU2kHr6DA+STgRVu+TLHu/TvnJ57a9zX+S3Cu++fVRr/f8/x5/
 wO1nMXCOacUvMr7sAbbKGh9l2VryQg1jv2wyPErf11kDwcI=
X-Google-Smtp-Source: AGHT+IELfSOaBGV+vuSf0+AheP7UryeYKh3iAN+Er9hT718xAkkvCzz/OCmtglXIwwuwDTaij7mS4T5/bmM4bAogXEw=
X-Received: by 2002:a2e:82c7:0:b0:2ca:a19:f21e with SMTP id
 n7-20020a2e82c7000000b002ca0a19f21emr3553086ljh.80.1702547018946; Thu, 14 Dec
 2023 01:43:38 -0800 (PST)
MIME-Version: 1.0
References: <20231212002058.1105898-1-rodrigo.vivi@intel.com>
 <SJ1PR11MB620471C7291527E350731CC0818DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ca95972f-2d5d-4fc6-bca3-e80f984e79cf@linux.intel.com>
 <5403be007f18a7df3e3dacb283794a4fb60185e0.camel@intel.com>
 <63d56a37-5460-4c32-abf7-7860f358023d@linux.intel.com>
In-Reply-To: <63d56a37-5460-4c32-abf7-7860f358023d@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 14 Dec 2023 09:43:11 +0000
Message-ID: <CAM0jSHO+qYFYEPKetsCY+U7xcDX7N3J75K848RPjpqqB_h+cHw@mail.gmail.com>
Subject: Re: [PATCH] drm/xe: Remove vram size info from sysfs
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 14 Dec 2023 at 05:56, Aravind Iddamsetty
<aravind.iddamsetty@linux.intel.com> wrote:
>
>
> On 12/13/23 21:23, Vivi, Rodrigo wrote:
> > On Wed, 2023-12-13 at 10:48 +0530, Aravind Iddamsetty wrote:
> >> On 12/13/23 09:43, Upadhyay, Tejas wrote:
> >>>> -----Original Message-----
> >>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf
> >>>> Of Rodrigo
> >>>> Vivi
> >>>> Sent: Tuesday, December 12, 2023 5:51 AM
> >>>> To: intel-xe@lists.freedesktop.org
> >>>> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Vivi, Rodrigo
> >>>> <rodrigo.vivi@intel.com>
> >>>> Subject: [PATCH] drm/xe: Remove vram size info from sysfs
> >>>>
> >>>> This information is already part of the query IOCTL.
> >>>> Let's not duplicate it here in the sysfs.
> >>> This patch was on request from L0 as they wanted actual VRAM size
> >>> including reserved portion. We should check with UMD team if they
> >>> require this sysfs or not. I will check.
> >> Hi Rodrigo,
> >>
> >> As Tejas mentioned the sysfs interface exposes the total physical
> >> vram including the stolen size which is needed by sysman, in the
> >> IOCTL only usable size(without stolen) is exposed.
> > I have removed it now so we can discuss better and ensure that we
> > are taking the best uapi decisions that are acceptable and won't
> > break the compatibility later after we are merged upstream.
> >
> > The time to break was now, so I removed.
> >
> > But we can continue with the discussion and see what is the best
> > approach.
> >
> > My first question would be: why does Level0 needs to know the stolen
> > size? So, why we don't add that information along with the query uapi?
> As part of their memory property API(device property) it needs the total memory on the
> card not just the usable.
>
> https://spec.oneapi.io/level-zero/latest/sysman/api.html#_CPPv4N20zes_mem_properties_t12physicalSizeE
>
> >
> > It would be really awkward to see a value in the sysfs as total memory
> > and a completely different value on the query ioclt? this stolen part
> > apparently needs to be more transparent then, no?!
> The query IOCTL is to show the usable memory for the application to know how much it can request hence stolen is removed.
> while the sysfs is like a device property to show total memory on card.

What about making region.total_size be the actual physical size, and
then s/region.used/region.avail/ which is then just the static usable
size, or if perfmon_capable() it is the live usable size?

>
>
> Thanks,
> Aravind.
> >
> >>
> >> Thanks,
> >> Aravind.
> >>> Tejas
> >>>> Cc: Matt Roper <matthew.d.roper@intel.com>
> >>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >>>> ---
> >>>>  drivers/gpu/drm/xe/xe_tile_sysfs.c | 23 +----------------------
> >>>>  1 file changed, 1 insertion(+), 22 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> >>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> >>>> index 16376607c68f..0f8d3e7fce46 100644
> >>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> >>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> >>>> @@ -20,20 +20,6 @@ static const struct kobj_type
> >>>> xe_tile_sysfs_kobj_type = {
> >>>>         .sysfs_ops = &kobj_sysfs_ops,
> >>>>  };
> >>>>
> >>>> -static ssize_t
> >>>> -physical_vram_size_bytes_show(struct device *kdev, struct
> >>>> device_attribute
> >>>> *attr,
> >>>> -                             char *buf)
> >>>> -{
> >>>> -       struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
> >>>> -
> >>>> -       return sysfs_emit(buf, "%llu\n", tile-
> >>>>> mem.vram.actual_physical_size);
> >>>> -}
> >>>> -
> >>>> -static DEVICE_ATTR_RO(physical_vram_size_bytes);
> >>>> -
> >>>> -static const struct attribute *physical_memsize_attr =
> >>>> -       &dev_attr_physical_vram_size_bytes.attr;
> >>>> -
> >>>>  static void tile_sysfs_fini(struct drm_device *drm, void *arg)
> >>>> {
> >>>>         struct xe_tile *tile = arg;
> >>>> @@ -64,15 +50,8 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
> >>>>
> >>>>         tile->sysfs = &kt->base;
> >>>>
> >>>> -       if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
> >>>> -           sysfs_create_file(tile->sysfs,
> >>>> physical_memsize_attr))
> >>>> -               drm_warn(&xe->drm,
> >>>> -                        "Sysfs creation to read addr_range per
> >>>> tile failed\n");
> >>>> -
> >>>>         err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini,
> >>>> tile);
> >>>> -       if (err) {
> >>>> +       if (err)
> >>>>                 drm_warn(&xe->drm, "%s: drmm_add_action_or_reset
> >>>> failed, err: %d\n",
> >>>>                          __func__, err);
> >>>> -               return;
> >>>> -       }
> >>>>  }
> >>>> --
> >>>> 2.43.0
