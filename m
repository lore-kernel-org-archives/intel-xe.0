Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AD0EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 05:02:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C5710E00F;
	Thu, 15 Jun 2023 05:02:48 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2988E10E00F
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 05:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686805367; x=1718341367;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=abNDbwkmZlkQjYVvdtTxblrwnP8A7mCYDcPQZqDCYfc=;
 b=NuzVNpMCEA9Neo/UQJzkXkRgwN6Ymc+AFfAZOQ0LdR4HGGKPWLY6KCtA
 YqOpVzr9MMdUIXrG0ur5y4Oj+DlwhQDpRlVnuTO81uAUHaUj8jDvNUAoW
 /bn8pNFDRiV5bEDw27BgMUk8p/NhfKm/pn5hpLjiwCmQKNhdln0kuhbyM
 PuBSAMAV8znZ6yKzxLLCzq7eHeW3c/1mPU//khStvJHreWySrckTHl2pP
 RwW/f8lIEJpuVSBrwaGuf6hsnqqt5GiQFPspaFdzmEZlbPIKClNW9AkE4
 VbVLRyEZWs8Yt7+ixJObPk1SmXrcvn6301doNydDs+IVQvTyT4TH+W/iK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="422419583"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="422419583"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 22:02:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="777520117"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="777520117"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 14 Jun 2023 22:02:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 22:02:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 22:02:45 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 22:02:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnD96b1fOTYDDEjE+Fb++EjDB5Gc8KzxeO/KVePr3O5WDyfQ9kRtOqBum+S2+ChTOdlW3GUHQKEVuj7Lq5ynQahY3DcBkVkAnstC417CxWSgltc2hpupTLypSl+IGHcOEwYIMf7TOusmaDvLA+tCaNLaMffu9MI3b1GxmVTzWXMU+5VM86VRH4PQxmnaHb8MxGeWynzr23e7r/LN8IlrOaLDyUiiGzOAMSyeejLCbTQ2gMCapPkSxGM+hDDsthFZK2Ch55IkUu69lLMvieRWp8xKo8Ur4McuDkB7JMPn7PM0YohCITloSQqtSH2r15qklSkqhoDlrwlCprNjxLwcNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvYY2Pgq67hopVolGJcGn+aSP7anRP51PJWqO5BjWIc=;
 b=lj+2B8gjbDkFKb3ywT5TD9c0cBSRsk+x4vghFTwMxG1J8EklzXlrEd0ZAGGPlweB/DPpinSE+tfLYw/5BLAAanmshw976Yg6EVEq3uIdwole8TKbdV6BEai+Y5w7pOxDT4G3+i91iGTjIPgnUuVNZVsiABZvosC95hnBX66oX6zmfAS+mwUccmwR4kWzqxWR2Lt0lqb81YJVgynRdqmsln6FUlZwUhSqUD/5qPyDAiHArazQg4Bat+mNyP9exVeyUl+8rysbdErA6z98T6mSpMeTV9OynLIq6f5PvTbr6aT2xxIpvGV2LiIQ8JZ+uAeZU8Tcd0XdKtbSKfwXjbhvtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SA2PR11MB5081.namprd11.prod.outlook.com (2603:10b6:806:118::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Thu, 15 Jun
 2023 05:02:42 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5%7]) with mapi id 15.20.6500.025; Thu, 15 Jun 2023
 05:02:42 +0000
Message-ID: <9d8057a5-09a9-1a04-bae6-4465b9186917@intel.com>
Date: Thu, 15 Jun 2023 10:32:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230613084721.3698818-1-riana.tauro@intel.com>
 <20230613084721.3698818-2-riana.tauro@intel.com>
 <ZImQSlvLphPOU5RW@ashyti-mobl2.lan>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZImQSlvLphPOU5RW@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::23) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SA2PR11MB5081:EE_
