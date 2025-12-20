Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A4AE668AE
	for <intel-xe@archiver.kernel.org>; Sat, 20 Dec 2025 09:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D835610E20C;
	Sat, 20 Dec 2025 09:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="CGcab/LD";
	dkim-atps=neutral
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8441410E1F1
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Dec 2025 09:48:20 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-477a1e2b372so19056845e9.2
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Dec 2025 01:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766224099; x=1766828899;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=qOW4PnpVwJ1a1ow90wBbPY5V5qFqMGNXJlCYoRRToZ8=;
 b=CGcab/LD1Tewn2zawoyvHJwlHbVvwkW0if6k+AmAansyAJ7+m8MzZUexgSTdBaDnKa
 QidWwIebPowtugFgromhZvqwN9SyrwdNYnY3aIQgfVsggCMZC4ZFjXo01QB61m2+lJRa
 rVbEGt4RTFAHGL9HeeQa51sr5++RccC7FOPigH7X1ckLec4yXEsI/m9VJbLEM9Z1Rmh+
 i2b3GRKPtwubdppIC9wSkEyb7fmnndkGF6uitC+SPAnPaVXY6QJwSFPT11Vsfhj41B0t
 /a2sgWUaFGtdT/w5rSoxlA4CvXMaWUJMWkVgoCcOlzVpH8is1c3ipnUdVJMLksoseTCk
 AZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766224099; x=1766828899;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qOW4PnpVwJ1a1ow90wBbPY5V5qFqMGNXJlCYoRRToZ8=;
 b=pt7GmOSfSmHp8uLudf1wzZxYcSwHcd0taLcJvCkYCSGFqI1LwsEoeJebHgSgW8LwMN
 HgNfWNGHjODFSRE92kMZm9ixzuR+NBgNpjIJIR6oLhxx4JOs5g29HOIh9QQbMQMvi6Rs
 VYbH5cGRn9C41M9r8UyUv/nOVynmTUNYFPfKgZn6XvRTx2ApR5uKwfMLzuCbJ4WHToz0
 L+n9OXFB9gsQ3dvq9m0GkaUILwx6a/+shFboOfnAHsgCwxVPSF+H6JmBG5/wmVK5ZO/n
 xkii9w+YLoKqpuDuv5fu7voji4wqvWVlfa27IX7cXRztaCaPphBw/mnV9NUha1+0uy1a
 eJDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCSfmym8HHETHt329JIGaKpei1MED6F/qRmUoe0iJzqfk4u1QxyVw84ocd2fbVOh721IERbIeYdw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym7x7FjC23XFU6eG7ix68sbt2Y+ugYkA17YIb1dBEItdt54dYL
 sHj7GGalr3F4CwPQK9RUFXrYyM4yppoAMdyDSkMvIkcIMEjRez7/M+rB2rw3Tw1mHK8e4Ib/GIa
 k7FUPYPM8tRhirXnD6A==
X-Google-Smtp-Source: AGHT+IF/wwyCbmZKrb9+OJuirDYtRZw2m8SWoZaJ0QqeIqy0vt7I3G/xdsnBsD2ylGONwHmPG8Ly7PYUfnT9IJg=
X-Received: from wmbjp12.prod.google.com
 ([2002:a05:600c:558c:b0:475:decb:4c4d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:608d:b0:477:93f7:bbc5 with SMTP id
 5b1f17b1804b1-47d195667d6mr53518855e9.10.1766224098608; 
 Sat, 20 Dec 2025 01:48:18 -0800 (PST)
Date: Sat, 20 Dec 2025 09:48:17 +0000
In-Reply-To: <DF2AXQ67412G.33JOX2CF0VFCK@kernel.org>
Mime-Version: 1.0
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-4-ebf66bf234e0@google.com>
 <DF2AXQ67412G.33JOX2CF0VFCK@kernel.org>
Message-ID: <aUZw4fpWRUWFsb9r@google.com>
Subject: Re: [PATCH 4/4] rust: drm: add GPUVM immediate mode abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Lyude Paul <lyude@redhat.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="utf-8"
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

On Fri, Dec 19, 2025 at 04:35:00PM +0100, Danilo Krummrich wrote:
> On Fri Nov 28, 2025 at 3:14 PM CET, Alice Ryhl wrote:
> > +    /// Returns a [`GpuVmBoObtain`] for the provided GEM object.
> > +    #[inline]
> > +    pub fn obtain(
> > +        &self,
> > +        obj: &T::Object,
> > +        data: impl PinInit<T::VmBoData>,
> > +    ) -> Result<GpuVmBoObtain<T>, AllocError> {
> > +        Ok(GpuVmBoAlloc::new(self, obj, data)?.obtain())
> > +    }
> 
> Does this method make sense? We usually preallocate a VM_BO, then enter the
> fence signalling critical path and then obtain the VM_BO.

Hmm, but there is something tricky here. When do we add it to the extobj
list, then? If we add it before starting the critical path, then we must
also call drm_gpuvm_bo_obtain_prealloc() before starting the critical
path because obtain must happen before drm_gpuvm_bo_extobj_add(). And
adding it to extobj after signalling the fence seems error prone.

And besides, adding it to the extobj list before the critical path
means that we can have drm_gpuvm_exec_lock() lock the new BO without
having to do anything special - it's simply in the extobj list by the
time we call drm_gpuvm_exec_lock().

> > +impl<T: DriverGpuVm> DerefMut for GpuVmCore<T> {
> > +    #[inline]
> > +    fn deref_mut(&mut self) -> &mut T {
> > +        // SAFETY: By the type invariants we may access `core`.
> > +        unsafe { &mut *self.0.core.get() }
> > +    }
> > +}
> 
> Hm..it seems more natural to me to deref to &GpuVm<T> and provide data() and
> data_mut().

That's fair.

> > +impl<T: DriverGpuVm> Drop for GpuVmBoAlloc<T> {
> > +    #[inline]
> > +    fn drop(&mut self) {
> > +        // SAFETY: It's safe to perform a deferred put in any context.
> > +        unsafe { bindings::drm_gpuvm_bo_put_deferred(self.as_raw()) };
> 
> This does not need to be deferred, no?

I think what I *actually* want to call here is

	kref_put(&self->kref, drm_gpuvm_bo_destroy_not_in_lists_kref);

like what drm_gpuvm_bo_obtain_prealloc() does as of the first patch in
this series.

> > +    }
> > +}
> > +
> > +/// A [`GpuVmBo`] object in the GEM list.
> > +///
> > +/// # Invariants
> > +///
> > +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` and is present in the gem list.
> > +pub struct GpuVmBoObtain<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
> 
> How is this different from GpuVmBo? The only object that is not in the GEM list
> should be GpuVmBoAlloc, i.e. the preallocated one.

The difference is whether there is pointer indirection or not.

This type is morally an ARef<GpuVm<T>>, except I don't expose any way
to increment the refcount.

Alice
