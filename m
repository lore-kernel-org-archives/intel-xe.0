Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A53AC02180
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 13:13:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2781D10E95F;
	Thu, 16 Jan 2025 13:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lyClBcz8";
	dkim-atps=neutral
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA2710E95F
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 13:13:56 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53ff1f7caaeso1062295e87.0
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 05:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737033175; x=1737637975; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IN5iErEK204hTsFbOEcPU9O7KFDei+gXebS5ZQrhPCE=;
 b=lyClBcz8iZ3Uf6ol3oG1TYaXPgNY6Q30Hog8ODdFX2iYHrH8iATSwePs3nBRBA80vz
 XLTaCCGyXHRI/+uIUakZ0ylPGrFeQMgCCa+ZiEiXNRsloESIuAyXyKU8lcC0bZe5Od8B
 9pbHhznVC3LR6p60bKGZ+TPZGLJdVb/WXODRdhtwvwRcrSkIH1h2fenwp17+MLjjYDaG
 RsJc6SXvJzkJYvCW5BYxwzgqM6k6EnYdfgOQRQGftMtFKrms69ENZtHGNFQEvgfSqSCD
 DNS2QiNAnpQJnHfrxKeT0qL7vUVocyt/HLhVzUdtsm2EfXnqqeNCPeh5+WK7+Jx3uzjM
 GtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737033175; x=1737637975;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IN5iErEK204hTsFbOEcPU9O7KFDei+gXebS5ZQrhPCE=;
 b=FbwuRLX8rF9oPppMJB2Y2N2eB9rclUm6K2cHnw4cPaxih1jdkBlpVHRR1JP7FUFIN9
 gBmq4Igx8XbEhn4uLcKQivV4lejZ2Yk+ANf/2yH9rNxjaxrTi+i4d3U4kLqK/pkwsepb
 GTwjjFDajZEdNFjFRQZ8b0cKBAcLIZovQ8pILqvuO5shCsAb6NqotbHa7w18/JZr0dnD
 RK623N5Srpv6DK4u44rXu4zIrDuRDdm7GvKJYAKxOks4s0M03IJ1MQDv9zAmGOMQbxNm
 wIr/wht05bHTq/Tg7KRqB7FKN8Y/yABgxO9vquRPTfo9xGedQZjV2T134vN30X2PUltb
 IXbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtqnGGVHYrT3WWCRGm+bDB/q0DP3F2JK3So1F+yXgUOWBcgzYxXQIO+59wQnaM8p5u3ypnNf5wiw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzArB9qRTcC6Ce5ec42cQaCbRnwqTh9i3ScOy2vtixVfHlNCpLL
 t8gAnMfHwIrXdL5jk0cHOeErxyR1W4ERJHMX3w0a45W17mt1UL7g2qb9ikjSkPg=
X-Gm-Gg: ASbGncvOWyfWN4WXvYjUdEpf7HFwEQ+8JThrwecKrJhDaP8MjOM0rivKz/EGH+suyZd
 L6uaf/rUgFi9JO+RfamPCpsPnYa6aOuCe38dH7dx6vuN+UKft9YeThsyjoImyiWOyuenHlV9rvb
 ydNRVzzrU6LE1k7WOhcTDPfKqVuaEcv0xWwD7cHDSRbcO48M2G1Fpd1rUnwtUB2WPEG3zSJit96
 HAVbbj934erEW5AyG37BxpWs9icNntujNXN2HnyU468Rec8NYIIqyk1lFIvcARQ5xlxIqld2nfV
 Vmqnqy7ii7o3e19hg4xQL7r8SRgzSfVmLVWR
X-Google-Smtp-Source: AGHT+IHsMwVVXHTANfdMqD7v8ryQa3xtKKNCW75Lyt2j8h7YnEXxIQ/19jtCGN+l81P00mW/j/xJOw==
X-Received: by 2002:a05:6512:3b90:b0:542:214c:533 with SMTP id
 2adb3069b0e04-54284559eefmr11207075e87.30.1737033174553; 
 Thu, 16 Jan 2025 05:12:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be496desm2319317e87.44.2025.01.16.05.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 05:12:53 -0800 (PST)
Date: Thu, 16 Jan 2025 15:12:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, 
 "Shankar, Uma" <uma.shankar@intel.com>, "Bhattacharjee,
 Susanta" <susanta.bhattacharjee@intel.com>
