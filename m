Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE88C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 10:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE2E10FDDC;
	Mon, 11 Mar 2024 10:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EegwW7Hr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D462A10FDDC
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 10:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710154731; x=1741690731;
 h=message-id:date:subject:from:to:references:in-reply-to:
 mime-version; bh=BqYpuGBSKgzJWcHU97dFk1CXgSjWUgZFSXIINwkarn8=;
 b=EegwW7HrBsLNmGy9OE+voL7wEeobZaW2Jg6q3togPZ80ugqRzopjQXMR
 W8mi6711ukxalflheeYHEiK5/YK+EmvVhXYxjkiQdBwrNAlpXCpjjNIpY
 fl79KyvQwkLNKQZCNypSkPYpHl3jqJUt2ImRdK77ypM1xqyajgoXyIRgE
 L0W3rCKIBn00sp4pAL/CAkharz2eJ0M1rPj0Yg/8teMwk9dSn3PJiYcLQ
 6RqhRhWDdytpm9KzxRJ5xrmOQ0oNwt9Epi7WxqXnvMnkKJbzE+ttOe2wc
 CNkbMMWKTTHNqgbvSIuOKmiZ4EWokI1EP/pVxUr++0WJ/9EJplgB+Layz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4658451"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208,217";a="4658451"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 03:58:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208,217";a="15692017"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 03:58:49 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 03:58:48 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 03:58:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 03:58:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 03:58:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlER3FHKZgum93pzvn/VvPA6MmqZwpf8I3qXwZniAuv7MTwZmomrit8XWGfod/XRoMndjOysPyXSXpPVnuqPWjxb+Hs0QhMpyJaAk1GgYiDS/KTv59yy8mSKQLf2zs/sZNaL90QgGa57iE5ntC57lu8P4rpwx5ylce0KhrXj2Lyr/4FUHb76hijr8P6YsZaFrpWoGjYd4b0hme+DMbUfs4Ak4Te/AD+5lh1xreyysMFRlZ2UkXkLUlg9b9X9+OGAtcWpQfQ2C5SSLQ7VJb33kGvx5ijM6y7iMXyaH580SjQXXIBEx+caaSBIv+FTzPg32pXisYfVLszwwU7mqPnc7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+utNyx8yh59kpAAK7NTj+F9UnoTERV6f3UyGr3DRkuY=;
 b=YLFyKV8oq98gLKP5PdDirXp/gMWy/Fj+SyVkSImvwt0tUZ0auH5bSpYQmT7uCbyOJ2Ddgj8vc+a8YFY+9M2/VY8ebLgm6xoN2+RS5CKR+BL5DhCT/YFvKfSbMiI4sIuaFimXC1u2HUAhW7Qz8CPiQsLcwHyyViuBQNCFoQ2zDx6sv5cO45kmm9sBA4kyHNFjrwPYCagZI2v2paaJXohcrPfH3h9NIFEHJLPfUTTZfSh7Kxg1TWNB0siO5768NgXX71UBXX2RBDPoYG5WFMNW77NO+N0OwJE0ROEBmshxyVSRKkFiT+oV7dWbxqXIhV+JVg9v4TY+f64FXNmQOhuKxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CY8PR11MB7084.namprd11.prod.outlook.com (2603:10b6:930:50::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.14; Mon, 11 Mar
 2024 10:58:43 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 10:58:43 +0000
Content-Type: multipart/alternative;
 boundary="------------FyMLB9TFiinddMMvvTVUOKhZ"
Message-ID: <aa1581f0-232b-4223-8f03-fd1523967164@intel.com>
Date: Mon, 11 Mar 2024 16:28:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] RFC drm/xe: check pcode init status only on root gt
 of root tile
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: <intel-xe@lists.freedesktop.org>
References: <20240308085517.2030484-1-riana.tauro@intel.com>
 <20240308085517.2030484-2-riana.tauro@intel.com>
 <1ecdf83e-ef3e-43ef-ba09-6b5e6fc8cfc5@intel.com>
