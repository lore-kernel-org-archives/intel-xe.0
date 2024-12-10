Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E57CE77182
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 12:27:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DAA10E395;
	Tue, 10 Dec 2024 12:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lD6boal5";
	dkim-atps=neutral
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0377810E3A6
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 12:27:10 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5401d3ea5a1so2281353e87.3
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 04:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733833628; x=1734438428; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TLgFp1RmX3UnNxnp9DUX+wn/yHzpzgzjVvUXeTz82s8=;
 b=lD6boal5nLznXPjK7hkt0uLm6SBoETiM15ewBal6EK2dEMaUUaJCCT2RmWJhb5tigR
 Av15b8bZorbsn8B/2pbN1Uv2rOM15dt7X1BOcyaS/EpM196KRx6RKNwhuzvnKtm0Mm4J
 5v2MXq0AcUK7TJ1/9jGIEwZowtbrAw4JFvekkl4vD87LbqMIdzLZj8KryPd51Vay2bFz
 TZRGcIBoHljueUvPTZhLu+xyMsPFZtuKXUsi2sncUQElEfTTW8nf0lTEDRYaFxMEY14+
 7v6D/sojezCPcqXEfbNdIoUvioV1/IYE6dvM+LPERjugGQ0Rr0fDFZKJiiIfkOQldzfy
 jNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733833628; x=1734438428;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TLgFp1RmX3UnNxnp9DUX+wn/yHzpzgzjVvUXeTz82s8=;
 b=YsjZbDsu7Kt4lp/UmwOTDrpWivXjB9ilM9jPNmkVm9tu3uFdagEJfbWnXqJZOJgfs2
 qkCjoL+n9ySJcjLZlk9vWdza6g7cz/ntVap/u9Triv3aowMrHVnxEj1MsUCuogXxwqqr
 /YvI0x4Zoddah3+oOvx31clLl6DN5UWkGr82489nP+BAKWP8oTT1o2jItw3OJ6jI++/i
 pPw1E4C7HrEmTKuPypNBel/Y3pL1utKsM1VBvX/7L45cYdZ6ch2XWpEmxxGl3Kc6Y6FV
 Tq/mrFoE686xsREsbqO8/VijMxO6C7nhkuq8XLeOZoZexvWZRvfDi5rmZAurjmD9ON7h
 QGDw==
X-Gm-Message-State: AOJu0Yx5H4haYLa14VelsYvO7Mr9ROQo1JZWi327w5yLf0XBFiqIb32j
 YFxFijLV7hj+r+J5xp0GatUyLqozGB8CqFXrJp0BgoDn9WAgqNrbGWKYdunuOoI=
X-Gm-Gg: ASbGncvexnvhYl3aAXkAB47yKkCNAEOmw0Mad1jhxUgkOOjzimCtNOYDlCDotSNef7G
 sa2knA5z1SUHlDyZAtWvdK1OewlTXxMbbLbkY5brzGPRb8Pvur8D3IIRpw6s4OHNNI6QnoO4KkN
 O2+lb370U4zGcrWPlCV0P7iw8xDLovVpFVKfworT819anrOWuw0JXCZsSVm3w3gBdjGA2Q5j3E7
 YYRX3L8mWdOlEwUiKKL6tXLoNnfoKdAIvt4SZi7vvIfUhJiN3E7YaF3Y8WLOSg4dNfaNY/GYIbO
 p2AlYUXTgV7qHLPimDZDirstZjA8f1Vk/Q==
X-Google-Smtp-Source: AGHT+IEbQPT7YZlDlrRsdfMjgNLFXOBAjBsyY2abWlqzvZLvimYnTcVTLCYE3D43KyGE9HtxaadCDw==
X-Received: by 2002:a05:6512:2393:b0:540:20f5:be77 with SMTP id
 2adb3069b0e04-540240ae79emr1484431e87.3.1733833627939; 
 Tue, 10 Dec 2024 04:27:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53f4a974824sm990494e87.147.2024.12.10.04.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 04:27:07 -0800 (PST)
Date: Tue, 10 Dec 2024 14:27:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCHv3 01/10] drm/crtc: Add histogram properties
Message-ID: <l6dpikqfgwlio5rungx4ckvw524woz4mybkiqfp4k5fpkokj2c@zox6yfhxnzeh>
References: <20241209162504.2146697-1-arun.r.murthy@intel.com>
 <20241209162504.2146697-2-arun.r.murthy@intel.com>
 <7tho6j262nzbu6nvjgzelsu3ljjipxdhazjlzdfa3xi2lbn3vs@bx55yrrbmshg>
 <IA0PR11MB7307E1C101F417CFAE3B114ABA3D2@IA0PR11MB7307.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB7307E1C101F417CFAE3B114ABA3D2@IA0PR11MB7307.namprd11.prod.outlook.com>
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

