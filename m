Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6A0EB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 04:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585E510E106;
	Wed, 19 Jul 2023 04:45:19 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4105610E106
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 04:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689741917; x=1721277917;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y6yMnvDcQwojy2op0Dkg3aJlYYPd6RqdbkTj1WlCOLE=;
 b=JXclK5BiCOUEsAp9aibIPyFQ6N/3y7xfC0l2i1jwT3pNvtjdq68mUyH/
 0WaBQMZmzv/VkFJeHUE1574eVjTeCDETWbxjysyCowLvFsNOuHtKJWxy8
 R1ZtDaLzOMD0Sx7D5t/snce4IRJAQzMUVdhnpPXw4BYVpza8Zty/8/QSN
 +LYeNPvMxOcb/FSFGV7ft3op21kIDQ63RYmEJ+9aUcbmrC8nIGkgzy2ax
 jHmDf7u9lFH5HU2D8FTuK9KIJ8ZGfNMMVRK2iynWd8aUNbzX01B8Zg1W1
 GwhlMMZHI69A1e/L+howF2Yc5oei/JHzACMVfbS8HuEyGsUBSnbSHPS8r Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="369928770"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; d="scan'208";a="369928770"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 21:45:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="793871645"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; d="scan'208";a="793871645"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 18 Jul 2023 21:45:16 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 21:45:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 21:45:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 18 Jul 2023 21:45:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WALFqMvfF8EI0gZMrJQWj5LqCsqBN7R4AKW+7hu8n8k3bYDxwrcyFyYXA4JCvByN+3/8tGAbN6zIlC+EIa8JBm+DgAIRGBQDgtCR2y/Zlfoz+uewAUXmcI6UH8+59Ur5rWU7VnbppRJSRPdKVdFaFbEcr9VgzwrE9uHDLqh+Wy8DBePlv3cq6/FYbfk4POFf2JianM0cc/yZBI46dN2IP86x8ncPUZBsd+hf+8wkbBiygVY1Wxbsdrf+e6Yvie1pGOHGRbYFgFb36SroLvxQdvG8oVjQ+Twp2NEGIa2e18vLcSlrXxZ2qPfi2US86gV2k068jz4NT+TEinkzu/7HeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3j6WBx9JF7s64GleCtELZw6WHqjhX9hAAHzavU+AqI=;
 b=CXDxr31PFQIgtWiTB+3QLFd6Ez9sQBKKWjUMIPbq1z7utoGstSzggKtmAGMu1RsbhAzTcw7Quv7zNKzfE/dFM5dw9UgRG0EwVT1Zq3DfZP9Ysc7+XOaHFff2GFk620izu87jFFg2rMJG8JSP2ntZuxJjy+zO5Yk9akVdC2XHJCSgNu0A7u71u6th28Qlrtf5Swww9W6yamWbr0B/EEf6+aRkeJlH/SfdZXk5N+xlwKhnHuB1azi3cMPbsfxiK3JnLr0LPRbbQDTq/jIUtGb7bBlQfvlVq9KdVjtRnHr0wQwkr2Ew3eYDXj4fkSrwtZ5+faRtJsJNWnYwwVbc6kx/dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by DM6PR11MB4548.namprd11.prod.outlook.com (2603:10b6:5:2ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 04:45:08 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::e248:7003:f182:3d83]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::e248:7003:f182:3d83%6]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 04:45:07 +0000
Message-ID: <c10378f6-dabd-4d8d-0a18-ac7444123d87@intel.com>
Date: Wed, 19 Jul 2023 10:15:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230717095900.1561736-1-riana.tauro@intel.com>
 <ZLcAm0a6DPSh/0XK@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZLcAm0a6DPSh/0XK@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::18) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|DM6PR11MB4548:EE_
