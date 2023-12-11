Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF42C10DC3
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 09:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF8E10E37C;
	Mon, 11 Dec 2023 09:53:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CAE10E37C
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 09:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702288412; x=1733824412;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GDbovoZJHbUXUQOS2wf1mIep8E4LXMQdbPj481hEvl4=;
 b=OpGzaWBPWRgLOP1uaDgrGAxI0ZjyrK3lS+OSMmJ12b6Ve/gN3H4RMb5b
 n2y3iyAYKLw6ODxrY8/UYKoHlzaS4GtmHwVXHByoLGCRCTuVz35FAAPRj
 41aySnm98M82F3FhaXKasg8wq8QneepZ5rCdgD3wFLueGsrjrAGVcOicP
 pXC4u/WnW4vJlngnSDg2i5TTvuURCNF/edHmWZOjybOBtc13VD8QEQBUQ
 qDJJdJzRit3Dgnl55bydU4CthBjTVqmCKJeT/RjXlJaVjSCMfnZLZ43Vk
 ys7XHi2PLyO0Xlkl0GRUQXQ5cH6F4cRzlRgL9stVEKCtgdWiPJwX9k8RS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1738848"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="1738848"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 01:53:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="896379990"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="896379990"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 01:53:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 01:53:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 01:53:31 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 01:53:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ksbr9OnZioiwzOHL8Gx3rXjArlQ8nQ3yufKzHM7sflctNeXMC4kk8XN0/f197tiZoq9sUZn7ay4PWpXvJnayHxKTirX2CvfBeWtHzyTmTtpAbeRKkvgwdMga76i8tmLrAoMGAjCleO7xSj90EPgRcAfpyo05JkAEAepR6AMJTM8v8aDYsJZNuoGFN1/Y6rER+W/+caLlbgo1zn+rP/GtDCfpQVy0O4sraaad71RyarKeyvUDJR4IVpj+8AaNLDOAKVbWaoPPSqoyvLQfkGlKO3z4O9eKJndEf4woFqswNzYpEC9+7YcEe90jLou18Of/JngTdAK7h7C7ZEl7P+ppKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/WpXdeGpSzHeivbQ20qvD6zIyKtCb3du8djcPY5IrY=;
 b=ls2mlHH06x1ceoekZtrYdVzm3cYFImMxaMdI7MKtqQ+jNON5XyT525lEIUcmDQJatZkfT8e/rDtqzOGJh6BljTOJXUDfJq+9NSviS5yWOH9o+W2v6rxxLRjoF59YKkQicEK/ZGeOzlD8CYa6VYgt7qbf/wIfntEDOVnz6gEfJR6l4SkUQwtlAH7EaBZspGYOKhpzt31z9JzK7LBZZVMIYuvxm/qyQgQVuo+SFo6wq8MccAB4JPQ289EGKlYdKH5KkDGpcS1SWH0n1wzXM3zSSSGkPymal2/4kMI34dBF2rTwUnlFqjpaW2ejFfZ7b84qqC2GwBq/MAiuLjlI+iQU2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH0PR11MB5562.namprd11.prod.outlook.com (2603:10b6:610:d5::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 09:53:28 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 09:53:27 +0000
Message-ID: <cb403e6c-cca5-4495-b1d1-57b38fffdaab@intel.com>
Date: Mon, 11 Dec 2023 15:23:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 1/2] drm/xe: Add a new memory directory under tile
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, "Upadhyay,
 Tejas" <tejas.upadhyay@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
 <20231207151739.1241374-2-sujaritha.sundaresan@intel.com>
 <SJ1PR11MB6204399019B23285D88A04B1818AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <692a9b93-dfba-43b9-a838-9e4cd20fa093@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <692a9b93-dfba-43b9-a838-9e4cd20fa093@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH0PR11MB5562:EE_
