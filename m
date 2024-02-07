Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56A1C4828F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 18:15:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00A510E5E6;
	Wed,  7 Feb 2024 18:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gfu1FjMt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6268610E5E6
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Feb 2024 18:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707329749; x=1738865749;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OgFVstpMEjXx8yFW8IpgLfV7I4hMBsEArZi2AymwhTw=;
 b=gfu1FjMtVqz0fzJgnnz3B9haLCyPEn2ltzy2tQaB3F18+7iXiv26yED4
 Qf75kKgmLR8+gfS0zjKemLJFJT2WR2e6AHGS5fFtMX6dMoXqVDjfJSG7x
 LgqxQOdir+4P6NJ0by2fuawfa+dYbWcWG8sM2pB5iyq+I6QE9qxeAC58F
 v9a2ytHjJFL1MwJUcetP0EMi8R9FruPVFPWOAz8fe7oHGnI1BTGEswb6u
 Aij/A1TmXeK68R6grukv9mgBYdM38TMuz0i9r2X7GNJzJZ8ddeR8T6hEf
 2QHRcmpfS1OUmZ8MHefi/iWrjfX+VcHF1KJXc/q7IIFiuIHdJ5FdS7kpY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="26492647"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208";a="26492647"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 10:15:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="824575210"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208";a="824575210"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2024 10:15:48 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 10:15:48 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 10:15:47 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 10:15:47 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 7 Feb 2024 10:15:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfADc9pITZBUEbEJqs5sjnmncygW4ZDjLS65mBfjMxJF5SPNGAXHXJ0FGuS8k4LvH3VZsnvwhN8Ubz3lWTcQvYoH7vt7U/5Xu2JZ4Yov6waVUKkzoN0J4KALmYL4o+zyZMDk1kH0+b7KsTaeZg4+ji0wsGQMU2FkaGnFrwtmswW1CQy+gWOWXK40Gy+2G294aUEJi2Rv2fD0Q/v+k5dWF1wo0r5hcKl4Dm0ze27XZD/R1Q8m/RWbD9T3TiMAib9iuYOkpJducd7lt3tKKDKuv8lrYcY9icz9oiQiOv7euNb1lnFL2Ezvupay1b3D7tM1xLsr4aX4XqjtQ0INt3OG3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4IrehYLnTH/hq3ZRopT2V1paxoWAXtfJp547TkqMW0=;
 b=ZNpR6DQN5K2+PDGEDJbTK0uHtATOuOz2RnoQQak8FQ9zUA3R5zIAkc4H1eh90tllvd6e9QJHKVHa1cmNVoiZ8z4AhlYwuIRnZjBzJ8XoYg5brTxxa2ASWYdwp8MRK/MuR7VOcete3ShGA3d+69eAkML3jG0wVW/nee37cFgu8kFnnuzCXtp7lVt7AygibcgMcVsO9bcskEh+hFztXUs9AkgZw9BJ0hJXrECmfR/YvKkbQD7m3r4BBdRyVkRscFuisjAY1YwfgqC2mTTOY+FAFAIvp0zUZMDFRH5UCwT7/r9Y8Ganzkgc/sTXHbYcDyz7YHtofGhVguIeL7sEhPWi7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB7569.namprd11.prod.outlook.com (2603:10b6:510:273::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 18:15:44 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::c138:faf0:9fa7:8a03]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::c138:faf0:9fa7:8a03%7]) with mapi id 15.20.7249.035; Wed, 7 Feb 2024
 18:15:44 +0000
Message-ID: <bd691824-786a-4828-9b3f-1e4ebf353a62@intel.com>
Date: Wed, 7 Feb 2024 10:15:43 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/xe/guc: Don't support GuC older GuC 70.x releases
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison
 <John.C.Harrison@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240206234103.373364-1-daniele.ceraolospurio@intel.com>
 <x63k5zcpuf5kmhlf62pwr53ldst2lhmg4h373iu4wk4i3mvoev@tkml4h57lueh>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <x63k5zcpuf5kmhlf62pwr53ldst2lhmg4h373iu4wk4i3mvoev@tkml4h57lueh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0046.prod.exchangelabs.com (2603:10b6:a03:94::23)
 To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB7569:EE_
