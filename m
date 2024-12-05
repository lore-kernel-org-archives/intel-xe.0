Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAB9E77173
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 19:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8776010EF99;
	Thu,  5 Dec 2024 19:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AovqSWGK";
	dkim-atps=neutral
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAEF310EF9D
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 19:39:26 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-3001f123009so10279111fa.3
 for <intel-xe@lists.freedesktop.org>; Thu, 05 Dec 2024 11:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733427565; x=1734032365; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V/JR6tqjUEHZEvMHz1vJRKFUVCynxiJpP8/fbgMYoVQ=;
 b=AovqSWGKpHozLF44SFEo2JIQ5s0auo9GWdU7PPYiFTXEBmwDsVhnvsGqjRqiw4i7rt
 1xUV3ienL+/EQ+rFsMV+dT96cGH3m0xYX/zKtLbeXkpK9HDYYa9oRwu72A1nVaMg39eY
 nxN4rOf8jCu2/mfG/kuGsR2zIf8h/ZHepTnRknSq0sG6CYopjVjQHd/wJkp5XjTbd+BE
 xy9xrMonGcvG2CDHbHfcluMrXpoS8h7Isszgs9JmPhw/zNArPaQ+MPR78o3u3WGE9ifP
 fnWtYqXPkanE61BJHmEED9Gu9aQJP2AXlU7wS2MUhG+2fg2jMLCLEsWqyxb8IecAG2xD
 TPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733427565; x=1734032365;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V/JR6tqjUEHZEvMHz1vJRKFUVCynxiJpP8/fbgMYoVQ=;
 b=Gso5+4Y99qCBBvwf3JUCkuJygnFiKcSNRY3PcROJYjD56KUY58A6ivCkJS3QG06JGN
 t8gH410vkVAD427pZ8LW7GMHoitU4HeDqgjUWMSQSRipz93R/0iaOr5gW4PVHXW+L55n
 enmp1Y2WU6AvKcR+WLymN4oMvtwtKxXv54d2E9cyDe1Ib6g479p4H8L06ZWrOtBBJqA5
 e5fUpWbRaFvQfA9sRv7Et8XL14RAEKDt4QlEZ5n4ODFtes5CHV5i736MTk/h21QFDHE6
 ADdCcs6nj8fttmqcyVEXPVyBJXHE2ym97t3noJAfMM/fiWTbMk1zVIaLmjTv6AUEnUuN
 48Pg==
X-Gm-Message-State: AOJu0YyPYibtqu+NcunC8oDS97tWw99Dhk9NkT+qWzAPMXbaYUiYNtla
 4pxOcJi85mZg5P5mNVZIHX4sihWnThv++mFK6iLMgfQ1Kaq68PBasimDea7m+gA=
X-Gm-Gg: ASbGnctKAQBktHX6jgOl1H70Z25ef2a/MZRL8RFg2OY26R9JWfUATz/qKXFke4hzxF9
 qyCr0z+oYQj5nVXC1PYTkLGwWu6JL9ONvfx48gsMduFnXlYtTSCd6w/2U6bzAG0sxGrMf0NF31B
 MtgbTeGv87ixkqxC2PFrtHgXrF4YhgsxZmneSzvcasFTCFmPLhRBVxiA4daYpdnBC5zp1Z/EZ3A
 QAad8nQdFgwFZCAAFLSXh3iEreX2k+nYY+uoomcv9qgm8270QJGz/9kjnyNYcOOAR087mNV07hI
 SiGUEb4SzHYSAA9JXST3rJxGJ/LSuQ==
X-Google-Smtp-Source: AGHT+IFp4xulhZ02HEDAfcow6EI4I5Rc4PDVSiHBDYKEjN3lJ/as2VygnDosiTN5ElT9z0g8pyhVNg==
X-Received: by 2002:a2e:8088:0:b0:300:2c32:4c39 with SMTP id
 38308e7fff4ca-3002fc6445fmr493911fa.32.1733427564979; 
 Thu, 05 Dec 2024 11:39:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30020dbbd97sm2852951fa.65.2024.12.05.11.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 11:39:23 -0800 (PST)
