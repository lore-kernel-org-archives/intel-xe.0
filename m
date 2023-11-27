Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3FCC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 03:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F68110E163;
	Mon, 27 Nov 2023 03:04:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF4510E163
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 03:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701054287; x=1732590287;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7JeK9LxSIEQD3IBp40pcY+JDGk03SzvLWHidNbwphcM=;
 b=QoqzD5JN2eVMoOa9hG3jheDVIer2lOcZMoN5hLMfs0S+r9fyufDb50lG
 WDjAkY7JTjMzWcL8djNhhgJZG4B0/Z22yrgve56pJAGLqgWuGPnSS2hDS
 PEoTMWbMd1vmcqbI8D5knek/8CDweglaPe+iiGV72X1PDR62igNuCXvQ9
 XHXfGZXYEbjFk1PXtPoXJlbrUOWNqeouqWLvdsH/Yx+zAEt1xyhaZjkFp
 ehcfKgiQsvBz4w1DZAQ6ospSuEQgfkZKY1GhZ/8G7RLXIhGhn7mL2dNGG
 aewThdwXXTLkFtJPkWpvHPNiApAJamRNdqPKaMS9370lBpiYbOBIYUP2R Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="396532955"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; d="scan'208";a="396532955"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2023 19:04:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="768031405"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; d="scan'208";a="768031405"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2023 19:04:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 19:04:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 19:04:45 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 26 Nov 2023 19:04:45 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 26 Nov 2023 19:04:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DhzGo0qT/sNwZDDnrm0w/zsbKJ+MQ+p33mXTnjv6+JPNx/qZExVnZelII9ZxJgGoVTw2Wx0iLo5zhdiiyP/X7LD08NqLDkyPyAq6AF5CKsU9HbsgXs3vZ1TtH8QUYISd9b0hpEq8XjI6e9JdFSXQXfgNb9UnSUYzJCDBNfMC881Sg+gS/hj93uxJCpHWM4SztW+e/KmRIVyi4cjC28EfU2qoAELxLjHK3mUDGFcMaZrhARzHvkFOLatx4cwMp6P6S+ssDQiVqeaXCTnXQRjvjGH1sqdMbvL68JVP7P3Puiyq+HoKfQs7MMNZQGvQLoH3bO1dMznwQwYgzNFvrDtShg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gs8hXwmshEVHlZhrssMfFvID+aHFq+WaMXizuOjh/Bw=;
 b=BQxvLh0FI9UYV1A6pphf1rae2+Sj3R28eJVK9W5no4Sj3PMYl8pPbnbiO0rQ6DZbvVvKbRSxNTjVFKmD9iIrvvmX8FxNpLjEaz4EN9KwkS6jQqMCQMR4/Xhsmk2gDgEt+d+2gHhal43+QLBZRgJN7zYIZ9P+IfHPYABU3C2IPot1WzaQkGz0a8v86Q+17sigZ+T5DGnTf2tKUaVLRp0LSjn+CWa8vWJSl1CuYRlVCEQzYEVhzVJf45rrOibmDc0N+Kq9skasYxVHGikN9eG8ccuN1y/16I/YfR8slsFv/F8l5mXU+qOiRuadPkAc37pNQb93jeJwG4XL8X1ncCoGXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB7804.namprd11.prod.outlook.com (2603:10b6:8:f3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 03:04:41 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 03:04:41 +0000
Message-ID: <3d98db9e-5a18-4372-afa5-8267cdb1e447@intel.com>
Date: Mon, 27 Nov 2023 08:34:35 +0530
User-Agent: Mozilla Thunderbird
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
 <20231121100906.3587649-2-himal.prasad.ghimiray@intel.com>
 <CAM0jSHN+Tz9KhhsHcKKWebEptZZs-+NMDcb-VTAVZwibmhEdtA@mail.gmail.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <CAM0jSHN+Tz9KhhsHcKKWebEptZZs-+NMDcb-VTAVZwibmhEdtA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::31) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB7804:EE_
