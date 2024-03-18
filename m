Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA14C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 16:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C95310FC3E;
	Mon, 18 Mar 2024 16:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CvFTYxBo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D398A10FC22
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 16:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710780261; x=1742316261;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ri96dnwfmY24R/Ie0z/UZWHc+ia77bT8JR9A3UlN0uQ=;
 b=CvFTYxBo6tpmGwX0ZaYouWNXIQ9DAxmnEnqx90mEr3nB+JfkDtzLqg9I
 ZfKCROkOKYWgZTCkdyC41CtmTHnIlZaaWL+bj0pSsGRFgdK/NvRId0HpR
 uTQE5svrK3hWdJIy0AxXbaTj7yQICfHUS6dgQF9eLE02WeBcxurLDZwKP
 mGtlVY/NrEJRCywStsKDl1QA2wzEiK7aNnh4fa33bbTxntqmygHjLkjxZ
 8AKtabEFToCp2zmzX1pbYeYetaMdO31IvgchYqEBxsOcYjdY1g1tcUvL4
 cMh05flzGsMecS0fNK/g6iwz+8jVTlI0J+MfGU2eQXY2L1XHZFzA4fopf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="17004529"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="17004529"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 09:44:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13508695"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 09:44:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 09:44:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 09:44:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 09:44:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 09:44:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIhDgchghLWML1cyQt9+Af7LPST50mM1IrXEYmhH99Nsz9cUip0d0hyQhusZFkw5PUDiTZNmKTltxAKxrAnPjME2WyKpOkMafXY8FvxmdZ9+oCVXJHx/4L5Bs/n8AShLctb2nFiFqJ1+/dIC+bCR1lUmL7+Fu/J2sDsrfNYkj+JpnOqx2HwTLckSm/+MrVtCTYK2hVX2oZoeUdurhxPkY5/E3Lbop7IkmnZc7QxqjBCo5EiiZFmWqI/Nx1A4tlHmLy2VzJv81RBpkQf/twJIL0Xkub9Kb5bz52qnjuxCgtoSAq834lZ9U4eCq3/zmb2YeMpq54cpzegTm60zCtki5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIeorvP1QW+j6XHcnvRh3mrLqD+uP9hmS8cQEctMivA=;
 b=i2/HdnjraKIVKKkemKMYTAdfV15ZjI5MANbHoAgYPL15e5hhgIwLXgPntJp5cQUFTXY2AFEmaDxXJ5p9MVVAzxLXAZenO7qPCZlxkbtX2V89EkkvyXUZYxukX76DuHsHY1fCoRWXqvH79HkcW7l3/hYi3f0BvHifgceRZQ50DkdhX/ID95mt2GZ3plvoUlQUHqoYFZQVpa6orbyj+OD+j1gnM7S5xmi3Mjl3ZYSMRHGIPh5kr5BDEi5FyP+aYWgicyDsN/d/P04OpjqGFFE1T9Ulm4i8Cn7aXosBjzGS9i/uG5TR4h6M2BLZWyWJnP/0z/AB01cX+vMl2hY1xoqAEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.20; Mon, 18 Mar
 2024 16:44:16 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::5144:aca9:5cd9:42bf]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::5144:aca9:5cd9:42bf%3]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 16:44:16 +0000
