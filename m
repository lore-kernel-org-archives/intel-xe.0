Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB64AEE49A0
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 07:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987D010E3BC;
	Wed, 23 Aug 2023 07:22:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D2110E2D1
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 07:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692775330; x=1724311330;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jnjurYcMA351ZyaV2j8rgisrsMHqYxNYgxkjIV1N1YA=;
 b=YNhKtaKLsJE+04vwbmnMXO2ouzwbHqNunZ1fqHihnMUiHiarmXYSCKCj
 9FQYHxUhKTuH+9LCzNX9/u+z4Ey1YK2GtPBmKAv9P8WrmT7i1u0aViLRl
 8V7lJJ6/hvwh6mIu1t8ebR5cG9Y+QruuZAY12b2cWFj3RcmuPxuivQ24a
 CNWJoInYuF+MarunV4MefFLEn/zs1RpElXS6y2N/w+0JpI7mdcSmGP/WZ
 6Bk42q+iiGQPCAflB0vnBnqRkFAykIkOGwuPkTmf3JgyyJFclMHZNytG7
 bgITKAkWsPvk26lSnlo87pLUpvRelunY+VukIFmrzdykiE1dxGWctwmSm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="377850252"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="377850252"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 00:22:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="801997800"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="801997800"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 23 Aug 2023 00:22:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 00:22:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 23 Aug 2023 00:22:08 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 23 Aug 2023 00:22:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6gjTtYlUlGqiR+5brk/A9YnJ4LoK/gH2u5kmGsN4p9mVsnvrlDfiekcrgqEqBvHJAXEUr77Pm6twpFFuarKKNRuAfjP3W+IjkJYKxfzEHLgVh1UFnqjKEv+zTg13lh6+7/duT8SbpE8yARhjOaLAk39TsxEy+rCafXqJmJH2o93M0Emr52W8reLf+Nvoxfhd5KWquqYBA2lWQM9Kpu9bJ2M3u0lc0p7ncPDoY6qB0UkL9PrdEZXi0fTm3SiATMH4r4FgPvfgosH0klqqFbs6702BndSTx3U0JFtrYHcPhrJkcNd64Nvj/WLF8ZpBTDcQSwReVlJ375VvaL02Cv5gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZYtGLXmSlDcirf99uVbvah1oe5mEJPymQcib6fD8iM=;
 b=DWorAj0Mpu6Qi/tTanxkA4n3E3wa8v0iYFlma4/gKIFo887FsE+nDy5yv5JKEb8R5tx45RxHuK4PmcsNfFK2CrzTCUmMQUPenXfx0wQlcxlM8077Vu8ngHrkZ9LfG73kBsvZrXgDDRmBhdQNe8ui//G4aeEc+0/wx5M+AHdAyT365BvjZXwOOCUGRKpjUvVWr+90tQxA4JxiOrgH5lroZ/vH6WRFfg/XMWnAEj14YChaCsQMlgPwh7S67icss2I3HRNSWy6hQKnm/cBkoVuIAC85+xMXRLXbQ2sHsZVkMpQ3m2KbRA2KrDlgNAMCaW2gcSgpXbM/cfEE79jT+jkyxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Wed, 23 Aug
 2023 07:22:06 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::6b9:384:8202:b294]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::6b9:384:8202:b294%7]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 07:22:06 +0000
Message-ID: <11b1121b-8c53-7818-dfed-9b26fd89d6f8@intel.com>
Date: Wed, 23 Aug 2023 12:51:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Content-Language: en-US
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230823050955.1226024-1-riana.tauro@intel.com>
 <20230823050955.1226024-2-riana.tauro@intel.com>
 <ZOWn9E+FKZ3NVCiX@bvivekan-mobl>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZOWn9E+FKZ3NVCiX@bvivekan-mobl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0207.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::18) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB8427:EE_
