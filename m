Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E246C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 19:02:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0427210EAC6;
	Mon, 25 Mar 2024 19:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZICuq9AY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086D210E82F
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 19:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711393349; x=1742929349;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5JRx1MWleOJXo0+QuzRdUFVtpLk/h/hHKP4FmAmlDno=;
 b=ZICuq9AYZIy4jeQQRboqz8sA93xZ5bGjEE5z517x6XzMOHtqlr4fBwcU
 4xD6oyw+nXgUEZFOPmcCkYcX0JllejL0pSpHi+mNV5DifN5JtYwAPDBfI
 8kBaga3wGPyldSKZ9LpBl6HDhTUpwsA2/qm1e4tsdj11djznhE7GNcl2S
 2hdDTM2QD+XloG320C5OYFkljFDdy+LQiu13GkZLkYvltoe6BddRs2A7R
 E+FJYHJtk30gMofVCYX8fcL8Jg6wqiPVx9biMmNGC3l/N7WnYD7Se9LmL
 YyCTDirybLrdv4pQfDsMfyVZWeik5f6NTrGVsk39QDpYbr3TUZJ6kMzUO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6249070"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6249070"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 12:02:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="20440656"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 12:02:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 12:02:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 12:02:27 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 12:02:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TocdS/CMxYQ+3RCiqDJOpMUjIkEyUBPMlhoL+SDfS5Gud4DLi54DixpeQil9mfLOp6/LIh5HGWd/lb6JWxrMVDAWsucszbcRwtTmaNhv0tt0WOrvsJIGaUtnK9rIF7W2h998QLxb9TAc37V4QUwLysJLnNywbXvMefLWUooezTEMR9hm8rtnrvWYuaX7/qlnZ9NSEjkK9ccJfo4EQKUz6h1gW7am1zcukV/XPV8CgbGalq7it0iIElwdkfeO6g7WW4us6eaqgXou/uwY6tvO+zD9l5GWnHkiGjnD9h+1AHp9mmzt6yLb4g88AJxs64cuMcAGtRsUQ+q5yk9MjtNXRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5kH7FiQki0kqmhO3X0lQvxDYJrOLBUrWZ5+cVHSQ6g=;
 b=lPOblNw35a6uhIGAdgpiR8SuZC1nACqAMc/kle2Tz92hUaaclhB+fBAho6RkFV9Y/y1doSCsJ9zTcdHSfhAYQZv3EfrWYLcyqsUAOJau2hPHZq6QtyGDcT45tS1rOWwK1x8f+RjzX65Tf4jcQfeoSXp0uS9jG4THpgVXbw+8XqyBdOIf62LB7htKSkb9PWJIemdegKNslqq498bxvY0RrwOHyrYvyhEJU192Qr2lW1MTH0r2Cj1JeRb8LYfzFMeBFpdZgzP/ixZgNbxEJmUXI1on2SarpqnnjnqO1I7df0xNRSijiHkcydBuyERJcUE6EgjVYcTS4TPSe9da+1w8YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB6606.namprd11.prod.outlook.com (2603:10b6:510:1b1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 19:02:25 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 19:02:25 +0000
Message-ID: <d712f617-ad11-4f0e-8005-4594c97a87f1@intel.com>
Date: Mon, 25 Mar 2024 12:02:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/lnl: Enable GuC Wa_14019882105
Content-Language: en-GB
To: "Nilawar, Badal" <badal.nilawar@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>, <daniele.ceraolospurio@intel.com>
References: <20240325150435.2967536-1-badal.nilawar@intel.com>
 <20240325150435.2967536-3-badal.nilawar@intel.com>
 <29f52749-032e-469e-9cae-cad1f01896fd@intel.com>
 <e1b5afdb-0307-402c-a7fd-778131353a68@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <e1b5afdb-0307-402c-a7fd-778131353a68@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0217.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::12) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB6606:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5/Et5PiABbAPAdqbsIdvKavV/s/OrJxEMIIF/CG5fVE+C/sGk/5kSQiveTOUkFvFqus3bSs5zVWQ+7wnkZnxPP68DEvL8Xe6J1TD/6dlWD+etCuaJF5+GS6tsgsS2UTfcA6gtUGqkJ6za1fjEh7h/5ct9RWzYx9KXHUIRf7F5WjQ1FQ3Qb5nHJ8Mt4iZ3clNd3flVPERr+yPnoPA+nArPYnaqhUWRa9QiZPH8utBJW3R+ewAfOOVA6ICaZy6gX7ISIBCr1178RHy2MjOwrYOXJQkie8BrkB+tRjBebiBk5zkt7p2I14id54dXYwsxdLjKaWHNfdqEiCRrNgLYldXd401Qhz9uqN7h6GT9/7jY6DQb70fjjm4ISbCsfqrpUQFFHbwFSZ57fAM0ZhKxekUN6lkx/vtFsVAktuwTZ2tPMOuSzJcJ9rEWhC9+YV+SKZUnCk/f/BPJZ/tonPEhchBnPL/GFgk9gX+3uvBAVm6zCP41CorlQ5bcSaP63Mqu8CBfSl7mFM2jteOtuQHuvNvCyoR4K2+u96PPcqDKymE9jtS6MbvoxNzwNb7/q7InwFm9iS4IPuZbFkY43qv4GHFIughC2Y0wteaSJqmGdL/nRfg+1rgFjs1fvqs56kpolGFwJPxd5dXhcAnWIGSYOLXlpo9lsEwrvBVTBoCkYXZNjw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDlnbkViSFU4cVZuaUFBK2xLYVk2cXBwb3NRekRFZ0lERXlzanlvNXhCT1Q1?=
 =?utf-8?B?VzBIQ21USCtTckdLOGlpeWdlU3d6eWYvOCtLUnpHWGVDNjF6b2U3VmFYK1dQ?=
 =?utf-8?B?aStQSm9YcTcwU0N1alpzVXVGdno1MWJwWTVabUVYT1Mya3N3YVZra2VVdlAz?=
 =?utf-8?B?b0RSaEM1UHg4dURMdjc3YjlVYkFVRTJ5a1lXVldWSlVUTHM3NG8yRlZBZUpy?=
 =?utf-8?B?czJ5TUc3MC9YWkZtbWpOb1JsalhSYW1lNTkvcUpzSml5TldMMy9RbXU1RHUz?=
 =?utf-8?B?REhIZVkycW9NL2dCWWZ6NGNYMVM2cWpaNGtkY004RUZ5bjE2SjN2Zjdqd1Rz?=
 =?utf-8?B?ektqWS9OOE1GOGlWUnh3MlFWSCt5amZqTjlVRWdsZHY1cUlGS2ZQRVo1NjRM?=
 =?utf-8?B?Sjd3ZTVJOUE3RzVydFZhK1hoVWdiTzF5bUpHbmRrRnNEZTBGZVdORzZtOHpB?=
 =?utf-8?B?ell5Vi92a2dVL2lWRWxJSEZTNlJYeEl0T1NQTEVTWmcyNm1wNnhxbm9VWHBF?=
 =?utf-8?B?TGVsYUY5TWpaK3YyRjh0eWxHbjZhRFg1citXNE9xVjg4SG1pREZPQlZRTmU1?=
 =?utf-8?B?TWl6Qy9MYjJsUXh6QmRla0kwK3R3Qk11ODZGUmRlYTFGdXpSbUh5SWRmUWk2?=
 =?utf-8?B?YjJKa2JVVGxhWjdGMUFuc29YYlV4MENrdzFUMGJtcU5pWkMvL1Y5Q1lmUFlk?=
 =?utf-8?B?eVBQSGpPYlVLUFhLV1pyYlRSSjBPNml6a2dSR1V6ZGhQb0JoajVFUTNrbC9Y?=
 =?utf-8?B?ZFdkdVNwMkVxSDRKd2dGUnlnZDNjWVo0dGlUVTNrcVpIRHhYQ2FKcGVXdWlF?=
 =?utf-8?B?MXlrS1VxekRZajJTTUR3ZlY0TjIwWWRmQXJYdjFDMDFEL2VKVStXa2F3QXBy?=
 =?utf-8?B?bDJnYzl3bjdpTElNaGpxMmJiTDBOZks2VUFQZzlZMWg5VjhUUXpiNncvUG1w?=
 =?utf-8?B?Yk5rWFBveGhzYlJ6THpHZFE3WEdKNG1GVFNnbDVSRWN2MGJJd0VqclBGVlJO?=
 =?utf-8?B?c29pTnBucjlXK2FWSmpwR21Nb1FvNXlBeXgzZ0srdHkwN2ttNDNXSzhJczlv?=
 =?utf-8?B?N292QWtIa3k1QnJ4QnFtcGxuMVJCL2R4ZWxHRys5ODZjT29rM3VvMVlyYVNL?=
 =?utf-8?B?SWc5b1JPVXJRSlkwWUdBcUM1dExicTgrbmd1Q0Nva2c0WVJjZFdNVXJCMThz?=
 =?utf-8?B?UGpRSkdhNHhGTFQwNTlQdjlpakw1aXFMelpkZGo0K0dnS3ErZUZEWEpDTXQr?=
 =?utf-8?B?ek1PVXovY2V4NXNlNEJNbSs3RHhTRkVzOHlXWkUwSmR0V0tEamwxY2RBb05O?=
 =?utf-8?B?bW5tY05NK1EwS25pWmR1WXJNZE5rQ3B1T2tTd2g2cGtoc1lxK2RHcmZibm01?=
 =?utf-8?B?VFRnQ21VaWV6RTNCbWZuQmlXYkxnV2k2TkRnN1krSzN5K3JRVWNaNmwxdVBt?=
 =?utf-8?B?NG9wWEJQc2ZuRHpOVkc1UW5hWVlBWWVWQlhOTzZvZEYzSFdYdEg4cURVVFJm?=
 =?utf-8?B?QWlDR3VpTDl0dmN4SlkwYmNnV0E2Ulg3ZDIrMFdZeWNzcWxVc0p5NS9QWS9t?=
 =?utf-8?B?Ulo4YnJQMU9hTkp0S29GWUNPdlcrb3ZVRnRhZ2lISUNHQVV5eUdISDhFYmZT?=
 =?utf-8?B?LzMxNk9MZXpJQ2FndXlJV2tBTVY0bTloVjE1ZnppWkV5SzcwNzlINUREZlFE?=
 =?utf-8?B?K0NMQzRuaTBhbm9FZHpQcStJVjRUaWU0dExKbEJGNmY3MjI5SXl6bzJUMncx?=
 =?utf-8?B?QkpZY1RZU1JIWXd2UWNlM0NiaElJYnpYQUZaallSMFFMRG9COVFuQ3VORGZM?=
 =?utf-8?B?NHVHM3BFTGMvUkVMQ090WWdoZ3NYZFpIRGN4dFhXQ3NiSStuL053WkVXSUlK?=
 =?utf-8?B?SWpFYkV2WmpSSDAzWEs4aTZicm5oWlJHT1lwNFhkeFFvbVYrWkQ2N1RtaDVF?=
 =?utf-8?B?N1hYSG8zcGZUbVR2ZGRzamtLY05FSzAyNlJlazFGdGNLZnphVzc5dE1aUVJW?=
 =?utf-8?B?SkswOE5TRk5kSll0NTJoS0VvZTg4WHN1ejd5TUpKaUEyM0NHTkZ2WWRJWE9W?=
 =?utf-8?B?SUhKRUNJN3krYmI1dGpoYlJkQ3lnckJYcWdETk95VVpybFZkcDk0eW10TE1V?=
 =?utf-8?B?VHUzbzdTakN1dDJOWVMwSWpySkVGblRZUnNzLzNEZE01blM1SitKaXNNdlJ3?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2beb204c-c2d3-4205-91bf-08dc4cfe1baa
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 19:02:25.1196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2tft3o2pQtw4o9N9RKxXWzzCZD8R0D/MK7H8kEfBivajxQGg4iQeQKam12A+hnYlcC6cLFnXuNFNxKdyQ2r/Nz2chjN+GAw+rPgeMzF//o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6606
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