X-MS-Office365-Filtering-Correlation-Id: bf0d435e-02dc-4aae-6c9f-08db6d5dbfd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a6iBJrm7D0ZsTd2/p18CmfGW6Q57/RfuKmAUUFNqJ6nQf/hTQ7vyrXKYGGRguL3qkee8CQVJnv1Yjq+G9fqMWVEvBIiNdbAXaYFgaowg9kpc+gKFngnJ5Jn1B+MlDBCzxfvl4hAxitLI8N3J7Rx56HhLcKvBOVST0Fyg13omeaRMDyTXJimOrQl4kfSwSm8V6NMCbmFPIo0yvCL0vniui6ujeTllwKdF/U1TCJk+f7F+X3brs6svtM0m2zWD8BXYmi2hhzeXgX0hChY1DkEcunjUNrx899RI8/u7/SQlE7P3AzK8hUP9n15UtwN50wi9mbvOVrQoZ2GnhpX+deC/QdYYTFeBfYbPcX2QZtMuKyiZnPJP1+ZM09lnVvZpscKqurVel8LPdgk8YCIE4cazEAciuvliQwgrcAqKJx0Sl7oBdTI1Qpc+cT015daYfyuCr+rCi8QPY09eNQlPY0JjyTJhetKAnHFipCAwbEV+qn4H04TYxftaaemriwv56RSE05B7l27P8D8sOS4IKcrtkDB6pLxInyjpCUKa+3jvrEenBla+2Sj7DIpdggVUdnVd/jIM8SFtIwrc6LiuBuScNdBFiElIAvHd1BiO8UUPrTsEkO74BlXlWQdNtXPXRVQgK17LDtlXXNK6MOXGhN6OUtPeKvzivdApZkqKeGJ63/Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199021)(2616005)(83380400001)(82960400001)(36756003)(86362001)(38100700002)(478600001)(31696002)(44832011)(8936002)(6486002)(6666004)(966005)(8676002)(2906002)(4326008)(5660300002)(66476007)(66946007)(66556008)(31686004)(316002)(186003)(53546011)(41300700001)(6916009)(6512007)(26005)(6506007)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVYxRE5MSERBSFRDYzFkV0RKSURpM1RaWUhjVk44eEhsNFR5dGJDN3hUbzVp?=
 =?utf-8?B?ZDl2RnNXU21zVnVDTlBlV05ybDJxOWVJdzJYNlFVa3ozNTlzLzhaeHVUWHNS?=
 =?utf-8?B?TDhVTXlTeHcyZHlTQlpNNEI4aDJYQjRlZ29VdEp0UG10UHkwOFdaMWlrcGE1?=
 =?utf-8?B?aW9BTnZqc2lrd3VCVHJPTlVvNFBja21TNzd4WGhaSHVxc2dlQnY5b0tab0lD?=
 =?utf-8?B?dS92WmZPTFUvQ0E5emQxVUhSc0lvQndaNVNWYUhqN3RUanFLeDZmNWx2dUxB?=
 =?utf-8?B?VC8zTHRDK09qd280Qk9aU2pzNlBvT2Z3bWIvVWFpd0JGdHA3ZGxoWDRicEE1?=
 =?utf-8?B?ZXpZTkVSam4zYkNzL2hrTXZZZmt1VEdOenZWcG12TVd5RStYTU1CdEM0N2NY?=
 =?utf-8?B?NmFWTUZvbGlvUDRpRitQTXFuRVpiNGFkZ2YxbmpYSFBLYlNmTCs4MTR6dnV6?=
 =?utf-8?B?N0lzSGFNMVpnMXlwTXBqWEdlTUlydDNNYXcwN1Z5YnJNRHNiYTUxWHRWZTVp?=
 =?utf-8?B?RFIrTytNQnNrNjdJdTNKalR2MU42QWwvaHVobFRWL1JHT00wN0ZmRGZ6eUNH?=
 =?utf-8?B?WFM1Nk0rZjd4aXpyNHY1YlpZMlprbG8rdExaL3J3Y283cE95Vk1jTXlSckhq?=
 =?utf-8?B?ZFgrSDJwVFFmNmhMaU1lSWlDdTNiMUtWNHY0TnJaejFwcUVoQ2dRYy9LWmVQ?=
 =?utf-8?B?N0NMNms1ZkN4RXpPSjZ2Qm84bS9sUWlobnQxUGFwQ0xlYWZrVUNobERUczBJ?=
 =?utf-8?B?eDZKRjJRTGszRXBuVUFsdlJHQzlrWlcvVnd3aHFtVE1nL3lIdVVKZW1jYjM5?=
 =?utf-8?B?YnNCakRUREpJSXI2TGpia2FRQktiNDN4R24vQ25Ud1BmSC9MNTY1MFA5MUxi?=
 =?utf-8?B?bHcxSDJTR0U5aEM2WEZibFFmZ0FiQ0VUTEcyUzdPWEVoVG53ZkVFcklwYjZK?=
 =?utf-8?B?RUNmaTBaRElmNUNxeXFlOVNUU3RvUCtnR0d0UXRqRGZsNUNvaHZUYTB2eTRq?=
 =?utf-8?B?emhjWExRdTRQNzNhKzlLTjF1dEtUSVo4T3ZhZWl1a1EyZlQ4SVBSMVhKeCt0?=
 =?utf-8?B?S3FMU2JYUHE2V21FN0toRFlxcUJuZUFnekxiYzJMZ1dBd3JxVmx0YnI1NXdD?=
 =?utf-8?B?SjBhcW1FekJXd2F6N3diSUtMTlJlOWVvWjAxQ29haGVQS21BM09PRTR1b1Bx?=
 =?utf-8?B?d0ljSnFiQXZKeWk3enA2QUh4eXQ3YTlLVlVCRTZUamg4WVlkZURnbTN6Mldq?=
 =?utf-8?B?QXBMMmhTWXlrTitOakloNG1tc2k2cFh4WTNzZzhMLzZ4cVJxdkNKbDVhVkQz?=
 =?utf-8?B?MzdLbHpDNFkzc3hueit2K29USGhlQ0R0dncyV21YSktVdFpBc2F1ZG1aK2Zo?=
 =?utf-8?B?bUEvOUxHVFRRbW1OQ2J1QzhaaW5JbHdKR3RlMVNYNnNwR2RMNjRjN1Q5QnJ3?=
 =?utf-8?B?Q254TC9LZDAzK2J0WWUwQU1iRlRuaHJ1cmtnaEU3eDJLZW90N3JrWXlTWnBU?=
 =?utf-8?B?bUZIb3lSRDR6b1k3bWora1lsYVIxRVlLT0lxbTJKck9yOFIzYlFvdklnSHFQ?=
 =?utf-8?B?Mmpzek9MSVNUclFseFd1MW5Pd1Vla2wrNFdSSkJtSy85M0xJcE1XcmpwUEo1?=
 =?utf-8?B?SE9IbllXUVQ5cXFnNUlRcU5YYVIvM0FadEZ2ZEJWUkh0U1FVMjFvblZHVXRY?=
 =?utf-8?B?eVM0T3VrTG5vczdyL2lvRC8yQkMza3JEeUkyeVMyMnp4dmtiZ1BxVnhnYi9V?=
 =?utf-8?B?a3dEZFkrV3JuZW9KSUJUQm9UQy92SHBlWm9nbkRIbTRKeHJLSTRueSt3dW9H?=
 =?utf-8?B?S2E1QnpmcjRLZlFTM2pXNzRLMmNMQ2d0WXN0eFlQVUtkSTUyVThrTEtxQ2o2?=
 =?utf-8?B?ci83OHpHYWMwdWExTkhPL0grOVRyOGJlUGI5TFlNZUlHcmNnTVl3WVBUWEV0?=
 =?utf-8?B?U3ozUXV2Q0tNdUVxdnhtQzg4dzhKeWFRSktvR0w5TGhaNGpMMHBqY3E1ZXpx?=
 =?utf-8?B?bVVDSVQ1S3JkQzNVelBvYXdscGhZQnMwblQrRHNRc1YxdTVlVUpNYzdiN2k5?=
 =?utf-8?B?aVN5amlZaG90S1RBVW5NRGQ2Y2RrNzdWMENWaUh0eFpQV0trWnB3cDd6US9B?=
 =?utf-8?Q?e+4mQO/LWzNZBwyE1War2B4h1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0d435e-02dc-4aae-6c9f-08db6d5dbfd7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 05:02:42.4451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5D/G9kQ//mURJ55pJ6xDmLpvleJ70bMDhjLy85BpOUAG/rKosK9EYZWQv3vCL35aKaEDlMQM2Jmy5jEdcId8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5081
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: add a new sysfs directory for
 gtidle properties
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
Cc: joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Andi

