Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467DBC48260
	for <intel-xe@archiver.kernel.org>; Fri, 16 Feb 2024 17:48:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB68F10EA27;
	Fri, 16 Feb 2024 17:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYbSLmai";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBB910E94A
 for <Intel-Xe@lists.freedesktop.org>; Fri, 16 Feb 2024 17:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708105716; x=1739641716;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WDGh+jOD4ueUO9NNdTOamHb+doO5NISy0NPast8JNMo=;
 b=kYbSLmaivKi8TzwnphXKvDLnVNEjz/hf8JbshHHSFQm6yG7+88xgA8IE
 naVIg2AL0O3egpN9/7hE83oIppuG+JcVuGJsGEys4XtRdfmgE10Ih+gh/
 WTRbM6CZdiHbxv99+rqxBjSsHLskvkbgPdolaUU+zlrOKRbIIYyLfJEd6
 h32mRsitxnitTF2AG224fegC5GJTU2HZFskhJopzju9FBHIYifnd0KTiZ
 sAbVe8ibWacH1+FBNCsejdRN54nB3PfgcqEmj+DYpMjhrOzcpfoyiGlQa
 C+nFxOuUHrIUUcgDe9HyOEoZYsL8EPFWyDklcxSImoVz1/WsgXiQF88A0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="2098269"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="2098269"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 09:48:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="8508097"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Feb 2024 09:48:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 16 Feb 2024 09:48:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 16 Feb 2024 09:48:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 16 Feb 2024 09:48:33 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 16 Feb 2024 09:48:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fypmy4YB0zIrWHD0mh6a3u248X7ca2LZ2tqUtgxBK7astANwOAaaHEs2r22jQNC7mJEkQwfK+LgL70qo2mluCVVHysZ5KTJv6qVtcotmC/mi7F4u1v/JRl+oX+RAfI5zprAt+5ouwHMg/X9r4g60w78SNHkk45qgAGpTPiJkU1g5Ck00tSSEMjFentSfW4z/34RRhp1zjMNADVLLEbwUET04mTrkZFmGR8KHPHBg3ltHULxU4NYHS6ml1+agW5I/JEGKK0XKufjXzbFoyvkRZ9y5GR8eCqT3NGU5IWqFX0661MoTzWhTRxF2m4tnkDFs9Qx6zxkjT6N+MboMnhZ+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKfV6fc1NhVR29xERDd/OBQA+5b+XNDjORhmgwIjlzQ=;
 b=Vm3UMHD+CinOOKm44I2NTEhnmCI1Bq40SES07x7bcQz+0opo4FvHfYX/ll2Uctw5XeNvmt4/q01t3DQC56l6BnkQWEUj/7VRTneoF3t+uFjv0ByvmsB594lwLRq/+0a9UmRozqnLKdnK/wD7PspuTvIXFVx5K4M0S3C57fhnDyTbal2FNWqKV7w7HaCoKHGRoNm3FIRAJuaDocjMWz0QmEg/CkA+zwG3PcbquBQe7SRxK5FrPscEJMZe9UsgLOf8K9jKuuyAjW2Irrt0dD6UltgzMYc/Hhz+6yAgII8naWnN1y8LFFvvVRYbZCqOobEhM6rLNECEHJHo1xJqBHhEmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH8PR11MB6612.namprd11.prod.outlook.com (2603:10b6:510:1cf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Fri, 16 Feb
 2024 17:48:25 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7292.026; Fri, 16 Feb 2024
 17:48:25 +0000
Message-ID: <01e3844c-f75b-424d-b8f9-fcc47a0f7123@intel.com>
Date: Fri, 16 Feb 2024 09:48:22 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Make read_perf_limit_reasons globally
 accessible
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20240213003426.3943662-1-John.C.Harrison@Intel.com>
 <20240213003426.3943662-2-John.C.Harrison@Intel.com>
 <ZcuJOkUkZnss9ttl@intel.com> <7d8760f4-5867-4e07-a82d-d2e64e564272@intel.com>
 <ZczGFSmfKZwei7on@intel.com> <8bb4e787-fa91-4167-9790-f801945ecdc2@intel.com>
 <Zc4VCzhxcjVLdD37@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Zc4VCzhxcjVLdD37@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:180::14) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH8PR11MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aaa0104-e55a-43ff-b169-08dc2f177998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Ss5eP87b80nk/+fopPcaLlMhZk7ZC+QlfUyuANHNE1XmLV2BGKPBwoc5sTAKgsbjYKV4xxfLLEuVu3o1zc81BFAgOymU7ZV8Mbs4gzh8PzHlSKWdftjg7B5AYlGedu1p9/O+j1W8424vDBltSjuOcPPgCove9xHPQasgBFRXA8OaKHWrT1yjgiQATWozwQVU5ua13r8r9N3MKfN29rheY+EyYSNEeIoIsceI+ZayURe1NxV5kzC1zz46xjPIAnzvD0Cx9jqdOpeGvloN6Ehzsd2hkh6EnP+GyFW1WQHklDARGqNNZ23avU8H7cm/y/BhOQnQ8DHlrz6JgJdIu7bID420oDtTCu8IrIjoHRWcbGv4IwKn9al5fBGo6sYA6bjtKNte8v7G/n9e1qCXGbnpyvOcRoNGT8zGcyKHpBJvvxaDvFc9Iq8Fb/CT20wacE/VmSsH/e0oepdWLjlk0r9wXRf8BcBuVGImEo/AV1D9z2RoUb59DUomhVtALpXse49IgP9jnsoWLc3npWBbXr1KupD1AlU+sliafYN+26HOSs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(366004)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(82960400001)(31696002)(83380400001)(86362001)(6486002)(66476007)(66946007)(478600001)(6506007)(316002)(38100700002)(6666004)(37006003)(66556008)(6512007)(36756003)(966005)(2616005)(26005)(53546011)(6636002)(31686004)(5660300002)(2906002)(41300700001)(8676002)(6862004)(8936002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vm5xdmFMQ0lNWW5oK3BIcUpMYUVHbEpyT05RMlhWeFNSczdSSWdqNDJtbnM1?=
 =?utf-8?B?SHE4SlZmUld4eXRIemlzUHZYaVFnTUZneTdUMCtlT2xsZ1MzOU45UXB6alBV?=
 =?utf-8?B?aThWdzlkdTNDTGFkMWxYcytxby81TW9rNlBsTDBTVUZqYUk4UGVBa2ZNa1Jt?=
 =?utf-8?B?Uk5NTEowejFSVUJGN1BoZmpDd1JoQjFWSmZTRVBuclh2N25TbGgrOEU1bTdp?=
 =?utf-8?B?VC9iSTRJMDVxTStxZkZmdkV5R3hPT0F0eE9SZDRRYjJvbXV1eGc2ditEeERh?=
 =?utf-8?B?YjY5aEdXTGtjR1k0NlJma0lCMzlOZGUxZUtqTThsanRSN1lKNU1mYmhlZlFC?=
 =?utf-8?B?N3l6MThPYi9VTXFHWGZVN1I2eDRCdHZva3VTVDQrOS95ZmlwOGJSM3NyeFJw?=
 =?utf-8?B?RWdhZmZ3aXZ2UGRyRnkvS2s2TldNNVE1VnFqSWFlNEhveFFxdXd2MEtNYSti?=
 =?utf-8?B?RG9HVGlwZFBORDhEMXF3NUgwdmFxU0g1UzdCQ2tjQnhRd0s4VUJYanAyZ24r?=
 =?utf-8?B?U04xOGZHZlI4bVVkcDBQR3hYR29HdlBvZ2dobnhOM2lvVFM0THVKRFZaWld4?=
 =?utf-8?B?b3RIQ3F3RDFBTTZKbFIvMGt4L21hNDVWK0VvMEdvMy9lZk83VGg4ZC94d0Jr?=
 =?utf-8?B?djdBaXl6czcyd2hROFR2YzhzNHNqNGZ5WnhtZ0pCT3NoeDlQOEx2SUhWZklp?=
 =?utf-8?B?Rnl4OU55cU4yVWVwZzBtLzVZaWVXdnZTZ0U2aE1FM1k3SGsxT2h1clZLNU5a?=
 =?utf-8?B?YzlORXVseE9FKzgrNVNWWWY3dkVKVCtaYXR2QXh4R2UvS0JyQS9nRjd6SU5i?=
 =?utf-8?B?MFlXdkZlZmJncmp3dGRWM2JrQnpOdGhRRUhNeldCTTZURjAvbEJCMXBSRFla?=
 =?utf-8?B?VVZTNDhqdm4rSHJ0THVlMkpDcUVKZ1EwajFBUXNqTnFvNUVqZGRXYy80dXVu?=
 =?utf-8?B?bFNEanU4UFgvajgrM09QVUtMcE1SNVd2WDlMbThuRGFVWUVRRWlWakZtOGd2?=
 =?utf-8?B?a0xibUxxbE9sSGNGN09XMk9QR2Z4QkRLVWhjaE0vaU9hMXhndWJ5L0lpQ3Z4?=
 =?utf-8?B?TEpzMnVobTRIaVZ2ZGNmWlZhT3ZINDFXMXJiT3NNbG5nZVFSMmwzbzg2VXhu?=
 =?utf-8?B?cXA0WkpYdEpvY2NSL3A3K3FzdlJQSVU1ajQ0VjdsUEFZdTRPMmMyRmxzQXVh?=
 =?utf-8?B?OGVIcXFYMkZ3WExVYTVseFVqNEJuai8xK0VPR0ROSUdJckdRcGVkWFFmbVRK?=
 =?utf-8?B?RkVtVTl0ejA2VStvUGtjNEtOWEpIWWdEbWVrd0dJdENaVENDT21keWg2Ylly?=
 =?utf-8?B?K0xlMndYRWVEZVIxSlNuaTZPZytLRTJXRkhVNnpndWlWSTZiTHNGQnNJek9D?=
 =?utf-8?B?YzVWUnFpZFdKV3FYSGJaampwaXNCdkdNaExXUHROSFRaMmNJN0psR2lwaWZR?=
 =?utf-8?B?Vk5PL2lPeWhPRVhJYW1GR2FSNWhjWHg3VjdZR3pPeVZ3dGlmVE5iT21WMzd0?=
 =?utf-8?B?Skp5d2pwbDhFQUl0bHo0M3ZySHBUQ01KbDFZeEdkdDFkakY2QWl4dlNHcTlR?=
 =?utf-8?B?emdUbXBEOGxSanZWMGdQU0F0TllEd21tZmtrZ0xNZTdGZHhZeWlHVTV0Mi9D?=
 =?utf-8?B?eG9tYkNGeFZWM3dGNEFGaG5RVHpxSnJDY1hLMm1tOW42bnFqMmJDaGtGa2J4?=
 =?utf-8?B?NDB6Sko4eEZzSmQzckorVW1iY2FqcmJwNThQK011TkN2eVMyd3lnc09EWU1r?=
 =?utf-8?B?L3NyUUM4T0psb2dpYU80NnQ3alY3dzF2NHNVSVBqVzZvMUhEODdYSHlpSXNi?=
 =?utf-8?B?cS8ySUtid3pwbUVUWGk2OEp4R3Q4Z2k3cjJhbURkMTJLdXIxYkY4bnQvYURG?=
 =?utf-8?B?NFV4RTFxSVp0WjNSNTBsdy9Yc1JxOFdnbjF2MVB2TldsdG5ZbWVsVTMwNmw3?=
 =?utf-8?B?VDJSUTR2TVB6dUhGVFpza25Gazd2cFN6cWlUMWFqaE1CcVVmWnJONUEvZkNl?=
 =?utf-8?B?VVVJWllTTTUwS3hhOFk1eWlLWFFLSjdQYXVwSHJsOUphbkxGNWNjTWpPMFJp?=
 =?utf-8?B?L01CN20xR1F6RGV4K3lyK3BEcUQ1U1Rob1UxdnFsS01RS0xRbGhuYW9zMWpM?=
 =?utf-8?B?NEVFZjBWMytJbkN4NzVTeGdwT2FyaWJLc0IzQy81VjlXRW5CaVBTcWd6LzNs?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aaa0104-e55a-43ff-b169-08dc2f177998
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 17:48:25.2245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWjjvw79V2krIA4KKZi4ggMMf8hVaZh5gBIc+E1ikjvwkqp+CHqmAtkFOtYffiMmWfPilFt5WWpI4uS5onYql0sfo29PpjuGDtUTmOW5CPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6612
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

On 2/15/2024 05:43, Rodrigo Vivi wrote:
> On Wed, Feb 14, 2024 at 12:21:36PM -0800, John Harrison wrote:
>> On 2/14/2024 05:54, Rodrigo Vivi wrote:
>>> On Tue, Feb 13, 2024 at 06:12:11PM -0800, John Harrison wrote:
>>>> On 2/13/2024 07:22, Rodrigo Vivi wrote:
>>>>> On Mon, Feb 12, 2024 at 04:34:25PM -0800, John.C.Harrison@Intel.com wrote:
>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>
>>>>>> Other driver code beyond the sysfs interface wants to know about
>>>>>> throttling. So move the query function out of sysfs.
>>>>>>
>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/xe/xe_gt_freq.c           | 15 +++++++++++
>>>>>>     drivers/gpu/drm/xe/xe_gt_freq.h           |  4 +++
>>>>>>     drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 31 ++++++++---------------
>>>>>>     3 files changed, 29 insertions(+), 21 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
>>>>>> index e5b0f4ecdbe8..51645a24009e 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>>>>>> @@ -11,7 +11,10 @@
>>>>>>     #include <drm/drm_managed.h>
>>>>>>     #include <drm/drm_print.h>
>>>>>> +#include "regs/xe_gt_regs.h"
>>>>>>     #include "xe_device_types.h"
>>>>>> +#include "xe_mmio.h"
>>>>>> +#include "xe_gt.h"
>>>>>>     #include "xe_gt_sysfs.h"
>>>>>>     #include "xe_gt_throttle_sysfs.h"
>>>>>>     #include "xe_guc_pc.h"
>>>>>> @@ -220,3 +223,15 @@ void xe_gt_freq_init(struct xe_gt *gt)
>>>>>>     	xe_gt_throttle_sysfs_init(gt);
>>>>>>     }
>>>>>> +
>>>>>> +u32 xe_read_perf_limit_reasons(struct xe_gt *gt)
>>>>>> +{
>>>>>> +	u32 reg;
>>>>>> +
>>>>>> +	if (xe_gt_is_media_type(gt))
>>>>>> +		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>>>>>> +	else
>>>>>> +		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>>>>>> +
>>>>>> +	return reg;
>>>>>> +}
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.h b/drivers/gpu/drm/xe/xe_gt_freq.h
>>>>>> index f3fe3c90491a..89be518b4967 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_freq.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.h
>>>>>> @@ -6,8 +6,12 @@
>>>>>>     #ifndef _XE_GT_FREQ_H_
>>>>>>     #define _XE_GT_FREQ_H_
>>>>>> +#include <linux/types.h>
>>>>>> +
>>>>>>     struct xe_gt;
>>>>>>     void xe_gt_freq_init(struct xe_gt *gt);
>>>>>> +u32 xe_read_perf_limit_reasons(struct xe_gt *gt);
>>>>> this component is xe_gt_freq, not xe_ nor xe_read or xe_read_perf.
>>>>> Please use the right namespace prefixes.
>>>> Argh! Forgot to update that.
>>>>
>>>>> But besides the namespace, I don't believe that these limits
>>>>> belong to xe_gt_freq anyway... why are you taking that from the
>>>>> throttle reasons and moving here?
>>>>>
>>>>> What about removing the 'sysfs' name from the xe_gt_throttle
>>>>> component and making that to export a function
>>>>> xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
>>>>> ?
>>>> Because that seems like a lot of unnecessary churn. The intention is to
>>>> simply add the throttle register to debug prints so that CI bug reports can
>>>> be triaged more effectively. Re-writing the entire sysfs file to split it up
>>>> into multiple units is not worth the effort when all that is required is to
>>>> export the function to read a register.
>>> No, that's not what I meant... I don't believe we need to split the file.
>>> just remove the 'sysfs' portion of the name of the component itself,
>>> so we have a component responsible for providing throttle information, either
>>> with direct exposing the sysfs and also with the exported functions that can
>>> be accessed by any other component that might make usage of the throttle
>>> information.
>> Still not sure I follow. You mean rename the files to xe_gt_throttle.[ch]
>> and rename the exported init function to xe_gt_throttle_init() but don't
>> change anything else? Leave all the sysfs code in the single file? And have
>> xe_gt_throttle_init() as just a stub wrapper around a static
>> gt_throttle_sysfs_init() or keep it as a single level init function that is
>> generically named but only does sysfs initialisation?
> I mean something like this:
> https://paste.centos.org/view/d3d2cc77
This has vanished now, but I managed to have a quick look earlier. I 
think that basically matched what I described above.