X-MS-Office365-Filtering-Correlation-Id: 20769198-79c6-4273-5667-08db8812ed2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pyaTPmnFYgfBWipj8FZvFYH+tP4niEuAg4yKxl+jksKCjSMPtEUV1widuS6aEphtsknGTMQh4zDzeYJ4+5txgMKqfbqAZVdjdb/1Jyn2lGbIJKztWMt1ZJSjm3WTT+jDnUMmeIyPCcfZ8N3Pc0BpreasAkvcx5VXPihk3tsfUqiVuG93hpeuOqGlZL5B9ERSn0GH0DYm1DDfCLN3gYcCDnDkdPdTkwmX9uWuXcB+0joeoY6D4d24LaQ4TXKgrKKvMfmvpgVCFKjnpvLwxTdfoOLeNX22giAMgKNKxJutlwEF79pKYG1xz+q9vHI6+POO5BiivGTZ5eKh1R3FUnWu3odl9zhq0vTDZ0GbSHvyLayxRdVe0B2Ggwsy7/D/JNB5c6tifeQQ5+tHbIU2q/SsCooNK/E5XM+m6Iq7jHVUuDVufSGVOjIFGNFHFsjOSKwj7gAwcBBkYYgXpXF7FwJCV9hqTYn97X/dAsPC4fA7VzQJxJiAjWln/JLeyj/VY/QOizTJwPQQ4cuj2hZS9W4Zaaosth5TXFA05Hn7SYDUrHdTWzKexCzBAcPEspnAquaRQmStdyKqc4OG6leOZTmcJR+t2OyQV4bLGDEhknE4+5MIEoy2kHI0LiYSZyQJEu6M7tBfjg3NnFiIZDveOLxCdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199021)(186003)(53546011)(2616005)(44832011)(6506007)(478600001)(15650500001)(26005)(83380400001)(37006003)(316002)(5660300002)(66556008)(66946007)(41300700001)(66476007)(4326008)(6636002)(6666004)(6862004)(6486002)(8936002)(8676002)(6512007)(31696002)(86362001)(2906002)(38100700002)(82960400001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGxoMXd5UUhEU2xCbDFyVHJCY01EY0loc0ozemRycGVNdVZBQ0prbU1IeHJi?=
 =?utf-8?B?SGtGdWFsRDhhMEJCWTBBMTNSdEVsRzVqcituZzNIbXNoSHBMaWQ5UE0yMStx?=
 =?utf-8?B?TlJsbFBTREpLay9CK1JtcVpLRzZxcWJoenJYVXNZL2hLdTBzTVVZajY4dUI1?=
 =?utf-8?B?Q0ljcFcyNUc2NVRuS1ZUL0xMWUtEdndGYnBIMkF6WjY2ZjdaeG1iS2p2NXR5?=
 =?utf-8?B?bGs5U1FtUi9iM3JaSGprRUVwTGEyNTIyTWFlenpzTVFlN0pVYTVTVyswbm84?=
 =?utf-8?B?T09YYld6SWQzanc5a2I1NlJVWnRmNHN5V05iVUJPTDdHMXVqbG54ZmlMRnJ1?=
 =?utf-8?B?WTk4Tkx1OWdnejRIYVBNcnJNS3NTWGJQRDVHR1RDR2R1MjZwS3ErUXpQQzhs?=
 =?utf-8?B?M2Y2M3Jkd2pjOHNXMDhsZzh0bm4yNFFjVzhUL1lFVnN5b2s0WHU3c0ZFK1Q0?=
 =?utf-8?B?TG1uOENJMFNzc1NzbUhXRFdsK0tHcEFmQ05UL2JONExLc0tUNUVyYU50Q29v?=
 =?utf-8?B?RHhSTkVsZlVHcWZlNERxbERLcHQwMWhrT2dvMlJlNjlHUUl6cXVCUS8xYTZR?=
 =?utf-8?B?RUdxZkZxT0grK0dxeGFyZ1p6NFgvVk5zc2ZKd1UrQ2t4ZEVBVEhKaFdFVEZu?=
 =?utf-8?B?YnNac0x0UWczYmtBUEo3cHlNNElqWEx1Sm16Y1VkQkRNT0JHUlRtZStuUklJ?=
 =?utf-8?B?b01RODRkS3FyWFk3Ym84TGRPK2ZIajRXQldSMXczSkR2QjI3OHd6TTJMRzE1?=
 =?utf-8?B?UWF1VXNPUEtSREFPNkkzb2Jmdyt6emN5ZDFVK1pxM2xyQm5JeDNGc1pKQzRF?=
 =?utf-8?B?VG1yVmthdkJIMkZ2ZUgybFhlRy9iREVjT0NpZW1raDJCYTNndEhoRFlERnFG?=
 =?utf-8?B?WDVRTzRiWUJKV0RMQWdteVlUcXlEbnovZ0dZSWhKVWFNc0plMENRWG5hVXpl?=
 =?utf-8?B?dy92SVNhNi80STZOS1RzQW03MFBsTGd5aXRSL3BVWU02eTVUVjhBOTgrRmY5?=
 =?utf-8?B?V2FxTWk4UU5TazQ1OVdwWlJkdG1TTnpwQ0tzaGgzM0pza1lXRVdIdlIyVTY2?=
 =?utf-8?B?a0MrMGFIRHVrTWZSOC9lR3EvZFBPSkVMWUZoNFVHYnVJdk1mU1BnRVVCb1R2?=
 =?utf-8?B?amhWQmlXVUM0YW1YSFBrMFZadWJDRTBZSzR4WmpQemdnd25nU05ITDh5VVE0?=
 =?utf-8?B?Z3d4aFpFbHFjREpEaWtZQ1hZeWh2bTY4NjdjcTc2Qm1TR2tEcjdpY3JaaFNT?=
 =?utf-8?B?WGFLQ24xL1o3aFJ3aFZXNFlCRDlaaTdHNzZqcGJOYmdNYno4Y0FxZ0ZaS2w5?=
 =?utf-8?B?OEhVbG9kWFZCWnU0UFZtZGFmVVR6SHQyWUNsSm5kSU1QMWxqa2VEVkFXREtU?=
 =?utf-8?B?cUc2cmJyMkVrTTRZZVh2MXhnNXFiY1V2bzgwRXE1SW1EVjYzVkNhRmFyWmNV?=
 =?utf-8?B?aHNJK296cDBEalZvQmI5dWRtTEg1U3ZBZVlCVFpjN0l3cDFWS04yVjhzZ28z?=
 =?utf-8?B?MGxxTFpWR1FRUENYc05CZHNDTUJmMG1Ob21XRWhac2NNM2c5eGl1a3FkWGlZ?=
 =?utf-8?B?bTAyakpqa21VS3dOdlN0Wkd5UEo5cW1lQlBiY1NJa0NGWEk5Q0VrWGZpdWpT?=
 =?utf-8?B?OUpPTmpLY05WL0ZCOFQxbC9qbjk3dDY2RzREYWw5NG5tSjUwcStuWDJlRkVt?=
 =?utf-8?B?cDdoUGx5eEwrYWpQSVBVOFJKNU9jdGFab3dDN0lYN1dFTllKbGJFNEJkeERT?=
 =?utf-8?B?eEZoQXhNdUlzbWsxOGZocEw3NkxqamwzamFVSy81ZlVEZjVDemo0VzNXdEVL?=
 =?utf-8?B?bUxCNlFoSXNRaTUvRGNxWGM4QzkzUk1mUmJqRVVUWkJSaTU1SWJNYkd5eEFD?=
 =?utf-8?B?QXpyOEhxaVl6bzQ4K0dlaEV3anJmd0JFUkRyTllFRnJoSDU3ZFRkMTRZL1NB?=
 =?utf-8?B?Nk5iaUJuRkZZVGd3dUIvdlVjTXh2enFlY1dFdlZuM2xqQ1pBV0c2K3FDVlV6?=
 =?utf-8?B?MmtHNGg4cHVGQTFIaEl5SHRzZyt5Y1pFYnhmTWoxUitNQmVnNEpOV3EzN1Z1?=
 =?utf-8?B?Qmt1ME5vdStlNjNEUDdvTWJEdG5lc1BUK05lUWJyWXEzT1hhem52Wld5UE1D?=
 =?utf-8?Q?1u6lh0Ip88o2ohZecoKXm7jHb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20769198-79c6-4273-5667-08db8812ed2a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 04:45:07.6671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LD/VJKEEJ8vu262OhcGRN4RH7dgKzQ9yR7AgnjOgu/dvFqhz/ppvq1soc0iFHT/yjXJT7S/blOGHY2z64A63Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4548
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4] drm/xe: remove gucrc disable from suspend
 path
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


