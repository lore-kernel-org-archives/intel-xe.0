Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52B6C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 15:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B9410E120;
	Tue,  8 Sep 2026 15:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Whg4eTfM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3143D10E120
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 15:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788880338; x=1820416338;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6N4uWlsKhhbnVM0G0vT63YVaaBub1OIb7ArIQ6JnG64=;
 b=Whg4eTfM0henMJwDFt+yJLSe94bMLsu32PZFtR/ROiRs0noMYOa2Wjwe
 vS+f9TqCS8AUX1dNHPDlR3OcsmueVFnrhaJWgsxSC+S2DEO2fk7MewDJj
 fFiQzpUWgUEZvDS9h3Rw9onO940CxMMuyu6alnPlhknepp+BYNhih13KJ
 vIDBBh19HnqPS1Q2GE3zW2yTUsTzAY/hdaSpF8OsxBef9xTxa6AsG7fqa
 2aZn1X8oTX9LnjTjnQaJLAIRjJWqpKNE9sFMfrKcch2VHJhtMGk3NBc1W
 6pD8HCW8s+2ig3wjdh95bHZtZEYDaBOVV3xq7fr74uScELh7dt49MBSIW Q==;
X-CSE-ConnectionGUID: uFPC2cWgTSSBaWhEg0JWSw==
X-CSE-MsgGUID: SCX0ctEPSBamQJdlad++Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89129302"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="89129302"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 08:12:17 -0700
X-CSE-ConnectionGUID: 07p+zfYHRC+dDKArOrvsbg==
X-CSE-MsgGUID: +z/zLwkoRGOpL7ossUWcng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="270544844"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 08:12:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 08:12:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 08:12:17 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 08:12:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYrqNFUuW/qQocuzhJG3Lxum2ZREkQDTIMoir4aXkxVR+hqCg9Z7uLxddWFQ51I+PAfWTqOFW4kv9k/7l+iES1HPtL8gGelpWVWtTE+XNtrD2+4Tr++KdefblNzyHHTu1t6e2478EM+YINsyKu0k7tta175W9jHsX30koHfZeAyx/sggAeJF4H26X/K+1NBE8ND/a+8UDXzNCif28+5tRtUi1L2PP9O1uMzSWvZcYCRzDzWUdQyk/iQ/tHFevl19Pt5fKkH96PyZXA5tgDqr4qvifzY08B7IxICzSmHiJ6aW87MjYP6o7k9mX2BZbnOan7N6aVzQLvQxqTceS7oQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhMApLymeVwR9XST2A+R/OnqJb/z9Z4t0mjsz/MywYc=;
 b=lEnupLmNCGEL8vsQ8ftdPcCOVa/gxbL1rwuvaXkzXSmiQxZBMnDOnPxFs/rQaOj+zuoGvGJq51PaUp5Ku7kjmdqrJjja7w3MKCf6ho97WY9S90Sdc831Tc8BKndJwWSwKOPuJmUS4qDm5biV/3OMQQGqEKZXAlzBtiD/p7IynGmk2u/Ttd9qggXYjZhnDdiMksCofyLPkG+ff3n329XiSjbGrm5miZKhI7tV5QEbaUBFVtQWrZISdSiiGTkBr00v+DsynezP7pZduMlVYZTk0qpnail8ZBqMmM7K17fJNuA5vks/nlWuBMcbg/BGUsqwpgqm42EE+yfpZBa0YWsGbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 by DS6PR11MB610166.namprd11.prod.outlook.com (2603:10b6:8:469::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 15:12:15 +0000
Received: from SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803]) by SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803%5]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 15:12:15 +0000
Message-ID: <3e4e7482-2810-4154-ba8c-a27fef5b47f1@intel.com>
Date: Tue, 8 Sep 2026 17:12:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 26/27] drm/xe/eudebug: Introduce EU pagefault handling
 interface
To: <intel-xe@lists.freedesktop.org>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-27-mika.kuoppala@linux.intel.com>
 <20260903154320.266C71F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20260903154320.266C71F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0297.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::8) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5900:EE_|DS6PR11MB610166:EE_
