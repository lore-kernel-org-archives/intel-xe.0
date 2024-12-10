Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B40E77182
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 11:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5510B10E87C;
	Tue, 10 Dec 2024 11:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="f1BEDKeq";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794C210E5C9
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 11:17:26 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-434e406a547so21609775e9.3
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 03:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1733829445; x=1734434245; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IDojbZ2VONgpjznrfPM339c4Ui/XuZ8qmsW07fn2uQY=;
 b=f1BEDKeqEmj17PzsPGVn22/oSy4k7Rk8iD0A8HfphBAOnXgZGgR83NkatZ12FP4W5Z
 S1NDXPLjkVwAckeGKpu+KMcGKwrEGqY5eIRcBWYhyHZ1VZPJPKF0t8fiD97bhGxQxiTX
 8mVmZzjo+NyVlYy2QLEIbBles+X42FYV3fIVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733829445; x=1734434245;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IDojbZ2VONgpjznrfPM339c4Ui/XuZ8qmsW07fn2uQY=;
 b=HGVywrg5MlwsAeE6wy1nbIdJAJy9a65e9LnYNEnnzZLoe73hxjzpq55qk0O0G0BeOh
 V6uKc74KeqOC4YPHB6ST5ek6rdaETdozDRIXyh7Ty2qBQpgUb/2flb7waLpLEgwsYSVE
 SAGARFsWqgbhqV7v1HDWEeaT6GyN76azSpfpIX2rB8zRlcR+jaGPB02BrIrXC+56M+Lj
 ABZcQlMUEktBbm3gmGjc0Bh28S7DZ/PPharHMVAjZZ8OD+/emirx3+dEkS+kcMeI1elg
 HUUrHZs4V9qjNBp/fuJz01xp3zGYMQpsMbszr1e5Mt4DZ2jvQcp6Dyz5lKn1H1YuWU/s
 0XLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEtwMp+poT4ells9BaGtRETFbwVEkGzQmAbbc3zJcVTCcEq7fzG84I2ahxmRqy76ngxIzgweKS/A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLpIPyxZaJNXrB1yGOz2UuL088UAw2uaG9niQ3VtlIaYjdXdrG
 YgqXRDE6a4sIQZn3myo3X3rvNf91coFMSGhuJo3VrTbPmWFMd3hNKlH9NSyWxpA=
X-Gm-Gg: ASbGncuVLjTJPc2Wbr0ZInqA3+Q5YRL3kyRo2uwszffEtdliZFFsQKnjy34tal+KTkc
 MpztFeV8QUwIyAwI2lXxkRVki8yYUMwOhYZ32Ty22XhjdOS+eVyY4So5cNH6t9jAS8pMy2fz2PX
 QPt/JJ77uydBmtMsp156I4vCPSn1WKjwiHdy613isisObRSffVFJDXcvovuBVLTo2iECG/w5gxe
 YKKGC+9JoIMNqnKZ3CpkbQHE/NIhN+fyrrohiaDzMFaZ+zt/ElZrMjyeYi37TRzhg==
X-Google-Smtp-Source: AGHT+IG0c0/kJCByoAXTvAWZSCghtb2kRyPv2cAHMRWAM/x2Lb1XI1VpZSJ/qQlmCYfTOguR1LwFBA==
X-Received: by 2002:a05:600c:458b:b0:434:f739:7ce3 with SMTP id
 5b1f17b1804b1-434fff41b59mr33461855e9.8.1733829443037; 
 Tue, 10 Dec 2024 03:17:23 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52cbd72sm227349055e9.44.2024.12.10.03.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 03:17:22 -0800 (PST)
Date: Tue, 10 Dec 2024 12:17:20 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 14/26] drm/xe/eudebug: implement userptr_vma access
Message-ID: <Z1gjQOvr847-zuwM@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
 <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
 <ec42fe8b-9be0-41cc-96f4-f1869c6bb7e6@amd.com>
 <Z1cNQTvGdAUPp4Y-@phenom.ffwll.local>
 <e4401ab1-0562-407a-a0e9-2f6e43e5ac22@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4401ab1-0562-407a-a0e9-2f6e43e5ac22@amd.com>
X-Operating-System: Linux phenom 6.11.6-amd64 
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

On Mon, Dec 09, 2024 at 04:42:32PM +0100, Christian König wrote:
> Am 09.12.24 um 16:31 schrieb Simona Vetter:
> > On Mon, Dec 09, 2024 at 03:03:04PM +0100, Christian König wrote:
> > > Am 09.12.24 um 14:33 schrieb Mika Kuoppala:
> > > > From: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > 
> > > > Debugger needs to read/write program's vmas including userptr_vma.
> > > > Since hmm_range_fault is used to pin userptr vmas, it is possible
> > > > to map those vmas from debugger context.
> > > Oh, this implementation is extremely questionable as well. Adding the LKML
> > > and the MM list as well.
> > > 
> > > First of all hmm_range_fault() does *not* pin anything!
> > > 
> > > In other words you don't have a page reference when the function returns,
> > > but rather just a sequence number you can check for modifications.
> > I think it's all there, holds the invalidation lock during the critical
> > access/section, drops it when reacquiring pages, retries until it works.
> > 
> > I think the issue is more that everyone hand-rolls userptr.
> 
> Well that is part of the issue.

Yeah I ignored the other part, because that didn't seem super interesting
really.

Like for compute you can make the architectural assumption that gpu
addresses match cpu addresses, and this all becomes easy. Or at least
easier, there's still the issue of having to call into the driver for gpu
side flushes.

