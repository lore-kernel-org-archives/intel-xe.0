Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1522EEAA77
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 20:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDD710E15D;
	Thu, 14 Sep 2023 20:47:37 +0000 (UTC)
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8703F10E15D
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 20:47:35 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-573128cd77dso235132eaf.0
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 13:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1694724455; x=1695329255; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gz+/RlTe2DvhwDd6wwrO9nDTRmaP3zecJIaioItN5DY=;
 b=BjPzc+ckUu2SluQgfsl+YTfiQDeKAdzkJIwNzWRudV7MzzxJcdHwOlVkD2eRFeBUxX
 j7QJjaEZVSF2F8pcZ1TnnhHGi2AfBgrdDVvMgUTrEZxol0amJCdYlMcN2HbjZRoIvLXC
 3xVg1gUt+Wnia9assxL1yTz+QA1YIaoKykSZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694724455; x=1695329255;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gz+/RlTe2DvhwDd6wwrO9nDTRmaP3zecJIaioItN5DY=;
 b=fvr3/t6JLjVaAkkPcqdIN0Zrhue5a8MTVn4istTl8zWlmAktrNVtOxkVPa87jnaQEb
 tM0dwvPFkJnl3RHM3oRf2EzUiPEWREMzSIAcYZjVuY9PqidhGO3MzDXrpLtok2ZsalSP
 XpAfVBVGnNGvlumKxKUB/ZnSW2rWyfjLlRy/CIdgBtC9YSgkFC1xqS+msrfYTrZoiReU
 bUjYttxHNKJRJykhTeb1TLGF/DicyzALMecMpstWKAUFqFZge1stneS8atXmemOHOEw1
 4pFtAccUqSZvM5JJwT3dpKxxyGL26H/fxrNn5/wUEtak29cldkjXOoOAPXUy07KH3CyY
 lssA==
X-Gm-Message-State: AOJu0YwsfWQ5q4eS/l2dFvdDP9wd+52ECMHPyeD9mPkHO6r9yYaK1Asl
 ANBSpOyf9X5T9ggkDgiMv/9S43VDZDwJM0QIeuZGYavzZ3FR1boa
X-Google-Smtp-Source: AGHT+IFdiP5hxJJHUzU8V1VbCCbTvDyEs+qcIt1zjapMdoEQ0SFHIkD2LSw7g+pg8lRiJTVD8e6Ji7hObfmt5XJkL4k=
X-Received: by 2002:a05:6870:5493:b0:1a7:f79c:2fbc with SMTP id
 f19-20020a056870549300b001a7f79c2fbcmr7716788oan.0.1694724454843; Thu, 14 Sep
 2023 13:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230907193515.7-1-francois.dugast@intel.com>
 <ef36eb06-d65b-6ad4-ac4f-f1fb2ba7a544@habana.ai>
 <tl37n5qledvt7yxce5sl4byon6puewxvs3ymfebsndnolwstg3@3fjfvpuzna5b>
 <fede72f2-e542-8308-fcb4-ad37ae058154@habana.ai>
 <20230912002541.GD2706891@mdroper-desk1.amr.corp.intel.com>
 <23515ffe-c397-21a9-94b5-e28f5b26fd64@habana.ai> <87v8cfd4t7.fsf@intel.com>
 <d763fd15-0732-8cd2-a24f-055a5855544a@habana.ai> <87h6nxw3rl.fsf@intel.com>
 <0d208249-a467-9c35-4c38-2bd9dd56f611@habana.ai>
In-Reply-To: <0d208249-a467-9c35-4c38-2bd9dd56f611@habana.ai>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 14 Sep 2023 22:47:23 +0200
Message-ID: <CAKMK7uETpBgGGBesKZjBB+aYbfN3UA29OSksADY8FVvFKL=wtw@mail.gmail.com>
To: Ofir Bitton <obitton@habana.ai>, "airlied@gmail.com" <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Remove MMIO ioctl
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 14 Sept 2023 at 16:21, Ofir Bitton <obitton@habana.ai> wrote:
>
> On 14/09/2023 11:35, Jani Nikula wrote:
> > On Tue, 12 Sep 2023, Ofir Bitton <obitton@habana.ai> wrote:
> >> On 12/09/2023 14:11, Jani Nikula wrote:
> >>> On Tue, 12 Sep 2023, Ofir Bitton <obitton@habana.ai> wrote:
> >>>> On 12/09/2023 3:25, Matt Roper wrote:
> >>>> Hey Matt, I totally undesrstand your concern, I might have another
> >>>> suggestion. We can create another FD in debugfs and move this ioctl
> >>>> there (I can take ownership on this), This way ABI is not an issue.
> >>>
> >>> FD or ioctl in debugfs? Or do you just mean adding a debugfs file for
> >>> register access?
> >>>
> >>> BR,
> >>> Jani.
> >>>
> >>
> >> Add a new file in debugfs to which we will send debug ioctls such as the
> >> mmio ioctl.
> >
> > It's so rare to do ioctl on debugfs files that I first had to check it's
> > possible, and then try to find examples in the kernel. I found one so
> > far, though there are probably more.
> >
> > If it's that rare, usually the question is, does it make sense?
> >
> >
> > BR,
> > Jani.
> >
> >
>
> I actually got this idea from Daniel few months back during a different
> discussion. Daniel any thoughts on this?

So the backstory is that some simulation interface for gaudi used a
chardev node, for the efficiency/flexibilty of ioctl. Which for
upstream is a no-go, we really don't want to make val/sim stuff stable
uapi. But in general I'm very much welcome to upstreaming
debug/sim/val infrastructure, anything that's reasonable and reduces
the delta against internal/downstream trees is good, and the ioctl
interface seems like the right fit, and the stable uapi issue can be
avoided by moving it all into debugfs.

That's how the debugfs-with-ioctl idea was born.

Now since it's debugfs I really don't care much (but maybe
double-check with Dave Airlie), as long as we don't go overboard and
use ioctl for absolutely everything just because we can. Because in
general I think debugfs should be human readable and useable with just
commandline, very often that's really the most convenient interface.
But if we need something where ioctl is just the better fit, then yeah
ioctl in debugfs is imo ok.

Cheers!

> If you are uncomfortable with the ioctl approach we can go with a
> different approach, for example what we did in the habanalabs driver:
>
> setting read/write address:
> https://elixir.bootlin.com/linux/v6.6-rc1/source/drivers/accel/habanalabs/common/debugfs.c#L1630
>
> read32:
> https://elixir.bootlin.com/linux/v6.6-rc1/source/drivers/accel/habanalabs/common/debugfs.c#L844
>
> I liked the ioctl approach so much because it requires a single system
> call instead of 2 and the implementation is much cleaner.
>
> Ofir.
>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
