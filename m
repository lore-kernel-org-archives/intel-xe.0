Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE74EC47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 06:37:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6026910ECCF;
	Fri, 22 Mar 2024 06:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="em/ge0ng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD69610ECCF
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 06:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711089419; x=1742625419;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kaTfcrtHZgGGqPro+1+/ffOB+o9mEkhlc7HzCd3boFg=;
 b=em/ge0ngicYEabBkBvEPO0LbmtJuigMhOGoB7LAauUzOA5WZOr0pKk2K
 KLBW9ECJCIIodFpOf9oNkK3HfApx4UX5e1CiHyQS2gWICGYapC0F+3RgF
 OCGtyZ2K7va5BIvhLYugM90bF316bXivjnCOhbtBRtP5za8WXaWB4kA/8
 YtUidM6rk9Wpdcr0PEIji7ibkZnZbouQLpb6B2KOlKi7vOpIv7v3Fjn0G
 0evxPYjzmxkszSz5a0nCiUSF0V8uFPhAflgc7IETWBywGVgek2mSyfnP+
 Fv9GJPreipkdRAmjti+7ngb0arq8+gOkpWITzPGbyMz4AiRtcZOUFd2UW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16671177"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="16671177"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 23:36:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="15195398"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 23:36:58 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 23:36:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 23:36:57 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 23:36:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzOlXmnc7ja+MGZTBO8UM541csvs7DR/94xgkoRUaf8o6vtuQ6TH8Olod1vcBwbHiNZGWIE+m9FPcTDhKAJZ2n4VtFKOF3gpHFOV0ZOnSJffgPElkA9fG4I7nTDOm6hXzrge54Poveaxb7fsjaLor0Em04t+TCYr/dBELjX3ULECV3+u25JR2qIB2aVZBX2Mz/nENB1Ahm3rfNeQ1QeEphOWymlaxAJ22xBCXliec0j8e33QiDZ5mg+AN9zN0Swnd5/j7bDN0+uI1riJVLNG3Wqt8fYylqijfHkFUybR/JpYQ4BWsT6YRDD64zjt6fVQBkbcRE1ZTw688hyclR0Wxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ns/5llYknEgWtrCkhc4tCMNCHQO3wniFH7BM6amHBec=;
 b=aSAwhVNK9CJR9Ceo9fyFTTp4abYoyKZdIGg6YYmB/rMvFKoAC8LXSVfpxHVAExkfFukFkHZIrcEq5Xx4cI0ezto/A8YcFfq1hQ3+kDVgial7c0WoyykDSJnB9lg+LFF/BdBIi/Emk+byDmTgvJBfkv4StJN7ggG503oazIf6oNdUuQxGwDO7e/M04tw2KCVJWM8x2mZgdUTUW5e1jBB9+ytdUVGNY9V5wsSE/oUndzpzTSnzyV8O5ToOV4L/U2nMQzbTJ/op9WGkV4ZFCu0Cj+dsFnqtP5orqahQHFVThywoXt1sdk3p+xBf6wF9C6H2X2IvzEUO3r59os5gP5gwtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 DM4PR11MB6528.namprd11.prod.outlook.com (2603:10b6:8:8f::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.23; Fri, 22 Mar 2024 06:36:56 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::79b7:da48:ff3b:4c78]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::79b7:da48:ff3b:4c78%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 06:36:56 +0000
