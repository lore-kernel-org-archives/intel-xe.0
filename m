Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD668EE49A3
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 05:05:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70FF10E2D6;
	Tue, 22 Aug 2023 05:05:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C366510E2D6
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 05:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692680736; x=1724216736;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yE0I6tCkve1fs/ySN/3sMsl1xGnp83lr58SRju32RdM=;
 b=My0yp+te0DC3laKMq8C2faJTeJwpgpx0SuYe4i9ZySggKwBDDYUnhE/K
 GJRj55/X2A/w0s5DEcBZAWJ2JK4BTTRwp5AF4ycqGIxs+MPHs4RdndXoY
 ya3E1rlZaamR0hOcxEqCDQ9EuzNpJ+z4npzRFHsETt5FUcZ1q1fVNq7x6
 OPl4Rk5U+sHZTScZ7CGjONMarMREv4kRM9ioEhFHjRnmBzKjVfg1JLZRF
 s3/7nMm4roYOCdIdjm9TfPDDYf1i48nm/XEDjY8v8FfUiMaSVkSpOhkop
 2YOd4onyVfjtOZKSuFibIsRcsTnYMfd5jXxW9GZQE1794qXmW5PLh0kpw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="440146846"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="440146846"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 22:05:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="859754685"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="859754685"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 21 Aug 2023 22:05:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 22:05:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 22:05:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 22:05:34 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 22:05:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZI6qaDTdqKnIZoz5WPXRtNXhFroIbMD6UPjb+mH4JvZH8Jfq2nTit47kUUoMjpTMJ83rb20vQatjOTpkyOgzkTWafiSpsV7JHHCmXSzX8xz4hoo6c17ovjPZC/ZeliOY0Nt2Oe4adI1DDhUJf5OtjD1CP7O+BhYHMuRK7W0WTjaRGIV0taAyh72SNZNTMnSz8Vj03ZWwNPg4rhJoBtkQkDRp2A1cJ0SZAQOKKBereOWbqiUtdMrZoDho/xMeDl0Nudq9HWiT6l5614Z9LxxiIvX9AXUHULK2eNmm8BWsN4FVC/PbLqu90GKAcXaR09uR3HA+lpNuznXmIvVlbEysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9WjvPEoFKC4eaRRAUwsDawBDticWl+0XfuQhIz2vEo=;
 b=BXCDtE3T6BAkHNAAh3Of3fa4Ay3ffQJfrDT9ZdZStXFCQ+rv8ZG0eNDTPZ67wjvb+5IB+6vl9m3AO1XiwsnlCwqMlytHpnOxx3CZuH5Myvkwi/LojRW8D6DJVezhFxtndZUlv5S7H9m3lhdaNDNjn655of/G/CWf5FzGNqZYcB+kk54aNZO1VfrN5yfW3SMgGjeyiAMZXSw0Du07tOjJy/K16BrSLH8wBVwI2FVdIu/kQyHcpcKY2K3PkAnNZeidEDnhtX0Fiwl1Lqv9YS1yvJYiWfMU12RoiOjFNrA6LTgqzKak/TIWX3wMqtigQcQCk335ZvxTUlo4TK4q/UfcGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 CH3PR11MB7769.namprd11.prod.outlook.com (2603:10b6:610:123::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:05:32 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3382:a13a:ef37:f584]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3382:a13a:ef37:f584%5]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 05:05:32 +0000
Message-ID: <78d372f2-b51e-5b95-6432-2fe52b874cda@intel.com>
Date: Tue, 22 Aug 2023 10:35:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
References: <20230821120728.3871527-1-sujaritha.sundaresan@intel.com>
 <20230821120728.3871527-3-sujaritha.sundaresan@intel.com>
 <CY5PR11MB6211DF74573ECBDF8E290CBA951EA@CY5PR11MB6211.namprd11.prod.outlook.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <CY5PR11MB6211DF74573ECBDF8E290CBA951EA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::20) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|CH3PR11MB7769:EE_
