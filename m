Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41EAC43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 13:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767E410E5F4;
	Fri,  3 Jul 2026 13:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1xrsow/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B524610E5F4
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 13:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783084984; x=1814620984;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fGj03i7e35RjD7IUaSALlubg+5n/sW1p/J82Q0h4X/A=;
 b=B1xrsow/3Lpt26372qQiyoLSEyA6Um9k3VTk6llR+1b8yrt6DDq4irrA
 +RtqsVF9AWQdON5PnhlyGF9Mbea0eosLkrljG/HLeqsscMipcRCfIpNj3
 q0EVa0X6qq9r8fw4dVD5dF0tppuMj5D28B6pDIFhayprnIo8xvX7jL+dx
 w1Z3RFyuRaGkHP2nPyR7RN056Z1coCb3vOJd0EMzW/+Zfy8FjJIheXZ07
 1IrIRVQh9IDtO4uk9XuYf78SsmDV/FhyVBngMHbA886n63aCsCe7j4W/z
 yvTZfOFWCagRYwM0hS8fAlYjEoRpTq5SViWJnc15SKd+m5zl6xApDnZ5I w==;
X-CSE-ConnectionGUID: Sq0yy1RWQfy9rysv859Z1g==
X-CSE-MsgGUID: P+2x4u6/R3GBBIuCpdN9TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101259827"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="101259827"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 06:23:04 -0700
X-CSE-ConnectionGUID: n9iuGDqGTJ+hIfhTOcCyZg==
X-CSE-MsgGUID: t0n4bB6yT9aekqYjh2bWCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="252653030"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.245.138])
 ([10.245.245.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 06:23:04 -0700
Message-ID: <dcf26e9c-3eee-43b9-a5ef-d7cb580807af@intel.com>
Date: Fri, 3 Jul 2026 14:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/display: skip FORCE_WC and vm_bound check for
 external dma-bufs
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20260612170501.550816-2-matthew.auld@intel.com>
 <d5be431c-8393-4846-95b8-c30cbceed51b@lankhorst.se>
 <8ef2f0cf-629e-4b38-a467-e243f37f8285@intel.com>
 <472b1e17a858113396a50a8a7b8d9c51dc396410.camel@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <472b1e17a858113396a50a8a7b8d9c51dc396410.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 03/07/2026 13:45, Thomas Hellström wrote:
> On Fri, 2026-06-26 at 10:09 +0100, Matthew Auld wrote:
>> On 25/06/2026 16:35, Maarten Lankhorst wrote:
>>> Hello,
>>>
>>> On 6/12/26 19:05, Matthew Auld wrote:
>>>> Currently, xe_display_bo_framebuffer_init() unconditionally
>>>> attempts to
>>>> apply XE_BO_FLAG_FORCE_WC to the buffer and rejects the FB
>>>> creation with
>>>> -EINVAL if the BO is already VM_BINDed.
>>>>
>>>> However, for imported dma-bufs (ttm_bo_type_sg), this check
>>>> doesn't seem
>>>> to make much sense since CPU caching policy is entirely
>>>> controlled by
>>>> the exporter. Plus there is no place to set this flag, in the
>>>> first
>>>> place. Also this is not rejected if not yet vm_binded, but that
>>>> seems
>>>> arbitrary since setting or not setting FORCE_WC should a noop
>>>> either
>>>> way, at this stage, and whether it is currently VM_BINDed makes
>>>> no
>>>> difference.
>>>>
>>>> Currently if we run an app and offload rendering to an external
>>>> dGPU,
>>>> like NV or another xe device, the dma-buf passed back to the
>>>> compositor
>>>> (igpu) will be an actual external import from xe pov, and it will
>>>> be
>>>> missing FORCE_WC, and if the compositor side did a VM_BIND before
>>>> turning into it into an fb the whole thing gets rejected.
>>>>
>>>> So it looks like we either need to reject outright, no matter
>>>> what, or
>>>> this usecase is valid and we need to loosen the restriction for
>>>> sg
>>>> buffers.  Proposing here to loosen the restriction.
>>>>
>>>> Assisted-by: Gemini:gemini-3.1-pro-preview
>>>> Link:
>>>> https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7919
>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Maarten Lankhorst <dev@lankhorst.se>
>>>> ---
>>>>    drivers/gpu/drm/xe/display/xe_display_bo.c | 3 ++-
>>>>    drivers/gpu/drm/xe/display/xe_fb_pin.c     | 3 ++-
>>>>    2 files changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.c
>>>> b/drivers/gpu/drm/xe/display/xe_display_bo.c
>>>> index 7fbac223b097..8953da0136dc 100644
>>>> --- a/drivers/gpu/drm/xe/display/xe_display_bo.c
>>>> +++ b/drivers/gpu/drm/xe/display/xe_display_bo.c
>>>> @@ -48,7 +48,8 @@ static int
>>>> xe_display_bo_framebuffer_init(struct drm_gem_object *obj,
>>>>    	if (ret)
>>>>    		goto err;
>>>>    
>>>> -	if (!(bo->flags & XE_BO_FLAG_FORCE_WC)) {
>>>> +	if (!(bo->flags & XE_BO_FLAG_FORCE_WC) &&
>>>> +	    bo->ttm.type != ttm_bo_type_sg) {
>>>>    		/*
>>>>    		 * XE_BO_FLAG_FORCE_WC should ideally be set at
>>>> creation, or is
>>>>    		 * automatically set when creating FB. We cannot
>>>> change caching
>>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>> index f93c98bec5b5..5f4a0cd8deca 100644
>>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>> @@ -331,7 +331,8 @@ static struct i915_vma
>>>> *__xe_pin_fb_vma(struct drm_gem_object *obj, bool is_dpt,
>>>>    	int ret = 0;
>>>>    
>>>>    	/* We reject creating !SCANOUT fb's, so this is weird..
>>>> */
>>>> -	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags &
>>>> XE_BO_FLAG_FORCE_WC));
>>>> +	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags &
>>>> XE_BO_FLAG_FORCE_WC) &&
>>>> +		    bo->ttm.type != ttm_bo_type_sg);
>>>>    
>>>>    	if (!vma)
>>>>    		return ERR_PTR(-ENODEV);
>>>
>>> Yeah we cannot actually set the force flag on imported bo's for
>>> mmap coherency, but mmap on an imported dma-buf should be forbidden
>>> anyway, so that is fine.
>>>
>>> Best we can hope for is that dirtyfb is called correctly.
>>>
>>> Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
>>
>> Thanks!
>>
>>>
> Hi,
> 
> Is there a chance an attacker could create a dma-buf on device 1,
> export it to device 2, then scan out from it while the clearing still
> sits in the CPU cache?

Do we class this an attack? We maybe just get some display 
dirt/corruption for the hw scanout?

If this is a concern, then yeah we likely need some flushing. Happy to 
to take a look, if needed.

Note that I think you can still do this without dma-buf, so kind of 
figured this was a known limitation. I think you can just do:

gem_create(WB + system);
populate the pages; // wb pages
promote to fb; // sets FORCE_WC which does nothing
do the actual scanout; // might see cache dirt from the clear

 > > We have a forced flush for this situation in the i915 driver, right?

Yeah, IIRC for dma-buf, there is some kind of wbinvd_on_all_cpus() when 
we collect the sg-table. But that I think that was more being worried 
about non-scanout path, like exec() bypassing the clearing. We could do 
something like that? But still needs something extra for non dma-buf.

> 
> /Thomas

