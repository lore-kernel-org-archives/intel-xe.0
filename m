Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E5ECA0EE8
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 08:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EF910E01F;
	Wed, 17 Sep 2025 08:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eNJVnAz1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530E010E01F
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 08:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758098897; x=1789634897;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Fym3tt31c9kgkn8sD08Bt4cFnLMIoWtR1PjtYVJrKxQ=;
 b=eNJVnAz1os/h2sfi5TbenYMDc1jSEZLUJ+c1z8IFkZXjL2TrmTa75wBP
 fISJDYrylGU6aD8FKnOXLVLYw9wP17G76piQZknkdlCvqy1tApRCWMkNx
 P+iuvMtDunaz+Hg+BEbw9chgE2M6GzRxUS54VnuphlqIY/lH48X6sxgX9
 cdWtfTnt3yLAo1t0qxr1YgMbLIe/EH47uLBkaAj08DvM15ZTTI6jdSpDG
 kSB4nHWxkU4ZpY7qkpVDYTpKC+gU7FuMC2bTtitL+SAXDnN4bVLIWp1jz
 5eLgN6jkQNP5T2hVH9b1AjKXASmlv3LSBmIRGX1oGNACOmlrhE8Ln1emN g==;
X-CSE-ConnectionGUID: 9mK7Rgm9RMi/zOhFkM9k2Q==
X-CSE-MsgGUID: wXeBx1nsRcu8QVEG1eGNlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60455887"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60455887"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 01:48:15 -0700
X-CSE-ConnectionGUID: lfP9TB1ISL2yE5jl+lgkNQ==
X-CSE-MsgGUID: NdfL+l3RTra7Lc49Wcd1sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="179192205"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.244.71])
 ([10.245.244.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 01:48:12 -0700
Message-ID: <27729672-509e-4f95-8aef-4dbf86858715@intel.com>
Date: Wed, 17 Sep 2025 10:48:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/xe/dma-buf: Allow pinning of p2p dma-buf
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250916115322.23293-1-thomas.hellstrom@linux.intel.com>
 <53d50dff-89eb-4de0-befc-4bb2552c5e21@intel.com>
 <afdf178471021e26a72bc38f17ad747b08533941.camel@linux.intel.com>
 <aMmmMoPcdimBAXS7@lstrano-desk.jf.intel.com>
 <dafff5f2281d7d3479c043c1d3d9f5ad7645f7d6.camel@linux.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@intel.com>
In-Reply-To: <dafff5f2281d7d3479c043c1d3d9f5ad7645f7d6.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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

Hey,

On 2025-09-16 20:54, Thomas Hellström wrote:
> On Tue, 2025-09-16 at 11:02 -0700, Matthew Brost wrote:
>> On Tue, Sep 16, 2025 at 03:06:48PM +0200, Thomas Hellström wrote:
>>> On Tue, 2025-09-16 at 14:03 +0100, Matthew Auld wrote:
>>>> On 16/09/2025 12:53, Thomas Hellström wrote:
>>>>> RDMA NICs typically requires the VRAM dma-bufs to be pinned in
>>>>> VRAM for pcie-p2p communication, since they don't fully support
>>>>> the move_notify() scheme. We would like to support that.
>>>>>
>>>>> However allowing unaccounted pinning of VRAM creates a DOS
>>>>> vector
>>>>> so up until now we haven't allowed it.
>>>>>
>>>>> However with cgroups support in TTM, the amount of VRAM
>>>>> allocated
>>>>> to a cgroup can be limited, and since also the pinned memory is
>>>>> accounted as allocated VRAM we should be safe.
>>>>>
>>>>> An analogy with system memory can be made if we observe the
>>>>> similarity with kernel system memory that is allocated as the
>>>>> result of user-space action and that is accounted using
>>>>> __GFP_ACCOUNT.
>>>>>
>>>>> Ideally, to be more flexible, we would add a "pinned_memory",
>>>>> or possibly "kernel_memory" limit to the dmem cgroups
>>>>> controller,
>>>>> that would additionally limit the memory that is pinned in this
>>>>> way.
>>>>> If we let that limit default to the dmem::max limit we can
>>>>> introduce that without needing to care about regressions.
>>>>>
>>>>> Considering that we already pin VRAM in this way for at least
>>>>> page-table memory and LRC memory, and the above path to greater
>>>>> flexibility, allow this also for dma-bufs.
>>>>>
>>>>> Cc: Dave Airlie <airlied@gmail.com>
>>>>> Cc: Simona Vetter <simona.vetter@ffwll.ch>
>>>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> Signed-off-by: Thomas Hellström
>>>>> <thomas.hellstrom@linux.intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/xe/tests/xe_dma_buf.c | 13 +++++++++
>>>>>   drivers/gpu/drm/xe/xe_dma_buf.c       | 41 +++++++++++++++++-
>>>>> ----
>>>>> -----
>>>>>   2 files changed, 39 insertions(+), 15 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>>>>> b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>>>>> index a7e548a2bdfb..1f88ca71820c 100644
>>>>> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>>>>> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>>>>> @@ -31,6 +31,7 @@ static void check_residency(struct kunit
>>>>> *test,
>>>>> struct xe_bo *exported,
>>>>>   			    struct drm_exec *exec)
>>>>>   {
>>>>>   	struct dma_buf_test_params *params =
>>>>> to_dma_buf_test_params(test->priv);
>>>>> +	struct dma_buf_attachment *attach;
>>>>>   	u32 mem_type;
>>>>>   	int ret;
>>>>>   
>>>>> @@ -88,6 +89,18 @@ static void check_residency(struct kunit
>>>>> *test,
>>>>> struct xe_bo *exported,
>>>>>   
>>>>>   	KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported,
>>>>> mem_type));
>>>>>   
>>>>> +	/* Check that we can pin without migrating. */
>>>>> +	attach = list_first_entry_or_null(&dmabuf-
>>>>>> attachments,
>>>>> typeof(*attach), node);
>>>>> +	if (attach) {
>>>>> +		int err = dma_buf_pin(attach);
>>>>> +
>>>>> +		if (!err) {
>>>>> +			KUNIT_EXPECT_TRUE(test,
>>>>> xe_bo_is_mem_type(exported, mem_type));
>>>>> +			dma_buf_unpin(attach);
>>>>> +		}
>>>>> +		KUNIT_EXPECT_EQ(test, err, 0);
>>>>> +	}
>>>>> +
>>>>>   	if (params->force_different_devices)
>>>>>   		KUNIT_EXPECT_TRUE(test,
>>>>> xe_bo_is_mem_type(imported, XE_PL_TT));
>>>>>   	else
>>>>> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
>>>>> b/drivers/gpu/drm/xe/xe_dma_buf.c
>>>>> index a7d67725c3ee..54e42960daad 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
>>>>> @@ -48,32 +48,43 @@ static void xe_dma_buf_detach(struct
>>>>> dma_buf
>>>>> *dmabuf,
>>>>>   
>>>>>   static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
>>>>>   {
>>>>> -	struct drm_gem_object *obj = attach->dmabuf->priv;
>>>>> +	struct dma_buf *dmabuf = attach->dmabuf;
>>>>> +	struct drm_gem_object *obj = dmabuf->priv;
>>>>>   	struct xe_bo *bo = gem_to_xe_bo(obj);
>>>>>   	struct xe_device *xe = xe_bo_device(bo);
>>>>>   	struct drm_exec *exec = XE_VALIDATION_UNSUPPORTED;
>>>>> +	bool allow_vram = true;
>>>>>   	int ret;
>>>>>   
>>>>> -	/*
>>>>> -	 * For now only support pinning in TT memory, for two
>>>>> reasons:
>>>>> -	 * 1) Avoid pinning in a placement not accessible to
>>>>> some
>>>>> importers.
>>>>> -	 * 2) Pinning in VRAM requires PIN accounting which is
>>>>> a
>>>>> to-do.
>>>>> -	 */
>>>>> -	if (xe_bo_is_pinned(bo) && !xe_bo_is_mem_type(bo,
>>>>> XE_PL_TT)) {
>>>>> +	if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
>>>>> +		allow_vram = false;
>>>>> +	} else {
>>>>> +		list_for_each_entry(attach, &dmabuf-
>>>>>> attachments,
>>>>> node) {
>>>>> +			if (!attach->peer2peer) {
>>>>> +				allow_vram = false;
>>>>> +				break;
>>>>> +			}
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	if (xe_bo_is_pinned(bo) && !xe_bo_is_mem_type(bo,
>>>>> XE_PL_TT) &&
>>>>> +	    !(xe_bo_is_vram(bo) && allow_vram)) {
>>>>>   		drm_dbg(&xe->drm, "Can't migrate pinned bo for
>>>>> dma-buf pin.\n");
>>>>>   		return -EINVAL;
>>>>>   	}
>>>>>   
>>>>> -	ret = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
>>>>> -	if (ret) {
>>>>> -		if (ret != -EINTR && ret != -ERESTARTSYS)
>>>>> -			drm_dbg(&xe->drm,
>>>>> -				"Failed migrating dma-buf to
>>>>> TT
>>>>> memory: %pe\n",
>>>>> -				ERR_PTR(ret));
>>>>> -		return ret;
>>>>> +	if (!allow_vram) {
>>>>> +		ret = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
>>>>> +		if (ret) {
>>>>> +			if (ret != -EINTR && ret != -
>>>>> ERESTARTSYS)
>>>>> +				drm_dbg(&xe->drm,
>>>>> +					"Failed migrating dma-
>>>>> buf
>>>>> to TT memory: %pe\n",
>>>>> +					ERR_PTR(ret));
>>>>> +			return ret;
>>>>> +		}
>>>>>   	}
>>>>>   
>>>>> -	ret = xe_bo_pin_external(bo, true, exec);
>>>>> +	ret = xe_bo_pin_external(bo, !allow_vram, exec);
>>>> Are we also missing save/restore support for such objects? Or at
>>>> least I 
>>>> can't see where the save flow is happening for externally pinned
>>>> VRAM?
>>> Good point. I forgot about that. IIRC we once made a deliberate
>>> decision to leave that out since we didn't support it.
>>>
>>> I'll have a look at that as well depending if we decide to go
>>> ahead with this.
>>>
>> Don't we take a PM ref exporting device in xe_dma_buf_attach? So when
>> memory attached to (or pinned in this case) we can't go through save
>> /
>> restore flows as the device should be awake?
> Yes, rpm save/restore should not happen, however system suspend or
> hibernate may.

Just a quick review: A call to ttm_bo_validate() is missing to ensure we don't pin while in wrong placement or swapped out.

By default the dmem cgroup controller is not yet used by most distributions, so introducing and using separate max_pinned + actually pinned accounting would work. It would make sense to make it first come first serve, which makes accounting simple. This would make the semantics the same as the first time hitting 'max' limit, but without the possibility for eviction.

This will likely work better than re-using the 'min' semantics, since they serve different purposes. One might want to allow pinning, but not want to pin memory by default unless needed.

Kind regards,
~Maarten
