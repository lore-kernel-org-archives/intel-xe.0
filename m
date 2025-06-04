Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E6AC5B543
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 17:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DCD10E0D7;
	Wed,  4 Jun 2025 17:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gBnCxaLr";
	dkim-atps=neutral
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BD610E0D7
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 17:29:21 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-acb39c45b4eso10677766b.1
 for <intel-xe@lists.freedesktop.org>; Wed, 04 Jun 2025 10:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749058160; x=1749662960; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LHDU+1RYiryvJb22UI+WF8Y1TTPxARJUuDw60tggXd8=;
 b=gBnCxaLrnq9pAL/gJClvev/4yaY2VHNNjpBHupOxWlj7AHYJzXJ1gpEsZMsaQYpfSL
 MmRp1GNPwsREtcN8sNOTUpD7t0SWYB6vFBzKpnyrdlzP3j2w1XaHRi9IhowMeUmWq8lM
 +g50gA60xrVgTyTR66B3hSpgGTIfgnw8gYt3WF4kq3EmLV/LWGtuRzR4mPVFvS8DxjpX
 SUcP+uGSUQpL/4w2E0k6SOsddg4SJVKFJvlM+HAWDiC1G6RAezjcLLvkAqYLTkz8RsS2
 ksLSPSCvpuB/ta3et9I20hI+1yeeFIgJUSILXv9QHo6Mk8SZClbodkdowsprfD7VkxHM
 e1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749058160; x=1749662960;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LHDU+1RYiryvJb22UI+WF8Y1TTPxARJUuDw60tggXd8=;
 b=URq34JVy0kOFV9d2BKBGq9Mb0K5wF8gLfoQoAykc/3mOnC1wq2R/4ERAL+NZQv+gYm
 WqH+7DQjN4k10tbJxZHi0XyXV8LZYpJ9ZxNIULl51ihg0u0lZLBZ5tDeHujDzppNf+Sn
 HuDxdW3IVkSLwSAcRrxl/5uUJzGnjlYja4iswqzIfmgi3ORz7kkF9lz0/uHEpnBu9Jm7
 khNvILvH8EYdYBp8IOilOqyAvRSv4QS+Igy8FKxIOrjpxdFefyMF64P5WuRrkYEWOtTA
 8UR/Fs0bprpoWvdj3LtcaIZVYn/UczoGE4F5T+P3QkvAqKKHY6yg0TQ5pLcq9sRNSxjp
 HMxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfldazg2ZH00NV4HLqZeaV8RucXXoOhJ4i+8ozONzu+c3chroPOUlfXKvN0j0ryBP6aD3U6SleNQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOtc7RaR8TWOgVh+qQjbig2hBVoPaMqiyGqkrTmRV1l4K+C5Yl
 wNg9nhb16Q4OrmvSOCVShTFzOyV8/JkZ9bgJPJOZ94hgEt5fhUsZisxKewRddaWuv5c=
X-Gm-Gg: ASbGncvxqqlgcVR6rxQMdjwodk3tdVaEqE3fk2sEbxSC0aFCoTsdinEVxXidu4Tt3CC
 jeFtoGng/QNj+wnpaJJ376PVqhmXGhr9Z+wVi+c9OGchLtuLVAJJ+E4ZeqhcKri3v3IPjGTwi/H
 P/ympACeJyLN22H0S/nnceZaq3jrC+YfA9yJelZzTgGj4zyK8NotxmVLJCDevqEGITnafqv1rAP
 MJABgnZwfNRuj6yqV8HNL1UnHkm/3RYaXdZ80VkjPJZweNGzqjjVpSeLn17/EfX7+2m2iwWSkbR
 t9Jjb3BpPf8dQyza6istCgP/4+hrG4n9NE87tByrY2HvAt/BAWdtpNA0pY3uCPRfGA==
X-Google-Smtp-Source: AGHT+IELXaQPEfNvL11HA89uAYXLtD5fjYuBkHotv6D53Ek2qhdvi41IQ3zt5wxdrPwfVnwDa0lhAQ==
X-Received: by 2002:a17:907:c12:b0:adb:2e9d:bc27 with SMTP id
 a640c23a62f3a-addf8fb2cacmr373200866b.54.1749058159647; 
 Wed, 04 Jun 2025 10:29:19 -0700 (PDT)
Received: from localhost ([41.210.155.222])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ada5d7fed8bsm1132163766b.28.2025.06.04.10.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 10:29:19 -0700 (PDT)
Date: Wed, 4 Jun 2025 20:29:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [bug report] drm/xe/svm: Implement prefetch support for SVM ranges
Message-ID: <aECCaCP3BGGGUUa0@stanley.mountain>
References: <aDSDfusiM8QGQwFS@stanley.mountain>
 <0183ca8d-4347-48d9-a783-361c6543db14@intel.com>
 <20250603222952.GD407166@ziepe.ca>
 <aEBeM1sWuSNWNij6@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEBeM1sWuSNWNij6@phenom.ffwll.local>
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

On Wed, Jun 04, 2025 at 04:54:43PM +0200, Simona Vetter wrote:
> On Tue, Jun 03, 2025 at 07:29:52PM -0300, Jason Gunthorpe wrote:
> > On Mon, May 26, 2025 at 10:15:17PM +0530, Ghimiray, Himal Prasad wrote:
> > > 
> > > 
> > > On 26-05-2025 20:36, Dan Carpenter wrote:
> > > > Hello Himal Prasad Ghimiray,
> > > > 
> > > > Commit 09ba0a8f06cd ("drm/xe/svm: Implement prefetch support for SVM
> > > > ranges") from May 13, 2025 (linux-next), leads to the following
> > > > Smatch static checker warning:
> > > > 
> > > > 	drivers/gpu/drm/xe/xe_vm.c:2922 prefetch_ranges()
> > > > 	warn: passing positive error code 's32min-(-96),(-94)-(-15),(-13)-(-12),(-10)-(-2),1' to 'ERR_PTR'
> > > 
> > > Hi Dan,
> > > 
> > > Thanks for pointing this out. I see there's a gap in how hmm_range_fault()
> > > adheres to its documented behavior. I believe the function should sanitize
> > > positive return values from walk_page_range() to ensure consistency.
> > > 
> > > Jason can comment further on same.
> > 
> > Yeah, I don't think it should return positive error code, whatever is
> > doing that should be fixed. Can you send a patch?
> 
> Not sure that's what's going on, from the comment and reading the code
> (albeit non-exhaustively) I think you can only get positive error return
> values from walk_page_range if the ops you provide do so. The hmm ones
> don't, so I think this should be ok without any code changes?
> 
> Maybe a WARN_ON and patching that up for paranoia, but I don't see how
> this can happen.
> 

Thanks.

A comment is enough probably.  A WARN_ON() just bloats the code and
it doesn't silence the warning.  I'm going to have to add a line to
the smatch_data/db/kernel.return_fixes to tell smatch that
hmm_range_fault() doesn't return postives.

regards,
dan carpenter

