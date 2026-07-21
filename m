Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59091C44539
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 13:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1FC10EDD2;
	Wed, 22 Jul 2026 13:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mxy50lqW";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9851310E030
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 16:30:22 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2caced6038eso70561335ad.0
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 09:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784651422; x=1785256222; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MHdawj2rFYjyK3F10CxJAoaZBnVtB6lTHhJb84UOuRM=;
 b=Mxy50lqW0pMdco1pW6BBvRwlXVT8E5ozJ1t0KYvI1n+fHB6y2Vty64D11+Sb/5B34I
 A4ex9bE6xPzxEprKDxx8RzVEZO+15CWAZBTGlmWxxQfQCiy/SxKxQIeyq7WmBd+s96SV
 rZV59Xc3uKJOGrgPQ+CMXM86i1/GT1320jzKwFBPkb7h1nFHWpnoTYji3pQRK5WpyE1C
 4YJKd3mxFk5rUfVNM622IlfmRuO/BHU7FickWtamZ8SNPA0XYtYiGntdFcEQrwJEXq9a
 nASPtzmUJbLHs8c9iDcAC11al5azApPuPa+jaHIth0thHNlGRiA7Q3Vfsgx3bI3T0Fi5
 o72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784651422; x=1785256222;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MHdawj2rFYjyK3F10CxJAoaZBnVtB6lTHhJb84UOuRM=;
 b=f+Blx+4hs6FwnT7aheRUgXtJc+t/mDo9Eg968TDp8JmmXY0B3krlCUHoV6aZEKv17a
 PCtr6l+xPk7U6Amj58BEofyl64b+StGQllhbOxgYmDjcsOdGFF/JrGzEQU1RJ50Fg7e6
 KnDx4mm3m/31LbUYCCVBjuWFJul9bvGHjNmX+5kPGyomDGx0vDLRdJeMB7xyYkx05+0H
 6Vf8J8eu/uabO5R9BwgNTY9ABdAu47ZfRFavxPk57HpZlGdkBndV2J/q2pxu5Y4CIETn
 0w50ApTvzM7cfoL2jpN04HJ8TrVDEn8sXmU6mBngRi7e/KWfJp38EjYycUQjdztWcecm
 Y79g==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq6A/hC9Oq4ZxTTvOjfRoLc+PTHMsHFzxmB/DNutpih/WbIM7PYYNvRUwAWgM1tFsx+ISo5JHIVAg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTDexO6WL1bJkFgFAxxzTqKhoREieJJ6ty9MWUwrM9OOw3lAjw
 uxPuj1UwbOmDEUrn7Efstm0R4TEssRxlQnRRol31QoE+hToih8MKC2gD
X-Gm-Gg: AR+sD11SjwApGumIdT4GxPkVNtiQjylfV3U1B5MzEF3rQXZeGo0Ue166vlcsssLTr4U
 mFJQ26xMRWB3io8ncBEvcr7E05yZxqQ8om+YaBEmH0ZjxlpjswpSjbcYSfnzZN0a2ULATHvregt
 3+FEPJq+clu3lPomkNhCoz7a4YMw+uaaip8fx2vCl2FWTtFwkpuwnNo5itpu/szOkQaFe0zLVHd
 OCH4EjKMcPEvYpLsSCHGSiFO0D4rpz3EdYDm2uqIzh3ZlicBljuKDKCcavMb17fgIUEaqmpt9AA
 57ZFeO9IhOQCxDu5RAlcytOrR3zV6zDtoMDxGyZhkwSDNl4e3YHuGDTi1P5dadP72QF9iqG0I3U
 4M9X+aX8OI0XqJD7XfkBC/lmkT+Op72RQQ/PmBS7sC5UNQ0KptioBOvlEMBwrn46LZ0erAtYwb1
 AOoyOGsch3gjVKaOsIDOUfRkJXMkEDOfgsCy5jZY5RxVh/
X-Received: by 2002:a17:903:f83:b0:2c9:d277:2cdb with SMTP id
 d9443c01a7336-2cf8dcccd50mr3432635ad.9.1784651421915; 
 Tue, 21 Jul 2026 09:30:21 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cf34729df7sm80984405ad.63.2026.07.21.09.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 09:30:21 -0700 (PDT)