X-MS-Office365-Filtering-Correlation-Id: b7facd1e-b574-4a56-9645-08df0dbb90dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|6133799003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: zHNdE9SwhCVt91sPNSdSF5UjsGg2gQi2Zgj4/naLViFl88zjByMqou9ylGk6IV6Nh/ApRpXSumjmqO12kAPdrwtgaYzAx/1GB/IIRV1PHELO5qGwvPOhUq53f4b5J8sddGu3YTxfMSVTSYX7+AHs52DoSM1dtDdTelB4rQqVvJBQnoPClRjjOHtO7hgo3r/l7HHeUvRjqps03lCwee391cn1iJVJUVDRPTSgD2VTIcPO3Mz5c5TGpTz73D5xCzZMGdRxikBrDuAY3zsgu9Uz6vpS1fOdF7RSd6+gAg1tVkRdIdraphki0ypcIuvuqGfRCEGRz0HQliUbBtQ9RBdNhu5foJ+JBpBHWrHeOCH8BHvgGfjgSvrSZV4mxvZeThcyNAvnbl3b1P8faN80yhEU4kxVh36i613zKVNSruHTeda+IIBSCFy75bcn0H9jk9I1t+Eq1jqDoFp+DQsSnoMVl1jY+aboC9y3kmdy3TcWxHDKc2WcOpnk7ZH22fPJxPCemfI8/Dv4Qyqd0Y3PXfPNgsJZDj5oI14bNKdFp50lpJXzpNt3Rzv7SsIOGV/JqsNGBj1yEkFE1raNmcK5tY35YyDP0Y7cH6PvE9T1H54m+71IHAx7X+M2Ah+Q6ZwfZQJGkTaO25iBkeZv2iRss8JCrGD4xOy3X2hjJzQ3fHKK66M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5900.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDdiTzU2cnFNbFc5UWx4THVqN0xZZU5XRVBXaktoc1JobU80S3RJSjRsZi9W?=
 =?utf-8?B?ODhmeTA4Q0hHWGFEUWZXQlR2TmVwV3A2eFpQcmZiUnQxQzN0a2g5a0ozWHdG?=
 =?utf-8?B?czZobjk1Y1cvclhzc2cvRHVxUHdCODAyS1NKUTJFdFArM25uY2M1RGF6TWZ4?=
 =?utf-8?B?cnBScldERGtlWkZ0QWhiZ21pQWJJWWNwYU5IcVVyaGFURmJzeExtQ2NlYWxl?=
 =?utf-8?B?NExPNE1IdUdZOFlwcXJKczVRV1FjelFkL1o1ZHRJWVN4WmUrNFlkYmwyNSt4?=
 =?utf-8?B?YThoZkhLQmxGT3lBbWdBbE4yY3pvcUEwVGxyZW9nY1pwVlF0Z0hNd3ZSdmd6?=
 =?utf-8?B?eUcxNS9mZkNhMXBSRWVaMVJMWEZEWVJGRlpQNkt4V2xnUnoxcTQzREdpR3BV?=
 =?utf-8?B?SDcvMVZlQUJ4ekhoN201eWFiRi9iazc0QWc5dEZKVURyOWJsVkxHODR0VzBx?=
 =?utf-8?B?dHc3Y3I5VFpTemNJTUh6MHltVEVibGxYcTdCUUhXRXJ1U2Z2a0drRlFIMUtB?=
 =?utf-8?B?UVA4WjlxODZSNVFla2lhMllRckpINXQ4QjFFZXlIUExjb1pQeXFqWTArV0sz?=
 =?utf-8?B?VWV1MXJnL0lYRnNxOW5qNmVzVDBMbGtVdFlDcmxOSHhPcXBGdjlXMVV1Zkd6?=
 =?utf-8?B?U09uNXJvQjVKNERTdVl3RnNMN1kyUWczb3BRNU1UU1VSdzZQcjZmU3ZoVCtv?=
 =?utf-8?B?S2xObVl5WkkvVmxPSUV0TWFHOGQ0czV4QU16cUZ6VTRtcWk2dlVGZzAzOEt2?=
 =?utf-8?B?TUtpdUpYTjBvTTcrNFBkRDJMd0UvWUJlR3RCRHJPSjNpbkh3Tk9vUHJ0SW8r?=
 =?utf-8?B?cnpuVitYMjNjdmJCbHIwNGJTWVFDZDRJL21tT1cyb1dqODhKcmFObG9kQllx?=
 =?utf-8?B?aG91TkdGNHdURDF6ekxzRkU3bElYclVxZEtiaHNSb2tzNVlxMnNFRnlhZEZ1?=
 =?utf-8?B?c1k4QVRQZnRRSGRPU1c4UmN6UFhHNFRBd1NEZU1KcW03dFM0bHdvTmFObmNY?=
 =?utf-8?B?elkxdEFJYTF1dTZJcmdKN1FKQTRmK09vbnc3a0VRYW1MQWMwMmNtYmo0VGdi?=
 =?utf-8?B?Q2J2SEZqM21xeG56NEpmT1VyQXcyR2cyUGpSNW1PNG5QN29YQkxyZkZnd0tu?=
 =?utf-8?B?ODJSbGlrYmMvWVBDb0pieVhldHVNc2lBOWNzRUtXVG5ZbHVNN0RrVWx4azgz?=
 =?utf-8?B?SEpMYmxSMjR2RmpwR2pxdWhZSHdCYldyTnA3dnNVRVF2VjJNZHZUZUlGTm1C?=
 =?utf-8?B?MnhtS01MZmc0M1p6cStGQ280ei9EWWc0dzN6N2JmclllVFBvbHU2UCtKOG51?=
 =?utf-8?B?TW02YUxQVzg3K3g2dERwckJZektBRDVMRzBKdGRkK01KVjlxcUJuVnpxRlZO?=
 =?utf-8?B?dEErb2J2VWNzdzNQdFJVYkdqbG9GWnUyQ2tJdmtYYWZUZ2kreHEybndFdEtE?=
 =?utf-8?B?dVJqd0ozR0hHcjNiMEFpODhXeXh1UVEyRWo2MEFHanNhY29HejEwaEh0UWhU?=
 =?utf-8?B?SVArcjJMRTNkdjlhWHVoNkZVQUNXOXdMOGpCdHFTVXBGbHJNN1hFTjhZYUVh?=
 =?utf-8?B?aEcyUDc2bXJUdWt1UXZwZW9uSXJDb2twUzBnR1ZEend2T0hCTS9ydHJBRHI5?=
 =?utf-8?B?U1R0R29TanJUK2RiaHcwbVV4SXArTFA4QkZ4Y0FZV2k0WjZQZWkwWUpKTTZr?=
 =?utf-8?B?WFJTQTFmdjQ3cmRJTjNhVXJGTno0b3ZtRVlDdXhzbkRmSkszUFJEOUgvUGxW?=
 =?utf-8?B?WVdpVGoxYS9LcDlseWN6ejF0SStNWi9VZlY1UUFkMXRQSWU0NjF0NDQvRGlP?=
 =?utf-8?B?d1lHeDZJSkFDRTBEdktnTUt2enI1d0FzNE1VVndLeUpXbldXNmhibTh5eTdt?=
 =?utf-8?B?WHlTVVErSmR3SFhOWVpwS2RJV09nODJ3b1I5WVd1NEE2TFlHaUpPaC9iNWdV?=
 =?utf-8?B?NzE5Nk4xSE9lOXhyZDJtam9yRlQ0REk2dzc3aFkzMzBMZ09rRVkzNEt5dTdO?=
 =?utf-8?B?bFlEYVQ5RWsvTDhZWVljclg3K2NuTTRTTldJdWJDVk1IaHBFcm1oUmsyeEc2?=
 =?utf-8?B?OHVqeURGZGtpMjdqQzgzM1ZsQUUxa1pxTk0xZ2hOYVpLbS9tSWM4M3JhRENa?=
 =?utf-8?B?dG1KdGlCWnhhM0NuQk5ubE11RDZQT3lWTEZiVVhrMXJGUnp4SVFzVTE5VS82?=
 =?utf-8?B?NVFEeTlSNnNTRHg3alBYNEN6TVE0djUrSUtpK2RKV3JLdGhQTGRUM1JXb1pH?=
 =?utf-8?B?dG53SDZrRlNid2M3R1pLZXArdzJMVG5SNmN4TFY5SEJQVUVQeEF5aG5uRXpr?=
 =?utf-8?B?YnpHSGxuRTZUUjh5dXNJMUJjY2xONEcxeFlhdHYrSkh3U0VZQk5yTEVHNjhR?=
 =?utf-8?Q?bmtv2ATC94+zpmvM=3D?=