In-Reply-To: <1ecdf83e-ef3e-43ef-ba09-6b5e6fc8cfc5@intel.com>
X-ClientProxiedBy: PN2PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::35) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CY8PR11MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aea5cdf-6261-428f-3259-08dc41ba379b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M4ixx1A7qqm9DiYQqD/YCXMY9dIWRQpHjBEZj5Yi5SAj/nz+uD0w3NmIQ9v5ScKdzUrz5MFF8xlD+R+elcNOf+K5Q4juzFZwYyaG1sCGSoYg8tPdabd5o/LdP9MevCnjNchzMVYVs/U28DSH9CV9MJes9oVBrqfpfjp3uoWKZkySdgZLF0kyGnwsuZNIx2naaBw1LNPnNZ1pfatr0wedP29ScEQKzO1aPEspCLdnVr+rKhH9JLb1MZtOrzkPo2Cm6UEGwUjpomeiVtmMXuaQkm69fDjyHH4lpmCAl/xWVtPMYcZTAMWBGjB4RVFaG5z/tXaF6I9DGbB59d8w+baFkX57rOKDVIgSb++iWohOihTPJgcoMtiZYfdZwgfWmtWvZ5AuJEgcl8NGxHbjI00Pk25ZYmgtpF0yOUN0j/7AcX6SUyJQlNpc8I/yz+XQ9yOqpPHDg1Al5k9oKrp3FcfV9Dxwgjp+COlWzBqDXWmufYHRL4W6RvVo0dvufxJGIsJMlCT25UDUIHHSXWmAndjkXjLCQF7b3Ww88Zrm2oBf+k8mLoU8P0M+1TaC7XsRLfKsC4fOC58zmP46J5CbBJRe1e6EWmryKwLnGDI2NDkgr1OXqlqIpBrPsVHwvkdVREjCzLH/XDdJbsy1iIb+J4L60qZQH0ReaiHufi1TqUbvaVU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjBxNTN2RU1lajB3NWxpU2hOUzB3T3ozL0tza1NMcDhGRFMwMDdTUmVQaFFt?=
 =?utf-8?B?NjVKbHlhckJtQVY1WmZJN0RHT2d3bXAwSGlTWk1UQ3FFT3RURVJ1cFN0WXIw?=
 =?utf-8?B?QkVrWkVaT0pqQTZJQkRSM2RjWmFaZ0dadDBvcFc2R1NGRGpTTmNZR0Z0eWg0?=
 =?utf-8?B?S1k2anl2dDRqV29zOGZobmw3cGxEM2grNkRpM3QzUjdvV21MQ0FJMG1RRFFz?=
 =?utf-8?B?N0hjZTNMd2JKYlhvdVhINUxUOVdkUlVYQW92NjRaRExIRVpEQ1liOXJNWlp2?=
 =?utf-8?B?UldKSUwraENHaEVxZ1FDell5bmlwS00xOUVNcXQ2WTkwKzRUWnovLzV3anNI?=
 =?utf-8?B?dFZEMERNOTdsdDdrcWdqaDJlNUtuSnBmNGhCMWsxTDJUMzlxQUwwUGJJb29i?=
 =?utf-8?B?UlY0THVTSGxxSE9KdHJYRUZOdWRFajFNNytJSWJ1cExGVlpNS2VOSXNjR0g5?=
 =?utf-8?B?Q09xbXNsanM4Zjg3MTdqZmtPUXNhanhJQyttZVNFY0wxRUtRRmx6Nm5LTDJ5?=
 =?utf-8?B?aWVubjU3ZGhVL04yZGIvTklqRGNnQlpFWmpZQXk2RmQ3bzVnSVhBVUFSbm83?=
 =?utf-8?B?YWQzUGN4cGMvTUhDOWVBcHZqbWpNeFV4ZTMvTzNLYUFQOVpCQWVYNTRGanlN?=
 =?utf-8?B?c1ZqMHgyaGc4Skd2aDZEV1hUTEhPanlEZjFFQzRReEQrYTJlMmlHWGl0MHlt?=
 =?utf-8?B?NFJaRE9XL2UyS1U4NUNZL3R6N0VzU2s0L29ud2VCeU4weW4vM3BoRktha25C?=
 =?utf-8?B?NGdhUjlleXZGMzJmZzM2RzVmeE1hdG1YNHlWejlTSG1PZXRidUUwSzMveEVT?=
 =?utf-8?B?a1F4V0JkL0tzcHRueEZlTmNkTHljWU1VTkpJSkpxeks4KzhSOEFpT0toMXp6?=
 =?utf-8?B?eS8xQk0wNjVRZkV4TExkcGhmZkkyWkthQnh3Tmd2YW1SVWVzQUtiMWVTcXlU?=
 =?utf-8?B?NEJtSkt4TUhHRFkvdHdjKzFzU1lEaU5wbFQ2V0svZDVzN2VwaEUreitFUWo5?=
 =?utf-8?B?MEttNms4TE5TWDJMaTMzYzcwN2RNdjB5UVN3VU1ralgwdFRPbXZVQjY4eFN6?=
 =?utf-8?B?ang2amM2YzdWcEthLzFtN1dZZWwzS0pDMFVzbk1PTTA5WnlrWDhBM25hNDlS?=
 =?utf-8?B?RWRUS3J5M21KdExiQ2dCOVltd3VTL2dPOG1ZVGJHbEtBUFZKbm8vYm1icUp6?=
 =?utf-8?B?NHJqTk9lSktTMVloREZ0aTBuU2ZjU3JWRlB5dzFTMGN1WWNrL0xERTNKRHd0?=
 =?utf-8?B?MDRMTlhTNnRaOEczSmJzenJmeTRRODV1ME40Z3ZUNE00V1hKT0t1ZnpUbWsr?=
 =?utf-8?B?eEdqMkUvb2g1TElBZ0kraDRIcU91d3lNaE9CektUaHR0ajZUbUlUYnJ1T1N6?=
 =?utf-8?B?ZjYvR1hmZFRTZEd0MkNGK254eGtlMmlaK1oxbU8wNVllSUsxMXNBSHplYjFQ?=
 =?utf-8?B?U3JPN3hkUnZPeDVoRXlkRnMvenVMSlF6d0V5a3BjUzFwbk1YaVhtSVpjWnJU?=
 =?utf-8?B?K3haZk8vSkRjSS9aNXI3U0hXUUNnQlczbWRrUFhkcVNVUU9WWXltU3ZxM0lz?=
 =?utf-8?B?WmJycnBTbE9pSWlHUUtBanNrTy9QODdVREhGeFBaVGk3MEZpUWlmNlcwcWxv?=
 =?utf-8?B?Ymp4L2ZnMHRjUWVvd3R0WFhlb2paVXlRR3c3dFRleDNWdkc3Rml3RUlPMHYy?=
 =?utf-8?B?QkcrcTBhUXYvUmEwWGhYTEVPSVhKWmhHaktodDc4M3Z1RnJQTUZSQkpnLzht?=
 =?utf-8?B?RHIvSlRoQmhoUEVOME9HcG1DVjlWdmZFdEtyZ1VmWXY0NkdDMGswckFkL0R4?=
 =?utf-8?B?aW4vVVp2ajNGcWxrTkY1TkJOaEppYkxua1VQSkxPUzhvbmhHVER4RExhaG1X?=
 =?utf-8?B?RGttMFNzbGI4RS94RFNKdllOQStFdEVjK09UM2JENW54bWc1VkRIQ2lRL3dP?=
 =?utf-8?B?d0xmaWV3N3hucEk2S3djTGZsSGh2WmNveDJuaHBqOWtRTngwUUtiRlF0aWk0?=
 =?utf-8?B?bWdMTmt3R29yZnpLa1EramFYVCtMZ1lxOExjU0gwTE15N3JkT1RQcDBkWmkx?=
 =?utf-8?B?aWdrV3Rnejl0T1lYbnU1NU5Da0w2aFdyRmhLYUlhYUJpbDg3ZjE4dklKVlZ1?=
 =?utf-8?B?citrOTRMT0dOMU5qL0tNRFJmQnJXSmpZY1JPbG0zMzlPZVhacWdadjBhdlBF?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aea5cdf-6261-428f-3259-08dc41ba379b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 10:58:43.5311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orlZul23J5Z4VFZSQufmzNIazZQR3b5v17xC28033UUFwzv1b4TF3u7gj5oMv1GVCSq3gZOQeqk0Uh7lN/o10P58gVDRB/EVL9JE/vBrKnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7084