Date: Tue, 21 Jul 2026 09:30:19 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/gpusvm: Zero HMM PFNs before scanning ranges
Message-ID: <al-emy_WMeEo5SRC@skinsburskii>
References: <178406967042.1113483.2116704310277917086.stgit@skinsburskii>
 <al5u+iJi1h6FhKsu@gsse-cloud1.jf.intel.com>
 <al6zslgo1Hm-l6oP@skinsburskii>
 <al68zIUmM9JS+Woq@gsse-cloud1.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al68zIUmM9JS+Woq@gsse-cloud1.jf.intel.com>
X-Mailman-Approved-At: Wed, 22 Jul 2026 13:42:23 +0000
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

On Mon, Jul 20, 2026 at 05:26:52PM -0700, Matthew Brost wrote:
> On Mon, Jul 20, 2026 at 04:48:02PM -0700, Stanislav Kinsburskii wrote:
> > On Mon, Jul 20, 2026 at 11:54:50AM -0700, Matthew Brost wrote:
> > > On Tue, Jul 14, 2026 at 03:54:32PM -0700, Stanislav Kinsburskii wrote:
> > > > drm_gpusvm_scan_mm() asks HMM to report the current CPU page-table
> > > > state without faulting missing entries by leaving default_flags set to
> > > > zero. The HMM PFN array is still caller-owned input/output state, and
> > > > the framework may preserve input bits while filling entries. It is not
> > > > safe for the caller to hand HMM an uninitialized array and then treat
> > > > entries without HMM_PFN_VALID as an authoritative unpopulated result.
> > > > 
> > > > Use kvcalloc() for the temporary PFN array so entries that are not
> > > > reported as valid start from the documented zero state. This prevents
> > > > random stack or heap contents from being interpreted as HMM PFN flags or
> > > > PFN values during the scan.
> > > > 
> > > > Fixes: f1d08a586482 ("drm/gpusvm: Introduce a function to scan the current migration state")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_gpusvm.c |    2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> > > > index 1a8bb83bd28d..c8f489d7ff7e 100644
> > > > --- a/drivers/gpu/drm/drm_gpusvm.c
> > > > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > > > @@ -859,7 +859,7 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
> > > 
> > > Two other cases in gpusvm would need to be fixed as well:
> > > 
> > > - drm_gpusvm_get_pages
> > > - drm_gpusvm_range_evict
> > > 
> > 
> > No, these two are fine, as the faulting is done with HMM_PFN_REQ_FAULT,
> > which either populates all the PFNs or fails.
> > 
> 
> Ah, yes clearly misunderstood the issue here / didn't read the commit
> message.
> 
> This patch LGTM:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> Will merge to drm-misc-fixes shortly.
> 
> But then drm_gpusvm_check_pages() should be fixed too as we don't set
> HMM_PFN_REQ_FAULT there either.
> 

Indeed.
Please, see v2 of the patch.

Thanks,
Stanislav

> Matt
> 
> > The only case where PFNs must be zeroed is when the caller wants to
> > collect the mapped PFNs. In this case, the missing PFNs are simply
> > ignored by the HMM framework.
> > 
> > Thanks,
> > Stanislav
> > 
> > > The offending patch is likely the one that added sticky bits to HMM:
> > > `git format-patch -1 285e871884ff3` for above two cases.
> > > 
> > > While I think zeroing here would be the safest approach, it does not appear
> > > to be a problem in practice because the sticky bits are only used by
> > > `hmm_dma_map_pfn()` and `hmm_dma_unmap_pfn()`.
> > > 
> > > Also, there are several non-gpusvm cases in the kernel that do not zero
> > > the PFN array either. So I'd say we should either fix the entire kernel
> > > in one pass, document that pfns must initialized to a known state, or
> > > leave this code alone.
> > > 
> > > Matt
> > > 
> > > >  	const struct dev_pagemap *other = NULL;
> > > >  	int err, i;
> > > >  
> > > > -	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> > > > +	pfns = kvcalloc(npages, sizeof(*pfns), GFP_KERNEL);
> > > >  	if (!pfns)
> > > >  		return DRM_GPUSVM_SCAN_UNPOPULATED;
> > > >  
> > > > 
> > > > 
