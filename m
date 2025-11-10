Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F083ECCFA1A
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 03:34:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE4310E297;
	Mon, 10 Nov 2025 03:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vj1HOn2R";
	dkim-atps=neutral
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D43310E297
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 03:34:34 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-8b25dd7ab33so58151985a.1
 for <intel-xe@lists.freedesktop.org>; Sun, 09 Nov 2025 19:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762745673; x=1763350473; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FTjrAybYh+CPfRDZlp384E2TmhDQoxMiFnes+oHnKBY=;
 b=Vj1HOn2RYBdGbnyz53GSLxvHxH3FnTD0RU6Uic0GfGFRYiMJxvVbzdC/X1o0/ShlM9
 suc05myY2/j+J2YN3aN0yuemOcbFhmxOWhukcBP9w4mGZqY9RD7BiSfD3irkcJfWI3YZ
 GZO/8wthnc0I81zHFel25XsgvJWvJsTbYoUrAjFRbm30Aur6RiEcLGWOwYqId6ZEGKbT
 ytRd26YobZc4rsMMspjpGKR7dU7W8Vgwy5+3ATJ1edGVj0XEi5mkNaKRf8d4XgVDAvD4
 vTpLcyXAooFf9ZnoSK9l4O1h6TUcsJkSk1lnP/bWcPf3C7F15sVRiSx3SD6bQSEisGxu
 bJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762745673; x=1763350473;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FTjrAybYh+CPfRDZlp384E2TmhDQoxMiFnes+oHnKBY=;
 b=LSAPy2D1xh6fybXX+M8oaPY6itOo17OPV8rz3j73B5OrQ2H3AHdeo3XhR6XqF+AClz
 GwZl0kWASnGDklUsCrOXxOxchXTQJjTEwliqiolDncx6TGjsRGn1HnLWZ0N4qk9lPv34
 wguAHryigc2TcIgNU5iftsGHI3YYprtQ85ErRAF/3cxSK+fRlTbyqWF8MakIMZ9W1DSd
 cLYloRlH4IJSBK8ECIZ0UnbXLUYrVMOruIPBbBdMp1C/kNV7wl1k6UzmQ2f9KrotRGt7
 ou2gG4eYbPGWOr/76MtMqUJqZNIXGPvoy2AhkwOkAWfpFfTRWdYSGS+wGWR66h9BZrvc
 a5dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV009Pwf6i6oO90fLlsbPGz2PjCJwWWBV3tddJLI3pzr7hB1oIU6hQnORqNfOM5REvEc/aGqFv8WQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5hBC5/9+w4tstOaSWn2EQp9Y/l2PPzaqjOb0uLZnuFnKi119l
 u+pFdccdrjdKpC8fYY6B5Tfcjw1qqUuLqP35ypexwPrq6duAvZDy3xVn6YlETVW9Kljla5XI6rH
 K74lxEutTRszBOEy9SRxg3OrDn+kY3EA=
X-Gm-Gg: ASbGnctwrvp/KKpgU3qFBEdf5HGTh2wW4TWB1vdH3FZ+2m7aRdDdVFNeaXbObRG+lL6
 Nx4oGmsqTDSb0c5F85TfRdcNg0TWBHJMtjHjcXVbsDJv3N3bc3oZLG3EiUX5GcxCXfqUjRM7WAv
 /PdRQvn9uIF5y1k5hhQapejJ60xOKyV+IxlcOBjAURMJebv+rPx6Aorire1wFZxclqy3nP1ekCN
 Z2JSKau+V7gg0BK4iAUYgq9saKN+uDavwyQ4YhefiIjrMZstdf53HqxVX2ZuQJGxZ6iwQ==
X-Google-Smtp-Source: AGHT+IGh9xUVZzStimVPXN68ON9CRFwcDfRCkZyJ94tMFYgdld9FCjXRiERvnS8zDYWdDazJenCywCAeTpusj3odIF4=
X-Received: by 2002:a05:620a:4492:b0:8b2:7726:c7c4 with SMTP id
 af79cd13be357-8b27726ca5amr301583185a.63.1762745673376; Sun, 09 Nov 2025
 19:34:33 -0800 (PST)
MIME-Version: 1.0
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
 <aQEVy1qjaDCwL_cc@intel.com>
 <BN9PR12MB52574F4EE2FF679D2230BBEFFCFAA@BN9PR12MB5257.namprd12.prod.outlook.com>
 <aQyftlgZN11YYQXy@intel.com>
In-Reply-To: <aQyftlgZN11YYQXy@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 10 Nov 2025 13:34:22 +1000
X-Gm-Features: AWmQ_bk9n41B0zGqQG_l6ZaRtq9Eyl4lRJWkoss6hRoHoC--Kpk8hiCQo4dtgaI
Message-ID: <CAPM=9tybY_LECdMNH6iw5pzxtd2=Z+4vwLt-_kuMQFUaEXsdpw@mail.gmail.com>
Subject: Re: DRM_RAS for CPER Error logging?!
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 Lukas Wunner <lukas@wunner.de>, 
 Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, 
 "Liu, Xiang(Dean)" <Xiang.Liu@amd.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Hubbard <jhubbard@nvidia.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 6 Nov 2025 at 23:16, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> On Wed, Oct 29, 2025 at 02:00:38AM +0000, Zhang, Hawking wrote:
> >    [AMD Official Use Only - AMD Internal Distribution Only]
> >    + [1]@Zhou1, Tao and [2]@Liu, Xiang(Dean) for the awareness.
> >
> >    RE - AMD folks, would you consider this to replace the current debugfs you
> >    have?
> >
> >    [Hawking]:
> >
> >    Replacing the debugfs is not the primary concern.
>
> My initial plan was to go with debugfs like you are doing, but
> I keep hearing complains that debugfs is not global and we need
> to take into account some cases where debugfs is not available
> in production images.
>
> > The main concern is
> >    whether drm_ras can effectively support the necessary RAS information for
> >    all device vendors, as this largely depends on the design of the hardware
> >    and firmware.
>
> I fully agree. This is the main reason I'm doing my best to make the drm-ras
> the most generic and expansible as possible.
>
> node registration with different node types, and names.
>
> I imagined something like:
>
> [{'FRU': 'String with device info', 'CPER': !@#$#!@#$},
>
> based on the format that the current non-standard-cper tracefs uses, with
> the FRU + CPER. But we could avoid the FRU and make the FRU as node name.
>
> >
> >    AMD is currently evaluating the proposed interface for error logging.
>
> The design of the details and the implementation is pretty much open for discussion
> at this point.
>
> What I'm really looking forward is:
>
> to know if the path is acceptable overall
> even if different drivers are opting for different node types?
>
> Is there any blocker on using this drm-ras/netlink for the CPER?

sorry for delay on this, I just had to read what CPER was :-)

I'm not offended by the idea of using tracefs here, I definitely think
debugfs is a bad idea coming from the enterprise distro land where we
don't like having it.

I'm ccing a few other people that might have opinions on exposing CPER
compatible logs for RAS purposes from devices, I assume there might be
more than GPUs wanting to do something like this,

Dave.
