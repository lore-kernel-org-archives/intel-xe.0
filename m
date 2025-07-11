Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2ABC83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 08:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B4710E9D4;
	Fri, 11 Jul 2025 08:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="MIY5eMnl";
	dkim-atps=neutral
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FED910E9D5
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 08:59:27 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso1340783f8f.1
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 01:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752224366; x=1752829166; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HU8F6jqBbjB/UsB5kvfb0xJ7+1DHFZF+cyN3uGB+/QE=;
 b=MIY5eMnlZ02i2O5d2/f7eqUMbnT7bUNHD4g9MgUHy8MbySvKz6nrhF3FtbGH1AGIKo
 Y4qIe7Q2AGpbBretU695iUcUzotSwbFjMg5GI9PqZb+eXyXR4iChRoQ+lEG3v38/z1wh
 3jsaYkBuy1mAnFekFK3v15+SULsZabUh0IW6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752224366; x=1752829166;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HU8F6jqBbjB/UsB5kvfb0xJ7+1DHFZF+cyN3uGB+/QE=;
 b=FSIPjCx2a73vYY/OIupioR+1Gfp8DxbC8HqcGVCu5GcvXya6wvP+ANy8/zPNFBl1a9
 Un8TFsnXdM8VYbmifxZmeJqEzLlGWUy9wme6bmO/QjQ9BzFVwbub9AB1yyL7ou4z3a/O
 Rhj/mUA1mWJLFg7nTplqvC+muqTHyUe7Y/gZP2mVSHJltcBBp8Uhh+nM71UmR9YmjN2B
 un1ETi4oeb+bHrCwXU9CrfJCWpkvMSGxv3MrhE7aLoYvXsWgfviubZrlQB4EicvOl90L
 ljQ7+drUu6b4HmgKjM18ceQy+lLgrXLtKO7vLnj8mFjjVJhGcIJILKZMGuL+9T5p9NmB
 CI3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFFU+V+kcFzKM06XTeZlXYnR+UvwZL7QHGsKwm6ckR5i9jv2WOizQ7a0DukTC4ImwZeFVP2MS2mQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgButoSuDqgmTqG/cHfCEHd0DMEn+R86vIDqlpHTF74oL9j390
 QeyQruTmy+tML/KrY0lTKBpHARSMI9VqFcZwOYJ/ac8p/OviZ7FktfIuiXfn+1ReitM=
X-Gm-Gg: ASbGncvAnPtHl3RXPVeJR8vI59dEGK0oCtpGQf7WRMOB9xcCpw6bJw8Fccb9Ly8JMcU
 Fa5Bb+Ne6QmnsRX54ZJ9xeCAT9a1YbjV5+ZcVBlihjwWC/p1r1+vZ8Yv+SU/crEsRDFSi85n48P
 49XMxn0+Uo5h3584w2rspmJduACN6DojF7UMFtU/eGTUuhXEx8ahFXQinGYALb4ZUTkssvqbh/L
 Y0nX1YKuOtWxH5qDTh9/aA2VixtBJHVfxb6Kc6YeW1R4oS4hPz2svinz+FmFmFVyntB19SHjtUc
 kh0pkLwuUXeHh+0q7zDITIgkm6Xq5CxPQ+Fqv7jqkUXbHWeLt8v9UEchEtlMLrpTjvqB15KsAqp
 eK/TBXo49uuqqCG8M3oJ97fzxA7OwDZIX4A==
X-Google-Smtp-Source: AGHT+IFkP6lHJxiSi/hSjhxewMMkIXW56pkXASr3onum7RIYU0aXJX527P0t6fO3x/D8kSCoumSSpg==
X-Received: by 2002:a05:6000:2809:b0:3b5:e29c:190 with SMTP id
 ffacd0b85a97d-3b5f18dc7a3mr1547544f8f.29.1752224365562; 
 Fri, 11 Jul 2025 01:59:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd537d12sm40897815e9.24.2025.07.11.01.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 01:59:25 -0700 (PDT)
Date: Fri, 11 Jul 2025 10:59:23 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Raag Jadav <raag.jadav@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 1/9] drm: Add a vendor-specific recovery method to
 device wedged uevent
Message-ID: <aHDSawMTgaIEWoMw@phenom.ffwll.local>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-2-riana.tauro@intel.com>
 <aG5xglf8BeGzleWM@phenom.ffwll.local>
 <d42e17ef-30ce-4bf1-9948-7f08fd6f3bac@amd.com>
 <aG56Trd1h5WbWYJt@black.fi.intel.com> <aG6eNcygPshsSlC8@intel.com>
 <aG-BcFN6M9BtjB2j@phenom.ffwll.local>
 <cd206f9e-be53-4b22-a166-ed18fa9b833a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd206f9e-be53-4b22-a166-ed18fa9b833a@amd.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Thu, Jul 10, 2025 at 11:37:14AM +0200, Christian König wrote:
