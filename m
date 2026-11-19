Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C44D606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 11:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=JgK6S1DV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B05D10ED11;
	Thu, 19 Nov 2026 11:32:07 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6AF10ED11
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 11:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1795087919;
 bh=PUSBEAgNiyrWPRkryiYZxW2a7njKuMz2fUkdGRbTQOE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JgK6S1DVtPIdOGcqEBOo/EPbN3Pt5mscSdeoczoGLujdGFzc/oBe0sdCb8suxUKyP
 Iocg2v7w4g9NANCsXlbmwW0t8R4aLnMTwCxOVNLrIRDiCcX1tOEum4h+vIgSPYhtQa
 XA84GAx03tq96yFnry6Ne2Vg7Ap9I7v/JL3H6TFDPn5clSPPg5809Ue809DitHGzH0
 wjsaRURo8tLP378/USf8bi/q7vUSyiPOugevIWbF6G1e3JFU4qRWKNFzt6LmIuddLw
 GsnimlepUg2wBvw42shO7opNm/GgxXdyHuWhcc0gt96CpGcpez9M9R+5Ga6rMLn/og
 spuAPRXX3b41Q==
Message-ID: <1f5ba38e-334e-4a9f-aebc-dbd61e89ac1f@lankhorst.se>
Date: Thu, 19 Nov 2026 12:31:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] drm/xe/display: Use the correct calculation for
 phys_base on integrated
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20261116122828.266113-8-dev@lankhorst.se>
 <20261116122828.266113-12-dev@lankhorst.se> <av4LRFZZXU2zmd73@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <av4LRFZZXU2zmd73@intel.com>
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/18/26 21:32, Ville Syrjälä wrote:
> On Mon, Nov 16, 2026 at 01:28:33PM +0100, Maarten Lankhorst wrote:
>> The code originally assumed there was a 1:1 mapping between
>> stolen and GGTT offset. This is no longer true as of MTL, so
>> perform the correct calculations, similar to how they're
>> performed for the DGFX case.
>>
>> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>  drivers/gpu/drm/xe/display/xe_initial_plane.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
>> index a100ad23be2a0..451c24a4ed8d5 100644
>> --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
>> +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
>> @@ -101,7 +101,7 @@ initial_plane_bo(struct xe_device *xe,
>>  			return NULL;
>>  		}
>>  
>> -		phys_base = base;
>> +		phys_base = (pte & ~(page_size - 1)) - xe_ttm_stolen_gpu_offset(xe);
> 
> Do we have anything guarding against a bogus dma address in the PTE?

Yes, the invalid placement will be passed to bo creation, and the BO will not be
created as there's not enough space in the stolen region.

> In the i915 code I'm doing this:
> 
> if (dma_addr < mem->region.start || dma_addr > mem->region.end)
> 	-> bail
> *out_phys_base = dma_addr - mem->region.start;
> 
> The end check is perhaps redundant because we will anyway fail later
> if the whole thing doesn't fit inside the appointed memory region.
> On the other hand, I think making sure it's at least partially in
> there is a decent sanity check to do before going any further.
> 
> i915 also consistently logs all the information: the dma address,
> the resulting phys_base, and the name of the memory region.
> Having all that information at hand could help with debugging,
> so I think the xe code should do the same.

Yeah it fails below:
"Failed to create bo phys_base=%pa size %u with flags %x: %li\n"

The flags parameter contains the region.

I'm not too worried about the pte not being dummped, or invalid. All useful
data is available from the logs, and the checks are done upon BO creation.

On the platforms officially supported by xe,
dma_addr = phys_addr on discrete,
and dma_addr = phys_addr + 8 MB on integrated.

For unsupported platforms < 1270, it may be in the stolen region, but that should
still be easy to deduce from the rest of the logs.

When the bug is in the firmware, it will trigger on i915 as well, which is
supported and has those logs. If it's a bug in xe, it will likely hit the newer
platforms as well.

Kind regards,
~Maarten Lankhorst

