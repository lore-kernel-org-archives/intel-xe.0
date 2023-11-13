Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEE1C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 21:32:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C7B10E42E;
	Mon, 13 Nov 2023 21:32:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6D910E42E
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 21:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699911152; x=1731447152;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qCQB88eg78dQWvp+ADd/tAv6ZENZGoCDv7z+1PHOaU4=;
 b=H/pupSufbh6W0CWU68JwJBQWCa2XcFQKF/+VF6QwHKAGqNt45eok23HC
 f+8ercFzYkJ5CE78rKlf0bP+u//4c8jI1xLtM0+EJT6oVi+0Wfi9mC3n1
 6L3R1cKvwUy3BRicSqIcpwqJGczVo0UQGD3memySUc/t43rK2VJj+Clex
 xSw39iCCML6RK1JQl6r4TzHnwclFml+cMA1tf6dhRybNhkfXNjDe5Yt62
 Y4YWDyOjE+VkMDwpYoUs8ZmjxScb8AAs1lP2EQQEgYxWTg/W8o3E6EHX9
 +3N2vfRDxzfqY4u0J1fqjgEJShzUyYT+ZeC3FdzTIiA3JGGzsOegvQx3Y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="370711468"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="370711468"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 13:32:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="714340201"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="714340201"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 13:32:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 13:32:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 13:32:25 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 13:32:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaaXN3XpgaTP6SQ3BYXgGPH3zz9w56jitLxVFUvG5+Xj2QRAjn3JHJDYAN0UmtozdoxQbNp+qV+FwuqTlCzk9NBQwHQDqJkKuckxBuRCkR6nGMBO98G/D2DDJla7V0JHfL9sWl+mAVraHWX8PbWVpRexJS8w80bQOmwprXHGbhqa0+iuKwHcz7/qf+XehKYH2NVNPMI9N4QpVNOE7o51knlm06e3U5DlEDF4vP7DCXRtwv59j8q7ZodTGL2Z/3iB68F6/Rn95P5J7ckUxxaDEs87+gJI5+sm1vn+A9bMoME7Q0GaSBntlen0aeNG8G0OP7/LZdcYLaXYBF/X+gSDpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2FLqXKcgGlxMThKddMI4TZHj/H/xBuTbo13LX9FEEs=;
 b=R9x5iCtug0wJ0ZUI+dIvzp+u/3ZMVIyOG/HGWT+fXZ6GaXF7+iQfRjg8XPE99RVP4oUSor4uAAYt3pvzeYDr5gPv32kIT33+ZpG3l/Pq4vJj55XXAXOGTH4RYPIkJ6ygzZDhWkt15ka+UbDTE7WNm5U/uzpthOI9hxanHM3nvCW7Y5Pcx2/XsF0sOdZ+lvaZve+vYxN+KI79DC2SV8pZTP3Jzr9CTlh16XJetdUFsXpdasRVxBxhtmXG6Tn0fyrkM+rGUTGs7sNo18LhRDsPMry27oM+SifKQVlhdUxPurtm94aaXuTVuOuUJw5+boo5VJfXj0Vh81JDkGxQoznjvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CO1PR11MB4978.namprd11.prod.outlook.com (2603:10b6:303:91::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 21:32:23 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86%7]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 21:32:23 +0000
Message-ID: <91878caa-e0ba-4d84-8e5f-50b5654a421b@intel.com>
Date: Mon, 13 Nov 2023 13:32:21 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-12-daniele.ceraolospurio@intel.com>
 <fb742073-a0df-4406-9e81-e27d049244e7@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <fb742073-a0df-4406-9e81-e27d049244e7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0375.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::20) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CO1PR11MB4978:EE_