X-MS-Office365-Filtering-Correlation-Id: 62ec2dc9-edc0-4d8e-786f-08dc2808cd00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jrbQwrqOaAdYVcR38qYKFyMdgB9J5qSdSZvqE8ZcXxWbO56zitPNPr5fHPXe8of+xtm1zSvgdJvfabGxELoYrPMnOvUTo+NTYyyz+XEq31fR7WT2S92N4EiEidRNsYEQfmOAgbWLI5qQU65EPE9Bh+CTOR2gmwvKPfly/gvb9Hxiiiy+IkyXF5rF6Fk/+QEuGo7DSJAuFdT+f6T9ZFH+LKhDQHmDDSY3VTcfSV/xacIsrMYtkPGDqK68F6sGzTbWsowrWWKQwaOVwZoT3+SFIizrEI+oNk1XoHASaLAwYKPQ+srRC6itY9F5JWOaipCWL7gD57kURjOgWPh/HlEOPzuUGEhrv0Yff/oywThEPyqNL0nA8gN1TF5JLZe9kOK4mOXtVBXGs5+knPimHU1fNAMjA214zw7z5s5/peBTejLUq6FzKDRBiOKccMqPbzO9hwvdYC8koTrhBFbwWUIXWzYpNPCzGTAEu2xEuhlQftXLtixQojYtu9J95raJYPVYsN+7h6LeM5qV+ezfk42PG3HHXPRpY32SHk3fK+Vnhabu5iMLXz7MZm+ud1v025oeICMpNCQx/P9+mPHZyKWBgegSoccvU6HmO2zplmPY/fYQpDu1jcuSFjMTT2g/MQayzrU/Va4lorp9Jyp/jt1Ujw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(346002)(136003)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(31686004)(41300700001)(107886003)(5660300002)(2616005)(38100700002)(66476007)(36756003)(31696002)(86362001)(2906002)(478600001)(66946007)(6486002)(8676002)(6506007)(66556008)(6512007)(26005)(4326008)(83380400001)(82960400001)(6862004)(53546011)(54906003)(316002)(6636002)(37006003)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am1kaG1ST1g3L3c0bDFzcVBVYlh1TUFjUVVxU25yWXo5ZGpraFpFd0ljV0Nw?=
 =?utf-8?B?b0J2SjZueHVVdHArUHk1eW9yTnJ5OVMxNGsyZ0puS0ZJVzd4M2VWeHNCTU1S?=
 =?utf-8?B?NktIdlBRbVgybVlpWXBhZXZmUFhoUG1way9lSzBQWEJSSDBtSitsNmZwNGtX?=
 =?utf-8?B?Sno5enlkSll4dFBrWEQyUEJ4NW5sRmpvRGJWb2t5dTVKU1JwUm9oVi9FV1Rl?=
 =?utf-8?B?dVRkdjZoeko3ZVM3TUpIRWxONnpPc3plamVIVzllV2FVZ1hvSXZubzZPT1Vo?=
 =?utf-8?B?djcxVDhnU1pPd2pDN25PWVAya3RCV0lnRXZoeWpSTTR3OGd1dlNpU3NFcE5M?=
 =?utf-8?B?bVVNRzB6NjM5TnRxK3Rmb3dvYjdoMk1CT3hzMGdTRWlseG1LSUw2UXRtSXFt?=
 =?utf-8?B?NlpQUkFkWnY1N0gvVDd1UlUxOEtGWThNUnlBOHRwcHFRb3JXU3VoTUt4bnB0?=
 =?utf-8?B?Z0Jvd1VJak52cW4zVDBndXdmMnBWMndrUUdxaUVrRUVUQUJ6SitIZVFYQlVT?=
 =?utf-8?B?MVVLUUVoSTdMN0ZIR2RRU1o2U2NSWXUxQzNVSXk1M1EwaDZ1VmhaSWpTTVJj?=
 =?utf-8?B?L2QySlBjNXBpQitMWXY0enBNUDBtZzJoNzNWK0NLQ1lsRHJFQUhjZUxFK2dj?=
 =?utf-8?B?bG1ITVJldjNmU0xPakFXT3pMVm13RkJnWHRXS2pIUTM2Q1hKeU1wLzREbFpi?=
 =?utf-8?B?NVFOV0Fib2hMbWVwMlcxV3luTUgyeGFIeHhaMloxSmQzWmh6UE1sL2NWTVdi?=
 =?utf-8?B?c1VjOWQxWmNZWEp1emFJR0VDUFRVc21Kc2hiTzhrU1V2REFQQkczdStRWTM3?=
 =?utf-8?B?QmJWRVo3MW1BOW9OSWNxWExpNmZQVE5qb3J2UEVaL0dGUElGYVNCYXZaVi9r?=
 =?utf-8?B?U01xdTJzb3BDV2o1YTV2ajllWDBDY3NzbmtVV05mb25DOVFFZ0xJa1NBbmlu?=
 =?utf-8?B?R0NvUVRtdEJyQ1llN25TZ2Zsek9rNGVlRlZCa1BCZjUzL3lFdk9HT2dUc2Jn?=
 =?utf-8?B?ekg1Vld1aWdCcFB5ZHR4bkNFZS9Pem8xWUN6TXZ0STRGK2NTNURURzJMN3M0?=
 =?utf-8?B?UmJGcWV6bFcxdUJ6OUlWV01wMHZTUklBUlBXK2ZnNkowYzkyUFVZQm4yc0ta?=
 =?utf-8?B?aEM4akxWWG5CUjVPeE5wckdCVTZJaUZhRzRzeWRvMi91MTdnMW1qSktaNDcr?=
 =?utf-8?B?K3FsS3JIM3hyM2txNkhyUnBUbFZubHliVWF0WkwrZ0NSTTFKV0toN25nc3RD?=
 =?utf-8?B?L2pNL3RwRStPYVdJelNObjg5L0xTdTZUMDBSbUJBeG1WMTFaekNuaHFUT1ll?=
 =?utf-8?B?S2pyeXMwSU1XbWd0S1JjYVk3Y0ZKS2pzbnFUNVN6Z2ZTMGhac25CY1h0OVoz?=
 =?utf-8?B?T2hrTHpHRXdoNTdya05aTXJ2aUZLOE90QitSUURhbitBZnJkVStHalIwQ2lJ?=
 =?utf-8?B?bDNuNkYzL2F2bHpoMGtTMFVGaXRGMHJIYXBoTkN6U3dSSER4dUl0OTRlV0p0?=
 =?utf-8?B?cGt3Y1NIcDFOQXBSYm1Fc0d3SXFqNUtwNUF2dm1LSHZjYmlhWXNkWG91b3lF?=
 =?utf-8?B?YUFUR2wyUXQ4NUZ3aVFqS3ZrT2cvRzQyS1phMWYxbHZ6N1IyNTFwMUl4aUY4?=
 =?utf-8?B?ZnJ5NzU3Umk2Tng0dWU1ZldUNnpDU2NhMGJNbmFHRFR2Y0Z6aEl1eGl1bk1t?=
 =?utf-8?B?QnZ0bWloenh3ZkRYYlN4cnU4WWF5eEE1Rm9IRjYxMDVDVVhYdEYyRy94YU5z?=
 =?utf-8?B?SjRTcVhwdklHeFlrVlA4WGNGb2RGajJhQzJJeUlDRjI5dFdVVUNoUjVtazlr?=
 =?utf-8?B?YXZLSEt4OW5iazMwYi9qSW1uMnRqbjNmNC8xU1VTQTZSV3ZDdEVXdWlud1Rl?=
 =?utf-8?B?T0FvRUJuc3dyZzA0RzRiR0p0b3VndTJXQVRSUDY1bmEyVERWMjVjeC8vSk1s?=
 =?utf-8?B?Q0h0M242OHByVS9nek9UOXpYSk9jOVVEZUkvUG9HTHV5SitKeFo3TnA1S2pY?=
 =?utf-8?B?MXFVSGNIbDVGd2lmcXlTNFg3Rk5ja0FGbjFZenArM0UyQnRURWZaMDEzTTI0?=
 =?utf-8?B?Y3N4MnVqeGdGWllKTEV5dGpTNlFYeEhIWTUrY2NhenVTdnduTURRazVpRVRD?=
 =?utf-8?B?dDYyZHhCOHBJejB4di9FZ3FyaTkvWFpxcEkvT2lpeWo1Y0pzdGovTW4vbncv?=
 =?utf-8?Q?h5jiNkkicghjeTZb2xIzdIc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ec2dc9-edc0-4d8e-786f-08dc2808cd00
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 18:15:44.5740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1hQCqz2EOOlGsvQKFKcn3DsTbSggnZ7vgJ0JpMrY/hPsb64f2sNUkoT2C8KG5KZENrhv9IxDtUrT9AZvzlse6pvhxZWIZrP3RndVo8JNCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7569
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