Message-ID: <cb843731-f95a-4a61-8380-2760dd2d944b@intel.com>
Date: Mon, 18 Mar 2024 09:44:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Always check force_wake_get return code
Content-Language: en-US
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
References: <20240318154924.3453513-1-daniele.ceraolospurio@intel.com>
 <SJ1PR11MB6204AF34935E72E61B8486C3812D2@SJ1PR11MB6204.namprd11.prod.outlook.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <SJ1PR11MB6204AF34935E72E61B8486C3812D2@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0018.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::23) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d20f1bf-947e-4745-e5cc-08dc476aa693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BGLZgB9Eq+3vXQ4Cek5eULvC3usB1UMna97L/WMxPU1ICy/PPIVQhOnZGVnl2sTaTXMscSEKT8LiGY957Swg3kU9UWYs1GZLT3c1dGeMFnNl/1a2JiYtEpGUEyg7iecmgweW9Icvfc/WGjzSoOIBA89fJNLWkZSPw6GKQVGi0dj628wGLJDde7Qx9CHJ2iKOzVQqWdPV7afnNCTN6nmquMRJxV/S6IOW5IGup9k7JLjQ/pPjdRiYBYheOTav9Y/JE2YGyGBVJqHMHbdcjuqQ4JplM+ZyG5MRC6/z+BxSe/6Blah+M3m2cgFOlhXVQH6WkSN+Ghe+JMALXKI/TcHKdoDU+b+JnA68dRpKSOJ6yiHJ4Gu1CWWIZp+J1Nu2Ip8QIc3+trrHakboPicbl19M45zrHqh4SH4uKbeeqpYc5iy08EuBVVxAuyzVrh4Ut54J89hcuda4e+BS/wawpZrvDI+VqkhBB8vaFORmgvba3yIriHHOQo1tbeLufqW+Nq2RddQDbaQ5Xb4p1DluYNpHd9X4s6EFM6VHe8Em/Eo63jr8lTRojMlKnoigAeC30gMZc711lCjmK01hghRhtoRD+BWo5+pTd3Qe2osPDZqhqPnrr88trvUzi/Tsrci3O6Txu/7dW/rSfiWV8yWrBzWB5z0Va4zZB4c7lscIzCetDE0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SS9aWkJBSjM2bk43Q3BIYTYrUVdFeFRabUpTQ0Q5VHYxVGRwSnZlZ0RPaGkv?=
 =?utf-8?B?Wnlnd0tNeTdNK1VRM1dKa2lycTBqMHcveEJ4MjlFUnE2K3p2bWxJUWk4V0tP?=
 =?utf-8?B?WmFnaE9jQWgvcXM4REpYcFdGZElPZkg3Q05OY3lXbnd5eEV0WXJzS0NmRDBz?=
 =?utf-8?B?ZWlRSTg0aDJlMFlkaGd1U1N1dlRLazRCK1FGV3JFalNBeU9lR1IxRjJmSXB3?=
 =?utf-8?B?dktHNTRUakF3WFhwNXFQNjNPNUlVWnIxS0pSdEFnS2M2K2xLVDVEZVFjWlll?=
 =?utf-8?B?K0ZmZEJsZEpTSWdhUzFSUGVXRUNyUzdXbmtBSVRyWjFINGJJOWVHQkQvZHQ5?=
 =?utf-8?B?RlNJVDd4YTk0WEhLc2NnMEM5K2p4bWdzS3NvblA5SmdUYmUxaHBrRWhvVG5r?=
 =?utf-8?B?WExnRGdncmtGdHdHSEFMR0FBQWM5emc1TEN2LzRGaEs0RDJRRitFTEhxeXkr?=
 =?utf-8?B?VW5TbTVWRjVmTlQ4a3VsbytxM0RtcHQvQU9uQkJQV3gwZW16WHBrQysxZTJR?=
 =?utf-8?B?ZndZQk1IVzhqTjlVdThNVy9tbk9LanYxZEMzSVVhcDdQT201cC9nanY1Vm91?=
 =?utf-8?B?L1BPYkpsaDl4NkF3M1NFY1BrRTZ0NGtDRVhSRGtzemZaMzNvRDVuWVlrNzdZ?=
 =?utf-8?B?b29DVG5mMlEwRVIraCs5cGwzZ0UrZVYzK2liaENRZWZtNWVVOTlCOCtqL0ty?=
 =?utf-8?B?NHpUeVFmeEtKZE5lSVN2d2cxZFcvTHV6TUhNWjU4RGdBcjY1NEJROEZYTWZl?=
 =?utf-8?B?WlpXS3V6OVM0SnI4ZmlLd3BER3liNVNzelJCc2FFOUlTdGVMQ2JSZll3Y2RW?=
 =?utf-8?B?NDgrdTlPQXJ4NGEvRmczeVQ5R2hBc1BNTkV5ZVdHZEQyVDlYQ0UwblBOTTNi?=
 =?utf-8?B?MGttMCtHNFZqdDNEdWVSakNGTFNjMDRDaEtJZG5naVgvVVl1NXY4S2NGK0Uv?=
 =?utf-8?B?bmJhYWFxY2daOUsyV05nTENBd3VYTXBUR3RoNG9oOEd1RUhlUExtQ2E5M2Vh?=
 =?utf-8?B?aDNTUENVbjZZUzlIZ05qb2pkNlNpdVFFQ003T2w3bkxHM1U4aWJKL0lsbktx?=
 =?utf-8?B?cGhLSGZ3dlNJMWpxUy8xZWdqRGt1Wk10ajZqVktua2ZqLzhOdUJhQnpQRWJH?=
 =?utf-8?B?dis4ZU9MSG9YbGVYL3JDbS9LV0p3dkRLYUw1RGFFWGw2T25FN3lZWCtuTnR3?=
 =?utf-8?B?Y2RKTGJjdHpOZVVlZllEdGd6cDBTQy9HajhobnZhSFdLQ01DanJXR1lrS24z?=
 =?utf-8?B?SmgzNy9VbzV2TGNvRCsreTdRd01Lc09MbHZJaEtVQ2RCLzNKcGVjT21CUTlB?=
 =?utf-8?B?R3lHM2VBZk1QRnZibkRqczN2bEJDSWhqTjdxYWlpSk85bnVZSUt4MUN2Zm9N?=
 =?utf-8?B?Mnl0VzRuWHFqS0FqWnlJL1VzRkZLNTd6RGliSGR5Q0xDcktodWE2UHF1cmV2?=
 =?utf-8?B?YTk1N3UzVG9YNzJCekFVNmlIaXdLU01WOGNHQUt6QS9ub1M3THdHaW10eFNx?=
 =?utf-8?B?cmVreVdBN3l3Q3dyV2hxVERVUmJ1T1dqa0pzNGJkWU5vRDRKMWRjbk5MZWRw?=
 =?utf-8?B?RmVnT255Uk5nUTdoTWtYSmpCbTJWKzZyT08xNlVmelFPaFFiejRUTlBXd1R5?=
 =?utf-8?B?N2JwT3pjQkRHRkhpWmVPWXk0c1N5OTFQMURjdWJLS1ZzcERRQjcybGNWVVhh?=
 =?utf-8?B?TnY1OHBZc0RmTWNhYlVOZ1VMaXloTmRITllGOFZZOE96K2htZXZ2bE9VREFW?=
 =?utf-8?B?dDluMzh6dVQyZGwwZkFWb1haeStFKzhHbERTZFNybmtsRVU2Z0M1SzBWa0cw?=
 =?utf-8?B?S1BPc0NRa0JqWC9oZGIveldOS1EycVJ2U0RidDFyMGRRazhIa2JoVXRuNHlJ?=
 =?utf-8?B?dml2NWdYaWxLcDhQZlVvVzZ5NEhmR1J4dVlhTzlHUDgxb3BpanBzaDFxdFFD?=
 =?utf-8?B?eUUvY3ZKTWtTeEZJbEdRTmZ6d2Q1V1hOMW9tZVJpS1R1WC9FVURPWVJsOGFF?=
 =?utf-8?B?K1llL2hiVEhmS0FSamNXdTBMRlBFUHJIcUtCT09tZUowOHJlYUlzamQ2TGpw?=
 =?utf-8?B?T0hMdHpxTFREZTdEc2laRzZTRm51dEFLK0pBV2RlemRQYm9vS2U0MEJHcHVY?=
 =?utf-8?B?ZUdBbk56dFl1b2ZjNUJJUXFjZk03UitOR2xOZnJtUU9IbE9VNmpiMDRSa2l2?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d20f1bf-947e-4745-e5cc-08dc476aa693
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 16:44:16.8238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9oYkO8k35hJVofr2VgrgAuzNLRrxGIfZL5Wa7PjceO2yTqUIozFhvSTPdZ666cmQ0LCUm54hOC5kTgz0zi4V68dg8ui0auwTEMcFM2oU++s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
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



