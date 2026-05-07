Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4565ECD3439
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 13:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F212410E28C;
	Thu,  7 May 2026 13:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLDYU8zs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0607C10E28C
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 13:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778159724; x=1809695724;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t+IKRCa/Nnm1pfiPAlHL1LhMinQs/HKVkcsckFZ+2aY=;
 b=bLDYU8zs8gcU0F18OMlmgwb0OPTrPbEnaSA45bsmXW0JeRfAuOyHs69U
 sSL4rwL3rTfa4NuQpZ/IZ+CZssLVxZIvw/6AK9RG4M9JkQrYThg7K6ntd
 RrWSY+RQAMq8RevKXonHodvRIR6QK5w5nLUCBmZ25Mkzj7TFSqhNOXfel
 AgNl4yhtCk/Zqes1kz3LeSJwApyt2/JldeB+RmY4jaNzVAHBRJBx8mttz
 IAmMT4WPxedtgGz2ne0hDFG/1vcNVh1iYZdPkKvzifuGg1QlXnjtLb8DM
 0i6EXEPzmPt+pUPX40+bnBXt+C6rdwsK0ccx9AEJQAjHIDN7X3xhH42Dp A==;
X-CSE-ConnectionGUID: AY7RPgJLSBeMTCCGvnsQnw==
X-CSE-MsgGUID: OPEQ5nX9STuc6EVXB6Artw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="90487155"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="90487155"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 06:15:23 -0700
X-CSE-ConnectionGUID: un6TI4/xR66ZAnEyHNKWdw==
X-CSE-MsgGUID: 2eFkr6jsSCCEEizVEtEPeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="235464844"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 06:15:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 06:15:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 06:15:22 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.18)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 06:15:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=huLq4OMvbdpRkseu/AP62bxqs458CGJVbrxLfrPUxJvANRmvmLE25XqrpDgxE3wWvAYg0vLrcXPwZcC+tALwzdkrQllw9wVeHromm//DcC5oLHwZoBzgILqCii8JOT6GhE/e0Q+S9+bjvoPcLfuXAMx6ExInnouzPzdtWpsQIqP4LneDPHYa2m9Dgb1Eul2oEvCyI1LYu0iw7CHha4oC59lceWpTYEjVXB572bY0ow5XNnxZCZocMu0QnyHhDTGrtMNfN8cLL5DrkmvHueE0/nwvXrQDEVBu5i6RozR69O2pQDWBpUK/I52UF6onIyYHs9k9x9jlsktXllvkX0c9uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWCNKPj7T3umIKT6GgKF8jp0u4j2AvkvJGCQMQeHBSw=;
 b=AxkKsxV4RRCyNo8sqjVecBELPm+PTFI7colYYTTBPmxRRwWeexaJNwK+sr9QzYMp/kJVEtkl8qz9OBKq2kseLJevGHqXlNVhAmustbCrMsR1sITHGpoqrZR6NpAkOEwisU4Ju5sX4gU6wC9AEa3EMndrPySDVpSzsX3Fcu4R8AHC/+wSaEeJ26U7761ZcX7Qsk3lQWdCFkd5YT7dMxmRMzS2rnJjOsQY5VBJt5i1IIFFXXV8TezN0Gl0sPl35TIJrRKyYEXiPqXlpk6OMBz2KA8ywWi7ZA6udLoMJKnj5cUw9jJPBN09Ye4pmLTUSea7PGyXA4BaIMZymiNbO4DdFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 by LV8PR11MB8559.namprd11.prod.outlook.com (2603:10b6:408:1e6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 13:15:19 +0000
Received: from SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803]) by SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803%7]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 13:15:18 +0000
Message-ID: <68a2f0a3-3f22-43a0-9604-b27ff3b5a65e@intel.com>
Date: Thu, 7 May 2026 15:15:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/12] drm/xe: Add pagefault chaining stats
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <francois.dugast@intel.com>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
 <20260226042834.2963245-10-matthew.brost@intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20260226042834.2963245-10-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0044.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::7) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5900:EE_|LV8PR11MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fff2017-e265-4faf-6fe6-08deac3aaf6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: OpHNFzvYx5WcejPGObBUMHNYIGRdr39+d6PmsQnkoz+AwpgFY8i8hRCBQ8TStnfQ5zc94vlwkxWdP0rlBvXoyZJAG/gf5oLie/Fy3Gg+Fv98F/eX0DNezvaODhvMVRgTngMJ0Ux+9ZtTsR39U8DPRDlKE4ByPifRsp8mLY0IZn+JjdlSY0eZA0dc3IkjOKIv3J/xc+urOP5qmkUuRGj9zQBeiDc/lnEAMjjtv85kmUybBnf6fNZdBeF7SJgzz/dnDNsAQEpZ362TKMln2PtQgqXhejtaGhymgynhQ0plqsuxBH8/HQ4rIo9lHDghZec3IqizB+Jf/EEpVcEcvXGpgGcqVaQ0iA4K0RNcKluCj937FVwd5UnSIYMB+aU8zxGfrmLQIl3iGV9a0yr3D2VtqLzX5OyHat9cohRqpL3Eea2DD7XVoJmVpobjcPyFuSXV8N/Rr8baYkwVFniM6ZH3hJt0Ti5UdhldT33cfN74rtEhDs2XqNOzCvjL3giMgtwHapFQ51h8eZqjNAPtRew5MkPEUdYDeTZBsCXh43K80dfh8l6ruHmwCxvFAjvESE43UUng7ZIZZW8f0A4xT7r7nm6zAZftG1nGNdg5l9Cx2rq9jAYlrAnx42/Xaun9xN14BuATfU4DPjBCsyiZKhFFz7nbaZ2YaYjbsmS9ZS8mknTNPnUlKQRTUTk8I35nz6o9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5900.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlBjNGhGYk16S0hCZUdkaWxsSHVOKzlHMDE5MnpyVzdDNWpldTkyTDJpcFFm?=
 =?utf-8?B?ZUl5ejY4bTBSYUVTTHBBSld5dlVqaG5aK1RBUHZnaW1sckZ2RXlZYlNaU1l5?=
 =?utf-8?B?VTNGcWdpVTRiTno2LzN5RysrMURoWmcxS3NCeVRhQTB2bDcvOGpmbVFsNmJK?=
 =?utf-8?B?emduVUNLbEdnajBHMWNLR2xHRnBRZTMwbW1KQWhsT1VMeTlheGl3RHYwWjY0?=
 =?utf-8?B?dTZGYTB3azRva1hoY20rMkF5VVRaaEVZbTR0MEhUSWFJZDIyTlcyZmltZFlL?=
 =?utf-8?B?NlNGUXF5YWw1TFNZNXJCaGw4OUVYTGtRaklMT0kwSHZpZ0MrUjhUMWNtM1Rz?=
 =?utf-8?B?dWtNZW9ZTEVSa01YMk9JOTdNYXhSTDYzaGRvMzIweE9UZzhOU01NdFdxNEpS?=
 =?utf-8?B?QkFKOWpyYlNlbTdJRHprd0Z6VnV2NWU2QnNXTEptbEttL24yT08rWnlRWVZo?=
 =?utf-8?B?bCtCWW0reWFBU3hXSGp3WXdYUUNSQUlNbTJ2aVlxQVp3TTZvK05Kam80R1k1?=
 =?utf-8?B?T1YyS1ZTS2NsZkNUYzltOVFyaEw1TUE2MHQzaGdhdTZzb3VEYkRDbzFzcnlW?=
 =?utf-8?B?YThoZGlQRWNFUUN3cGh0SGtmZjBrY1d3OTJZdEcrL1lGTC9CSHI0cXhwaXBR?=
 =?utf-8?B?TDlUQ25UY2RnNFR0THVqR3d3UXZyd25CaE9TQUtXZmdQL2kxam9NMHFvVGFP?=
 =?utf-8?B?YVRZRkNlNEhwT3VWWklxc0hmQ0h3M0ZzUkZDRHo5MHJZYWpKWGZsUk1RQkd2?=
 =?utf-8?B?TzhxTXRCMXExUENucVJJRS9iWU0vRCswUU5OK2h0RDFTbjR2elcrQlBjUUFO?=
 =?utf-8?B?MWtRelZzekozVHR5Wk1UVkZuSVVXNVJ3M3ZJdUMzai9sdXFSSnVsYnZEUTdL?=
 =?utf-8?B?cEY1blVXaXNBL0FCTXJ3enM0RnJBZTFBaHJBN1l3MzFPQXZCSUFTL2QzdHRP?=
 =?utf-8?B?SmNjamN1TDkvb1pGTVpCNmdvR0Z0UnVjUWo4TG9QOVphL2krZkxnOWR6dXJw?=
 =?utf-8?B?RWtsdlo4UkR3UnI0TzFMUTRVNStRSEpmR3QxRjVTMkh4a3ZwbjRDb0tpcG5I?=
 =?utf-8?B?dHJHdkxnYWZWZ081RTl6NDdRTFhBZXhaSGt5bGovTmlPV2Q1U2VtWXVaSFRF?=
 =?utf-8?B?YmRVOHl0MEFacnhPcUUya0NEMFJtamhKTVF1SGd5SmNxQWkrclp0a0xoMzE2?=
 =?utf-8?B?ZDErdTZwV3ozZ2VDNHBPZm01ZVVLVERaWWRRUzhiamdTSHl4YTR1blMxaWI4?=
 =?utf-8?B?MDVEd1FyUXlDOXVJMFdiRHlKY2tnQmJ4a0pleUYvUXpmbWpybWp6eWM4N3R0?=
 =?utf-8?B?MFlwekZzbUVsMEppRXYySHJZTWd5MnZPZyttWWZkNVZTYnRzK0dGQndFeWNJ?=
 =?utf-8?B?UVFqY1ZUNjBQUjdNdDhFZlh1SUJEYUZ4QmdTaWFxNmJXdytQTFg1d3lzS3hI?=
 =?utf-8?B?dW9sekNCMUNZU1pIanowcGt5cUpxcGJSQ3JudlNwczVjczVTd3RYeWxmUklm?=
 =?utf-8?B?VjNwZ2dBRjFYNXlXTnBqZXJBcVh3cklxeGNuOWxVbzFpTStFS0pCaHFKdkto?=
 =?utf-8?B?aVQ1bit4a1g1Y1V4UlB2aUxYeEd2RTBva0owR1N5b0tFUEhyTHVBMlZsZkN5?=
 =?utf-8?B?ZVRCcjkvRjhxOXVXcSsxRDkvSkVlUmg5TzhQSEp4M2UwaGYvY2psajNqRmVy?=
 =?utf-8?B?SHBpRTBiVnc0MWlBdHFjUkRLczd5enFOcnJVdnNCUTNJUXpQVDJTM2dScDdu?=
 =?utf-8?B?UWhKWjhJUFI1eExsMjVpTDU3OFB2NE01V3lIQWtObjBzTXN3ZWR2NUoyMm5V?=
 =?utf-8?B?RWd5QXE3ejRNUHZaLzI2aEgrN3llRjJSYTFrNUFTT2Rnd2JpdVJ2RmhXS0da?=
 =?utf-8?B?dFMwS011ejRQYXBUTDFPZG5hZ2VuSVBCYXhUSlZsY21hNWhrbmhmVW9CL1ZB?=
 =?utf-8?B?VFdhL2ZRckgvcEFFWnBMbGNuZUNzVU80amo4V3JSRXEydWtYb3pNN2QyNjJO?=
 =?utf-8?B?ZTN5b2wrUjZSUVdTeUVuN3ZHL0ZIT0JDZTBLamY0bzN0MCszNXo1cXBxK1hv?=
 =?utf-8?B?elhwYmVWY01BbG1kS0toNVBHRGQ5SEVFTXVkaTNMQkkwSXZlL0d1NFpkWmI4?=
 =?utf-8?B?Z1J5anJjUUVrQjd2ZGZONVJocG5jZEhpOHp6T0JneFcrVzFQQ0pKcVhHQW1j?=
 =?utf-8?B?UGxxRTZRdnpNNWlZV0o2Q01ZSyt4NDRWb2lGMlRENE5PM1M5Q0E5R0FuNU5z?=
 =?utf-8?B?dXNQRmhjTkp6QTQwZWUzeWRRVjRGcFQ5NzR2NVFTQ1UwSmNxcTZ1TG9TRy9p?=
 =?utf-8?B?ZndxT2srajNPTXBKTG9ibDBwcjRsNzNuMEYyaHFBeENhY1BCamRIaHV1alJj?=
 =?utf-8?Q?A2JS+2liQWflBP90=3D?=
