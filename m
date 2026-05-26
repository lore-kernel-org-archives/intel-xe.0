Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34177CD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 08:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D565310E1A5;
	Tue, 26 May 2026 08:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="muYTQhOS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D24210E1A5
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 08:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779785804; x=1811321804;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=FVDvrO81kzNswoM04L8ZmyCof7Pgfssv4BdNHov5+NE=;
 b=muYTQhOSf9y1lrmrHmbz9r/x2ouYvtX8Q1nzO9bvv+m33eqSL8wFdaPG
 ASQKMlk6b+gsmtyNwXQDIZCBnEKP6fZWSeQmOhJ6Tvm9iPIQMV23CCeJd
 w+ypwPm4eS8YgWjUFwJmCiVRPYOm1zy8AoKXzyoeooGOtXiMm+xtf2793
 I+1H6uGcLQVR125kVO5J+FZrqMslx0sAWw7wDXhgv7jHHz8Z89OXCfiAJ
 Wjmbhqx+g8XsLp4bSgJXug1G6IcRJhLizM59A9RfqRkXqKs3eOuppdkZv
 V894mBerJSzm+b/GeCcysGGZlb2nEcIlcKcU0wkAKJ9SKWAOXrmnrIu3M Q==;
X-CSE-ConnectionGUID: EDYZbfetRK6/rWlK/NWuCw==
X-CSE-MsgGUID: JRZbXKq2SrKV9ddtMYSmGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84449233"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="84449233"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 01:56:43 -0700
X-CSE-ConnectionGUID: qi3PdXR+QE+FfZJ8IXCLug==
X-CSE-MsgGUID: IjdUWUL3Q0u/fJmKdWvkIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="246130433"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.128])
 ([10.245.244.128])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 01:56:42 -0700
Message-ID: <a3631901-0f80-4123-8f26-b34ea9a4db92@intel.com>
Date: Tue, 26 May 2026 09:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/xe/mmio: Map MMIO BAR using managed version of
 pci_iomap
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260522143112.10643-1-michal.wajdeczko@intel.com>
 <20260522143112.10643-2-michal.wajdeczko@intel.com>
 <3c622ff9-565b-4b99-ada5-23306d4733e1@intel.com>
 <d469f6a3-ccea-4232-a75c-d4d2172bc090@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <d469f6a3-ccea-4232-a75c-d4d2172bc090@intel.com>
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

