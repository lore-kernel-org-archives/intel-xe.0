Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AD6C47258
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 18:34:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E370E10ED15;
	Thu, 25 Jan 2024 18:34:09 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8870F10EF7D
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jan 2024 18:34:08 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2cf2c9d91a6so3932211fa.0
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jan 2024 10:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706207582; x=1706812382; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MyGZiCJlrOxbx7yin+nvnZFwsXGDisObfRv6oWAy6G4=;
 b=BE381gS6TsVuOtLauUJok/9kkXQWJAzYSzgNvJS/Msdv1Cky2KR3MMT7ciHl+nfMvM
 Q/sGC78Yk+InTkqnRo+w1xX6URTCpngevZmS9lwglElw5DkwL5mnyQEWxZRrL3XZqM32
 /XlERw99ruywH5zMrsl1CT/gTwO6SZwNHznPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706207582; x=1706812382;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MyGZiCJlrOxbx7yin+nvnZFwsXGDisObfRv6oWAy6G4=;
 b=WH2xyO6l6zHtV+l3AFUGoDqcIe1c7/mWJKGueIeOdiM6Q8htGOWCWwluiLCtABClgl
 sAcWtNu8lu3EShOKV2VWOAgM16QEDJCXvZpbwu4SH8WzzGKOyoPcr3rNPW4+7wY5FlCl
 6/UAmeWCDJDHGv0yFq137Qq1xfH1ilzdjEdow8d9WYPJ+9x1ngkaMc1/pSr2KakamtOH
 h9/iF+Ou7HV/2M4bbLzwA3J8vXXu6JLB/hgUkh7MVUZ5Xnyw+/a1S9D4J3a+QxSgSqzQ
 ef0xUbwgRWpvKSsKrMfQIl+GVHWvDwCiTIfUiS9e+mB20fo7w+ox7Hqld5/wi2Z1A3K0
 rF6A==
X-Gm-Message-State: AOJu0YyrqKEzooLn/8rskAe81kv3Y5uPqLxuXvj1B4d5Cfys3wJoUtWN
 f4kcWreDgAXqepLYk+f71Gp5XgvxyGUzuLLcsL5hBW0YSbsKp+ofUjLVPbsDiek=
X-Google-Smtp-Source: AGHT+IHQbzZ+flmLrb63NqIwuT2uwPqK9LPwcr4stRN/IXfXHD6IyfqStis6DsTzumOfbBtWynj+YA==
X-Received: by 2002:a2e:5c84:0:b0:2ce:ce62:8f0 with SMTP id
 q126-20020a2e5c84000000b002cece6208f0mr108471ljb.0.1706207581313; 
 Thu, 25 Jan 2024 10:33:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 lr11-20020a170906fb8b00b00a315135e804sm1313353ejb.15.2024.01.25.10.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 10:33:00 -0800 (PST)
Date: Thu, 25 Jan 2024 19:32:58 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: Making drm_gpuvm work across gpu devices
Message-ID: <ZbKpWpOGuNKLJ6sA@phenom.ffwll.local>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
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
Cc: Felix Kuehling <felix.kuehling@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 09:33:12AM +0100, Christian König wrote:
> Am 23.01.24 um 20:37 schrieb Zeng, Oak:
> > [SNIP]
> > Yes most API are per device based.
> > 
> > One exception I know is actually the kfd SVM API. If you look at the svm_ioctl function, it is per-process based. Each kfd_process represent a process across N gpu devices.
> 
> Yeah and that was a big mistake in my opinion. We should really not do that
> ever again.
> 
> > Need to say, kfd SVM represent a shared virtual address space across CPU and all GPU devices on the system. This is by the definition of SVM (shared virtual memory). This is very different from our legacy gpu *device* driver which works for only one device (i.e., if you want one device to access another device's memory, you will have to use dma-buf export/import etc).
> 
> Exactly that thinking is what we have currently found as blocker for a
> virtualization projects. Having SVM as device independent feature which
> somehow ties to the process address space turned out to be an extremely bad
> idea.
> 
> The background is that this only works for some use cases but not all of
> them.
> 
> What's working much better is to just have a mirror functionality which says
> that a range A..B of the process address space is mapped into a range C..D
> of the GPU address space.
> 
> Those ranges can then be used to implement the SVM feature required for
> higher level APIs and not something you need at the UAPI or even inside the
> low level kernel memory management.
> 
> When you talk about migrating memory to a device you also do this on a per
> device basis and *not* tied to the process address space. If you then get
> crappy performance because userspace gave contradicting information where to
> migrate memory then that's a bug in userspace and not something the kernel
> should try to prevent somehow.
> 
> [SNIP]
> > > I think if you start using the same drm_gpuvm for multiple devices you
> > > will sooner or later start to run into the same mess we have seen with
> > > KFD, where we moved more and more functionality from the KFD to the DRM
> > > render node because we found that a lot of the stuff simply doesn't work
> > > correctly with a single object to maintain the state.
> > As I understand it, KFD is designed to work across devices. A single pseudo /dev/kfd device represent all hardware gpu devices. That is why during kfd open, many pdd (process device data) is created, each for one hardware device for this process.
> 
> Yes, I'm perfectly aware of that. And I can only repeat myself that I see
> this design as a rather extreme failure. And I think it's one of the reasons
> why NVidia is so dominant with Cuda.
> 
> This whole approach KFD takes was designed with the idea of extending the
> CPU process into the GPUs, but this idea only works for a few use cases and
> is not something we should apply to drivers in general.
> 
> A very good example are virtualization use cases where you end up with CPU
> address != GPU address because the VAs are actually coming from the guest VM
> and not the host process.
> 
> SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This should not have
> any influence on the design of the kernel UAPI.
> 
> If you want to do something similar as KFD for Xe I think you need to get
> explicit permission to do this from Dave and Daniel and maybe even Linus.

I think the one and only one exception where an SVM uapi like in kfd makes
sense, is if the _hardware_ itself, not the software stack defined
semantics that you've happened to build on top of that hw, enforces a 1:1
mapping with the cpu process address space.

Which means your hardware is using PASID, IOMMU based translation, PCI-ATS
(address translation services) or whatever your hw calls it and has _no_
device-side pagetables on top. Which from what I've seen all devices with
device-memory have, simply because they need some place to store whether
that memory is currently in device memory or should be translated using
PASID. Currently there's no gpu that works with PASID only, but there are
some on-cpu-die accelerator things that do work like that.

Maybe in the future there will be some accelerators that are fully cpu
cache coherent (including atomics) with something like CXL, and the
on-device memory is managed as normal system memory with struct page as
ZONE_DEVICE and accelerator va -> physical address translation is only
done with PASID ... but for now I haven't seen that, definitely not in
upstream drivers.

And the moment you have some per-device pagetables or per-device memory
management of some sort (like using gpuva mgr) then I'm 100% agreeing with
Christian that the kfd SVM model is too strict and not a great idea.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