X-Exchange-RoutingPolicyChecked: G0njhcv3RajMkITAhU/PxRlJurBU+Tumnf0PpbJmUX6mSeJVUkFEHUQNI+f9wPhXrfFJvrVKnl/i5wYWKWbZrCc4jfP4xMbXqEF9pNjoav0DDUa7O5KjdeCxw7UWNqy0PRY6rzkdfGO3ji0uw7vbxvSmzflf6DeaQDDq6cn2Sd7sp73NJbMA1T+EnlPeLZMKc63ckqJAHgoaH1tIoPJbDnlkOqAbTxd5h9kdsq9AUAE1kVv4CXCEUWMYxA5+QDcLq93+FB8fuai7Hnmg6NOilmlgfl0POSriU9ibgSWKUOtOJhyG3Ahi+ekg94KfcrqD8ozl086d8Hjgp7hXz6T4Xg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fff2017-e265-4faf-6fe6-08deac3aaf6c
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 13:15:18.7233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCfAZSJaVdivSEEUYK2u5T07q6kdBYw6IRhJcDjDtJ/NNuO/m6WBXLSrJqzsENMxCMI3DkoIAy6b70AnEPxweiaMs7aa0J2C5BcDJlDm2io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8559
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

On 26/02/2026 05:28, Matthew Brost wrote:

