Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA56CD11C2
	for <intel-xe@archiver.kernel.org>; Sat,  6 Apr 2024 02:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD4510EDBC;
	Sat,  6 Apr 2024 02:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/qcE53u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1078710EDBA
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Apr 2024 02:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712370496; x=1743906496;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KBIiywu1fOGUg2s3/JTcgxKZQbGzX1kfpgK+oVqnfII=;
 b=G/qcE53uEEdMrblC9iyAglyu1+wC21L6Y8OHx5u7fXXfow8UPV5QgOW0
 CJPBy/W1sAXLi8fDPQziFjF7EXYaIBbVbL5rkZbGjcgOc8262I3Y7XS2H
 UHCv7ZEXxX3m048k//+0vJvsnjHjIX+kGn1O8oTwlsoemtLQnig8OPdhN
 4r/0IjgEHvER6hDMI1LQEsiKN9C3hHLNQ81cyiXAsuyyUGjw/SXRbktvo
 MQ69QW5LmhWZkGxMC7FxEVXPkqBapmhBbAlWQ49D4+uULB5VSSWfRsr+g
 26L9mn4KUSuyuj0m0vPu0Hqp/v8pvDR9T+LszUkfqDvhGGDYo/41iwYtZ A==;
X-CSE-ConnectionGUID: I2gehPX7QPOaUEAVk6rRXg==
X-CSE-MsgGUID: ZGBkCSRHRQmM+/ObZbIBzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7573756"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7573756"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 19:28:15 -0700
X-CSE-ConnectionGUID: VkTEZGvsQ8m/2yeE2a9etQ==
X-CSE-MsgGUID: Mkqh6sdZRKiPNUok4FzvhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="50316969"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 19:28:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 19:28:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 19:28:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 19:28:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqmPsXaF2hSHwDiD9EZIDybnuQI93ljQsjVfWRCvCbxy05cs9oZftIjl6veawJ9NUcf5tRpM9LMPHDlB3zFla8aqJCg43Mq+8pP4w1OZ6ozlGuolwF8sdLNZwn9e6ucM8YjlwDsdyv7kdtt3dOxdqyyzaJPWTM9tvJc/ZuLVk7VPrxbo9T3erjYI0VzKqt2ngw6hfgztE84SmzqTtioNrj4Jjkol4pJG08GA9uVkvAojIVQfiH7AD10fek0LnTksVivDwJkHpaX63xWjhzjh9r3+iXz8wT7dgCexhIQkEiuzxP1R4VJy6DuSV5MvhagDGgC993APpoLIv2XBtbdZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Tn5Hb2VzNC9Zv5qBns7CQbjKGPuoO2edkyWBGslEKU=;
 b=VtCOXkrWBf3vbk9eyjswlcZPVDOq1gToqIFLgRaOCS541I0+p+58zqBFP07ApLvFcu2SjQhdWiwh9F6N0XPGA+sfCAceYFanxmGpzOIQw0RMjegaGbZlnfcGnEqXbONlxtJWnJwFnl84QYfIIkltxWDfK0oILNutAWJrFBSMxT/nRu7PmRH2ju6Xv9blbydr5wLbU331TtVVOr+bFnABWY5rR+rytsuV4o7S519J+E684eYL/MDgNnYBzgZ7bre9Pun/dWZNnd9A8ax/a+0+vOR4LOWpX21tBRhTj+PKN7OZEJbF+K34bOCkijvOSDabbHvZe8USBqbdHEL2EBKBTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by SN7PR11MB8263.namprd11.prod.outlook.com (2603:10b6:806:26d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Sat, 6 Apr
 2024 02:28:10 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::a2d7:1d52:5a1c:88d]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::a2d7:1d52:5a1c:88d%4]) with mapi id 15.20.7409.031; Sat, 6 Apr 2024
 02:28:10 +0000
