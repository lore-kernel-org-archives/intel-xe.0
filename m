Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F37606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 12:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=m55+2jkz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C79A10EFE0;
	Mon, 16 Nov 2026 12:30:21 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9006210F059;
 Mon, 16 Nov 2026 12:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1794832213;
 bh=yrm/kZkYQEoFU5AslytEvDQYp5qPUeessbIBYqBXp/0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=m55+2jkzbe1aYQxfFDGT1RmZFS1xv+wHlPCRey9iawybz+s7pb8mC5Q3mb2tajd9G
 U3YIPRts9owLs0B39RdZ2Fh/xeS4I5Xqwx/XuQi+kbR5Pi7Hnw0IfhME6klj6HZcOX
 lodj5MbQNqZXhm9dNYSS4ApdfS6muSEaF6frw6vmuixCAHlX7jUd6PzMhBIw3kw6Fy
 o43FolRzuNBzA8R9r3FWLPdx1uMs2zJCLDFvQzRBEbqXW9prx/JIzthO2rxGvJA12H
 NHGoxe0mTdNACP77tU5TIluO/7c2MSd6JvFjIZllyeGxhzyRtMC91jqWS49KQxOjml
 ewRib4dYLEDow==
Message-ID: <9e5794ed-9276-4c22-90ea-340ae5ec6d00@lankhorst.se>
Date: Mon, 16 Nov 2026 13:31:27 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/display: Use the GGTT PTE to find the initial FB
 in stolen
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Eriksen Xie <xiaolu.xie@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com
References: <20261116105303.1374969-1-xiaolu.xie@intel.com>
 <avrsPNzE2eEmz4VB@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <avrsPNzE2eEmz4VB@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hey,

On 11/16/26 12:42, Ville Syrjälä wrote:
> On Mon, Nov 16, 2026 at 06:53:03PM +0800, Eriksen Xie wrote:
>> On integrated platforms initial_plane_bo() passes the GGTT address of
>> the initial plane as is to xe_bo_create_pin_map_at_novm() as the offset
>> into stolen. That is only correct if the BIOS maps stolen 1:1 into the
>> GGTT.
>>
>> On Nova Lake the BIOS puts the initial FB at GGTT address 0xff800000
>> instead. Its PTE (0x800003) points to the start of stolen memory (the
>> stolen base is 0x800000), but using the GGTT address as the stolen
>> offset is far beyond the 120 MiB of stolen, so the BO creation fails and
>> the driver can't take over the BIOS FB:
>>
>>  xe 0000:00:02.0: [drm:xe_alloc_initial_plane_obj [xe]] Failed to create bo phys_base=0x00000000ff800000 size 8294400 with flags 430: -12
>>
>> Get the physical address from the PTE and convert it to an offset into
>> stolen, similarly to what is done for the dGPU case. Keep using the
>> GGTT address if the PTE doesn't point into stolen.
>>
>> Tested on a Nova Lake platform: the BIOS FB is now taken over as the
>> initial FB.
>>
>> Signed-off-by: Eriksen Xie <xiaolu.xie@intel.com>
>> ---
>>  drivers/gpu/drm/xe/display/xe_initial_plane.c | 18 +++++++++++++++++-
>>  1 file changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
>> index 0f86b7303..f69532b3a 100644
>> --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
>> +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
>> @@ -85,7 +85,7 @@ initial_plane_bo(struct xe_device *xe,
>>  			    &phys_base);
>>  	} else {
>>  		struct ttm_resource_manager *stolen;
>> -		u64 pte;
>> +		u64 pte, pte_addr, stolen_base;
>>  
>>  		stolen = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
>>  		if (!stolen) {
>> @@ -100,7 +100,23 @@ initial_plane_bo(struct xe_device *xe,
>>  			return NULL;
>>  		}
>>  
>> +		/*
>> +		 * The plane surface is a GGTT address, which equals the offset
>> +		 * into stolen only if the BIOS maps stolen 1:1 into the GGTT.
>> +		 * Get the offset from the PTE instead, and fall back to the
>> +		 * GGTT address if the PTE doesn't point into stolen.
>> +		 */
>>  		phys_base = base;
>> +		stolen_base = xe_ttm_stolen_gpu_offset(xe);
>> +		pte_addr = pte & XE_PAGE_ADDR_MASK(XE_PTE_SHIFT);
>> +		if (pte_addr >= stolen_base &&
>> +		    pte_addr - stolen_base < (u64)stolen->size << PAGE_SHIFT)
>> +			phys_base = pte_addr - stolen_base;
>> +
>> +		drm_dbg_kms(&xe->drm,
>> +			    "Initial plane GGTT address 0x%x, PTE 0x%llx -> stolen offset %pa\n",
>> +			    base, pte, &phys_base);
>> +
> 
> I had an earlier series trying to fix all this up, but the super
> dodgy xe ggtt framework got in the way and we got stuck in some
> kind of limbo. I think this was the series
> https://patchwork.freedesktop.org/series/166361/
> 
> The problem is that we can't bind the buffer into it's original high
> GGTT address because the GuC code assumes it has sole ownership of
> that, and rebinding it to a low address could partially overwrite
> some of the currently live old PTEs with new incorrect addresses.
> So to be completely correct we'd need the same trick that I added
> into the i915 counterpart code, that is first reserve the range
> for the old PTEs, then attempt the rebind. If the rebind succeeds
> release the old PTEs once no longer needed, otherwise we have no
> option but to bind to the original high address or just turn off
> the whole plane.Part of that serires was merged, but the part that actually fixes
GGTT and DPT access was not.

I reposted the series I had that fixes it:
https://patchwork.freedesktop.org/series/170430/

Can you review it so that it can be merged?

Kind regards,
~Maarten Lankhorst
