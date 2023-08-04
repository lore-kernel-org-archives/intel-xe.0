Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ABDC001DB
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 18:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D84210E0DE;
	Fri,  4 Aug 2023 18:29:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C0B10E0DE
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 18:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691173759; x=1722709759;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RHRLz+jC6FBVRgvBsjXbvPMB24AsB8fea1CkNp3B02o=;
 b=JQhCS1up84BwxQjMLu4V6DEjraxz2vN50KzGG6+M50OLfEzsxUWY2Ji6
 LTFT2r0VBeWVHVTIUt92k6BkLZvcz3hFZp+XpzY67jphme3achFejjEwA
 N1yGvUo5uY+sWkLclLs1vTP8FTVj+yitX92Hb8+16zlUHIf6gK8PThox9
 Q7ccBWITxpkEAMsC6Y1YXKNeO2kBrbc3oBwoZdM4GAkFNfy7z/RH+htiE
 IMz3uaKL8/KVmaPjRYCEgQAkd4otV/lm2/0lf1Fhj7UX92SDoyiT2bsC/
 Bxv7DnFG12KCHJlQlwgkPjqXnG8kixwckaEG7Wr3JLsgeyhoZeoeSq4BA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="401176563"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; d="scan'208";a="401176563"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 11:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="707109939"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; d="scan'208";a="707109939"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 04 Aug 2023 11:29:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 11:29:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 11:29:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 11:29:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+6ceWGLT/N7/ZHSoCEhxNjKd974xp0iizXkhtn7wg8t6RgY19ZwoxfM6l8U0MbEY7xmqwuz7sbz4swNYYsL1yJlv8j7ctSb8IUuSy05tPROjq7x+2wY95bk+cfHfHLO6HiJx6rmRunIglPNyoS2BeYdAJhmlg9iu1eZjuIl3RqOApmg/cHvMPEeU5VT1ozD938g+XP5Hwbdq4BMw3oBw5tosmlJ+CAmCsMV1xaskCplLWfysSLGc+ryfrSyVCriYxszLV4ujykm1eIhQLnhI1moK9lNQtywwkJk/NeFjGqH8cSwZ8yQQAWDzKHybnSVkNdyXLbxOas9nusS40LArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2XaaKtTtWHByDDQy/bNhM3bni+EVNtAVqAFBebJz1Q=;
 b=X+FDfvFS254AmqeCNy5kb4I6mDiNE2Sq78V+glrhNiz9uhOgai96vtzHlie6cgwk6Z+Rx0vVog496DnUvISRE6SnTJ5z4+egydt9OrAjkTGgT2rH5fqjwEleAF/9g4vMzHiTMJN1JTt6Xd6uvIl1zL89o4q+IOkyxEYEB5jQrrJ3ZljwdKJd3nZ5IqKJp2OdP2Qr9hgGHTc+H3575FarzcLg2D48R5cBe1vYJYILHBx7hLIXgkXrQmpKNExiLS5LYRGJ/QU9B7u7lfc/a+sApN0EaIqo00ndOr8VjKjrf8PwI9ks7i/8A4HtfNNRRx3vIH1dQK6nvYu31dC66JDRNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by BL1PR11MB6002.namprd11.prod.outlook.com (2603:10b6:208:386::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 18:29:15 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::32cf:820f:a18b:422d]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::32cf:820f:a18b:422d%7]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 18:29:15 +0000