Message-ID: <05fefe56-073b-413b-b8fb-86a8cc53ee8b@intel.com>
Date: Fri, 5 Apr 2024 19:28:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] drm/xe/xe2hpg: Limit chunk size to 4MiB for vram
To: Matt Roper <matthew.d.roper@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
 <20240402124724.1238122-9-balasubramani.vivekanandan@intel.com>
 <20240404000638.GU6571@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <20240404000638.GU6571@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:303:16d::9) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|SN7PR11MB8263:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lLt9Ot2hzdTeMDJ1V2stsbZhFHWJsb4Thr0JTMYJQMkFQkT/jrsywPnpS1fKXDMajckliL96Ol/2HJyzZIzJmpze3gXl43VywOVcjM1/ul2RpR4dw9anbFXoavljUk8e/yQvrmoO6QRdz/wAJVY7Xu6/M1kjwAqpvqPM7Si1k+mqF7/PTyBsRzWF8nu7Xe8XJACdjcsYVqvQGjSNYB3nHL/8QTQW+Dijr7ejqyUsAzMbNhOMiKN7KgZET6S2kptKHhZJWmTgsfYH6Gylo2iCff1qM18LtITfiCOqmH3wu02sKKIVWDerFE0rvDChYunTJNW18BVmPotUqPIqvHFNCAtovVOrcdIg37V4GXFFJwnCIXlX/8HKI3oOmNakfrjKGPvoPqARHdjY/1z3VtUO7EcBKT6wHfmaEdcpwc4r8FHb0xRU8O8+BgwdhZ04EDYSRfBncorpApCumjX2wwarWtZgnpCGjxtSzplaJbzABHG4v50Mj02ZEl0q1c5y0z/KifeIW0YcrlRUqQnhslaP+2dN2aoQ/rSE/LIVZOLF0+7PPd6N/ddQAdSeMzVaHmzbWlGsrjfwAVl5RYoKtkTn5wEKmcobcmo9YfItMDeBO9uGB+H7BE/FIYTB6KetxX+dKOvD3o8gFMYh0PEkkyF66LNLiH0ayw0d+7SaVkupHQ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFkzM3BiUXZZdmNKVkl6K3d3cjBDYXFETU1xOWNBeVZFVm9tWWZ0bGI1dGxV?=
 =?utf-8?B?RXVyYm1CLytoNFdiS2RhL1JlaC9YamJIcUZSbFJWUXBXczl5Q2hzakFoejBl?=
 =?utf-8?B?WWYrWEgzNlhTQmN5eERnZGdLb1RQamIrd1ltNzVLWXBIdkhrdHMyeUdtVGVD?=
 =?utf-8?B?aSsvV2dvSFh4ZGl1cmppaGl3R3lNenRZb0YvT3ZKTGZ0OFJDQ0V1MEhqd2VP?=
 =?utf-8?B?ZHJETENHU2ZHQk9NZnVvUE1jdUgvRHY3R3hBSWxxU1BFM2MvUlZEcGd0QldZ?=
 =?utf-8?B?SU4rQzVpR3Bxc2NRZ2hoZ0dXQlVHM1RpU2I5TDFMSU9jRlcrUWU0VE5ydUpk?=
 =?utf-8?B?U0g1YWQzSDgxZXoyMkx4RDRmYjdDZGpGZ3BYbVFUWm1EcS8rSHB2aWtuWTZO?=
 =?utf-8?B?RXVsdUppdzV2QjF3TGRGRU43V09ERnBuRHdwZEVoaGZSa1hCYXR4Q29SK0VH?=
 =?utf-8?B?QjB6QUVsbmV1TzFaeTY1SE5BZ1RXV1FrazJldjc2eXdoSERMaVlQZHB2dktZ?=
 =?utf-8?B?NFhaMjNsOXoyaVJQTlVyMFlhdjlCaXhsbjZhVmxpUVZwQWN5ZEVJanc0R280?=
 =?utf-8?B?OUZ2K2g4ZENyelVabEdNZ2VBTm8ybnJTNHk3T2RNVC9XcjN0c1JDTnVBaHVB?=
 =?utf-8?B?Ymx3SzErS25DNlFBZm1Fd3YvSGVhd2Q3YjhqckZqWVNMS21saXNUeHNXTXVw?=
 =?utf-8?B?OHlIMmhsS3dXVWR6L3B5aWlLdkFxQUxoWmVMVmNwMmZLWVBaS3JTTEM0amhD?=
 =?utf-8?B?ZGZGZkJaS3c3UnBMMStTM2hub0lGaEhKN2daRXNzT3RzNHlFVlFnQWdyY2RN?=
 =?utf-8?B?NWN2RzhXVktkdytUV25KMGdnQjRvbDAxaFhMQ052VHVtNlQxZjgzQ1FrcWE5?=
 =?utf-8?B?aDFMejVEMkVnNUh0UUJzQ2RNVmRKVkNkeDZrWnd3SExsSlh2NVFBK1FQWmxu?=
 =?utf-8?B?S2U3bXRmcGcrT3JWNFNKdTN3VFVJV1JuSVlLR2xScGZUaGl3YkE3bHRiNlpp?=
 =?utf-8?B?Rno1dytUdU9Uc0VYMVJpd3kzZlB1MWFxZTkvUnpndzlaL2UyMGtHUTVQVUdT?=
 =?utf-8?B?VVNwak95b3NXTmRWYkMyODIzWEdNOEZVY0FQU3JubFNUYWU4TnBqM0VJeGNT?=
 =?utf-8?B?MlpQSkh5SjBnUGt1eWh2YmtsUlc3NnpLdFZOTjNMclRzYzdqY3EyaDRNV0NE?=
 =?utf-8?B?U3BWQWV4TVRYeGx0dzZFaEZqRXZINGdGR0kzaWsxblFWWEhaRjNjNy9JWTdH?=
 =?utf-8?B?b1cwS2NDdmNCd0JQQlNmdzJYSDd5Q1NWRmdnTFAvSnJoNlNteVMweTkwL1ZG?=
 =?utf-8?B?dVd6b0RYc3BuSndsU0NjYWwyb0lkd2E1SFZpYUNzMCs5OGd4bGo4UGs1cjUv?=
 =?utf-8?B?TzlVVmZFb1lRZVoyand5b1Irc29MbnEveTBMRW9URzRkVDhrVFRVRGdYMkZv?=
 =?utf-8?B?aTFodTU3WVJhQ0dhR3hvRnMzUFczSFM3VjhrVG8vOFR1VjJlY1k3WVRqM3NY?=
 =?utf-8?B?eUtScXFsVlFFNE5DaTZndFphRjIwWlFrcXowbTVzUCtpTnFxcVBzY0tYbVV2?=
 =?utf-8?B?bnZGRWZoOHNlbHdwR25KZHRQQVlWYlN3Q05xa0VXclI0ckZGaW9UenZWVWhj?=
 =?utf-8?B?aDFtMXpjbmpZQzhkZi9EWm5hMGtpcGJSYkdWaHFhQ2VKU0VsMWFETmlxWkhX?=
 =?utf-8?B?eDdqWWJxekE5QUg4aVQzOW83bVhHcUxwTldyd2FGUkRiWWFiNWpQenVJM1lm?=
 =?utf-8?B?SE9XTjMrMmx6dTAvd3R6QldrYS8rb25OdnozcklqWjdYSjZxUXFKMHBoSG1O?=
 =?utf-8?B?NjVUa2pYZVl2R1JZZm54Y2ZMSlBUVUloRjFWNFNvRFJvVGdFb1Jhd1ZkSEJ2?=
 =?utf-8?B?UkZjN091Y2p6ekhqdmNqVDg5VWRVNGdtejFwWEUzQ3RDN01Xc3lmMG1yOVE5?=
 =?utf-8?B?enhwMnhDTk9lNGRhQnlFWjNWOGoyVm81bUZsRTVSUmZOdjN0a200b2poSit5?=
 =?utf-8?B?bzJiZ3hlbXF3bVFDMW1PNmYwei8vV0tkUzF5ZkJNK2txS1d3M0NNZ25KOWFL?=
 =?utf-8?B?cndNeFVsZmJQMkhtUmZCcmlQQmIyR1MzSWNSUURXL0d6K2ozQXNVY2c2ZHJx?=
 =?utf-8?B?bGwvUXhBRUg4QUIwQVZCYXo0MVE5ZjlYRFFzSkZWVGIwWlBWSTVtV2xkbEl4?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 592a0079-6687-4b95-5de3-08dc55e133df
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2024 02:28:10.6862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMqmp93S7CJ76NWlyaTtn0L/IRpBYBkQv/XOyf3e3n6NHylWv9yt43wgUoAOYDZsOsTTvTyAcKzEAu7P0Wr8d3EvPqB+XTGmS8LBROXf5Kc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8263
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