X-MS-Office365-Filtering-Correlation-Id: 34dc2a86-1628-4fc0-fd86-08dba2cd6907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EtP/OmOrY4PbKz6eqAYHLE0yB4TDcU8bAdgUAjDSdHNPLrxX+FOY7WGRgdW37mFsrJmAEsLc8M4FRcca795oYtJznyyyPuR361N4NPBWpaNXpZfHoJdf/xcnoSxqW2Ot1iG4LBzHI1wRO27Uda+4fSGlWn7sAlXxTsPn+okWHDjj8cWE14ZUNJeoKRaJKLc6GYR/41UBVuY8V7yXqgVc/dD31NP1Ipke2+HUQf95s1MaxNX2CG4V9PFsbXeZxIn5LuyEd9Wysdm7J3ja1ZXDJIC6x3G4iiFeL3lgrpTmwRN94n5s910VvkyBinGBkg3D/zhcmadDHKCU65rJ3OMMzkuDNwobwn0J6klZoGoHHmYFFvYpk4kSLX6cmrOS1cjagk0ZFLNlxxOFMgOiRcfdGjG0AFEUAbISjRwW/4tbeV52uvoUfEuzceBNRH3aWNLol9MtDHI+nEidL0rzqfxzBRSfhooTIWyXzWG/MVCrjLCFNq9gEOOp3fJHQz01Bh1UYhKIl6u5HvbkN1J7oYoOzRi+uFwMFtdz5Qy8m1D89UZvzW67zMlY4+jdzOQt+KiIPwW6TtdZeoFowSCajZ5COOMA+nxtZ4hp7X4Fm8ERfkgv2C8jwG5YwaFBrqZjykkDiLIbvnK6WkPHsWXAA13ZZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199024)(1800799009)(186009)(2906002)(53546011)(38100700002)(6486002)(6506007)(83380400001)(5660300002)(26005)(86362001)(31686004)(31696002)(8676002)(2616005)(8936002)(316002)(66946007)(6512007)(6636002)(66556008)(66476007)(110136005)(82960400001)(478600001)(6666004)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUtJRE4vRFNYNG1POHZyUytWWnY1L2g4c29ZanlPeE8wZDEvc0JJMDYvdWsx?=
 =?utf-8?B?YTVLek45SXVQUXVkTjZRT2l4NzhTZjJicTJya1RGc3FRZnpnM2VSd0czT1ll?=
 =?utf-8?B?WVltUGZRaFRVMmtzcXJEZThJb0JZWWNmMDJTdk5Md29aUWpldC9Ra0xJQnpN?=
 =?utf-8?B?N0lYRjl1QUgxNk82d2cwV2NhelF4eHJ4R0Mrbk9hV3FvWHc4QnJIYXhCSm9x?=
 =?utf-8?B?RndSWTUvaXdNYTF4dVNZSmZwa3EyZURwNTI2QmZpQUU2TDRGam9MQUM2UXFl?=
 =?utf-8?B?aVh4bkdwM09tQXVDNXRtSmZoTHlhcFI4VER5WGhDWnM5QUwwV21OYW53NUxi?=
 =?utf-8?B?aGlyYlcxQk1Ua09OeVRNeU45NVNNdEU3M29RNmh1eld1bUw5cE9jVnk3eVFT?=
 =?utf-8?B?Q056dzBUSnpjWTQ3ZytnNVllY0ZCL0FpMFlQSzhWcFpNcHZpNTRjUlJKVzh6?=
 =?utf-8?B?NzZXT1o3eUxrSWRTVndBSGV5N1ZpZnNUd28vaUtYcWRNN09uU1BlVEtDZU51?=
 =?utf-8?B?Y3BFZXNLeWJMR2Jud1lEbTl0blY2RFQ2UVBVSlhDMld3VzhYOFEyRW5JUXZF?=
 =?utf-8?B?bHBVdFVoUE1tTXp2UFhWczhxeVJoenRjWWZ0TzZpU3llazRTOUt1SDR6bm9R?=
 =?utf-8?B?Mi9xQmJ3M3Vjekd0RGFRL0ZSc3VFaGNqQWF4WGlxZ3FjQ1NobEdxcjZjT0hG?=
 =?utf-8?B?L0JKUXZhc0V0bmhVdUw2ZDdZZnA1ZDZKa1A1VHUzcS9iNTErVmdkY0Z5Z0pJ?=
 =?utf-8?B?bEs4bkxUeFBWZ3RuQjdiY2g5WVNpUXFrOVkwSENmUG1pMzFWNy9lYlhzZ1Rn?=
 =?utf-8?B?TkZicGFXWDVIUzNvbUxMKzhqelcraW9uNTJVL1FOMzlRdWo3ZUN0c1pwRlR2?=
 =?utf-8?B?S3dXRjhjSk1rN1NCOFFESGhKL2xhZXJVNzNhbmtFb0krNlY2NHB2OHlMa0Nx?=
 =?utf-8?B?YlMzRElPZGI2YVA2cTN6cHhBM2EwdmlUSGwwd1BkRWQvWHJUb1d1YWI5RjVO?=
 =?utf-8?B?M1paZXZYWU5WVGliNEQ1YjF2bng5bEI2QU5pWWlKVGtQUUlQeTZScGJpMDRW?=
 =?utf-8?B?MDdBdmcxM3VqUERrcWVNY1d1RHltZ2x6NVV1bHllUlh0MVFsd1diSkVmVXJ2?=
 =?utf-8?B?RHZvREgrMUc2TW1JRmpKWTBkZE03V0s5L04wY21SZjhyMzRVcFJIYVBVbFJM?=
 =?utf-8?B?VUJGNVdtOEkxYTdRREdaNHV0V3dpcXB0QkIxMHAzTUdpZU9saWhMOElrZ0Fv?=
 =?utf-8?B?MWtlU1J6SnRISkF3LysrNWVVU09yRWcxTExtY3VaejNlMmVTdy9TRzNraFUw?=
 =?utf-8?B?VDYrLzVGaUw5Q3BoUkRCSHdKTURsRm1WTmhITDhKT0pYQVNIK0FoaDVlQlU1?=
 =?utf-8?B?ckwwdUluMmVHSnhvWXlhaVVIS0VMQStobmZPbUEya3BPQUlsRDdpcFhTeDQz?=
 =?utf-8?B?aGtPcmV2cmwxQkV3cU5BMU8rOWNNd1hadVRUTCszQkJiSUc1VC9KWEloSE5K?=
 =?utf-8?B?TWJzakdleHN2Y2M0QzNuV2RramtRbmFReHg2cW5FdjBtdVQwVmNFWUp5OW9U?=
 =?utf-8?B?N0Z5R3JIa3NON3VEVTJjVGhJTEF6ajFVaklKVXREb1pDMkJTenhiYjNkMFY3?=
 =?utf-8?B?WXcvbVNFMGhKY1RRYUlydmhWWlNoMEtGMnBIOWx2OGpObThneUQwYmY0ZCt5?=
 =?utf-8?B?Y0t2a2JZbDUwNk9TVVVVdFFUZ3BNeHIzUitkelMvRUFhQm5OT2xkN1p0QmVL?=
 =?utf-8?B?aWhyZ2pDQkYxVHcxeFJyQUVXclFMeGQ1ZXU5cVB4UkdvWmtkeUYwWkJnS3RW?=
 =?utf-8?B?SkJpQ0lOeDZTNzgxNTMvem9uREVhWUJSa0JYOUtnWjcrNGZlejF2L2VyeW0v?=
 =?utf-8?B?YnU3d0hzREZ2YXhMKzdUalhFUTY2RmFKamZJNzR3OFllRDJHaFJvR1dQbGJ0?=
 =?utf-8?B?ZGZLekhORVJaZi9IWkpSRG5aTEd3VGNlVUp3TFZPSmwzS3VLNHB4WWY3eEUw?=
 =?utf-8?B?YzVmWEl6SVBYTWVOK0NRWnRoWTVQcmh0MVM1c2wydmgwNzd0QW9sUDJsTElM?=
 =?utf-8?B?NnhZd09MRnlMdzRRYUZGRUVlMTdBVjRkc1F3SlVTaVFJb3NOdXhmN3loUGsx?=
 =?utf-8?B?UEFDaklsU3NnRlRHU3h5OHNhZGpSZDBWeTBmT0xBT21Dek1VSXFqRWhDUUwy?=
 =?utf-8?Q?+LWa5OMmbLmgUAuxm/KZ6B4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34dc2a86-1628-4fc0-fd86-08dba2cd6907
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:05:32.1045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6oifdQSlM1lDDd5awDqCOArk2n+IeuBfhkZ0M1iDrPPwgMFV89qPl5dlnLIJABLR0+v2BB0jU0tZru2Lj8IcUtZfB/hSCA1asTSc9DGlSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7769
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Sysfs entries to query vram
 fused min, max frequency
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