X-MS-Office365-Filtering-Correlation-Id: 0036de5f-c099-4bf1-bb07-08dba3a9a7df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BiwHpNsG8OqMiG7m0pZxOGjP3cGCGYmwPVqnWidrPJiqHIap1HlfQbJBrjUJfMF+OCN8SP1RWuQGYHWLKF6KUyNBsYiXQPAs3iwhAX79PM8vrr768js8a/iq3l4JokqK1604s0HijJ9fMKPTgw+5rXZeKqCjHzgvd8Qgflrtz+2xfFBwDOrlxsYxj12HbRpT4U8VliHP9tUE2IkuZSBx4TLzR2SsQc3kp3dN1hCFgCxcsqnMCtWMxuGmSGA13y5uPDskI2kspo8wOOtBfFGMgDVdaKNeEVThsFIvD+sWBddW5YnGNXuZ/k9x79eMtOtQssF8AaFFonY9ssjAlopOeT49FdoJjWVi2p2CP25dpyJeoI/wgx+fi5gM+fqDBPwh4RJc3qfAKZI0fe52dCy5c2L14PXK9fjWTKmoF8m+nnjiz6ChgtFo0KtURzUhUd2YE58gronI+fs8R86ovd+q/n1nOxO5p1IdK/OdxswL85Ok6ifdaZViHoU6vdpyBXttcsSWrGmWcxzBzyOPULCZzKyEs424Nnfly59JTfN3+tbZ5pJp+s5nsIa60s0GG8NlxLFrwhAT1OLiUH5SQqPjffWrPA7NGAxcPCd6PJLYT0O3W6jmDujiSwy07pDl6cQJp9enbZPOATNEFFmHksj92g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(376002)(346002)(366004)(186009)(1800799009)(451199024)(66476007)(66556008)(66946007)(6512007)(316002)(82960400001)(8676002)(8936002)(2616005)(36756003)(41300700001)(478600001)(6666004)(38100700002)(6506007)(6486002)(53546011)(83380400001)(2906002)(31686004)(31696002)(86362001)(44832011)(5660300002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am9vbFlwelZyYWdVNkF4WXg5T25lQVdjUkdJOXE1cENDS2RwbnhJNDdQcXF2?=
 =?utf-8?B?b0xDNzhhU1psQ1JjOTVCaWowN1dWU0Z4MTFvanQ3eDhORXFxd3Evc1FFMFF3?=
 =?utf-8?B?ZzF1a2tRUEZuRVpkbDNLYVJqbDFFaDRjT0hGaGwwcXJXd1FyaWJZTGhxM1dR?=
 =?utf-8?B?Tm5mcFFEeEdYQzRZZ0d0KzcvU0RVVWV6M0grWS96eU10T3NSSzVtMFVuenE0?=
 =?utf-8?B?NDZmMkJJYjhudjZucmpndWU5V0ZPSWVmT0c0anpMOXN3dVVQT1ZRTjkza3lh?=
 =?utf-8?B?TitBSmp5bTYvTVBkNEJmekMreC9lVUxFbTY2SmZzSFF0OWg4MWdyUkVIcExG?=
 =?utf-8?B?ZnM2MEFxWUZmY1UxNHNYcFZTOE0wS1dwTFhtc2hlcmFyYkFaUFhBQzhVZEJP?=
 =?utf-8?B?QVlLcU5wU0Y0UVNFV3F1bFRpTy9SNnlpK0ZPc3diT1FwRFkvT25WWXhSMnFT?=
 =?utf-8?B?ZjBGbHA0bzU5RHd1RE5OSEdOYmZuWDlFa2FIeTNvYkpiYWlXK2xLL0tkOW1j?=
 =?utf-8?B?THRwU3NoZ1BiNDJrVzJ1V0wwQTBwd1N3eUlRemZyT25OYm1CSGdtM2hJQVNK?=
 =?utf-8?B?ZXpOc3ZqSncrQTZ5YkZvZkRtU0xzcXFkZjc5Y3k5NkhCS0lzUFhoZW83U1o3?=
 =?utf-8?B?RXBBcmJaUi9kRVhZdUo5Sm8zL2NQREVOSXVVMDh3eEN1c3RYNDhYL0RCc0tj?=
 =?utf-8?B?QUU0ZGxjWjVoMVd4QStlMHdwZUpINEd2K0JoTVpLeGtCekUranlJUHJNV2hF?=
 =?utf-8?B?eWxPenNzcXh0K3kxSFdwbmlLU2FCeWtzd3ZMT21SeTBremNaZEZsNEhXY0M1?=
 =?utf-8?B?eGZ1ckJrQ1QyNFJuRmxZNERFS0hoanVzdHFxek5IenVlWTB3TVZ6d01KU2lw?=
 =?utf-8?B?ZUp4RkFzUUNweWRJM25YOE9DWnlka0t0WjlMdGR4aTZDVzhhWFhEYzFWRlBD?=
 =?utf-8?B?a3VuamlFZ3NVaW9GUTRBay92YlVHbVUwcW9Wa2RNY3p2VTRjeVY0eWt4eGJD?=
 =?utf-8?B?a0hWYlozYkl2SDVWTDZjbWtiT2N4VzlQRXVJMVg5QW9rVzZMV1Z3QXp0K3dN?=
 =?utf-8?B?YlZITFZEbDlPaHZldzBydmYveEMxTkZXTGZ3a2pRTGFoRVVQOTVzR2VOUTYz?=
 =?utf-8?B?WFFrY0R5ZnFmUEhacEJRekU4OU8rU2lmTWdHWVB6SENKZS9GYUJWYjM3eW9X?=
 =?utf-8?B?Vkw2UERyQnZPS2ZUTzkyK0NHYnBwaFRpUkw5Zk5iYVJnS0RKOG1hVExPMUNn?=
 =?utf-8?B?WGFzcnEzdGl1cldKcFNWb2pMMGJ0L2EyRko5dkFVZVNyN3BiMWZQS2pvTkk0?=
 =?utf-8?B?UmZSZ01HTDJ3MmRVT0F3Vno0eWZvNVRTbE5jQ3h6dTVOM0xZY2RWejRiU3lK?=
 =?utf-8?B?SWxuNVBBV3c2YURHeHpQT01zcFFzN2NHSnRJS0I0dUREeVp5TlNwVit0eXRr?=
 =?utf-8?B?dmFOSlNpd0ZuNzFvZmQ4RUI4b1R3WXVhUElOSm5iMjQ5OWEzM0QxOWg3bCtx?=
 =?utf-8?B?R0hXbnh5cTlRQmZtckZuNDBOaWRBNUY3UnNFRFdEMGRpRHhtSHcyUDhDUTYr?=
 =?utf-8?B?N2paL05DUzRMYVVrK1ZTVUJXQ28ybUFyV1U5NkFaRm11TWlpb2ZpNnFRTUxI?=
 =?utf-8?B?YzZyRzMzMG5GdEhMWEF0RXhjbnFnV1VCKytJYnFIOG5iL1B5ak9TRjQzeDdL?=
 =?utf-8?B?WTIxbFZHeVhxVVdnbnNXVmxDSVBHQXNsVzd0YkxyL2JJVGt3OXpzR2gwNUFH?=
 =?utf-8?B?Ym1DZXllTjZxK0FuRi8vTFdvUXBOZmRjTlcwaWswUzFEalNPa1ZRdFZhWDZ5?=
 =?utf-8?B?aUxadjh5SDlwMWxWM1hCZ2I3LzAwbjlGamVTRWI2eG1NUDJ1T1k3Zlo0dm1R?=
 =?utf-8?B?VkNvV0NKS0VxYXRFazdCekRwSE54TXFRdkFPSjJhc0V2OU0yWUtubnJxNlZS?=
 =?utf-8?B?QzNuTmJCTXozSnFyRFY3S0pZcDM1SEtIdjhyWjhabkgvcUI4UkZlWVU0cTky?=
 =?utf-8?B?ZnRySzF0dy9QSzVGazBKcHFQQVFGMGgvNjJRd0lMVTBGZWRYYVppVThMUVV1?=
 =?utf-8?B?bXpldWh4UDBzSDl3MjVBdEhSdjJha0JlTnB1OWd0eWxsYXR0R21RT2ljdFlY?=
 =?utf-8?Q?LLmwhQoS+7xZ9SUszTJRcK+2x?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0036de5f-c099-4bf1-bb07-08dba3a9a7df
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 07:22:06.8122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5gYhueZDqBB3Z8dYogjnE8FOPUwtCkrGuqoyCCpACqKCCt6CdtB+vu9BGQNIcJ9YTB7vkH1py7mpvM6GSl9ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8427
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] RFC drm/xe: Disable ctb communication
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