Date: Thu, 5 Dec 2024 21:39:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCHv2 01/10] drm/crtc: Add histogram properties
Message-ID: <fev637ue37cbc5bstvqqvstserp75khqewpof3pc4loshnpghl@vp33ww6i6rdn>
References: <20241204091456.1785858-1-arun.r.murthy@intel.com>
 <s3gkb36ga2pxmxocrhcjp5pcgbewx4x3joiyrpld3th4r4fvyi@rkpgbu4ekst3>
 <IA0PR11MB7307F22883ACF3AD873C3697BA302@IA0PR11MB7307.namprd11.prod.outlook.com>
 <CAA8EJpp4HjyEL9XSLzXr6tG7+8M2FmZO1S2WrLXmP64J_aKs-w@mail.gmail.com>
 <DM4PR11MB7302BD8409DEC33EF2F1B0BFBA302@DM4PR11MB7302.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM4PR11MB7302BD8409DEC33EF2F1B0BFBA302@DM4PR11MB7302.namprd11.prod.outlook.com>
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

On Thu, Dec 05, 2024 at 04:29:55PM +0000, Murthy, Arun R wrote:
> > > > -----Original Message-----
> > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Sent: Wednesday, December 4, 2024 5:17 PM
> > > > To: Murthy, Arun R <arun.r.murthy@intel.com>
> > > > Cc: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org;
> > > > dri- devel@lists.freedesktop.org
> > > > Subject: Re: [PATCHv2 01/10] drm/crtc: Add histogram properties
> > > >
> > > > On Wed, Dec 04, 2024 at 02:44:56PM +0530, Arun R Murthy wrote:
> > > > > Add variables for histogram drm_property, its corrsponding
> > > > > crtc_state variables and define the structure pointed by the blob property.
> > > > > struct drm_histogram defined in include/uapi/drm/drm_mode.h The
> > > > > blob data pointer will be the address of the struct drm_histogram.
> > > > > The struct drm_histogram will be used for both reading the
> > > > > histogram and writing the image enhanced data.
> > > > > struct drm_histogram {
> > > > >     u64 data_ptr;
> > > > >     u32 nr_elements;
> > > > > }
> > > > > The element data_ptr holds the address of the histogram statistics
> > > > > data and 'nr_elements' represents the number of elements pointed
> > > > > by the pointer held in data_ptr.
> > > > > The same element data_ptr in teh struct drm_histogram when writing
> > > > > the image enahnced data from user to KMD holds the address to pixel
> > factor.
> > > > >
> > > > > v2: Added blob description in commit message (Dmitry)
> > > >
> > > > No, it is not a proper description. What is the actual data format
> > > > inside the blob? If I were to implement drm_histogram support for e.g.
> > > > VKMS, what kind of data should the driver generate? What is the
> > > > format of the response data from the userspace app? The ABI
> > > > description should allow an independent but completely compatible
> > > > implementation to be written from scratch.
> > > >
> > > The histogram is generated by the hardware.
> > > Histogram represents integer which is the pixel count and when it
> > > comes to the IET(Image Enhancement) to be written back to hardware its
> > > again an integer, pixel factor.
> > > Is this the information that you expected to be added or something else?
> > 
> > You are defining the interface between the kernel and userspace. The interface
> > should be defined in a way that allows us (developers) to understand the data,
> > make a decision whether it fits a generic namespace (which means that other
> > drivers must be able to implement the same interface), it fits namespace
> > specific to i915 / Xe (then we will have platform-specific properties for the
> > feature that might be implemented by other platforms) or it doesn't fit
> > anything at all.
> > 
> Sure will add the above information in the commit message and also in the kernel doc.
> If there are no other review comments, then I will push the next version of patch implementing your comments.
> 
> > So the documentation must contain the specification of the binary data inside
> > the blobs. An IGT, modetest or some other compositor must be able to parse
> > the data and generate (some) response without using your library.
> > 
> IGT patch can be located at https://patchwork.freedesktop.org/series/135789/ This include test with and without library.
> The corresponding compositor changes can be located at https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873/diffs?commit_id=270808ca7c8be48513553d95b4a47541f5d40206

I know. But that's not a replacement for the documentation. Can I
implement an alternative implementation without using your library?

> 
> Thanks and Regards,
> Arun R Murthy
> --------------------

-- 
With best wishes
Dmitry
