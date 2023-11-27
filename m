Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD92C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 03:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B76610E163;
	Mon, 27 Nov 2023 03:12:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B366610E163
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 03:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701054751; x=1732590751;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DcoUPpZNUccsqhVTZjs9CfPoWqumijMrXfGwZljYx9I=;
 b=R/C7qwPWsM3nlMt3vtiCiKf1wadz6Z5G/9E2JGyP/JGf0Cc3WIYLUOT1
 BGwRbVuwlJxV/go+1Xw+nPNA7HOf5DBrruoTdW6yOkql7+1U3iMlUlUVU
 Ks1btTwNYAZo9Mr7J+yVY43vu2R5L7Ri9+Ffy43XNPqsxYLUo29P8/oyv
 7WkfDxDirB9ve4XATAsnnCdobhPDcIccDQ3lVYZUoeDhI2UvM53EGinoX
 4adIfTJWiQPZv3VQLrXJzRdSGGZ0e8yS9IMi7I46Z5JpoalEy/nmYCs4A
 P87sUeDQ3yhDPH3WQkwQZH1AAc5nfbeF7aAeZ9y4e46Qa4qQpqLi0Cm1f g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="372783913"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; d="scan'208";a="372783913"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2023 19:12:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="9493382"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2023 19:12:31 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 19:12:30 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 19:12:29 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 26 Nov 2023 19:12:29 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 26 Nov 2023 19:12:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNjQ1LI/RBqUaXxMoOx+MC+GdqC5tRPMztCYyKtB4JFsl1bqMbxJXxwzsb5xyXwnC78uBYyo3lHgbYrPx0NukAM6rx8Wi6z6LzskMFnmJ2BY66hxoNZCSqpmtLlwyMUbwTjajo8i8ZU+hLpagh9P+svJ1o+k4dqubFqo6IWVpdtDfNjt92OzAK7Fb3RsLr27nNLJ4wlcrcqmJJKXqcBnP+jldU+fvdKDX1bO020LFrs9KdL0d78wE+OdeeZwY7a1o2L4eQzXzPpWvufI6jAz9OYojjmAu37zFLWb0vmlrL53XHNtslSk8sTwzkpyG70/MZq5Ca2MWJ2tSLPbMQQRNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCsXFZoUbnGiPb8Brha4nzdtiwKNW8GmnXepRdxs5V8=;
 b=d1/0UR05sHlOzI2SM3lnaIkydXe8dsxzI8Hzn8snWuGSvRwd5Q5/vGkrQ4Ag0QKP2CmratF5mjOiFHH/mSwSduBQdMTEkhbtUIfHmZ4brpxBwolQ7wmBIRbLvgFpd+DQo4TjlQ52f6Oqed6KCrL7yUtGZqQWIauqwuijK3SRlTeG7rXFK45Gu2u2/faetWNf0vVD/jmtFRJPT03He7+vqC2N4p1sKx1kaNnTy77EJAxTgPOX/BcBSuJGajYlCepYlefU/KHy4QDjW2Dj/aboPxZFXjg9FkwrJKP+35WWkz0j/8hPtE370aPCJ9Bjx6oMNefd/XtIu+0nm/tGbIGUbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB6605.namprd11.prod.outlook.com (2603:10b6:510:1b0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 03:12:27 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 03:12:26 +0000
Message-ID: <e6ca709c-f456-479a-81c8-5b1de1cee6e0@intel.com>
Date: Mon, 27 Nov 2023 08:42:25 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
 <20231121100906.3587649-3-himal.prasad.ghimiray@intel.com>
 <0876b09852ce6391b04be329692a29b161ec5154.camel@linux.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <0876b09852ce6391b04be329692a29b161ec5154.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::19) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB6605:EE_
