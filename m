Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF38CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 11:38:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E7910E4AF;
	Thu, 12 Oct 2023 11:38:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FF710E4AF
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 11:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697110706; x=1728646706;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S1b8QpmCD8yznQuuAwiz219aEB6RnZCjitMmJjoX+JA=;
 b=NMxbXoziAQI8Ov5c85DJH0xM0zim8zeuQptI2DFBXLRk+7oUYNc/MA3E
 bxOdJ/ckQXhbhtWngPU7GjxLYjw3UPUgD/Y5ZZO0UpiwYH8UboU77JNNj
 vjBRW+zcHpaiT7W3EQ41FMvECtBRk+BuTN23L0lA5iiLIer9Yf3abh68M
 pr7js5bpYYk46ZHGb5gIVX+0+WMQPT+4YkkWa9MfIzAAlV+1y0phgRlxm
 nTBLIgf4fZu9L+PeaWHa2e6HGu+yEfWMRA74mbGt1EJaq1hmnzkdiuYcP
 kw4HEV2UQoMeva/685Eml+6grFEP8bA+cnwyh7e5/aT/WdZDtAsZhvmL7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="369964430"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="369964430"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 04:38:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="898075218"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="898075218"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 04:36:38 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 04:38:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 04:38:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 04:38:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNFahtCoJ4tmYHKi1FCnOFsC8NXSQ8MDPCAMWTgcRBhOPX8F2rsWG3OE6IUXkLcQI87ZoiZQAXoiU4+dF9Oik2Z9u3M9fx6hkXTWiDjL5DsHsOXc7PKRle37aLv3Co50PJAJTmXvlHys1jrmG6N9D12HkVPL2afvuw7bKkEWEcKCJEYb3jJRARIfodzYpkigPzkhQ0fvuja+AnWkMfvwbWRut2Kd4i+fc0DzyWlIetbq90w5mPG9oeqEHREF0QFQHOFXhl0x7+r76QaBdU0p5ZPzjmChLEnZBiMuS/N6aRWsQ9FvkwuGalDFaRI8DwVKuNKkKeaffMWGlcxlTpQ9Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v17vvTUPhko7H1LkrQ8kVbHAfq6notS0eumVmSOTtCo=;
 b=EScIWc1RqACJh7dfWvFm0Yq2yvmEbCEZpHqfPvnWF0uSfEPhcXmjnvu/xLE8p+THFlTvyhGdR+u4KtS12vzoRijtAu0jue8foJhyNGeDb5NF7SO3oLXaaGYRgF/GV0ChOoY2SkR49WuHV+Y9w+bHtEZ54spIJLA0E/wAGmEdk6QHXKuV312BL92DMSARXNYG0z6vkhRu0L/nuty4xXtPdOVPqVY7VtucAN1fssdM9iw1anQP8KuMsIgOt0Akzc9FniN08MkOGKs0zBtQ8iXB+zWJVY1Pq0C2rD7niLNIhfgQ2TYP3zvDztj83HHgwv5t/cAfnXXuRZFMblk8AlQ8Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB5946.namprd11.prod.outlook.com (2603:10b6:806:23a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.33; Thu, 12 Oct 2023 11:38:22 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::c2e3:634a:6cd3:7f46]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::c2e3:634a:6cd3:7f46%7]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 11:38:21 +0000