On 3/18/2024 9:41 AM, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
>> Sent: Monday, March 18, 2024 9:19 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Upadhyay,
>> Tejas <tejas.upadhyay@intel.com>; Roper, Matthew D
>> <matthew.d.roper@intel.com>
>> Subject: [PATCH v2] drm/xe: Always check force_wake_get return code
>>
>> A force_wake_get failure means that the HW might not be awake for the
>> access we're doing; this can lead to an immediate error or it can be a more
>> subtle problem (e.g. a register read might return an incorrect value that is still
>> valid, leading the driver to make a wrong choice instead of flagging an error).
>> We avoid an error from the force_wake function because callers might handle
>> or tolerate the error, but this only works if all callers are checking the error
>> code. The majority already do, but a few are not.
>> These are mainly falling into 3 categories, which are each handled
>> differently:
>>
>> 1) error capture: in this case we want to continue the capture, but we
>>     log an info message in dmesg to notify the user that the capture
>>     might have incorrect data.
>>
>> 2) ioctl: in this case we return a -EIO error to userspace
>>
>> 3) unabortable actions: these are scenarios where we can't simply abort
>>     and retry and so it's better to just try it anyway because there is a
>>     chance the HW is awake even with the failure. In this case we throw a
>>     warning so we know there was a forcewake problem if something fails
>>     down the line.
>>
>> v2: use gt_WARN_ON where appropriate
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_devcoredump.c         | 9 +++++++--
>>   drivers/gpu/drm/xe/xe_gsc.c                 | 2 +-
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 +-
>>   drivers/gpu/drm/xe/xe_guc.c                 | 5 +++--
>>   drivers/gpu/drm/xe/xe_guc_pc.c              | 2 +-
>>   drivers/gpu/drm/xe/xe_guc_submit.c          | 4 +++-
>>   drivers/gpu/drm/xe/xe_query.c               | 3 ++-
>>   7 files changed, 18 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index 0fcd30680323..7d3aa6bd3524 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -13,6 +13,7 @@
>>   #include "xe_exec_queue.h"
>>   #include "xe_force_wake.h"
>>   #include "xe_gt.h"
>> +#include "xe_gt_printk.h"
>>   #include "xe_guc_ct.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_hw_engine.h"
>> @@ -64,7 +65,9 @@ static void xe_devcoredump_deferred_snap_work(struct
>> work_struct *work)  {
>>   	struct xe_devcoredump_snapshot *ss = container_of(work,
>> typeof(*ss), work);
>>
>> -	xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
>> +	/* keep going if fw fails as we still want to save the memory and SW
>> data */
>> +	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
>> +		xe_gt_info(ss->gt, "failed to get forcewake for coredump
>> capture\n");
>>   	xe_vm_snapshot_capture_delayed(ss->vm);
>>   	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>>   	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL); @@ -
>> 180,7 +183,9 @@ static void devcoredump_snapshot(struct xe_devcoredump
>> *coredump,
>>   		}
>>   	}
>>
>> -	xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>> +	/* keep going if fw fails as we still want to save the memory and SW
>> data */
>> +	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
>> +		xe_gt_info(ss->gt, "failed to get forcewake for coredump
>> capture\n");
>>
>>   	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct,
>> true);
>>   	coredump->snapshot.ge =
>> xe_guc_exec_queue_snapshot_capture(job);
>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c index
>> 09f6e7899921..8339b0b49dfb 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc.c
>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>> @@ -326,7 +326,7 @@ static void gsc_work(struct work_struct *work)
>>   	spin_unlock_irq(&gsc->lock);
>>
>>   	xe_pm_runtime_get(xe);
>> -	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
>> +	xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC));
>>
>>   	if (actions & GSC_ACTION_ER_COMPLETE) {
>>   		ret = gsc_er_complete(gt);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> index a3c4ffba679d..25b4111097bc 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> @@ -247,7 +247,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>>
>>   		xe_gt_tlb_invalidation_wait(gt, seqno);
>>   	} else if (xe_device_uc_enabled(xe)) {
>> -		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt),
>> XE_FW_GT));
>>   		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
>>   			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
>>
>> 	PVC_GUC_TLB_INV_DESC1_INVALIDATE);
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c index
>> caa86ccbe9e7..9ed939c20602 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -250,10 +250,11 @@ static void guc_write_params(struct xe_guc *guc)
>> static void guc_fini(struct drm_device *drm, void *arg)  {
>>   	struct xe_guc *guc = arg;
>> +	struct xe_gt *gt = guc_to_gt(guc);
>>
>> -	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
>> +	xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt),
>> XE_FORCEWAKE_ALL));
>>   	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
>> -	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
>> +	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>   }
>>
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>> b/drivers/gpu/drm/xe/xe_guc_pc.c index f4b031b8d9de..b4b39bfcb5d5
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -927,7 +927,7 @@ static void xe_guc_pc_fini(struct drm_device *drm,
>> void *arg)
>>   		return;
>>   	}
>>
>> -	xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
>> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)),
>> +XE_FORCEWAKE_ALL));
> Why no XE_gt_WARN_ON() here?

