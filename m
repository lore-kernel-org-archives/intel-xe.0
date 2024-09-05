Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D64CCD4F5B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 07:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5731B10E0C9;
	Thu,  5 Sep 2024 07:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFNJkiKJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F00B10E729
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 07:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725522400; x=1757058400;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZF6Omp5D/BYMLICH0qsjECnGu3uH7EmY7CTEJ3HmQUI=;
 b=jFNJkiKJDHO1M2M1HnAJIrVccQDeubeKQ0040S3iqzI7JzUqAsXHZumk
 lcstAbzqXNfCX+vKzaKtS/pEgYdDyOfFcIhnF/G9Oo3hk9tCFuqiZ98fq
 tE5RfvFPu+qCnC7YZIOP13h74hk984ESU3VDPGmUdryf7H5Nt9r3C46k6
 Mg/8b0XSldMeFeeow1qADc3+pL+JRSc3Kl8oVGk1eosL0+N/FmnOYujcU
 E00o1jbQkU3lupAesPd5W4dOvAJuN3i21Y+mZmEbY9GKVFruKYSe4LkS3
 JbsH/AZVKrhwEubyaPTjfXh+97QJfaPR5IK1sXGW6C4ZDixuqHJgYEgPp Q==;
X-CSE-ConnectionGUID: r2ynhDutRn6kMmK6kLWqYQ==
X-CSE-MsgGUID: XErfSgvsTNSTZ3i5YATXIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="34791791"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="34791791"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 00:46:40 -0700
X-CSE-ConnectionGUID: WS+2OJp2QOeTS394GW0F4Q==
X-CSE-MsgGUID: aE6RjZqkSjqAMWcAJ7/gXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="70331136"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.139])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 00:46:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH 3/3] drm/xe/pciids: separate ARL and MTL PCI IDs
In-Reply-To: <3241416b-92d0-4ca2-9329-43ffee85819b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1725443121.git.jani.nikula@intel.com>
 <a30cb0da7694a8eccceba66d676ac59aa0e96176.1725443121.git.jani.nikula@intel.com>
 <3241416b-92d0-4ca2-9329-43ffee85819b@intel.com>
Date: Thu, 05 Sep 2024 10:46:35 +0300
Message-ID: <87mskmr19g.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 05 Sep 2024, "Chauhan, Shekhar" <shekhar.chauhan@intel.com> wrote:
> On 9/4/2024 3:16 PM, Jani Nikula wrote:
>> Avoid including PCI IDs for one platform to the PCI IDs of another. It's
>> more clear to deal with them completely separately at the PCI ID macro
>> level.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pci.c   |  1 +
>>   include/drm/intel/xe_pciids.h | 13 ++++++++-----
>>   2 files changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index b1cf21d77def..5c5eef2ae725 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -394,6 +394,7 @@ static const struct pci_device_id pciidlist[] = {
>>   	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
>>   	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
>>   	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
>> +	XE_ARL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
> With this approach of segregating PCI IDs of two platforms, wouldn't it 
> make more sense to have two separate platform descriptors as well, say, 
> mtl_desc and a new one "arl_desc"?

Not if they are exactly the same.

>>   	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
>>   	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
>>   	XE_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
>> diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
>> index 334ab02ed6ca..67baa7c2246a 100644
>> --- a/include/drm/intel/xe_pciids.h
>> +++ b/include/drm/intel/xe_pciids.h
>> @@ -176,16 +176,19 @@
>>   	XE_ATS_M150_IDS(MACRO__, ## __VA_ARGS__),\
>>   	XE_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
>>   
>> -/* MTL / ARL */
>> +/* ARL */
>> +#define XE_ARL_IDS(MACRO__, ...)		\
>> +	MACRO__(0x7D41, ## __VA_ARGS__),	\
>> +	MACRO__(0x7D51, ## __VA_ARGS__),        \
>> +	MACRO__(0x7D67, ## __VA_ARGS__),	\
>> +	MACRO__(0x7DD1, ## __VA_ARGS__)
>> +
> Also, if we're following platform public release timelines, can we have 
> MTL block of PCI IDs above the ARL block?

Can do if it matters.

BR,
Jani.

>> +/* MTL */
>>   #define XE_MTL_IDS(MACRO__, ...)		\
>>   	MACRO__(0x7D40, ## __VA_ARGS__),	\
>> -	MACRO__(0x7D41, ## __VA_ARGS__),	\
>>   	MACRO__(0x7D45, ## __VA_ARGS__),	\
>> -	MACRO__(0x7D51, ## __VA_ARGS__),        \
>>   	MACRO__(0x7D55, ## __VA_ARGS__),	\
>>   	MACRO__(0x7D60, ## __VA_ARGS__),	\
>> -	MACRO__(0x7D67, ## __VA_ARGS__),	\
>> -	MACRO__(0x7DD1, ## __VA_ARGS__),        \
>>   	MACRO__(0x7DD5, ## __VA_ARGS__)
>>   
>>   /* PVC */

-- 
Jani Nikula, Intel
