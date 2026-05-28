Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC03CD4F54
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 16:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B29510F3FF;
	Thu, 28 May 2026 16:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q00y9Mp6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8640E10F3FF
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 16:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779986850; x=1811522850;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rdx6/N0W33Y5AxwjfYDUkJ3kjMFZDs5AjmJgIywSLQQ=;
 b=Q00y9Mp6AfsqWUkde7jZnEYjtSDxJxHrfv8+pSQK+CcFwqiJS0h7L6f1
 JbaREWRcvcEi3PMVluqoXl/33cd8QfHZLp93TWOXnVEn0gweRYxF0g+kZ
 KFdOC3x0wiXCCAZ4JfYsfcTdZIpGAWvr6MmrNQgZHPUIW5XSz/JKAc2ak
 MuP18+Xl4cHZf5ZuLdiiCYIkGSLCOz74Pc6t6yDOjRtY28rDzuLz9qktz
 FCGUjr0Uma+XgCZxN/1hLBGQQEze/yWtWU+J1LEOFOh/ERgDplDxKNGzd
 /aMV89Eie+fKUAzQulw0NQ7jcgMR9ucHIAtWqU5BgCwI2ssRvct4zQbxY A==;
X-CSE-ConnectionGUID: 2KZCDS7SSOeXq07yJz+XJA==
X-CSE-MsgGUID: 1Df0aubUQhm6orwstTYe8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="91521913"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="91521913"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 09:47:30 -0700
X-CSE-ConnectionGUID: 27Mb7LkTQbG3SEp76uOWow==
X-CSE-MsgGUID: yrx53hxhRXeS5ZbHNcBMHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="241566888"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.236])
 ([10.245.245.236])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 09:47:29 -0700
Message-ID: <d77e39ad-2463-4947-a0d7-d366f6d45cfc@intel.com>
Date: Thu, 28 May 2026 17:47:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/mmio: Assert MMIO is available
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20260527175437.22585-1-michal.wajdeczko@intel.com>
 <754ed1a5-ed12-4e0e-bafc-5775106d8e14@intel.com>
 <d7fd718c-413a-4a7e-83d4-cfb0401194fc@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <d7fd718c-413a-4a7e-83d4-cfb0401194fc@intel.com>
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

