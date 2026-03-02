Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE94D58E7A
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 08:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A86C10E457;
	Mon,  2 Mar 2026 08:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zs6aKdQP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0B110E45A
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 08:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772439751; x=1803975751;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wvFI2kvZEVv+I4D5FdemoiqYhWdTsUbfTAInaD76fl0=;
 b=Zs6aKdQPNooc324hZ9tHd12llDIlKY8GLfNhrtQFY0SI+PumssLvSNsq
 mbNt4eiQoEW0+c+3njemU2gfPuKrDYSuH/oCMElACY4e4qcMDRCC/2Nme
 6dWHPuWcRSwvXnXuZiIZJFDU/vqnPkqWIXm04sB7dhP/t43sSu5YeIvsw
 PS5GLZDXWaTpcntMe46sRPOYuytyFs1vtkWBIsisySSzuGKPxDSdjWu6G
 +bCIYM4c5X3m2Lsj6qDqSUxAvbdsL75YfhVDOrX0qw5sQJ9oYBgKP6zDt
 ZQ/eNALL+oJ8dICuilG7jxMvOqHY5AyL/UlzykNFFLroooqOTKpmdz5O7 Q==;
X-CSE-ConnectionGUID: ViZCv8U5Qm2JGbutZf8w4w==
X-CSE-MsgGUID: wcu9w0xOQJidJg4QI9EH+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="77281075"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="77281075"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 00:22:30 -0800
X-CSE-ConnectionGUID: kISt4ErRTWiz4d4IOg2UCg==
X-CSE-MsgGUID: Xf6/53hZTIygmGcd79AiLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="248082259"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 00:22:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 00:22:30 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 00:22:30 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 00:22:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZcJZAQCZ+kNFGRY+WvbDOOfXU0L8p7B2VEPbGliymwo8EwKbWIkcAL/CSE7XQRFcToqTKaSFqPc7MYyv3OXv8qGx8/Iyoj47OqT8/0D2elyCMYALFBVbrpnexZOeAyYC+VWsC57Z4uA1zxEvodv3cXRQqfkcR9QIgANZHSK5zwXWHSds0CAWHkohpgNl3pOcYZ8Z4oaYE3303dxq+C/SUvcSdMe03bhmdod0wo+xAk5U6Oz1FiuAuj0eAhYFbKM7JK0RQhIV8KcH8Q10hhjBURcKBZgjfBd2+P4egqOb/vZKDs2fHxKOcNkR9rJwf0L89UvbYvSy/kAj8u0xM0Dccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2loUiYTpA9czdSsvBqMMFD0j2RaFKeNH8achJ4o6tc=;
 b=OOf7PO65Ozo2Mk+nRRDs/TjOPw/RHmb5MY5S0GZUffd3g46pf7YBLRf23fS9J1+2ULYgkn24vgRebvl37Ov/l8iioc1ziPOD2WielIB/A+GLkPeNppWAXnT2NNAAGZJnn6i04HXAomaYmR/bczsDUmGLl9zXfhZC9VEZxs91MDygDQ5QzJqUAcEauTaRi7FHzlzDAP5vnQhEqvRayBTjvdExdD+msuYw5jmTVqREoRp9xGzTWT2TMkzm7akFXcVEEf3wd1oWrMhQSfvAG/+jCZxXKUwSy7t+XeVczkcRT09Ir/xd+MCp027qU2yfv6bad/WWDQi0G1On5UTcr+O6Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21)
 by SJ0PR11MB8270.namprd11.prod.outlook.com (2603:10b6:a03:479::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 08:22:28 +0000
Received: from SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c]) by SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c%3]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 08:22:28 +0000
Message-ID: <a8794baa-a0a0-4aa6-bb50-86c2c1679bb2@intel.com>
Date: Mon, 2 Mar 2026 13:52:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] drm/xe/sysctrl: Add System Controller
 initialization
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@intel.com>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260129121044.3670780-8-anoop.c.vijay@intel.com>
 <20260129121044.3670780-12-anoop.c.vijay@intel.com>
 <20260130195959.GF458797@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Anoop Vijay <anoop.c.vijay@intel.com>
