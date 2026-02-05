Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016D0EC1EB9
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 14:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E8810E1E1;
	Thu,  5 Feb 2026 14:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="APgP1gd8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC40310E1E1
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 14:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770301055; x=1801837055;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eIwW3e2KFookQsLNS9u27GPAhkRcAsXeXmCcUJcfLZk=;
 b=APgP1gd8YeN+XC4VLWdGO//2+u8R0ywRGA/eNgjNxtTsteukbup9hxFP
 fM4Xfkm5iPsd0CenW4W3MSoCb8mNVuqkoqzOeL9X+n6JR5noOppREy8eK
 ee6FFUqorJV+rNHplJSuCa0cnZ8liZGiy2i+RybuzBbxKwslYWpUTxlp2
 lB65bmIV38vCPwF1R8AwE25aW/bdFrVXjQVm9EauIDfwbOGBBUfOgNo9e
 a11rXwrH/tZjOVNY3WG/sOrLrwzVliGhqTDN+8E4iWFhcDacMxsb1NfzO
 nVyGqYk66HId+GN9ypiY0SHii9GfKn2FaGFQSG19jG3aPTES71qOZBhgT A==;
X-CSE-ConnectionGUID: /4Ri9/rySoCO7vs2JeI3sw==
X-CSE-MsgGUID: mlnquUuNSzm+udloNt2CMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="75119035"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="75119035"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 06:17:34 -0800
X-CSE-ConnectionGUID: ZQtsVqzoRHOqAgeX9aDFJg==
X-CSE-MsgGUID: GHo4PrK6Qk+GVMzWYL1xmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="210457435"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.124])
 ([10.245.244.124])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 06:17:33 -0800
Message-ID: <847e5437-994c-4fa2-a316-a6b9f92d73bb@intel.com>
Date: Thu, 5 Feb 2026 14:17:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/query: Only advertise NO_COMPRESSION hint on
 devices with flat CCS
To: "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
Cc: "Summers, Stuart" <stuart.summers@intel.com>
References: <20260205082048.2988738-2-sanjay.kumar.yadav@intel.com>
 <363425b3ac18605c3f3625064c7bcbe407d73dcd.camel@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <363425b3ac18605c3f3625064c7bcbe407d73dcd.camel@intel.com>
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

On 05/02/2026 13:43, Souza, Jose wrote:
> On Thu, 2026-02-05 at 13:50 +0530, Sanjay Yadav wrote:
>> Devices like CRI have GRAPHICS_VER >= 20 but don't have compression
>> support their PAT table (xe3p_xpc_pat_table) has no compression-
>> enabled
>> entries.
>>
>> Only advertise HAS_NO_COMPRESSION_HINT flag when the device actually
>> has
>> flat CCS and thus compression capability.
> 
> Is this change required to fix a bug? Semantically, it doesn't make
> much sense. If a device doesn't support compression and we pass
> DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION during BO creation, I don't see a
> problem with it. You could optimize and always enable this flag
> internally for this device, but passing it during creation isn't wrong.

Yeah, there is no real bug. But having HAS_NO_COMPRESSION return false 
to reflect that tagging buffers with NO_COMPRESSION is not 
relevant/needed on this device, since compression as a feature is either 
disabled or does not even exist in the hw, also seems reasonable.

The motivation was originally IGT, just to make it a bit simpler to 
detect when this flag is bogus, on certain platforms. And from UMD pov 
having it more accurately reflect whether using this flag is relevant or 
not seemed reasonable.

We can try to so fix the IGT issue in another way, without touching this 
flag, if preferred.

> 
>>
>> Fixes: 78d91ba6bd796 ("drm/xe/uapi: Add NO_COMPRESSION BO flag and
>> query capability")
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: José Roberto de Souza <jose.souza@intel.com>
>> Cc: Stuart Summers <stuart.summers@intel.com>
>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_query.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_query.c
>> b/drivers/gpu/drm/xe/xe_query.c
>> index 34db266b723f..c152ebfbd7d8 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -335,7 +335,7 @@ static int query_config(struct xe_device *xe,
>> struct drm_xe_device_query *query)
>>   	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_XE_GPUSVM))
>>   		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
>> ;
>> -	if (GRAPHICS_VER(xe) >= 20)
>> +	if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe))
>>   		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_
>> HINT;
>>   	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=