> On 10.07.25 11:01, Simona Vetter wrote:
> > On Wed, Jul 09, 2025 at 12:52:05PM -0400, Rodrigo Vivi wrote:
> >> On Wed, Jul 09, 2025 at 05:18:54PM +0300, Raag Jadav wrote:
> >>> On Wed, Jul 09, 2025 at 04:09:20PM +0200, Christian König wrote:
> >>>> On 09.07.25 15:41, Simona Vetter wrote:
> >>>>> On Wed, Jul 09, 2025 at 04:50:13PM +0530, Riana Tauro wrote:
> >>>>>> Certain errors can cause the device to be wedged and may
> >>>>>> require a vendor specific recovery method to restore normal
> >>>>>> operation.
> >>>>>>
> >>>>>> Add a recovery method 'WEDGED=vendor-specific' for such errors. Vendors
> >>>>>> must provide additional recovery documentation if this method
> >>>>>> is used.
> >>>>>>
> >>>>>> v2: fix documentation (Raag)
> >>>>>>
> >>>>>> Cc: André Almeida <andrealmeid@igalia.com>
> >>>>>> Cc: Christian König <christian.koenig@amd.com>
> >>>>>> Cc: David Airlie <airlied@gmail.com>
> >>>>>> Cc: <dri-devel@lists.freedesktop.org>
> >>>>>> Suggested-by: Raag Jadav <raag.jadav@intel.com>
> >>>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> >>>>>
> >>>>> I'm not really understanding what this is useful for, maybe concrete
> >>>>> example in the form of driver code that uses this, and some tool or
> >>>>> documentation steps that should be taken for recovery?
> >>
> >> The case here is when FW underneath identified something badly corrupted on
> >> FW land and decided that only a firmware-flashing could solve the day and
> >> raise interrupt to the driver. At that point we want to wedge, but immediately
> >> hint the admin the recommended action.
> >>
> >>>>
> >>>> The recovery method for this particular case is to flash in a new firmware.
> >>>>
> >>>>> The issues I'm seeing here is that eventually we'll get different
> >>>>> vendor-specific recovery steps, and maybe even on the same device, and
> >>>>> that leads us to an enumeration issue. Since it's just a string and an
> >>>>> enum I think it'd be better to just allocate a new one every time there's
> >>>>> a new strange recovery method instead of this opaque approach.
> >>>>
> >>>> That is exactly the opposite of what we discussed so far.
> > 
> > Sorry, I missed that context.
> > 
> >>>> The original idea was to add a firmware-flush recovery method which
> >>>> looked a bit wage since it didn't give any information on what to do
> >>>> exactly.
> >>>>
> >>>> That's why I suggested to add a more generic vendor-specific event
> >>>> with refers to the documentation and system log to see what actually
> >>>> needs to be done.
> >>>>
> >>>> Otherwise we would end up with events like firmware-flash, update FW
> >>>> image A, update FW image B, FW version mismatch etc....
> > 
> > Yeah, that's kinda what I expect to happen, and we have enough numbers for
> > this all to not be an issue.
> > 
> >>> Agree. Any newly allocated method that is specific to a vendor is going to
> >>> be opaque anyway, since it can't be generic for all drivers. This just helps
> >>> reduce the noise in DRM core.
> >>>
> >>> And yes, there could be different vendor-specific cases for the same driver
> >>> and the driver should be able to provide the means to distinguish between
> >>> them.
> >>
> >> Sim, what's your take on this then?
> >>
> >> Should we get back to the original idea of firmware-flash?
> > 
> > Maybe intel-firmware-flash or something, meaning prefix with the vendor?
> > 
> > The reason I think it should be specific is because I'm assuming you want
> > to script this. And if you have a big fleet with different vendors, then
> > "vendor-specific" doesn't tell you enough. But if it's something like
> > $vendor-$magic_step then it does become scriptable, and we do have have a
> > place to put some documentation on what you should do instead.
> > 
> > If the point of this interface isn't that it's scriptable, then I'm not
> > sure why it needs to be an uevent?
> 
> You should probably read up on the previous discussion, cause that is
> exactly what I asked as well :)
> 
> And no, it should *not* be scripted. That would be a bit brave for a
> firmware update where you should absolutely not power down the system
> for example.

I guess if we clearly state that this is for manual recovery only, or for
cases where you exactly know what you're doing (fleet-specific scripts
instead of generic distros), I guess this very opaque code makes sense.