Organization: Intel
In-Reply-To: <20260130195959.GF458797@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0042.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::10) To SA3PR11MB7556.namprd11.prod.outlook.com
 (2603:10b6:806:31f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7556:EE_|SJ0PR11MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: b118f275-1b1e-4c0d-ce59-08de7834d758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: CUY5K2fNDRHa6iXW6+qNsAL0MbKUPx3y3vJZIc7iwcb/fmptAo1Wpo1hcCFa5gea37bGPobVpe4Uk1VMb7PgFTClFITApmps404sueYX0SFaTFG802arXcEk81dqpL8b4s+tqZDlwBOl3niX5loHEZzVsmP/qot+5TKwG44F3RcpBnoD3Dy3HQwjJFWDzWAgMKbpkVA7xQVNQSJIeoW0HPy7Lr90edqSCE9buygfdoPntXHFXr29rZwhhSmsMHm5r7t+L0v57r9rgZq3jNXemHRJxsr4kGSxnpJpzKU2VBK/zzx9KOBuhXNTATg04Sw4uAcFkUHM+il+kFQozZggQ3itY3ZMrlHeK5m3LJDZdYcdgVcw7hBcjaciXSPBhbQQ5TsnImATcHcz1W2XGPjaMLNO0jM3nGasw4REQczOWUOJPIo+eM1ru6KlUdqygiTlNpA+UTvARd4UMppBlXxdj6JehWOLcZD62jWF9g17k6Ys09Jkj1yOTee2p/JLpx70FPk7HNpn2W31vrXm75KxV0jbhAkLNo+yYqqViylYoFwvAisYAjQcES5bQ5J8TRD0MVvT2VoFjT9Yuv58W1znfc2XPcR8AgzyBzQ3H7CVN1Wd3ZojKyjw8X9zjhWy5H7fZ61PTJ/8tRHkKaoLV0RTj82vGQTNtPfoyFm9j+9CTqNf2Q5+xLwP3kshoJ2RJqPNEqSu8NPD2MHZ7VVPtE/5xxZ5LYPAjlLZKa2Mzfd3lqc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YURwOE9PNVJ0Q0YwOHpKRXltZ3pWR0dQSTZQZTlOMEF1SDFJWVdjVGR2QnZz?=
 =?utf-8?B?TVBRS09XcFQ5dkVvTlo3Mk5ZNGdNMGcwUVZudndRdzk2N09wK2dXRHRLM1ZR?=
 =?utf-8?B?dEw2SXczODk2SG55b3k5cDdMeUMybERrUWJCWmNUcEJnc1NlVkxDcTNOSHd4?=
 =?utf-8?B?d3V2ekpvbXZsMW9QZ0ZXZDI0b0R1bEcxbUpXVFRPZGRvUHVGcWdwOWRpdzZY?=
 =?utf-8?B?UHEwVGplUUZVS2dLL1dGYUhtWDZ5SHYwQTB4WDRjTW9TVDdkeXM0Tjl0dzIy?=
 =?utf-8?B?QWt4VFVVaFl5NDkxNDYrbDFXaTdBSGRWNERkYnI5MEszcncvQ2ZlaER2QjE4?=
 =?utf-8?B?RFRtZ3JhcUJYVy9OVGFJNkdlWnNSVE9pTzVKOTJtVXNvdURxYk4rb2o2QXNV?=
 =?utf-8?B?bmtDRUxZbGlROGRZemdUTE1mWUduOTMwb1pLQ3hHM0Y5R2VZRnQ4SjByMFpR?=
 =?utf-8?B?RHJqc2RkVElhZVNUV3R2Qzd4WSt3NW5OK3J1MWtMK25wd0Jzc0RqTDZHMUw4?=
 =?utf-8?B?OEFnWGRRdzcwT0ZSMzR4ZEs3d0hVM2E4eXRxajFoZkwyTGZ5UjVYa0p6NmRQ?=
 =?utf-8?B?SFFPVnEvQnU0cGlldTQ0anBuUHFCUzQyL2ZKakw4TEhDNGsxUVZuUlZ5SzBO?=
 =?utf-8?B?ZTV5M2lxS2llaDU2TmJyQTdjdysxT3kyb1p4bFJwUCtnTVZ4bHZnVnprQkE1?=
 =?utf-8?B?di94anArTWQ0Y25MUjZEaHVUK3M3ZXZQcXN4QWtJb2FMb2NnQ2dSclNLdVpO?=
 =?utf-8?B?M3RWZFpobkdNODJ1VzJNQkYwTlpYamxCc1ovWjBhejVwOHVxWlVMY0U2dVE3?=
 =?utf-8?B?NkkxQzdkSWVia1lrcXJ0akFJVHBEMkFDSDN0NVNpYUUzYnE4YmRIcWRvMzZk?=
 =?utf-8?B?TG4xZXlBQ3EyRnV1bGlocDVIeXdXMWkycjlNY01kZDBkQ1U1MGM0ZUpxemRP?=
 =?utf-8?B?eWpQM0Z6WFNReVpNU0hoRkJUYlZlODJxcGd1V0VxWnN0M3ZWc2IwY3FYRDRz?=
 =?utf-8?B?azRpaVJCbHhISnpZMDNIRnVvcHpJaVpLSXRYM0lsUDh1N1pMUk0wZmhSVSt4?=
 =?utf-8?B?RDFhNmtsT0syQXcrWWowZU5STEw1d0R3dlppemtMZmlzOEJyT2pMRXBnY0ZM?=
 =?utf-8?B?NVFoTWd2d0tDcS8waDdST3lFSTJmTElHNkJ1OFdmWEp3WGp2eEFWRlU4dVRi?=
 =?utf-8?B?VFBmUFpkSEIvbyt5K3U3MWhyN1NmYlovck1VNFlyMGE0WXdCM3g1Qm1lQ1ps?=
 =?utf-8?B?UlFMY00xLzg0U3RIR3c4WEgvM3pTYjZvMmprOG9FNlVrcmpiOGtjeFExS3hx?=
 =?utf-8?B?bWVGUUtERjR1eXFZb2dEa0ZnWmxFblBybmhWcy9PYUc3aTBneklhVzAvUE1x?=
 =?utf-8?B?blh1SUhmRmlkaEw3YndOeGIraVBma3AwaGxrR3BiLzJtZXNLU1Zwc290cnI3?=
 =?utf-8?B?aWJ5YUlXUTVoNDNVdUhDcVRmZjV0VEEyNVFhVFFwZXc2N2w5WElCdUtCUExS?=
 =?utf-8?B?VkVsR21KaThZMzhMTnZnMGNaa001OGdOZjVnMlp1TnAxR01HdnNOK0pJMDFT?=
 =?utf-8?B?M1JYYjVQVlFPVWtUK1BOeTRzL3VwRno0NGhudjRqNmEzSlcrQUZWWUMwV1dN?=
 =?utf-8?B?cHI0YVdDK2dxMWxYYzhxZmdtZkk2ckcwdWNtcjViUXhFY200TUd1V2EyNjJD?=
 =?utf-8?B?bEZnL2hqQm1zL2s0QVNSemFTWWp0ZERPY1dmaGszZUh3cmtJMEMxNFpLUHI4?=
 =?utf-8?B?RG9FMFF0VGhhaWVBQ05IY1hqWHoyQk15Zk12WWN1ekRwbWR5c25OWDZaM3NU?=
 =?utf-8?B?TDdVK0RkM25xZEdhSkhySTQ4elV4b3YwcWpWK1FjQkRvN1I0UjJUVWVuL0lS?=
 =?utf-8?B?V3V4dkppVFBtekZKaDJDS0VzVVlvRi91RGU3ekVMMXhOT09UaGVkR0tGbDNl?=
 =?utf-8?B?YnFVT1dmRHptZ0NjQmEzM3lQOUhRM05vaExMdzMreVc1R3pTc1EzdWo0ajRV?=
 =?utf-8?B?VlFNdlNHTmhQUW52Y3N1b1RHTnQ4VnQ3V200bzVFM0c5NFFoQzVLb1pHeG1U?=
 =?utf-8?B?ZVd5YVNVaHJaMXU0ays3UUVNeFVkUlpOMktOckhaaWluOWpBR0tZMkFLM2Z0?=
 =?utf-8?B?RCt1aFE1RWJyeXIrNkJ6YlRpa3lsSlZKMUNlZG9WcnZ3S3RzSkYrQnZpbVI4?=
 =?utf-8?B?Um9sYjgxRWlmZlF0VXM0TnZuSGYwWkZodlo1U0lkVm9NemYrS2ZKeHhqZ3lI?=
 =?utf-8?B?cGhpVTc1ajlKcWJqdS9WTmo0VUoyVXlKV1NrM1N6V0R6YnV0VHczYjFTd0p4?=
 =?utf-8?B?bkVUc09jQVNyMEtSQk5USlo4SXBtcFNvNzI5VWNJWGpOc29ObERMVzVOZUl4?=
 =?utf-8?Q?jG2oz3hbRb/bEpWU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b118f275-1b1e-4c0d-ce59-08de7834d758
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 08:22:28.4317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9zJFwjqAj0U+Pp/9GLwpYojmmzBjb8lXQnx6PyAXDWqNv4yhCK/XnpIeON8xrKWzwcXOaAdRE3u78y5zT+qc9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8270
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

Hi Matt,

Thank you for your feedback on patch ordering. This has been addressed 
in v8. Patch series is reordered to follow logical initialization 
sequence as you suggested:

v8 Patch Order:
1. Types and device integration
2. Register definitions
3. Mailbox headers
4. Sysctrl Initialization
5. Mailbox Implementation
6. Platform enablement

Thanks,
Anoop

On 1/31/2026 1:29 AM, Matt Roper wrote:
> On Thu, Jan 29, 2026 at 04:10:45AM -0800, Anoop, Vijay wrote:
>> From: Anoop Vijay <anoop.c.vijay@intel.com>
>>
>> Add top-level System Controller initialization and cleanup:
>> - SOC remapper region configuration
>> - Mailbox initialization
>> - Resource cleanup on driver unload
>>
>> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sysctrl.c | 80 +++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_sysctrl.h | 13 ++++++
>>   2 files changed, 93 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>> new file mode 100644
>> index 000000000000..430bccbdc3b9
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>> @@ -0,0 +1,80 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +#include <linux/device.h>
>> +#include <linux/mutex.h>
>> +
>> +#include "regs/xe_sysctrl_regs.h"
>> +#include "xe_device.h"
>> +#include "xe_mmio.h"
>> +#include "xe_printk.h"
>> +#include "xe_soc_remapper.h"
>> +#include "xe_sysctrl.h"
>> +#include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_types.h"
>> +
>> +/**
>> + * DOC: System Controller (sysctrl)
>> + *
>> + * The System Controller (sysctrl) is an embedded microcontroller in Intel GPUs
>> + * responsible for managing various low-level platform functions. Communication
>> + * between the driver and the System Controller occurs via a mailbox interface,
>> + * enabling the exchange of commands and responses.
>> + *
>> + * This module provides initialization routines and helper functions to interact
>> + * with the System Controller through the mailbox.
>> + */
>> +
>> +static void xe_sysctrl_fini(void *arg)
>> +{
>> +	struct xe_device *xe = arg;
>> +
>> +	xe->soc_remapper.set_sysctrl_region(xe, 0);
>> +}
>> +
>> +/**
>> + * xe_sysctrl_init - Initialize System Controller subsystem
>> + * @xe: xe device instance
>> + *
>> + * Entry point for System Controller initialization, called from xe_device_probe.
>> + * This function checks platform support and initializes the system controller.
>> + *
>> + * Return: 0 on success, error code on failure
>> + */
>> +int xe_sysctrl_init(struct xe_device *xe)
>> +{
>> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
>> +	struct xe_sysctrl *sc = &xe->sc;
>> +	int ret;
>> +
>> +	if (!xe->info.has_sysctrl)
>> +		return 0;
>> +
>> +	if (!xe->soc_remapper.set_sysctrl_region)
>> +		return -ENODEV;
>> +
>> +	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>> +
>> +	ret = devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, xe);
>> +	if (ret)
>> +		return ret;
>> +
>> +	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
>> +	if (!sc->mmio)
>> +		return -ENOMEM;
>> +
>> +	xe_mmio_init(sc->mmio, tile, tile->mmio.regs, tile->mmio.regs_size);
>> +	sc->mmio->adj_offset = SYSCTRL_BASE;
>> +	sc->mmio->adj_limit = U32_MAX;
> 
> I assume the whole series is effectively "dead code" until we finally
> flip the flag on for some platforms in the last patch, but it's still
> somewhat confusing to be using sc->mmio in the previous patch, but not
> initializing it until this one. People usually review patches in series
> order, so while reading the previous patch, they may be wondering what
> the target of the MMIO operations is, which they won't find out until
> this later patch.  It can also cause confusion if someone is doing a
> bisect and inspecting the state of the code at some intermediate point.
> Is it possible to shuffle the order around so that general
> initialization comes earlier in the series, followed by code that builds
> upon the items initialized?
> 
> 
> Matt
> 
>> +
>> +	ret = drmm_mutex_init(&xe->drm, &sc->cmd_lock);
>> +	if (ret)
>> +		return ret;
>> +
>> +	xe_sysctrl_mailbox_init(sc);
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>> new file mode 100644
>> index 000000000000..ee7826fe4c98
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SYSCTRL_H_
>> +#define _XE_SYSCTRL_H_
>> +
>> +struct xe_device;
>> +
>> +int xe_sysctrl_init(struct xe_device *xe);
>> +
>> +#endif /* _XE_SYSCTRL_H_ */
>> -- 
>> 2.43.0
>>
> 