This patch was originally sent due to the flat ccs copy  i.e. 
XY_CTRL_SURF_COPY_BLT instruction limitations,
however after working on the implementation of BMG compression,
I have realised that we don't need this patch anymore.
The reason being that we don't need to handle the copying of ccs 
metadata during migration.
For eviction (VRAM -> SMEM) we use compressed -> uncompressed mapping.
But for SMEM -> VRAM we need uncompressed -> uncompressed mapping since 
we don't know
which pages were originally compressed. So, we don't need to handle the 
flat ccs copy here.
We can remove this patch from next series.

--Akshata

On 4/3/2024 5:06 PM, Matt Roper wrote:
> On Tue, Apr 02, 2024 at 06:17:21PM +0530, Balasubramani Vivekanandan wrote:
>> From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>>
>> Currently, The maximum chunk size for vram copy is 8 MiB, which means
>> flat ccs copy would be able handle 8 MiB/(page_sizes).  Since page size
>> for vram is 4k the value will be 2048 pages which won't fit in 10
>> bitspace.
>>
>> Therefore we need to limit chunk size to 4MiB the way it is for LNL.
> I found this explanation a bit hard to follow, you might want to clarify
> that it's the XY_CTRL_SURF_COPY_BLT instruction specifically that drives
> this limit.  I.e., the change on Xe2 is that the size provided to that
> instruction now represents one less than the number of 4K pages of the
> main surface for which CCS data needs to be copied.  Since that field is
> 10-bits, we can only copy CCS data that corresponds to 1024 * 4k.
>
> Although now I'm wondering when we actually wind up needing to copy CCS
> data directly on Xe2?  With compression controlled by PAT bits in the
> PTE, doesn't the writing of the FlatCCS metadata happen automatically on
> all main surface copies (both for compressed and non-compressed
> surfaces)?
>
>
> Matt
>
>> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index ee1bb938c493..07a09649787d 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -407,7 +407,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>>   
>>   static u64 max_mem_transfer_per_pass(struct xe_device *xe)
>>   {
>> -	if (!IS_DGFX(xe) && xe_device_has_flat_ccs(xe))
>> +	if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe))
>>   		return MAX_CCS_LIMITED_TRANSFER;
>>   
>>   	return MAX_PREEMPTDISABLE_TRANSFER;
>> -- 
>> 2.25.1
>>