John.

>
>> John.
>>
>>>> John.
>>>>
>>>>
>>>>> Thanks,
>>>>> Rodrigo.
>>>>>
>>>>>> +
>>>>>>     #endif
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>>>>>> index 63d640591a52..89d9f89962ad 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>>>>>> @@ -8,6 +8,7 @@
>>>>>>     #include <regs/xe_gt_regs.h>
>>>>>>     #include "xe_device.h"
>>>>>>     #include "xe_gt.h"
>>>>>> +#include "xe_gt_freq.h"
>>>>>>     #include "xe_gt_sysfs.h"
>>>>>>     #include "xe_gt_throttle_sysfs.h"
>>>>>>     #include "xe_mmio.h"
>>>>>> @@ -34,77 +35,65 @@ dev_to_gt(struct device *dev)
>>>>>>     	return kobj_to_gt(dev->kobj.parent);
>>>>>>     }
>>>>>> -static u32 read_perf_limit_reasons(struct xe_gt *gt)
>>>>>> -{
>>>>>> -	u32 reg;
>>>>>> -
>>>>>> -	if (xe_gt_is_media_type(gt))
>>>>>> -		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>>>>>> -	else
>>>>>> -		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>>>>>> -
>>>>>> -	return reg;
>>>>>> -}
>>>>>> -
>>>>>>     static u32 read_status(struct xe_gt *gt)
>>>>>>     {
>>>>>> -	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
>>>>>> +	u32 status = xe_read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
>>>>>>     	return status;
>>>>>>     }
>>>>>>     static u32 read_reason_pl1(struct xe_gt *gt)
>>>>>>     {
>>>>>> -	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>>>>>> +	u32 pl1 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>>>>>>     	return pl1;
>>>>>>     }
>>>>>>     static u32 read_reason_pl2(struct xe_gt *gt)
>>>>>>     {
>>>>>> -	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>>>>>> +	u32 pl2 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>>>>>>     	return pl2;
>>>>>>     }
>>>>>>     static u32 read_reason_pl4(struct xe_gt *gt)
>>>>>>     {
>>>>>> -	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>>>>>> +	u32 pl4 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>>>>>>     	return pl4;
>>>>>>     }
>>>>>>     static u32 read_reason_thermal(struct xe_gt *gt)
>>>>>>     {
>>>>>> -	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>>>>>> +	u32 thermal = xe_read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>>>>>>     	return thermal;
>>>>>>     }
>>>>>>     static u32 read_reason_prochot(struct xe_gt *gt)
>>>>>>     {
>>>>>> -	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
>>>>>> +	u32 prochot = xe_read_perf_limit_reasons(gt) & PROCHOT_MASK;
>>>>>>     	return prochot;
>>>>>>     }
>>>>>>     static u32 read_reason_ratl(struct xe_gt *gt)
>>>>>>     {
>>>>>> -	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
>>>>>> +	u32 ratl = xe_read_perf_limit_reasons(gt) & RATL_MASK;
>>>>>>     	return ratl;
>>>>>>     }
>>>>>>     static u32 read_reason_vr_thermalert(struct xe_gt *gt)
>>>>>>     {
>>>>>> -	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>>>>>> +	u32 thermalert = xe_read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>>>>>>     	return thermalert;
>>>>>>     }
>>>>>>     static u32 read_reason_vr_tdc(struct xe_gt *gt)
>>>>>>     {
>>>>>> -	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
>>>>>> +	u32 tdc = xe_read_perf_limit_reasons(gt) & VR_TDC_MASK;
>>>>>>     	return tdc;
>>>>>>     }
>>>>>> -- 
>>>>>> 2.43.0
>>>>>>