On Tue, Dec 10, 2024 at 08:42:36AM +0000, Murthy, Arun R wrote:
> > On Mon, Dec 09, 2024 at 09:54:55PM +0530, Arun R Murthy wrote:
> > > Add variables for histogram drm_property, its corrsponding crtc_state
> > > variables and define the structure pointed by the blob property.
> > >
> > > struct drm_histogram and drm_iet defined in
> > > include/uapi/drm/drm_mode.h
> > >
> > > The property HISTOGRAM_ENABLE allows user to enable/disable the
> > > histogram feature in the hardware. Upon KMD enabling by writing to the
> > > hardware registers, a histogram is generated. Histogram is composed of
> > > 'n' bins with each bin being an integer(pixel count).
> > 
> > Is it really a count of pixels that fall into one of the bins?
> It's the statistics generated for each frame that is sent to the display and the value corresponds to 5 bit pixel depth.

Let me try it once more, but this is becoming tiresome. Please provide a
description of the property good enough so that one can implement
HISTOGRAM support for the VKMS driver. You don't have to provide
Intel-specific details, but the description should be complete enough.
"The number of pixels falling into each of the bins, sorted by
luminosity, started from the brighest ones" might be an example of a
good enough desription. Then one can add such functionality to other
drivers. Just saying "statistics" doesn't give us anything.

> 
> > 
> > > An event HISTOGRAM will be sent to the user. User upon recieving this
> > > event user can read the hardware generated histogram using crtc
> > > property
> > 
> > Nit: here and further, it's CRTC, not crtc
> Ok.
> 
> > 
> > > HISTOGRAM_DATA. User can use this histogram data, apply various
> > > equilization techniques to come up with a pixel factor. This pixel
> > > factor is an array of integer with 'n+1' elements. This is fed back to
> > > the KMD by crtc property HISTOGRAM_IET. KMD will write this IET data
> > > back to the hardware to see the enhancement/equilization done to the
> > > images on that pipe.
> > > The crtc property HISTOGRAM_DATA and HISTOGRAM_IET is of type blob.
> > >
> > > For crtc property HISTOGRAM_DATA,
> > > the blob data pointer will be the address of the struct drm_histogram.
> > > struct drm_histogram {
> > > 	u64 data_ptr;
> > > 	u32 nr_elements;
> > > }
> > > Histogram is composed of @nr_elements of bins with each bin being an
> > > integer value, referred to as pixel_count.
> > > The element @data_ptr holds the address of histogam.
> > > Sample:
> > > Historgram[0] = 2050717
> > > Historgram[1] = 244619
> > > Historgram[2] = 173368
> > > ....
> > > Historgram[31] = 21631
> > >
> > > For crtc_property HISTOGRAM_IET,
> > > the blob data pointer will be the address of the struct drm_iet.
> > > struct drm_iet {
> > > 	u64 data_ptr;
> > > 	u32 nr_elements;
> > > }
> > > ImageEnhancemenT(IET) is composed of @nr_elements of bins with each
> > > bin being an integer value, referred to as pixel factor.
> > 
> > What are pixel factors? How are they supposed to be used? You have specified
> > the format of the data, but one still can not implement proper HISTOGRAM
> > support for the VKMS.
> >
> This pixel factor is a value that can be multiplied/appended/prepended to the pixels of the incoming image on that pipe thereby enhancing the image quality.

So, mupliplied, appended, prepended or something else? Please provide a
usable description of the data.

>  
> > > The element @data_ptr holds the addess of pixel factor.
> > > Sample:
> > > Pixel Factor[0] = 1023
> > > Pixel Factor[1] = 695
> > > Pixel Factor[2] = 1023
> > > ....
> > > Pixel Factor[32] = 512
> > >
> > > Histogram is the statistics generated with 'n' number of frames on a
> > > pipe.
> > > Usually the size of pixel factor is one more than the size of
> > > histogram data.
> > 
> > What does that mean? What does it mean if this "Usually" isn't being followed?
> > Previously you've written that it always has n+1 elements.
> > 
> In Intel platform its 'n' for histogram and 'n+1' for IET. Can vary with other vendors supporting this feature.
> Hence have a variable(nr_elements) to convey this.

You are defining generic userspace interface. It has nothing about
"Intel" in it.

> 
> Thanks and Regards,
> Arun R Murthy
> --------------------
> > >
> > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > ---
> > >  include/drm/drm_crtc.h      | 51
> > +++++++++++++++++++++++++++++++++++++
> > >  include/uapi/drm/drm_mode.h | 24 +++++++++++++++++
> > >  2 files changed, 75 insertions(+)
> > >
> > 
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
