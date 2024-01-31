Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89432C47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 17:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CDF10FAA9;
	Wed, 31 Jan 2024 17:12:10 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4C710FAA9
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 17:12:09 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-55f4b824c92so545143a12.1
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 09:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706721068; x=1707325868; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sBkFRNywevL/2N5Y/QCekYzbj190x87NDyyvW7/2yGY=;
 b=YHGdkrQ8fbcQbkVV+OvSSTeFx18LPthMcnt5izVyH4rf1an4zqmLpsIHIrNeKMWwst
 AwN80M/+hgvYIb1jpO3Jw8IDV0uTfj2sCpkHRtDtqUPKwOnzcMT4p2bSK3nDZw0o/BHc
 S6hH49978xjO+NFOUQikqfEEApcohnaXZamLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706721068; x=1707325868;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sBkFRNywevL/2N5Y/QCekYzbj190x87NDyyvW7/2yGY=;
 b=njFSuuh+R4e+9tTIlPmVp8DC12MMcBDu6kugEci5ATe1RexunUc7k5mEJHVcQVAx6j
 VU/O5wkVGKBDYmEGYh9ANLTqgyuGYf+lbUn9aKFfPhnBqr08eb3v3WyrJm0Yljg7+cDm
 HUF/oDwhXvjXE6rIQphnEA5fqQ/7Wfvjy4YCZF0Rb2j5+SA0Qgy+LVNLsXbtRI8oDdJ4
 yJbwLAtbSDSMj1Xuxz7NY5fopFWl21Z1OA0nDVqMyzzAsNwikizx+NBWAbr2WG2d1qRm
 XZIj14sP+Tw5B0bIQxLc9sgmZiZXulPtcOJbFz3gGwfxMvy1/taWrbRBNFHA1rnVjlP7
 HPgg==
X-Gm-Message-State: AOJu0YyMCrKOag82pxeeufrS+4+pjddpSH3kRRKg9k2qDZf8QlY+jON9
 knDtMyR/Ha1gbM17bPmXmzoK2XWBp1U1VzymNlFAybjncCDb3SBp/PSOMHU21D4Vir7nF3QDGnB
 E
X-Google-Smtp-Source: AGHT+IEXLOd14TBgrpohCXh11GAEeXFo74zQwCyvg1YE+MeY0J5VsEdwY0IieFnmoBY/LLVGrGBjrQ==
X-Received: by 2002:a17:906:1b51:b0:a36:95cd:5e62 with SMTP id
 p17-20020a1709061b5100b00a3695cd5e62mr750011ejg.7.1706721067631; 
 Wed, 31 Jan 2024 09:11:07 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXxDsBPKAFJ+rOt/zkh7BLucRhUKXmIw7ci17iIBsT007O4DsY/HObYtMDpDQV83SlYdc2WGGEqXYAP9jNqBs8XfF9jvvGKScmmv9ZaiuWRgurb23R5NMA39ebdMHjv2L80l/BCTCZJuTdit3KZU9Ai8q9Z0IJpHakDeV8JTcZlowjHkHS7Tr+GK1awbZdlGJDAhzzU+ELzGkmNZATQQ8Vfm26z
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 tl10-20020a170907c30a00b00a3554bb5d22sm4986765ejc.69.2024.01.31.09.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 09:11:07 -0800 (PST)
Date: Wed, 31 Jan 2024 18:11:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/sched: Add Matthew Brost to maintainers
Message-ID: <Zbp_KUvsdcSMHsSE@phenom.ffwll.local>
References: <20240131030302.2088173-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240131030302.2088173-1-matthew.brost@intel.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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
Cc: Luben Tuikov <ltuikov89@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 30, 2024 at 07:03:02PM -0800, Matthew Brost wrote:
> Add Matthew Brost to DRM scheduler maintainers.
> 
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Definitely need more people taking care of drm/sched, so thanks for
volunteering!

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I think this also needs an ack from Luben and Christian. And you also need
drm-misc commit rights first, or it's going to be a bit tricky to take
care of maintainer duties for merging patches. But since your sched
patches now have landed in upstream this should be just a formality.

Cheers, Sima

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5c00fad59e91..e968d68a96c8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7308,6 +7308,7 @@ F:	drivers/gpu/drm/xlnx/
>  
>  DRM GPU SCHEDULER
>  M:	Luben Tuikov <ltuikov89@gmail.com>
> +M:	Matthew Brost <matthew.brost@intel.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