On 3/25/2024 11:09, Nilawar, Badal wrote:
> On 25-03-2024 21:02, Michal Wajdeczko wrote:
>> On 25.03.2024 16:04, Badal Nilawar wrote:
>>> Enable GuC Wa_14019882105 to block interrupts during C6 flow
>>> when the memory path has been blocked
>>>
>>> v2: Make helper function generic and name it as
>>>      guc_waklv_enable_simple (John Harrison)
>>> v3: Make warning descriptive (John Harrison)
>>>
>>> Cc: John Harrison <john.harrison@intel.com>
>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  7 +++++
>>>   drivers/gpu/drm/xe/xe_guc_ads.c       | 41 
>>> +++++++++++++++++++++------
>>>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
>>>   3 files changed, 40 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h 
>>> b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> index 0400bc0fccdc..5dd45e06f0b6 100644
>>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> @@ -319,4 +319,11 @@ enum  {
>>>   #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY    0x8a0b
>>>   #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_LEN    1u
>>>   +/*
>>> + * Workaround keys:
>>> + */
>>> +enum xe_guc_klv_ids {
>>> + GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED = 0x9002,
>>
>> how should we know the LEN of the particular W/A KLV ?
>> as this is the ABI header, IMO we should define that here along the KEY
> W/A KLV are alternative to flags to enable workaround. So length for 
> W/A KLV will always be 0. Should I still add length? May be I can 
> define #define GUC_WORKAROUND_KLV_LENGTH 0 which will be common for 
> all W/A KLVs.
Not true. Key 0x9008 in the latest GuC release takes a data field.

But where/how would you use the GUC_WORKAROUND_KLV_LENGTH define? The 
whole point of the guc_waklv_enable_simple function is that it adds a 
KLV which takes no data. Are you going to add a test to every w/a for 
it's length to be defined as zero and then call _simple() or _fancy() as 
appropriate? That is pointless complication. The size is static and is 
known to be zero for all current keys other than 0x9008. So there is 
zero point in adding code to check the size of those keys.

John.

>>
>>> +};
>>> +
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c 
>>> b/drivers/gpu/drm/xe/xe_guc_ads.c
>>> index a98344a0ff4b..633e5fd9c738 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>> @@ -7,6 +7,8 @@
>>>     #include <drm/drm_managed.h>
>>>   +#include <generated/xe_wa_oob.h>
>>> +
>>>   #include "regs/xe_engine_regs.h"
>>>   #include "regs/xe_gt_regs.h"
>>>   #include "regs/xe_guc_regs.h"
>>> @@ -19,6 +21,7 @@
>>>   #include "xe_map.h"
>>>   #include "xe_mmio.h"
>>>   #include "xe_platform_types.h"
>>> +#include "xe_wa.h"
>>>     /* Slack of a few additional entries per engine */
>>>   #define ADS_REGSET_EXTRA_MAX    8
>>> @@ -279,23 +282,43 @@ static size_t calculate_golden_lrc_size(struct 
>>> xe_guc_ads *ads)
>>>       return total_size;
>>>   }
>>>   +static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
>>> +                    enum xe_guc_klv_ids klv_id, u32 *offset, u32 
>>> *remain)
>>> +{
>>> +    u32 size;
>>> +    u32 klv_entry[] = {
>>> +        /* 16:16 key/length */
>>
>> drop this comment, code is self explanatory
>>
>>> +        FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
>>> +        FIELD_PREP(GUC_KLV_0_LEN, 0),
>>> +        /* 0 dwords data */
>>> +    };
>>
>> you can define size here:
>>
>>         u32 size = sizeof(klv_entry);
> Sure
>>
>>> +
>>> +    size = sizeof(klv_entry);
>>> +
>>> +    if (*remain < size) {
>>> +        drm_warn(&ads_to_xe(ads)->drm,
>>> +             "w/a klv buffer too small to add klv id %d\n", klv_id);
>>
>> this looks like our programming error so xe_gt_assert() should be
>> sufficient as we don't expect this ever happen in production
>>
>> but if you want to keep the WARN then use xe_gt_WARN() instead
> Ok
>>
>>> +    } else {
>>> +        xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
>>> +                 klv_entry, size);
>>> +        *offset += size;
>>> +        *remain -= size;
>>> +    }
>>> +}
>>> +
>>>   static void guc_waklv_init(struct xe_guc_ads *ads)
>>>   {
>>> +    struct xe_gt *gt = ads_to_gt(ads);
>>>       u64 addr_ggtt;
>>>       u32 offset, remain, size;
>>>         offset = guc_ads_waklv_offset(ads);
>>>       remain = guc_ads_waklv_size(ads);
>>>   -    /*
>>> -     * Add workarounds here:
>>> -     *
>>> -     * if (want_wa_<name>) {
>>> -     *      size = guc_waklv_<name>(guc, offset, remain);
>>> -     *      offset += size;
>>> -     *      remain -= size;
>>> -     * }
>>> -     */
>>> +    if (XE_WA(gt, 14019882105))
>>> +        guc_waklv_enable_simple(ads,
>>> + GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
>>> +                    &offset, &remain);
>>
>> hmm, it looks that your implementation here in patch 2/2 is different
>> than suggested one in patch 1/2
> I wrapped up adding W/A KLV entry inside the function. I will refine 
> comment in patch 1/2 to align with patch 2/2.
>
> Regards,
> Badal
>>
>>>         size = guc_ads_waklv_size(ads) - remain;
>>>       if (!size)
>>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules 
>>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> index 48cdba1cbf95..a8d15f004b6c 100644
>>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> @@ -19,3 +19,4 @@
>>>           GRAPHICS_VERSION_RANGE(1270, 1274)
>>>           MEDIA_VERSION(1300)
>>>           PLATFORM(DG2)
>>> +14019882105    GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)

