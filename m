Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFE1C67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 15:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6111125CF;
	Tue,  9 Apr 2024 15:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXRp27jX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74E81125CF
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 15:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712677533; x=1744213533;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=FwSB1WhnD6AT3+kn5CM6LRPNT13UNbPNws3L86xrMPc=;
 b=HXRp27jX3i6uffrJny5hRdSHs0yVk+FWFK241ym4b+qjiZjCVFFQTmpl
 N5BouFzVOdeVPkxFQgLgEmYEHSqCYZSwVJBytnkWy5UUF/h/H/ksKM73s
 y3qfp/nMERU25WRACE1qvjZn7Dso4lKCC8Ozz1Prvy61oMD82QIs6D1fM
 nbrxqd2i8Y1MbWyEx9mBre45FWbPnKxrTCDgutXywiBiik4rwE8Op8k6R
 6+hvhxvXQ1/bsTMhtks3nNMGiAWL8E9Uge26gvTwsB7Q3h++D1H+3Ptbe
 hJF2HXaRwHPXj0if5OU/j/emyjqg8x5q86hYafqwdlZanmg4SkYARbcVK w==;
X-CSE-ConnectionGUID: sot1M3IyQ3SqIlRi3xMKow==
X-CSE-MsgGUID: uX0RxeHCRXi/fAG+HFEuww==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18563361"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208,217";a="18563361"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 08:45:32 -0700
X-CSE-ConnectionGUID: gCMNF8oCSHa2Zy/5vpvACw==
X-CSE-MsgGUID: pgOyboc8SP2Y7yNY4OQfQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208,217";a="20195613"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 08:45:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 08:45:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 08:45:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 08:45:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 08:45:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZn5+We2RIDMqJ6syxOAcvNJCzOHAArgfTAeskSReGKOI6eh/5Hkbd6tQ4fzI2THf4+vJ4aZ4er75YQXl9PL2yDEO86LonYkiRtwnUsMKLRAecPT1l1bBGFzmwrDpfH5LEF+1epjsDLCgvcxplG0foEV8prUN9KkegRKbztx+uexW9p2WYZg8P3lTrxW5JJt3c8Qkv5ytrCOHvy7SWLbDVRBMSY2Ah/9fxZ30SGJ8zBbszWs64YA+NpvqVfjFGxm1f6zYmEfrJagAixxc0Ky5tndRDBw0nE9nck2DXz3lmwC3GKtQfpoz+l2D0F98M/R5uFbuxb9RjC1UM7tXTEAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kF6N9hNB3fQ78JBLKVtziYukZjwCyTj4XpX5137ehlQ=;
 b=O3VK7UffnTtcdX5aujKvc7SHhJtn6ftU93lKQPgtz8LWSsU9iEdt0lcoZQ/+pOoevDbH/J378ruKW9BaxKxk1OkHCpnnr7WnUOioMI5DLy9y9axiRqWVHzK5Qu+nM02JY1JSUz9yee0lWit3MC+8GPq3oJ2/qlrRs2sRSYpXlaw6hdFJ4hBLtgadpL8LBrU3Y7Sr0zmvRbAVMjzaUQujUH+WXRHLI6VjgL7uDRhUr/93MY+SkbuQUN2xtW4Z/tdn38qjZ3qs3vXmz61v9fcQz+ebRjJCu8DhoGRK+r7XjcePfOhG/5KUiI1tXbgTQjJqtVtF/AZjymtCjRQ/jK2U4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SN7PR11MB6725.namprd11.prod.outlook.com (2603:10b6:806:267::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Tue, 9 Apr
 2024 15:45:17 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 15:45:17 +0000
Content-Type: multipart/alternative;
 boundary="------------ET9Fjar3o53MwY1k00p5IwGc"
Message-ID: <091deb47-a27d-4d7d-a8ba-df5f707b9576@intel.com>
Date: Tue, 9 Apr 2024 21:15:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Add helpers for GuC KLVs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240408181408.1023-1-michal.wajdeczko@intel.com>
 <20240408181408.1023-2-michal.wajdeczko@intel.com>
 <7ebc9a2e-e876-4471-aa26-c31f1d2e4ed7@intel.com>
 <7f96ad9c-e16c-49ff-bb7f-ad9ad37f9a1c@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <7f96ad9c-e16c-49ff-bb7f-ad9ad37f9a1c@intel.com>
X-ClientProxiedBy: PN3PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::15) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SN7PR11MB6725:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eC9eHmxol4Q7UIxrJ68eEHDBm0uKuA6CXvrxK/5MTJbO5MXbY5DnleQtPuFboyIG1fKYl+caWZjV708PHAj28QOKPQMn030VcVhLMq//wpUoDqVgBc+41oaYWFVQrMNHUvyzIx7m+NqMMnnlYxYIMX+vJlQsRQjxMcoXCYcpLaUvqQ2PEmeZAvcVh4ml6NjVrw5ouQXUNL2IH9J6IZmd1wuMs3i7+A5shf7uHTo+q1T7c3FUswqgBEUhthy70FMu2hB4J01Inz5WDDYq8dx8ZEfX+zxF+iWKF+7/YNWzX7fSmnhR8vImB49MonfZdyFWyHFxIGqUccydaXNrM/6rHqfiKf2yAPdZruDUO9/2X8zrCVbHXdeT/x7UNecB+b9hq85BD5aMi5j3b6EoWfuBu4akdU3Ipmj5VoEl1gQ37JLuVmg+BjTR2vKp/x7WNNP8Q679aZheIXimHoXx3R28DUTp+OppXNyK8gRKKvJcT22Nnko09wQ5wqI0YJXjyjOV15axlhojtRkqGjSqVd27rPRiURH1jQOsaj9oK/QZNmQJDJXtxIaIlv+9IPb39EMLoHrTSJSxEfw/mQoFNFTEhGcerySBSqJG8zevqkaR9UjzpqsoB022pQygMVSJUoVK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmRvcUZMM2R4a1l3NUJraUZETXQ0RXlubC9wY1ZjM0JTd3g4ZUJqZ2pJV1pn?=
 =?utf-8?B?bVNtalpKcGJIZ1dscU5JK296ZVVoU2NmdXBWL3paL1VsQ1l1YXM0Nk5QUGcw?=
 =?utf-8?B?MzVkdnJ5dy9IbjdrejJRbGNxamk0RUoxeGJJZVZEckdGQ0MyK3lnK0trRHRl?=
 =?utf-8?B?d1V0VlhvQm9mRXVRVHlraWxpU0lsaVhqSGYwRy9UYnIrUjlNaDJSQThmTVha?=
 =?utf-8?B?UVdoYjg5TksyZzNrNURpdE9FUklKeDZtcjlMWTRtd1luSVNLbUlyeU8rZlJt?=
 =?utf-8?B?cFdkUFhqaWRVTDI4Wm9BdHQzYlF6b1c0dkxZRGtoZ2dQQkdGR1ZzSldRUU4y?=
 =?utf-8?B?V3k3dTlqYU5HZ1V2VVNXdVFuUUxXbU9ZZWt6S2ZuVDY2andBamd1cUh3M1pP?=
 =?utf-8?B?a04rMDV6QXJPS1JkZE5rVmlVdklaNDhUTkN2Y1l6VzBxOTN4M0R1eFhEdTJN?=
 =?utf-8?B?S0Z2NTEyQkNuZ0V5Wm5KMCtIU1Q3TVZ5aTlQem1yVGRJclNUK05VUHYwMkZZ?=
 =?utf-8?B?cmh4b3Y3ZVhLOEpuNUZwMmFkeGVNQ1pHbTVGMGE4cTlaalJiV1hEeStWUUc5?=
 =?utf-8?B?U3pRaHJWT2tCR0ZqN1RTVFJxVm5UZytwdS9WNnl2bURKWXZoT3h3Q0ViN01z?=
 =?utf-8?B?YkxoZHpZc1ZPZXBYTVFjWC9ncHRFdE5oSU9YQWJQcEJCM2lFSVZ6MXByczQx?=
 =?utf-8?B?aEhuNldpQUU3Tk53dFNDWitEb3R3K3RBVHJQNW9jSjVTNVdEVkh6SUJzdUpC?=
 =?utf-8?B?NjBmN0Z6ekVwY0dYM0V4cVltemZ1N1VMSFUyYUswMUg1OXhXcU92eUZVQ0FN?=
 =?utf-8?B?LzQzQ2pRY2xvZitNZzRvdU5ZZENxRWlhWmRKUXJjNy9NdUhCMVVPYWZmdnI1?=
 =?utf-8?B?Z0MwUkdCcHVqbDFsMUVGRzVLcURhZ05XQTR1RXlMdDArR0RXekNUSlowT3p1?=
 =?utf-8?B?ZFJHVkNLSk5tS2VNWkFkSzN1TDZ6aittZU44azN1SnZIcGhLaFdjdE15aG13?=
 =?utf-8?B?UytkU3M2SHBLaWtpaFVkcUFoVlMxNnpoZU1lM3JrYWJLNDJ6eTlGRklYYnEv?=
 =?utf-8?B?RmdjdGtJY2g0OExzbnVseHpoZVh1VkpDdHFoY0NUNXpyNWFqaHVkY3ZNV2xR?=
 =?utf-8?B?aFdwZVFENUNnUmlSeDByTGdvWldNYTFoeFVVU1lXOHRkUlQzeTV3bjZLNUUz?=
 =?utf-8?B?bDBDRHJSVHZYTDI3YXdtaSt2MHJlY1l6NEhrM24wUk9DRFZFVXNqS3g2eFFW?=
 =?utf-8?B?VlNzMmNaQlcvNCt5OXN4NmRPOXRId0hVT2F2Q091MHpzZlYwK1RDTUQwQnlX?=
 =?utf-8?B?WmFaYlFoUEZyWmdPemU1SlBJS1VwR0NUSUpSblpyTVZKd1dTMnRwZTJYWWFN?=
 =?utf-8?B?ZmlVdmJIL1hqcklvV1dJZlQ2OW9ZSGFhU2hiQXNXOHM5Y0pDcUE2bWlJMHk0?=
 =?utf-8?B?Rm4rVTZid3pnOXdqNjJMZk1saDZwcVdQdnNlYkR2RVh3VTJCejc3RS9MOXYy?=
 =?utf-8?B?OHlTSWxTYm9Jc2tUeTVvL2VCWHBQakptbVR0U20yRmkwakZwUmtqYUVhempE?=
 =?utf-8?B?R2VmT1F2NGUxVjhXMTJ0TEtWR2dmcXpxbVlhZzVqVGlQMi9xM0oxWlc0Zitp?=
 =?utf-8?B?akhIM0w5ekIwTjdMcVMvYVI2QmR5YWNnMVFjQkk1VW9XYlA3a2NtazRuU2lJ?=
 =?utf-8?B?RUZRYkUyVEJpVXRNKzBLejE4elFmOEdlSVJmZzB6WDFpUzBta2MwRHBoSTRK?=
 =?utf-8?B?OFU0QlB1N3JMWUhQMGVtMndvaXcvZjlQdzRMWVMxREhESG5pNlRDNG16K2dG?=
 =?utf-8?B?eWUxblZCZmtCcjFSTk9QcTNRSC84TjNuN0lJOTZvckxDdHdweTF3dkxwdmkx?=
 =?utf-8?B?Q21vejBCZjFCMDEvV3p0TERzVTM3YWhQL3ZnbTlITkx0d0hNR0JQWlA3ZGZt?=
 =?utf-8?B?UHJmbk41ZTJnRldtMGF2T1ZnWHl5VXZKTkdjUkt6T284dXJ6cUFvTUVDdTZ3?=
 =?utf-8?B?YmpQS050YS9JYmhZRmUyMHY0a1RzdnZQbTJDV0Y4YnVGT1V1MnlXRFNUZEZU?=
 =?utf-8?B?ZDZsaHErUERtQXpYd1diVlJlOEpEUEdVQzY0KzRMQUk0S3h5cmYySVhWMmxF?=
 =?utf-8?B?VHJudVFhVSt4NW8vSzB5ZGtNWnNzdGNUV1piQlp1bFo4Wnl0bDlvZU1xbU5X?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b93eea2c-bc15-469c-298d-08dc58ac0db3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 15:45:17.0266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbBvlSQzhj5wN5a5t6qNMHfe5hDfOg+CscfQQdPfb4GaCUPiTKbr+G9B5m7vTxx/phfgKlNOAvBl7N7QcFaXJsYLv2m5BLJjoewojMP616w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6725
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