Subject: Re: [PATCH v7 01/14] drm: Define histogram structures exposed to user
Message-ID: <yyn35zkvqfajyyata2kuwfswfzjf3oqv4hzq5pc5rw7o2sporu@vsybecmh54ow>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
 <20250110-dpst-v7-1-605cb0271162@intel.com>
 <kwklrd2zjovabsa537jwg3bpqilvhfmxxyr4exmqbi2b35uxej@mhequ6ttibsd>
 <IA0PR11MB73079537444DAA9596F0A837BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <CAA8EJpojDKtcG=amuwT7B+iaU_A9EwcvpkyyQ8nupKtsF_79gg@mail.gmail.com>
 <IA0PR11MB73070AE8FD9EAF5E47A56A96BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB73070AE8FD9EAF5E47A56A96BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
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

On Thu, Jan 16, 2025 at 12:33:20PM +0000, Murthy, Arun R wrote:
> > > > On Fri, Jan 10, 2025 at 01:15:29AM +0530, Arun R Murthy wrote:
> > > > > Display Histogram is an array of bins and can be generated in many
> > > > > ways referred to as modes.
> > > > > Ex: HSV max(RGB), Wighted RGB etc.
> > > > >
> > > > > Understanding the histogram data format(Ex: HSV max(RGB))
> > > > > Histogram is just the pixel count.
> > > > > For a maximum resolution of 10k (10240 x 4320 = 44236800)
> > > > > 25 bits should be sufficient to represent this along with a buffer
> > > > > of
> > > > > 7 bits(future use) u32 is being considered.
> > > > > max(RGB) can be 255 i.e 0xFF 8 bit, considering the most
> > > > > significant 5 bits, hence 32 bins.
> > > > > Below mentioned algorithm illustrates the histogram generation in
> > > > > hardware.
> > > > >
> > > > > hist[32] = {0};
> > > > > for (i = 0; i < resolution; i++) {
> > > > >     bin = max(RGB[i]);
> > > > >     bin = bin >> 3; /* consider the most significant bits */
> > > > >     hist[bin]++;
> > > > > }
> > > > > If the entire image is Red color then max(255,0,0) is 255 so the
> > > > > pixel count of each pixels will be placed in the last bin. Hence
> > > > > except hist[31] all other bins will have a value zero.
> > > > > Generated histogram in this case would be hist[32] =
> > > > > {0,0,....44236800}
> > > > >
> > > > > Description of the structures, properties defined are documented
> > > > > in the header file include/uapi/drm/drm_mode.h
> > > > >
> > > > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > > > ---
> > > > >  include/uapi/drm/drm_mode.h | 59
> > > > > +++++++++++++++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 59 insertions(+)
> > > > >
> > > > > diff --git a/include/uapi/drm/drm_mode.h
> > > > > b/include/uapi/drm/drm_mode.h index
> > > > >
> > > >
> > c082810c08a8b234ef2672ecf54fc8c05ddc2bd3..7a7039381142bb5dba269bda
> > > > ec42
> > > > > c18be34e2d05 100644
> > > > > --- a/include/uapi/drm/drm_mode.h
> > > > > +++ b/include/uapi/drm/drm_mode.h
> > > > > @@ -1355,6 +1355,65 @@ struct drm_mode_closefb {
> > > > >     __u32 pad;
> > > > >  };
> > > > >
> > > > > +/*
> > > > > + * Maximum resolution at present 10k, 10240x4320 = 44236800
> > > > > + * can be denoted in 25bits. With an additional 7 bits in buffer
> > > > > +each bin
> > > > > + * can be a u32 value.
> > > > > + * Maximum value of max(RGB) is 255, so max 255 bins.
> > > >
> > > > HDR planes have higher max value for a component.
> > > > Likewise even in an RGB24 case there are 256 possible values. It's
> > > > not clear why
> > > > 0 gets excluded.
> > > >
> > > This applies to only SDR and excludes HDR.
> > 
> > Why?
> > 
> We are limiting to only SDR. HDR includes a broad range of color and finer details,
> which essentially means its an enhanced image.
> We are trying to enhance the image quality of SDR with the support of histogram.

You are defining generic API. It might be broader than your existing
usecase. Please consider supporting HDR too.

> > > RGB in hex can have a maximum value of 0xFF { RGB (255, 255, 255) }
> > >

-- 
With best wishes
Dmitry
