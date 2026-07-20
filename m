Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6322BC4453C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 13:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6EC10EDBD;
	Wed, 22 Jul 2026 13:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="pSeDOlhe";
	dkim-atps=neutral
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F71E10E10C
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jul 2026 18:49:12 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-c9fe3c9bd5fso2648833a12.0
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jul 2026 11:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784573352; x=1785178152; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Re34VAtAAjlLrNshWTOWNBSkv69M0wzkwQeQz8e8Vxg=;
 b=pSeDOlhe+xl2KAXHeM1Dr2dUEOyq6Lf4HKxU32XRMq+63koVzNkLQxTz6oQOT8lEcr
 QDuCxv1Z3CQXtUt3BuyeaSdwY/5F8rZjsEfdlREXUWKH9zlZtYHKgq7KddCOvhgobOC0
 Gu/uRg3cLAPZIw4p17gqCjtOhL85s/niU5J8cSNVX/+NiRGkUPnr0ErngROMJaNYEdVy
 G8uv1Qrpat02hvhr7M1q0l1BhHft6h2uG/djpIa5cWnRz87SVqM+0oUqmWzh4Z+MIOhP
 C8I9RLtz9voyb3Yvc8y5QLL6N6URkrcs60YhNJn3KIVhApPiCmCHXFQHbw3GqwvoEs3r
 lftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784573352; x=1785178152;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Re34VAtAAjlLrNshWTOWNBSkv69M0wzkwQeQz8e8Vxg=;
 b=puRNYAbVw5M3lXyYNqT7thXzVA1ebV/16TwtU/Vu/iKRkkvdHxBtcOl203bky2VaO8
 k6WT42OyN38acc5b65umN2xsG4XHKkWi3G4owV3Rr+QCBmbaY93Uv+3dBKXem921u/iY
 2FMyoLPLQv0F8VtdGXVz2s7j4Utapf74JcbH9FS2f5bvzQb1XU6y3QpOxDXzLAWbKkom
 4jgYgeYvv8eWGvQjFnHBEDnE6JHoFk4OJJ7vA7wFBRX2JLuhScdBvege644jzvkTLf5R
 xZC19pjIyMl4f9u/bl0ap1UwtHrHcjr6SqazPlGyYNa4ZMSy1IKa5Iz+sc1sfVWcbH4u
 5hIw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrL2alHrhxWVb3ME+UM7ELZv3dvTOjL3Ll76Y1pX0Ggc/zWhAaih6HTHoUsyLSYRAKzkHmQLu5ERQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsIVK0JQSfuQNoDuGmKxD4tQ1MSb3f+0Qjw2ZwPxXh0QE7gF6Q
 QAJV8sh5uObU5uAGC5HN5pEX27sTXZX5Tzkn+Z0rqOJ9eYpWDlQl3zFc
X-Gm-Gg: AfdE7cnWTHlf3MhkAkFowEBw8ciOjQgDVvces1uJCD7kFlC9kYK+lrnx5lzLefcXKJ8
 6vYpBSD8SUUfkczK6iglviwSdTuckbqqxmmYbGQBFvwR4BCJmNd1gW9yNp4YcfziyUW/klq7mLu
 7lYqLgPiKYcpwYvdXE/ANKjZsKyzR6WdAb52lwZKkWBxtiZdR3aS5brpbyoWAR2tt2/Jk+A2YH+
 NtfqM1SD7UqG1qR1Vzx/dodfVptF9lec6hYBvMkICNtbZMBwYpJOyn6prVNDPRdEVYLVzUc8Vr6
 M37sNOrTJzIGD58fRUOfSnQuirL04qHiFUNhndN3j/+z0UCC7xk8wHH/UOhpsQ483hMlZ3Sw/xU
 Nc47uFjw7+5hXng8yAUwfuUjGXVTmCRfavIub8fExjRyUbwGZSWEi3mzpWZeu8Q9LAE7qknKvfL
 OUEyaqEEkdu5eO0ONIikuiv1v8/L0oI7lXuJlDpvzEhTBT
X-Received: by 2002:a05:6a21:4c0e:b0:3bf:aa29:1612 with SMTP id
 adf61e73a8af0-3c3acfddf2fmr15977836637.28.1784573351803; 
 Mon, 20 Jul 2026 11:49:11 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cb517ba214esm5042414a12.6.2026.07.20.11.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 11:49:11 -0700 (PDT)
Date: Mon, 20 Jul 2026 11:49:09 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/gpusvm: Fix mm reference leak in range eviction
Message-ID: <al5tpcBK6yWPvNwV@skinsburskii>
References: <178406551216.1092539.5238081578161393168.stgit@skinsburskii>
 <al5sC3iUUDq9X/Ku@gsse-cloud1.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al5sC3iUUDq9X/Ku@gsse-cloud1.jf.intel.com>
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

On Mon, Jul 20, 2026 at 11:42:19AM -0700, Matthew Brost wrote:
> On Tue, Jul 14, 2026 at 02:45:14PM -0700, Stanislav Kinsburskii wrote:
> > drm_gpusvm_range_evict() pins gpusvm->mm with mmget_not_zero() before
> > allocating the temporary HMM PFN array. If that allocation fails, the
> > function returns -ENOMEM directly and leaks the mm reference.
> > 
> > Route the allocation failure through the common mmput() path after
> > initializing err to -ENOMEM. This preserves the returned error while
> > balancing the mm reference acquired by mmget_not_zero().
> > 
> > Fixes: 99624bdff8670 ("drm/gpusvm: Add support for GPU Shared Virtual Memory")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> 
> Yes, this is a bug... I also have pending patch to fix this here:
> 
> https://patchwork.freedesktop.org/patch/740193/?series=170433&rev=1
> 
> I think I prefer mine.
> 

Sure, let's disregard mine.

Thanks,
Stanislav

> Matt
> 
> > ---
> >  drivers/gpu/drm/drm_gpusvm.c |    5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> > index 76e8a0028c7f..1a8bb83bd28d 100644
> > --- a/drivers/gpu/drm/drm_gpusvm.c
> > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > @@ -1715,7 +1715,7 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
> >  	unsigned long *pfns;
> >  	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
> >  					       drm_gpusvm_range_end(range));
> > -	int err = 0;
> > +	int err = -ENOMEM;
> >  	struct mm_struct *mm = gpusvm->mm;
> >  
> >  	if (!mmget_not_zero(mm))
> > @@ -1723,12 +1723,13 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
> >  
> >  	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> >  	if (!pfns)
> > -		return -ENOMEM;
> > +		goto put_mm;
> >  
> >  	hmm_range.hmm_pfns = pfns;
> >  	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
> >  
> >  	kvfree(pfns);
> > +put_mm:
> >  	mmput(mm);
> >  
> >  	return err == -EBUSY ? -ETIME : err;
> > 
> > 
