Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC70C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 05:23:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813AC10E7E3;
	Thu,  7 Dec 2023 05:23:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A0C10E7E2
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 05:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701926613; x=1733462613;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cv4piaYHsk8Nm52M7IxlRLac1y98R80uRb3h4FE7scg=;
 b=XnQvSoQNgFPtSXIIXoD8L9buqplRXPJ68EoAZAToUCEU7LYpFuHELN8C
 9GA6ZCyzflUeKkcnMgtKDmT+C7gbZQGAB4h/fUnt3LCZLatjgqy1L0bJn
 8y/9i/ljyf8VC/c4fznlOGIe2oCi54uSOxRBHb5NSqLW/Brs4iK2Na46n
 YxST+6N6BNFqJYH4sDnoele52t9FtZTuDEgAInWf+5NF3cxdORjW0F8Wb
 1cDpMXQ/hVZlYdj1gK6yOHTdRa/xIOaJZOy3sOh1nQiqneJsL/aX+37s9
 scQBzv1LKjWV6sSoK8evgMG+fMkw9M8n9tfkJLy7s+pYFu1HUbgkdQic1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="7482069"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="7482069"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:23:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="842086049"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="842086049"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 21:23:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 21:23:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 21:23:32 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 21:23:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/MZ30WTngllWYD//q3jFR2NmQEHeXcqa6mDwfx3iaTXobvpWSxD8TMKzVOzRAbg/mkQ41SqB2XJ6FECQS2BX3BLLQ3rNxgpZSZUxx1LDXwB0fEH+rtEV1WBcXEBm1nTppaCP2J4EU4JbPgn/mSuJsP1/jBoGAIFCMbqbxQzm/jVnAKGo2nNgzYvflLuqzpQyt5fYWh9GRUE1M3ldW3PG3N0U6qsus2Bmat43I12PHCLIgOonTFL/RFT8u/F0/+ZjEWQlmccMjV729hppIsdoU0hnFQoyjvAm/DdOx4W8WdgYq+EAwh9RvL/DVPlkpJg+VoDjhmLj5upotcoZpiOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBmJXBv2dYAyq8F/SWWhu5eE3Tmgch1zqoqBZDJVO7k=;
 b=XwQytc548VLQOF+a2GBK8+kPceQHxI5XIXvuN7HGl7vB3zrksdZQDvjONZiHlWzUhhexOKFWHqBNYFR0dgQtAYZRKxDWSiYmipG72EkVcLuKztfLe2d6peFOTk84oQbp6lxMyfzOb2EwlyD6z3fVIfj25PcDmKGQINFrauvDEwFne76zM6xyLjEhJFUbhvWJOtTAU1ONrNdQeUhLkwFfmfZHi6xc3P/xxUO1xTU5v1Fp6Cb9k67aUXG5Zk1P1iFFtcYc99j508+Nrs1FeIeuZdgk9iFz8Z9jvzwy09qNSjzlgm4Swf/KCDakk3XNj4B2tNAeybxj0uW9qDmetb21tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SJ0PR11MB4798.namprd11.prod.outlook.com (2603:10b6:a03:2d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 05:23:30 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 05:23:30 +0000
Message-ID: <1d85504a-0717-4b4e-9d35-be4bcb5adf3c@intel.com>
Date: Thu, 7 Dec 2023 10:53:28 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231205213659.179813-1-rodrigo.vivi@intel.com>
 <20231205213659.179813-3-rodrigo.vivi@intel.com>
 <7531590f-11a0-440a-a222-bb9d9a01438e@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <7531590f-11a0-440a-a222-bb9d9a01438e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0209.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::20) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|SJ0PR11MB4798:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f21c47-8ca1-4993-785e-08dbf6e4a5e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jqNZY7XrTzppgB2e3e1vinz/Um0oRxoTCmtDd5awYL75BuXfg9q3P6QmzJeJ7LLMjvLE63rDpmEZchWg4u3osPfQ6fgS/tZJ5BTj7E4+OkgYdjaeRMYmdAbAC/COtCZFIw5PX9UaSHbe1dqrNkp8ruPQHf5rcVD4WKMkImoTKz0aeorGDww61SprXxQJS8Z6c/M0uzjVcCnVhoM074tErju5HkneiGaMySM3vtqCJtCcorwwf69nLTcpd1BHShYZQzBs05/oGdzvaYjdDKiyBerbLo3IrGpyS+yPCPXRPOrvfTK3+0VjdI5eDxosIC2emIyYAryojEb4hmx6WAQrRRUFyBi4PZUiSJlz30wR7BEvj3pZ6Qbw2b9g63aEUOg4/g72+LX13SeuN7ry56Cx3r4Nzt+7S1W/FI7hflzUelOaagMQFbFCCxNAFfz9M037NvldrdZzlcdmwCb4/O9GH11fyLpUARlNzsA0aLSOcr26fTY2dQiz5dKrTllmctBofTygQUnfda3vJEWZdplmLuYW8O3tPtuLK8X8RB7Jni/6oAqheu+55NqsnhA6t6Ur+ExE+IHiHywC+gJCiG1H7+0qfnjqKxaL2BBRrpME9btv1iZrD5YG9KRr7ulGxMt06oU13RIIfJiT9JV4IOKpocFfVpE4DrqUiT5h57wqIOU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(82960400001)(38100700002)(41300700001)(86362001)(31686004)(31696002)(83380400001)(2616005)(6512007)(53546011)(36756003)(6506007)(2906002)(8936002)(8676002)(30864003)(6486002)(478600001)(316002)(110136005)(26005)(5660300002)(66946007)(66556008)(66476007)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wk9MWXU5MFkxaHRMRDFPNit0ZUJHSG9ROW9TYUhLWTNCYXJMMDlOL1FOTVNS?=
 =?utf-8?B?ZitRRE5WZkk1VDNRSDRGckZWcXlMSE0wRjRkYUhLcThQVkNsRlVFc0huNU15?=
 =?utf-8?B?OFRtZEhkMkhBVkpSTERoMklsVldSWTB6TG9kNU95emFqZHNvSm5HVy92N0dR?=
 =?utf-8?B?QW9aSmhEMldlTFRPOU4vaVV5cVJFM1laZ1RDTDRDWFFTSVZRa2hBeGVWN2FJ?=
 =?utf-8?B?MWh6VHBXVE5JNjQrQ3N6aUZLNDN0WDdaa01hc3ROcDk1NTV4WWFmNFVlTm1B?=
 =?utf-8?B?c1ExRzZWWE5tcTdjRXN2UWtPcTd1T28xTURmaFpvSjF2N0d6b2hlekhrWUZI?=
 =?utf-8?B?cXpiMTR1bnFJUnN2ZUxSTHhrQUwrblRVY3diRHorcGN0WVpMNFBzcEVULzlC?=
 =?utf-8?B?a2swcHZHclh5eVhCcWhtWk83NndSaVAwZjlpUlM2dzIvS3RVUHJEMlNQQU5v?=
 =?utf-8?B?Y0hGVCt5MmZVeGhiQ2hnNkpXZWNTMDdEZnExQW1IQnlXd2E1WUtMRXoxY093?=
 =?utf-8?B?M0M4a3N6aDE3SC92dnJEeTkxcjhTVTlOZUM4NEVSdUg0Q3RkSHBYdXpnc08v?=
 =?utf-8?B?UllwSEtaVUlMNE1iOFpBU2ZpRzQ0Si9WSENiL1MwNjJuUkFsT2NCanVZaW5j?=
 =?utf-8?B?Tk9QOHlNL0l3eFJnUFJkNVVPV2lZNmtYVzFiVlpWSkJjY3ZnRHVDTGhhekJr?=
 =?utf-8?B?dndMVVh2WDVyVUNRU1JkUEtJK1lQTjBUY2laTnNvd1JqWUl0Lzk0OTdtN2lJ?=
 =?utf-8?B?RHFaL244WHZqQklpQzMvTnArME50T2xZbTBXZVpWUHNKYzYrb3JCS1BKZEd5?=
 =?utf-8?B?aGdYNUliWGtrMmF5MEZMRkxSVnRsd3hyOC9kcjB5cWNKSnUxcTlodVZqN3A4?=
 =?utf-8?B?a3lVMS9BbTRJdjBBYkhUWUlxNEkrWDg3MTBqdHZFR1c0ZXgya2ZCMWE3WnZu?=
 =?utf-8?B?eTc1QzlsMTlBeG9iTEhSd2h1UzlOTXgxejR4a0tta2hHTmNkMUg4OE5TZ3l1?=
 =?utf-8?B?SStRM1NXRjZETEE4NGVLTGpBcjV6QzFIMnFKMHdOQlJTTDJUUm5FNWEvakYv?=
 =?utf-8?B?MUM5RVROTmxyaEk2SzllTldUaVh1VHkrSldCbi9WNlcyQmdmWlkyWVUwRTR2?=
 =?utf-8?B?STIrNDc1b0ZxR3BTOTlSaG9ybXZCSFBzV1ZmQURpQkJlajQ4QmIrbGV4TWZX?=
 =?utf-8?B?SENmdld3Q1ZIU2t2MGZiSTdVUVhhaEtGVUxuRFYxWVFSWFl1ZVBaSGo1YUlR?=
 =?utf-8?B?dHQ4Z3gvanhVOUJmSFFjaFFtWWNmZ2JnOHltZUVaelN3a3ZsbUdISVgvL0JX?=
 =?utf-8?B?U3lTQXBrMHZXL2w2TDJDSStWK1hPNUJGUnV6am5EaXBac1B3THNsMkE4MXhv?=
 =?utf-8?B?M1JiRVRUK3ZBNzIrUGtFVGdSdjMrY1A4N2tXUlRKRzZaOHc5bWlLQWRteEhR?=
 =?utf-8?B?dzg3SzFWVXRvb043c1B0dk9jRE1FMnVSN0pydU1rVkR1d0d3MjhmNy9jSlpt?=
 =?utf-8?B?b2d0VGYzb0dBSlZzNzJzZXpXMzc5WUFXKzZqMXdJS0ZOK3dwZnBqc3RpanFG?=
 =?utf-8?B?YzZtOCtOQmZGZ2RXWnhTZ2I5aytVU0dYWDJVMldIVnR3cEZyZXRha1BoWndN?=
 =?utf-8?B?bndsd09zWHlFNVlWUmxINDk1STdYdzErTC9EcTZNT05NOEx4VkdTajgyeGpQ?=
 =?utf-8?B?SjhyRGVoRXJ6Si9ZN0VnYkxBcDIrcEdPMWtGcXFyRkNpR2orUTQyaVF1MGl1?=
 =?utf-8?B?Y2w0M0JMNWdlM3FPSDBLaDl5OGRGVkpRSFVMRDdTYldIWkNZNnFNd1VKdGRw?=
 =?utf-8?B?Q2g0Yi85Y1VSdmYwUWluRDN6cTF0aFZoTjVvSkwwN2F4L0NKR1IrNi8weUxF?=
 =?utf-8?B?Rk51blIwZTVvcTRENnhiOGRqWDdmYldsT0RSZTZXUVA0V3ltVUxqQUg2MS9M?=
 =?utf-8?B?eTVzZG9FY3IyQThaUlRHVGtKUXhPZDNnYWlCZlR4R0VSWmpmVHlYZzZOcHBa?=
 =?utf-8?B?YzlPOG9zSFp2dlpNeUZxODNOdmhOSzR4YVFDbitxZ1Y5dkt4WitMNWI4cGZa?=
 =?utf-8?B?dnp2SHlybnBRTWl4QXhjM3ZpMWhVZzEwUHRHdVBycnlkT1B5ZXY0MFQvMzcz?=
 =?utf-8?B?RE9WRFFOYXV3VzBaTGZrZnhvS3FtMkk3ZUFDZzBJa1VTWjBIa2ZuNmxHSUl0?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f21c47-8ca1-4993-785e-08dbf6e4a5e0
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 05:23:30.2154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2q/2bv3MWbYG4iP1zusvMFPXM1fMLyo7rGefbfuSOvMhG2v81wd1YCgod3hLRPcOdcFEfB1c9IJf0nO9EM7djlchipgZ94bSOaUnKrDQAvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4798
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Add frequency throttle reasons
 sysfs attributes
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


