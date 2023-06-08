Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17736C7EE25
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 06:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96A810E58A;
	Thu,  8 Jun 2023 06:09:49 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937FB10E58A
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 06:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686204588; x=1717740588;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZclGoGx8aKLwMfZFTkfK70XEJezua6UR3tFm3L1rSF8=;
 b=A9cVlNy0GWUitgmxQNhgHmDNe/lBeZSPXLy3W/wiAqtJ6CM/CFZt6NVD
 6HuS7jvCRP3+K4IwX+/DSAHoE8ctGqr95VtfFT2wxZeRvX6QisH62ga3r
 DZO8Jbzu91xcxYd/6v5GjiM1z8fXG2KQIAFK+fRuGMJljKIn9Ca9Rd6yn
 QC2cEPrpppIab2+kIaVV/WTVOowrUZB5AJ6GGNQooNcseVbfsenGiNDyC
 ukNl/bSax1RuIcTGgwh3Ua86iqjIcqKZjnsmE5C4uBChhanxhQ/8uN0po
 cbMkeasKaswAZv4exHChB4/JIReojHcoieTEItoJ8D9LkOp5chShOT5sQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="346831094"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="346831094"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 23:09:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="660250171"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="660250171"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 07 Jun 2023 23:09:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 23:09:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 23:09:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 23:09:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONOwxKUyq9cyeqbIk21kH9fDyCwGWEhhMNcJvK2WKaDjkB9fdS7rgUbho7qofsumzdVQ8uzmP1X7bsp3+PM7Fp+31oxB+gem+6QDhRDrRoCd2t2pz7GCqlCjvfCW7ghAafXRxA5qVae2dsLnszAPV6Omzqg9M22Z5SV99RWO+d2PcCi59Lcx2m9zrcI400SzmI7nDp3QqyK1BUXA1iUNksDT8X3SJ4AohcMdcDyE0qj6tgAaNFUcgq39dI47DhyeF+SmYnFaXZsN6MhrfBISYHhyJ80U8q2374ipHagb5cxMWPSK4Dhakf9xSancfWcEZHOk0UGwxczL2V5QI96tyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQcC0QDfZBKA3rl0mxGPaojDHDN5hM1ivf+5DD+ag00=;
 b=PINOs54T/MARxlQHWQv0pCB7ztT5ofYcQ7ovGErUYm5/d+RpuF0FjyWQZRRtNS/8zwesnSYaldxNaHKVYDQtJ/e5fgrBVHkf9stFAmKhx3hYpvn3LL+h4D8fN5CJQhfPFsO+2XgExukU8GN5R5euV9YD5znrhdMWrsXD85U9/JdHoRbTu35gSQnYBNR1UV08GPJpoZtrv++ZfDM85MliNmYKOsIJQsiOGw/h5fCYXpduHBpYaUS/M5LE6ZRqmxaWXtjP+IP7jFDiUIEU+9NANDgkY1dFoWWtgALiZSkMDmFIplx9BCsXUKpNz2SWp+pVsdRMxQBFHHofghpAFWZffg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by DM6PR11MB4547.namprd11.prod.outlook.com (2603:10b6:5:2a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 06:09:45 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff%4]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 06:09:45 +0000
Message-ID: <0b879000-d32f-8b07-10fa-6e54d4572378@intel.com>
Date: Thu, 8 Jun 2023 11:39:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Content-Language: en-US
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230607101103.2127088-1-tejas.upadhyay@intel.com>
 <20230607101103.2127088-4-tejas.upadhyay@intel.com>
 <94ca03ac-bd67-dbc1-e827-b6f74776652e@intel.com>
 <SJ1PR11MB62042F98B570A65887CE88458153A@SJ1PR11MB6204.namprd11.prod.outlook.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <SJ1PR11MB62042F98B570A65887CE88458153A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::18) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|DM6PR11MB4547:EE_