X-OriginatorOrg: intel.com
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

--------------FyMLB9TFiinddMMvvTVUOKhZ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 11-03-2024 15:48, Ghimiray, Himal Prasad wrote:
>
>
> On 08-03-2024 14:25, Riana Tauro wrote:
>> The root tile indicates the pcode initialization is complete
>> when all tiles have completed their initialization.
>> So the mailbox can be polled only on the root tile.
>> Check pcode init status only on root tile and move it to
>> device probe early as root tile is initialized there.
>> Also make similar changes in resume paths.
>>
>> v2: Add lock/unlocked version of pcode_mailbox_rw
>>      to allow pcode init to be called in device
>>      early probe (Rodrigo)
>
> HI Riana,
>
> Patch looks good. Can you please add source to mentioned info in the 
> commit?
>
> "The root tile indicates the pcode initialization is complete
>
> when all tiles have completed their initialization. So the mailbox can be polled only on the root tile"

Thanks for the offline info.

Patch looks good to me.

Reviewed-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>

>> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c | 21 +++++---
>>   drivers/gpu/drm/xe/xe_pcode.c  | 93 ++++++++++++++++++++--------------
>>   drivers/gpu/drm/xe/xe_pcode.h  |  3 +-
>>   drivers/gpu/drm/xe/xe_pm.c     | 16 +++---
>>   4 files changed, 78 insertions(+), 55 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 919ad88f0495..83dd60f68566 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -413,8 +413,14 @@ static int xe_set_dma_info(struct xe_device *xe)
>>   	return err;
>>   }
>>   
>> -/*
>> - * Initialize MMIO resources that don't require any knowledge about tile count.
>> +/**
>> + * xe_device_probe_early: Device early probe
>> + * @xe: xe device instance
>> + *
>> + * Initialize MMIO resources that don't require any
>> + * knowledge about tile count. Also initialize pcode
>> + *
>> + * Return: 0 on success, error code on failure
>>    */
>>   int xe_device_probe_early(struct xe_device *xe)
>>   {
>> @@ -428,6 +434,10 @@ int xe_device_probe_early(struct xe_device *xe)
>>   	if (err)
>>   		return err;
>>   
>> +	err = xe_pcode_ready(xe_root_mmio_gt(xe), false);
>> +	if (err)
>> +		return err;
>> +
>>   	return 0;
>>   }
>>   
>> @@ -506,11 +516,8 @@ int xe_device_probe(struct xe_device *xe)
>>   	if (err)
>>   		return err;
>>   
>> -	for_each_gt(gt, xe, id) {
>> -		err = xe_pcode_probe(gt);
>> -		if (err)
>> -			return err;
>> -	}
>> +	for_each_gt(gt, xe, id)
>> +		xe_pcode_probe(gt);
>>   
>>   	err = xe_display_init_noirq(xe);
>>   	if (err)
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>> index b324dc2a5deb..6c0009fcd2fe 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>> @@ -43,8 +43,6 @@ static int pcode_mailbox_status(struct xe_gt *gt)
>>   		[PCODE_ERROR_MASK] = {-EPROTO, "Unknown"},
>>   	};
>>   
>> -	lockdep_assert_held(&gt->pcode.lock);
>> -
>>   	err = xe_mmio_read32(gt, PCODE_MAILBOX) & PCODE_ERROR_MASK;
>>   	if (err) {
>>   		drm_err(&gt_to_xe(gt)->drm, "PCODE Mailbox failed: %d %s", err,
>> @@ -55,17 +53,15 @@ static int pcode_mailbox_status(struct xe_gt *gt)
>>   	return 0;
>>   }
>>   
>> -static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
>> -			    unsigned int timeout_ms, bool return_data,
>> -			    bool atomic)
>> +static int __pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
>> +			      unsigned int timeout_ms, bool return_data,
>> +			      bool atomic)
>>   {
>>   	int err;
>>   
>>   	if (gt_to_xe(gt)->info.skip_pcode)
>>   		return 0;
>>   
>> -	lockdep_assert_held(&gt->pcode.lock);
>> -
>>   	if ((xe_mmio_read32(gt, PCODE_MAILBOX) & PCODE_READY) != 0)
>>   		return -EAGAIN;
>>   
>> @@ -87,6 +83,18 @@ static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
>>   	return pcode_mailbox_status(gt);
>>   }
>>   
>> +static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
>> +			    unsigned int timeout_ms, bool return_data,
>> +			    bool atomic)
>> +{
>> +	if (gt_to_xe(gt)->info.skip_pcode)
>> +		return 0;
>> +
>> +	lockdep_assert_held(&gt->pcode.lock);
>> +
>> +	return __pcode_mailbox_rw(gt, mbox, data0, data1, timeout_ms, return_data, atomic);
>> +}
>> +
>>   int xe_pcode_write_timeout(struct xe_gt *gt, u32 mbox, u32 data, int timeout)
>>   {
>>   	int err;
>> @@ -109,15 +117,19 @@ int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1)
>>   	return err;
>>   }
>>   
>> -static int xe_pcode_try_request(struct xe_gt *gt, u32 mbox,
>> -				u32 request, u32 reply_mask, u32 reply,
>> -				u32 *status, bool atomic, int timeout_us)
>> +static int pcode_try_request(struct xe_gt *gt, u32 mbox,
>> +			     u32 request, u32 reply_mask, u32 reply,
>> +			     u32 *status, bool atomic, int timeout_us, bool locked)
>>   {
>>   	int slept, wait = 10;
>>   
>>   	for (slept = 0; slept < timeout_us; slept += wait) {
>> -		*status = pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
>> -					   atomic);
>> +		if (locked)
>> +			*status = pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
>> +						   atomic);
>> +		else
>> +			*status = __pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
>> +						     atomic);
>>   		if ((*status == 0) && ((request & reply_mask) == reply))
>>   			return 0;
>>   
>> @@ -158,8 +170,8 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>>   
>>   	mutex_lock(&gt->pcode.lock);
>>   
>> -	ret = xe_pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
>> -				   false, timeout_base_ms * 1000);
>> +	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
>> +				false, timeout_base_ms * 1000, true);
>>   	if (!ret)
>>   		goto out;
>>   
>> @@ -177,8 +189,8 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>>   		"PCODE timeout, retrying with preemption disabled\n");
>>   	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 1);
>>   	preempt_disable();
>> -	ret = xe_pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
>> -				   true, timeout_base_ms * 1000);
>> +	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
>> +				true, timeout_base_ms * 1000, true);
>>   	preempt_enable();
>>   
>>   out:
>> @@ -238,15 +250,16 @@ int xe_pcode_init_min_freq_table(struct xe_gt *gt, u32 min_gt_freq,
>>   }
>>   
>>   /**
>> - * xe_pcode_init - Ensure PCODE is initialized
>> + * xe_pcode_ready - Ensure PCODE is initialized
>>    * @gt: gt instance
>> + * @locked: true if lock held, false otherwise
>>    *
>> - * This function ensures that PCODE is properly initialized. To be called during
>> - * probe and resume paths.
>> + * This function ensures that PCODE is properly initialized. Can be called
>> + * without locks only in early probe.
>>    *
>>    * It returns 0 on success, and -error number on failure.
>>    */
>> -int xe_pcode_init(struct xe_gt *gt)
>> +int xe_pcode_ready(struct xe_gt *gt, bool locked)
>>   {
>>   	u32 status, request = DGFX_GET_INIT_STATUS;
>>   	int timeout_us = 180000000; /* 3 min */
>> @@ -258,12 +271,10 @@ int xe_pcode_init(struct xe_gt *gt)
>>   	if (!IS_DGFX(gt_to_xe(gt)))
>>   		return 0;
>>   
>> -	mutex_lock(&gt->pcode.lock);
>> -	ret = xe_pcode_try_request(gt, DGFX_PCODE_STATUS, request,
>> -				   DGFX_INIT_STATUS_COMPLETE,
>> -				   DGFX_INIT_STATUS_COMPLETE,
>> -				   &status, false, timeout_us);
>> -	mutex_unlock(&gt->pcode.lock);
>> +	ret = pcode_try_request(gt, DGFX_PCODE_STATUS, request,
>> +				DGFX_INIT_STATUS_COMPLETE,
>> +				DGFX_INIT_STATUS_COMPLETE,
>> +				&status, false, timeout_us, locked);
>>   
>>   	if (ret)
>>   		drm_err(&gt_to_xe(gt)->drm,
>> @@ -273,24 +284,32 @@ int xe_pcode_init(struct xe_gt *gt)
>>   }
>>   
>>   /**
>> - * xe_pcode_probe - Prepare xe_pcode and also ensure PCODE is initialized.
>> + * xe_pcode_init - initialize pcode
>>    * @gt: gt instance
>>    *
>> - * This function initializes the xe_pcode component, and when needed, it ensures
>> - * that PCODE has properly performed its initialization and it is really ready
>> - * to go. To be called once only during probe.
>> + * This function initializes pcode. Used in resume paths
>>    *
>>    * It returns 0 on success, and -error number on failure.
>>    */
>> -int xe_pcode_probe(struct xe_gt *gt)
>> +int xe_pcode_init(struct xe_gt *gt)
>>   {
>> -	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->pcode.lock);
>> +	int ret;
>>   
>> -	if (gt_to_xe(gt)->info.skip_pcode)
>> -		return 0;
>> +	mutex_lock(&gt->pcode.lock);
>> +	ret = xe_pcode_ready(gt, true);
>> +	mutex_unlock(&gt->pcode.lock);
>>   
>> -	if (!IS_DGFX(gt_to_xe(gt)))
>> -		return 0;
>> +	return ret;
>> +}
>>   
>> -	return xe_pcode_init(gt);
>> +/**
>> + * xe_pcode_probe - Prepare pcode component
>> + * @gt: gt instance
>> + *
>> + * This function initializes the xe_pcode component.
>> + * To be called once only during probe.
>> + */
>> +void xe_pcode_probe(struct xe_gt *gt)
>> +{
>> +	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->pcode.lock);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
>> index 08cb1d047cba..e597dcc8ad9f 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode.h
>> @@ -9,8 +9,9 @@
>>   #include <linux/types.h>
>>   struct xe_gt;
>>   
>> -int xe_pcode_probe(struct xe_gt *gt);
>> +void xe_pcode_probe(struct xe_gt *gt);
>>   int xe_pcode_init(struct xe_gt *gt);
>> +int xe_pcode_ready(struct xe_gt *gt, bool locked);
>>   int xe_pcode_init_min_freq_table(struct xe_gt *gt, u32 min_gt_freq,
>>   				 u32 max_gt_freq);
>>   int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1);
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index 9fbb6f6c598a..83c316254e43 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -121,11 +121,9 @@ int xe_pm_resume(struct xe_device *xe)
>>   	for_each_tile(tile, xe, id)
>>   		xe_wa_apply_tile_workarounds(tile);
>>   
>> -	for_each_gt(gt, xe, id) {
>> -		err = xe_pcode_init(gt);
>> -		if (err)
>> -			return err;
>> -	}
>> +	err = xe_pcode_init(xe_root_mmio_gt(xe));
>> +	if (err)
>> +		return err;
>>   
>>   	xe_display_pm_resume_early(xe);
>>   
>> @@ -374,11 +372,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>   	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
>>   
>>   	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
>> -		for_each_gt(gt, xe, id) {
>> -			err = xe_pcode_init(gt);
>> -			if (err)
>> -				goto out;
>> -		}
>> +		err = xe_pcode_init(xe_root_mmio_gt(xe));
>> +		if (err)
>> +			goto out;
>>   
>>   		/*
>>   		 * This only restores pinned memory which is the memory
--------------FyMLB9TFiinddMMvvTVUOKhZ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11-03-2024 15:48, Ghimiray, Himal
      Prasad wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1ecdf83e-ef3e-43ef-ba09-6b5e6fc8cfc5@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 08-03-2024 14:25, Riana Tauro
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20240308085517.2030484-2-riana.tauro@intel.com">
        <pre class="moz-quote-pre" wrap="">The root tile indicates the pcode initialization is complete
when all tiles have completed their initialization.
So the mailbox can be polled only on the root tile.
Check pcode init status only on root tile and move it to
device probe early as root tile is initialized there.
Also make similar changes in resume paths.

v2: Add lock/unlocked version of pcode_mailbox_rw
    to allow pcode init to be called in device
    early probe (Rodrigo)</pre>
      </blockquote>
      <p>HI Riana,</p>
      <p>Patch looks good. Can you please add source to mentioned info
        in the commit?</p>
      <p>&quot;<span style="white-space: pre-wrap">The root tile indicates the pcode initialization is complete</span></p>
      <pre class="moz-quote-pre" wrap="">when all tiles have completed their initialization. So the mailbox can be polled only on the root tile&quot;</pre>
    </blockquote>
    <p>Thanks for the offline info.</p>
    <p>Patch looks good to me.<br>
    </p>
    <pre class="moz-quote-pre" wrap="">Reviewed-by: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a></pre>
    <p></p>
    <blockquote type="cite" cite="mid:1ecdf83e-ef3e-43ef-ba09-6b5e6fc8cfc5@intel.com">
      <blockquote type="cite" cite="mid:20240308085517.2030484-2-riana.tauro@intel.com">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com" moz-do-not-send="true">&lt;riana.tauro@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_device.c | 21 +++++---
 drivers/gpu/drm/xe/xe_pcode.c  | 93 ++++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_pcode.h  |  3 +-
 drivers/gpu/drm/xe/xe_pm.c     | 16 +++---
 4 files changed, 78 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 919ad88f0495..83dd60f68566 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -413,8 +413,14 @@ static int xe_set_dma_info(struct xe_device *xe)
 	return err;
 }
 
-/*
- * Initialize MMIO resources that don't require any knowledge about tile count.
+/**
+ * xe_device_probe_early: Device early probe
+ * @xe: xe device instance
+ *
+ * Initialize MMIO resources that don't require any
+ * knowledge about tile count. Also initialize pcode
+ *
+ * Return: 0 on success, error code on failure
  */
 int xe_device_probe_early(struct xe_device *xe)
 {
@@ -428,6 +434,10 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_pcode_ready(xe_root_mmio_gt(xe), false);
+	if (err)
+		return err;
+
 	return 0;
 }
 