Hi Rodrigo

On 7/19/2023 2:44 AM, Rodrigo Vivi wrote:
> On Mon, Jul 17, 2023 at 03:29:00PM +0530, Riana Tauro wrote:
>> Currently GuCRC is disabled in suspend path for xe.
>> Rc6 is a prerequiste to enable s0ix and
>> should not be disabled for s2idle. There is no requirement
>> to disable GuCRC for S3+.
>>
>> Remove it from xe_guc_pc_stop, thus removing from suspend path.
>> Retain the call in other places where xe_guc_pc_stop is
>> called.
>>
>> v2: add description and return statement to kernel-doc (Rodrigo)
>> v3: update commit message (Rodrigo)
>> v4: add mem_access_get to the gucrc disable function
> 
> it looks safer now. pushed. Thanks

Thanks for the review and the merge

Thanks
Riana
> 
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c     |  1 +
>>   drivers/gpu/drm/xe/xe_guc_pc.c | 20 +++++++++++++-------
>>   drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
>>   drivers/gpu/drm/xe/xe_uc.c     |  5 +++++
>>   drivers/gpu/drm/xe/xe_uc.h     |  1 +
>>   5 files changed, 21 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index a21d44bfe9e8..b31ef2a8ff17 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -517,6 +517,7 @@ static int gt_reset(struct xe_gt *gt)
>>   	if (err)
>>   		goto err_msg;
>>   
>> +	xe_uc_gucrc_disable(&gt->uc);
>>   	xe_uc_stop_prepare(&gt->uc);
>>   	xe_gt_pagefault_reset(gt);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 3093cfeff0c2..03dfbde29fe5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -730,12 +730,20 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>>   	return ret;
>>   }
>>   
>> -static int pc_gucrc_disable(struct xe_guc_pc *pc)
>> +/**
>> + * xe_guc_pc_gucrc_disable - Disable GuC RC
>> + * @pc: Xe_GuC_PC instance
>> + *
>> + * Disables GuC RC by taking control of RC6 back from GuC.
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>>   {
>>   	struct xe_gt *gt = pc_to_gt(pc);
>>   	int ret;
>>   
>> -	xe_device_assert_mem_access(pc_to_xe(pc));
>> +	xe_device_mem_access_get(pc_to_xe(pc));
>>   
>>   	ret = pc_action_setup_gucrc(pc, XE_GUCRC_HOST_CONTROL);
>>   	if (ret)
>> @@ -750,6 +758,7 @@ static int pc_gucrc_disable(struct xe_guc_pc *pc)
>>   	xe_mmio_write32(gt, RC_STATE, 0);
>>   
>>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>> +	xe_device_mem_access_put(pc_to_xe(pc));
>>   	return 0;
>>   }
>>   
>> @@ -827,7 +836,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>   		goto out;
>>   
>>   	if (xe->info.platform == XE_PVC) {
>> -		pc_gucrc_disable(pc);
>> +		xe_guc_pc_gucrc_disable(pc);
>>   		ret = 0;
>>   		goto out;
>>   	}
>> @@ -850,10 +859,6 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>>   
>>   	xe_device_mem_access_get(pc_to_xe(pc));
>>   
>> -	ret = pc_gucrc_disable(pc);
>> -	if (ret)
>> -		goto out;
>> -
>>   	mutex_lock(&pc->freq_lock);
>>   	pc->freq_ready = false;
>>   	mutex_unlock(&pc->freq_lock);
>> @@ -876,6 +881,7 @@ static void pc_fini(struct drm_device *drm, void *arg)
>>   {
>>   	struct xe_guc_pc *pc = arg;
>>   
>> +	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>>   	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
>>   	xe_bo_unpin_map_no_vm(pc->bo);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 370353a40a17..81833a53b3c9 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -11,6 +11,7 @@
>>   int xe_guc_pc_init(struct xe_guc_pc *pc);
>>   int xe_guc_pc_start(struct xe_guc_pc *pc);
>>   int xe_guc_pc_stop(struct xe_guc_pc *pc);
>> +int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>>   
>>   enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>>   u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 70eabf567156..f8cbd292d6d0 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -176,6 +176,11 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
>>   	return xe_guc_reset_prepare(&uc->guc);
>>   }
>>   
>> +void xe_uc_gucrc_disable(struct xe_uc *uc)
>> +{
>> +	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
>> +}
>> +
>>   void xe_uc_stop_prepare(struct xe_uc *uc)
>>   {
>>   	xe_guc_stop_prepare(&uc->guc);
>> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>> index d6efc9ef00d3..42219b361df5 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.h
>> +++ b/drivers/gpu/drm/xe/xe_uc.h
>> @@ -12,6 +12,7 @@ int xe_uc_init(struct xe_uc *uc);
>>   int xe_uc_init_hwconfig(struct xe_uc *uc);
>>   int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>>   int xe_uc_init_hw(struct xe_uc *uc);
>> +void xe_uc_gucrc_disable(struct xe_uc *uc);
>>   int xe_uc_reset_prepare(struct xe_uc *uc);
>>   void xe_uc_stop_prepare(struct xe_uc *uc);
>>   int xe_uc_stop(struct xe_uc *uc);
>> -- 
>> 2.40.0
>>