Message-ID: <c0742032-c7a1-40ac-91e2-7ba62344b7a6@intel.com>
Date: Fri, 22 Mar 2024 12:06:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Fix static analysis tool reported errors
To: Riana Tauro <riana.tauro@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>
References: <20240321104624.2205317-1-karthik.poosa@intel.com>
 <20240321104624.2205317-2-karthik.poosa@intel.com>
 <CY5PR11MB6211A336A3E832319D7C98B595312@CY5PR11MB6211.namprd11.prod.outlook.com>
 <eb736899-1d8d-4203-b2a1-378d28d950f5@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <eb736899-1d8d-4203-b2a1-378d28d950f5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0182.apcprd06.prod.outlook.com (2603:1096:4:1::14)
 To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|DM4PR11MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b0fda4-e716-4ae8-c3d3-08dc4a3a77df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IqEs8DZbDmF7IK/8g/aq8p5acqtoeYbX9scuVXI/IBl71FK0RLQXK8kATwuAE6m9lHH/ga36xKBUxdur6I04MHzQJQKpabmEsZiiiB7+QgBpC50/2pvSARX7QqZrtduN1F6IbPI+A6Kj7afPSuPzVDHq3DndgqKw7+tmyC7W9h8d3VT9KFp2SGG/xY6vbZ7GMH6VbQg8WR+4LxgztAwuCfmJTY4BHQV3c4z1uFaOxcdhGvoZAziOsvteWjHpdG3U+N9MEfrN93O+KCpZ0Ra4lIq/jrKMgWkYdvcQM3/lg+NKRc58kyoVaMxPgjQq+9pq5V3HLBg9c6zHFNpc2k1ZphRYI4jS+8b//b59IUG0RXJYdNsCzyWhJJoTwt0rYFY+apxexuTnovH+1WyrbDn9ch9vkjyI8dtHFYMLDsyJ7fk+UHlHhsbKcSrJ+9h6u5d2T66KuAnpIZU12nhlKSkvlOZaAAV5E1QZb7OjWuv/aXYQzidZV/ofKUwtkzkk+9+/pRjXCfTWKvtzlUc3JlHEpT9rm1dThe0UuuCCz1tZ4uEVio/gfBXMbqDr8OtNCunDcfSMcATfuglbxzv8vNwe0ZzVQP8UvOCRdZDpoLOmvjle5WSBoRAD2H/c0XmC1cOYd6at7iP6sFn80lI26gBnFJUkClx/9buu8zXdi3jujrM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2U0eUNzcWg2QUxZcDZaWnNyeUk1dUFiTTN6OS94T2o0dExSb3NZQ0p6RVBB?=
 =?utf-8?B?NzNQUnQ5RmtVOHd3bWVkTkpPSzgxM3p5MDdpT2pBZThSdzNhMVgwMWRPaXBC?=
 =?utf-8?B?Njl2Q3lCbXlwVWhlWkoyV1NPK0t0K1VKajVpSlc1bmp6QTFLbGo0aDJMRTE3?=
 =?utf-8?B?N3gvWFcxVFo0UklxOXJ6bTVZMy9HM2RhckRFMjEvY3NuYkJaLzErMTl6ZnFi?=
 =?utf-8?B?QUI1OTF1NHgycE0vNGRFZXJjMkN6VlBZRU9FWW12dlFQdmYyYWNMNEVYa0JC?=
 =?utf-8?B?NE9Qa2FTVEw3d29ZWUcyUUcxQ3YzMGtCSmQxTEt0RXoxYjNiUU1lWW1NNUdp?=
 =?utf-8?B?NXpaRDV1dnBSWU1SL0VZY3NFTHlrT1RYeGFKUlNOYkZzS0lrK0NJRDhIOXJS?=
 =?utf-8?B?MXR2aHhVNkU2S1ZUb0lpMUpmakpjbXZZck1BeDFaWm9tLzdpeHBkTnRuUHQx?=
 =?utf-8?B?N3RGNURadnV3SjVtVFpWWit5YWFMREs5b0JSeFVlODVzWkF3WCtNOERzN3Q3?=
 =?utf-8?B?UjAvRzlkL2gyazBoMWZMekNlSnVHcE4rRjdWSTBCb0FZR3kzQmZybTNuVmpl?=
 =?utf-8?B?VmpnbnBFcjlaL3h3NGtGZmEwUEdCMTdnaGp5YmdqbkdTckFrWXRYNHhrNk16?=
 =?utf-8?B?SzhYdHJxWFBCNG9rK0l1YnhwYXk0eWxkaDFBbWdzSjh4MDZ1M2Zia2ZURmFk?=
 =?utf-8?B?VzJzODE1RHlTbWlHR0JvaW9UL29BczlrdUIwQVJVUlY3UmZlbTFLWmNLYXBP?=
 =?utf-8?B?bFBRcFVFbi9Ca01tQ1oybHlZQXdnb2tMSXZBL0lwK2ZVSDA2VnJNVHljSWdB?=
 =?utf-8?B?cU5PdGVacS9MeGN0a09RV0RXRmp1MERudGhpQzBFVk5FTnc3dkNkZFkxb3lh?=
 =?utf-8?B?R1BGbTgvQU02N01GZERYWDFTVVErM3krNVdGajFRU2FHQXJYQXFVUjB5N0Z5?=
 =?utf-8?B?RFR2UzV1dGlrMzF4K2pZemNTZ2pLbExpY1Fpa0M0ZlFrK3NUSDRxMkNaWVhM?=
 =?utf-8?B?YUpLSm9RcGRGZ1E0UVQ3bTRWNlFrY3NkeHlYQ1lrYitsenUybEFRSE1Jd3h4?=
 =?utf-8?B?RXU3YTNmdFYvRUF1a293cFBmL0hlUlRHVXZEVFdiSys4bFVTL3d0SWR2T2R1?=
 =?utf-8?B?WUVIRXNpVm5Jd2F6eHcrY3o0L252dUJ0YnNQVXpxREQ3UElNeEdJT3JYVUJE?=
 =?utf-8?B?K1hMZ2pFdXFaNGg0Y2FNa2Nma3ZjOW9sVnFqbmo4TU5ibmR3NHhnN1hZSWZt?=
 =?utf-8?B?ZDVMNWxZblc0ZE8rQnZpTWtDVGU3Nnl6RmVWYUVLRTFvT0lPTlh6Q2JrVWxC?=
 =?utf-8?B?Vk5qWG9ra2ZnVFlxYjdHNFhVL3JUR3N5UUpyNXgxTmdZYjg2dHNqNDVock5C?=
 =?utf-8?B?RlRlK2ExTTJUZEVidFJVM1F3VG1YTmtKL3JrSFNhRWlRT09vL3BUcE1FOERz?=
 =?utf-8?B?QmhCMlFUUzFWMXJFbVdDWGpoOVJJTkRjcDU4WUdERTROMzkrSW4wandOQncr?=
 =?utf-8?B?NzZNNXNIaDE0dmorWjgxVXNnVlNHdSs5aE9DZGNNR0RPa3JoVFh6QXVRQTZK?=
 =?utf-8?B?TlZZUFZReFo4R2dvbkt5YzcxVml2MGkrQXdwMDBzMnYyNmNpSjRnTktsY2tS?=
 =?utf-8?B?ZHJWdGFpNkgxZy9nVHVLdHZpSW5rUjJtSHFlUVQ5alhSY2tCbis3UVdxMHBy?=
 =?utf-8?B?WkZ2eHdvZ0w1Nld3cmxsRnBXRUhlb0lBUWlhN0VOK2tyZERFQ2dwUEwxSWFj?=
 =?utf-8?B?ejJJQ1FCTW43UngxTjlPbThjeGJwbTdyR0lOUGhWUWpmVmUvVXZrZ3BmN2xo?=
 =?utf-8?B?c05Ick5xVXVzdko4R1dUQjZjeldBbm5CeDM3U3FpWmVzV3h2VmRFWC93Rkxk?=
 =?utf-8?B?MEttbUF2bEhKNlUrUkxRZGVpOEpPeXdZdllxRnQzUlFRR2hNVlZHY2MvY2d5?=
 =?utf-8?B?OU4xcytsTmZGSW1EN3I5UkxiUU9XL1h2UXkwazNpaGhMU0YxRXJCTmNlVkJH?=
 =?utf-8?B?MEQzMmlwRmVpaGhhN2trTy9mandsdkU0M0NMUEVEMUpIeXhnZFJneG9XYkxt?=
 =?utf-8?B?TWY3cEwzVVkraXdUc0VNbjBKTkxZYjdpT21mYm9JSklWa29wSHZhdmhBVHJJ?=
 =?utf-8?B?amQxbXo4d1o3RmltR0dnclh6bFhTc1ZTQnFRbERGMVZIZ0ZVRHBBc3Q5K2g0?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b0fda4-e716-4ae8-c3d3-08dc4a3a77df
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 06:36:56.2499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IBXROZJhyxMpiM3Ri1m1OFF1XjWJkpZxVKLWl0k6LntABQ+xUWElRQ2baLDymO7nyzP0xmARfReaQLPvhWdy5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6528
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