X-MS-Office365-Filtering-Correlation-Id: 148aaac7-4fbf-454b-4818-08dbfa2f0630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8XfZ8uao0PI/KJCR8oE6SelYqOKVhXik1DZ2YVlfURD0E05I3OVglGTRH7Wt73s+3ueJ/GsFuPNslOR67fYSd0s3dgo1LjY3ikltIRJTr99a+rmTPLwsjvoI6vvzKD6rZa5Y0KpP2Fbm8X8OuBOJxfVHUVf1k95XAJzxTRneDSLhBOuI2ndSVPwh0hPygrDelQcqgVk/qHLpWjjxx6H/8k8dbkTzdDNSRJtt4zb+Nn/iaoOSAdcra9yv0SLGzkvBiHFnkGHC3u0sLAUR0/yJJm6koPAWI/Ylo/Nl+ZLx17kMOTp4ML1u1dXmqFVC4QvaGejhlXrE0tLGKiMUZ2yJx1XgteuoJDX6eZpurjxjJ71vdy8RhtIdirx/BCiI86bVP+eku1PTVK1mKzlcRCo2S0d2dxto1GcWzATMla3nZHhPqPFbba5gzZQ28Xhw2AOsSb5QAHhD2H24wQZ9Ib/mkEG8FPp1Oty7EayBNJ/38xg4ObEhmuSFAUTNS1IzjvKqxrKS9jrso5h5YljaY+ZfAtlPUZqoBsEQ20x3LnOHPxpJxszkmasVg/bTY0BpBwprZ4SteChkkqmhl+a3SDNiO7Xa1pCMdQdS4JOyRVsYuYUVRZodn5r95PXjphZ+mi4yRCAqZOdugQRilwiCMkwOEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(366004)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(2906002)(478600001)(41300700001)(31686004)(82960400001)(66556008)(66476007)(6486002)(66946007)(110136005)(316002)(38100700002)(6666004)(86362001)(31696002)(4326008)(8936002)(8676002)(53546011)(6506007)(6512007)(44832011)(36756003)(5660300002)(107886003)(26005)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzBtM09VQkJQNkNnNlJYQjloRnNCWVVkTzI5akZzblFDVXp3eDhYQUVtZjBz?=
 =?utf-8?B?MVNMNmh2MUdVekpxdEZNYktrQzBXczJxMkJreWwwV3JYSlJVbXorL1VsTU9o?=
 =?utf-8?B?cUYzQ001cUZWd0pOeFhEUlRPSG94cWQ1anVTR0NXMlNNL0FFOHN2RGdKWFVB?=
 =?utf-8?B?MDJFeHMxdnM2M2N0U2ZzMndhQjRFQUFFY1hzYmF3OGxKbXhXRkRybEtaSEdh?=
 =?utf-8?B?MFd0Tk03MjBRSjVOd1Z5WjZ6ZlFxRTdHNjNUNms3NnlzOXIzUzk4citDV3J2?=
 =?utf-8?B?QTkyYXo4akQ0djdqaE1hRGNHY2FCTVl2ZWpxWENOVFJZWFkrYm1SaGx6Wjl3?=
 =?utf-8?B?cXNRR2w0UWFkN2VxQlNYUHZ0MFB6ZXRZb2JnYjV4ZW82T2dvNnVDa0VJN3Az?=
 =?utf-8?B?YjZieS8wWS9XeEJOQW5hREEvbXNVR0ozMG9ocDJkbkthT1ZJbmFXOThueStC?=
 =?utf-8?B?ZGFMWStvRzlWN0s4OCtscU1hNGNQd1QwWCt0aHlNeFFMRDBaLzZFd3lrTU8y?=
 =?utf-8?B?VnpwNlNxWEdDYUhtaUFqbmJRR1ZSZjVKdElKY213WkV1a28rVG45QnE1MDBu?=
 =?utf-8?B?cTQyUjZEOWRSeFQwdDVaWnRJQlMwdktVajlGMVFoSHRaVXNqN0JhOEpGTWhK?=
 =?utf-8?B?Nk1CVWpzOHpwT1UyL0dxM2FjNmZYQ1N0c0JqU1RhS0QxT2t0MkhWbnk5SU0x?=
 =?utf-8?B?SDd1YjN1SXRPbS9nU1pURlVTRlE0S0FBL3VSTXBJTTNxUzEwbzlSQXNMZHpt?=
 =?utf-8?B?YTRILy9uMTBsR1JQVGwyY2RrYmMrWG91M2dLTXNTdVBFUWNnejdLYmxkdUxJ?=
 =?utf-8?B?TjBzT0k0ZVh4Yml6RlNqZDllSFNYcTNPZWRLSnhCaFJJU0ZRNU5BbnRCbjU1?=
 =?utf-8?B?NE9iSnVyOXNrcFpPZGI0ZGNvWUpHNlRxNG9NcWhHWUVyc2ptMVhpbDdRb1Bq?=
 =?utf-8?B?QS9WRm5ZWndaM1c5c1prYXZ1UHY3ZytJMTZ1blJ5OVo3OWs0QnNWb1plZjJo?=
 =?utf-8?B?OTd6SFU4bWVZWUphcEhPQ1Zjdlh5TXdQQ0VmSDllQUdvdXo0US9aWDhxNFph?=
 =?utf-8?B?Tklwa0E5aW45Z2hMY29raVFvVWFGbW43K0dPbStKVmZyS2c4aDd6MEdmcnJC?=
 =?utf-8?B?NzEvTkJFL1JoWmZLSVN5QiswdndwdjNZRWJycG5JMHVwY1RjcWxwZi94Uld0?=
 =?utf-8?B?R0wzalUvOWJQbWJBM3NiSU9XeFhTUzgyaEV3VGdKQ3FPVmRKbSs2cFl4bHIw?=
 =?utf-8?B?MXpFcnhGa0N4aEV5M0F4MFVZWUxnMENaekhnSU5XZ09tdTZpeTFnNDZNM3RZ?=
 =?utf-8?B?bTNKMnZsUXhYYkhPODliTkd4UFRhRWZPdWtWdWkyTGNyT2EvRUhQVS9vTnRX?=
 =?utf-8?B?UHpKWFJ0M3Qvam9sZ2pFdnFObGVnM0dTbHlyb0p6UHlRMVFyWlBMOEt3bVR6?=
 =?utf-8?B?Rmo5VmhydmRaaTFWMXEwNnVQZXhSRjQ4dlB0R09aWXJFUHJGK2JGWmZmM3Ur?=
 =?utf-8?B?R3RsalVSbGRadUllbHl4QVptZFVYOXVGY3pJd0dHZHY5S1JpUnQ3MmEwcEsv?=
 =?utf-8?B?eTNOU1JtNElhVmN6S0NMdUd5Z3M5dVV1STRhUWVlUi9wYUFwQ3VFRDRoMmwx?=
 =?utf-8?B?aGtWWVZjTHJsaDMvRjVYQmdmTlgrR1dCS015U1NPRlRHdDBZNVg4bHVZSGZL?=
 =?utf-8?B?blozMTdZM3dldUovaEM0a2pjUTRBUkdCaWluVWxzNVh2UnhCN2IwM0xBbUhs?=
 =?utf-8?B?bHh1QjFXZWJQLzVYdEhPdHIvbDdTTnhlNmpodURpa3dhUnUwUlFHcDNuUzJP?=
 =?utf-8?B?dkpVZVgxbEg1VkJFTjI4d0hxZUZldVM3WUcwWW44TkNMZzVlbjBGVTJyK2hw?=
 =?utf-8?B?NUNGb2liQWJiZnR4bmh2TW1hQWZoa2Q0VS9YY25YNURITFVISE5xQStUWDk0?=
 =?utf-8?B?eXVKSUNEeG45RjdIc25LY0JZSS8vQTZMSGNBU2JiQWpxWlVpcWMvQ1dvdTFs?=
 =?utf-8?B?OWw5RUtXZzZXaTdpTFVMSUZLWDQwa1owbC94SG5LR0pzSzJGSHpnSGNIUlJp?=
 =?utf-8?B?Y1h6Y3JDN21JZ3U3Wm5tSEF5dGNETGZ4YkF4UkNYRlpkbnFKdnZjRENnaGVV?=
 =?utf-8?Q?+i4sOteaivnFoGYLts+gSblDK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 148aaac7-4fbf-454b-4818-08dbfa2f0630
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 09:53:27.8702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzJ3uhD7sAInvDlK7b42BcxwWSbYFi12RXR5bcnjPIlPDoiiF5xHGShohkx6CQabJx0b3us9riJVe0lNUUS5uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5562
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

