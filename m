Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C674510987A5
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 16:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A33510EA0F;
	Fri, 20 Mar 2026 16:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mIKScOwU";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D10F10EA0F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 16:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LfP9JXFd3+C33PVniLi7ysLfrdK25okgkb93sNOaOiU=; b=mIKScOwUyptHJygdAMVJdih03K
 ms5AbOtcjR++jO6WyqGxgIoYoKQNAwcDnW6cPuWcoYe8CPT8Iu6NNt05yEGxyrvl04TLTG0bscvCj
 0BMUzGIfwzCpWa1Hd+LibjbPuTdyOi27Kwc3nYMhzVLtJM3mayawwQRavCo0xP9fay14kth6ed1+K
 7VFaRpRmZqiwgeIDLdYWkJsDi+C2o1k3JB3Pz1PfSV4cl+0WrcuDZSbeikPwwe/lBiLk0bKsJw9ig
 1XuIRR/6Ap56iRrEESaFv9QLgzylmtoJyIv8la4N2kqF0OE8sISbidoGr4rPBfnoo2u5JZxevt7Bz
 Bh5z53/g==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1w3cuX-003tJi-Ll; Fri, 20 Mar 2026 17:41:21 +0100
Message-ID: <100325e8-1369-4d2b-884d-342964cfe25f@igalia.com>
Date: Fri, 20 Mar 2026 16:41:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 10/12] drm/xe/display: Respect remapped plane alignment
To: "Shankar, Uma" <uma.shankar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20260319100707.60157-1-tvrtko.ursulin@igalia.com>
 <20260319100707.60157-11-tvrtko.ursulin@igalia.com>
 <DM4PR11MB636071EEE02758F16A225D93F44CA@DM4PR11MB6360.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <DM4PR11MB636071EEE02758F16A225D93F44CA@DM4PR11MB6360.namprd11.prod.outlook.com>
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


On 20/03/2026 09:20, Shankar, Uma wrote:
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
>> Subject: [PATCH v23 10/12] drm/xe/display: Respect remapped plane alignment
>>
>> Instead of assuming PAGE_SIZE alignment between the remapped planes respect
>> the value set in the struct intel_remapped_info.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 15 ++++++++++++---
>>   1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> index ead70ee48028..23a7ec41f01d 100644
>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> @@ -83,9 +83,6 @@ write_dpt_remapped_tiled(struct xe_bo *bo, struct
>> iosys_map *map,
>>   					 plane->dst_stride - plane->width);
>>   	}
>>
>> -	/* Align to next page */
>> -	dest = ALIGN(dest, XE_PAGE_SIZE);
>> -
>>   	return dest;
>>   }
>>
>> @@ -100,6 +97,18 @@ write_dpt_remapped(struct xe_bo *bo,
>>   		const struct intel_remapped_plane_info *plane =
>>   				&remap_info->plane[i];
>>
>> +		if (!plane->linear && !plane->width && !plane->height)
>> +			continue;
>> +
>> +		if (dest && remap_info->plane_alignment) {
>> +			const unsigned int index = dest / sizeof(u64);
>> +			const unsigned int pad =
>> +				ALIGN(index, remap_info->plane_alignment) -
>> +				index;
>> +
>> +			dest = write_dpt_padding(map, dest, pad);
>> +		}
>> +
> 
> I think, in general only concern will be that Linear will be broken if bisected till this point.
> But should not be a deal breaker I suppose.

I did not figure out what you meant here? Only the next patch in the 
series adds support for a linear (aux) plane and that then is not 
exposed to userspace until the last. If I broke something here it is not 
intentional but I do not see it.

Two tiled planes in a single fb? Is that a possible use case? But then I 
changed it from assuming 4k alignment to what is specified in remap_info.

Regards,

Tvrtko

> Looks Good to me.
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> 
>>   		dest = write_dpt_remapped_tiled(bo, map, dest, plane);
>>   	}
>>   }
>> --
>> 2.52.0
> 