X-MS-Office365-Filtering-Correlation-Id: b32b554c-e760-42dd-78ac-08dbe49005e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pwVNQlZbFgmPF6eeMXsWv4ws5qv4CKOMthobp9jeac1Gu2Z8hRmkkE9ZjcwP5vCBKeH5FQtJYn+lJsPNwZUwXRF5NvJOj8YGgRxu+37eYZJirgEGWMplSPtWdVl5Aylgp5FXtYLKDcrt2K+3Jpg88bO2oKfgtiZ3daSOKl+IbJWNCh6zO1DhADuXdnazoeIzf6H2OpNQ2CEXdDmgs8bHmImqqmRfGLEdQy3wGDqFgxtOZ3xAfPXf3wFlZohBTU/2QQ+fPunqARXIVwmiZ3lxC2680eynY1e/72ofQh3sk9qqCP8N2MX8JmtUhywXI0fUqXjw1Tpp4kM7xYFxOIPULDA4KvQ67HXPnZzX4aiFlT0Ct7jDzOEWEhIv+Df3muhzrwOk5Fwy6dfcDRA0nTGV8JcKunGBnZPUfh17JKlaZ1q0/NnAsUJH2KtTngaPo0PUyBCdyKqkpB56JHecQpVhRRbjN3kkRaOazf/DWY2hqmwW3LgOueDb078j3u96/xX67V5Syq3628C3pCIaDfnp0TMlLb/+8yx+XZwKMiZu2C/YEq3YATo3Owc96pUKTe+EdwS8f2S+LPTseXcQNx7ItKyM4wcKf3kP6pUUamZnV825a5/aOsCuhzFit416FCXdlZc7WcLQOrJYl3W8qChyWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(346002)(39860400002)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(38100700002)(2616005)(8676002)(8936002)(53546011)(6512007)(6506007)(83380400001)(26005)(31686004)(82960400001)(6486002)(478600001)(316002)(66556008)(66946007)(66476007)(36756003)(41300700001)(2906002)(5660300002)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXZRMjBzZTJDTVpseVVKMVZxTVczdWwreWZPckNEQmtialpXMnVic2lvcHJi?=
 =?utf-8?B?K2RWT1dYU3VTWnhlQkQ4SEhFazh6TTZscG5xQ0RCZE94RjFWcGJOV2w0ay8z?=
 =?utf-8?B?Q09PRjRLUm5RM1hac1lWeFNZUFFRM2pmM21xYk9tSGVBdFprRU9jM3hPR1NG?=
 =?utf-8?B?Zlp6b3VJZmxJcU0wN2R4VWJjNHBuenVrQjVETTdGRnM4dExObjdZRSthVFhR?=
 =?utf-8?B?bTNzK2RhZU9nT21zb0hya1hqT0lLRkZLY0J4eWxrajFvelp1dlA4NjRrdzRy?=
 =?utf-8?B?dlVNZEhEcFFLQmhwdVB5VWVMN2RmTSszU0hWMWYxM1gxN2hxQjNYNFJtNDNR?=
 =?utf-8?B?MW40R2FkdGorbDBnSDRDaEoycW9vNmY4VlhlYzdIZmREY1JYdDFBZ00yeEps?=
 =?utf-8?B?MzNONi92dFhwT0NYTHFwV1l6MEgzSW9xOElQd2FPU092b2ZVTXZUUTlhVWhP?=
 =?utf-8?B?b1B3RngxTjYrSTkrY0JWNzVHdWZ4Y1dJVXZIQXMrdzNNdE15dU5qTFJ6aFRM?=
 =?utf-8?B?YTZTMXAxYzFDeTdwWHZVNlhoRnBZb2NEQ2crY2VtZjlJR1d0a01Oam42RnNC?=
 =?utf-8?B?bmdzblZQOTNUTkk1SkwrTlpoNkhjaWQzWGh1dU5KTVUvZlh3RmJUU2FFU1lU?=
 =?utf-8?B?aUlnZkdUcFZpL1RYYVVZVFhQRXA0aWxoMWpZVlhLb3VERFZHOGwyUzFKcWFO?=
 =?utf-8?B?L2QrWjlsSWdTd25BVXdqMmo5UmdXd3NUbnh0ODIzemNJa1EvVE1YVm1uTlg5?=
 =?utf-8?B?SU9vV2plSWp3bE43QncyWTA3L2I1UGN3bUhReFFwN0wwemlVekwrd0hwVk5P?=
 =?utf-8?B?K25oMFN5aEl5S2ljMHZQT0JVQmVGWHlJaC9iakVqS1hwTXlENWRtSnZsTkdV?=
 =?utf-8?B?Y2hRRjRQdzVCcnU0SU9Hbmxodjk3M1hPWDdnWGxzVkxnZ3VCWEFIYStLbU9L?=
 =?utf-8?B?ei9ZakdMa0NkTG90ZnJ0UjRTZEtmaFBCRWpiMDgyK3dHN1YwU241N29YaHNj?=
 =?utf-8?B?ZExpS09GUjA1MFZKdldQRk1QRm5mNnp0ZnhOazZVWEJ3OXBWR1VUQ3dvV3lq?=
 =?utf-8?B?ZEhRd1p5aWRWVzBpdDFhenRlZ0ZLMVlsT2ZPYkZaQ1cweDFCb0JNdldtTGJL?=
 =?utf-8?B?WDFuWU9LRUpRYUNmNE45cE54U05zbitZMjZGYmQvS2llQVRVRVZWZGNCY3V6?=
 =?utf-8?B?anlVbW9NSC96Q29QbE9VQ0xwaHpIcjBtcWpmWWV3c2JzWXgwK3RhQnlQRmhG?=
 =?utf-8?B?MHdXY0JZa005amIzV1ZGRGZSSUlRbjZZdnFWNUIzVGRGU1oxVU9WMURlVFN4?=
 =?utf-8?B?Um1EMHpoR2VGMFN6UFBxWE9HL3JFRW9DNVlrMVJOR015eVFFQlRxU1BHcWQ2?=
 =?utf-8?B?YXpaTWdHYlhwbkx1cVppV0FsVXZiTnVPaEdXQWwxcHFYRURCSHRqVmN1VGxO?=
 =?utf-8?B?eUw2d1p2Q1dQbytCRjZLZFl6ZklJUHRxNDNHNHVDQlhOWUI5cjdUNjlZK2tS?=
 =?utf-8?B?VWhVM2NrQVg5L1doT0xaOUFoeHdodjdja2RmNFRjRUNYL2JnSWhzMjd1bEoz?=
 =?utf-8?B?ZzlNYVBURGhhMEF1RGlpckUydmkrVW81Q2dCY3p4bU5aMnYycW94eUZJd0R5?=
 =?utf-8?B?VkRaNjY2VXFnYTNWaldiRnhVYWJUZ29zc2NHZmducHVBTGh6RlZuRzlDRG5P?=
 =?utf-8?B?Z2hMWWlYWmxMWUljQ2V5WHRxeVB0UW9MK2p3THA1c2FMT0VaSEp5a3phaDBO?=
 =?utf-8?B?V2h1SDlnSEpRTTBSQktHOWZwOEM0MmY0TWNkMzFFTCtpSGtERTZsUU5nK0dR?=
 =?utf-8?B?KzZkSFFXbTBxTVoyaXFRSVI3aEVHa0JOeGVJR1BvaHg4ZUJaenpMdzBGRm9Z?=
 =?utf-8?B?OVQyVHJsOUN2U0s0cVZsR004cXd3VjFVVTNDT3kvaHk5VGRkQ2d0REdSc3RF?=
 =?utf-8?B?S3RMUTByUFZwVlg4Slp4ak9Zajl5OTJMeVNlYUhDb0sxcGFNZ2V5QXo1SjNH?=
 =?utf-8?B?Y21GcWF6SjNSaXZlY1JGWDR2cjMzWjJMRWF2dHl5MjgzQkdlcnE2SWhWeTQz?=
 =?utf-8?B?a0wzaksxcmtuYnRVcVByeTg4YVNLK0JLV2JCblU0Z1VwODFERTV2SEE3MHZK?=
 =?utf-8?B?c3F4NDR0ZnlNUzZzYnVRZ09iNWJOUUFmRUpXbTJ0aVVJY2N5QVQvS08xTzZ5?=
 =?utf-8?Q?0tsnkyIB61WOpwxOI81LcDk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b32b554c-e760-42dd-78ac-08dbe49005e2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 21:32:22.9652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5x/axS7l6vxfHTgVF37pyKEWbsBJ6HAp0i4NtACcb4nvTPvtwhV9GEaGXBQwA+/MqolhRLGl8O8b/eVYTtbAKTtvXLlPmy8wmf2hn20cjpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4978
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/12] drm/xe/gsc: Define GSCCS for MTL
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



