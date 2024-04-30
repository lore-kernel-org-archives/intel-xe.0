Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE9CC10F1A
	for <intel-xe@archiver.kernel.org>; Wed,  1 May 2024 16:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85A4112381;
	Wed,  1 May 2024 16:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Ocmke1vm";
	dkim-atps=neutral
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA3C10E11F
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 13:30:01 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-34cba0d9a3eso143333f8f.1
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 06:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1714483800; x=1715088600; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fez5FshotDgqPDjvhQ+Fu0cD6X/ZgD5uxwNqXUp1qVI=;
 b=Ocmke1vmIFjrdg3mMMjfgsjwYfOx7ymseRur4LvLB5aVppJyinNF8TcckVYXW5IKSS
 Wdt1HIh+aQoQGWbH6lM2r58XRPkBdGu5y7nioFU3qEr1wPfP7bQvJtGIak/korwgn+yq
 wICo1dmA/XxNqEJYHusciN9keRK78Q2rfaRmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714483800; x=1715088600;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fez5FshotDgqPDjvhQ+Fu0cD6X/ZgD5uxwNqXUp1qVI=;
 b=nXc+v5AXc2aASKllFviVJ2UnqxjTTkVYCODIY+mp/fxAK0Zg56RorO4SwNvVZqpXx6
 VVvgFE1QSIANzE3Dw0hVVXqwx+79HLd1hbRC8Yk5uw9TEeCKZ/aDVerFNQuUPZL5yIap
 AHlAV6632AVFuH0w7qT346KyfLFGpKRqMD2iiJ6tE5brHabbqXEkJEwQOq8hFrwWz91Q
 YtAxxIdZlf48ZNTUeE0X7zmMDHid/8ODVFbRRY53fRnnBTvNl1JM38DavrUsyb2jOXry
 cSY2M2+2gJPVJivY22smRq3jyI1JO2WbNhQ4IA99/E3M96Gpx7HFCTcUHtmk9+Uug3/s
 Intg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJvxWKvIHBcZV4ahHcb82BjjilVR24YAWJYbEDKpCMkJTH8ZcBoWyMFpFjWkF0u++Nhz3U0oNiwNoiNPX4ubEfkKZzwvC5XFZ+8wTYh1M=
X-Gm-Message-State: AOJu0Yza2hjIBBX099TmNT5qQMaB4YR/CsRMbzXRsYr0JVvJWSqLrrLk
 LARB67chA70z62dUm2Vy4jDLtaQMbU0jDzl2HVvTD63V2xOIfWwGouETa0vA/2o=
X-Google-Smtp-Source: AGHT+IFmbGrzLzdSJErP57jfvCCVh2UEsqJMRXiZGVi1oiQjBg8XcIdJ+s3HYYHCYAEmSC4Q8wG06w==
X-Received: by 2002:a5d:6903:0:b0:34d:b05b:c784 with SMTP id
 t3-20020a5d6903000000b0034db05bc784mr230849wru.7.1714483799960; 
 Tue, 30 Apr 2024 06:29:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a05600c4ec700b0041c14061c71sm9546207wmq.15.2024.04.30.06.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 06:29:59 -0700 (PDT)
Date: Tue, 30 Apr 2024 15:29:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 aravind.iddamsetty@linux.intel.com, michal.winiarski@intel.com,
 intel-xe@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: drmm vs devm (was Re: [PATCH 2/8] drm/xe: covert sysfs over to devm)
Message-ID: <ZjDyVfJ1QFKQlG_4@phenom.ffwll.local>
References: <20240429121436.33013-9-matthew.auld@intel.com>
 <20240429121436.33013-10-matthew.auld@intel.com>
 <Zi-gYDEFzI_bXCzP@intel.com>
 <wtqag5pd5plbiubuhypzdr7jitxutcfbft2xtchwx3fbf4zzfm@pmokwtkmlnf4>
 <2b6f8692-79ad-4976-99ae-c2b227b893d9@intel.com>
 <Zi_qxhMrrlUc7hBz@intel.com>
 <7ik4xh7hncw6h62zvmv7vr43a3aedn3ft7sxv4xjvnf3glf2g6@h72yiizlvqje>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ik4xh7hncw6h62zvmv7vr43a3aedn3ft7sxv4xjvnf3glf2g6@h72yiizlvqje>
X-Operating-System: Linux phenom 6.6.15-amd64 
X-Mailman-Approved-At: Wed, 01 May 2024 16:45:06 +0000
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

Adding dri-devel because this is kinda more important.