Message-ID: <569b3815-f0a2-45ba-8e09-244fbeb61daf@intel.com>
Date: Thu, 12 Oct 2023 17:08:12 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231012063209.56824-1-riana.tauro@intel.com>
 <20231012063209.56824-2-riana.tauro@intel.com>
 <0ad719c2-7308-43b7-a856-7553934eec6a@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <0ad719c2-7308-43b7-a856-7553934eec6a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0119.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c21cd8-3090-48aa-3120-08dbcb17bc8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9dCB6WbL0cijLofR8seMJJ8237/jIQPIbpCGTG+YOh3BAWBFm7OskZsEwMMM0ieZii6C+C5AZ3aDemBA4rwb8/b2QFolkKZvEE9tttAZGhA7p/4uDch/iXTYxr1jrqQ1gEI4jHo5XhIKh87Rh64/erjCTtjekPqw0S/ZE/dKaxql6PWauUAWm5KB2Q/nMNWzVj+ki880H7MdoZf2j4DA7fvJM2a6yS//Te2Ly5TegSdp9bZ+rVDmeHic5+UX48vqRtykd+SPKJabKbPztTuoNO6/haJ2CfgOcTqFneGFjeZY16wzAqtsdU8d0CjWf0G3oaRLZecZyfd1z2hscuDfGcmvo5ZqjkzP5ei9KI2LwaCbm4ZSqvX5btDwGRTQGeM6rsx105z5l458Vqmy9ybtw54UTMMEz9A1xUWjzXV617HA+JQGSMUVV7XYns8iSR8HTbFWkDAhCXDesBCfyKa4t1NAgciVUMAowJaCnSBXjqMBEjAZGPS3FbPaART8khpNtOpCn/bS9nhHDxe99/xOaYI9oYRvkIZQD8GTHSjZb+xqA+O0DjzAoxtsttcFMxdBs2ynz7OKLqrKcB7TKFSKnE1mLKV5E4GmfTb8M/bCdBZpa/uN3HzFEwotR9q7AMWgyMpkzU8urkkBVEp2/LNS+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(396003)(136003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(478600001)(2616005)(6486002)(26005)(107886003)(38100700002)(82960400001)(53546011)(6506007)(6512007)(44832011)(36756003)(6666004)(4326008)(8676002)(41300700001)(8936002)(5660300002)(66476007)(316002)(66556008)(2906002)(31696002)(86362001)(66946007)(31686004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enAzalM5dFJRR0ZoTGNuS2JWR0RFNUl5NCtFTlRVaUt6VEtvVlQwa0NPemlT?=
 =?utf-8?B?OURXUStLV3B0YVhTUjlSUXkxdCtaY2k2V0YvR3ZOSkF0ZE5wM3U1ckw5SWQ3?=
 =?utf-8?B?NHUrUDcvcFU4QU9QN3ltMjZxOEtrdlhYcFZqTUM3aEVWZG9WR1Q1OXJ2aWtS?=
 =?utf-8?B?TEVVUXh6QWdWWXVrQTMyMC9DaytIaWdkUWV1a21jTWNsVit1bW5BbytuUUl3?=
 =?utf-8?B?Nyt0WWZNc09HOGhBWTdObzRESUZiVDF6VXRMMDhFQmdBMVBDSDkyY09mZFNR?=
 =?utf-8?B?aHdhVHorMUpCYVZwbExyb0FlM21uWkdoRnRMcmx4R1lUVHMzTXVwQXd6eFk4?=
 =?utf-8?B?YnBrOStDN1kzdDJCeTVEZDFtYitoMmYxUG9GZmJLYXhndjB4bXV1OERJOWpH?=
 =?utf-8?B?R3pwSUwzTEZ0K2o5eEliaDRiOElOWkh6ZGxhbXRjVTdiVG5TamFGVXd1SXhN?=
 =?utf-8?B?SGlHQW14cUpwak96QXZ4TGQzYSsrQ3pVK0syU2s4NHV5SWJjOGEyYktmTFh4?=
 =?utf-8?B?UURkOXgzNjB2d25sQVpHU3ZBMXdYS05sV0VORjZldVMxTHVOOVZXNllBUUVk?=
 =?utf-8?B?bkpacjYvUUg4Tk5zZGk2ak4zUGV1OTUwZS9yQTQ4NUpBY2pxZUtHS3A2SGNx?=
 =?utf-8?B?RVlQL1Y1T3FKSC9mcVZDSG9ibHVvaGU5MFlST2JxZnRsaDJGWmVQbzZBalk5?=
 =?utf-8?B?R0Q3WDBxbHBjUHZwbVZFaC9Eb2RMc09zUHVYQjhjTDZKTEJocCs3bGhPRStq?=
 =?utf-8?B?d294dTFlL2cwY0J3bjlkYUdWZmNESS9zZUNNaXpEQlFIL1lDQXdLL0twcDRq?=
 =?utf-8?B?YitLS0diWXJFNVhneFlQeXZ4eVNVUWhkMTFOZ2xMM1UybjNDWG5EVzR1TWRu?=
 =?utf-8?B?azIxOWVIdWRPeDdvbExTK1FZQVNWUHpSaWM5RWxMTVlnRFBOU043VEw5MDlu?=
 =?utf-8?B?eTA5dWFNS0NjL0l6ZU01K3JMcHpOcXBTTXR2dzMzbWFHQkpZUDRoM1RMZlc5?=
 =?utf-8?B?bnVWa3dudWNZcTEyaDlzbXgxblBKdUxBbUY4N1EvcFJ5Qm5XM0RVQmpFeitS?=
 =?utf-8?B?ZHdxUlgyL2hhZ3docnJoTjNRWU9ndldtL1duQ29yc0dWc0FSUU55MzVVQ1Bw?=
 =?utf-8?B?SElVK0RSQnJReTdqVVdaczIvTVFDcTJvbDVSdlNldFUxZ1JpLzQ2NU1ZMkx2?=
 =?utf-8?B?emkrK1k0V0FJb2R2S3dESjlGbHFJbXVSUUlLalJhejNNSHA5UjZVdmxpLzBG?=
 =?utf-8?B?U0FOdnVkeHY4R3djUURPNE5ZNmNXbFZ5Szkrb3BPUkhWVStwVDVCSXdaZWEy?=
 =?utf-8?B?V0o1TUR1UCtJM01vRERvcHphdURZdndOQXJxTkdHSDNGUGhmdGd4NkhvcG13?=
 =?utf-8?B?d1VGREY4MVM1OWhxTGh1TlorVjZYWlhFMDFITDZTRGpSR0ZCTmYrRk51Vi9w?=
 =?utf-8?B?UlpDTHBWTEdzcXA3ZEtBT1lYNFpYQ2ZLTGYwTEZBMTQ2ME1SZnJCU1MwS3FY?=
 =?utf-8?B?NWRLNjU4eDE3d3BFUjdVWFQ1NWxibUNFQVVhOWhCMTltQStYNkxibUhhbE1T?=
 =?utf-8?B?NEx5T0VvNFhhNXdLeWU5cDcrbWNXaGdGTGJwNGp1cmhxVngrN3QreFhpb0RK?=
 =?utf-8?B?Nk0ybHRFMHNPdFQ4cHlHZ2p0dVVZOUtEMDFEKzJoM0dXR1ZpSGFmaUNBNHVV?=
 =?utf-8?B?MFRWOXpHZkRjZ1ZhaUNKSEl1NVNpT1QwQVUvL0FXTzZiZHNuRmJiY2YwdkJI?=
 =?utf-8?B?cnNwS1JvYzFpTXI0cGE2UHVubVZOZ2tnSG5KbUdsY0UzaWJSSWN5YlY1TFBo?=
 =?utf-8?B?d1E0ckVYcEUyNk1VZ0VGRjgrQUhNdUxuR1M0ZWVNMkwxeWNTZS9iUCtrWFJG?=
 =?utf-8?B?bWkrOFpySjJGa1l3R1pYdXJhcWVqajBlbXhyVUtTYzF2WktzSkU3eDY3MWRF?=
 =?utf-8?B?eTR6YWo4bkZHOS9xaWwzTTY3OWRvYlJIM3UyTS95YVh4eWZhRk9RNk9jczNU?=
 =?utf-8?B?VG9Tak1QYWdxU3BkMUdpYW9tRUE4MjBFN1JPcm13Uno3Y2QvOXpNZEF2ZDFF?=
 =?utf-8?B?b2h3U2Z2bTJlMzVvVGF2ZnJyRmdVdk5rUnQxVjU0NjBLRWliQUh4eWcrQ284?=
 =?utf-8?Q?/uCLX6ybUZQMJ6VTtw614fp26?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c21cd8-3090-48aa-3120-08dbcb17bc8b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 11:38:21.4373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95c+ZOHm5nWeljRbS9+hPzhe4AfDYKDjFuqfEUflUHFk8YKX445PliRw/fAYQeb+zEkY3/BmmBdYUYkTIuwdcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5946
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe: Add helper functions to
 toggle CT communication
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Michal

