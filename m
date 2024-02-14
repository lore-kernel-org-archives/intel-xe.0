Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515BFC48260
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 02:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BC910E1EF;
	Wed, 14 Feb 2024 02:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fruqHhSq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0936B10E1EF
 for <Intel-Xe@lists.freedesktop.org>; Wed, 14 Feb 2024 02:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707876747; x=1739412747;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d2+eLnroO5X2aERlSPBrCqvhYDfAQ4Mcqv2gfNb+IKs=;
 b=fruqHhSq16ITZsj5+Bh9Roj9YIdt5xinnIkO9agwRBzzjmKZPzXsn3l7
 V4auhRjIChBK6pX+eHCaTNOHb7gKYeMESrVqRE3X+2C7WUZWbyUjzKUDx
 l2IjQ8QRCKESAwOFo4J067yf6OMJlv1R/MSjOhuNmjBp8QE/HPn/gy5KB
 ayXsDhRpK064E5+DpDcmEkHrS0+mky8XbSTdOGeRW9w/fZJ4/HcgzItDz
 p5MUdTBIVnpl7Qk30axYqOU+F6KOx4xPmUeFgGAFbYet6ZcBTvtr2SX+t
 gLDHTiIFI9tzy4A4tlW44coN3pVWzXGXjdGNUgFoIQTP2PU0xLQrChhjU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13307510"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; d="scan'208";a="13307510"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 18:12:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="7698884"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 18:12:26 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 18:12:25 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 18:12:25 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 18:12:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCv4AxcFWDJy8ItS9hkTJY3NeqjVDuGn1qj8ApWBMIlqoAHpixB4CQAcMCCSY2Qd6XY9vcoNHobqQFt4y4kOroOvMbDLYYJkvcbgIgdnLRHYx41ZqEXNvCPgNhwfBLb74UuQ0g7ne1yqHrqK54gllCQR3ZHiBm75wUzCJB+DPXVlpnKFkFoO6du+YmAhhWydfUhp8+aIlZlCSzgELl5x9iI5YagNL4cyh6x/i6oiaHxyDdSQKTj0JgPjMnI+pp0SSFcDnOKRa5qJfvgrs+yW9xWKar/+jDXnUs4GhrZh8iShVZ8HdWGrfAcMuYnbOiD0TnZiTM+6qLqstmlowhqZ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1ZVlrnUNzEzwklTHySym4Z2BSS9oeVGrt64Kddv15Y=;
 b=ZlPQ/RAJrJc69ht1W8QsrishZcXOYfG7+GLND8AmnSuYOEMMmcMdLLraPUdOC5PUuOJbQ/XGfIJhQ6V0Pa3ggW16HD47T2EkHVF5rlt2eYd4D53jYroeaDJuNedyS6LfJYmYNrB4T7gWRnqeUvFb3CdxVdS76ke64je7YObMeddv9JhlZtQBxZBQr1EwQkAmT5smkZKLDiq6ZD8osIUkRKJi+KebSBT6dRZfd+a3mnlgagZKcXjX03IzIzJMUhzJCpFA3zgHUhfPr9ks5xdyO8JkxOcEv5DqhcStXxvkUf3umADkPl31CNxJPqHAbTa13ewy4+PpxsImNXKIEulpxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB6403.namprd11.prod.outlook.com (2603:10b6:510:1f9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.40; Wed, 14 Feb
 2024 02:12:23 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7292.026; Wed, 14 Feb 2024
 02:12:23 +0000
Message-ID: <7d8760f4-5867-4e07-a82d-d2e64e564272@intel.com>
Date: Tue, 13 Feb 2024 18:12:11 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Make read_perf_limit_reasons globally
 accessible
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20240213003426.3943662-1-John.C.Harrison@Intel.com>
 <20240213003426.3943662-2-John.C.Harrison@Intel.com>
 <ZcuJOkUkZnss9ttl@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZcuJOkUkZnss9ttl@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0208.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::33) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: 096af646-901b-488a-e51e-08dc2d02618b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cGsPI4uBIGFLjFSk2JSY/U1MV5u6vukbjJ68yj2XbvpgWD4haG7plvEi97HLohI90Vqm6+p5ImyxFAODxmuU1j25i5qDdPS7eeuJBYx2jiUsSCmRXH5UTkodCoMRW6bAREk8IQsDLUWwPWrSpSzEh/H5qPxn1APAVjVNLVAiEqCQOmRSyqvs3PdRHXEl43HNpGxkcJNz++HE7oCMVXs5/OFdFcuNmUnc4uvj5QvqAUe5DrJZaBcVPtp8JsGM1nEyJrVBeLF9TTVC/4INaTKTX52cMW271ixSL8km4k9063alpVpCFpxlrZR1Pyj/G4ygH0yzS+e4MqxVEXJnGm7UKEefb78nHnoqpMNGTeKWU7+vJoG+ZZSNzTkkoh2LzZZ2Ft2GxZoTXTGL8HGDqvi+YMhMjGMsjn+AB8I5lgOAKw3Q1FKszOLTJ2MavGa2uT+f9A3sbPyg1FB3oJBBDF0keKMdmm/fZs1oYTqao/U/ckobFGYpS1jI8gW66dhtIAfsi/JQ7HvpYyE1eEysqdDYZAT10CXgbDWXVPRrbQsFK7a3zeL4QMlsFfsqevqvlrk4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(346002)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(6636002)(37006003)(6666004)(316002)(6506007)(6512007)(8936002)(53546011)(8676002)(6486002)(66476007)(66946007)(66556008)(6862004)(4326008)(38100700002)(41300700001)(82960400001)(31696002)(86362001)(2616005)(26005)(478600001)(36756003)(83380400001)(2906002)(31686004)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OU8wNFg5dUlrMUQ4QThmN1p1cExXK0U3OWNiR3FkVjlGekJya0I5VVhrVHJx?=
 =?utf-8?B?NVJibXJYQWI4SG9Dblh2QXR2aStld1FpcnZDdEgxMjdqK2VaeXNjSXNoZGpM?=
 =?utf-8?B?OUNYMzZTcnBQeFpRUVZjRmlyN055VzFRakhUSDE4dzZ5NnFKS3REanpINmhn?=
 =?utf-8?B?cTNocWw4ZlRnbEtjeTJ2WXpWbER5ZW80am5sUnZiSXkrbFlxWG9qRmVhQkl1?=
 =?utf-8?B?VTM3VVZ2RFJEQ3pTclBiUUEyNnZKTGZPVWlIUzJiY1c0MUFGbFE4dW5tOWpU?=
 =?utf-8?B?Vjh5Zjg4UWNHemx0NEJ3RFdReGQvQk1aNTVuMUtrSnk4R29jbmN4NEp3bkJ2?=
 =?utf-8?B?WTYvTGZveHlpQVNQenFCSS9NWHBQbVByVjFncllhNm05Yzl5bjVjdkhRajhv?=
 =?utf-8?B?TFROTStVWGZqb1hKSkovbkUxZ2RaTDR1dWZkZEdoTjFwZDVITEtXanJ4dERX?=
 =?utf-8?B?amJpMlBidUxCV3NRdWhBalRHNEtJMkp4Z05ZRjM1MzUyY2toMUd5KzJOVG1L?=
 =?utf-8?B?RDFnSGllMVpRTERyN0N1L1R3MzZrREtISWRCcmNvNjhHOUZCOWY2VVhTSFdu?=
 =?utf-8?B?OUxSZ0JxT2ZRNGJHZGovdVBjZldjVHRCNkRuTndkMHp2ajlsTzZ5ZGY2bWVD?=
 =?utf-8?B?d1NxamY3MHdTN1lScktxTUxtZTF6SHVaTVR5TkVJU2JrdEZmaG03akNlalNI?=
 =?utf-8?B?cXdqQ0w4T0l0T0lKWHErQ0Y5cmFlYSthK1FIRVRRNWJzbnN4OG53TlNjMWxp?=
 =?utf-8?B?VXJsMHhyQjJ5cE43dktUU0tkQTIwb2EvZ0ZlcTJoaG1lNWVvdXRhVTllWlJs?=
 =?utf-8?B?UWVDTXlhd00vTkJ2a2IxcHBJMUFyUWRkcGdlNE11R1RaaU9tQmYzWllzcDU5?=
 =?utf-8?B?OHhkdnQ4M2YrUlNlOTNlWFhTWmVINm9JR2VDY0hDVUlZSUdzZUNBMHBGTlE2?=
 =?utf-8?B?MW5mWnN2RFk4cWd6eFJWZ0xMQ1NZa2hkUjBsUnhPbWtMMGYyVEV5dlJ5QUhj?=
 =?utf-8?B?RCtpNGlPOFUwU1RnSEp6bm9yVTBmWGV0a3NPOVZob2hWeGdqV1Fid0w3d002?=
 =?utf-8?B?VTVEUjJJcStwODZ1YWFMdytHeTM3RkhzTUNzSExqdlZITkZzd0lQUEl1M0Y5?=
 =?utf-8?B?RE1mWVhSQVBLK2ZQM0FEUENUVWJWSHFQUk13ZldDcHRDOGVubVVVWGtmaXlq?=
 =?utf-8?B?Ky9xdjE0Q2pMUGJ2ZnI1bXJkR245VkRGbGkveWUwRmwzbFVub2dLMHlUdFpK?=
 =?utf-8?B?akhVSk9TS21hT0l0UGY3UDZad2pKN1VIMDBtVjNteEwvUjVGRXJMcy81WEtr?=
 =?utf-8?B?QklmNTVOL240VEoreUFuWTUwTEJMdlBtWHJJV2d5ZHBlK2dRc2R1aDlYdUty?=
 =?utf-8?B?d09ubi82VFRlZkdVUWloNTRtQ25GcDIvS09wMnBrc25XZ1N5cG0xZ21GRXZo?=
 =?utf-8?B?SXB4OG5qUk42VjdHamxZdVR4czFDdmFkUVB0dVRqYXFMcWZBTFBobmNDTXZK?=
 =?utf-8?B?akJjOUhzSzdZekJmdGI4WkgxMkdvQTRRb1ltck1ZWVFqeW5PTTF6TDArVUZs?=
 =?utf-8?B?d2g2TjRWdW1WaUxYZlFHdm12dC93Slp0N3d4L3BBdEtmbmpJT3RDazVpVUQv?=
 =?utf-8?B?eFltZ1V1T2NrSVRBODBwLzI1bk1DYTlaMVdzYTdtSUd3WFprOEF2R2duVVRs?=
 =?utf-8?B?Y2FlR3VRUW9WcVBCZnVUbGxhcnZnbDBvdk93ODF2MjhGSXVMNmdOMVozK1lY?=
 =?utf-8?B?ZmdGWVQzOFFZVjhuZHpuYzExRGJ2THlyQlZsMWtuUUF5MEsxNzRkRThXM0lV?=
 =?utf-8?B?SmdZK2ZFZlNCK0xqc0Zpd0ppaEZpazFRbmtOcWpCWHVPSW8yTDFuOXJqU0FL?=
 =?utf-8?B?ZHliQVd2d0RrL01TOHRiNlZpN09iNy9SbndMNkhOTnk3NWxrcTBuZzlDWFRt?=
 =?utf-8?B?YjNTQkRuVVRkOEZZbTlVMjFXR2s4aEo2MWNBWkJLT3lMcHUxblk4aHdMbzdJ?=
 =?utf-8?B?S0o2cFhyR1BoNGxiSGhKanQ2QVc2Vyt1Mldpd3IyMkYyc3RtbCtLN3JIMDNS?=
 =?utf-8?B?QjdHMEo2UGtxVS9ieWtwZWJrd1VKU2dOd241VUhhMXI4Uy9NVkxybkRLSDRa?=
 =?utf-8?B?bDhCNEgzcTVGY2NOS09lQnd6SzlsSHkzMXhyQ1NwVk9SeDdicDRsaDdKKzlK?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 096af646-901b-488a-e51e-08dc2d02618b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 02:12:23.1062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9SHPfJVJ0lUMOR/9DblyqTWyLry/Kg1g7L873hJ8ud7Hmk4DzZ9PYg9/lblLLR+X0f8IvBZju+rVI/gY3klLzKlq1dTSs3pL5xLk6RPAIVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6403
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