On 12/7/2023 10:44 AM, Riana Tauro wrote:
> Hi Rodrigo/Suja
>
> Small changes
>
> On 12/6/2023 3:06 AM, Rodrigo Vivi wrote:
>> From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>
>> Add throttle reasons sysfs attributes under a separate directory.
>>
>> /device/tile<n>/gt<n>/freq0/throttle
>>             |- reason_pl1
>>             |- reason_pl2
>>             |- reason_pl4
>>             |- reason_prochot
>>             |- reason_ratl
>>             |- reason_vr_tdc
>>             |- reason_vr_thermalert
>>             |- status
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile               |   1 +
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  12 +
>>   drivers/gpu/drm/xe/xe_gt_freq.c           |   3 +
>>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 254 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h |  17 ++
>>   5 files changed, 287 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 3bca43cdbe3d..c4559590b256 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -77,6 +77,7 @@ xe-y += xe_bb.o \
>>       xe_gt_mcr.o \
>>       xe_gt_pagefault.o \
>>       xe_gt_sysfs.o \
>> +    xe_gt_throttle_sysfs.o \
>>       xe_gt_tlb_invalidation.o \
>>       xe_gt_topology.o \
>>       xe_guc.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index d318ec0efd7d..19d00e4f0a33 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -463,4 +463,16 @@
>>   #define PVC_GT0_PLATFORM_ENERGY_STATUS        XE_REG(0x28106c)
>>   #define PVC_GT0_PACKAGE_POWER_SKU        XE_REG(0x281080)
>>   +#define GT0_PERF_LIMIT_REASONS            XE_REG(0x1381a8)
>> +#define   GT0_PERF_LIMIT_REASONS_MASK        0xde3
>> +#define   PROCHOT_MASK                REG_BIT(0)
>> +#define   THERMAL_LIMIT_MASK            REG_BIT(1)
>> +#define   RATL_MASK                REG_BIT(5)
>> +#define   VR_THERMALERT_MASK            REG_BIT(6)
>> +#define   VR_TDC_MASK                REG_BIT(7)
>> +#define   POWER_LIMIT_4_MASK            REG_BIT(8)
>> +#define   POWER_LIMIT_1_MASK            REG_BIT(10)
>> +#define   POWER_LIMIT_2_MASK            REG_BIT(11)
>> +#define MTL_MEDIA_PERF_LIMIT_REASONS        XE_REG(0x138030)
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c 
>> b/drivers/gpu/drm/xe/xe_gt_freq.c
>> index 769d59441988..39268a9c5b6d 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>> @@ -13,6 +13,7 @@
>>     #include "xe_device_types.h"
>>   #include "xe_gt_sysfs.h"
>> +#include "xe_gt_throttle_sysfs.h"
>>   #include "xe_guc_pc.h"
>>     /**
>> @@ -214,4 +215,6 @@ void xe_gt_freq_init(struct xe_gt *gt)
>>       if (err)
>>           drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: 
>> %d\n",
>>                kobject_name(gt->freq), err);
>> +
>> +    xe_gt_throttle_sysfs_init(gt);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c 
>> b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> new file mode 100644
>> index 000000000000..1132e827f1c1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> @@ -0,0 +1,254 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include <regs/xe_reg_defs.h>
> Unused header
Will remove
>> +#include <regs/xe_gt_regs.h>
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_sysfs.h"
>> +#include "xe_gt_throttle_sysfs.h"
>> +#include "xe_mmio.h"
>> +
>> +/**
>> + * DOC: Xe GT Throttle
>> + *
>> + * Provides sysfs entries for frequency throttle reasons in GT
>> + *
>> + * device/gt#/freq0/throttle/status - Overall status
>> + * device/gt#/freq0/throttle/reason_pl1 - Frequency throttle due to PL1
>> + * device/gt#/freq0/throttle/reason_pl2 - Frequency throttle due to PL2
>> + * device/gt#/freq0/throttle/reason_pl4 - Frequency throttle due to 
>> PL4, Iccmax etc.
>> + * device/gt#/freq0/throttle/reason_thermal - Frequency throttle due 
>> to thermal
>> + * device/gt#/freq0/throttle/reason_prochot - Frequency throttle due 
>> to prochot
>> + * device/gt#/freq0/throttle/reason_ratl - Frequency throttle due to 
>> RATL
>> + * device/gt#/freq0/throttle/reason_vr_thermalert - Frequency 
>> throttle due to VR THERMALERT
>> + * device/gt#/freq0/throttle/reason_vr_tdc -  Frequency throttle due 
>> to VR TDC
>> + */
>> +