But for 3d userptr that's not the case, and you get two options:
- Have some tracking structure that umd and debugger agree on, so stable
  abi fun and all that, so you can find the mapping. And I think in some
  cases this would need to be added first.
- Just ask the kernel, which already knows.

Like for cpu mmaps we also don't inject tracking code into mmap/munmap, we
just ask the kernel through /proc/pid/maps. This sounds like the same
question, probably should have a similar answer.

I guess you can do a bit a bikeshed about whether the kernel should only
do the address translation and then you do a ptrace poke/peek for the
actual access. But again you need some flushes, so this might be a bit
silly.

But fundamentally this makes sense to me to ask the entity that actually
knows how userptr areas map to memory.
-Sima

> 
> The general problem here is that the eudebug interface tries to simulate the
> memory accesses as they would have happened by the hardware.
> 
> What the debugger should probably do is to cleanly attach to the
> application, get the information which CPU address is mapped to which GPU
> address and then use the standard ptrace interfaces.
> 
> The whole interface re-invents a lot of functionality which is already there
> just because you don't like the idea to attach to the debugged application
> in userspace.
> 
> As far as I can see this whole idea is extremely questionable. This looks
> like re-inventing the wheel in a different color.
> 
> Regards,
> Christian.
> 
> >   Probably time
> > we standardize that and put it into gpuvm as an optional part, with
> > consistent locking, naming (like not calling it _pin_pages when it's
> > unpinnged userptr), kerneldoc and all the nice things so that we
> > stop consistently getting confused by other driver's userptr code.
> > 
> > I think that was on the plan originally as an eventual step, I guess time
> > to pump that up. Matt/Thomas, thoughts?
> > -Sima
> > 
> > > > v2: pin pages vs notifier, move to vm.c (Matthew)
> > > > v3: - iterate over system pages instead of DMA, fixes iommu enabled
> > > >       - s/xe_uvma_access/xe_vm_uvma_access/ (Matt)
> > > > 
> > > > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> > > > Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v1
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_eudebug.c |  3 ++-
> > > >    drivers/gpu/drm/xe/xe_vm.c      | 47 +++++++++++++++++++++++++++++++++
> > > >    drivers/gpu/drm/xe/xe_vm.h      |  3 +++
> > > >    3 files changed, 52 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> > > > index 9d87df75348b..e5949e4dcad8 100644
> > > > --- a/drivers/gpu/drm/xe/xe_eudebug.c
> > > > +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> > > > @@ -3076,7 +3076,8 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset_in_vma,
> > > >    		return ret;
> > > >    	}
> > > > -	return -EINVAL;
> > > > +	return xe_vm_userptr_access(to_userptr_vma(vma), offset_in_vma,
> > > > +				    buf, bytes, write);
> > > >    }
> > > >    static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > > index 0f17bc8b627b..224ff9e16941 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -3414,3 +3414,50 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
> > > >    	}
> > > >    	kvfree(snap);
> > > >    }
> > > > +
> > > > +int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64 offset,
> > > > +			 void *buf, u64 len, bool write)
> > > > +{
> > > > +	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> > > > +	struct xe_userptr *up = &uvma->userptr;
> > > > +	struct xe_res_cursor cur = {};
> > > > +	int cur_len, ret = 0;
> > > > +
> > > > +	while (true) {
> > > > +		down_read(&vm->userptr.notifier_lock);
> > > > +		if (!xe_vma_userptr_check_repin(uvma))
> > > > +			break;
> > > > +
> > > > +		spin_lock(&vm->userptr.invalidated_lock);
> > > > +		list_del_init(&uvma->userptr.invalidate_link);
> > > > +		spin_unlock(&vm->userptr.invalidated_lock);
> > > > +
> > > > +		up_read(&vm->userptr.notifier_lock);
> > > > +		ret = xe_vma_userptr_pin_pages(uvma);
> > > > +		if (ret)
> > > > +			return ret;
> > > > +	}
> > > > +
> > > > +	if (!up->sg) {
> > > > +		ret = -EINVAL;
> > > > +		goto out_unlock_notifier;
> > > > +	}
> > > > +
> > > > +	for (xe_res_first_sg_system(up->sg, offset, len, &cur); cur.remaining;
> > > > +	     xe_res_next(&cur, cur_len)) {
> > > > +		void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start;
> > > The interface basically creates a side channel to access userptrs in the way
> > > an userspace application would do without actually going through userspace.
> > > 
> > > That is generally not something a device driver should ever do as far as I
> > > can see.
> > > 
> > > > +
> > > > +		cur_len = min(cur.size, cur.remaining);
> > > > +		if (write)
> > > > +			memcpy(ptr, buf, cur_len);
> > > > +		else
> > > > +			memcpy(buf, ptr, cur_len);
> > > > +		kunmap_local(ptr);
> > > > +		buf += cur_len;
> > > > +	}
> > > > +	ret = len;
> > > > +
> > > > +out_unlock_notifier:
> > > > +	up_read(&vm->userptr.notifier_lock);
> > > I just strongly hope that this will prevent the mapping from changing.
> > > 
> > > Regards,
> > > Christian.
> > > 
> > > > +	return ret;
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > > > index 23adb7442881..372ad40ad67f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > > @@ -280,3 +280,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
> > > >    void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
> > > >    void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
> > > >    void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> > > > +
> > > > +int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64 offset,
> > > > +			 void *buf, u64 len, bool write);
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