> Add GT stats to quantify pagefault chaining behavior during fault storms.
>
> Track total chained faults, faults chained directly from the IRQ
> handler, cases where IRQ chaining also drained the queue, chained faults
> that had to be requeued due to range mismatch, and cases where the last
> serviced range allowed immediate ack.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_stats.c       |  5 +++++
>   drivers/gpu/drm/xe/xe_gt_stats_types.h |  5 +++++
>   drivers/gpu/drm/xe/xe_pagefault.c      | 18 ++++++++++++++++--
>   3 files changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index c1af3ecb429b..cdd467dfb46d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -54,6 +54,11 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
>   #define DEF_STAT_STR(ID, name) [XE_GT_STATS_ID_##ID] = name
>   
>   static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
> +	DEF_STAT_STR(CHAIN_PAGEFAULT_COUNT, "chain_pagefault_count"),
> +	DEF_STAT_STR(CHAIN_IRQ_PAGEFAULT_COUNT, "chain_irq_pagefault_count"),
> +	DEF_STAT_STR(CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT, "chain_drain_irq_pagefault_count"),
> +	DEF_STAT_STR(CHAIN_MISMATCH_PAGEFAULT_COUNT, "chain_mismatch_pagefault_count"),
> +	DEF_STAT_STR(LAST_PAGEFAULT_COUNT, "last_pagefault_count"),
>   	DEF_STAT_STR(SVM_PAGEFAULT_COUNT, "svm_pagefault_count"),
>   	DEF_STAT_STR(TLB_INVAL, "tlb_inval_count"),
>   	DEF_STAT_STR(SVM_TLB_INVAL_COUNT, "svm_tlb_inval_count"),
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> index 129260bfdfe6..591e614e1cfc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -9,6 +9,11 @@
>   #include <linux/types.h>
>   
>   enum xe_gt_stats_id {
> +	XE_GT_STATS_ID_CHAIN_PAGEFAULT_COUNT,
> +	XE_GT_STATS_ID_CHAIN_IRQ_PAGEFAULT_COUNT,
> +	XE_GT_STATS_ID_CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT,
> +	XE_GT_STATS_ID_CHAIN_MISMATCH_PAGEFAULT_COUNT,
> +	XE_GT_STATS_ID_LAST_PAGEFAULT_COUNT,
>   	XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT,
>   	XE_GT_STATS_ID_TLB_INVAL,
>   	XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT,
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 9c14f9505faf..c497dd8d9724 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -364,6 +364,7 @@ xe_pagefault_queue_requeue(struct xe_pagefault_queue *pf_queue,
>   					    usm.pf_queue);
>   	struct xe_pagefault *next = pf->consumer.next, *lpf;
>   
> +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_CHAIN_MISMATCH_PAGEFAULT_COUNT, 1);
>   	xe_assert(xe, pf->consumer.alloc_state ==
>   		  XE_PAGEFAULT_ALLOC_STATE_CHAINED);
>   
> @@ -423,6 +424,10 @@ static bool xe_pagefault_cache_hit(struct xe_pagefault_queue *pf_queue,
>   			xe_assert(xe, pf_work->cache.pf->consumer.alloc_state ==
>   				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
>   
> +			xe_gt_stats_incr(pf->gt,
> +					 XE_GT_STATS_ID_CHAIN_PAGEFAULT_COUNT,
> +					 1);
> +
>   			pf->consumer.alloc_state =
>   				XE_PAGEFAULT_ALLOC_STATE_CHAINED;
>   			pf->consumer.next = pf_work->cache.pf->consumer.next;
> @@ -559,8 +564,10 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>   
>   		/* Last fault same address, ack immediately */
>   		if (xe_pagefault_cache_match(pf, cache_start, cache_end,
> -					     cache_asid))
> +					     cache_asid)) {
> +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_LAST_PAGEFAULT_COUNT, 1);
>   			goto ack_fault;
> +		}
>   
>   		err = xe_pagefault_service(pf);
>   
> @@ -816,8 +823,15 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
>   		lpf->consumer.next = NULL;
>   
>   		if (xe_pagefault_cache_hit(pf_queue, lpf)) {
> -			if (empty)
> +			xe_gt_stats_incr(pf->gt,
> +					 XE_GT_STATS_ID_CHAIN_IRQ_PAGEFAULT_COUNT,
> +					 1);
> +			if (empty) {
>   				xe_pagefault_queue_advance(pf_queue);
> +				xe_gt_stats_incr(pf->gt,
> +						 XE_GT_STATS_ID_CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT,
> +						 1);
> +			}
>   		} else {
>   			int work_index = xe_pagefault_work_index(xe);
>   

Looks good,

Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>