X-MS-Office365-Filtering-Correlation-Id: b402ab50-45cf-4540-7bcc-08dbeef59906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iiC0FLqj0s16Mq4W/9Cwpw2aFWdhHAmfRjyytMQT4OGcP1bCNqyUudWHPlAOmHN+87xD3MkFrLdaLg25T18WbQ0a/HXtz4xo8HVCy0Q3roYD24T3dJN3f4GWNRV4bi8XKbbGhYslNRpgzp0L/DAo3G3IUh8OiO4+CtaWSkVPz2jDjvKOI+O+2G8FSVwq9cITdQxpEgRGQpgdZpNCqOgJUXWPkG4wakkgRnXzyuy/ZUyk4QmN4CB0nJudI1VGGri+MBsQY6pe83tMwLa2OvJcbd3qJfAFx5c3VZZulp2D/f1yZRI0NZjx319/oEdA63QxBhSIY6Vvw3s8BmtkYkcV283Dy8AkyIu/3NCMcBjxxusMBRuqoBELPgJ3r6RbkiNQprChdzOSlclrCf2xa8QZKL9Q7YcpdxZXZjPQXbDXZR3D+EewA3H7OYfkWxJBN4bd8WrWy/J9caehdM9A6s+K65Kklv3kTS8yrCsZfn0yGnhtBOyVB39At6LuyZVADDE3tmVQWjB0bYKWjhcKkZSk6VZRq+Cd2dgDyGSur3BaIHKN3Fjc4/1QrTqlNQBX6SbdJI7AjSkj9R3nAlpC3LhDv3Z8j+XLJWcjxigfeZduoQ+LouEoIHHuW4nRUiT7U6BOxYv1mGKq0laBUYNKlX0yWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(38100700002)(31686004)(66574015)(82960400001)(4326008)(8936002)(8676002)(6512007)(6506007)(53546011)(6666004)(316002)(66946007)(66556008)(6916009)(66476007)(86362001)(31696002)(5660300002)(6486002)(478600001)(2906002)(41300700001)(36756003)(26005)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXYrM3FKQ2hvanByQlY1aXEyeUx6MmhxV1pMNTlYdzNYcStjVlU5TXMycWhR?=
 =?utf-8?B?TEZMZ2RkU2l3TGxXcG5JeXlKNzhsVHRiWWd0dWxDb2RndU9MNjFWYnNyUEFI?=
 =?utf-8?B?T0h2UWV2TnFsd0ZEQVViK1F0V085TE9RbGZVQjAzMjdROUloTjNDVXNGaDM1?=
 =?utf-8?B?L0ltSG5MdXh5ZU9JMFJvdWE1cXl2TkxvOGRDS3JDSmZJUURFRERqbVZVYm5Z?=
 =?utf-8?B?RkJNUWJXbFZKY1lJVEJQWUxCRDZra0UvNENOdytERnVnc3lXT29DZkpGd0Zy?=
 =?utf-8?B?T25MemxVblBQN1ZqZG1TelpjUEkzdEZML2xQaUo5UFdiRnhCYzFyNmRTdHZi?=
 =?utf-8?B?NFFhbjloK1ljSlhXaTdoSUoyR3draFQ0TjhiSUdRd1pGd0g1c3VVNmFQUnlW?=
 =?utf-8?B?UkFneENlT0QrQWJzR1d3aXlzaU1lRTV3RXorM0QyY3IzRUlvc2dHMUdJM2p2?=
 =?utf-8?B?Q0NSWjlWTUw3dCtjazNiYVgwZE1sSU9zUThNWE80bFFxaXZ4WS9KMVd3ZmN3?=
 =?utf-8?B?OUVYWUNaeklodVB6bnBNaE11N1VxTVg4UkdhdGtRcWhGaVhzb0h2by9ZbHp1?=
 =?utf-8?B?UXN5dHBwcnBTVVRta2ZOdlVqNk1ybm1SSDYzMWxFM01lVVdlR1hxUWZXSFdm?=
 =?utf-8?B?RTdKdUJ5ZFdGSFZ0UnhDc1ZCSFVOOUQvWmNyTVQyWmhSek5xZ2N3eThFUlpU?=
 =?utf-8?B?UEhTQ1BnQVRLb2lPT2RnM0tGdEx0YStHdm8vSXdJeFEyUW1MenJtQW1JbVEr?=
 =?utf-8?B?NllHUWM0bVI1c0QreUg0VTM4UFZUbU9iSlhPcnpIQTRRVGhoVExxaWc2dmky?=
 =?utf-8?B?RkRNbzJSNDhtR3RKd09oK01aN0xRZnJ4SjQ4ZXZtQlNpbzFpV1FMem1qQS9o?=
 =?utf-8?B?NUNSVU9zUG1NbHRGRERvakRKS0JIR29DK1IxM1h2aVVNMThZWmFIL3JCM3Jj?=
 =?utf-8?B?VmJzTnFFazJJcnJsU0hxdisxS053K0Y2UVk4TkY0bFFtNHNucTJlYnd1WTdX?=
 =?utf-8?B?d0dmTi9Da0hhTjF0dEVKZE1JMkRmaDBLVFdUazBlemcvTVZ3Tm8vbEo3enNm?=
 =?utf-8?B?RTMzM2NlSmEvei9JUkRUWWh1OHlQbktXQzZ2cWRmSkhVZ1FUVnZYSkxGNUVZ?=
 =?utf-8?B?dktNMVJWSVhwMmVVTy9BbVJtdVlxeHFNelpyOUVKVzNEaWtNbVdwaUdxbk16?=
 =?utf-8?B?K0xMSnQ3L2JQQnRQZkNoUmRobjBsWCs2cVgyNVBnT2Npa21pSWJwM0dGK1BV?=
 =?utf-8?B?cXROa01lWFBmb3BJRHhNRnpnQ2J5N2VIVlN4TGwrZzdTNWhrOGRtOVpaVzlS?=
 =?utf-8?B?bXJGM2p5ODd3TnVsdEF2eS91NnluQUd3VXNEb1hUSnFNR0ZUREdRRkFIZ1ZZ?=
 =?utf-8?B?NHBjem1jTVdDcDN5elp1WHg3NFpFK1k0YTQ5OHpwczdiZWtKOFIvT2lxUDYv?=
 =?utf-8?B?aUxWSk1HaStFYU5WVkZ4cm1xTTFHSkdVWWMycnRXTnRleU1FTmRZUHFKS0RE?=
 =?utf-8?B?ZDNSWXpBVjJaS0ZKTjhxd0NCOGhqRWdXRU55eU9mSTVlVFZvclkrQk54WlZX?=
 =?utf-8?B?TjB4VHNxZXZSVjlvUUV4dnJ6cEZmSHZKWEEweUpjV1VoWmVIU2ZyWndiMnFI?=
 =?utf-8?B?SVB5TzJIcy9PSHpEN3VNNWQyMGN2V2VwV1pDSys4MjMyTlFVZUcxZjFkc3cx?=
 =?utf-8?B?SDJ3d2F6c0o4RTJKTHBsbkdoWE5lMzQ3d0xyTjF4bUlpRGp0K25TSzVLcG15?=
 =?utf-8?B?UzJyWGdnYlBaYmprTEhZUzdZa3JTSjNjMzdwMit0VmJUYmZYWHF1ZHpHZWhM?=
 =?utf-8?B?bDN5RG1WTUVDeHpWTFZQTXMvSUdKenB1Qkt5TTBzbjdoanVtN3FXM0czQUFL?=
 =?utf-8?B?dS9VTUo0UGNMZUJScVZTSmdCdGhieVBsdkhaaGxXNTh1d0hmOTVnZGY3c3Rm?=
 =?utf-8?B?Q2YxSCtkcEVPRGxBbGRQZ2RIRFVFcGNrSDQzc09VTXVDaExIWkVXOE1QTVNa?=
 =?utf-8?B?aGcyM2lja2xXN0FxVkpubHNkYXZ0YW9KYTdTL0ZoVnBIRE9DejJ6enJub2Zj?=
 =?utf-8?B?TWhlRENwUEdZdk9NQ0hqd0dWdCtWVGFIazFEYnpHYlpla0ttOVRnemtrVk56?=
 =?utf-8?B?WUtFRk9EUHhOM25yeXJMZDVkZUNNcjFLRnBNQ3oxTlJaVzVKSE90b2VwTFI3?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b402ab50-45cf-4540-7bcc-08dbeef59906
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 03:04:40.9765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wRa1I7MkuRrmGn8oogVpvDFj02TOPTgH2QML/IbzUVYSVTnBq3B1dnpS+gwklzTgrbz5F6vFOw0BnaR1ZeGYRp3WWm+HgvpvA2QcpswWtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7804
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v2 1/6] drm/xe/xe2: Support flat ccs.
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

Hi Matthew,

On 23-11-2023 21:58, Matthew Auld wrote:
> On Tue, 21 Nov 2023 at 10:01, Himal Prasad Ghimiray
> <himal.prasad.ghimiray@intel.com> wrote:
>> Enable flat ccs for XE2_GFX_FEATURES.
>>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> I guess this should rather be the final patch in the series, once we
> have it working?

Thanks for the review. Will move this patch as final patch in next version.

>> ---
>>   drivers/gpu/drm/xe/xe_pci.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 682ba188e456..d9754f3d45f7 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -157,7 +157,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
>>   #define XE2_GFX_FEATURES \
>>          .dma_mask_size = 46, \
>>          .has_asid = 1, \
>> -       .has_flat_ccs = 0 /* FIXME: implementation missing */, \
>> +       .has_flat_ccs = 1, \
>>          .has_range_tlb_invalidation = 1, \
>>          .supports_usm = 0 /* FIXME: implementation missing */, \
>>          .va_bits = 48, \
>> --
>> 2.25.1
>>