Thanks for the review

On 10/12/2023 3:53 PM, Michal Wajdeczko wrote:
> 
> 
> On 12.10.2023 08:32, Riana Tauro wrote:
>> During Runtime suspend/resume, GuC is reloaded for both
>> D3hot/D3Cold-> D0 transistions. It is not necessary for GuC to be
>> loaded everytime for D3hot->D0, only enable/disable ctb communication.
>>
>> Add helper functions to toggle CT communication. Modify existing
>> guc communication function
> 
> s/guc/GuC
> s/ctb/CTB
> 
> typo transistions
Will fix these
> 
>>
>> v2: do not register/unregister ctb, toggle the enabled variable
>>      instead.
>>      enable irqs while toggling CT (Daniele)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c    | 36 ++++++++++++++++++++++++++++++----
>>   drivers/gpu/drm/xe/xe_guc.h    |  3 ++-
>>   drivers/gpu/drm/xe/xe_guc_ct.c | 15 ++++++++++++--
>>   drivers/gpu/drm/xe/xe_guc_ct.h |  1 +
>>   drivers/gpu/drm/xe/xe_uc.c     |  2 +-
>>   5 files changed, 49 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 84f0b5488783..40c7bf0c50c5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -507,7 +507,7 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = xe_guc_enable_communication(guc);
>> +	ret = xe_guc_enable_communication(guc, true);
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -560,16 +560,31 @@ static void guc_enable_irq(struct xe_guc *guc)
>>   	xe_mmio_rmw32(gt, GUC_SG_INTR_MASK, events, 0);
>>   }
>>   
>> -int xe_guc_enable_communication(struct xe_guc *guc)
>> +/**
>> + * xe_guc_enable_communication - Enable GuC communication
>> + * @guc: The GuC object
>> + * @ctb_register: boolean to indicate if ctb registration needs to be done
>> + *		  or toggling of the value.
>> + *
>> + * This function enables guc interrupts, toggles or registers CT communication
>> + * and handles mmio messages.
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_guc_enable_communication(struct xe_guc *guc, bool ctb_register)
> 
> I'm not super happy with the naming here...
> maybe there should be separate functions like:
> 
> 	xe_guc_enable_communication(guc)  { ct_enable(); irq(on) }
> 	xe_guc_suspend_communication(guc) { irq(off); ct_toggle(off) }
> 	xe_guc_resume_communication(guc)  { ct_toggle(on); irq(on) }
> 	xe_guc_disable_communication(guc) { irq(off); ct_disable() }
> 
>>   {
>> -	int err;
>> +	int err = 0;
>>   
>>   	guc_enable_irq(guc);
>>   
>>   	xe_mmio_rmw32(guc_to_gt(guc), PMINTRMSK,
>>   		      ARAT_EXPIRED_INTRMSK, 0);
>>   
>> -	err = xe_guc_ct_enable(&guc->ct);
>> +	if (ctb_register)
>> +		err = xe_guc_ct_enable(&guc->ct);
>> +	else
>> +		xe_guc_ct_toggle(&guc->ct, true);
>> +
>>   	if (err)
>>   		return err;
>>   
>> @@ -578,6 +593,19 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>>   	return 0;
>>   }
>>   
>> +/**
>> + * xe_guc_disable_communication - disables GuC communication
>> + * @guc: The GuC object
>> + *
>> + * This function disables CT communication
> 
> maybe: "This function disables all communication channels with the GuC."
will fix this
> 
>> + */
>> +void xe_guc_disable_communication(struct xe_guc *guc)
>> +{
>> +	xe_guc_ct_toggle(&guc->ct, false);
>> +
>> +	guc_handle_mmio_msg(guc);
> 
> do we need to handle that here?
> 
> note that if we just toggle CTB flag in the driver, GuC will still
> believe that CTB is available and will send any G2H over CTB, not MMIO
> 

The intention of this patch is not to reload GuC everytime we
resume from d3hot as.
The previous patch had the tear down and initialization of the CT.
Based on the review comments it was changed to this.

I checked the code. All functions related to send check this flag before 
going ahead.

Thanks
Riana
>> +}
>> +
>>   int xe_guc_suspend(struct xe_guc *guc)
>>   {
>>   	int ret;
>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>> index 3addd8fc674a..71dac0673e61 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>> @@ -18,7 +18,8 @@ int xe_guc_post_load_init(struct xe_guc *guc);
>>   int xe_guc_reset(struct xe_guc *guc);
>>   int xe_guc_upload(struct xe_guc *guc);
>>   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>> -int xe_guc_enable_communication(struct xe_guc *guc);
>> +void xe_guc_disable_communication(struct xe_guc *guc);
>> +int xe_guc_enable_communication(struct xe_guc *guc, bool ctb_register);
>>   int xe_guc_suspend(struct xe_guc *guc);
>>   void xe_guc_notify(struct xe_guc *guc);
>>   int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 8b686c8b3339..ff89a1a09f1f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -319,14 +319,25 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>   	return err;
>>   }
>>   
>> -void xe_guc_ct_disable(struct xe_guc_ct *ct)
>> +/**
>> + * xe_guc_ct_toggle - Toggle GuC CT
>> + * @ct: GuC CT
>> + * @toggle: 0-disable, 1-enable
> 
> maybe this should be named just as @enable ?
> 
>> + *
>> + * This function enables or disables CT communication
> 
> to be precise this function just toggles a flag whether CTB is enabled
> (aka ready for use by other layers) but does not enable it with the GuC
> 
>> + */
>> +void xe_guc_ct_toggle(struct xe_guc_ct *ct, bool toggle)
>>   {
>>   	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
>>   	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
>> -	ct->enabled = false; /* Finally disable CT communication */
>> +	ct->enabled = toggle; /* Toggle CT communication */
>>   	spin_unlock_irq(&ct->fast_lock);
>>   	mutex_unlock(&ct->lock);
>> +}
>>   
>> +void xe_guc_ct_disable(struct xe_guc_ct *ct)
>> +{
>> +	xe_guc_ct_toggle(ct, false);
>>   	xa_destroy(&ct->fence_lookup);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index f15f8a4857e0..11166a7ce958 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -14,6 +14,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct);
>>   int xe_guc_ct_enable(struct xe_guc_ct *ct);
>>   void xe_guc_ct_disable(struct xe_guc_ct *ct);
>>   void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>> +void xe_guc_ct_toggle(struct xe_guc_ct *ct, bool toggle);
>>   
>>   struct xe_guc_ct_snapshot *
>>   xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 784f53c5f282..bf75c39d929d 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -148,7 +148,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = xe_guc_enable_communication(&uc->guc);
>> +	ret = xe_guc_enable_communication(&uc->guc, true);
>>   	if (ret)
>>   		return ret;
>>   