X-Exchange-RoutingPolicyChecked: xySNS6i0JuaVufOkmV5jN9QYwea7AwmStkL2bQxN+KcvVs7M/em9R9EbMc5Fgeqp6+pcLBT1PBN+baQpNN1b1Xn8tempy9Vfzuff9U1YKr8FeuexOG6Rd2AnW2K1u6wFCCUjSVzrLGjRd1LkOfuMrCReMIIG3CVL+oKNWRFh+VwfXal6L8cHnitBEvvf4ILY4F1uKf4yv5gIsQSY2TPY8kKAc+OL14p+GZkO2xzQHTBGYcE4fS7ScpU+sUsTge/bcwWt7zOwp5jxsXHM7fV0Ad+HNQyVjS5xK+PK76+OJwvY3sSCAB4dDxoZobnaSzHJxEF/hmjDD/aj8K/HSDnDIw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b7facd1e-b574-4a56-9645-08df0dbb90dd
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 15:12:15.2922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBfSHE+ZoTb1RHvBTVmTzSULaZ7OgSZTl+HRn5ZaUPKxEPmvi3S9b8y0B+wB4QK8uIcoWKv9Lq65hn0oJvHQWkd+NkkgN+6HILA0lsMHNqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB610166
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

On 03/09/2026 17:43, sashiko-bot@kernel.org wrote:
 > Thank you for your contribution! Sashiko AI review found 6 potential 
issue(s) to consider:
 > - [Critical] Race condition in `queue_pagefault` when accessing 