Thanks for the review

On 6/14/2023 3:32 PM, Andi Shyti wrote:
> Hi Riana,
> 
> Thanks for Cc'ing me to this patch, I have a few questions.
> 
> [...]
> 
>> @@ -306,6 +307,10 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>   	if (err)
>>   		goto err_force_wake;
>>   
>> +	err = xe_gt_idle_sysfs_init(&gt->gtidle);
>> +	if (err)
>> +		goto err_force_wake;
> 
> do we really want to fail here? The driver would still work
> without sysfs.
> 
> In my opinion this should be a warning.
Will make the function void and add warnings in the function
> 
>> +
>>   	/* XXX: Fake that we pull the engine mask from hwconfig blob */
>>   	gt->info.engine_mask = gt->info.__engine_mask;
> 
> [...]
> 
>> +static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
>> +{
>> +	u64 delta, overflow_residency, prev_residency;
>> +
>> +	overflow_residency = BIT_ULL(32);
>> +
>> +	/*
>> +	 * Counter wrap handling
>> +	 * Store previous hw counter values for counter wrap-around handling
>> +	 * Relying on sufficient frequency of queries otherwise counters can still wrap.
>> +	 */
>> +	prev_residency = gtidle->prev_residency;
>> +	gtidle->prev_residency = cur_residency;
>> +
>> +	/* delta */
>> +	if (cur_residency >= prev_residency)
>> +		delta = cur_residency - prev_residency;
>> +	else
>> +		delta = cur_residency + (overflow_residency - prev_residency);
>> +
>> +	/* Add delta to extended raw driver copy of idle residency */
>> +	cur_residency = gtidle->cur_residency + delta;
>> +	gtidle->cur_residency = cur_residency;
>> +
>> +	/* residency multiplier in ns, convert to ms */
>> +	cur_residency = mul_u64_u32_div(cur_residency, gtidle->residency_multiplier, 1e6);
> 
> do we need to lock something here? Looks a bit racy to me.
seq_read_iter takes a lock while calling sysfs_show
https://elixir.bootlin.com/linux/latest/source/fs/seq_file.c#L171

This function is used only by idle_residency_show. So didn't add the lock
> 
>> +	return cur_residency;
>> +}
> 
> [...]
> 
>> +static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
>> +{
>> +	struct kobject *kobj = arg;
>> +
>> +	sysfs_remove_files(kobj, gt_idle_attrs);
>> +	kobject_put(kobj);
>> +}
>> +
>> +int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
>> +{
>> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct kobject *kobj;
>> +	int err;
>> +
>> +	kobj = kobject_create_and_add("gtidle", gt->sysfs);
>> +	if (!kobj)
>> +		return -ENOMEM;
> 
> I think we shouldn't fail here... although enomem is quite a
> severe error, but still I think i915 can still work without
> sysfs.
> 
>> +	sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
>> +	/* Multiplier for  RC6 Residency counter in units of 1.28us */
>> +	gtidle->residency_multiplier = 1280;
>> +	gtidle->idle_residency = xe_guc_pc_rc6_residency;
>> +	gtidle->idle_status = xe_guc_pc_rc_status;
> 
> why are we saving "xe_guc_pc_rc_status" and
> "xe_guc_pc_rc6_residency" inside gtidle? What are the
> alternatives? Why can't we call them directly?

 From previous review comments, function pointers were suggested to 
abstract low level guc_pc calls and make the gtidle a control and report
infra

https://patchwork.freedesktop.org/series/117222/#rev1
> 
>> +	err = sysfs_create_files(kobj, gt_idle_attrs);
>> +	if (err) {
>> +		kobject_put(kobj);
>> +		return err;
>> +	}
>> +
>> +	err = drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
> 
> Just
> 
> 	return drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
> 
> In any case I would make this function "void" and print warnings
> in case of failures.

Will fix all the above review comments.

Thanks
Riana
> 
> Thanks,
> Andi
> 
>> +	if (err)
>> +		return err;
>> +
>> +	return 0;
>> +}