On 2/6/2024 8:21 PM, Lucas De Marchi wrote:
> On Tue, Feb 06, 2024 at 03:41:03PM -0800, Daniele Ceraolo Spurio wrote:
>> Supporting older GuC versions comes with baggage, both on the coding
>> side (due to interfaces only being available from a certain version
>> onwards) and on the testing side (due to having to make sure the driver
>> works as expected with older GuCs).
>> Since all of our Xe platform are still under force probe, we haven't
>> committed to support any specific GuC version and we therefore don't
>> need to support the older once, which means that we can force a bottom
>> limit to what GuC we accept. This allows us to remove any conditional
>> statements based on older GuC versions and also to approach newer
>> additions knowing that we'll never attempt to load something older
>> than our minimum requirement.
>>
>> RFC: this patch sets the minimum to the current GuC version (70.19),
>
> we are still using PVC for development, even if not completely
> supported. We can't update to 70.19 since PVC is not in that version.
> Once we have a firmware in at least drm-firmware repo, then I think
> we can think about the changes here.

My aim here was to discuss putting a lower bound to the GuC FW version, 
not necessarily merging this immediately (hence the RFC tag). If we 
agree to proceed with this approach, I can then sort out the 
requirements, like pushing a new PVC FW for testing.

Daniele

>
>> but that can be moved one way or the other. The main aim here is
>> agreeing to stop supporting very old GuC releases on the newer driver.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_guc.c   | 14 ++------------
>> drivers/gpu/drm/xe/xe_uc_fw.c | 36 ++++++++++++++---------------------
>> 2 files changed, 16 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 868208a39829..5e6b27aac495 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -132,15 +132,10 @@ static u32 guc_ctl_ads_flags(struct xe_guc *guc)
>>     return flags;
>> }
>>
>> -#define GUC_VER(maj, min, pat)    (((maj) << 16) | ((min) << 8) | 
>> (pat))
>> -
>> static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>> {
>>     struct xe_device *xe = guc_to_xe(guc);
>>     struct xe_gt *gt = guc_to_gt(guc);
>> -    struct xe_uc_fw *uc_fw = &guc->fw;
>> -    struct xe_uc_fw_version *version = 
>> &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>> -
>>     u32 flags = 0;
>>
>>     if (XE_WA(gt, 22012773006))
>> @@ -170,13 +165,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>     if (XE_WA(gt, 1509372804))
>>         flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>>
>> -    if (XE_WA(gt, 14018913170)) {
>> -        if (GUC_VER(version->major, version->minor, version->patch) 
>> >= GUC_VER(70, 7, 0))
>> -            flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>> -        else
>> -            drm_dbg(&xe->drm, "Skip WA 14018913170: GUC version 
>> expected >= 70.7.0, found %u.%u.%u\n",
>> -                version->major, version->minor, version->patch);
>> -    }
>> +    if (XE_WA(gt, 14018913170))
>> +        flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>>
>>     return flags;
>> }
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 4714f2c8d2ba..e5bf59616f3d 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -296,36 +296,28 @@ static void uc_fw_fini(struct drm_device *drm, 
>> void *arg)
>>     xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
>> }
>>
>> -static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct 
>> uc_css_header *css)
>> +static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct 
>> uc_css_header *css)
>> {
>>     struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>>     struct xe_uc_fw_version *release = 
>> &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>>     struct xe_uc_fw_version *compatibility = 
>> &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>>
>>     xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>> -    xe_gt_assert(gt, release->major >= 70);
>> -
>> -    if (release->major > 70 || release->minor >= 6) {
>> -        /* v70.6.0 adds CSS header support */
>> -        compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>> -                         css->submission_version);
>> -        compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>> -                         css->submission_version);
>> -        compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>> -                         css->submission_version);
>> -    } else if (release->minor >= 3) {
>> -        /* v70.3.0 introduced v1.1.0 */
>> -        compatibility->major = 1;
>> -        compatibility->minor = 1;
>> -        compatibility->patch = 0;
>> -    } else {
>> -        /* v70.0.0 introduced v1.0.0 */
>> -        compatibility->major = 1;
>> -        compatibility->minor = 0;
>> -        compatibility->patch = 0;
>> +
>> +    /* We don't support GuC releases older than 70.19 */
>> +    if (release->major < 70 || (release->major == 70 && 
>> release->minor < 19)) {
>> +        xe_gt_err(gt, "Unsupported GuC v%u.%u! v70.19 or newer is 
>> required\n",
>> +              release->major, release->minor);
>> +        return -EINVAL;
>>     }
>>
>> +    compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, 
>> css->submission_version);
>> +    compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, 
>> css->submission_version);
>> +    compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, 
>> css->submission_version);
>> +
>>     uc_fw->private_data_size = css->private_data_size;
>> +
>> +    return 0;
>
> my main concern is not about raising the version requirement, but that
> this is too early. We don't have 70.19 for any platform in
> linux-firmware yet. And we don't have it in drm-firmware for PVC at all.
>
> From the above changes, it doesn't seem we are reducing a lot of code:
>
>     2 files changed, 16 insertions(+), 34 deletions(-)
>
> maybe let's wait a little more before doing that?
>
> Lucas De Marchi
>
>> }
>>
>> int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
>> @@ -424,7 +416,7 @@ static int parse_css_header(struct xe_uc_fw 
>> *uc_fw, const void *fw_data, size_t
>>     release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, 
>> css->sw_version);
>>
>>     if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>> -        guc_read_css_info(uc_fw, css);
>> +        return guc_read_css_info(uc_fw, css);
>>
>>     return 0;
>> }
>> -- 
>> 2.43.0
>>