--------------ET9Fjar3o53MwY1k00p5IwGc
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 09-04-2024 15:05, Michal Wajdeczko wrote:
>
> On 08.04.2024 22:23, Ghimiray, Himal Prasad wrote:
>> On 08-04-2024 23:44, Michal Wajdeczko wrote:
>>> Many of the GuC actions use KLVs to pass additional parameters or
>>> configuration data. Add few helper functions for better reporting
>>> any information related to KLVs.
>>>
>>> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/Makefile             |   1 +
>>>    drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 133 ++++++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  51 +++++++++
>>>    3 files changed, 185 insertions(+)
>>>    create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>    create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index e5b1715f721e..ec0d1fb49b1e 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>>>        xe_guc_debugfs.o \
>>>        xe_guc_hwconfig.o \
>>>        xe_guc_id_mgr.o \
>>> +    xe_guc_klv_helpers.o \
>>>        xe_guc_log.o \
>>>        xe_guc_pc.o \
>>>        xe_guc_submit.o \
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>> b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>> new file mode 100644
>>> index 000000000000..c39fda08afcb
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>> @@ -0,0 +1,133 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#include <linux/bitfield.h>
>>> +#include <drm/drm_print.h>
>>> +
>>> +#include "abi/guc_klvs_abi.h"
>>> +#include "xe_guc_klv_helpers.h"
>>> +
>>> +#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>> is this macro necessary, it's being called in one place ?
>>
>> ((u64)hi << 32) | lo  should be enough.
> IMO it is better to have a macro (with name) than a magic formula
> besides, this macro here is (I hope) just temporary as either:
>   - it will be promoted to xe_macros.h [1], or
>   - something similar will be available in wordpart.h [2]
>
> [1]https://patchwork.freedesktop.org/series/129854/
>
> [2]
> https://lore.kernel.org/lkml/20240214214654.1700-1-michal.wajdeczko@intel.com/
Thanks for the info.
>
>>> +
>>> +/**
>>> + * xe_guc_klv_key_to_string - Convert KLV key into friendly name.
>>> + * @key: the `GuC KLV`_ key
>>> + *
>>> + * Return: name of the KLV key.
>>> + */
>>> +const char *xe_guc_klv_key_to_string(u16 key)
>>> +{
>>> +    switch (key) {
>>> +    /* VGT POLICY keys */
>>> +    case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
>>> +        return "sched_if_idle";
>>> +    case GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY:
>>> +        return "sample_period";
>>> +    case GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY:
>>> +        return "reset_engine";
>>> +    /* VF CFG keys */
>>> +    case GUC_KLV_VF_CFG_GGTT_START_KEY:
>>> +        return "ggtt_start";
>>> +    case GUC_KLV_VF_CFG_GGTT_SIZE_KEY:
>>> +        return "ggtt_size";
>>> +    case GUC_KLV_VF_CFG_LMEM_SIZE_KEY:
>>> +        return "lmem_size";
>>> +    case GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY:
>>> +        return "num_contexts";
>>> +    case GUC_KLV_VF_CFG_TILE_MASK_KEY:
>>> +        return "tile_mask";
>>> +    case GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY:
>>> +        return "num_doorbells";
>>> +    case GUC_KLV_VF_CFG_EXEC_QUANTUM_KEY:
>>> +        return "exec_quantum";
>>> +    case GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY:
>>> +        return "preempt_timeout";
>>> +    case GUC_KLV_VF_CFG_BEGIN_DOORBELL_ID_KEY:
>>> +        return "begin_db_id";
>>> +    case GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY:
>>> +        return "begin_ctx_id";
>> default:
>>
>> return "(unknown)";
>>
>> Have seen warning/errors if default is not defined in switch-case.
> likely compiler was complaining because of enum being used in switch
> statement, but here it is u16, so there shouldn't be any warnings
>
> but can add 'default' case if you consider that as a blocker
I have no strong objection on this, if compiler is not complaining.
>
>>> +    }
>>> +    return "(unknown)";
>> remove.
>>> +}
>>> +
>>> +/**
>>> + * xe_guc_klv_print - Print content of the buffer with `GuC KLV`_.
>>> + * @klvs: the buffer with KLVs
>>> + * @num_dwords: number of dwords (u32) available in the buffer
>>> + * @p: the &drm_printer
>>> + *
>>> + * The buffer may contain more than one KLV.
>>> + */
>>> +void xe_guc_klv_print(const u32 *klvs, u32 num_dwords, struct
>>> drm_printer *p)
>>> +{
>>> +    while (num_dwords >= GUC_KLV_LEN_MIN) {
>>> +        u32 key = FIELD_GET(GUC_KLV_0_KEY, klvs[0]);
>>> +        u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
>>> +
>>> +        klvs += GUC_KLV_LEN_MIN;
>>> +        num_dwords -= GUC_KLV_LEN_MIN;
>>> +
>>> +        if (num_dwords < len) {
>>> +            drm_printf(p, "{ key %#06x : truncated %zu of %zu bytes
>>> %*ph } # %s\n",
>>> +                   key, num_dwords * sizeof(u32), len * sizeof(u32),
>>> +                   (int)(num_dwords * sizeof(u32)), klvs,
>>> +                   xe_guc_klv_key_to_string(key));
>>> +            return;
>>> +        }
>>> +
>>> +        switch (len) {
>>> +        case 0:
>>> +            drm_printf(p, "{ key %#06x : no value } # %s\n",
>>> +                   key, xe_guc_klv_key_to_string(key));
>>> +            break;
>>> +        case 1:
>>> +            drm_printf(p, "{ key %#06x : 32b value %u } # %s\n",
>>> +                   key, klvs[0], xe_guc_klv_key_to_string(key));
>>> +            break;
>>> +        case 2:
>>> +            drm_printf(p, "{ key %#06x : 64b value %#llx } # %s\n",
>>> +                   key, make_u64(klvs[1], klvs[0]),
>>> +                   xe_guc_klv_key_to_string(key));
>>> +            break;
>>> +        default:
>>> +            drm_printf(p, "{ key %#06x : %zu bytes %*ph } # %s\n",
>>> +                   key, len * sizeof(u32), (int)(len * sizeof(u32)),
>>> +                   klvs, xe_guc_klv_key_to_string(key));
>>> +            break;
>>> +        }
>>> +
>>> +        klvs += len;
>>> +        num_dwords -= len;
>>> +    }
>>> +
>>> +    /* we don't expect any leftovers, fix if KLV header is ever
>>> changed */
>>> +    BUILD_BUG_ON(GUC_KLV_LEN_MIN > 1);
>>> +}
>>> +
>>> +/**
>>> + * xe_guc_klv_count - Count KLVs present in the buffer.
>>> + * @klvs: the buffer with KLVs
>>> + * @num_dwords: number of dwords (u32) in the buffer
>>> + *
>>> + * Return: number of recognized KLVs or
>>> + *          a negative error code if KLV buffer is truncated.
> see here ^^^
>
>>> + */
>>> +int xe_guc_klv_count(const u32 *klvs, u32 num_dwords)
>>> +{
>>> +    int num_klvs = 0;
>>> +
>>> +    while (num_dwords >= GUC_KLV_LEN_MIN) {
>>> +        u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
>>> +
>>> +        if (num_dwords < len + GUC_KLV_LEN_MIN)
>>> +            return -ENODATA;
>>> +
>>> +        klvs += GUC_KLV_LEN_MIN + len;
>>> +        num_dwords -= GUC_KLV_LEN_MIN + len;
>>> +        num_klvs++;
>>> +    }
>>> +
>>> +    return num_dwords ? -ENODATA : num_klvs;
>> while loop can be terminated only if num_dwords < len + GUC_KLV_LEN_MIN
>> or num_dwords is 0. Therefore return num_klvs; should be fine.
> but then we won't catch the case with truncated buffer (which indicates
> bug somewhere in code or firmware) and it is one of the function goal
> and return value