But we should clearly document then that doing anything scripted here is
very much "you get to keep the pieces", and definitely don't try to do
something fancy generic.

Which without documentation is just really confusing when some of the
other error codes clearly look like they're meant to facilitate scripted
recovery.

> In my understanding the new value "vendor-specific" basically means it
> is a known issue with a documented solution, while "unknown" means the
> driver has no idea how to solve it.

I think that's another detail which should be documented clearly.
-Sima
> 
> Regards,
> Christian.
> 
> > I guess if you all want to stick with vendor-specific then I think that's
> > ok with me too, but the docs should at least explain how to figure out
> > from the uevent which vendor you're on with a small example. What I'm
> > worried is that if we have this on multiple drivers userspace will
> > otherwise make a complete mess and might want to run the wrong recovery
> > steps.
> > 
> > I think ideally, no matter what, we'd have a concrete driver patch which
> > then also comes with the documentation for what exactly you're supposed to
> > do as something you can script. And not just this stand-alone patch here.
> > 
> > Cheers, Sima
> >>
> >>>
> >>> Raag
> >>>
> >>>>>> ---
> >>>>>>  Documentation/gpu/drm-uapi.rst | 9 +++++----
> >>>>>>  drivers/gpu/drm/drm_drv.c      | 2 ++
> >>>>>>  include/drm/drm_device.h       | 4 ++++
> >>>>>>  3 files changed, 11 insertions(+), 4 deletions(-)
> >>>>>>
> >>>>>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> >>>>>> index 263e5a97c080..c33070bdb347 100644
> >>>>>> --- a/Documentation/gpu/drm-uapi.rst
> >>>>>> +++ b/Documentation/gpu/drm-uapi.rst
> >>>>>> @@ -421,10 +421,10 @@ Recovery
> >>>>>>  Current implementation defines three recovery methods, out of which, drivers
> >>>>>>  can use any one, multiple or none. Method(s) of choice will be sent in the
> >>>>>>  uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
> >>>>>> -more side-effects. If driver is unsure about recovery or method is unknown
> >>>>>> -(like soft/hard system reboot, firmware flashing, physical device replacement
> >>>>>> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
> >>>>>> -will be sent instead.
> >>>>>> +more side-effects. If recovery method is specific to vendor
> >>>>>> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
> >>>>>> +specific documentation for further recovery steps. If driver is unsure about
> >>>>>> +recovery or method is unknown, ``WEDGED=unknown`` will be sent instead
> >>>>>>  
> >>>>>>  Userspace consumers can parse this event and attempt recovery as per the
> >>>>>>  following expectations.
> >>>>>> @@ -435,6 +435,7 @@ following expectations.
> >>>>>>      none            optional telemetry collection
> >>>>>>      rebind          unbind + bind driver
> >>>>>>      bus-reset       unbind + bus reset/re-enumeration + bind
> >>>>>> +    vendor-specific vendor specific recovery method
> >>>>>>      unknown         consumer policy
> >>>>>>      =============== ========================================
> >>>>>>  
> >>>>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> >>>>>> index cdd591b11488..0ac723a46a91 100644
> >>>>>> --- a/drivers/gpu/drm/drm_drv.c
> >>>>>> +++ b/drivers/gpu/drm/drm_drv.c
> >>>>>> @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
> >>>>>>  		return "rebind";
> >>>>>>  	case DRM_WEDGE_RECOVERY_BUS_RESET:
> >>>>>>  		return "bus-reset";
> >>>>>> +	case DRM_WEDGE_RECOVERY_VENDOR:
> >>>>>> +		return "vendor-specific";
> >>>>>>  	default:
> >>>>>>  		return NULL;
> >>>>>>  	}
> >>>>>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> >>>>>> index 08b3b2467c4c..08a087f149ff 100644
> >>>>>> --- a/include/drm/drm_device.h
> >>>>>> +++ b/include/drm/drm_device.h
> >>>>>> @@ -26,10 +26,14 @@ struct pci_controller;
> >>>>>>   * Recovery methods for wedged device in order of less to more side-effects.
> >>>>>>   * To be used with drm_dev_wedged_event() as recovery @method. Callers can
> >>>>>>   * use any one, multiple (or'd) or none depending on their needs.
> >>>>>> + *
> >>>>>> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
> >>>>>> + * details.
> >>>>>>   */
> >>>>>>  #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
> >>>>>>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
> >>>>>>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
> >>>>>> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
> >>>>>>  
> >>>>>>  /**
> >>>>>>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> >>>>>> -- 
> >>>>>> 2.47.1
> >>>>>>
> >>>>>
> >>>>
> > 
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