`epf->d` after unlocking causes Use-After-Free and double-put.
True. Addressed.
 >
 > - [High] Unverified ASID in `xe_eudebug_pagefault_start` groups 
unrelated pagefaults, causing VMA destruction under the wrong VM lock 
and triggering lockdep failures.
Addressed, but not sure it's valid.
 >
 > - [High] Missing NULL check for `vm->xef` in 
`xe_eudebug_pagefault_start` and `xe_eudebug_pagefault_creatable` causes 
a kernel panic for kernel/migrate VMs.
Addressed.
 >
 > - [High] Non-recoverable error in `send_queued_pagefaults` triggers a 
full GPU reset, enabling a Denial of Service via queue destruction.
If EU Debugger fails at later stages of processing given page fault, a 
GPU reset is actually required.
 >
 > - [High] Deferring finalization in `xe_eudebug_pagefault_end` hangs 
the state machine if subsequent pagefaults fail to initialize.
Not really sure if this is an issue.
 >
 > - [Medium] Failure to clear `TD_CTL_FORCE_EXCEPTION` in 
`eudebug_pagefault_finalize` ignores a hardware timeout without 
triggering a recovery reset.

Addressed.


 > [ ... ]
 >
 >> +void xe_eudebug_pagefault_end(void *private, int err)
 >> +{
 >> +    struct xe_eudebug_pagefault *epf = _get_epf(private);
 >> +    struct xe_eudebug_pagefault *first_epf = NULL;
 >> +    struct xe_pagefault_queue *pf_queue;
 >> +    struct xe_device *xe;
 >> +    struct xe_eudebug *d;
 >> +    struct xe_vm *vm;
 >> +    int resume_attn = 0, destroy_pf = 0;
 >> +
 >> +    if (!epf)
 >> +        return;
 >> +
 >> +    xe = epf->q->xef->xe;
 >> +    pf_queue = &xe->usm.pf_queue;
 >> +
 >> +    d = epf->d;
 >> +    vm = xe_vm_get(epf->q->vm);
 >> +    /* Need to have outher vm lock for eudebug lock as for pf start */
 >> +    down_write(&vm->lock);
 >> +    mutex_lock(&d->xe->eudebug.lock);
 >> +    if (!--d->pf.active) {
 >> +        /*
 >> +         * This will also catch entries that are popped from pagefault
 >> +         * queue and moved to worker but not yet processed.
 >> +         * xe_eudebug_pagefault_start() will catch later it and 
increase
 >> +         * the pf.active counter.
 >> +         */
 >> +        if (!xe_eudebug_pagefault_queue_has_asid(pf_queue, 
d->pf.asid)) {
 >> +            if (!err)
 >> + xe_eudebug_pagefault_process(d->pf.first);
 >> +
 >> +            destroy_pf = eudebug_pagefault_finalize(d->pf.first, err);
 >> +            /* If d->pf.first was queued the epf shall be removed. */
 >> +            if (epf != d->pf.first) {
 >> +                if (destroy_pf)
 >> +                    first_epf = d->pf.first;
 >> +                else
 >> +                    destroy_pf = 1;
 >> +            }
 >> +            d->pf.first = NULL;
 >> +            d->pf.asid = 0;
 >> +            resume_attn = 1;
 >> +        } else {
 >> +            /* page faults still queued */
 >> +            if (epf != d->pf.first)
 >> +                destroy_pf = 1;
 >> +        }
 >
 > [Severity: High]
 > Does deferring finalization when page faults are still queued risk 
deadlocking
 > the state machine?
 >
 > If xe_eudebug_pagefault_queue_has_asid() is true, 
eudebug_pagefault_finalize()
 > is deferred on the assumption that the next queued page fault will 
successfully
 > attach to the eudebug state machine.
 >
 > If the next page fault fails in xe_eudebug_pagefault_start() (for 
example, if
 > the exec queue is no longer debuggable), eudebug setup is skipped.  
When that
 > fault completes, xe_eudebug_pagefault_end() will receive a NULL 
private pointer
 > and return early.
 >
 > Could this leave pf.active at 0 while eudebug_pagefault_finalize() is 
never
 > called, permanently hanging the GPU with TD_CTL_FORCE_EXCEPTION still 
active
 > and deadlocking EU_CONTROL ioctls waiting on the unsignaled pf.fence?
 >
 > [ ... ]

Exec queue cannot stop being debuggable.

VMs without 'xef' don't have 'asid'. They will not be detected by 
xe_eudebug_pagefault_queue_has_asid().

And debugging a workload on GPU is a specific job which has severe side 
effects, including GPU reprogramming and reset. So only a workload under 
debug should be on GT.

  Therefore, despite the fact that issue is technically correct, should 
not appear.


Maciej