Message-ID: <7849d9c4-3bbb-4c84-92c7-fb391bdde282@intel.com>
Date: Fri, 4 Aug 2023 11:29:13 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
To: "Zeng, Oak" <oak.zeng@intel.com>, "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230803190149.2637666-1-oak.zeng@intel.com>
 <c5b2618cc31febf582651f3f2b7875405851ba09.camel@intel.com>
 <SA1PR11MB6991205AEC4589D7D76C24CB9208A@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <SA1PR11MB6991205AEC4589D7D76C24CB9208A@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0120.namprd03.prod.outlook.com
 (2603:10b6:a03:333::35) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|BL1PR11MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: cb97cf87-22cd-4a9d-c83b-08db9518b52a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wrKux5J64OtUHbTdsPpQJNKx622pF1SSMlo0pww/R5ZZQ3JiZ2OTfi7CSkYAEO0aeRT/pgWegrsocopVSsqqDN3mxA3yWPORZcoXqQ9MTBolYiPCLE51Arwk+sNhprKTr20gscRLsso3iCWxnQ0QGJ8AZcGHUIKuyFcmWKHz++djjqsVVOZdGrVTNCZ9W5SteILlD8s493dgxgOOW80kUjmtGZI5rRiVMMYTluX22Yd1bzqJ+2XFGMeJa07tuB0NKpa/NO3oyxrAQjNLf53pCxAJkarIZrDe5Str2Hn9xbI88PkyMMO04B9w7MDLVBiReOVcCtLblLaW2aLZsyV2+14Ajy4siYhJvfKMI/FV4luOHVrKKp2DWRCzo76AzylYSuwcSNpseGJKNCeWoEbEKt2TYlS4v8j3P56f5yHTSCGNDS1kdwp0//z/p8NaN3WcXbwtQ0Ujzv2JrCLvszb030p8+J2Lw2hB3PvYRgqAJOJNemZp/jDDjwOh7QsJTWHbd+iRcJjwJWR7Bd/tH8ZXaCSa7HNOtZzyZOGdxu6WAawfuZR4Kq9GZONXJt9UGGrPFa7WXluhfdQBoy+/8IsZxYGYjMOrG0Hl/9+fslF7NQRyNeP0k2S3y5k0MmsR7E/jeBxAdTrxbZdFtnlaHCIlVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(346002)(136003)(39860400002)(186006)(1800799003)(451199021)(36756003)(86362001)(31696002)(31686004)(478600001)(54906003)(110136005)(82960400001)(38100700002)(8676002)(107886003)(2616005)(83380400001)(6506007)(26005)(53546011)(6512007)(41300700001)(8936002)(6486002)(966005)(66556008)(2906002)(316002)(66476007)(4326008)(66946007)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnRJSkVKUklacE82Nk9YTU9KWGxxdExXQXFweXJaMUJpZlIraHYwUG9CbWdN?=
 =?utf-8?B?b1FrYy91N1Y4SVI1RHJnV1JGMHJMdjliNk1sRGpjN1dXVzVXc0tiOWhqMXgz?=
 =?utf-8?B?S3J5Q1h2KzBGam5kMW52L0ZTTUloTjlyeDhiTUkwQWtZMEZKQ1o2dUhnUWdK?=
 =?utf-8?B?Y2Nwc3RVVmp4bGd5N2ZhRG1YVEFpc2U5MVlGYWYyZkcvWStDNXR3U2VJYzV6?=
 =?utf-8?B?dHhxa29ERTNFTnhGeUw1Yy9qZStmWUVYb2RBODkzZTJQWjZZa1oySVJzTkpV?=
 =?utf-8?B?RU52eGVSNk5xRllkelJzMG5DcmNTTWcyOWF1YzhtSXZoK1NKUHBUSWlOa0tk?=
 =?utf-8?B?WUdxN2NTYzlpTmlZK3M0Y3VkQ0Z1VitkSjJwdHBuTTh0R1ZROEJyS1FSVytl?=
 =?utf-8?B?V285WUE1ODMvRzdoZ0ZFaXpPSGdpSWZSaUovU2pjalp0ZmpPMEcvbkZvN2hq?=
 =?utf-8?B?L05WM0xOMzUzUThCaHdMQitSa2x5YytrL2ZWUGFzTDAxNmwzUTB5UW9RbThF?=
 =?utf-8?B?ay80L0VnaHk4dUNyLzJDZkU5azFyK1lEaXk3WmF4NHVpTG45L2U3dTdxSmpJ?=
 =?utf-8?B?Q0liWjg1ZWt5Rld2Nmw1SU9OZFR3Um9BZEJXQWFNSm1oMUZ3ek53aDZQV1Rn?=
 =?utf-8?B?NVlYeGI4V2lrT2JKakpBODlwajNCVDVQNFRnZ2JycFFLcFcvSDVnS1JyczNz?=
 =?utf-8?B?eUM2V2dYQXdnSWl0Wlphc1RuRTQ3S0x1cWZGa1VsRTJ3T01kQ1c0ZCtTK0Fa?=
 =?utf-8?B?VDdMQUtPTkFUYmxIUXFjYUJZK1FKMDQrSGVoNVZsZHc5dEh4UkpCL0xKOVlv?=
 =?utf-8?B?NTFuM2dGL0VDekVYZzNjNThvcERwcnA3cW1YeW1nT1hkeXpEQ0VXOExhTTdt?=
 =?utf-8?B?amNMVEtPMWM0S3Y1ZGJnaUlkSm1admVIa0duYkhKUWhPSjZCN0d3MmpFQ2dD?=
 =?utf-8?B?TXBDcUFUYmNBRHE5QXNNbEQydEhqdjl3OW1WSC9jSnEyUjBlZERSOHpIZHVP?=
 =?utf-8?B?N0FjTmNUaG5hVExTL2g5elBYMkMxY25PRjZGZXYyRXdKQ1RDVkk1MTZyTnFN?=
 =?utf-8?B?SmpqQnNrQW9pQkNkKzNrVlpEd0FwdXdHazdxWGRSaTh1K2JQZkpKdUZ5cEox?=
 =?utf-8?B?NE84VkhpVEJzWFBuY2lUbWZLdUxXTC90WWdpM1NaZHU3d2FLNkg0ZVc2Y3Nh?=
 =?utf-8?B?RHl0Wmp3M1hXWVpQZEZnTDFxNi9TNktqbHhCZzcrb016SGFTYjkzdGthUTVv?=
 =?utf-8?B?MXdTMWVzUHhVMDNSbGZIRlJRVjIrNjBBTkR2QUYyTG5xZEVPU3c2UTc4Z2oz?=
 =?utf-8?B?RFBreDVHMDROL1plVU93ZElzdHJVZm94NnZ6b3g0aXBkY0t2Z2tCamZHZzBM?=
 =?utf-8?B?R0o3d2FnNitSeEU0ZDVQYStvTVJJbDcwN2hqNEhLaWVoeWxKYWllUzJneWlm?=
 =?utf-8?B?TXJkUE4zcml0cUs5Q0Ftc3ZUYk9pcE83a0E0dTBQMkFEQlAzSE9CZjl5K3Bq?=
 =?utf-8?B?THZ3bWI1aFZhM2l3RjUxcUhrS0Zhb21ZZDVTSTRxRlBQM2ljLy9SR3R1Q1hn?=
 =?utf-8?B?MUJxUGlCOXVKUjRiYlBJd3hidkw2SlI0N2s1bk5HMU05MmUzRG5wcmFBNEpZ?=
 =?utf-8?B?dzRqalFlOXN5MkhjSVRXd2hWUEFFVFgwSlJZY21YbjBseis3SjJuMHhkMmNV?=
 =?utf-8?B?TXlIK2gzUkx0QXlNeTBHRmdpN2RwRHZwWGtSUDhQYUdldlJiZmYvMWxxV1BB?=
 =?utf-8?B?R0xTejhhbVgxc1pQMnl6LzdqL2JMczMzTFdSeVFvVHdYK3YxWldqVVFrNmZV?=
 =?utf-8?B?TXpvT3J4a3g2NjMyQjhDZFZXOFNQQ0RXZnZ5NEVDSjVPU1JOa2VFTnowWnJv?=
 =?utf-8?B?TTVRRURLS056OU1iYjZNSTNqOGtTU2p2WWJVOGhmdVZDeHp2ajNKaC9rQW9Q?=
 =?utf-8?B?TDd3TkpZVStRbkg3MVJxNS9hMVRCUUJPZjFHbEpKYS9pZjNnSnY5ZmRxc1Bp?=
 =?utf-8?B?aFRRb1RoQjgyMTFVL3N1OHlHaWpSaU1SbFc0YmgwRzIrN2JSaFoxU2xZaytq?=
 =?utf-8?B?SFVTbUVvTmJKOUMwSnFobzBxTnZxVGsyUjZYR1hiM0xvaWNMSkZ5Ni9oYm1N?=
 =?utf-8?Q?VRHuK0/Xg3L/mQ5jKilf1Ycjq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb97cf87-22cd-4a9d-c83b-08db9518b52a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 18:29:15.5866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SlEhgb9Wp3b91sAkrIjzC4R1Ec9DYoZfxCGnwCsWGL/qJ2aXSBK9FpKt+7ez329X6Z0pKm4HIcd17Ic1CRtiNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6002
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Implement HW workaround 14016763929
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 8/3/2023 12:53 PM, Zeng, Oak wrote:
> 
> 
> Thanks,
> Oak
> 
>> -----Original Message-----
>> From: Souza, Jose <jose.souza@intel.com>
>> Sent: August 3, 2023 3:10 PM
>> To: intel-xe@lists.freedesktop.org; Zeng, Oak <oak.zeng@intel.com>
>> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; De Marchi, Lucas
>> <lucas.demarchi@intel.com>
>> Subject: Re: [Intel-xe] [PATCH] drm/xe: Implement HW workaround 14016763929
>>
>> On Thu, 2023-08-03 at 15:01 -0400, Oak Zeng wrote:
>>> To workaround a HW bug on DG2, driver is required to map the whole
>>> ppgtt virtual address space before GPU workload submission. Thus
>>> set the XE_VM_FLAG_SCRATCH_PAGE flag during vm create so the whole
>>> address space is mapped to point to scratch page.
>>>
>>> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/Makefile        | 2 +-
>>>   drivers/gpu/drm/xe/xe_vm.c         | 5 +++++
>>>   drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
>>>   3 files changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index e79624ab2cb3..e6a05d35c931 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -37,7 +37,7 @@ quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
>>>   $(generated_oob) &: $(obj)/xe_gen_wa_oob
>> $(srctree)/$(src)/xe_wa_oob.rules
>>>   	$(call cmd,wa_oob)
>>>
>>> -$(obj)/xe_guc.o $(obj)/xe_wa.o $(obj)/xe_ring_ops.o: $(generated_oob)
>>> +$(obj)/xe_guc.o $(obj)/xe_wa.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o:
>> $(generated_oob)
>>>
>>>   # Please keep these build lists sorted!
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index cb28dbc2bdbb..b045bb341a5c 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -29,6 +29,8 @@
>>>   #include "xe_res_cursor.h"
>>>   #include "xe_sync.h"
>>>   #include "xe_trace.h"
>>> +#include "generated/xe_wa_oob.h"
>>> +#include "xe_wa.h"
>>>
>>>   #define TEST_VM_ASYNC_OPS_ERROR
>>>
>>> @@ -1235,6 +1237,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe,
>> u32 flags)
>>>
>>>   	INIT_LIST_HEAD(&vm->extobj.list);
>>>
>>> +	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
>>> +		flags |= XE_VM_FLAG_SCRATCH_PAGE;

