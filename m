Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D599C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 04:04:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17F810E02E;
	Fri, 15 Dec 2023 04:04:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27B910E02E
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 04:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702613043; x=1734149043;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=V//9vUeolZ9mQ2bPaYqxUSfOquxXbDh+CflP331gYWE=;
 b=KmyiKyjsWgcsy5+kZ1c2Ha2polVXPAIpCcaOl/IFDkkcVSYqy5lUJ0bB
 xVfXsVITr/eb+FCBfvD4L4z7WGDXu0qdgfNT9tEMUJA0r8ET6SInSnTPU
 c/zdrJ65qlPdrr/JzxsmxFFw0pQrqbCK85nCa5jOJUMVwUao6VG/TnMUv
 J2EcuzDzdd68ChomNQwebnhwWDsNb8Svg4Z8VnoI00bi4V0eAlx4YV6c3
 OtleEBYbefePCExHasd/b7bsoUoRQcTuTPTWgE2L0asTVyw3RZ7yBDacS
 wptE1aFf4NlNdKsh+k6Sfs7Cd0hfV22EPQrxReInPVQBlraQVmozUe4Lf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="461689635"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; d="scan'208";a="461689635"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 20:04:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="767835901"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; d="scan'208";a="767835901"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 20:04:00 -0800
Message-ID: <0998a123-7852-49ab-941a-7b3c9acb2b11@linux.intel.com>
Date: Fri, 15 Dec 2023 09:36:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/14] drm/xe/uapi: Order sections
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
References: <20231207135009.7-1-francois.dugast@intel.com>
 <20231207135009.7-9-francois.dugast@intel.com>
 <6bqke2ogy77tiprn6hifcyy57yclahjpi4ueeuatxmtfuvmwt7@qypor7sctqx7>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <6bqke2ogy77tiprn6hifcyy57yclahjpi4ueeuatxmtfuvmwt7@qypor7sctqx7>
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 12/15/23 02:27, Lucas De Marchi wrote:

Hi  Lucas,

> On Thu, Dec 07, 2023 at 01:50:03PM +0000, Francois Dugast wrote:
>> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>> This patch doesn't modify any text or uapi entries themselves.
>> It only move things up and down aiming a better organization of the uAPI.
>>
>> While fixing the documentation I noticed that query_engine_cs_cycles
>> was in the middle of the memory_region info. Then I noticed more
>> mismatches on the order when compared to the order of the IOCTL
>> and QUERY entries declaration. So this patch aims to bring some
>> order to the uAPI so it gets easier to read and the documentation
>> generated in the end is able to tell a consistent story.
>>
>> Overall order:
>>
>> 1. IOCTL definition
>> 2. Extension definition and helper structs
>> 3. IOCTL's Query structs in the order of the Query's entries.
>> 4. The rest of IOCTL structs in the order of IOCTL declaration.
>> 5. uEvents
>> 6. PMU
>>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> ---
>> include/uapi/drm/xe_drm.h | 255 ++++++++++++++++++++------------------
>> 1 file changed, 132 insertions(+), 123 deletions(-)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index f9178fe024a5..b36f3bd53611 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -12,19 +12,51 @@
>> extern "C" {
>> #endif
>>
<snip>
>> +/**
>> + * DOC: uevent generated by xe on its pci node.
>> + *
>> + * DRM_XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset gt
>> + * fails. The value supplied with the event is always "NEEDS_RESET".
>> + * Additional information supplied is tile id and gt id of the gt unit for
>> + * which reset has failed.
>> + */
>> +#define DRM_XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
>
> Unrelated to this.... Aravind has a patch renaming this to make it
> future proof. We will need to either rename it now, or remove and leave
> its addition for later.

it was actual Himal who sent a patch to rework this.

@Himal what's your plan on this.

Thanks,
Aravind.
>
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>
> Lucas De Marchi
>
>> /**
>>  * DOC: XE PMU event config IDs
>>  *
>> -- 
>> 2.34.1
>>