I fail to understand in current implementation, even if there is bug 
somewhere in code or firmware

how return num_dwords ? -ENODATA : num_klvs; can return -ENODATA ?

num_dwords is u32 so always >= 0 and while loop keeps running unless 
num_dwords < len + GUC_KLV_LEN_MIN

or num_dwords is 0. In case of num_dwords < len + GUC_KLV_LEN_MIN it 
will return -ENODATA in above loop itself.

>
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>>> b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>>> new file mode 100644
>>> index 000000000000..b835e0ebe6db
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>>> @@ -0,0 +1,51 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_GUC_KLV_HELPERS_H_
>>> +#define _XE_GUC_KLV_HELPERS_H_
>>> +
>>> +#include <linux/types.h>
>>> +
>>> +struct drm_printer;
>>> +
>>> +const char *xe_guc_klv_key_to_string(u16 key);
>>> +
>>> +void xe_guc_klv_print(const u32 *klvs, u32 num_dwords, struct
>>> drm_printer *p);
>>> +int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
>>> +
>>> +/**
>>> + * PREP_GUC_KLV - Prepare KLV header value based on provided key and
>>> len.
>>> + * @key: KLV key
>>> + * @len: KLV length
>>> + *
>>> + * Return: value of the KLV header (u32).
>>> + */
>>> +#define PREP_GUC_KLV(key, len) \
>>> +    (FIELD_PREP(GUC_KLV_0_KEY, (key)) | \
>>> +     FIELD_PREP(GUC_KLV_0_LEN, (len)))
>>> +
>>> +/**
>>> + * PREP_GUC_KLV_CONST - Prepare KLV header value based on const key
>>> and len.
>>> + * @key: const KLV key
>>> + * @len: const KLV length
>>> + *
>>> + * Return: value of the KLV header (u32).
>>> + */
>>> +#define PREP_GUC_KLV_CONST(key, len) \
>>> +    (FIELD_PREP_CONST(GUC_KLV_0_KEY, (key)) | \
>>> +     FIELD_PREP_CONST(GUC_KLV_0_LEN, (len)))
>>> +
>>> +/**
>>> + * PREP_GUC_KLV_TAG - Prepare KLV header value based on unique KLV
>>> definition tag.
>>> + * @TAG: unique tag of the KLV definition
>>> + *
>>> + * Combine separate KEY and LEN definitions of the KLV identified by
>>> the TAG.
>>> + *
>>> + * Return: value of the KLV header (u32).
>>> + */
>>> +#define PREP_GUC_KLV_TAG(TAG) \
>>> +    PREP_GUC_KLV_CONST(GUC_KLV_##TAG##_KEY, GUC_KLV_##TAG##_LEN)
>>> +
>>> +#endif
--------------ET9Fjar3o53MwY1k00p5IwGc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 09-04-2024 15:05, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:7f96ad9c-e16c-49ff-bb7f-ad9ad37f9a1c@intel.com">
      <pre class="moz-quote-pre" wrap="">

On 08.04.2024 22:23, Ghimiray, Himal Prasad wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 08-04-2024 23:44, Michal Wajdeczko wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Many of the GuC actions use KLVs to pass additional parameters or
configuration data. Add few helper functions for better reporting
any information related to KLVs.

Signed-off-by: Michal Wajdeczko<a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
&nbsp; drivers/gpu/drm/xe/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +
&nbsp; drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 133 ++++++++++++++++++++++++
&nbsp; drivers/gpu/drm/xe/xe_guc_klv_helpers.h |&nbsp; 51 +++++++++
&nbsp; 3 files changed, 185 insertions(+)
&nbsp; create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.c
&nbsp; create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e5b1715f721e..ec0d1fb49b1e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -98,6 +98,7 @@ xe-y += xe_bb.o \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_guc_debugfs.o \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_guc_hwconfig.o \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_guc_id_mgr.o \
+&nbsp;&nbsp;&nbsp; xe_guc_klv_helpers.o \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_guc_log.o \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_guc_pc.o \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_guc_submit.o \
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
        <pre class="moz-quote-pre" wrap="">
is this macro necessary, it's being called in one place ?

((u64)hi &lt;&lt; 32) | lo&nbsp; should be enough.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
IMO it is better to have a macro (with name) than a magic formula
besides, this macro here is (I hope) just temporary as either:
 - it will be promoted to xe_macros.h [1], or
 - something similar will be available in wordpart.h [2]

[1] <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/129854/">https://patchwork.freedesktop.org/series/129854/</a>

[2]
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/lkml/20240214214654.1700-1-michal.wajdeczko@intel.com/">https://lore.kernel.org/lkml/20240214214654.1700-1-michal.wajdeczko@intel.com/</a></pre>
    </blockquote>
    Thanks for the info.<br>
    <blockquote type="cite" cite="mid:7f96ad9c-e16c-49ff-bb7f-ad9ad37f9a1c@intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
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
        <pre class="moz-quote-pre" wrap="">
default:

return &quot;(unknown)&quot;;

Have seen warning/errors if default is not defined in switch-case.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
likely compiler was complaining because of enum being used in switch
statement, but here it is u16, so there shouldn't be any warnings

but can add 'default' case if you consider that as a blocker</pre>
    </blockquote>
    I have no strong objection on this, if compiler is not complaining.
    <br>
    <blockquote type="cite" cite="mid:7f96ad9c-e16c-49ff-bb7f-ad9ad37f9a1c@intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
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
      <pre class="moz-quote-pre" wrap="">
see here ^^^

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
        <pre class="moz-quote-pre" wrap="">
while loop can be terminated only if num_dwords &lt; len + GUC_KLV_LEN_MIN
or num_dwords is 0. Therefore return num_klvs; should be fine.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
but then we won't catch the case with truncated buffer (which indicates
bug somewhere in code or firmware) and it is one of the function goal
and return value</pre>
    </blockquote>
    <p>I fail to understand in current implementation, even if there is
      bug s<span style="white-space: pre-wrap">omewhere in code or firmware</span></p>
    <p><span style="white-space: pre-wrap">how </span><span style="white-space: pre-wrap">return num_dwords ? -ENODATA : num_klvs;  can return -ENODATA ? </span></p>
    <p><span style="white-space: pre-wrap">num_dwords is u32 so always &gt;= 0 and while loop keeps running  unless </span><span style="white-space: pre-wrap">num_dwords &lt; len + GUC_KLV_LEN_MIN </span></p>
    <p><span style="white-space: pre-wrap">or num_dwords is 0.  In case of </span><span style="white-space: pre-wrap"></span><span style="white-space: pre-wrap">num_dwords &lt; len + GUC_KLV_LEN_MIN it will return -ENODATA in above loop itself. </span></p>
    <blockquote type="cite" cite="mid:7f96ad9c-e16c-49ff-bb7f-ad9ad37f9a1c@intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
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
  </body>
</html>

--------------ET9Fjar3o53MwY1k00p5IwGc--