Is above correct place to insert this?
I didn't lookup the WA, but wouldn't only user VM's be the concern?
So the above code should instead go in xe_vm_create_ioctl() so then is 
not getting applied for example to the special vm created in 
xe_migrate_init().


>>
>> Isn't DRM_XE_VM_CREATE_FAULT_MODE incompatible with SCRATCH_PAGE?
>> What if user-space asks for fault mode in DG2?

So I think we agreed this is bascially a moot point since FAULT_MODE is 
not supported on DG2.

To tidy this up and address Jose's point, I think you could reorder the 
error checks then?

So make below the first of the FAULT_MODE checks?  Or maybe doesn't 
matter...

   if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
                    !xe->info.supports_usm))
           return -EINVAL;



> 
> Very good point. When I first get this request (to implement this workaround the way as showed in this patch), I thought this workaround is better to be implemented from UMD, since kmd already exposed those flags to user space. But there were some other experts has discussed, see the comment here: https://jira.devtools.intel.com/browse/VLK-49991?focusedCommentId=21055607&page=com.atlassian.jira.plugin.system.issuetabpanels:comment-tabpanel#comment-21055607
> 
> Let me communicate back to see whether we can implement this workaround in umd so we don't have such incompatible configuration and also not silently change user's setting.
> 
> Thanks,
> Oak
>>
>>
>>> +
>>>   	if (!(flags & XE_VM_FLAG_MIGRATION))
>>>   		xe_device_mem_access_get(xe);
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> index 15c23813398a..6fc68c592ca8 100644
>>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> @@ -15,3 +15,4 @@
>>>   18020744125	PLATFORM(PVC)
>>>   1509372804	PLATFORM(PVC), GRAPHICS_STEP(A0, C0)
>>>   1409600907	GRAPHICS_VERSION_RANGE(1200, 1250)
>>> +14016763929	PLATFORM(DG2)
> 