On 28/05/2026 17:16, Michal Wajdeczko wrote:
> 
> 
> On 5/28/2026 11:13 AM, Matthew Auld wrote:
>> On 27/05/2026 18:54, Michal Wajdeczko wrote:
>>> We shouldn't access device registers after the device was unplugged.
>>> Instead of relying on the NPD splat due to zeroed xe.mmio.regs, which
>>> might be unreliable anyway as not all xe_mmio are using that directly,
>>> add an explicit assert during xe_mmio read/write operations to catch
>>> invalid accesses to MMIO after device was unplugged.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_mmio.c | 11 +++++++++++
>>>    1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>>> index 78adb303b663..b77a717f0556 100644
>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>>> @@ -10,6 +10,7 @@
>>>    #include <linux/minmax.h>
>>>    #include <linux/pci.h>
>>>    +#include <drm/drm_drv.h>
>>>    #include <drm/drm_managed.h>
>>>    #include <drm/drm_print.h>
>>>    @@ -128,6 +129,11 @@ void xe_mmio_init(struct xe_mmio *mmio, struct xe_tile *tile, void __iomem *ptr,
>>>        mmio->tile = tile;
>>>    }
>>>    +static void mmio_assert_available(struct xe_mmio *mmio)
>>> +{
>>> +    xe_tile_assert(mmio->tile, !drm_dev_is_unplugged(&mmio->tile->xe->drm));
>>
>> Yeah, I was hopeful this would work, but as per CI the unplug=true needs to happen before the devm actions run,
> 
> yup, we mark drm.unplugged = true in our pci.remove hook:
> 
> void xe_device_remove(struct xe_device *xe)
> {
> ...	drm_dev_unplug(&xe->drm);
> 
> while devm actions are called as part of the kobj.release hook:
> 
> static void device_release(struct kobject *kobj)
> {
> ...	devres_release_all(dev);
> 
> 
>> so we get a pile of false positives with this. I think the best we can do is NULL, or perhaps mmio.unplugged and check that here?
> 
> there is pci_dev_is_disconnected() but that one will likely cover real unplug scenarios, for which we might be completely not prepared ;(

Yeah, I assume pci_dev_is_disconnected() is if the user literally ripped 
out the physical card or the hw died, without doing a software unbind 
first to let the driver gracefully shut down the hw state?

> 
> but now I'm wondering if maybe those 'false positives' are actually a good one, as it might be risky to access the HW during final SW unwind, like here:
> 
> <4> [45.999577]  xe_mmio_read32+0x38/0x290 [xe]
> <4> [46.000710]  ggtt_node_remove+0xbb/0xf0 [xe]
> <4> [46.001167]  xe_ggtt_node_remove+0x40/0xa0 [xe]
> <4> [46.001618]  xe_ggtt_remove_bo+0x87/0x250 [xe]
> <4> [46.002076]  xe_ttm_bo_destroy+0xa2/0x2d0 [xe]
> <4> [46.002917]  ttm_bo_release+0x70/0x310 [ttm]
> <4> [46.004082]  ttm_bo_fini+0x3c/0x70 [ttm]
> <4> [46.004424]  xe_gem_object_free+0x1a/0x30 [xe]
> <4> [46.004857]  drm_gem_object_free+0x1d/0x40
> <4> [46.005231]  xe_bo_put+0x12a/0x190 [xe]
> <4> [46.005618]  __xe_bo_unpin_map_no_vm+0x49/0x70 [xe]
> <4> [46.006097]  devm_action_release+0x16/0x30
> <4> [46.006449]  release_nodes+0x3d/0x150
> 
> and the fact that mmio.regs is still non-NULL and points to the connected HW, is just our luck?
> 
> maybe we should kill the HW immediately on pci.remove, if it is still present, and just unwind SW state using devm/drmm actions?

devm is for unwinding hw related state, so we for sure need mmio etc. On 
normal unplug we need to gracefully shut everything down from hw pov 
with devm (or do it manually in .remove). Once we get as far as the 
mmio_fini() or whatever it is called, we should be right towards the 
tail end of the devm unwind actions, so nothing should be messing with 
mmio it at that point.

For sw state, that is the job of drmm, at which point I don't think 
there should be any hw access.

So devm is more tied to the physical pci device, and drmm is only really 
tied to the drm_device. They have different life cycles with unbind 
triggering devm and unwinding the hw state, and drmm only being 
triggered when there are no more driver users, like every open driver fd 
has been closed. We still need ioctls etc to survive but return an 
error, to give the UMD chance to recover, like with potentially opening 
a new card or so.

> 
>>
>>> +}
>>> +
>>>    static void mmio_flush_pending_writes(struct xe_mmio *mmio)
>>>    {
>>>    #define DUMMY_REG_OFFSET    0x130030
>>> @@ -146,6 +152,7 @@ u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
>>>        u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>>>        u8 val;
>>>    +    mmio_assert_available(mmio);
>>>        mmio_flush_pending_writes(mmio);
>>>          val = readb(mmio->regs + addr);
>>> @@ -158,6 +165,7 @@ void xe_mmio_write8(struct xe_mmio *mmio, struct xe_reg reg, u8 val)
>>>    {
>>>        u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>>>    +    mmio_assert_available(mmio);
>>>        trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
>>>          writeb(val, mmio->regs + addr);
>>> @@ -168,6 +176,7 @@ u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
>>>        u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>>>        u16 val;
>>>    +    mmio_assert_available(mmio);
>>>        mmio_flush_pending_writes(mmio);
>>>          val = readw(mmio->regs + addr);
>>> @@ -180,6 +189,7 @@ void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
>>>    {
>>>        u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>>>    +    mmio_assert_available(mmio);
>>>        trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
>>>          if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
>>> @@ -194,6 +204,7 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
>>>        u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>>>        u32 val;
>>>    +    mmio_assert_available(mmio);
>>>        mmio_flush_pending_writes(mmio);
>>>          if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
>>
> 