Because there are 2 more XE_WARN_ON below and I wanted to be consistent. 
IMO they should all be changed at the same time and I don't think that 
belongs in this patch.

Daniele

>
> Thanks,
> Tejas
>>   	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>>   	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 82c955a2a15c..d51cb9a4a6b7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -833,7 +833,9 @@ static void simple_error_capture(struct
>> xe_exec_queue *q)
>>   			}
>>   		}
>>
>> -		xe_force_wake_get(gt_to_fw(guc_to_gt(guc)),
>> XE_FORCEWAKE_ALL);
>> +		if (xe_force_wake_get(gt_to_fw(guc_to_gt(guc)),
>> XE_FORCEWAKE_ALL))
>> +			xe_gt_info(guc_to_gt(guc),
>> +				   "failed to get forcewake for error capture");
>>   		xe_guc_ct_print(&guc->ct, &p, true);
>>   		guc_exec_queue_print(q, &p);
>>   		for_each_hw_engine(hwe, guc_to_gt(guc), id) { diff --git
>> a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c index
>> e80321b34918..fcd8680d2ccc 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -148,7 +148,8 @@ query_engine_cycles(struct xe_device *xe,
>>   	if (!hwe)
>>   		return -EINVAL;
>>
>> -	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> +	if (xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL))
>> +		return -EIO;
>>
>>   	__read_timestamps(gt,
>>   			  RING_TIMESTAMP(hwe->mmio_base),
>> --
>> 2.43.0