@@ -506,11 +516,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	for_each_gt(gt, xe, id) {
-		err = xe_pcode_probe(gt);
-		if (err)
-			return err;
-	}
+	for_each_gt(gt, xe, id)
+		xe_pcode_probe(gt);
 
 	err = xe_display_init_noirq(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index b324dc2a5deb..6c0009fcd2fe 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -43,8 +43,6 @@ static int pcode_mailbox_status(struct xe_gt *gt)
 		[PCODE_ERROR_MASK] = {-EPROTO, &quot;Unknown&quot;},
 	};
 
-	lockdep_assert_held(&amp;gt-&gt;pcode.lock);
-
 	err = xe_mmio_read32(gt, PCODE_MAILBOX) &amp; PCODE_ERROR_MASK;
 	if (err) {
 		drm_err(&amp;gt_to_xe(gt)-&gt;drm, &quot;PCODE Mailbox failed: %d %s&quot;, err,
@@ -55,17 +53,15 @@ static int pcode_mailbox_status(struct xe_gt *gt)
 	return 0;
 }
 
-static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
-			    unsigned int timeout_ms, bool return_data,
-			    bool atomic)
+static int __pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
+			      unsigned int timeout_ms, bool return_data,
+			      bool atomic)
 {
 	int err;
 
 	if (gt_to_xe(gt)-&gt;info.skip_pcode)
 		return 0;
 
-	lockdep_assert_held(&amp;gt-&gt;pcode.lock);
-
 	if ((xe_mmio_read32(gt, PCODE_MAILBOX) &amp; PCODE_READY) != 0)
 		return -EAGAIN;
 
@@ -87,6 +83,18 @@ static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
 	return pcode_mailbox_status(gt);
 }
 