Agree, fixing in next patch.

On 22-03-2024 11:50, Riana Tauro wrote:
> Hi Karthik
>
> On 3/22/2024 11:34 AM, Gupta, Anshuman wrote:
>>
>>
>>> -----Original Message-----
>>> From: Poosa, Karthik <karthik.poosa@intel.com>
>>> Sent: Thursday, March 21, 2024 4:16 PM
>>> To: intel-xe@lists.freedesktop.org
>>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
>>> <badal.nilawar@intel.com>; Poosa, Karthik <karthik.poosa@intel.com>
>>> Subject: [PATCH 1/2] drm/xe: Fix static analysis tool reported errors
>>>
>>> Add a NULL pointer check.
>>>
>>> Fixes: 09d88e3beb64 ("drm/xe/pm: Init pcode and restore vram on 
>>> power lost")
>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_pm.c | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c 
>>> index
>>> cc650a92c2fc..5cb5aef16823 100644
>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>> @@ -383,6 +383,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>        * really lost power. Detecting primary Gt power is sufficient.
>>>        */
>>>       gt = xe_device_get_gt(xe, 0);
>>> +    if (!gt) {
>>> +        drm_err(&xe->drm, "xe_gt pointer NULL in xe_device\n");
> You can just print "gt is NULL"
>>> +        return -ENXIO;
> You need to set err and goto out and release the previous resources
>
> Thanks,
> Riana
>>> +    }
>>> +
>>>       xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
>>>
>>>       if (xe->d3cold.allowed && xe->d3cold.power_lost) {
>>> -- 
>>> 2.25.1
>>
