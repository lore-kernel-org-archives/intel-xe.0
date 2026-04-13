Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CC8F34C79
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 17:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022BD10E0DB;
	Mon, 13 Apr 2026 17:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L76P2HEG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C56710E0DB
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 17:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776102886; x=1807638886;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jPJFeRz0Z/ZwYTDHRpuMSV+Zbq2GWqACJ4MXeOiwih0=;
 b=L76P2HEGdVS+6srQ7Up9mWKghNf+2+SWoMSKtApRWDIBk0fxUt9ECFNo
 vS3cfgRDNBOR7jmHNXWhmM0h0q8UghGAMuU74xR5mVg7SeeFsRm2f92Fp
 QnaES2HZBVD0zFk7V5AIDSHgmo4TN2+VHw4UTtL9x9KUb2A2ASKX/JSYb
 XhS/GJdPa6mb2Hh2Zbwn2NWfTHkzCUWqRE+354yFfgODs8vu6sY33hliu
 BOvQhdSBGh7dkIP+vQ54sXC9zfJlpTksCgEBAsalhXCukoi8vq4yXzn0n
 mzulFb+iZeaNqEik71gMONoDsF+N3RB6aV4486wRn66Jhyb0VlAkKwjVO g==;
X-CSE-ConnectionGUID: EtpUvP0FRNyB1VQZAobyHw==
X-CSE-MsgGUID: zpgUfz3cSZeDw7eCZSJ4bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80637019"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="80637019"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 10:54:45 -0700
X-CSE-ConnectionGUID: 2CmSlNhLS0OlPXyKfUs5VQ==
X-CSE-MsgGUID: XwezozYySe2K965GXWcpEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="229734019"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.245.62])
 ([10.245.245.62])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 10:54:43 -0700
Message-ID: <10aba8d2-92e7-47c8-94ea-468b3c6595fc@intel.com>
Date: Mon, 13 Apr 2026 18:54:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/pat: Default XE_CACHE_NONE_COMPRESSION to
 invalid and assert on use
To: "Wang, X" <x.wang@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
References: <20260406182546.569131-1-x.wang@intel.com>
 <20260406182546.569131-3-x.wang@intel.com>
 <d6c549b1-c20c-49ec-9629-11243b27966b@intel.com>
 <1fd7b979-975e-43cb-b408-c4cdb611ef31@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <1fd7b979-975e-43cb-b408-c4cdb611ef31@intel.com>
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

On 07/04/2026 18:06, Wang, X wrote:
> 
> On 4/7/2026 02:48, Matthew Auld wrote:
>> On 06/04/2026 19:25, Xin Wang wrote:
>>> Initialize XE_CACHE_NONE_COMPRESSION PAT index to XE_PAT_INVALID_IDX by
>>> default, and add xe_assert() checks at the sites that use it for PTE
>>> encoding. This ensures platforms that don't support this cache mode fail
>>> loudly rather than silently encoding an invalid index into PTEs.
>>>
>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Signed-off-by: Xin Wang <x.wang@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_migrate.c | 9 +++++++--
>>>   drivers/gpu/drm/xe/xe_pat.c     | 1 +
>>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/ 
>>> xe_migrate.c
>>> index fc918b4fba54..cad47866435d 100644
>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>> @@ -30,6 +30,7 @@
>>>   #include "xe_lrc.h"
>>>   #include "xe_map.h"
>>>   #include "xe_mocs.h"
>>> +#include "xe_pat.h"
>>>   #include "xe_printk.h"
>>>   #include "xe_pt.h"
>>>   #include "xe_res_cursor.h"
>>> @@ -341,6 +342,7 @@ static void xe_migrate_prepare_vm(struct xe_tile 
>>> *tile, struct xe_migrate *m,
>>>                   DIV_ROUND_UP_ULL(actual_phy_size, SZ_1G);
>>>               u64 pt31_ofs = xe_bo_size(bo) - XE_PAGE_SIZE;
>>>   +            xe_assert(xe, comp_pat_index != XE_PAT_INVALID_IDX);
>>>               xe_assert(xe, actual_phy_size <= (MAX_NUM_PTE - 
>>> IDENTITY_OFFSET -
>>>                                 IDENTITY_OFFSET / 2) * SZ_1G);
>>>               xe_migrate_program_identity(xe, vm, bo, map_ofs, 
>>> vram_offset,
>>> @@ -635,11 +637,14 @@ static void emit_pte(struct xe_migrate *m,
>>>       u64 cur_ofs;
>>>         /* Indirect access needs compression enabled uncached PAT 
>>> index */
>>> -    if (GRAPHICS_VERx100(xe) >= 2000)
>>> +    if (GRAPHICS_VERx100(xe) >= 2000) {
>>>           pat_index = is_comp_pte ? xe- 
>>> >pat.idx[XE_CACHE_NONE_COMPRESSION] :
>>>                         xe->pat.idx[XE_CACHE_WB];
>>> -    else
>>> +        if (is_comp_pte)
>>> +            xe_assert(xe, pat_index != XE_PAT_INVALID_IDX);
>>> +    } else {
>>>           pat_index = xe->pat.idx[XE_CACHE_WB];
>>> +    }
>>
>> To simplify the flow, maybe we just unconditionally stick the assert 
>> here?
>>
> Yeah, I can modify this to simplify the assert here.
>> But would it make sense to take this a step further and wrap all 
>> pat.idx[] accesses with a simple helper (like xe_cache_pat_idx()), and 
>> add the assert there? There are a fair few places directly accessing 
>> pat.idx, outside of xe_pat.
>>
> Agree on wrapping pat.idx[] access with a helper for
> consistency.
> But I don't think an assert inside the helper is the
> right place. For UC/WT/WB, all platforms initialize
> them so the assert would never fire — it's dead code.

All platforms today, in the current snapshot of the tree. It is perhaps 
overkill, but being defensive and throwing a loud assert is easier to 
debug then filling PTE with garbage PAT index. When bringing up a new 
platform I don't think it's impossible to forget some init step, or if 
new indices keep being added on future hw, things might get even more 
murky. Also the assert would only be present on debug builds, not in 
production where it should get compiled out, if we use xe_assert().

> For compression variants, xe_bo.c:3763 intentionally
> reads the INVALID value as a capability check, so an
> assert there would break that. Better to keep the
> assert at the callsite like we do here in xe_migrate.c,
> where we have the right context to know a valid index
> is required.
> What do you think?

Yeah, good point. For that special case we could maybe bypass the 
helper, since it explicitly understands INVALID. For the helper, I'm 
just thinking about something that 99% of places would use, and would 
catch anything obviously wrong, and which are not expecting INVALID.

Anyway, up to you.

Either way,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> 
> Thanks
> Xin
>>>         ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>>>   diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>>> index 75aaae7b003d..fad5b5a5ed4a 100644
>>> --- a/drivers/gpu/drm/xe/xe_pat.c
>>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>>> @@ -559,6 +559,7 @@ static const struct xe_pat_ops xe3p_xpc_pat_ops = {
>>>   void xe_pat_init_early(struct xe_device *xe)
>>>   {
>>>       xe->pat.idx[XE_CACHE_WB_COMPRESSION] = XE_PAT_INVALID_IDX;
>>> +    xe->pat.idx[XE_CACHE_NONE_COMPRESSION] = XE_PAT_INVALID_IDX;
>>>       if (GRAPHICS_VERx100(xe) == 3511) {
>>>           xe->pat.ops = &xe3p_xpc_pat_ops;
>>>           xe->pat.table = xe3p_xpc_pat_table;
>>

