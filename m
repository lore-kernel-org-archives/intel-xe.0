Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72844C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 05:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7E110E5FA;
	Wed, 29 Nov 2023 05:19:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B6210E5FA
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 05:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701235138; x=1732771138;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i2XChye/SVB/dB78UB4fnfa0Tzde/aw2GtN+OOmAHgg=;
 b=e+mxrdWhmfLIyVyiXQ012unONeAyja85IJ439QoBCKxbGbAjeM6NuWsw
 E6s7E4YUB4xF/oa18LuHEnGyI5gPk1rDVl7HmDxxOB8yKUKvvVrP9vVur
 2XYyvGm15rR/DEX0ME3TkJmz62fZiHm4Hb1CV6wBdCN1S7VYiq7QRfwYo
 10Th5Ja4EpC3IDrpLBA/9TwVeYnGCeNOO1c30zir9EWHsngzoVPVKh39d
 ptQVGIabdemqc40GtMQG2P8BmyLrQ/6ZdFK9RB5RmyQiooMeE7I8e/6+w
 58AMInpiLrdwpbei/pWldYJ8oz9KSWBfvuuUNXNy/RJ/CStqUzHSZX7Nw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="11801137"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="11801137"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 21:18:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="10229845"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 21:18:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 21:18:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 21:18:57 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 21:18:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlIlQcCvBdV4fAowgn6fSr8oO7f1fnWt2Ylr4vxeSIjzn3nl5sZaX/9hTPVbhz3MogCLPPqy3tZ+rAifXfdxKDfM/1wSJSJLDzRduav3CSO24XfCVAdqeVlk5Our+zCxb9zUSE1zLYpeoQDjmkn7Ao3QRx0K9g7evOiFA64mOOKFgJh9Zzqg6UkNKA/Qw4rybapVDyaViprpYD+gWtQY/lME0o0/9iRKokB43RGADptw4gkTe6lmFCFIKe1x5DC8gPwdbFq4Qt/ou+mFGma4Bn4668uIGhtaUYu7m6qcLIBVumq/TSYgtGZSFFMPTrMGQUhIu9Igy2NFzCKE9BskGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAeHrNIqPfq/Dj2J2F2d19hVZfw5PZ7SNEjC00/lttc=;
 b=KQiWZFjwzgIPL3ZoKYFGNtN9IZod+WOh+CxIXV0vPx+vf/713+7y4aIoX8DTqY0HTy5fxhIQnUHJmvNa21rzq3FVWFhcWI4jlrn3g+wIdyIBpxbLeTmkpKUpwCNS2ACaxxe4vashafdlWANZzitWR7FJqQHOhAuc/P8039lSVvQMdolLrNgLhKNvGKs5FaZ+QdUQPgjN7XN/i5aIDdIkR9KPBzDTrNp3OgY9Nh+lO5muQ6B4rQtD25byUh8qH2oAo/aperQUNkpF/6qS7EY6p8YvJKsXZhfoEbi8XTdN5TkBPnlT3uu30WoxF/MuneNOvfBiYFj/Wnd0tqCXFTKuyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW6PR11MB8409.namprd11.prod.outlook.com (2603:10b6:303:24c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 05:18:49 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 05:18:49 +0000
Message-ID: <c743ba20-6281-4fac-a5db-d34eb73727d8@intel.com>
Date: Wed, 29 Nov 2023 10:48:42 +0530
User-Agent: Mozilla Thunderbird
To: Matthew Brost <matthew.brost@intel.com>
References: <20231127141125.2913415-1-riana.tauro@intel.com>
 <20231127141125.2913415-4-riana.tauro@intel.com>
 <ZWW3S/8D+8PvuC/u@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZWW3S/8D+8PvuC/u@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::35) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW6PR11MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: 91844bf8-d689-4544-f774-08dbf09aab74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3qYd1QXBpxuz4GmEyy+YhyxoCsGTM7gwJy21dygt13GPGr7T3GkXBumoxuMuX9SuvHqu3EJ+lBk/U/5219futmTbFHgTth2x7ZuN00zHKV+Y/XyVQe7KISut5mr6wpPxLy9xtIiEdcMCDomxVZ8+bnzkq0Sx+f+cDN99O/N2COLtoNEAzzs/SQ6NMQK/7o4VOYAZUJYdEsROIe0hCz/ojEOZmdobCO2z2AhJQBNBT09zrspeSNgXwRQallRqNUb4JRbo5szEQyVJUOiA/mxoNT4PUjxAC9Qpo6+e5Y6wjcsVPDjaQ73NpOhPiyy9To4MQqKcAaejWInVAFNW40gTmY8XNXzveYHp/AXaeWaYvigp9+lYviWcpJSTjlgFjYWXPYGN/Eg6CyCVT16zc3UuDIhQidN3DqH44JO4iVWWBK1wn/I7RIaK5NaJRqqvDv7Ch9ImQiGBPbhvrmOxLd2IVeMY4DR0M/2IdAqh3gU1CbmF7+UnJctdBV3j7LTWg9dHCgYdImvk68UzwjYzUX3QUo5jqUHRe52xnB6aKto21tLtS0vGDAdKix2uRCQCwG6rCzSa6j2v4MLO4Z9BEnXWMOQLOpJPYqtAQbUtDeNS+lx4mzcwJ3HNhVyHXAuKrHq2JWO1zb+LFkz5V+QnOt+ooA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(376002)(39860400002)(366004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38100700002)(36756003)(82960400001)(31696002)(86362001)(41300700001)(66556008)(8936002)(478600001)(6636002)(66946007)(66476007)(316002)(8676002)(37006003)(6512007)(53546011)(6666004)(6486002)(6506007)(6862004)(5660300002)(4326008)(2906002)(44832011)(31686004)(26005)(2616005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG9meDBJNHZzcnZPTS95YS9pSEN4V0dXcWYrdkFiSHAwWkswLzdQR3pEYlY5?=
 =?utf-8?B?czJiRVp2Rm5UZjd1N0JhSXJUbGhlV2Z1TGV6ckJqZE1vS1Y5NmpvL0hsR1Ro?=
 =?utf-8?B?Mkk3VysrdW1oYkE3em5laEF0UUJQWVFYTkRGU1UxN2tKQXVpbWQxVzNwdFMv?=
 =?utf-8?B?Y2NHaTk0N2RHSXNDMmZrWmdOU2NPNmR5dE1Wcjd4ZU0vMlNJNGc0b05aZ3pr?=
 =?utf-8?B?Rkxyd2dQbWFUZGh3R2pUREdjelkrNkY0ejAxYVg3OTFmellibnBscEtCSHB1?=
 =?utf-8?B?WXd6S1FiUDBUQ3owZENzdy84TzVUQ3NET0svYXFEdHRiaDAxQTNzLzdhS0Ra?=
 =?utf-8?B?bzNSb2JLVlVwdm1YY2dKRHJXV284MUdtTUhhbnJXU3dZdG1IS2JRR3d4bWZE?=
 =?utf-8?B?bGRWY2NGaHBKd1Y1OFVuZHFvdjRhWVloa3RMdUh4eURkeDUzK1lHZEhKNStq?=
 =?utf-8?B?UFZyako3S2xHYjlUMWcvN2RvYnQrck5wcmlBc3cxVGcxY3hxZHlnTE43Z3ZC?=
 =?utf-8?B?SWlaenNTL1NsaXR0MTZtWEdZb1Y5d01HT05LekxyNWZwYTVtUzJDYS9wUG5z?=
 =?utf-8?B?WjMwazlUKzVZemdNMlg3Qkc4R3FJTUJ2L1hlN2xRMHE4UVd0K0taTStRekJP?=
 =?utf-8?B?U3lyOXd2Q0tMM21GRFc4NCs5ZHdzLzMxSzhsd08ycUVCbTlweVZuSDQxTU85?=
 =?utf-8?B?QVFGbFdtUllaUHRNVmpqOFR5TkVuaW5nSFJYUEF4U2hvSE9VaFg0djh1Tmh6?=
 =?utf-8?B?Y0VDUW9TSVQwVzJ0VmZGakVEcXE5ZXhsUWc1UzhhWE9qTjNxTUpqWnRuQ0Yz?=
 =?utf-8?B?YWpwb2xvVHVnbCtqSUM3OTZzR3I3ek9LaVE3eXV5bzBSVVRLemtKU1BvZnN4?=
 =?utf-8?B?dWlFOVJST05hVFZINlpxTVNHZS9wUk1YUFFrNG9MbkZVakkxbStaV2lOZDVT?=
 =?utf-8?B?Vlh0WXUwU2hvM3AzMVdDd1I5VjV3R211UnZBVm9RNXlmUGluRnZ1NmlqUStk?=
 =?utf-8?B?aENsRGtySmk5Y3R2YTNTQ04yNjNaOUV0ZkdUYmVpVTVVNjJUeDgwMTg5bHNv?=
 =?utf-8?B?TTl4a3dIOW9ScVN3RkJ5TlEyRDJKTmJ5L0doUTlCcy9Kd0ZiMStqNnMxZ3Zs?=
 =?utf-8?B?dUsyQjlEQXJVWk84d3R5M2Q4T2pXTHhCbVhwbGRQSXN5TVRENE9VZXd2V0pO?=
 =?utf-8?B?TjYxVzV2TGtVdFhaUnFJQ2dSa1d1N0VDbldVS28wa1Y0andDc2Y2Mlhyb2E1?=
 =?utf-8?B?cDBZKzZDTXBGcVJ0cy9jcFFVakZwMjhtMGdJcE9pVVZlWGpsaVpXSU85d3gy?=
 =?utf-8?B?QmhZNkhpN1VGV0tIZWIrMU5uRjJtSGJueHpnZVFqTUkwS2VlVTJTRjM4SnNE?=
 =?utf-8?B?cnM5dDJUb3dmckROUU1FWW1WMDIxbjg3N1FGMWljaUpSMytlYVhEQityYWoy?=
 =?utf-8?B?UjhTUTlIZEh2WGVPUkhSWHVsckhsZWJNTDJiRTJFZGNSOEtOTnJ5azYwM09O?=
 =?utf-8?B?aDUzZDlNMFpodDR4UzFwVjFlZ3hsdTYxZkljY1BFTGhIZ0MzWnB5d0xnV2J0?=
 =?utf-8?B?SkwvelB0NHN2c1NCanRPSlE1djRQNHlPUFhETTdkZEM1VlpXei9DNVhXdGpq?=
 =?utf-8?B?OVFiUjFCTnpwYStZaVhuVXlNdHo1em9DMTA1VnB1UHV2SFU2aGxUcWdYMGNI?=
 =?utf-8?B?eEhwRzF3QmJJcUw5bHliekZoODlJQU0zN2xoTTJpZGp5c2RwTy9CWnp4NWxO?=
 =?utf-8?B?T0Q5R1Brd24xTGtBV0kwRnRSZkh0YlltbGVLcFg4VW5iM2M2cExwTDZsU2c4?=
 =?utf-8?B?bFBlSjdYRW9FaTJGT3JvMHBOeHN4Smp0NzFjRFVBd2I4dzg2Q0NaTlBobXBl?=
 =?utf-8?B?RFA5Z0JWYUtDa21DZHBkb1JDRnl6ZDZ6WVhVTFkyYUJkM2FQazVjd1VhY0Vv?=
 =?utf-8?B?ZE8rQUcvYTV2S2k0OUFKSndKSXJIM1FnRVlWWnBQUXVpWUJQcDF3VVc2TVpt?=
 =?utf-8?B?M2p4RVVRcjVyMld4Uk02eHp1QjVUbnE3eTUxTy9PSExTcVFtSFpuT0Rhdm1Z?=
 =?utf-8?B?QVVRNVEvR2FMVlY5blF5bTB6UTZIUUFoU1ZFOCtLeTY2MkpvVHhRQzQ1dWpw?=
 =?utf-8?Q?FDhcYlvs5e7EEUm6gS7WQqyMm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91844bf8-d689-4544-f774-08dbf09aab74
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 05:18:49.8303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nppAzFbmLPe/SpSbqoNuuvKLtP9I8Uv96suOWiDwqc6I9lFOwFQPo5Rn4ma2T4k9uCC0jmJdq7YAVcDOausEfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8409
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/8] RFC drm/xe/guc: Expose engine busyness
 only for supported GuC version
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 11/28/2023 3:17 PM, Matthew Brost wrote:
> On Mon, Nov 27, 2023 at 07:41:20PM +0530, Riana Tauro wrote:
>> Engine busyness is supported only on GuC versions >= 70.11.1.
>> Allow enabling/reading engine busyness only on supported
>> GuC versions. Warn once if not supported.
>>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 29 +++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>> index 92b37e55fa08..611bafd14d1a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>> @@ -22,6 +22,23 @@
>>    * engine busyness ticks (ticks_engine) : clock ticks for which engine was active
>>    */
>>   
>> +static bool guc_engine_busyness_supported(struct xe_guc *guc)
>> +{
>> +	struct xe_uc_fw *uc_fw = &guc->fw;
>> +
>> +	/* Must not call this before the submit version is determined! */
>> +	XE_WARN_ON(guc->submission_state.version.major == 0);
>> +
>> +	if (uc_fw->major_ver_found >= 70 && uc_fw->minor_ver_found >= 11 &&
>> +	    uc_fw->patch_ver_found >= 1)
> 
> This doesn't look correct. e.g. on Version 71.0.0 this function would return false.
> 

oops sorry missed that. Thanks for catching this.
Will fix it

Thanks
Riana
> Matt
> 
>> +		return true;
>> +
>> +	drm_WARN_ON_ONCE(&guc_to_xe(guc)->drm,
>> +			 "Engine busyness not supported in this GuC version\n");
>> +
>> +	return false;
>> +}
>> +
>>   static void guc_engine_busyness_usage_map(struct xe_guc *guc,
>>   					  struct xe_hw_engine *hwe,
>>   					  struct iosys_map *engine_map)
>> @@ -79,6 +96,10 @@ static void guc_engine_busyness_enable_stats(struct xe_guc *guc)
>>   	struct xe_device *xe = guc_to_xe(guc);
>>   	int ret;
>>   
>> +	/* Engine busyness supported only on GuC >= 70.11.1 */
>> +	if (!guc_engine_busyness_supported(guc))
>> +		return;
>> +
>>   	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>>   	if (ret)
>>   		drm_err(&xe->drm, "Failed to enable usage stats %pe", ERR_PTR(ret));
>> @@ -103,6 +124,10 @@ u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>>   {
>>   	u64 ticks_engine;
>>   
>> +	/* Engine busyness supported only on GuC >= 70.11.1 */
>> +	if (!guc_engine_busyness_supported(guc))
>> +		return 0;
>> +
>>   	guc_engine_busyness_get_usage(guc, hwe, &ticks_engine);
>>   
>>   	return ticks_engine;
>> @@ -126,6 +151,10 @@ int xe_guc_engine_busyness_init(struct xe_guc *guc)
>>   	u32 size;
>>   	int err;
>>   
>> +	/* Engine busyness supported only on GuC >= 70.11.1 */
>> +	if (!guc_engine_busyness_supported(guc))
>> +		return 0;
>> +
>>   	/* Initialization already done */
>>   	if (guc->busy.bo)
>>   		return 0;
>> -- 
>> 2.40.0
>>
