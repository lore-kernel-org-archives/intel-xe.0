Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A3FEB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 16:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53D010E6D8;
	Fri, 21 Jul 2023 16:51:51 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC21310E6D8
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 16:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689958309; x=1721494309;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZLGKr5XXdY1U/O1BJB9m1QZDkjUPmk8cHdj4gs45R1o=;
 b=KFpg5MSpssHCGlhZY0EsTBP1qfDYzl52doedONERWMa0C3sAD44BcUae
 fnmGkxu9pTX/rFtw/tHx42XMQeGZeUhSFA4ChfsD9jFPQukbHrdp/1thI
 x/lIElZzTjYTDk+DckDeJyCzqA3WHqVvNNGn+TVMflTIa9F9xkGdTd04h
 FyZ62RWlm27AtUbbvYIyh57Ha8/oZJs461tVw/XxF66jU3E/E/B4hxRxt
 +clAdmzj4cLJYy4C6jRpbZp02HiNtAM/mcO3S5Q9H/lXumbarQ0NmL8ub
 p5BHfkCb/HwpUWH7jG2wnm6SvFDQ5XaQvzTiUWefcS9RPSre8a60CcxCJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="433300277"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="433300277"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 09:51:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="718881718"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="718881718"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 21 Jul 2023 09:51:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 09:51:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 09:51:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 09:51:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZYHn9Ekg9EtZgTBWcnieoDgNYoSIJpGkg3GXGh+jlFaLnS0aFFhswVR3bW1NsWNcPoeKUwI5DuMuV6QTVZBE8R8wF4t98VBkxqfaRz+zjEGi5eWw7tivq6UD+4Y5Ru1vnDxb+/8eHHLS5Ah/xVmLJLRvRV7PoZ8lhrVhIn67xJ+NZ1hOaQj/LObLwF5Dox0j/VJf/GqiU0KSu7tDQXpBSxhJlBFj9P3QgvDngJmfzV294GfsFQNkDi1E+c50SM9WW7g//f5tvxLjROGjTneoPG7NY932qkcmbQW9yYJyx+B+becv/rWE3D/UIctt3bszRrm08WB7JSzEa1HbbBoZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91Oa9KCpaSuecG7EJxKYqXmhv81Q4kaQDuPvL2YULo0=;
 b=OohSva2gd0yVlCIT7mBh2tND5CL5PlSfkn712IgtxwHS8qxrzbuHbCbMQLQPIDUpa9Kx2wywwWXsilGRL3stKVxQw3qSJiyAelRi0zbJ6W/jJIPJ/jS0BU78zXz+gCCk0csIVYTjVXM99vt4sAUu5tEeNFr5uflDoMadT3+dcIg96N9kX+f0tRhi8rqi5yEJdIHeCTqG+ToMlJZDSye+NgDdnb53l2sLhOv37o9LqstwflviybRPYfSD8Qx3cF1brHZfxLkOA1eFR8S+4QOfuH/fMkLnt0vG/uUL4HS9ehrMCHtxje1UEwFvjUEoKwVT3s42CvdcRKE0URLkHBtVpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 IA0PR11MB7282.namprd11.prod.outlook.com (2603:10b6:208:43a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Fri, 21 Jul
 2023 16:51:40 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::dead:4565:f8d6:50a8]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::dead:4565:f8d6:50a8%5]) with mapi id 15.20.6588.031; Fri, 21 Jul 2023
 16:51:40 +0000
