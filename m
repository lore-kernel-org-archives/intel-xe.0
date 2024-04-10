Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B347CCD1297
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 08:08:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1498610E027;
	Wed, 10 Apr 2024 08:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUZ4BLFo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956AA10E027
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 08:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712736518; x=1744272518;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=M8Io9A3Aw9khEznnfXKgZJJdRCupeZG6mAtCiWj+aCc=;
 b=cUZ4BLFoCEF3EfYk56tl7wQ7FdA7XoFrZCaAvuAQnOpyGxDqT9NIOjJR
 0NWB5Y1XK5/bF7P02gSXc2oSMp3U+fTYY2n/uEJjR892M4PShda4GmGbB
 PVagDoyJHOW2y8fAzwxnpMmWzkl13x7fa+xUwZ+rLG5gceagFV4/Q1EM/
 lkhYq+bPOd+zZ6CMEgUM8cw7t8NHN5nrHQPUdpzB+pYdPiBqwzRcPt92A
 SIBTNJaxr7hRoQ0wHM4Obz5IuecaJhX1CpcWtP5rWcpUY9CQzdOP3SC1a
 4Ga045MRBeLFivRB3jMpfp0eH8F4syoZdFBVcf3NgBS5Pi8beVroeNvUi A==;
X-CSE-ConnectionGUID: bijwCV46QtuUW+jPiC4Wnw==
X-CSE-MsgGUID: D+x2AoGTTIWN1QGj5coAZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8188372"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208,217";a="8188372"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 01:08:38 -0700
X-CSE-ConnectionGUID: zj89/EhoT66nCafnjUV4Pw==
X-CSE-MsgGUID: btsvrs2QR8GENhsxay83RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208,217";a="25170512"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 01:08:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 01:08:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 01:08:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 01:08:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVgfMSI63AfYI04d2EkxhbU++YJRLtIWRQmzaZPrAMWEqdXd8TaDdQe4ktgAS+o16vOLHrGSd3yoojVtBz7y3FTnEC7ieuE7IvQ3WuYIKDnkKdOnJ8dnIcosE9OMqvLK1lqgXIGy1oM0WSiH++D0naQuKuwszpcgLXOB7VbNASJfvv9rN+gcvyo4KE9bNg/8LXzHLCpq5pOMtBs20U7oUNpeGOctgAIbx7Wij2LIebQdz8NC7yWVajCUqu27vXfZKgpxTW4lmqXVnDV7YPKTjxRRwbxvOU85Q23whPCMUfR1TjZyjVf7UX5IXsIzZc3/07z5j8IaBakR1nc208vAYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0U3lTj/tPRmyIGYrDpgFwP6cEu+sscxXqymcY2DZzY=;
 b=cDi19bfqmfA4iK544qd9ypo4gzQoy7Lj0STV5yfg/yMqec3iX3HbuJVTcjkOTr8i00B0Z4ZCKvU64alnWoQECNfYI591NgE7E16r2iIUKsgBC7HPIkWhMzepwNOcc64LQMiLAqv5LGCuEdc1MoM8VBW2LJ4rNZBsKJgOV8rHYLklr1ukziV3XdeBs63ysal4pZM3N2DWs9O6uwUhRhLSBf/87Hj1Ss6z9urisIv7YGZWq2TIKUZ6K0DEsIMGYxPzZIcUYVqbk/bk/XroX0xxn9jDkgLNbRirFkwwsDmVFVagIL4zCog6rN21ZToGolVK2qf1buJrohSi2mYNX2yeJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS7PR11MB7738.namprd11.prod.outlook.com (2603:10b6:8:e0::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.25; Wed, 10 Apr 2024 08:08:34 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 08:08:34 +0000
Content-Type: multipart/alternative;
 boundary="------------mVBHpJJUUwAI6xVA0tdjBdcC"
Message-ID: <dcef854d-9539-4370-b896-b7ae4f72ec9b@intel.com>
Date: Wed, 10 Apr 2024 13:38:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Add helpers for GuC KLVs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240408181408.1023-1-michal.wajdeczko@intel.com>
 <20240408181408.1023-2-michal.wajdeczko@intel.com>
 <7ebc9a2e-e876-4471-aa26-c31f1d2e4ed7@intel.com>
 <7f96ad9c-e16c-49ff-bb7f-ad9ad37f9a1c@intel.com>
 <091deb47-a27d-4d7d-a8ba-df5f707b9576@intel.com>
 <3970f70e-db7a-405b-a027-ea5195056639@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <3970f70e-db7a-405b-a027-ea5195056639@intel.com>
X-ClientProxiedBy: PN3PR01CA0166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::10) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS7PR11MB7738:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zakCA+4OkqhsEvQs86uoOZ/y87e8fIJJVT/GkQpVxzDFkEsIMGvjYKpHLR7HKP7t3mAzRyXl1o/Pw5UOfrjOM9Rx8i/NhoiT+/bIlP/igCU644O1xQdwV1LEN0H1wQ9Z/B98F0Tcd75lNJagPK7Q7B4NTTvywQ30T2tijB0nN2OCd22udftQzMlleEgqH5AzSW3k52+iTxe2DxFygcGpZgE4Ge14LvG19R8w1tckTm2DBnoX89zACDd4Ydzs1WxkFaYxg76TUmUC12Op7eRao7zLHWDC7HhZo+gEEcjTdLlCPDzy5xqsiwzaYpGNBW+BuGEb5YEMrS9ML3dQls9KAK4sU2uJcZjpodNyH491e4KMOW53iOF2OiyGV1J4T2ROYnsZ7XZMbiIoCHnueqDRcU19EFw3Wt78LwXupQoaTCSQvntUZWoU6cL/kxb1SJLksqKlovg5C2HOGSBcG7WzlVXMfiQzRdPHQEy13u7i/XMextVGpD2v6sBCCPKow0OwCAQWy/DHa8ocsHoXw4SkZV1gkr/LYJG7Yngk9XUMcwZ/JN2+A3r6lh2YDvz7Uza3GbLC8E74rGI4WMEW9Mo/QCDsQowoKzv6FFMoIDL8QaISWbK5KX6kD+wVwUDkOcTu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFNoaEFHd1pUUkxiZEtqYm12ZC83Ry85YTRxY0N6Z0dvZWlWZlJEUVVWTGRS?=
 =?utf-8?B?d2pWa3Q1WGlud3lDNWtjaVQ4SUFaNWNUSlhTMUphcGd0MDB3di9yL3c2Z3lr?=
 =?utf-8?B?aCtSdWZ5VFBqczVLbmV0aGhtQUNrR2lTbTZlQWc0aDZwQ3lETWRCVUFsNEl1?=
 =?utf-8?B?Slh6cDYxM0JWVVZ6dGpuNVRkN1ovQ2FYdUYvUHhxOGN3aTI1Tmc2SElCb09E?=
 =?utf-8?B?bUJjaExtbThaUTVuSnlzRVRkamNwSlo0WGtWT0pEMHRnL0ZWdC9jT2tCZVJq?=
 =?utf-8?B?dklHOHV6czVOamtlRmtrd3N2eDh4MytpQUNiTEdHMGVlR2l4VFAwbDFJREdZ?=
 =?utf-8?B?azFXU041YUdwUzEzdlR6UTUyOVNkVFBUSU0yTzFYcHJ5TjlyRVE2b3o1cFNB?=
 =?utf-8?B?a1B2aVhVc0E3bXhsT0QyYWQyWmRkekxuZVBDeGJSeTNRQVIwNEJ3a3E4Q0VH?=
 =?utf-8?B?NFAwU1BqcjUzNmFUb0k0UVZjYjZic3ppK3pEbnRzblgvcVZJWjZaR3EvbEhO?=
 =?utf-8?B?d1VQb01NeGNZSG5tTnNIZW1lOEphR254dDcrZ2ZxcFFRSVNhQ3dkY0FrT0NH?=
 =?utf-8?B?RjVKbURlWlJTK2dhWTh3bzVKMDNzZlhwR2M5Z2NRcWJuemFSVzQ4dTNTaDVh?=
 =?utf-8?B?NVh2N2ZrZXhvN2h0Y2N3OTVVVDJXNVlJZzU2M09pVFhiMG5vMHl0Q0U0ZHFY?=
 =?utf-8?B?RGI1SjNETzBUV29oRVhxV1VtbG1QVUZDN3p2anEvVDlaZlJuZkNvU0o1a3N5?=
 =?utf-8?B?R1NsRU1hdTlVUVRWUFhWMnVDa09pNHhDazVad0hZTU8xaXJGdzZ0OFlxdUs2?=
 =?utf-8?B?R1oyZVRuM3kwN3ZqUDVSUGtXd242dFloYUxGODlFQm5HWjVJU1NkS1hiVFBO?=
 =?utf-8?B?WlU2R0x4R1ExY0JNYS9telNabHNzTWFiL3c1NkFRNEVrODlUNnBpcTdwQStS?=
 =?utf-8?B?T3NTRGJQa0hQazZYWTJPVU9tdGVpOEg4WHVuWVJzaHVZWXE0TVljNlFSaDhL?=
 =?utf-8?B?MEEvNHBFZDZ5OUM1MExvSzJSVWV3ZndPSHZod3NWZVllN3BxTVJvRU1pMzlH?=
 =?utf-8?B?T2l1TFp6WExxWWd1WGN5RW1kNU1mektPTTVVOHRyV3hqY1d4bjRsa3hVaWVE?=
 =?utf-8?B?MmV1aEpsMmNqY3dBSHdvWCsybGlHQyt1aHRpNUlXSjlKUHVIdyttaDE3Yk5x?=
 =?utf-8?B?ZVVuaXZLR0dRRXYrRStCMUxNSmVXckt4REgwQ0s3TWF5aGFIbTVsODhMazFy?=
 =?utf-8?B?YTgyWkJKVXNSMTJ1WjJFNGxnd0J4VndvRjNLTkJMT3BRUlAzMkJucXpSbWZZ?=
 =?utf-8?B?R2x3QXFNWmFMNjFjRnNaZnM3cnRhcXg1QUh0ekFFeHhJdUxCYWhnaWNXU2Fl?=
 =?utf-8?B?ZFBNb2RkTlpIQjJHWnJmY0pyZzFWcHZUaEdTMmphUkRrNGFLU3ZuV09LOEw3?=
 =?utf-8?B?L2tNcWFkdFh6VllZMjZoRzRqeXlQN1M0WUl1SGdweEVJaFpsU09FbyszMmxP?=
 =?utf-8?B?NVdlZDV5dllLYVE2Y2ZNRWsvL1lmaHdsM0lnd3hEN2cwVUJOWXhjNFNFc0w4?=
 =?utf-8?B?RS9wL3RibmxqWThRVmVyM1g1c25STTJRRFpkbmFsOUM4dnllNTQ5RDlKeU03?=
 =?utf-8?B?U1NZR1dKZG1KUnZYMDBWT0ozdHV6U0FnNm9CdE9RNm5acTNYRldrMFdTbTJx?=
 =?utf-8?B?T2hQNk43U1RMMTNGL2RET0VWOTRramN0Q3NFTGZYekIyWkI0MGJKYnVjcC85?=
 =?utf-8?B?ZFFyWnQ3Qis5a0srSjNYNFFNVndWY3dyVjI4cDdiS3dQQThMeGZFNWsrakNH?=
 =?utf-8?B?QjVZVk81NHdlK1BHejZCcWxQMDNyOXRrSlFUOFFEQ1lvbEJqVVZ4dXg2R3pL?=
 =?utf-8?B?Y2tSVVorMGpRTnErWWJzdXBGdkpCOG9TMitNTGFzeGgzYUFzbjhmZnJtaVJ2?=
 =?utf-8?B?WHVKby9xcWNlZEFmVkwwRWFFQnNiYkw1bzFXaWdqUDBhRG9NbndXWFZlU0xZ?=
 =?utf-8?B?ZUJjRE8yRFJXbExHeHVIL1lOZi83T0dYNzZVajFsOHB4M2UxMzg3TjhiLzNV?=
 =?utf-8?B?OWRielRSODFWRFJlMktxeGUyNEtRb0pxMGE5a1BvLysvSmtFclFEOTB4dlUw?=
 =?utf-8?B?TXFwR3l6SDRGbytMSVVGbmtnTGlHRzZvMTFWL255MjQvSjN0Z3VBYWw3TUtl?=
 =?utf-8?Q?EMFIupI62PCGyVI0XBBKFMI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58db5422-cd02-45dc-3cab-08dc59356a96
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 08:08:33.9327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NqU8giMDAEbDK3/8+0t8FLloVuWosviRU2G0p9FQsmehUU/SCcl2SQBjuzLPf5xMhMUvuoOTAb414AgqnBSBJQgeYNzom4BILBIhCtL+ZPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7738
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