X-MS-Office365-Filtering-Correlation-Id: a3d290e8-ac0d-4352-a4f0-08db67e6f44a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nzDQlm0xWP+feQUjhRV8Wzt3hiRKrpdnYMaMuYgB5Y2glC3ayyaKlWmiz+kudtRl2ZQeCVmfqgTP0Qx3cXnvHRtbSa95S52oNN1cl3NmEgkqHepB2sbZHShxPmIFchBCFOFcQD5QJkjufCP9ggjHmyq1NgDLvYaW/6gd4sKHnEBdb/5S8GsrRYBT+fKhPM4C6QtGfWck7pLiXDCnWintHY1VySYZDl70Q2zoXlgD9KDfYOP5HPnegQl+0/vj5kb6K4tFPXuY2KQQxuqNT7rwEuGBQtVjx86Bb0BSSE5UtM7hrY84FVlRGjKLMHi8DtQdfpeYF9XewOkK1p33X1+uH/gqCWOm5sIv5U98J5qqJiHYR8VlujINbyQ8UYUgkvwwAGZGORCd5CrRDTqXp0cUuCqZ5GRCrDeBV4ybYBIpxRRg9Sp/A83h5jreOhxgbR5Kj9rjAPm1/gmUWcPcUDSq2vb5o1Uhv8Rucfvvx8Kcvgqg8H0cYorDI8REtkZxGWcl1RYcZYBTczlenOf4pbSEPpquBtZXeXPiRUxkhlaMyfm+Vi4U8Rcdo9Q34GSS9VTKqjiSfR4ZqHj9MXrxOxV7wNQvCpm7+prXcVWrYtSOIu8OLRWayxrYNKqS06KkYatfGsYlW+s9ndXLlM9Z3zFmrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199021)(6666004)(5660300002)(186003)(31696002)(86362001)(31686004)(26005)(110136005)(6512007)(2906002)(53546011)(6506007)(316002)(8676002)(8936002)(36756003)(41300700001)(82960400001)(38100700002)(66946007)(66556008)(66476007)(478600001)(2616005)(83380400001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anJBcW9Za1EvMHBZcmo2Rk0wRmZodUg2cVhMYVord1FKZThCZjAxQ1BjSThS?=
 =?utf-8?B?Mzh5eDVYQUJsRExENjZ0alJOM1lYR2hONXh0ZTNCN01hUFRrWUlCWnltR0d4?=
 =?utf-8?B?WGg4VktiSlk4N3F5dTF1aHltRUw3TUJvV1RadGRleFJKVTRJZEp5a28vMFNL?=
 =?utf-8?B?MHFubVBueTFoWXpYcXJxQUVtcXFjNFFYTWdTUndhMGQ3NDIzRmF3cmtrTDM2?=
 =?utf-8?B?d05Ea0RyZHIwZzNNSHBEWWRGb1ZxY3lyRGZkOXB2NlRzMHZjQ2FwS2JWZFdh?=
 =?utf-8?B?M2p3Zm1wZkFjNzBaNXgvUHV3dUxLR3YwbVRHWnJ3QmRsYkMzQ3hPeHdQcGNo?=
 =?utf-8?B?bDZvU0JDZFJ5YUdQME41OVFRYlpkYmxxeDBUK1pTdmljc3JLeGwxdTFLVXhr?=
 =?utf-8?B?TVlRelA0dnkrVjBmd1RuNTF0MkdreTlVbnh0NnNERm5QSzBReU96T0I1Tktw?=
 =?utf-8?B?ZlNYY3pvbFNxdDVzWnR1QjdUcThiZFViRVVTMDg0YnNSKzZlQzdjWTRWNXly?=
 =?utf-8?B?Z3ozZXV0NFUrRlNmYU5zb2ozY3drUGJFNjFRaHlqSjJEVmJaWW12cVBnNnc1?=
 =?utf-8?B?YmRISkNtNE9SUkxJRE1YRUxHSjJFRlg5Rm85Uk1pNXByWEQ3aU1TbWFoNU1H?=
 =?utf-8?B?WVlDRXMxYlRYS0xjN3hNdVpsYWtnZ3BKczlzcXRZQ1hmWE5rMnAwcUZGRHRk?=
 =?utf-8?B?NVhCaFNvT2dGL2dhVjhCYzVpbzkxMU40NHN3cXVJenc4bWFTQmVyWFZWYVpt?=
 =?utf-8?B?aHNLVnRoSjhpWXkzeXhodWpBUGNLRFJ1UTJFaFJ1WStIaEp6L3lZdkRFSmZF?=
 =?utf-8?B?SjdQVHVua0lxRVEzay9ML2M3cDNZWXErbWgvY0pyTXB3bk5NaDFCQ1drNmds?=
 =?utf-8?B?cm1wanlNNFZGbjlEeC81eWFYV3ppbGRnbGV6ZWdZV2h6Qjh4V0hpaHFFQ1E2?=
 =?utf-8?B?K0RLWTJGYjNLRHZ5d1gxcTBwQks2VFpQOEY4ZndQMUpmZm1MS0JLdE95ak1O?=
 =?utf-8?B?OU15UHo0bjdsK2Uzek9KdkczMC96SDVRYWY1VExQMHBDSDYzUnZ0UmZ4UkJl?=
 =?utf-8?B?bEpmNVc0ajN4TFhxMzFxUm13TTJmcWw4WTNLUlJ5MkpTUXlKUGE2NFAyWEpE?=
 =?utf-8?B?UVlYSjdhdUpLYlNWTDkzUXQ3dm41WUlZM005eG9sVzBGM3dScThNYUVySVJ4?=
 =?utf-8?B?TjR0SE5NNlRCb1czMk5iVS9kb0FGNUpucG5yTEZ4cUNsemcrZk1lUlNWdyti?=
 =?utf-8?B?NjF1M1RCMlpSdmFkV3FCYkhpSlYwRXFacjJUYzVlNWxFTytuSHVXM1NoSWZt?=
 =?utf-8?B?U1lNMExWbVZwTnVnS3poOXVzTjRZMlZ6VlVrZDNaNkRnWlVZeU5TbnlzRllW?=
 =?utf-8?B?RU5Ed1VTeGF3eXAyVFdMWEFVTDBaMFcxUzMvZndGdjRMdzhMZGREcGs1bkJt?=
 =?utf-8?B?bVJzSjZ3NXpaWWRTKzJuLzBxdHIwVVkwS0N4R2Uvd2RHMHE0Mms1bVlBdUhR?=
 =?utf-8?B?MnZ0UW5aSHZQNFJzYkE3WnNSZ3hkRVByNi9DeW02NmlPVG1ETy9yMzJnMkta?=
 =?utf-8?B?ZFc2cm5qZEt6Q2RBZUZreVJldXdvWkg2Tnh4Uy9vQnRla3F5aTJiSGpad3pG?=
 =?utf-8?B?UjBLOVdpVDdTdHFhU2hxZjBZL0MxaFJPUEhXQUIrMERHc05NOGFaVDNZSm1y?=
 =?utf-8?B?YkpmN0pCYWkrMmZsemxCcnBZeVZSTjNudU9XN1ZoV3hHSTQ0anJHeEhiZGpF?=
 =?utf-8?B?YlNiVWliU3dTdkh6aERaanM4Y3p5TEIrOFJwZktBUEtUSnQycHZZK2VQVjFS?=
 =?utf-8?B?UWg0VDBxcWFycVA2c1BrdWZ0U2FuczMwOGNzSUcwdWdLV1ZBN0RiUkk3L0U0?=
 =?utf-8?B?RlJXUFhaVG0yWVFCaWpwN1pESjcvM1pPeFpKY1haeFJSMzl6akF4NHhZWVVv?=
 =?utf-8?B?WE15WmdzUWhsa2l4bE4rajJPYTdPTDg1NU94QmV1TVdVMWI3KzJuTG5pdmtL?=
 =?utf-8?B?bzZHWjNDWHhDa3ZCY05ZSTNrMmJTUFdXak15RXlNdUptc00vU0VhczhhWlRm?=
 =?utf-8?B?ZENXbUd6U3dLcjd0WDIwYUNPQjY4OXhtMW9XT0xjVm5ndUI5L1NZMi9ybHJp?=
 =?utf-8?B?UURzUWJwY2xiQk85NEVKTUd5cDlBSCtKNGw5eStHVFdzUVBmaDNmZEpaSWg2?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d290e8-ac0d-4352-a4f0-08db67e6f44a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 06:09:44.5025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jSk0HzSUacCYlBv/XB1YuwxIkVnRVjFWQ1D2lWdirysbWedV20hj80DjVS7018gq1DeXtvHza9tHYnwq9AdZkU78K+MA23sZeORzdqWYa2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4547
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V2 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
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



On 07-06-2023 18:16, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Iddamsetty, Aravind <aravind.iddamsetty@intel.com>
>> Sent: Wednesday, June 7, 2023 5:31 PM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Subject: Re: [Intel-xe] [PATCH V2 3/3] drm/xe: Add sysfs entry to report per
>> tile memory size
>>
>>
>>
>> On 07-06-2023 15:41, Tejas Upadhyay wrote:
>>> Add sysfs entry to read per tile physical memory including stolen
>>> memory.
>>>
>>> V2:
>>>   - Use DEVICE_ATTR_RO - Aravind
>>>   - Dont put kobj on sysfs_file_create fail - Himal
>>>   - Skip addr_range sysfs create for non dgfx - Himal
>>>
>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
>>>  drivers/gpu/drm/xe/xe_mmio.c         |  1 +
>>>  drivers/gpu/drm/xe/xe_tile_sysfs.c   | 29 ++++++++++++++++++++++------
>>>  3 files changed, 30 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>> index db61da4d6212..b8a07826c65f 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -107,6 +107,12 @@ struct xe_tile {
>>>
>>>  	/** @mem: memory management info for tile */
>>>  	struct {
>>> +		/**
>>> +		 * @actual_physical_mem: Track actual LMEM size
>>> +		 * including stolen mem for tile
>>> +		 */
>>> +		resource_size_t actual_physical_mem;
>>> +
>>>  		/**
>>>  		 * @vram: VRAM info for tile.
>>>  		 *
>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c
>>> b/drivers/gpu/drm/xe/xe_mmio.c index f7a7f996b37f..6febd11d7dd9
>> 100644
>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>>> @@ -277,6 +277,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>>>  		if (err)
>>>  			return err;
>>>
>>> +		tile->mem.actual_physical_mem = tile_size;
>>>  		tile->mem.vram.io_start = xe->mem.vram.io_start +
>> tile_offset;
>>>  		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> index 09a4a8342aec..b5768c735cba 100644
>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> @@ -22,6 +22,21 @@ static struct kobj_type xe_tile_sysfs_kobj_type = {
>>>  	.sysfs_ops = &kobj_sysfs_ops,
>>>  };
>>>
>>> +static ssize_t
>>> +addr_range_show(struct device *kdev, struct device_attribute *attr,
>>> +char *buf) {
>>> +	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>>> +
>>> +	return sysfs_emit(buf, "%pa\n", &tile->mem.actual_physical_mem); }
>>> +
>>> +static DEVICE_ATTR_RO(addr_range);
>>> +
>>> +static const struct attribute *addr_range_attrs[] = {
>>> +	&dev_attr_addr_range.attr,
>>> +	NULL
>>> +};
>>> +
>>>  static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
>>>  	struct xe_tile *tile = arg;
>>> @@ -37,10 +52,8 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
>>>  	int err;
>>>
>>>  	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
>>> -	if (!kg) {
>>> -		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -
>> ENOMEM);
>>> +	if (!kg)
>>>  		return -ENOMEM;
>>
>> your first patch introduced it and you are fixing here should it be fixed in the
>> first patch itself and why this change as the return from tile_sysfs_init is not
>> being checked.
> 
> yes i am changing it back.....and return was already there in first patch, its just I was trying to add drm log which is not required because underlying memory API already dumps log. I will change it back in first patch. Also I am changing this API to return void and remove all return values. Aligned?
> 
>>
>>> -	}
>>>
>>>  	kobject_init(&kg->base, &xe_tile_sysfs_kobj_type);
>>>  	kg->tile = tile;
>>> @@ -48,16 +61,20 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
>>>  	err = kobject_add(&kg->base, &dev->kobj, "tile%d", tile->id);
>>>  	if (err) {
>>>  		kobject_put(&kg->base);
>>> -		drm_warn(&xe->drm, "failed to register TILE sysfs directory,
>> err: %d\n", err);
>>> +		drm_err(&xe->drm, "failed to register TILE sysfs directory,
>> err:
>>> +%d\n", err);
>>
>> same here, but warn is more appropriate than err.
> 
> Ok, since we are not checking for errors now, warn is fine.
> 
>>
>>>  		return err;
>>>  	}
>>>
>>>  	tile->sysfs = &kg->base;
>>>
>>> +	if (sysfs_create_files(tile->sysfs, addr_range_attrs) &&
>>> +IS_DGFX(xe))
>>
>> this check is not correct if you want to restrict to DGFX, the check should be
>> preceeding the sysfs_create_files, if ( IS_DGFX(xe) && sysfs_create_files())
> 
> Correct, check goes from left to right for logical AND. And I can user sysfs_create_file.

also this is not applicable for DG1, as it doesn't have
XEHP_TILE_ADDR_RANGE register

Thanks,
Aravind.
> 
> Thanks,
> Tejas
>>
>> also you could use sysfs_create_file as you have just one entry.
>>
>> thanks,
>> Aravind.
>>> +		drm_warn(&xe->drm,
>>> +			 "Sysfs creation to read addr_range per tile failed\n");
>>> +
>>>  	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>>>  	if (err) {
>>> -		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset
>> failed, err: %d\n",
>>> -			 __func__, err);
>>> +		drm_err(&xe->drm, "%s: drmm_add_action_or_reset failed,
>> err: %d\n",
>>> +			__func__, err);
>>>  		return err;
>>>  	}
>>>