On 11/13/2023 12:23 PM, John Harrison wrote:
> On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
>> Add the GSCCS to the media_xelpmp engine list. Note that since the
>> GSCCS is only used with the GSC FW, we can consider it disabled if we
>> don't have the FW available.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hw_engine.c | 20 ++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pci.c       |  2 +-
>>   2 files changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c 
>> b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index b5b084590888..142783177e45 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -26,6 +26,7 @@
>>   #include "xe_rtp.h"
>>   #include "xe_sched_job.h"
>>   #include "xe_tuning.h"
>> +#include "xe_uc_fw.h"
>>   #include "xe_wa.h"
>>     #define MAX_MMIO_BASES 3
>> @@ -610,6 +611,24 @@ static void read_compute_fuses(struct xe_gt *gt)
>>           read_compute_fuses_from_dss(gt);
>>   }
>>   +static void check_gsc_availability(struct xe_gt *gt)
>> +{
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +
>> +    if (!(gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0)))
>> +        return;
>> +
>> +    /*
>> +     * The GSCCS is only used to communicate with the GSC FW, so if 
>> we don't
>> +     * have the FW there is nothing we need the engine for and can 
>> therefore
>> +     * skip its initialization.
> Is that correct? Is this testing against a firmware image being 
> available on the system or against a firmware blob being defined for 
> the platform?

This is post fw fetch, so it checks whether we have a blob or not.

>
> If the firmware is not available but was defined then presumably that 
> means that any feature that is reliant upon GSC is going to be broken 
> - HDCP, PXP, etc. It seems like that should warrant more than a 
> drm_info level message.

The fetch code will already print at drm_notice level. This log is not 
about the fetch failure, it is about the GSC engine being disabled as a 
consequence of that (or of the FW not being defined in the first place). 
PXP and HDCP should have their own checks for GSC availability when we 
add support for them (they do in i915).

>
> On the other hand, if the check is about whether a firmware blob is 
> defined for this platform then surely this code path wouldn't even be 
> taken in the first place? This can only be reached if actually trying 
> to load a firmware file at all, can't it?

I'm not sure what you mean here, this code path is part of the engine 
init flow, so we'll always take it.

Note that the main goal of this check is to allows us to define the GSC 
engine before the GSC FW, which is useful because the GSC FW is usually 
publicly released quite late for a new platform, while engines are one 
of the first things we define.

Daniele

>
> John.
>
>> +     */
>> +    if (!xe_uc_fw_is_available(&gt->uc.gsc.fw)) {
>> +        gt->info.engine_mask &= ~BIT(XE_HW_ENGINE_GSCCS0);
>> +        drm_info(&xe->drm, "gsccs disabled due to lack of FW\n");
>> +    }
>> +}
>> +
>>   int xe_hw_engines_init_early(struct xe_gt *gt)
>>   {
>>       int i;
>> @@ -617,6 +636,7 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>>       read_media_fuses(gt);
>>       read_copy_fuses(gt);
>>       read_compute_fuses(gt);
>> +    check_gsc_availability(gt);
>>         BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < 
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>>       BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > 
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 2fae45b9d88e..c09b51735ee4 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -197,7 +197,7 @@ static const struct xe_media_desc media_xelpmp = {
>>       .name = "Xe_LPM+",
>>       .hw_engine_mask =
>>           BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
>> -        BIT(XE_HW_ENGINE_VECS0),    /* TODO: add GSC0 */
>> +        BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_GSCCS0)
>>   };
>>     static const struct xe_media_desc media_xe2 = {
>