On 22/05/2026 20:25, Michal Wajdeczko wrote:
> 
> 
> On 5/22/2026 4:58 PM, Matthew Auld wrote:
>> On 22/05/2026 15:31, Michal Wajdeczko wrote:
>>> This will allow us to drop our custom release action. Note that
>>> pointer zeroing is not required, as there should be no active
>>> code running during a driver unwind. While around, add missing
>>> kernel-doc for the function and update error message.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_mmio.c | 33 +++++++++++++++------------------
>>>    1 file changed, 15 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>>> index 78adb303b663..f4086b9ae38f 100644
>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>>> @@ -16,6 +16,7 @@
>>>    #include "regs/xe_bars.h"
>>>    #include "xe_device.h"
>>>    #include "xe_gt_sriov_vf.h"
>>> +#include "xe_printk.h"
>>>    #include "xe_sriov.h"
>>>    #include "xe_trace.h"
>>>    #include "xe_wa.h"
>>> @@ -76,37 +77,33 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
>>>        return devm_add_action_or_reset(xe->drm.dev, tiles_fini, xe);
>>>    }
>>>    -static void mmio_fini(void *arg)
>>> -{
>>> -    struct xe_device *xe = arg;
>>> -    struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>>> -
>>> -    pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
>>> -    xe->mmio.regs = NULL;
>>> -    root_tile->mmio.regs = NULL;
>>
>> This was intentional, since on pci unplug this get nuked, but driver instance is still alive. So, by setting to NULL, we can more easily catch misbehaving code, still trying to touch the hw post unplug. Any chance we can keep the NULL part?
> 
> but any access to the unmapped BAR should still end with some splash, similar to NPD one
> 
> this is what I got after doing immediate pci_unmap without zeroing the xe->mmio.regs pointer:

It doesn't have to AFAIK. With the unplug, the same driver but new 
instance, like when re-probing a new xe card, or perhaps a completely 
different driver can map something there, post unplug. So the access 
might by accident "work". Setting to NULL is more likely to give us a 
splat if we trigger such an access.

Also IMO a NULL regs is easier to spot in the splat, since the full 
address will look bogus vs below, where the address looks normal. And 
NULL regs would usually hint at probe issue or post unplug issue.

> 
> [ 1111.155480] BUG: unable to handle page fault for address: ffffc90006130030
> [ 1111.155492] #PF: supervisor write access in kernel mode
> [ 1111.155500] #PF: error_code(0x0002) - not-present page
> [ 1111.155509] PGD 102400067 P4D 102400067 PUD 102c4f067 PMD 0
> [ 1111.155533] Oops: Oops: 0002 [#1] SMP NOPTI
> [ 1111.155558] CPU: 1 UID: 0 PID: 2853 Comm: insmod Kdump: loaded Not tainted 7.1.0-rc4-xe-sriov+ #618 PREEMPT(full)
> [ 1111.155595] Hardware name: Intel Corporation Panther Lake Client Platform/PTL-UH LP5 T3 RVP1, BIOS PTLPFWI1.R00.3332.D05.2509011438 09/01/2025
> [ 1111.155624] RIP: 0010:mmio_flush_pending_writes+0x28/0x50 [xe]
> [ 1111.156004] Code: 90 90 0f 1f 44 00 00 48 8b 07 55 48 8b 00 48 89 e5 48 8b 80 d8 0f 00 00 48 8b 00 a8 02 74 16 ba 04 00 00 00 31 c9 48 8b 47 08 <89> 88 30 00 13 00 83 ea 01 75 f1 5d 31 c0 31 d2 31 c9 31 ff c3 cc
> [ 1111.156025] RSP: 0018:ffffc90003ec36b0 EFLAGS: 00010246
> [ 1111.156035] RAX: ffffc90006000000 RBX: ffff88810c7bace8 RCX: 0000000000000000
> [ 1111.156045] RDX: 0000000000000004 RSI: 00000000011901f8 RDI: ffff88810c7bace8
> [ 1111.156054] RBP: ffffc90003ec36b0 R08: 0000000000000000 R09: 0000000000000000
> [ 1111.156063] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000011901f8
> [ 1111.156072] R13: 00000000001901f8 R14: 0000000000000000 R15: 0000000000000000
> [ 1111.156081] FS:  00007136102acc40(0000) GS:ffff8884eb10b000(0000) knlGS:0000000000000000
> [ 1111.156092] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1111.156101] CR2: ffffc90006130030 CR3: 000000010ec70005 CR4: 0000000108f72ef0
> [ 1111.156110] PKRU: 55555554
> [ 1111.156116] Call Trace:
> [ 1111.156121]  <TASK>
> [ 1111.156130]  xe_mmio_read32+0x32/0x150 [xe]
> [ 1111.156392]  xe_sriov_probe_early+0x2d/0xf0 [xe]
> [ 1111.156672]  xe_device_probe_early+0x4d/0x1a0 [xe]
> [ 1111.157057]  xe_pci_probe+0x13e/0x530 [xe]
> [ 1111.157374]  local_pci_probe+0x47/0xb0
> [ 1111.157393]  pci_call_probe+0x6c/0x360
> [ 1111.157413]  ? _raw_spin_unlock+0x22/0x50
> [ 1111.157430]  ? pci_match_device+0x16d/0x1a0
> [ 1111.157447]  pci_device_probe+0xa9/0x140
> 
>>
>>> -}
>>> -
>>> +/**
>>> + * xe_mmio_probe_early() - Probe and initialize device's MMIO
>>> + * @xe: the &xe_device
>>> + *
>>> + * Map the entire GTTMMADR_BAR and initialize the first tile's MMIO instance.
>>> + *
>>> + * The first 16MB of the GTTMMADR_BAR always belongs to the root tile, and
>>> + * includes: registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
>>> + *
>>> + * Return: 0 on success or a negative error code on failure.
>>> + */
>>>    int xe_mmio_probe_early(struct xe_device *xe)
>>>    {
>>>        struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>>>        struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>    -    /*
>>> -     * Map the entire BAR.
>>> -     * The first 16MB of the BAR, belong to the root tile, and include:
>>> -     * registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
>>> -     */
>>>        xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
>>> -    xe->mmio.regs = pci_iomap(pdev, GTTMMADR_BAR, 0);
>>> +    xe->mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
>>>        if (!xe->mmio.regs) {
>>> -        drm_err(&xe->drm, "failed to map registers\n");
>>> +        xe_err(xe, "Failed to map GTTMMADR_BAR\n");
>>>            return -EIO;
>>>        }
>>>          /* Setup first tile; other tiles (if present) will be setup later. */
>>>        xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
>>>    -    return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
>>> +    return 0;
>>>    }
>>>    ALLOW_ERROR_INJECTION(xe_mmio_probe_early, ERRNO); /* See xe_pci_probe() */
>>>    
>>
> 