Message-ID: <77460a29-28fe-b4cb-0b20-508736309e3f@intel.com>
Date: Fri, 21 Jul 2023 22:21:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230712125640.1471850-1-ravi.kumar.vodapalli@intel.com>
 <ZK6+NZUQnfZCLQj0@DUT025-TGLU.fm.intel.com>
 <mr6slrxoedm46acyb73yzx5yoyuhjbeuixh3albo5jofuuawma@uformzo3j2r5>
 <e19e20f1-637c-4660-ee24-bfa714e89d17@intel.com>
 <kdwwfs57uc4i2fwttajp4mybarsdpiq6hvy257ga2dp47r7h3w@vmazxnk62wau>
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <kdwwfs57uc4i2fwttajp4mybarsdpiq6hvy257ga2dp47r7h3w@vmazxnk62wau>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::22) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|IA0PR11MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: aca4158d-18fe-4b1b-c2af-08db8a0ac101
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eVApB2dAd4F2zxn82PVK09fyUAlHcpQENWbs2n+nysgE/Lvm71BcgnW3b4P65yr1isOfchCpYRuJbOhGXEFYxpplxoVQ+92dofl/t6zM3IHcf6EsFzBH8TB12GpZ1ohzeWukdj0pE7JCp7YaBJQxS6eMDw96UoPxzx9aeOjlh9J4q1aeHCyTjZoBv++qDGu4mxK1mV7jGXoIrCT+H7a2gBmuQr6hHDi2YV2d1UI34uXvHKve2+jG0CvqYpA35JrU8yg3SON3hzYPYOInHYDHTB1Bg7H+KgOvcllP26ySB1tcJs8xdRm+/c5jXD3MpYkCxnFy6kVjj/KE0A+uUDqA5+TOKCWdepDjz+5b90Hbe36Vg9J0tGvCfxFKNsKTj9duYuX+TR57yhc1M+Iw+0Y/uNATacVn/CtTTmAohJrnIG6yk1l6BvHdjxxiGa/ALUZbIwgptWe2uRT1xxB0i2hJmzIZJYe8pmsBfi75MTKncGlaO46C1rvcOp8yE0JN9tDYQ8FRLyJT4YsEzN9SivYfSSYucE69yo5RxVRToodr2mKaBsWCTOxejeX8jrKdOhOjOw3MixJYCJ+nA1/wnnWOCGbQTjCj/Eaou/HS/Hvg320yXukrOnLBGml8XNkQ8oUmd7AIjLRFkOUcdcS+SADk3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199021)(82960400001)(6512007)(6486002)(6666004)(37006003)(2616005)(6862004)(5660300002)(8676002)(8936002)(4326008)(66476007)(66946007)(6636002)(66556008)(478600001)(316002)(41300700001)(83380400001)(6506007)(53546011)(186003)(26005)(38100700002)(86362001)(36756003)(30864003)(2906002)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVVmSTFrTytCTnVWMEs2c2hDcnpZeFFJdm5UYXVjNi9tdVlRdTlTeUF2dmk2?=
 =?utf-8?B?V2l6S1h0RU03cU8vc1EvRERwbFhHb0xMR3ViNUN6cnh5S1R2NzNsZ2gwWjdM?=
 =?utf-8?B?ekJSY2lHcWpOeHZiekUwQUJQUUJnMmJzZkd0c0J6R3VVVmdOVFZKWjRwV0wr?=
 =?utf-8?B?ejZPVkQ5c3VnSWRPNEZUb3hNNTV0ZGxrUkFEYzBHSEJBNTBnN1FSN3dIOTJW?=
 =?utf-8?B?ZDFrNTQ2OE1Yb2thR0NleU03Qk9TZ25Id2Z5UGFwOWZDWE1NSDVHd0NTTE9a?=
 =?utf-8?B?T3Zqa3JKUjJRMzZFdWpvLzF3TkRHd29jTGJ0TUdveDM1eEVSajdGcUhVR1RO?=
 =?utf-8?B?TFlOa3hTRkQ4NEIrSy9tNXNNdnBGOXdhRm5SUXpFcDZZc25RTks5dGFpM3Bq?=
 =?utf-8?B?dWZFU3RKRmxUUFpOWmdBejRPUTN4OG4yZXBKQUpkRHFsWlU5OVZOOHErQThM?=
 =?utf-8?B?YXNIVE1hbmVDWXFPY29GUUNjK1JDRy9YWkJtNDFNUFZSZ2QwSFo0Qytqdnpy?=
 =?utf-8?B?d2xuZE9LZUFudHF5TFdSYjk5RTBkR3VBOWNjNmJsYkthT24rdFUzNnk1TlY4?=
 =?utf-8?B?RnJVV1ZXc1pJQjJzUCtRWlNXY2tWNVhMUTNtSzJZZHpFVEFYUTZMeWlENkp0?=
 =?utf-8?B?YmNQWDlNekptRHpMTThkMVFVVkpGQlVENDJidTl2WUhCY052eWlvUmQxekxR?=
 =?utf-8?B?L25TRUdxT3JLeWhLNUpRYUdPR1Q5RHhoSXN1QTJnZDBmUGhXUURMRmREdnpV?=
 =?utf-8?B?ZlpuLzFpajdHRUtxK1BlSE92V29Hdlh1aHVIUXRzWTE1R3M0WjkrMU1KTU5r?=
 =?utf-8?B?VWlNSit4dmRLME5xc0ZMc3g4OXZmMXhKNElWT0g4UjVhWlFOaC9xbGN5VU1p?=
 =?utf-8?B?eEt2UUJ4YXk2WUdJVGFSMnI4NVNwVWZQZjB1SDZEcHpYMzVJcUEzdnhwVWR5?=
 =?utf-8?B?UDZTaWJzUnZDeHZLUGhyR2lRWm5sOUc3MTBaTzhsN2o2OFZnUUpvZ3B0anNk?=
 =?utf-8?B?QktZUitlUFMwRktVOGd1RFpXRjMxZkVVS2plYkdjVWNQN1BhbGM5b3cweUJr?=
 =?utf-8?B?TktFVFBQUHVPR2NUMFJUeFZlR29Lb09RSTdtZ1BxNE0zRCs3eGlrbnNKZjhx?=
 =?utf-8?B?YS9aV1k4b0IyOTZzZVkxVm9peXliMW11WUtCMC9KZHhwdVIrU2NwVDdVTE45?=
 =?utf-8?B?MThCZ01pUStoSmtXQlc3NG1ZZyt6bkpIekIwcWxsZ3RsdFFkMlgvN0w1UVlN?=
 =?utf-8?B?c2wrKzNZQ3loLzAxbzZqakNVWldFMG1rZlIzWGRQZjBpMUFnTmhFNXJ5eU9u?=
 =?utf-8?B?akNqeDNxZ2lrbld4cmd2VjRGUTVFU1llRkhtOU5qM29ZdC8weGVYeVQzN0t4?=
 =?utf-8?B?d1l6OWtieWFhNWd2Z1hmYmRXZG04eFpOUmQxYXJiaTJ2eVVaZW5DSG5haTNE?=
 =?utf-8?B?QjFVbkV6NS9udkZYUGhlU0g1bXUybllkdVMrY1lVUWVLU1dJSjd6Q05EdSth?=
 =?utf-8?B?TE1ua1I0b2lNMU9ZaXo3eU1PSVhGblFUSFJNR0M5Qkg4Q2UrdXJOUlRDS2Ro?=
 =?utf-8?B?ZHRzRFNidko1SFVDbDN0STc0WW9tWnFXTmg1YUNoMHVISzl5bS9yM2VyZHN6?=
 =?utf-8?B?VCtTZXNESVBxbUV4Tkc5MHNkQlV4MzQrZlBCSzVWVUxqVmRDejMraXU0SnhQ?=
 =?utf-8?B?MHBjajRMSVJpcXVxdEFuUUR0dG1Jd2NBR2l0TmxrRHJmcTZTTjV3YW1lc1hj?=
 =?utf-8?B?ZFo0M003VzVpNmFEblBDSmxPS3AwN0dZVDNBTHhKVXAwY2ZuN2FhdmxlNDZN?=
 =?utf-8?B?aGlCU1p0eitXZHBIU1dnb1poK1dldjBwOGtBSVdSck1iVmpBY1dsNVYzSmgv?=
 =?utf-8?B?aEcwdFY2a3JHL2hQT3NTZVJONFFkc2ZZdmthM0NQN2pCV3FmZElHc3BrSm85?=
 =?utf-8?B?QmtkN2syMjJ1Y3RaL0VadkU4Q3RCdEo2b0xLNHd2K2tTRnhQWDBObStxTDJx?=
 =?utf-8?B?a3piU1NnVTdkM0xPbjdGMFpRaTdnQXFvYlJZbi9BNmNhQkRxcTYrMnF3NW5G?=
 =?utf-8?B?YVljU2RPaGFOcmd5R2JHZ1BFQXdEdEc5R3pnNHJzTUlXMUJJamp2bTJBOVpi?=
 =?utf-8?B?Tnd6L09jRUl2MHlBcDVKRmxSNlNXazhSdG5CWG1Pc3BYRXlYOU9IdUVTNUZt?=
 =?utf-8?Q?0Pfj+3hbEZMbUEw85D7CmkM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aca4158d-18fe-4b1b-c2af-08db8a0ac101
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 16:51:39.9402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPCllFoEiFI6wL0mqXqlbs7/DfMnub5JP5A5XPmkTvIwyB2OxiophB9pr55iHQfI/76YuDMft9bkNccHYotd8xSG2ARJXhW/+Sr74Fufib4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7282
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/ppgtt: Add support for correct PAT
 encoding in Page Table Entry (PTE) format
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



