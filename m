Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B36A10987AB
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 16:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06B710EBB0;
	Fri, 20 Mar 2026 16:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="NUjq8Mje";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC5810EBB0
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 16:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jUcsG53F8F6q2fR1gqqfcmNcdVAZd01I3ASll7ILZio=; b=NUjq8MjeUzE78LbyPlVpagUQDN
 bp6pSPBZXanqwBpvTqCpShyxobKY0AOuFLx3imBB7PLuBhPm/PvKt+GLkZILLYG5TyK4Zcn2Oa8tX
 E2JUtgw7t3e8Usg/9bKmFSpzkKCDn1lbzdfF6nx9H3fQZ2G+5Bjbd9ghgEsL8h+VyMZai+LhdL1ri
 mVUkrJ269a16kNl8z7Z3Afoo1ICN33tIynM0Tn7tLsw4l8GRZbdzJ/DEDFroSfakTkEoHWOmLDIHL
 bLy3NpjFx7BrrQvhn3F++gYbMeyYyy7t5uLZ2uiCDvsE7MHUtXCqOXTS1YdDGrdjiyhtKrK/XPeLq
 C729++fg==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1w3cvp-003tOn-El; Fri, 20 Mar 2026 17:42:41 +0100
Message-ID: <f0e501df-ea19-41c6-b754-dd4633aa3820@igalia.com>
Date: Fri, 20 Mar 2026 16:42:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 11/12] drm/xe/display: Add support for AuxCCS
To: "Shankar, Uma" <uma.shankar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20260319100707.60157-1-tvrtko.ursulin@igalia.com>
 <20260319100707.60157-12-tvrtko.ursulin@igalia.com>
 <DM4PR11MB6360AB8F6229F2275BA3309EF44CA@DM4PR11MB6360.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <DM4PR11MB6360AB8F6229F2275BA3309EF44CA@DM4PR11MB6360.namprd11.prod.outlook.com>
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


On 20/03/2026 09:24, Shankar, Uma wrote:
>> -----Original Message-----
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Sent: Thursday, March 19, 2026 3:37 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: kernel-dev@igalia.com; Shankar, Uma <uma.shankar@intel.com>; Tvrtko
>> Ursulin <tvrtko.ursulin@igalia.com>; Juha-Pekka Heikkila
>> <juhapekka.heikkila@gmail.com>; Ruhl, Michael J <michael.j.ruhl@intel.com>;
>> Vivi, Rodrigo <rodrigo.vivi@intel.com>; Thomas Hellström
>> <thomas.hellstrom@linux.intel.com>; Maarten Lankhorst
>> <maarten.lankhorst@linux.intel.com>
>> Subject: [PATCH v23 11/12] drm/xe/display: Add support for AuxCCS
>>
>> Add support for mapping the auxiliary CCS buffer into the DPT page tables.
>>
>> This will allow for better power efficiency by enabling the render compression
>> frame buffer modifiers such as I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS
>> in a following patch.
> 
> I think the comment will need an update to reflect what is currently been added in this
> specific patch.

What do you have in mind? Is it not true that the patch adds support for 
the auxccs plane?

Regards,

Tvrtko

> However, changes look good to me. With above fixed,
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> 
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 28 +++++++++++++++++++++++++-
>>   1 file changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> index 23a7ec41f01d..e45a1e7a4670 100644
>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> @@ -56,6 +56,29 @@ write_dpt_padding(struct iosys_map *map, unsigned int
>> dest, unsigned int pad)
>>   	return dest + pad * sizeof(u64);
>>   }
>>
>> +static unsigned int
>> +write_dpt_remapped_linear(struct xe_bo *bo, struct iosys_map *map,
>> +			  unsigned int dest,
>> +			  const struct intel_remapped_plane_info *plane) {
>> +	struct xe_device *xe = xe_bo_device(bo);
>> +	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
>> +	const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
>> +						 xe->pat.idx[XE_CACHE_NONE]);
>> +	unsigned int offset = plane->offset * XE_PAGE_SIZE;
>> +	unsigned int size = plane->size;
>> +
>> +	while (size--) {
>> +		u64 addr = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
>> +
>> +		iosys_map_wr(map, dest, u64, addr | pte);
>> +		dest += sizeof(u64);
>> +		offset += XE_PAGE_SIZE;
>> +	}
>> +
>> +	return dest;
>> +}
>> +
>>   static unsigned int
>>   write_dpt_remapped_tiled(struct xe_bo *bo, struct iosys_map *map,
>>   			 unsigned int dest,
>> @@ -109,7 +132,10 @@ write_dpt_remapped(struct xe_bo *bo,
>>   			dest = write_dpt_padding(map, dest, pad);
>>   		}
>>
>> -		dest = write_dpt_remapped_tiled(bo, map, dest, plane);
>> +		if (plane->linear)
>> +			dest = write_dpt_remapped_linear(bo, map, dest, plane);
>> +		else
>> +			dest = write_dpt_remapped_tiled(bo, map, dest, plane);
>>   	}
>>   }
>>
>> --
>> 2.52.0
> 