+static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
+			    unsigned int timeout_ms, bool return_data,
+			    bool atomic)
+{
+	if (gt_to_xe(gt)-&gt;info.skip_pcode)
+		return 0;
+
+	lockdep_assert_held(&amp;gt-&gt;pcode.lock);
+
+	return __pcode_mailbox_rw(gt, mbox, data0, data1, timeout_ms, return_data, atomic);
+}
+
 int xe_pcode_write_timeout(struct xe_gt *gt, u32 mbox, u32 data, int timeout)
 {
 	int err;
@@ -109,15 +117,19 @@ int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1)
 	return err;
 }
 
-static int xe_pcode_try_request(struct xe_gt *gt, u32 mbox,
-				u32 request, u32 reply_mask, u32 reply,
-				u32 *status, bool atomic, int timeout_us)
+static int pcode_try_request(struct xe_gt *gt, u32 mbox,
+			     u32 request, u32 reply_mask, u32 reply,
+			     u32 *status, bool atomic, int timeout_us, bool locked)
 {
 	int slept, wait = 10;
 
 	for (slept = 0; slept &lt; timeout_us; slept += wait) {
-		*status = pcode_mailbox_rw(gt, mbox, &amp;request, NULL, 1, true,
-					   atomic);
+		if (locked)
+			*status = pcode_mailbox_rw(gt, mbox, &amp;request, NULL, 1, true,
+						   atomic);
+		else
+			*status = __pcode_mailbox_rw(gt, mbox, &amp;request, NULL, 1, true,
+						     atomic);
 		if ((*status == 0) &amp;&amp; ((request &amp; reply_mask) == reply))
 			return 0;
 
@@ -158,8 +170,8 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
 
 	mutex_lock(&amp;gt-&gt;pcode.lock);
 
-	ret = xe_pcode_try_request(gt, mbox, request, reply_mask, reply, &amp;status,
-				   false, timeout_base_ms * 1000);
+	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &amp;status,
+				false, timeout_base_ms * 1000, true);
 	if (!ret)
 		goto out;
 
@@ -177,8 +189,8 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
 		&quot;PCODE timeout, retrying with preemption disabled\n&quot;);
 	drm_WARN_ON_ONCE(&amp;gt_to_xe(gt)-&gt;drm, timeout_base_ms &gt; 1);
 	preempt_disable();