X-MS-Office365-Filtering-Correlation-Id: c8884125-8424-4e95-f231-08dbeef6aeae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kuy9b2UB+SquwrN5aLF4rP6jIjNXZE0ESSoDO11WeuBr8vfG1g2A7Rl32KLhLjk/JYzFZAz0GfwxuoP4YB2+vfG7U/jYdlEDVVVuC0ftr2f75dU3l9b6Nsqh4WbQEi4MgwZcChrm5OlFCu9L0MiQ5YjqA6AKFyCeG2XQpGXs79s3mglgJcIhSY0R6cnT55vyL6tUNVkVmx+lZ6nIofn9TRTd2aESXLAx+jCBCYLNpoGzzwSYmDhb2lQc99PNzbshpsQ+walB+QCYLVw5mHwWu9GBttt64yEWSmva26d9Ez9XzFOZCZTEB6ZGqf5p4JoD0s7SWCUJtlLzZv0LX+DThGeKFFzKQkFXgLsgwyoZ6AEbKgH2+mP+Ej+Fvoc1O0EgLJaY6IfBJk6iZ92i2CVj+Id0hfVXajtMuA77wuwQ1ls5z/vnchnLbtC/2s6WgM0cSS0JCoskSHO34kS14rvDwpdxuh0ePyEM5l8jTUZlTxWGmg5EMMMtwzlXe9IJauIO5G8BAPFAbZCWTpHuYg8GCk3k/rSvOl6Skicdw824iT9NzrQxNp9RDzOrbCGEN3HU8u42vpMJBQ9K0mcgMj1DIMPJqk5Ve4PU61pGmxXuDPt0fCkT/++XbUhRFVlNUWL1Io6wJ9HhiRGH/e/Q5WNZuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(38100700002)(31686004)(66574015)(8936002)(82960400001)(31696002)(6512007)(6506007)(8676002)(316002)(66946007)(66556008)(66476007)(6486002)(86362001)(478600001)(5660300002)(53546011)(4001150100001)(2906002)(41300700001)(36756003)(26005)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHhxMEhlNlYrUjUzdG1NbDZSY1BtY0NUcW1pMkdldkZtR2NMSUxDQzBmaktN?=
 =?utf-8?B?OEZhNUJtNFFUM08zZldOR3RyMTFadTJKN0lmSUExSFhSTHZ6ZG5NaUhBdVQ3?=
 =?utf-8?B?ZzBoMUZSOEZLdHNEaXVUbkNyKzZoZVFjTUIwT3h2T0I1ZlV6emlnY2ZBdXRv?=
 =?utf-8?B?UGxRTDBhMXc4alhNVUtXaGFjUTI5TnZ0aC9RYTJ5cms0NnFqWnRRUDFIcUd3?=
 =?utf-8?B?QllNclhyZmc0RFlGQnUrK0MwWk5PWmlDeGh5YzRMb0Q5eS9XbjFOOVJMRUpj?=
 =?utf-8?B?dTFTN3FWQTJjQmVzclQ5bW5oRXdsRWdDZGpOYVRkY2tNOG1Fc3ZwMTRFM1VC?=
 =?utf-8?B?Q0RpUVdIcHRZNnBaUnNEWDcwcndRTWcxNnBZTHExK2xRU0k5SnRWbWhaR2ZV?=
 =?utf-8?B?c3VVdUREeEk2TVFjZEJhTzZPTGs0SzREZ0hOV0F0bG9pQ0FtOXJoRnAvSlF6?=
 =?utf-8?B?TGJ4NXZMMXdxUFYvYm5sNFRldHFKK2FLYm9OYzFoOGRXTVFJYUxGcG5sWVhp?=
 =?utf-8?B?dGtZMndkMGo3NkR1N0pVWnBUUG1kdFp2WVRkSE1xaGtGWEQ3KzVBMWcrck5M?=
 =?utf-8?B?ajZyT1IvVy9yUzQ1N3RoMGY5Q3EvSVZjWVB6N3BnVkpEb3V1b3c5dDlkLzRn?=
 =?utf-8?B?TGc2U0kwNG04UmpWamc1c2V4NFp2L3djYjF6cWMxYUlrQW0vaExEOWZyTDBV?=
 =?utf-8?B?NXRwdTZWUkMrVkVIblpaKzNidGh4TGkycjllUzJvTm1LVjVNdEI4TnVOc0N6?=
 =?utf-8?B?QkF0MHRubXp6djZaaFhBVTNxbW1wRk5pVHNUS0lESnJzRlY4NDgreE14L2l4?=
 =?utf-8?B?OElsSkJhZ1JHRTY4RGpqby9NcGJwYmVzNEt1Z0Z1MEF6RGFsK2dYVlFoQi9Z?=
 =?utf-8?B?ZTQ3eGc0bFhZczhuVXZVdk9hTDlYQ1ZLMm9La255K1gwc0xnVi9LZXorUVRF?=
 =?utf-8?B?VUhBcy83UjhMQVdwU1d1dldheEZacW8xdDVMVlE1NzM0aDFlTS90Z0IrYmpE?=
 =?utf-8?B?ZCszNVhHVlRkYnpib0JzNGR6Y1BVeTRPWnRhYUtoTkNyd1l5V0diT0RhN3ha?=
 =?utf-8?B?WDNWd3VWOGgxTnhpQ2lpOEhpYnZLUHh4T3d3dVUrY2hSalBWNHhPdDJkU1Rh?=
 =?utf-8?B?UGtWSHBabVRVcm4vTGZwaE15M3pEanBGb1R4RUtheWZISDJPVlc0UWNPdzlu?=
 =?utf-8?B?MFVEOWR0bHRZQTlGaEorWkVXZmtQUzdxS0JkV29XM1BRVzN3bkdVS0pxNzAx?=
 =?utf-8?B?YVNBc3hTNENac3RkRGNmcjFLZkpvc1ZKVENDaE1QOHBmWlZZVGZYNE4yYjM1?=
 =?utf-8?B?NmpvdmVGMUZ1eHVYTk5mNk5PL2g5dXY4R0RvUXA2aG9HT2hJMWwwSE00K1Iy?=
 =?utf-8?B?TjA2U2JSQXI2aU45NXdaUDFFL1M2RUNnQ3c4Y3FZVnYwZ0xYTnloMXJvQXhU?=
 =?utf-8?B?V1NQYnhrVGdQR0pvcGRiRE55UDlMUXpMenYwRmtEQ1l3ZWxRTmJvYWVqODda?=
 =?utf-8?B?aDB5UGlnTlZJSnI4LzN2WHdlY1BhQ29ITUpPZzJTZkJqMVJQSnNjb1hwbzNK?=
 =?utf-8?B?QnVHb0pkWFJWL1VaY1R0N0REb1FCY1pBWVRPUzk2NzBYc0NFdS9YTXNmcC9y?=
 =?utf-8?B?ZjJpREM0Uzg5Wm1SQnFkQk1mQmpiRzJqcnNrY2w5VzJ5YUhWb1B5U3V1ZGRE?=
 =?utf-8?B?a1UrVDQvQ0FlNCtHa0pSNW5wTFdqV2p2RGwzRWlBcmJzWlcwR1ArdmY1TWYr?=
 =?utf-8?B?YWczdWkydTNUVTAvQVpVRy9LSDN5QllCbGJiQTdyRGJOcWM0NXRhcExjNG5K?=
 =?utf-8?B?NWFiVWhxQk91OFlpN1dxc3ZJeWhTb0J4MVhIblovK2FPWjY3V2RGa2lsRTI0?=
 =?utf-8?B?VUhUNXRKdU5lVnNWK1VpY0NEeGpnNXZXVDRoM011aFhOM2hOMnRQTEhsSUd1?=
 =?utf-8?B?Kzc2WmpkR212WS9XdDYyRk8vaUR0YkRYaU5NWUs5bDgyeDR5cUlLcnFyVUNF?=
 =?utf-8?B?clR3N0svVWI1MnNndnJiQURUVUNOaCtKdmpQdDlCM0ROVFcyRkpVMVZFNk1r?=
 =?utf-8?B?K1Y4SUlzbGdlSVAwTE9jYWxJWEdPNDJ0QjhrZWpYZHdESHQyZEkwMnZrd2gx?=
 =?utf-8?B?UW5HVHFHV1czL1hyOUtVbmxXMjlFOHRvK3ZtdVRUSVZQUkRxamJ0aFZTcVhi?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8884125-8424-4e95-f231-08dbeef6aeae
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 03:12:26.5998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLvlhN9DnHQnOyPlSqkZ5btfxgzUSP3zY4G1QVqP5EFGSL0lErebdI5ImTPWC89oWOG9zQyK3Z/5Xv1BW4F36WOBNcs6r7dbMHTo7xH5jiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6605
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v2 2/6] drm/xe/xe2: Determine bios enablement
 for flat ccs on igfx.
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