Also need to add a device/tile#/gt# here

>> +static struct xe_gt *
>> +dev_to_gt(struct device *dev)
>> +{
>> +    return kobj_to_gt(dev->kobj.parent);
>> +}
>> +
>> +static u32 read_perf_limit_reasons(struct xe_gt *gt)
>> +{
>> +    u32 reg;
>> +
>> +    if (xe_gt_is_media_type(gt))
>> +        reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>> +    else
>> +        reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>> +
>> +    return reg;
>> +}
>> +
>> +static u32 read_status(struct xe_gt *gt)
>> +{
>> +    u32 status = read_perf_limit_reasons(gt) & 
>> GT0_PERF_LIMIT_REASONS_MASK;
>> +
>> +    return status;
>> +}
>> +
>> +static u32 read_reason_pl1(struct xe_gt *gt)
>> +{
>> +    u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>> +
>> +    return pl1;
>> +}
>> +
>> +static u32 read_reason_pl2(struct xe_gt *gt)
>> +{
>> +    u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>> +
>> +    return pl2;
>> +}
>> +
>> +static u32 read_reason_pl4(struct xe_gt *gt)
>> +{
>> +    u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>> +
>> +    return pl4;
>> +}
>> +
>> +static u32 read_reason_thermal(struct xe_gt *gt)
>> +{
>> +    u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>> +
>> +    return thermal;
>> +}
>> +
>> +static u32 read_reason_prochot(struct xe_gt *gt)
>> +{
>> +    u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
>> +
>> +    return prochot;
>> +}
>> +
>> +static u32 read_reason_ratl(struct xe_gt *gt)
>> +{
>> +    u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
>> +
>> +    return ratl;
>> +}
>> +
>> +static u32 read_reason_vr_thermalert(struct xe_gt *gt)
>> +{
>> +    u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>> +
>> +    return thermalert;
>> +}
>> +
>> +static u32 read_reason_vr_tdc(struct xe_gt *gt)
>> +{
>> +    u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
>> +
>> +    return tdc;
>> +}
>> +
>> +static ssize_t status_show(struct device *dev,
>> +               struct device_attribute *attr,
>> +               char *buff)
>> +{
>> +    struct xe_gt *gt = dev_to_gt(dev);
>> +    bool status = !!read_status(gt);
>> +
>> +    return sysfs_emit(buff, "%u\n", status);
>> +}
>> +static DEVICE_ATTR_RO(status);
>> +
>> +static ssize_t reason_pl1_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buff)
>> +{
>> +    struct xe_gt *gt = dev_to_gt(dev);
>> +    bool pl1 = !!read_reason_pl1(gt);
>> +
>> +    return sysfs_emit(buff, "%u\n", pl1);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl1);
>> +
>> +static ssize_t reason_pl2_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buff)
>> +{
>> +    struct xe_gt *gt = dev_to_gt(dev);
>> +    bool pl2 = !!read_reason_pl2(gt);
>> +
>> +    return sysfs_emit(buff, "%u\n", pl2);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl2);
>> +
>> +static ssize_t reason_pl4_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buff)
>> +{
>> +    struct xe_gt *gt = dev_to_gt(dev);
>> +    bool pl4 = !!read_reason_pl4(gt);
>> +
>> +    return sysfs_emit(buff, "%u\n", pl4);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl4);
>> +
>> +static ssize_t reason_thermal_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buff)
>> +{
>> +    struct xe_gt *gt = dev_to_gt(dev);
>> +    bool thermal = !!read_reason_thermal(gt);
>> +
>> +    return sysfs_emit(buff, "%u\n", thermal);
>> +}
>> +static DEVICE_ATTR_RO(reason_thermal);
>> +
>> +static ssize_t reason_prochot_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buff)
>> +{
>> +    struct xe_gt *gt = dev_to_gt(dev);
>> +    bool prochot = !!read_reason_prochot(gt);
>> +
>> +    return sysfs_emit(buff, "%u\n", prochot);
>> +}
>> +static DEVICE_ATTR_RO(reason_prochot);
>> +
>> +static ssize_t reason_ratl_show(struct device *dev,
>> +                struct device_attribute *attr,
>> +                char *buff)
>> +{
>> +    struct xe_gt *gt = dev_to_gt(dev);
>> +    bool ratl = !!read_reason_ratl(gt);
>> +
>> +    return sysfs_emit(buff, "%u\n", ratl);
>> +}
>> +static DEVICE_ATTR_RO(reason_ratl);
>> +
>> +static ssize_t reason_vr_thermalert_show(struct device *dev,
>> +                     struct device_attribute *attr,
>> +                     char *buff)
>> +{
>> +    struct xe_gt *gt = dev_to_gt(dev);
>> +    bool thermalert = !!read_reason_vr_thermalert(gt);
>> +
>> +    return sysfs_emit(buff, "%u\n", thermalert);
>> +}
>> +static DEVICE_ATTR_RO(reason_vr_thermalert);
>> +
>> +static ssize_t reason_vr_tdc_show(struct device *dev,
>> +                  struct device_attribute *attr,
>> +                  char *buff)
>> +{
>> +    struct xe_gt *gt = dev_to_gt(dev);
>> +    bool tdc = !!read_reason_vr_tdc(gt);
>> +
>> +    return sysfs_emit(buff, "%u\n", tdc);
>> +}
>> +static DEVICE_ATTR_RO(reason_vr_tdc);
>> +
>> +static struct attribute *throttle_attrs[] = {
>> +    &dev_attr_status.attr,
>> +    &dev_attr_reason_pl1.attr,
>> +    &dev_attr_reason_pl2.attr,
>> +    &dev_attr_reason_pl4.attr,
>> +    &dev_attr_reason_thermal.attr,
>> +    &dev_attr_reason_prochot.attr,
>> +    &dev_attr_reason_ratl.attr,
>> +    &dev_attr_reason_vr_thermalert.attr,
>> +    &dev_attr_reason_vr_tdc.attr,
>> +    NULL
>> +};
>> +
>> +static const struct attribute_group throttle_group_attrs = {
>> +    .name = "throttle",
>> +    .attrs = throttle_attrs,
>> +};
>> +
>> +static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
>> +{
>> +    struct xe_gt *gt = arg;
>> +
>> +    sysfs_remove_group(gt->freq, &throttle_group_attrs);
>> +}
>> +
>> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt)
>> +{
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    int err;
>> +
>> +    err = sysfs_create_group(gt->freq, &throttle_group_attrs);
>> +    if (err) {
>> +        drm_warn(&xe->drm, "failed to register throttle sysfs, err: 
>> %d\n", err);
>> +        return;
>> +    }
>> +
>> +    err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, 
>> gt);
>  @action is directly called for any cleanup work necessary on failures 
> of drmm_add_action_or_reset. So sysfs_remove_group is not necessary
>> +    if (err) {
>> +        drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, 
>> err: %d\n",
>> +             __func__, err);
>> +        sysfs_remove_group(gt->freq, &throttle_group_attrs);
>> +    }
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h 
>> b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>> new file mode 100644
>> index 000000000000..d26d0072f907
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_THROTTLE_SYSFS_H_
>> +#define _XE_GT_THROTTLE_SYSFS_H_
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_device.h"
> The above headers are not used
>
>
>> +#include "xe_gt.h"
> Forward declararion of xe_gt can be used.
>
> Thanks
> Riana

Will fix both.

Thanks

>> +
>> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
>> +
>> +#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
>> +