On 2/13/2024 07:22, Rodrigo Vivi wrote:
> On Mon, Feb 12, 2024 at 04:34:25PM -0800, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Other driver code beyond the sysfs interface wants to know about
>> throttling. So move the query function out of sysfs.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_freq.c           | 15 +++++++++++
>>   drivers/gpu/drm/xe/xe_gt_freq.h           |  4 +++
>>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 31 ++++++++---------------
>>   3 files changed, 29 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
>> index e5b0f4ecdbe8..51645a24009e 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>> @@ -11,7 +11,10 @@
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_print.h>
>>   
>> +#include "regs/xe_gt_regs.h"
>>   #include "xe_device_types.h"
>> +#include "xe_mmio.h"
>> +#include "xe_gt.h"
>>   #include "xe_gt_sysfs.h"
>>   #include "xe_gt_throttle_sysfs.h"
>>   #include "xe_guc_pc.h"
>> @@ -220,3 +223,15 @@ void xe_gt_freq_init(struct xe_gt *gt)
>>   
>>   	xe_gt_throttle_sysfs_init(gt);
>>   }
>> +
>> +u32 xe_read_perf_limit_reasons(struct xe_gt *gt)
>> +{
>> +	u32 reg;
>> +
>> +	if (xe_gt_is_media_type(gt))
>> +		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>> +	else
>> +		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>> +
>> +	return reg;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.h b/drivers/gpu/drm/xe/xe_gt_freq.h
>> index f3fe3c90491a..89be518b4967 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_freq.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.h
>> @@ -6,8 +6,12 @@
>>   #ifndef _XE_GT_FREQ_H_
>>   #define _XE_GT_FREQ_H_
>>   
>> +#include <linux/types.h>
>> +
>>   struct xe_gt;
>>   
>>   void xe_gt_freq_init(struct xe_gt *gt);
>>   
>> +u32 xe_read_perf_limit_reasons(struct xe_gt *gt);
> this component is xe_gt_freq, not xe_ nor xe_read or xe_read_perf.
> Please use the right namespace prefixes.
Argh! Forgot to update that.

>
> But besides the namespace, I don't believe that these limits
> belong to xe_gt_freq anyway... why are you taking that from the
> throttle reasons and moving here?
>
> What about removing the 'sysfs' name from the xe_gt_throttle
> component and making that to export a function
> xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
> ?
Because that seems like a lot of unnecessary churn. The intention is to 
simply add the throttle register to debug prints so that CI bug reports 
can be triaged more effectively. Re-writing the entire sysfs file to 
split it up into multiple units is not worth the effort when all that is 
required is to export the function to read a register.

John.


>
> Thanks,
> Rodrigo.
>
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> index 63d640591a52..89d9f89962ad 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> @@ -8,6 +8,7 @@
>>   #include <regs/xe_gt_regs.h>
>>   #include "xe_device.h"
>>   #include "xe_gt.h"
>> +#include "xe_gt_freq.h"
>>   #include "xe_gt_sysfs.h"
>>   #include "xe_gt_throttle_sysfs.h"
>>   #include "xe_mmio.h"
>> @@ -34,77 +35,65 @@ dev_to_gt(struct device *dev)
>>   	return kobj_to_gt(dev->kobj.parent);
>>   }
>>   
>> -static u32 read_perf_limit_reasons(struct xe_gt *gt)
>> -{
>> -	u32 reg;
>> -
>> -	if (xe_gt_is_media_type(gt))
>> -		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>> -	else
>> -		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>> -
>> -	return reg;
>> -}
>> -
>>   static u32 read_status(struct xe_gt *gt)
>>   {
>> -	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
>> +	u32 status = xe_read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
>>   
>>   	return status;
>>   }
>>   
>>   static u32 read_reason_pl1(struct xe_gt *gt)
>>   {
>> -	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>> +	u32 pl1 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>>   
>>   	return pl1;
>>   }
>>   
>>   static u32 read_reason_pl2(struct xe_gt *gt)
>>   {
>> -	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>> +	u32 pl2 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>>   
>>   	return pl2;
>>   }
>>   
>>   static u32 read_reason_pl4(struct xe_gt *gt)
>>   {
>> -	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>> +	u32 pl4 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>>   
>>   	return pl4;
>>   }
>>   
>>   static u32 read_reason_thermal(struct xe_gt *gt)
>>   {
>> -	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>> +	u32 thermal = xe_read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>>   
>>   	return thermal;
>>   }
>>   
>>   static u32 read_reason_prochot(struct xe_gt *gt)
>>   {
>> -	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
>> +	u32 prochot = xe_read_perf_limit_reasons(gt) & PROCHOT_MASK;
>>   
>>   	return prochot;
>>   }
>>   
>>   static u32 read_reason_ratl(struct xe_gt *gt)
>>   {
>> -	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
>> +	u32 ratl = xe_read_perf_limit_reasons(gt) & RATL_MASK;
>>   
>>   	return ratl;
>>   }
>>   
>>   static u32 read_reason_vr_thermalert(struct xe_gt *gt)
>>   {
>> -	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>> +	u32 thermalert = xe_read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>>   
>>   	return thermalert;
>>   }
>>   
>>   static u32 read_reason_vr_tdc(struct xe_gt *gt)
>>   {
>> -	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
>> +	u32 tdc = xe_read_perf_limit_reasons(gt) & VR_TDC_MASK;
>>   
>>   	return tdc;
>>   }
>> -- 
>> 2.43.0
>>