-	ret = xe_pcode_try_request(gt, mbox, request, reply_mask, reply, &amp;status,
-				   true, timeout_base_ms * 1000);
+	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &amp;status,
+				true, timeout_base_ms * 1000, true);
 	preempt_enable();
 
 out:
@@ -238,15 +250,16 @@ int xe_pcode_init_min_freq_table(struct xe_gt *gt, u32 min_gt_freq,
 }
 
 /**
- * xe_pcode_init - Ensure PCODE is initialized
+ * xe_pcode_ready - Ensure PCODE is initialized
  * @gt: gt instance
+ * @locked: true if lock held, false otherwise
  *
- * This function ensures that PCODE is properly initialized. To be called during
- * probe and resume paths.
+ * This function ensures that PCODE is properly initialized. Can be called
+ * without locks only in early probe.
  *
  * It returns 0 on success, and -error number on failure.
  */
-int xe_pcode_init(struct xe_gt *gt)
+int xe_pcode_ready(struct xe_gt *gt, bool locked)
 {
 	u32 status, request = DGFX_GET_INIT_STATUS;
 	int timeout_us = 180000000; /* 3 min */
@@ -258,12 +271,10 @@ int xe_pcode_init(struct xe_gt *gt)
 	if (!IS_DGFX(gt_to_xe(gt)))
 		return 0;
 
-	mutex_lock(&amp;gt-&gt;pcode.lock);
-	ret = xe_pcode_try_request(gt, DGFX_PCODE_STATUS, request,
-				   DGFX_INIT_STATUS_COMPLETE,
-				   DGFX_INIT_STATUS_COMPLETE,
-				   &amp;status, false, timeout_us);
-	mutex_unlock(&amp;gt-&gt;pcode.lock);
+	ret = pcode_try_request(gt, DGFX_PCODE_STATUS, request,
+				DGFX_INIT_STATUS_COMPLETE,
+				DGFX_INIT_STATUS_COMPLETE,
+				&amp;status, false, timeout_us, locked);
 
 	if (ret)
 		drm_err(&amp;gt_to_xe(gt)-&gt;drm,
@@ -273,24 +284,32 @@ int xe_pcode_init(struct xe_gt *gt)
 }
 
 /**
- * xe_pcode_probe - Prepare xe_pcode and also ensure PCODE is initialized.
+ * xe_pcode_init - initialize pcode
  * @gt: gt instance
  *
- * This function initializes the xe_pcode component, and when needed, it ensures
- * that PCODE has properly performed its initialization and it is really ready
- * to go. To be called once only during probe.
+ * This function initializes pcode. Used in resume paths
  *
  * It returns 0 on success, and -error number on failure.
  */
-int xe_pcode_probe(struct xe_gt *gt)
+int xe_pcode_init(struct xe_gt *gt)
 {
-	drmm_mutex_init(&amp;gt_to_xe(gt)-&gt;drm, &amp;gt-&gt;pcode.lock);
+	int ret;
 
-	if (gt_to_xe(gt)-&gt;info.skip_pcode)
-		return 0;
+	mutex_lock(&amp;gt-&gt;pcode.lock);
+	ret = xe_pcode_ready(gt, true);
+	mutex_unlock(&amp;gt-&gt;pcode.lock);
 
-	if (!IS_DGFX(gt_to_xe(gt)))
-		return 0;
+	return ret;
+}
 
-	return xe_pcode_init(gt);
+/**
+ * xe_pcode_probe - Prepare pcode component
+ * @gt: gt instance
+ *
+ * This function initializes the xe_pcode component.
+ * To be called once only during probe.
+ */
+void xe_pcode_probe(struct xe_gt *gt)
+{
+	drmm_mutex_init(&amp;gt_to_xe(gt)-&gt;drm, &amp;gt-&gt;pcode.lock);
 }
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index 08cb1d047cba..e597dcc8ad9f 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -9,8 +9,9 @@
 #include &lt;linux/types.h&gt;
 struct xe_gt;
 
-int xe_pcode_probe(struct xe_gt *gt);
+void xe_pcode_probe(struct xe_gt *gt);
 int xe_pcode_init(struct xe_gt *gt);
+int xe_pcode_ready(struct xe_gt *gt, bool locked);
 int xe_pcode_init_min_freq_table(struct xe_gt *gt, u32 min_gt_freq,
 				 u32 max_gt_freq);
 int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 9fbb6f6c598a..83c316254e43 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -121,11 +121,9 @@ int xe_pm_resume(struct xe_device *xe)
 	for_each_tile(tile, xe, id)
 		xe_wa_apply_tile_workarounds(tile);
 
-	for_each_gt(gt, xe, id) {
-		err = xe_pcode_init(gt);
-		if (err)
-			return err;
-	}
+	err = xe_pcode_init(xe_root_mmio_gt(xe));
+	if (err)
+		return err;
 
 	xe_display_pm_resume_early(xe);
 
@@ -374,11 +372,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	xe-&gt;d3cold.power_lost = xe_guc_in_reset(&amp;gt-&gt;uc.guc);
 
 	if (xe-&gt;d3cold.allowed &amp;&amp; xe-&gt;d3cold.power_lost) {
-		for_each_gt(gt, xe, id) {
-			err = xe_pcode_init(gt);
-			if (err)
-				goto out;
-		}
+		err = xe_pcode_init(xe_root_mmio_gt(xe));
+		if (err)
+			goto out;
 
 		/*
 		 * This only restores pinned memory which is the memory
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------FyMLB9TFiinddMMvvTVUOKhZ--