On 8/21/2023 6:55 PM, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> Sujaritha Sundaresan
>> Sent: Monday, August 21, 2023 5:37 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>> Subject: [Intel-xe] [PATCH 2/2] drm/xe: Sysfs entries to query vram fused
>> min, max frequency
>>
>> Add sysfs entries to query fused min and max frequency of vram
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c    | 55
>> +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pcode_api.h |  8 +++++
>>   2 files changed, 63 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>> b/drivers/gpu/drm/xe/xe_guc_pc.c index c03bb58e7049..d7e9609c74c0
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -20,6 +20,7 @@
>>   #include "xe_map.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>>
>>   #define MCHBAR_MIRROR_BASE_SNB	0x140000
>>
>> @@ -568,6 +569,54 @@ static ssize_t freq_max_store(struct device *dev,
>> struct device_attribute *attr,  }  static DEVICE_ATTR_RW(freq_max);
>>
>> +static ssize_t freq_vram_rp0_show(struct device *dev, struct
>> device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct xe_guc_pc *pc = dev_to_pc(dev);
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +	u32 val;
>> +	int err;
>> +
>> +	err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>> +			      PCODE_MBOX_FC_SC_READ_FUSED_P0,
>> +			      PCODE_MBOX_DOMAIN_HBM, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(freq_vram_rp0);
>> +
>> +static ssize_t freq_vram_rpn_show(struct device *dev, struct
>> device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct xe_guc_pc *pc = dev_to_pc(dev);
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +	u32 val;
>> +	int err;
>> +
>> +	err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>> +			      PCODE_MBOX_FC_SC_READ_FUSED_PN,
>> +			      PCODE_MBOX_DOMAIN_HBM, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(freq_vram_rpn);
>> +
>> +static const struct attribute *vram_freq_attrs[] = {
>> +	&dev_attr_freq_vram_rp0.attr,
>> +	&dev_attr_freq_vram_rpn.attr,
>> +	NULL
>> +};
>> +
>>   /**
>>    * xe_guc_pc_c_status - get the current GT C state
>>    * @pc: XE_GuC_PC instance
>> @@ -921,6 +970,12 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>>
>>   	pc_init_fused_rp_values(pc);
>>
>> +	if (IS_DGFX(xe) && xe->info.platform != XE_DG2) {
> Add this attribute only for PVC ?
Will fix the platform info for PVC alone.
>> +		err = sysfs_create_files(gt->sysfs, vram_freq_attrs);
> vram attribute should be per tile instead of GT.
> A tile can have multiple GT in theory, so associating vram attributes with GT is
> theoretically  wrong.
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Thanks,
> Anshuman Gupta.

Sure I will change it to tile->sysfs.

Thanks,

Suja

>> +		if (err)
>> +			return err;
>> +	}
>> +
>>   	err = sysfs_create_files(gt->sysfs, pc_attrs);
>>   	if (err)
>>   		return err;
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 837ff7c71280..846c99aba3bc 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -25,6 +25,14 @@
>>   #define PCODE_DATA0			XE_REG(0x138128)
>>   #define PCODE_DATA1			XE_REG(0x13812C)
>>
>> +#define   XEHP_PCODE_FREQUENCY_CONFIG		0x6e	/* xehp, pvc
>> */
>> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
>> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
>> +/*   XEHP_PCODE_FREQUENCY_CONFIG param2 */
>> +#define     PCODE_MBOX_DOMAIN_HBM		0x2
>> +
>>   /* Min Freq QOS Table */
>>   #define   PCODE_WRITE_MIN_FREQ_TABLE	0x8
>>   #define   PCODE_READ_MIN_FREQ_TABLE	0x9
>> --
>> 2.25.1