On 7/21/2023 9:43 PM, Lucas De Marchi wrote:
> On Thu, Jul 20, 2023 at 07:48:33PM +0530, Vodapalli, Ravi Kumar wrote:
>>
>>
>> On 7/17/2023 6:53 PM, Lucas De Marchi wrote:
>>> On Wed, Jul 12, 2023 at 02:52:37PM +0000, Matthew Brost wrote:
>>>> On Wed, Jul 12, 2023 at 06:26:40PM +0530, Ravi Kumar Vodapalli wrote:
>>>>> Different platforms has different PAT encoding in PTE format, add
>>>>> correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).
>>>>>
>>>>> Bspec: 45101, 71582
>>>>> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
>>>>> ---
>>>>>  drivers/gpu/drm/xe/xe_pt.c       | 110 
>>>>> +++++++++++++++++++++++++++----
>>>>>  drivers/gpu/drm/xe/xe_pte.h      |  31 +++++++++
>>>>>  drivers/gpu/drm/xe/xe_vm_types.h |   1 +
>>>>>  3 files changed, 129 insertions(+), 13 deletions(-)
>>>>>  create mode 100644 drivers/gpu/drm/xe/xe_pte.h
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>>>> index 00855681c0d5..e7f8bd4dd518 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>>>> @@ -16,6 +16,7 @@
>>>>>  #include "xe_trace.h"
>>>>>  #include "xe_ttm_stolen_mgr.h"
>>>>>  #include "xe_vm.h"
>>>>> +#include "xe_pte.h"
>>>>>
>>>>>  struct xe_pt_dir {
>>>>>      struct xe_pt pt;
>>>>> @@ -111,19 +112,7 @@ static u64 __pte_encode(u64 pte, enum 
>>>>> xe_cache_level cache,
>>>>>      if (unlikely(vma && xe_vma_is_null(vma)))
>>>>>          pte |= XE_PTE_NULL;
>>>>>
>>>>> -    /* FIXME: I don't think the PPAT handling is correct for MTL */
>>>>> -
>>>>> -    switch (cache) {
>>>>> -    case XE_CACHE_NONE:
>>>>> -        pte |= PPAT_UNCACHED;
>>>>> -        break;
>>>>> -    case XE_CACHE_WT:
>>>>> -        pte |= PPAT_DISPLAY_ELLC;
>>>>> -        break;
>>>>> -    default:
>>>>> -        pte |= PPAT_CACHED;
>>>>> -        break;
>>>>> -    }
>>>>> +    pte = xe_vma_vm(vma)->pte_encode(pte, cache);
>>>>>
>>>>>      if (pt_level == 1)
>>>>>          pte |= XE_PDE_PS_2M;
>>>>> @@ -187,6 +176,94 @@ static u64 __xe_pt_empty_pte(struct xe_tile 
>>>>> *tile, struct xe_vm *vm,
>>>>>      }
>>>>>  }
>>>>>
>>>>> +static u64 xelp_pte_encode_pat(u8 pat_index)
>>>>> +{
>>>>> +    u64 pte_pat = 0;
>>>>> +
>>>>> +    if (pat_index & BIT(0))
>>>>> +        pte_pat |= BIT(3);
>>>>> +
>>>>> +    if (pat_index & BIT(1))
>>>>> +        pte_pat |= BIT(4);
>>>>> +
>>>>> +    if (pat_index & BIT(2))
>>>>> +        pte_pat |= BIT(7);
>>>>> +
>>>>> +    return pte_pat;
>>>>> +}
>>>>> +
>>>>> +static u64 __xelp_pte_encode(u64 pte, enum xe_cache_level cache)
>>>>> +{
>>>>> +    pte &= ~XELP_PAT_MASK;
>>>>> +
>>>>> +    switch (cache) {
>>>>> +    case XE_CACHE_NONE:
>>>>> +        pte |= xelp_pte_encode_pat(XELP_PAT_UNCACHE);
>>>>> +        break;
>>>>> +    case XE_CACHE_WT:
>>>>> +        pte |= xelp_pte_encode_pat(XELP_PAT_WT_CACHE);
>>>>> +        break;
>>>>> +    case XE_CACHE_WB:
>>>>> +        pte |= xelp_pte_encode_pat(XELP_PAT_WB_CACHE);
>>>>> +        break;
>>>>> +    default:
>>>>> +        /* pte |= PPAT_CACHED; */
>>>>> +        break;
>>>>> +    }
>>>>> +
>>>>> +    return pte;
>>>>> +}
>>>>> +
>>>>> +static u64 __xehpc_pte_encode(u64 pte, enum xe_cache_level cache)
>>>>> +{
>>>>> +    pte &= ~XELP_PAT_MASK;
>>>>> +
>>>>> +    /* Initially assumed as CLOS0.
>>>>> +     * To Do: CLOS1/CLOS2 has to be set depending on requirement
>>>>> +     */
>>>>> +    switch (cache) {
>>>>> +    case XE_CACHE_NONE:
>>>>> +        pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_UNCACHE);
>>>>> +        break;
>>>>> +    case XE_CACHE_WT:
>>>>> +        pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_WT_CACHE);
>>>>> +        break;
>>>>> +    case XE_CACHE_WB:
>>>>> +        pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_WB_CACHE);
>>>>> +        break;
>>>>> +    default:
>>>>> +        /* pte |= PPAT_CACHED; */
>>>>> +        break;
>>>>> +    }
>>>>> +
>>>>> +    return pte;
>>>>> +}
>>>>> +
>>>>> +static u64 __xelpg_pte_encode(u64 pte, enum xe_cache_level cache)
>>>>> +{
>>>>> +    pte &= ~XELP_PAT_MASK;
>>>>> +
>>>>> +    /* Initially assumed as Non cohorent mode, correct values
>>>>> +     * has to be set depending on requirement.
>>>>> +     */
>>>>> +    switch (cache) {
>>>>> +    case XE_CACHE_NONE:
>>>>> +        pte |= xelp_pte_encode_pat(XELPG_PAT_UNCACHE);
>>>>> +        break;
>>>>> +    case XE_CACHE_WT:
>>>>> +        pte |= xelp_pte_encode_pat(XELPG_PAT_WT_CACHE);
>>>>> +        break;
>>>>> +    case XE_CACHE_WB:
>>>>> +        pte |= xelp_pte_encode_pat(XELPG_PAT_WB_CACHE);
>>>>> +        break;
>>>>> +    default:
>>>>> +        /* pte |= PPAT_CACHED; */
>>>>> +        break;
>>>>> +    }
>>>>> +
>>>>> +    return pte;
>>>>> +}
>>>>> +
>>>>>  /**
>>>>>   * xe_pt_create() - Create a page-table.
>>>>>   * @vm: The vm to create for.
>>>>> @@ -216,6 +293,13 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, 
>>>>> struct xe_tile *tile,
>>>>>      if (!pt)
>>>>>          return ERR_PTR(-ENOMEM);
>>>>>
>>>>> +    if (GRAPHICS_VERx100(vm->xe) >= 1270)
>>>>> +        vm->pte_encode = __xelpg_pte_encode;
>>>>> +    else if (GRAPHICS_VERx100(vm->xe) >= 1260)
>>>>> +        vm->pte_encode = __xehpc_pte_encode;
>>>>> +    else
>>>>> +        vm->pte_encode = __xelp_pte_encode;
>>>>> +
>>>>>      bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
>>>>>                    ttm_bo_type_kernel,
>>>>>                    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pte.h 
>>>>> b/drivers/gpu/drm/xe/xe_pte.h
>>>>> new file mode 100644
>>>>> index 000000000000..8b3b5b471a99
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/xe/xe_pte.h
>>>>
>>>> s/xe_pte.h/xe_pte_pat.h
>>>>
>>>> Just my option prefer this.
>>>
>>> dunno, but since we have different pte formats for ggtt and ppgtt, IMO
>>> it would add to the confusion.
>>>
>>> Maybe this belongs in xe_pat.h since it's xe_pat.c that programs the
>>> tables giving the meaning spelled out in the macros here for each 
>>> index.
>>> The rest of the code then need to set the bits in the PTE to reference
>>> those indexes, according to the PTE format.
>>>
>>>>
>>>>> @@ -0,0 +1,31 @@
>>>>> +/* SPDX-License-Identifier: MIT */
>>>>> +/*
>>>>> + * Copyright © 2021 Intel Corporation
>>>>> + */
>>>>> +
>>>>> +#ifndef _XE_PTE_H_
>>>>> +#define _XE_PTE_H_
>>>>> +
>>>>> +#define XELP_PAT_MASK                  BIT_ULL(7) | BIT_ULL(4) | 
>>>>> BIT_ULL(3)
>>>>> +#define XELP_PAT_WB_CACHE              0
>>>>> +#define XELP_PAT_WC_CACHE              1
>>>>> +#define XELP_PAT_WT_CACHE              2
>>>>> +#define XELP_PAT_UNCACHE               3
>>>
>>> example... this duplicates what we have in xe_pat.c (comment added here
>>> for clarity)
>>>
>>> static const u32 tgl_pat_table[] = {
>>>         [0] = TGL_PAT_WB,
>>>         [1] = TGL_PAT_WC,
>>>         [2] = TGL_PAT_WT,
>>>         [3] = TGL_PAT_UC,
>>>     // .... those are programmed, but not expected to be used
>>>         [4] = TGL_PAT_WB,
>>>         [5] = TGL_PAT_WB,
>>>         [6] = TGL_PAT_WB,
>>>         [7] = TGL_PAT_WB,
>>> };
>>>
>>
>> TGL_PAT_WB maps to PAT table register bit mapping, we cannot directly 
>> use tgl_pat_table to get PAT index rather we
>> need to implement code to retrieve the index like below instead we 
>> can use macro directly.
>>
>> xelp_pte_encode_pat(u8 cache_type) //example pass TGL_PAT_WB
>> {
>>     u8 index;
>>     for (i=0, i < 32, i++)
>>         if (tgl_pat_table[i] == cache_type)
>
> no, we don't want the caller to pass the platform-specific value.
> It should pass a platfrom-agnostic value and xe_pat_get_index()
> translates that to the platform-specific index. There are just 2 entries
> really used by the kernel: uc and wb. Then the xe_pat.c returns what is
> the entry to be used in those cases.
>
> Lucas De Marchi
>

I have discussed Regarding encoding the index into pat pte with Matt,Roper
He said instead of writing common function for both ppgtt and ggtt, the 
best approach would be as below so that in future adding more support 
will be easier

static u64 xelp_pte_encode_pat(u8 pat_index)
{
     u64 pte_pat = 0;

     if (pat_index & BIT(0))
         pte_pat |= BIT(3);

     if (pat_index & BIT(1))
         pte_pat |= BIT(4);

     if (pat_index & BIT(2))
         pte_pat |= BIT(7);

     return pte_pat;
}

Thanks,
Ravi Kumar V

>>             index = i;
>> }
>>
>>
>>>
>>> IMO the abstration could be something like
>>>
>>>     // this is valid for both ppgtt and ggtt
>>>     pat = xe_pat_get_index(xe, cache);
>>>
>>>     // this changes between ggtt / ppgtt
>>>     pte |= vm->pte_encode_pat(xe, pat);
>>>
>>
>> I have one approach like below example where we can use same function 
>> for both ggtt and ppgtt
>>
>> static u64 pte_encode_pat(enum gtt_type, u8 pat_index)
>> {
>>     u64 pte_pat = 0;
>>
>>     if (gtt_type == PPGTT)
>>     {
>>         if (pat_index & BIT(0))
>>             pte_pat |= BIT(3);
>>
>>         if (pat_index & BIT(1))
>>             pte_pat |= BIT(4);
>>
>>         if (pat_index & BIT(2))
>>             pte_pat |= BIT(7);
>>      }
>>     else if(gtt_type = GGTT)
>>     {
>>         GGTT type PAT PTE encoding code here.
>>     }
>>         return pte_pat;
>> }
>>
>>
>> vm->pte_encode_pat(u64 pte, enum gtt_type, xe_cache_level cache)
>> {
>>     switch (cache) {
>>            case XE_CACHE_NONE:
>>             pte |= pte_encode_pat(gtt_type, XELP_PAT_UNCACHE);
>>             break;
>> }
>>
>> what's your opinion.
>>
>> Thanks,
>> Ravi Kumar V
>>>
>>> so the PAT indexes are handled by xe_pat.[ch]. The pte *encoding*
>>> is then handled differently by ggtt and ppgtt. Thoughts?
>>>
>>> Lucas De Marchi
>>>
>>>
>>>>> +
>>>>> +#define XEHPC_PAT_CLOS0_UNCACHE        0
>>>>> +#define XEHPC_PAT_CLOS0_WC_CACHE       1
>>>>> +#define XEHPC_PAT_CLOS0_WT_CACHE       2
>>>>> +#define XEHPC_PAT_CLOS0_WB_CACHE       3
>>>>> +#define XEHPC_PAT_CLOS1_WT_CACHE       4
>>>>> +#define XEHPC_PAT_CLOS1_WB_CACHE       5
>>>>> +#define XEHPC_PAT_CLOS2_WT_CACHE       6
>>>>> +#define XEHPC_PAT_CLOS2_WB_CACHE       7
>>>>> +
>>>>> +#define XELPG_PAT_WB_CACHE             0
>>>>> +#define XELPG_PAT_WT_CACHE             1
>>>>> +#define XELPG_PAT_UNCACHE              2
>>>>> +#define XELPG_PAT_1_WAY_WB_CACHE       3
>>>>> +#define XELPG_PAT_2_WAY_WB_CACHE       4
>>>>> +
>>>>> +#endif
>>>>> +
>>>>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h 
>>>>> b/drivers/gpu/drm/xe/xe_vm_types.h
>>>>> index edb3c99a9c81..9e1b33c17d05 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>>>>> @@ -312,6 +312,7 @@ struct xe_vm {
>>>>>
>>>>>      /** @batch_invalidate_tlb: Always invalidate TLB before batch 
>>>>> start */
>>>>>      bool batch_invalidate_tlb;
>>>>> +    u64 (*pte_encode)(u64 pte, enum xe_cache_level cache);
>>>>
>>>> Add kernel doc.
>>>>
>>>> s/pte_encode/pte_pat_encode
>>>>
>>>> Again just my opinion. Let see if anyone else has an opinion on the 
>>>> naming.
>>>>
>>>> Other than these NITs it LGTM. Didn't read to the bspec to check the
>>>> actually bit setting, but can do that ahead of the next rev. 
>>>> Speaking of
>>>> that, do you have a bspec link so I don't have to search through it?
>>>>
>>>> Matt
>>>>
>>>>>  };
>>>>>
>>>>>  /** struct xe_vma_op_map - VMA map operation */
>>>>> -- 
>>>>> 2.25.1
>>>>>
>>