On 24-11-2023 16:35, Thomas Hellström wrote:
> On Tue, 2023-11-21 at 15:39 +0530, Himal Prasad Ghimiray wrote:
>> If bios disables flat ccs on igfx  make has_flat_ccs as 0 and notify
> double space above                 ^^
Will address in next patch.
>> via drm_info.
>>
>> Bspec:59255
>>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray
>> <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
>>   drivers/gpu/drm/xe/xe_device.c       | 30
>> ++++++++++++++++++++++++++++
>>   2 files changed, 33 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index cc27fe8fc363..b642301947f5 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -142,6 +142,9 @@
>>   #define XEHP_SLICE_COMMON_ECO_CHICKEN1         XE_REG_MCR(0x731c,
>> XE_REG_OPTION_MASKED)
>>   #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE   REG_BIT(14)
>>   
>> +#define XE2_FLAT_CCS_BASE_RANGE_LOWER          XE_REG_MCR(0x8800)
>> +#define   XE2_FLAT_CCS_ENABLE                  REG_BIT(0)
>> +
>>   #define VF_PREEMPTION                          XE_REG(0x83a4,
>> XE_REG_OPTION_MASKED)
>>   #define   PREEMPTION_VERTEX_COUNT              REG_GENMASK(15, 0)
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 8be765adf702..07a3e4cf48d1 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -16,6 +16,7 @@
>>   #include <drm/xe_drm.h>
>>   
>>   #include "regs/xe_regs.h"
>> +#include "regs/xe_gt_regs.h"
>>   #include "xe_bo.h"
>>   #include "xe_debugfs.h"
>>   #include "xe_display.h"
>> @@ -25,6 +26,7 @@
>>   #include "xe_exec_queue.h"
>>   #include "xe_exec.h"
>>   #include "xe_gt.h"
>> +#include "xe_gt_mcr.h"
>>   #include "xe_irq.h"
>>   #include "xe_mmio.h"
>>   #include "xe_module.h"
>> @@ -342,6 +344,29 @@ static void xe_device_sanitize(struct drm_device
>> *drm, void *arg)
>>                  xe_gt_sanitize(gt);
>>   }
>>   
>> +static int xe_device_set_has_flat_ccs(struct  xe_device *xe)
>> +{
>> +       u32 reg;
>> +       int err;
>> +
>> +       if (IS_DGFX(xe) || GRAPHICS_VER(xe) < 20 || !xe-
>>> info.has_flat_ccs)
>> +               return 0;
> Depending on the outcome of the iommu discussion we might need to check
> for iommu present here as well?
Sure. That makes sense.
>
>> +
>> +       struct xe_gt *gt = xe_root_mmio_gt(xe);
>> +
>> +       err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +       if (err)
>> +               return err;
>> +
>> +       reg = xe_gt_mcr_unicast_read_any(gt,
>> XE2_FLAT_CCS_BASE_RANGE_LOWER);
>> +       xe->info.has_flat_ccs = (reg & XE2_FLAT_CCS_ENABLE);
>> +
>> +       if (!xe->info.has_flat_ccs)
>> +               drm_info(&xe->drm,
>> +                        "Flat CCS has been disabled in bios, May
>> lead to performance impact");
>> +       return 0;
>> +}
>> +
>>   int xe_device_probe(struct xe_device *xe)
>>   {
>>          struct xe_tile *tile;
>> @@ -352,6 +377,7 @@ int xe_device_probe(struct xe_device *xe)
>>          xe_pat_init_early(xe);
>>   
>>          xe->info.mem_region_mask = 1;
>> +
> Unrelated change.
>
>>          err = xe_display_init_nommio(xe);
>>          if (err)
>>                  return err;
>> @@ -390,6 +416,10 @@ int xe_device_probe(struct xe_device *xe)
>>                          goto err_irq_shutdown;
>>          }
>>   
>> +       err = xe_device_set_has_flat_ccs(xe);
>> +       if (err)
>> +               return err;
>> +
>>          err = xe_mmio_probe_vram(xe);
>>          if (err)
>>                  goto err_irq_shutdown;