On 12/8/2023 1:58 PM, Sundaresan, Sujaritha wrote:
> 
> On 12/8/2023 10:33 AM, Upadhyay, Tejas wrote:
>>
>>> -----Original Message-----
>>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>> Sent: Thursday, December 7, 2023 8:48 PM
>>> To: intel-xe@lists.freedesktop.org
>>> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Tauro, Riana
>>> <riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
>>> Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>> Subject: [v3 1/2] drm/xe: Add a new memory directory under tile
>>>
>>> Add a new memory directory under /device/tile<n> and move
>>> physical_vram_size attribute to the new directory.
>>>
>>> New hierarchy:
>>>
>>> /device/tile<n>/memory/physical_vram_size_bytes
>>>
>>> v2: Fix heading typo (Riana)
>>>      Fix cleanup error on unload/reload cycle
>>>
>>> v3: Fix reload error with kobject_put in place
>>>      of kobject_del (Tejas)
>>>
>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_tile_sysfs.c | 19 ++++++++++++++-----
>>>   1 file changed, 14 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> index 16376607c68f..64be1f3a38a9 100644
>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> @@ -24,7 +24,8 @@ static ssize_t
>>>   physical_vram_size_bytes_show(struct device *kdev, struct 
>>> device_attribute
>>> *attr,
>>>                     char *buf)
>>>   {
>>> -    struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>>> +    struct kobject *kobj = &kdev->kobj;
>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>> As Christmas is approaching, you might want to adjust this in 
>> Christmas tree order.
>>
>>>       return sysfs_emit(buf, "%llu\n", 
>>> tile->mem.vram.actual_physical_size);
>>>   }
>>> @@ -36,8 +37,10 @@ static const struct attribute 
>>> *physical_memsize_attr =
>>>
>>>   static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
>>> -    struct xe_tile *tile = arg;
>>> +    struct kobject *kobj = arg;
>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>> Ditto
>>
>>> +    kobject_put(kobj);
>>>       kobject_put(tile->sysfs);
>>>   }
>>>
>>> @@ -46,6 +49,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>>       struct xe_device *xe = tile_to_xe(tile);
>>>       struct device *dev = xe->drm.dev;
>>>       struct kobj_tile *kt;
>>> +    struct kobject *kobj;
>>>       int err;
>>>
>>>       kt = kzalloc(sizeof(*kt), GFP_KERNEL); @@ -64,12 +68,17 @@ void
>>> xe_tile_sysfs_init(struct xe_tile *tile)
>>>
>>>       tile->sysfs = &kt->base;
>>>
>>> -    if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>>> -        sysfs_create_file(tile->sysfs, physical_memsize_attr))
>>> +    kobj = kobject_create_and_add("memory", tile->sysfs);
>>> +    if (!kobj) {
>>> +        drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -
>>> ENOMEM);
>>> +    }

There will be an empty memory directory in case of igfx. Should the 
memory directory be created only if there are attributes available?

Thanks
Riana
>> { } is not required here.
>>
>> Tejas
> 
> Will fix all of the above.
> 
> Thanks,
> 
> Suja
> 
>>> +
>>> +    if (kobj && IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>>> +        sysfs_create_file(kobj, physical_memsize_attr))
>>>           drm_warn(&xe->drm,
>>>                "Sysfs creation to read addr_range per tile failed\n");
>>>
>>> -    err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>>> +    err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, kobj);
>>>       if (err) {
>>>           drm_warn(&xe->drm, "%s: drmm_add_action_or_reset
>>> failed, err: %d\n",
>>>                __func__, err);
>>> -- 
>>> 2.25.1