--------------mVBHpJJUUwAI6xVA0tdjBdcC
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 09-04-2024 21:41, Michal Wajdeczko wrote:
>
> On 09.04.2024 17:45, Ghimiray, Himal Prasad wrote:
>> On 09-04-2024 15:05, Michal Wajdeczko wrote:
>>> On 08.04.2024 22:23, Ghimiray, Himal Prasad wrote:
>>>> On 08-04-2024 23:44, Michal Wajdeczko wrote:
>>>>> Many of the GuC actions use KLVs to pass additional parameters or
>>>>> configuration data. Add few helper functions for better reporting
>>>>> any information related to KLVs.
>>>>>
>>>>> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/Makefile             |   1 +
>>>>>     drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 133
>>>>> ++++++++++++++++++++++++
>>>>>     drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  51 +++++++++
>>>>>     3 files changed, 185 insertions(+)
>>>>>     create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>>>     create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>>> index e5b1715f721e..ec0d1fb49b1e 100644
>>>>> --- a/drivers/gpu/drm/xe/Makefile
>>>>> +++ b/drivers/gpu/drm/xe/Makefile
>>>>> @@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>>>>>         xe_guc_debugfs.o \
>>>>>         xe_guc_hwconfig.o \
>>>>>         xe_guc_id_mgr.o \
>>>>> +    xe_guc_klv_helpers.o \
>>>>>         xe_guc_log.o \
>>>>>         xe_guc_pc.o \
>>>>>         xe_guc_submit.o \
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>>> b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>>> new file mode 100644
>>>>> index 000000000000..c39fda08afcb
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>>> @@ -0,0 +1,133 @@
>>>>> +// SPDX-License-Identifier: MIT
>>>>> +/*
>>>>> + * Copyright © 2024 Intel Corporation
>>>>> + */
>>>>> +
>>>>> +#include <linux/bitfield.h>
>>>>> +#include <drm/drm_print.h>
>>>>> +
>>>>> +#include "abi/guc_klvs_abi.h"
>>>>> +#include "xe_guc_klv_helpers.h"
>>>>> +
>>>>> +#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>>>> is this macro necessary, it's being called in one place ?
>>>>
>>>> ((u64)hi << 32) | lo  should be enough.
>>> IMO it is better to have a macro (with name) than a magic formula
>>> besides, this macro here is (I hope) just temporary as either:
>>>    - it will be promoted to xe_macros.h [1], or
>>>    - something similar will be available in wordpart.h [2]
>>>
>>> [1]https://patchwork.freedesktop.org/series/129854/
>>>
>>> [2]
>>> https://lore.kernel.org/lkml/20240214214654.1700-1-michal.wajdeczko@intel.com/
>> Thanks for the info.
>>>>> +
>>>>> +/**
>>>>> + * xe_guc_klv_key_to_string - Convert KLV key into friendly name.
>>>>> + * @key: the `GuC KLV`_ key
>>>>> + *
>>>>> + * Return: name of the KLV key.
>>>>> + */
>>>>> +const char *xe_guc_klv_key_to_string(u16 key)
>>>>> +{
>>>>> +    switch (key) {
>>>>> +    /* VGT POLICY keys */
>>>>> +    case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
>>>>> +        return "sched_if_idle";
>>>>> +    case GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY:
>>>>> +        return "sample_period";
>>>>> +    case GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY:
>>>>> +        return "reset_engine";
>>>>> +    /* VF CFG keys */
>>>>> +    case GUC_KLV_VF_CFG_GGTT_START_KEY:
>>>>> +        return "ggtt_start";
>>>>> +    case GUC_KLV_VF_CFG_GGTT_SIZE_KEY:
>>>>> +        return "ggtt_size";
>>>>> +    case GUC_KLV_VF_CFG_LMEM_SIZE_KEY:
>>>>> +        return "lmem_size";
>>>>> +    case GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY:
>>>>> +        return "num_contexts";
>>>>> +    case GUC_KLV_VF_CFG_TILE_MASK_KEY:
>>>>> +        return "tile_mask";
>>>>> +    case GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY:
>>>>> +        return "num_doorbells";
>>>>> +    case GUC_KLV_VF_CFG_EXEC_QUANTUM_KEY:
>>>>> +        return "exec_quantum";
>>>>> +    case GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY:
>>>>> +        return "preempt_timeout";
>>>>> +    case GUC_KLV_VF_CFG_BEGIN_DOORBELL_ID_KEY:
>>>>> +        return "begin_db_id";
>>>>> +    case GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY:
>>>>> +        return "begin_ctx_id";
>>>> default:
>>>>
>>>> return "(unknown)";
>>>>
>>>> Have seen warning/errors if default is not defined in switch-case.
>>> likely compiler was complaining because of enum being used in switch
>>> statement, but here it is u16, so there shouldn't be any warnings
>>>
>>> but can add 'default' case if you consider that as a blocker
>> I have no strong objection on this, if compiler is not complaining.
>>>>> +    }
>>>>> +    return "(unknown)";
>>>> remove.
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * xe_guc_klv_print - Print content of the buffer with `GuC KLV`_.
>>>>> + * @klvs: the buffer with KLVs
>>>>> + * @num_dwords: number of dwords (u32) available in the buffer
>>>>> + * @p: the &drm_printer
>>>>> + *
>>>>> + * The buffer may contain more than one KLV.
>>>>> + */
>>>>> +void xe_guc_klv_print(const u32 *klvs, u32 num_dwords, struct
>>>>> drm_printer *p)
>>>>> +{
>>>>> +    while (num_dwords >= GUC_KLV_LEN_MIN) {
>>>>> +        u32 key = FIELD_GET(GUC_KLV_0_KEY, klvs[0]);
>>>>> +        u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
>>>>> +
>>>>> +        klvs += GUC_KLV_LEN_MIN;
>>>>> +        num_dwords -= GUC_KLV_LEN_MIN;
>>>>> +
>>>>> +        if (num_dwords < len) {
>>>>> +            drm_printf(p, "{ key %#06x : truncated %zu of %zu bytes
>>>>> %*ph } # %s\n",
>>>>> +                   key, num_dwords * sizeof(u32), len * sizeof(u32),
>>>>> +                   (int)(num_dwords * sizeof(u32)), klvs,
>>>>> +                   xe_guc_klv_key_to_string(key));
>>>>> +            return;
>>>>> +        }
>>>>> +
>>>>> +        switch (len) {
>>>>> +        case 0:
>>>>> +            drm_printf(p, "{ key %#06x : no value } # %s\n",
>>>>> +                   key, xe_guc_klv_key_to_string(key));
>>>>> +            break;
>>>>> +        case 1:
>>>>> +            drm_printf(p, "{ key %#06x : 32b value %u } # %s\n",
>>>>> +                   key, klvs[0], xe_guc_klv_key_to_string(key));
>>>>> +            break;
>>>>> +        case 2:
>>>>> +            drm_printf(p, "{ key %#06x : 64b value %#llx } # %s\n",
>>>>> +                   key, make_u64(klvs[1], klvs[0]),
>>>>> +                   xe_guc_klv_key_to_string(key));
>>>>> +            break;
>>>>> +        default:
>>>>> +            drm_printf(p, "{ key %#06x : %zu bytes %*ph } # %s\n",
>>>>> +                   key, len * sizeof(u32), (int)(len * sizeof(u32)),
>>>>> +                   klvs, xe_guc_klv_key_to_string(key));
>>>>> +            break;
>>>>> +        }
>>>>> +
>>>>> +        klvs += len;
>>>>> +        num_dwords -= len;
>>>>> +    }
>>>>> +
>>>>> +    /* we don't expect any leftovers, fix if KLV header is ever
>>>>> changed */
>>>>> +    BUILD_BUG_ON(GUC_KLV_LEN_MIN > 1);
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * xe_guc_klv_count - Count KLVs present in the buffer.
>>>>> + * @klvs: the buffer with KLVs
>>>>> + * @num_dwords: number of dwords (u32) in the buffer
>>>>> + *
>>>>> + * Return: number of recognized KLVs or
>>>>> + *          a negative error code if KLV buffer is truncated.
>>> see here ^^^
>>>
>>>>> + */
>>>>> +int xe_guc_klv_count(const u32 *klvs, u32 num_dwords)
>>>>> +{
>>>>> +    int num_klvs = 0;
>>>>> +
>>>>> +    while (num_dwords >= GUC_KLV_LEN_MIN) {
>>>>> +        u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
>>>>> +
>>>>> +        if (num_dwords < len + GUC_KLV_LEN_MIN)
>>>>> +            return -ENODATA;
>>>>> +
>>>>> +        klvs += GUC_KLV_LEN_MIN + len;
>>>>> +        num_dwords -= GUC_KLV_LEN_MIN + len;
>>>>> +        num_klvs++;
>>>>> +    }
>>>>> +
>>>>> +    return num_dwords ? -ENODATA : num_klvs;
>>>> while loop can be terminated only if num_dwords < len + GUC_KLV_LEN_MIN
>>>> or num_dwords is 0. Therefore return num_klvs; should be fine.
>>> but then we won't catch the case with truncated buffer (which indicates
>>> bug somewhere in code or firmware) and it is one of the function goal
>>> and return value
>> I fail to understand in current implementation, even if there is bug
>> somewhere in code or firmware
>>
>> how return num_dwords ? -ENODATA : num_klvs; can return -ENODATA ?
>>
>> num_dwords is u32 so always >= 0 and while loop keeps running unless
>> num_dwords < len + GUC_KLV_LEN_MIN
> loop keeps running unless (num_dwords < GUC_KLV_LEN_MIN)
> there is no 'len' in this condition
>
>> or num_dwords is 0.
> that's true but only because you've looked at the value of
> GUC_KLV_LEN_MIN which happen to be 1
>
>> In case of num_dwords < len + GUC_KLV_LEN_MIN it
>> will return -ENODATA in above loop itself.
> this early return inside the loop was for cases where the buffer was
> truncated in such a way that it contains the KLV header but doesn't hold
> full value, while the final return was to catch the case where the
> buffer was truncated at the KLV header itself
>
> so yes, with GUC_KLV_LEN_MIN=1 the num_dwords outside the loop will be
> always 0, making this final condition questionable, but that requires
> knowledge of the GUC_KLV_LEN_MIN
Yes , my comments are on the basis of GUC_KLV_LEN_MIN value defined in 
guc_klvs_abi.h
>
> maybe best option to have generic solution would be to just break the
> loop on (num_dwords < len + GUC_KLV_LEN_MIN) instead doing early return

This approach separates out the condition expression and return at the 
expense of extra comparison. I think that's ok.

>
>>>>> +}
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>>>>> b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>>>>> new file mode 100644
>>>>> index 000000000000..b835e0ebe6db
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>>>>> @@ -0,0 +1,51 @@
>>>>> +/* SPDX-License-Identifier: MIT */
>>>>> +/*
>>>>> + * Copyright © 2024 Intel Corporation
>>>>> + */
>>>>> +
>>>>> +#ifndef _XE_GUC_KLV_HELPERS_H_
>>>>> +#define _XE_GUC_KLV_HELPERS_H_
>>>>> +
>>>>> +#include <linux/types.h>
>>>>> +
>>>>> +struct drm_printer;
>>>>> +
>>>>> +const char *xe_guc_klv_key_to_string(u16 key);
>>>>> +
>>>>> +void xe_guc_klv_print(const u32 *klvs, u32 num_dwords, struct
>>>>> drm_printer *p);
>>>>> +int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
>>>>> +
>>>>> +/**
>>>>> + * PREP_GUC_KLV - Prepare KLV header value based on provided key and
>>>>> len.
>>>>> + * @key: KLV key
>>>>> + * @len: KLV length
>>>>> + *
>>>>> + * Return: value of the KLV header (u32).
>>>>> + */
>>>>> +#define PREP_GUC_KLV(key, len) \
>>>>> +    (FIELD_PREP(GUC_KLV_0_KEY, (key)) | \
>>>>> +     FIELD_PREP(GUC_KLV_0_LEN, (len)))
>>>>> +
>>>>> +/**
>>>>> + * PREP_GUC_KLV_CONST - Prepare KLV header value based on const key
>>>>> and len.
>>>>> + * @key: const KLV key
>>>>> + * @len: const KLV length
>>>>> + *
>>>>> + * Return: value of the KLV header (u32).
>>>>> + */
>>>>> +#define PREP_GUC_KLV_CONST(key, len) \
>>>>> +    (FIELD_PREP_CONST(GUC_KLV_0_KEY, (key)) | \
>>>>> +     FIELD_PREP_CONST(GUC_KLV_0_LEN, (len)))
>>>>> +
>>>>> +/**
>>>>> + * PREP_GUC_KLV_TAG - Prepare KLV header value based on unique KLV
>>>>> definition tag.
>>>>> + * @TAG: unique tag of the KLV definition
>>>>> + *
>>>>> + * Combine separate KEY and LEN definitions of the KLV identified by
>>>>> the TAG.
>>>>> + *
>>>>> + * Return: value of the KLV header (u32).
>>>>> + */
>>>>> +#define PREP_GUC_KLV_TAG(TAG) \
>>>>> +    PREP_GUC_KLV_CONST(GUC_KLV_##TAG##_KEY, GUC_KLV_##TAG##_LEN)
>>>>> +
>>>>> +#endif
--------------mVBHpJJUUwAI6xVA0tdjBdcC
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 09-04-2024 21:41, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:3970f70e-db7a-405b-a027-ea5195056639@intel.com">
      <pre class="moz-quote-pre" wrap="">

On 09.04.2024 17:45, Ghimiray, Himal Prasad wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 09-04-2024 15:05, Michal Wajdeczko wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
On 08.04.2024 22:23, Ghimiray, Himal Prasad wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 08-04-2024 23:44, Michal Wajdeczko wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Many of the GuC actions use KLVs to pass additional parameters or
configuration data. Add few helper functions for better reporting
any information related to KLVs.

Signed-off-by: Michal Wajdeczko<a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
&nbsp;&nbsp; drivers/gpu/drm/xe/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +
&nbsp;&nbsp; drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 133
++++++++++++++++++++++++
&nbsp;&nbsp; drivers/gpu/drm/xe/xe_guc_klv_helpers.h |&nbsp; 51 +++++++++
&nbsp;&nbsp; 3 files changed, 185 insertions(+)
&nbsp;&nbsp; create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.c
&nbsp;&nbsp; create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e5b1715f721e..ec0d1fb49b1e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -98,6 +98,7 @@ xe-y += xe_bb.o \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_guc_debugfs.o \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_guc_hwconfig.o \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_guc_id_mgr.o \
+&nbsp;&nbsp;&nbsp; xe_guc_klv_helpers.o \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_guc_log.o \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_guc_pc.o \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_guc_submit.o \
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
new file mode 100644
index 000000000000..c39fda08afcb
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include &lt;linux/bitfield.h&gt;
+#include &lt;drm/drm_print.h&gt;
+
+#include &quot;abi/guc_klvs_abi.h&quot;
+#include &quot;xe_guc_klv_helpers.h&quot;
+
+#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) &lt;&lt; 32 | (u32)(lo)))
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">is this macro necessary, it's being called in one place ?

((u64)hi &lt;&lt; 32) | lo&nbsp; should be enough.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">IMO it is better to have a macro (with name) than a magic formula
besides, this macro here is (I hope) just temporary as either:
&nbsp; - it will be promoted to xe_macros.h [1], or
&nbsp; - something similar will be available in wordpart.h [2]

[1]<a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/129854/">https://patchwork.freedesktop.org/series/129854/</a>

[2]
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/lkml/20240214214654.1700-1-michal.wajdeczko@intel.com/">https://lore.kernel.org/lkml/20240214214654.1700-1-michal.wajdeczko@intel.com/</a>
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Thanks for the info.
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">+
+/**
+ * xe_guc_klv_key_to_string - Convert KLV key into friendly name.
+ * @key: the `GuC KLV`_ key
+ *
+ * Return: name of the KLV key.
+ */
+const char *xe_guc_klv_key_to_string(u16 key)
+{
+&nbsp;&nbsp;&nbsp; switch (key) {
+&nbsp;&nbsp;&nbsp; /* VGT POLICY keys */
+&nbsp;&nbsp;&nbsp; case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;sched_if_idle&quot;;
+&nbsp;&nbsp;&nbsp; case GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;sample_period&quot;;
+&nbsp;&nbsp;&nbsp; case GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;reset_engine&quot;;
+&nbsp;&nbsp;&nbsp; /* VF CFG keys */
+&nbsp;&nbsp;&nbsp; case GUC_KLV_VF_CFG_GGTT_START_KEY:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;ggtt_start&quot;;
+&nbsp;&nbsp;&nbsp; case GUC_KLV_VF_CFG_GGTT_SIZE_KEY:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;ggtt_size&quot;;
+&nbsp;&nbsp;&nbsp; case GUC_KLV_VF_CFG_LMEM_SIZE_KEY:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;lmem_size&quot;;
+&nbsp;&nbsp;&nbsp; case GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;num_contexts&quot;;
+&nbsp;&nbsp;&nbsp; case GUC_KLV_VF_CFG_TILE_MASK_KEY:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;tile_mask&quot;;
+&nbsp;&nbsp;&nbsp; case GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;num_doorbells&quot;;
+&nbsp;&nbsp;&nbsp; case GUC_KLV_VF_CFG_EXEC_QUANTUM_KEY:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;exec_quantum&quot;;
+&nbsp;&nbsp;&nbsp; case GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;preempt_timeout&quot;;
+&nbsp;&nbsp;&nbsp; case GUC_KLV_VF_CFG_BEGIN_DOORBELL_ID_KEY:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;begin_db_id&quot;;
+&nbsp;&nbsp;&nbsp; case GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;begin_ctx_id&quot;;
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">default:

return &quot;(unknown)&quot;;

Have seen warning/errors if default is not defined in switch-case.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">likely compiler was complaining because of enum being used in switch
statement, but here it is u16, so there shouldn't be any warnings

but can add 'default' case if you consider that as a blocker
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I have no strong objection on this, if compiler is not complaining.
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">+&nbsp;&nbsp;&nbsp; }
+&nbsp;&nbsp;&nbsp; return &quot;(unknown)&quot;;
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">remove.
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">+}
+
+/**
+ * xe_guc_klv_print - Print content of the buffer with `GuC KLV`_.
+ * @klvs: the buffer with KLVs
+ * @num_dwords: number of dwords (u32) available in the buffer
+ * @p: the &amp;drm_printer
+ *
+ * The buffer may contain more than one KLV.
+ */
+void xe_guc_klv_print(const u32 *klvs, u32 num_dwords, struct
drm_printer *p)
+{
+&nbsp;&nbsp;&nbsp; while (num_dwords &gt;= GUC_KLV_LEN_MIN) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 key = FIELD_GET(GUC_KLV_0_KEY, klvs[0]);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; klvs += GUC_KLV_LEN_MIN;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_dwords -= GUC_KLV_LEN_MIN;
+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (num_dwords &lt; len) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;{ key %#06x : truncated %zu of %zu bytes
%*ph } # %s\n&quot;,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key, num_dwords * sizeof(u32), len * sizeof(u32),
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (int)(num_dwords * sizeof(u32)), klvs,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_guc_klv_key_to_string(key));
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (len) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 0:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;{ key %#06x : no value } # %s\n&quot;,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key, xe_guc_klv_key_to_string(key));
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 1:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;{ key %#06x : 32b value %u } # %s\n&quot;,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key, klvs[0], xe_guc_klv_key_to_string(key));
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 2:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;{ key %#06x : 64b value %#llx } # %s\n&quot;,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key, make_u64(klvs[1], klvs[0]),
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_guc_klv_key_to_string(key));
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;{ key %#06x : %zu bytes %*ph } # %s\n&quot;,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key, len * sizeof(u32), (int)(len * sizeof(u32)),
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; klvs, xe_guc_klv_key_to_string(key));
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; klvs += len;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_dwords -= len;
+&nbsp;&nbsp;&nbsp; }
+
+&nbsp;&nbsp;&nbsp; /* we don't expect any leftovers, fix if KLV header is ever
changed */
+&nbsp;&nbsp;&nbsp; BUILD_BUG_ON(GUC_KLV_LEN_MIN &gt; 1);
+}
+
+/**
+ * xe_guc_klv_count - Count KLVs present in the buffer.
+ * @klvs: the buffer with KLVs
+ * @num_dwords: number of dwords (u32) in the buffer
+ *
+ * Return: number of recognized KLVs or
+ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a negative error code if KLV buffer is truncated.
</pre>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">see here ^^^

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">+ */
+int xe_guc_klv_count(const u32 *klvs, u32 num_dwords)
+{
+&nbsp;&nbsp;&nbsp; int num_klvs = 0;
+
+&nbsp;&nbsp;&nbsp; while (num_dwords &gt;= GUC_KLV_LEN_MIN) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (num_dwords &lt; len + GUC_KLV_LEN_MIN)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENODATA;
+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; klvs += GUC_KLV_LEN_MIN + len;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_dwords -= GUC_KLV_LEN_MIN + len;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_klvs++;
+&nbsp;&nbsp;&nbsp; }
+
+&nbsp;&nbsp;&nbsp; return num_dwords ? -ENODATA : num_klvs;
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">while loop can be terminated only if num_dwords &lt; len + GUC_KLV_LEN_MIN
or num_dwords is 0. Therefore return num_klvs; should be fine.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">but then we won't catch the case with truncated buffer (which indicates
bug somewhere in code or firmware) and it is one of the function goal
and return value
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I fail to understand in current implementation, even if there is bug
somewhere in code or firmware

how return num_dwords ? -ENODATA : num_klvs; can return -ENODATA ?

num_dwords is u32 so always &gt;= 0 and while loop keeps running unless
num_dwords &lt; len + GUC_KLV_LEN_MIN
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
loop keeps running unless (num_dwords &lt; GUC_KLV_LEN_MIN)
there is no 'len' in this condition

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
or num_dwords is 0. 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
that's true but only because you've looked at the value of
GUC_KLV_LEN_MIN which happen to be 1

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">In case of num_dwords &lt; len + GUC_KLV_LEN_MIN it
will return -ENODATA in above loop itself.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
this early return inside the loop was for cases where the buffer was
truncated in such a way that it contains the KLV header but doesn't hold
full value, while the final return was to catch the case where the
buffer was truncated at the KLV header itself

so yes, with GUC_KLV_LEN_MIN=1 the num_dwords outside the loop will be
always 0, making this final condition questionable, but that requires
knowledge of the GUC_KLV_LEN_MIN</pre>
    </blockquote>
    Yes , my comments are on the basis of <span style="white-space: pre-wrap">GUC_KLV_LEN_MIN</span>
    value defined in guc_klvs_abi.h<br>
    <blockquote type="cite" cite="mid:3970f70e-db7a-405b-a027-ea5195056639@intel.com">
      <pre class="moz-quote-pre" wrap="">

maybe best option to have generic solution would be to just break the
loop on (num_dwords &lt; len + GUC_KLV_LEN_MIN) instead doing early return</pre>
    </blockquote>
    <p><span style="color: rgb(13, 13, 13); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">This approach separates out the condition expression and return at the expense of extra comparison. I think that's ok. </span></p>
    <blockquote type="cite" cite="mid:3970f70e-db7a-405b-a027-ea5195056639@intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">+}
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
new file mode 100644
index 000000000000..b835e0ebe6db
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_GUC_KLV_HELPERS_H_
+#define _XE_GUC_KLV_HELPERS_H_
+
+#include &lt;linux/types.h&gt;
+
+struct drm_printer;
+
+const char *xe_guc_klv_key_to_string(u16 key);
+
+void xe_guc_klv_print(const u32 *klvs, u32 num_dwords, struct
drm_printer *p);
+int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
+
+/**
+ * PREP_GUC_KLV - Prepare KLV header value based on provided key and
len.
+ * @key: KLV key
+ * @len: KLV length
+ *
+ * Return: value of the KLV header (u32).
+ */
+#define PREP_GUC_KLV(key, len) \
+&nbsp;&nbsp;&nbsp; (FIELD_PREP(GUC_KLV_0_KEY, (key)) | \
+&nbsp;&nbsp;&nbsp;&nbsp; FIELD_PREP(GUC_KLV_0_LEN, (len)))
+
+/**
+ * PREP_GUC_KLV_CONST - Prepare KLV header value based on const key
and len.
+ * @key: const KLV key
+ * @len: const KLV length
+ *
+ * Return: value of the KLV header (u32).
+ */
+#define PREP_GUC_KLV_CONST(key, len) \
+&nbsp;&nbsp;&nbsp; (FIELD_PREP_CONST(GUC_KLV_0_KEY, (key)) | \
+&nbsp;&nbsp;&nbsp;&nbsp; FIELD_PREP_CONST(GUC_KLV_0_LEN, (len)))
+
+/**
+ * PREP_GUC_KLV_TAG - Prepare KLV header value based on unique KLV
definition tag.
+ * @TAG: unique tag of the KLV definition
+ *
+ * Combine separate KEY and LEN definitions of the KLV identified by
the TAG.
+ *
+ * Return: value of the KLV header (u32).
+ */
+#define PREP_GUC_KLV_TAG(TAG) \
+&nbsp;&nbsp;&nbsp; PREP_GUC_KLV_CONST(GUC_KLV_##TAG##_KEY, GUC_KLV_##TAG##_LEN)
+
+#endif
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------mVBHpJJUUwAI6xVA0tdjBdcC--
