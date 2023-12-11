Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0B5C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 11:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85F710E3A2;
	Mon, 11 Dec 2023 11:07:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C5210E3A2
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 11:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702292853; x=1733828853;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WiiTXDZKglmBLyaLdPDoWgVJ21XbcuQ2JB4TJ0d+cL8=;
 b=ntowEwGO6kznLfioi3SBPL6CD6wwoZuztrgphsboF3QZpK9bNuHT35PY
 S3xFrdBVUVxii2QaI0AM732CcP6F6kYH9ld0NfrJ0XveH65KFDjjSxe2g
 0g7s1Fmj7WKsOTDxl8Mt4UUSXN5S8zsxjT8T/xl5MzssOK7fLq08boRAH
 Zvub2x78ePh1jGUxVVq6eH8QZAJcQxMXBbM8+XryaIx86YePt234zKZOG
 5A2O1+iIEbuO0v16Yfe/H4tXQrbRcp9E4ahAL6xwnZg8C582gOUXp4ual
 N7eYY4eAuBVDivYwQpPOJOSeGvPYhPnJS7LZUYWRFWD/uQqxO4DGGwlDz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="394369921"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="394369921"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 03:07:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="773013875"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="773013875"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 03:07:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 03:07:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 03:07:32 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 03:07:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fspD6TxaF6YorzyXIFCk2nknkWkqtAdSu/ReI42vsF72sgfKiv+RCCjKyTeXKAnqBbzQUsbvqPhSOekXUSKqeZJbNbmuPVXZeoSxGDk6lpT0JVnXe3sd0j4d0USIHQtUtDlQRTgoCWCgsixOLnps1recWjTiEf/9uvucWsbKxFLMlKl57d7spop7LClNpADmMexFPrAwnQQPSY6vpkef+yNwEZ+Rw9zuTs1K9Gu5lH7bPzEOtHXlgMMQKD7KRVFkW+/MImd+q1w6G20Le+H9ogP+dcj0FwohFTrv1qevkAPxUja5ESvQ2sLsr2BXjHoWXpTKgVx+zCPJA5PtS1twFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q94Fgrh/r0vL67FFJn8Lr7CzKpNSB3LzsWhWX8bm5I0=;
 b=CXoY/j9HhXX6OgkF6WL2nMwF6Gm+1jwRC38l0OGHBkUZ3CXqA8Fw97DZk29XIYK8H6YTGugnbMLq875iZ5ijBhPE8Yit1m46ls/mZIY6v7fggxZultw726eNesI0Jwvu0bJ8JvK/1giaYPAxcb7mG44OruOJS0tsN6ysLbcc2R8q1vc+sU1MJoh3fbAcXzHh4KOpqJamyCRf7peSre4UMClXx3cif6yklVK7RsnqTVoin0CSiF6jQjYiF2e/ptiVA7hC5MKIhuqMRZXj9Md9HcSSpBWjoJ30VGf24x4WHXboSZxFp8356eccQKAc/Oe+0cQ4mr2JRX43MJfZJ86aZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW4PR11MB6761.namprd11.prod.outlook.com (2603:10b6:303:20d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.33; Mon, 11 Dec 2023 11:07:30 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 11:07:30 +0000
Message-ID: <4f61addc-ce03-4ff9-a82e-bd6294893e3a@intel.com>
Date: Mon, 11 Dec 2023 16:37:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 1/2] drm/xe: Add a new memory directory under tile
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Sundaresan, Sujaritha"
 <sujaritha.sundaresan@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
 <20231207151739.1241374-2-sujaritha.sundaresan@intel.com>
 <SJ1PR11MB6204399019B23285D88A04B1818AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <692a9b93-dfba-43b9-a838-9e4cd20fa093@intel.com>
 <cb403e6c-cca5-4495-b1d1-57b38fffdaab@intel.com>
 <16f7e629-98da-456c-9506-27448c8246fe@intel.com>
 <DS7PR11MB61976F9270AF44005B1DD97E818FA@DS7PR11MB6197.namprd11.prod.outlook.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <DS7PR11MB61976F9270AF44005B1DD97E818FA@DS7PR11MB6197.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW4PR11MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fd80a68-9991-4741-40e5-08dbfa395d7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /rEGkZBSEugFUXl2VBkJ2gVL2ozZN+Ak9HSW2SKhS91WBg4JMspvlQ0OvqpVQAVhhskdzRau3E7Z0dMsf4EMgYcNKloP3JbCA4L7oOZlgjeQr25Dm0QsjkEOMJBXfy93FOoaTLW9GTlbhcVx+Nh6ADz7bF8vX4fhtR3htC522JdHT7dINR8hkyUQE8VR9uicZ/AykuIJnprkueBElUXdejoRyyUbpEH1hFuR68nRhXG2ou84/vw77DZ2SUOQ8BcUc9GgMFEZJke8vcUeENDWKIEbC0NvjXuXUchHbwp0Mpx0h/WKBbWeVPKmfyLOc6f4yRAc7ctTJx5+BGbNziIYDdT5Ou5nnZtRG4qvbbaDa0ExdipHexSHxASX+H2nDXqiNi1oItcX0Nkt5r1ZVM1AiFcEicPAalXiK8/li/KKTquL/GH/NQeVmksknH4DN8I24He9kGshLrFIfzBbcOe4A5wAzSicg9ofxUcLEnPBMr0H1ZO4ZlT6V1ExETRSN67UlW0GoT0atjg2QMkZL+Ql0A8tacfYWFnk0cMCoUPL5azqUSDGnI6GCBf6Xpn8OfA1fzpae352/XVUdvkItSh0E9jp8oa5H5T8mf7VtcH5uejqLex0eSGDHiT4cEvnBX8edeAtV/CYSi5YliT5LpY6cA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(346002)(396003)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6512007)(6506007)(53546011)(5660300002)(26005)(2616005)(107886003)(44832011)(36756003)(66946007)(66476007)(66556008)(6486002)(2906002)(83380400001)(31686004)(82960400001)(41300700001)(478600001)(86362001)(8676002)(8936002)(4326008)(31696002)(110136005)(316002)(38100700002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkQ0UVdXWVpJUnlQV01aWFMvU09zTDVmandiRngwN0ltMzNQQUZIQjJ4dXY5?=
 =?utf-8?B?a2dsNC9FbDZGSFRMNW41VnlVQTQvWnhCNkhMTkJMWVF0cWQ0NGVNV0Q5T3JU?=
 =?utf-8?B?TCtyRUlIT01rYjR4MjByYm5MREpydDVjT1hxeHZCSjVTT0ZZaHdsbGlkVTVw?=
 =?utf-8?B?UzBlNlJtemhRL0NGQjBCL1luajV2Q1oxc3d0cGVoa01xd2tsRWpjcjVnbE9r?=
 =?utf-8?B?bTVzV2xKa0V1eStPbnZFY2VKRm01S1M1UUgyY1IxT0dhYVpZZmlYYVBRQzZv?=
 =?utf-8?B?SG5xMzlOcFU4cE02WTN3MXlPSE5KcFJtRHkvSWEzWml3SU1YT2RTK3RvUkNV?=
 =?utf-8?B?b0RPQ21YWEdVaUFwMTlKYzJPcVhENVEzKytUaVA1RkhNYUxPUWkrUEVUNlVW?=
 =?utf-8?B?TXdOK0ZNN0M4MjlQRENRaWlmU2xSa3lFVmwyZ3BzMXJqalllVHAzc2VpL0lw?=
 =?utf-8?B?YVpnR3ZndUo4ODl1dXlkN2NJNkFRMTl2Vit2L2hyRzVRY0g5M3lGWngwS3A0?=
 =?utf-8?B?b1NKaGpRY0U4U0UzUnQ5dkVqVlRpaU5pazl4ZXBMRWZ1VHBDY2NscXZjWlBy?=
 =?utf-8?B?OTVQY29EdWlKSElaVjRRVFZZUHFwdVI0YUo1TFRZUUV6ZW03Z0xqUnd1MitO?=
 =?utf-8?B?S2V3V0JPeTEwMkpjZm41V1VqOGVBYThNeUZhUnBGdFB6UXkzcThoR0xRN3ZS?=
 =?utf-8?B?U0Rjd1h2YXlGRzZ2NGtObkJhVXhCMlVtM1JvTWtoNTh0Rm5kM2tsMWpCQ1JX?=
 =?utf-8?B?c2FaQ2Mrb1dNMWpHVVlJREdWMmZhZ2dTcEZxNXgzd0tuTXdaSE5vUys4eW0v?=
 =?utf-8?B?Tk9SbmRMRVluUmc4aFB3RjNSdCtwc0FPV1dMWFczTHRSNU1kcldXcThIVTRi?=
 =?utf-8?B?c0t2Uk9pclpWYnlIY25odmV3a2N4eFVUWDRaTUwrelZqeld3aVVYVkI4M3FS?=
 =?utf-8?B?S0lvVXhrajR5V0V5UnpNUEt4QXZ4OWdpbWR3amhycG1HYTg3NTFsbjFSRUtm?=
 =?utf-8?B?QlRqenR3R045K1JZTi9DRXkxcWRVcVVqdEJ3ait2d1dMUllkenJZVk5lNnpG?=
 =?utf-8?B?aG1nNUdGa0thKytYdUphQnNTUXI5QXVmNmpPM1o1V0MybEhUcG9JMCtNSTdZ?=
 =?utf-8?B?K3NGc3J3QUtaVUxFM2pPVGE0bDVlZStlaGFFRStiMXRNYWtIZzdzQlJjZFhS?=
 =?utf-8?B?NXhZWTVXOXFzYWJvMysrRGhQWnFRTld0emNRYzZ5YVpDZ1B2S3R1TEgrQmQy?=
 =?utf-8?B?R2R3ZUUwbFpJa1F0NkdRRWVWMWJrdU5kdlA1emxtL052ZDByZk1zN3NwZkRi?=
 =?utf-8?B?QzZkOHMxek9VSEd1dkZDa2NvV3h3aVpibTZIY1FGUDNLOGplM1k5UWRsRlhq?=
 =?utf-8?B?K2pRQWptN2F5Qm9BaUV4VHNsRElWa3ppWmNBYkxlZ25uL25BdVRTNnA4bllm?=
 =?utf-8?B?MTVyaXdraWFmTStmd0hROWxHTFBsUUIySVphSEFqVk1TTkNIN21aazdiSEZ3?=
 =?utf-8?B?S0NwMW5xVEFDY0JwRHBlM01yZllKSjEyNkMwWVBSM1ZMaUQ1Tkc5Ni9yOTlK?=
 =?utf-8?B?ci9LeGdFV2VVYUhzci9IdTUxaHJJcFltQzl6eXhuaXY5VmpsZnQ0YlFiWE1K?=
 =?utf-8?B?bXFLWk5FQklVT1JvZHg5WHRuTWdqSWhodGVnaklMMmhQdzZ1UjRlZ1I0NHUx?=
 =?utf-8?B?empQNE1HNGozVTRrREhwT09WTHRyS1RScUNhWnFnOC9TM2l3bGxkRFhLRTZw?=
 =?utf-8?B?aVhmN1RSMDVRalFVTXczUytvZGVDUlBZNXltTC83OVVvczZSRWl4RzBFeURu?=
 =?utf-8?B?T3NPVkIvbXFPVFZzZ0lueC9HZ1k0OCtSd25ibWg5dVRHMXZTcXVBS1o5aWdZ?=
 =?utf-8?B?WmFhOFcwamxhK0R4R2xwOGhHTWhwTWxHTlFwV2E4eGhWM2R2ZjJyL3ZjTGg5?=
 =?utf-8?B?RlM3dzVxTTB2WlNCYUx5b3c3d01DbVc0VlI0V0x4QUlGSzVkREsrRDR5d3ZI?=
 =?utf-8?B?WkhkYXhKZHVqRlVGZjVnZzBGcGZMd2VjTEhHNVpES1FueFprenAxQktua3VH?=
 =?utf-8?B?Mi9HejJFQ3c0WnFaR1dzcVQ5QlRpY3YybWhSUkhkTTA0N2JRQnh3WG5ieWFO?=
 =?utf-8?Q?LOoqyqqR4BxWD79GGFuSohLnP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd80a68-9991-4741-40e5-08dbfa395d7a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 11:07:29.9747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fbh5Zj8BFV5LxbHNEOZInklukbPNEq0rbQR0DHXjX4vMSuOg9oiasAhqf1vfe++C35Lw7a5uw+7fTa51+jFBdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6761
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

Hi Suja

On 12/11/2023 4:31 PM, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>> Sent: Monday, December 11, 2023 3:45 PM
>> To: Tauro, Riana <riana.tauro@intel.com>; Upadhyay, Tejas
>> <tejas.upadhyay@intel.com>; intel-xe@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>
>> Subject: Re: [v3 1/2] drm/xe: Add a new memory directory under tile
>>
>>
>> On 12/11/2023 3:23 PM, Riana Tauro wrote:
>>> Hi Suja
>>>
>>> On 12/8/2023 1:58 PM, Sundaresan, Sujaritha wrote:
>>>>
>>>> On 12/8/2023 10:33 AM, Upadhyay, Tejas wrote:
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>>>>> Sent: Thursday, December 7, 2023 8:48 PM
>>>>>> To: intel-xe@lists.freedesktop.org
>>>>>> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Tauro, Riana
>>>>>> <riana.tauro@intel.com>; Gupta, Anshuman
>>>>>> <anshuman.gupta@intel.com>; Sundaresan, Sujaritha
>>>>>> <sujaritha.sundaresan@intel.com>
>>>>>> Subject: [v3 1/2] drm/xe: Add a new memory directory under tile
>>>>>>
>>>>>> Add a new memory directory under /device/tile<n> and move
>>>>>> physical_vram_size attribute to the new directory.
>>>>>>
>>>>>> New hierarchy:
>>>>>>
>>>>>> /device/tile<n>/memory/physical_vram_size_bytes
>>>>>>
>>>>>> v2: Fix heading typo (Riana)
>>>>>>       Fix cleanup error on unload/reload cycle
>>>>>>
>>>>>> v3: Fix reload error with kobject_put in place
>>>>>>       of kobject_del (Tejas)
>>>>>>
>>>>>> Signed-off-by: Sujaritha Sundaresan
>>>>>> <sujaritha.sundaresan@intel.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/xe/xe_tile_sysfs.c | 19 ++++++++++++++-----
>>>>>>    1 file changed, 14 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>> index 16376607c68f..64be1f3a38a9 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>> @@ -24,7 +24,8 @@ static ssize_t
>>>>>>    physical_vram_size_bytes_show(struct device *kdev, struct
>>>>>> device_attribute *attr,
>>>>>>                      char *buf)
>>>>>>    {
>>>>>> -    struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>>>>>> +    struct kobject *kobj = &kdev->kobj;
>>>>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>>>> As Christmas is approaching, you might want to adjust this in
>>>>> Christmas tree order.
>>>>>
>>>>>>        return sysfs_emit(buf, "%llu\n",
>>>>>> tile->mem.vram.actual_physical_size);
>>>>>>    }
>>>>>> @@ -36,8 +37,10 @@ static const struct attribute
>>>>>> *physical_memsize_attr =
>>>>>>
>>>>>>    static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
>>>>>> -    struct xe_tile *tile = arg;
>>>>>> +    struct kobject *kobj = arg;
>>>>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
Also, check if kobj is not null before conversion. As we are continuing 
with init even if kobj creation fails
>>>>> Ditto
>>>>>
>>>>>> +    kobject_put(kobj);
>>>>>>        kobject_put(tile->sysfs);
>>>>>>    }
>>>>>>
>>>>>> @@ -46,6 +49,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>        struct xe_device *xe = tile_to_xe(tile);
>>>>>>        struct device *dev = xe->drm.dev;
>>>>>>        struct kobj_tile *kt;
>>>>>> +    struct kobject *kobj;
>>>>>>        int err;
>>>>>>
>>>>>>        kt = kzalloc(sizeof(*kt), GFP_KERNEL); @@ -64,12 +68,17 @@
>>>>>> void xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>
>>>>>>        tile->sysfs = &kt->base;
>>>>>>
>>>>>> -    if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>>>>>> -        sysfs_create_file(tile->sysfs, physical_memsize_attr))
>>>>>> +    kobj = kobject_create_and_add("memory", tile->sysfs);
>>>>>> +    if (!kobj) {
>>>>>> +        drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -
>>>>>> ENOMEM);
>>>>>> +    }
>>>
>>> There will be an empty memory directory in case of igfx. Should the
>>> memory directory be created only if there are attributes available?
> 
> Yes I think it should be taking care of all conditions which physical_memsize_attr sysfs file was created with.
> 
> Thanks,
> Tejas
>>>
>>> Thanks
>>> Riana
>>
>> I can have it added only if IS_DGFX if that works.
Sure.

Move the documentation of the physical_vram_size_bytes to this patch

Thanks
Riana
>>
>> Thanks,
>>
>> Suja
>>
>>>>> { } is not required here.
>>>>>
>>>>> Tejas
>>>>
>>>> Will fix all of the above.
>>>>
>>>> Thanks,
>>>>
>>>> Suja
>>>>
>>>>>> +
>>>>>> +    if (kobj && IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>>>>>> +        sysfs_create_file(kobj, physical_memsize_attr))
>>>>>>            drm_warn(&xe->drm,
>>>>>>                 "Sysfs creation to read addr_range per tile
>>>>>> failed\n");
>>>>>>
>>>>>> -    err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini,
>>>>>> tile);
>>>>>> +    err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini,
>>>>>> +kobj);
>>>>>>        if (err) {
>>>>>>            drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed,
>>>>>> err: %d\n",
>>>>>>                 __func__, err);
>>>>>> --
>>>>>> 2.25.1
