Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1318DEC1E87
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 09:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C934310E840;
	Thu,  5 Feb 2026 09:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDFYmDJV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CB510E82D
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 09:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770284969; x=1801820969;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HEHUmV3onXWw0xoes0pTXHnHKuLzkp/ThDSlGue1QBQ=;
 b=KDFYmDJVL1w7mLUtrxV158Vr7KcapEUCjnDUZlj2xMGSvts22MoS7iHH
 3wF5vcyi7ImKbJL3j2k/QvobasLagQ1ck08eVOZHoz7rSPTpkK1IAsUFe
 uUMDrME+xLHMAT3JjVHOyXT44eEGmMcA9AYUjMnUzTX57GRJzMHjs9GI+
 E3+K+AZAs0YPxVx/+cqBedZQZ34965LI1cSKkC0DThWfuxzF2tjCAdBKU
 hYYuKyOY9jeajkx+XrBxiim4vg4ncxz8/7TQAzUggLLnO0ArX9Js7EKkE
 uX08v5TiagJfRQG828MvHjLPpwom59KZ2eliteU4F2GFno2eysRlaZTtO w==;
X-CSE-ConnectionGUID: 1YzYmeAqS5iFL/6ZSTchQw==
X-CSE-MsgGUID: YunZbcNDQBSVUMG5LzDOwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70678209"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="70678209"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 01:49:29 -0800
X-CSE-ConnectionGUID: GmHvFUsySV+0vHPPEriLWQ==
X-CSE-MsgGUID: u+QVocJZStqy/Q2qU+G1uA==
X-ExtLoop1: 1
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.124])
 ([10.245.244.124])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 01:49:27 -0800
Message-ID: <ebd58543-6358-4396-8448-6125c3e87718@intel.com>
Date: Thu, 5 Feb 2026 09:49:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/query: Only advertise NO_COMPRESSION hint on
 devices with flat CCS
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
References: <20260205082048.2988738-2-sanjay.kumar.yadav@intel.com>
 <aYRlbv9tm0Jf-9VE@bvivekan-mob1>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <aYRlbv9tm0Jf-9VE@bvivekan-mob1>
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

On 05/02/2026 09:39, Vivekanandan, Balasubramani wrote:
> On 05.02.2026 13:50, Sanjay Yadav wrote:
>> Devices like CRI have GRAPHICS_VER >= 20 but don't have compression
>> support their PAT table (xe3p_xpc_pat_table) has no compression-enabled
>> entries.
>>
>> Only advertise HAS_NO_COMPRESSION_HINT flag when the device actually has
>> flat CCS and thus compression capability.
>>
>> Fixes: 78d91ba6bd796 ("drm/xe/uapi: Add NO_COMPRESSION BO flag and query capability")
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: José Roberto de Souza <jose.souza@intel.com>
>> Cc: Stuart Summers <stuart.summers@intel.com>
>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_query.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index 34db266b723f..c152ebfbd7d8 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -335,7 +335,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>>   	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_XE_GPUSVM))
>>   		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
>> -	if (GRAPHICS_VER(xe) >= 20)
>> +	if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe))
> 
> You don't need the graphics version check.

We chose not to support this on DG2/ATS, which has a very different flat 
CSS implementation in the hw, and would require different changes in the 
kmd. Focus was just on xe2+.

> 
> Regards,
> Bala
> 
>>   		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT;
>>   	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>> -- 
>> 2.52.0
>>