On Mon, Apr 29, 2024 at 04:28:42PM -0500, Lucas De Marchi wrote:
> On Mon, Apr 29, 2024 at 02:45:26PM GMT, Rodrigo Vivi wrote:
> > On Mon, Apr 29, 2024 at 04:17:54PM +0100, Matthew Auld wrote:
> > > On 29/04/2024 14:52, Lucas De Marchi wrote:
> > > > On Mon, Apr 29, 2024 at 09:28:00AM GMT, Rodrigo Vivi wrote:
> > > > > On Mon, Apr 29, 2024 at 01:14:38PM +0100, Matthew Auld wrote:
> > > > > > Hotunplugging the device seems to result in stuff like:
> > > > > >
> > > > > > kobject_add_internal failed for tile0 with -EEXIST, don't try to
> > > > > > register things with the same name in the same directory.
> > > > > >
> > > > > > We only remove the sysfs as part of drmm, however that is tied to the
> > > > > > lifetime of the driver instance and not the device underneath. Attempt
> > > > > > to fix by using devm for all of the remaining sysfs stuff related to the
> > > > > > device.
> > > > >
> > > > > hmmm... so basically we should use the drmm only for the global module
> > > > > stuff and the devm for things that are per device?
> > > >
> > > > that doesn't make much sense. drmm is supposed to run when the driver
> > > > unbinds from the device... basically when all refcounts are gone with
> > > > drm_dev_put().  Are we keeping a ref we shouldn't?
> > > 
> > > It's run when all refcounts are dropped for that particular drm_device, but
> > > that is separate from the physical device underneath (struct device). For
> > > example if something has an open driver fd the drmm release action is not
> > > going to be called until after that is also closed. But in the meantime we
> > > might have already removed the pci device and re-attached it to a newly
> > > allocated drm_device/xe_driver instance, like with hotunplug.
> > > 
> > > For example, currently we don't even call basic stuff like guc_fini() etc.
> > > when removing the pci device, but rather when the drm_device is released,
> > > which sounds quite broken.
> > > 
> > > So roughly drmm is for drm_device software level stuff and devm is for stuff
> > > that needs to happen when removing the device. See also the doc for drmm:
> > > https://elixir.bootlin.com/linux/v6.8-rc1/source/drivers/gpu/drm/drm_managed.c#L23
> > > 
> > > Also: https://docs.kernel.org/gpu/drm-uapi.html#device-hot-unplug
> 
> yeah... I think you convinced me

So rule of thumb:

- devm is for hardware stuff, so like removeing pci mmaps, releasing
  interrupt handlers, cleaning up anything hw related. Because after devm
  respective driver unbind, all that stuff is gone, _even_ when you hold
  onto a struct device reference. Because all that struct device
  reference guarantees is that the software structure stays around as a
  valid memory reference.

- devm is also for remove uapi. Unfortunately we're not quite at the world
  where devm_drm_dev_register is possible, because on the unload side that
  must be done first, and there's still a few things drivers need to do
  after that which isn't fully devm/drmm-ified.

- drmm is for anything software related, so data structures and stuff like
  that. If you have a devm_kmalloc, you very, very likely have a bug. This
  is were you tear down all your software datastructures, which means if
  you have that interleaved with the hw teardown in e.g. guc_fini you have
  some serious work cut out for you. drmm stuff is tied to the drm_device
  lifetime as the core drm uapi interface thing which might stick around
  for much longer than the drm_dev_unregister.

- Finally, when going from the sw side to hw side you must wrap such
  access with drm_dev_enter/exit, or you have races. This is also where
  using drmm and devm for everything really helps, because it gives you a
  very strong hint when you're going from the sw world to the hw world.

  As an example, all the callbacks on the various kms objects are in the
  sw world (so need to be cleaned up with drmm), but the moment you access
  hw (e.g. any mmio) you need to protect that with a drm_dev_enter/exit

Using devm for everything means you have a use-after-free on the sw side,
otoh using devm means you have use-after-free on the hw side (like a
physical hotunplug might reallocate your mmio range to another thunderbolt
device that has been plugged in meanwhile).

It's definitely big time fun all around :-/

Oh also, please help improve the docs on this stuff, I'm trying to make
sure it's all there and ideally the various pieces link to the other
parts, but it's tricky and I understand this stuff to much to spot the
gaps ...

Cheers, Sima

> 
> > 
> > Cc: Aravind and Michal since this likely relates to the FLR discussion...
> > 
> > but it looks to me that we should move more towards the devm_ and limit
> > the usage of drmm_ to some very specific cases...
> 
> agreed,
> 
> Lucas De Marchi
> 
> > 
> > > 
> > > >
> > > > Lucas De Marchi

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