Hi Bala

Thanks for the review

On 8/23/2023 12:02 PM, Balasubramani Vivekanandan wrote:
> On 23.08.2023 10:39, Riana Tauro wrote:
>> During Runtime suspend, GuC is reset for both D0->D3hot/D3Cold
>> transistions. It is not necessary for GuC to reset for D0 -> D3hot,
>> only enable/disable ctb communication.
>>
>> Modify the existing ct disable function to send a request
>> to disable ct communication if firmware is running.
>> Add a function to disable guc communication.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c    | 15 +++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc.h    |  1 +
>>   drivers/gpu/drm/xe/xe_guc_ct.c | 11 ++++++++++-
>>   drivers/gpu/drm/xe/xe_guc_ct.h |  2 +-
>>   4 files changed, 27 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 2493c5859948..3e4c00bee6bf 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -557,6 +557,21 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>>   	return 0;
>>   }
>>   
>> +int xe_guc_disable_communication(struct xe_guc *guc)
>> +{
>> +	int err;
>> +	struct xe_guc_ct *ct = &guc->ct;
>> +
>> +	err = xe_guc_ct_disable(ct);
>> +	if (err)
>> +		return err;
>> +
>> +	/* Check for messages received during/after the CT disable */
>> +	guc_handle_mmio_msg(guc);
>> +
>> +	return 0;
>> +}
>> +
>>   int xe_guc_suspend(struct xe_guc *guc)
>>   {
>>   	int ret;
>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>> index 3addd8fc674a..18cf5d02eea7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>> @@ -18,6 +18,7 @@ int xe_guc_post_load_init(struct xe_guc *guc);
>>   int xe_guc_reset(struct xe_guc *guc);
>>   int xe_guc_upload(struct xe_guc *guc);
>>   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>> +int xe_guc_disable_communication(struct xe_guc *guc);
>>   int xe_guc_enable_communication(struct xe_guc *guc);
>>   int xe_guc_suspend(struct xe_guc *guc);
>>   void xe_guc_notify(struct xe_guc *guc);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 59136b6a7c6f..64c2029b2752 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -21,6 +21,7 @@
>>   #include "xe_map.h"
>>   #include "xe_pm.h"
>>   #include "xe_trace.h"
>> +#include "xe_uc_fw.h"
>>   
>>   /* Used when a CT send wants to block and / or receive data */
>>   struct g2h_fence {
>> @@ -319,15 +320,23 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>   	return err;
>>   }
>>   
>> -void xe_guc_ct_disable(struct xe_guc_ct *ct)
>> +int xe_guc_ct_disable(struct xe_guc_ct *ct)
>>   {
>> +	struct xe_guc *guc = ct_to_guc(ct);
>> +	int ret = 0;
>> +
>>   	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
>>   	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
>>   	ct->enabled = false; /* Finally disable CT communication */
>>   	spin_unlock_irq(&ct->fast_lock);
>>   	mutex_unlock(&ct->lock);
>>   
>> +	if (xe_uc_fw_is_running(&guc->fw))
>> +		ret = guc_ct_control_toggle(ct, false);
> 
> ct->enabled holds incorrect status (false) if guc_ct_control_toggle()
> fails.
> 
Will reorder this and send out a new rev

Thanks
Riana
> Regards,
> Bala
>> +
>>   	xa_destroy(&ct->fence_lookup);
>> +
>> +	return ret;
>>   }
>>   
>>   static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index f15f8a4857e0..1ad150c19ae3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -12,7 +12,7 @@ struct drm_printer;
>>   
>>   int xe_guc_ct_init(struct xe_guc_ct *ct);
>>   int xe_guc_ct_enable(struct xe_guc_ct *ct);
>> -void xe_guc_ct_disable(struct xe_guc_ct *ct);
>> +int xe_guc_ct_disable(struct xe_guc_ct *ct);
>>   void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>>   
>>   struct xe_guc_ct_snapshot *
>> -- 
>> 2.40.0
>>
