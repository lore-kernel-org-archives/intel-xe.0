Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38232C5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 21:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC9E10E360;
	Fri, 21 Aug 2026 21:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYbkoyym";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A77E10E357
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 21:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787346407; x=1818882407;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ofrjw70QE2inhI3XOf+89IWEUpN4aal4qO8g1s97GH0=;
 b=XYbkoyymh7Ks5+KSf383HknoNFK62i9BbwARSUrlJtYU5PzfhDBsBRvf
 1Z4Md1HXqzENBc/MPBIZPe0NmXHqQIS6TFoca4QbG1CRJ0H3Jt4SftexU
 OY0tMEY5w4bBKzdmfyTjPse1k5yYKH3LMsy61ww8DOYqGxAk4M3n1Zm/j
 Uxk2FU43CWac+h/VRldJkBoSFGn7+t1sj6wwl3rK/7OMiXrfJFC45jmRE
 hF2cckwDbtH/xW7eglR/dUWmmeOpPzCXfQ6U34oIvsUVug6JtuEgYnzdQ
 Zz31eG8X5/SM+TSGyPt8PGL7iwTKsDdgHp+4VFJQqU47ogdbxd4JLKKek g==;
X-CSE-ConnectionGUID: RQA2iZg9R2mauJ+Zkc+sqw==
X-CSE-MsgGUID: FyhyKo+7R8uW4iTaIPPm9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="75438440"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="75438440"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 14:06:47 -0700
X-CSE-ConnectionGUID: dCaqJJqNSC6p1qnAQZmy9w==
X-CSE-MsgGUID: I1fEskAyTaKJ/tZvKfg9UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="304649735"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 14:06:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 14:06:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 14:06:45 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 14:06:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RgHJQPe1pbuD2ztwcf0ZSCxLB30M7tC26Rx0RUysuE0hfznWOrjDMkryC2yXZysKcY506daKcoxpQhqbq8RKV5z/B0zxqRNEvo+CPDAGJ0DD2gukLOioH0aN1r90XRotAdY+JXR9o0dsaQzc5gMGZtnkL5+x9PGIKegwyNiidUuW6K3Wh0BLy0rSaYO7HrmSmpkoYYCsnpQF8Ieftt3bChbNx8cZ1SN82mgJasgE0OAI8xSrJ+NAnmXcxx3M97SC94Eb1MVOnP6xR2/O/LXrrxU9x7n28NkzYXhxyqc8VHLC3R4UiwmZFvp78m7uLR32Z1tNAwjiwq1HP/4YSswcxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btkxb83HgtNGEA95b5njb3HItLpmMcEPgI1fIl9FjOs=;
 b=oo+GpBJ7CQsuYO8Y/AGakUopxKaub+MwRAzO9vuUn+SZlbH0kAdLIAoGIY49rhFAQUHd1ENrzs0cwBNMGvOq9u+3aVey/MOSVk151xKTA/78wZSJ32vNZun11oy6dcigjZpa4b8EFoOWIcRkAb/FbRWzWRi52MuN4wFJd3P+YxmTR2sly5KGQwVDA0LRwITl2Ulmur+yQdDvIHgZ1UdsDCN9JUN4tIxvT9LavMi7SM08v5XBCEUm0VaS/6DESDTX0ZEGXfU21aKro7e3RMu6osEeZke6TeIE9gtnzsoF1q9gM0cnhl2lApXU3cWEL7GRAwn00sIkOX0YwYIVBdMOLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5215.namprd11.prod.outlook.com (2603:10b6:a03:2d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 21:06:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 21:06:35 +0000
Date: Fri, 21 Aug 2026 14:06:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <Michal.Wajdeczko@intel.com>, <daniele.ceraolospurio@intel.com>,
 <shuicheng.lin@intel.com>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH 02/10] drm/xe: Sort xe_config_device fields
Message-ID: <20260821210633.GE681121@mdroper-desk1.amr.corp.intel.com>
References: <20260820210639.107524-12-stuart.summers@intel.com>
 <20260820210639.107524-14-stuart.summers@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260820210639.107524-14-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR13CA0029.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5215:EE_
X-MS-Office365-Filtering-Correlation-Id: 86876857-6ca5-44ae-a370-08deffc81598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|6133799003|22082099003|18002099003|3023799007|56012099006|4143699003|11063799006|10067099003|5023799004;
X-Microsoft-Antispam-Message-Info: ewn0BURy8W5GCfrHNhBP82UgjPjQ9mlWl/JGeZ33ykQf10M0DIXn7NgwuakTjGW6H4obYACmyEQm9lrpHWgV8iYhVmUnOw4ZGQu54bb7POp3m8zYlmnjZQaiXA0SZJtah2PkEZtd3lIdGGh9sui5hQjRbr7y/ZMheRSbvrK1ko3PNnbx636C/l9XwQfUqbW/LYyo93wzHmrEcdBezkAY81GLmcwfpsY2zceuzjNXKKub7PX3ZHiMlGCJNwUd/plNSAIQGIBRHim0VuHzgSksugl5H/Q5YpbH51Ox3Y9DzBQSbHUvENzdYvA2t7LiNCO6Twydfcb3Z8WLy4RDI60i5Rh42PpUoNEt3U5L41uVR0O1eEMDA/TrqZydCWOvvbi8B8FYRO9S2T3IJafCxIRDC+RyIFGeqgfdJI1RtQZSeJx7qhnFeQegWBa/P13I3k8KJ/r6KaipcW6sX6/bzqBuwk82NST44Ib4dTPP5Schse/cHPcLdYl039msUc/g+kPWtlxqzHaFOvzkijD+yEups2jM59UrNKUw+rzE9EpU/rnTUiUMeCBeRcSJRGxrS4FQc1j8mL4x3YBs2ApdSiyuTlQG7vE0Zwybm57C4cbmCzB+f2F68bH+sd5xO12RQourL1TP++PDg3UrALMlyDPL8RmFpZExvt4cnhvGbOesbcQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006)(4143699003)(11063799006)(10067099003)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUt2bldwSS9Vc1RGai9Eb0V0dFp1aGk5R1dtWVFJOFZPZitmN0QrTEdsMnAy?=
 =?utf-8?B?M0dleDY0cjZDTmNjci9yTENWWUZGWnl0T00rYUcxUmxzdE1McHNPbDhFd3lu?=
 =?utf-8?B?TG1wUk9oSjdSRDZ0ZW5aaVoxbGNTaGpjQWdYYWh1TEh3OTlvN2lwcUxFWndz?=
 =?utf-8?B?b3FaaklXK2R0T2pUajVnZjZLOHN0M0NndU1vdFlsNXlyY3lCYXhOajJmSm8x?=
 =?utf-8?B?ak15bktGd1ZIZFUvcWE2ZmVlREJNcloxTFpoLzVhSXZVdzYzYVJpNE9JVGpQ?=
 =?utf-8?B?RmR5V0FiNndCNC9PZVd1aTZhT0llZHVjWm1VcExEdlN1V0xpQW8za3EwRjZx?=
 =?utf-8?B?Tm91REoxRGU2L0pqRHNjU3R2ZlVrOUV2Sk5IQVNCQy9aZHhXdWNXNUU4dEQ0?=
 =?utf-8?B?WU5CQUtoRWZGbWJGejc2ZGhtZGExSFI1MTQvTFEvRkg1bFVNQWlZRWwyQ2oz?=
 =?utf-8?B?ZkUzNW94WWM4akdMUUhDME9QVHRwR2lyeTRnRzZBS0U5YTRLVGEzb2tDUE9r?=
 =?utf-8?B?dU9VZlZiSzNEbTZRdUFhaUtNdWowS0pHQzduSm5WRGxWT1JuUGFFYWVuUkJa?=
 =?utf-8?B?YTdsNWU3NWlKWVozYXRTbEptU1NCdU1JRnhQcXVaMXFFTHJ6MmN5bEJDUnRW?=
 =?utf-8?B?T0FnbmFOKy8vQ3dVcWNUSHFOMDRHM3ZreFBXYnlJVnlWOXBvdTgrb1BZWlli?=
 =?utf-8?B?UHNRajhRQmsydkt3Q2VEMEdDT3V4RllZVEVWWlE4UE0zWXB1OENhaDdIOE5S?=
 =?utf-8?B?aHVnanV0M1B3NmdWODRya1gyc2Mrem55VDBmdW5nbjdRRDBoY2p2c1crd0VM?=
 =?utf-8?B?YVRhY2RtdzFwZ1BJSzBpSzZ3cnFqNTh0MTE1QWxiUVZBb2t1dlF4UGFmaWNB?=
 =?utf-8?B?Sjd4bjIrWkdHZTdVOFdjcUNJcjZld2NqM1NicCtySFc4akJyQmJTVTZobXpl?=
 =?utf-8?B?OG5qWXI0bFhNRHErL0MvM3NWdGlXd0F6UXVSWXZTVFZMcHliZlRzNlphOERp?=
 =?utf-8?B?RUdQYjQzM0V0Ukt1SUxXUW9QZmwyb3Z6dE9HNXJ4cDZ1QTdxNi9pdG1JWEdP?=
 =?utf-8?B?YkdoNVFyVXNnQWRSVkJyOTVKdlBZczFYaXFON20vNStHZzBRekl6ZE1mcFk5?=
 =?utf-8?B?YzB0OW16MkdYMGd2R09lcitueUdMVFkyZndjajRDajE1SU1TOXpTazBZYnk2?=
 =?utf-8?B?YWNsenU1QUFGZm5iWkc4RDJxRFowUHJaV1RaMDRNRW1ScURldWpwd01LaUYv?=
 =?utf-8?B?c25wZmVEZFhUM3RRL1c3NHlFWFVqWStLVkQ4T21NRFAzZzVadVZnMnFKMVVx?=
 =?utf-8?B?SUcrK2N0Yzc0ZXFJNUR6bFRmZ3dvbmhZa2NsRUxQN2d6VWZuY01JL01UQ0JC?=
 =?utf-8?B?dmI2WkxuUVp5MVp4aFlMY3ZjcnV5cktZdHVLdDQ1SXZrQS8yRzkwazg0Nld3?=
 =?utf-8?B?ZUF0dE5VNm11RysxOHN3WGNLamloQVZ4U2xLSDdvYmRPV2FlcGJQa1hqb0U2?=
 =?utf-8?B?NVQrK0F6WjJmWm90QlF5YWszQUVHeUt3QTRqY3A5U2piZmFlOWtueG1ua3Fh?=
 =?utf-8?B?WVU0MnhRbmVNOU15aldvTnhoSDk1OGpkQXFmSUcrRVRRN1ByZE1UdDg2ZDJn?=
 =?utf-8?B?MlRVWThhemErUExLS2RtZzZ2UjkyajhRVDc5ZkcvVXd6djZpczYrQlpVb3dM?=
 =?utf-8?B?djZsY2NvWHZKSmR4VUM0dkVqSGJYMmNTKzZUMHRMSTRlc0tvdmtSL1p5Wk5M?=
 =?utf-8?B?ZFpoNkNYSmkyRy92VEJpckhrZWhKL0FkbVU4V2plT3pkazcwOFNuaE9xVDIx?=
 =?utf-8?B?RkxIalowL29NKzBNTWtzbFAzY0dUejlSQlFVWVlkZXRlbGVhZ0laZGpMZDJr?=
 =?utf-8?B?L2pjeFFmVnFrTmtIdVJPb0VZK0dMcDkyQWJSK2VuUlFoUUZzbWowc1Vwc3Jl?=
 =?utf-8?B?aVFiaWtONjlwVll3YzQ2WEhEc0xDSWtBTkYzOWtIN29ZcU14TGN4VWQxT2Ix?=
 =?utf-8?B?L1pyaGhOTXJXZ3oyUDZsdVk1QTFLV29lZmZnMk94ZThhaHhOQ0VUcW55WGgr?=
 =?utf-8?B?b1Y4ZWhCcXh3M2xvRFFwbXFMUjBST2tIeTJqczBtcG8zZ0JldkJwMy95Y1M2?=
 =?utf-8?B?Y2FmczgvMXRLMkltQU9MMTFmYjR6QWZscjc1cFV4bmQzcGY3N1JBWHNIbVVQ?=
 =?utf-8?B?REd1amIzZDdEZUJnb0pxM04reUd2K0cvdWUyYUNReE9QZ1dna0lMN0pOczVm?=
 =?utf-8?B?NlI5UTNVMGJ1eUVvRzloT3ZaRlk0M1NMRkxYY2lGNHkwN0N1TVZlOFRyNnFP?=
 =?utf-8?B?dVBabTBsQUNYTHprRlJKVmFoN3pvMmZJdWFLM2dBTHlOajVjR21nWnoxSmVT?=
 =?utf-8?Q?T3c1Um4ubioOGsYw=3D?=
X-Exchange-RoutingPolicyChecked: DGLNepY/TQlJTWSNVh/ukezXZMfASIgr4CZnGRlPit7dk4/olQTZ2HZzRL4SRfWuothjvEp7GW4fXZUgOSGXvzG95sPZ6F3n06DnbO9QGDJmOwVNhJv0jxfZ+IlrayO2swdK2Mk2djz4o0CvLs8XV53xDiOjH6yc/xE/6hnDWR8XT+gzCGjqQC0LuXRhSBGo03l0BQmkOi/UK5qhilKSDSDpAB0gIQSQG9NLWvQ3WY8fpHAfaoqbpMSbfPynCQabD1/4Kwcmy5R1WpOHTZtXJ5FoKsOO8/lVjzORqQTbAsb+J/WRa6PrngQh0nILy+DE6mikLAQ7P4TpylkfrfGWmA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 86876857-6ca5-44ae-a370-08deffc81598
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 21:06:35.6184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKdT7ZTivwI8ougOZ/8k0tLeRvmqsvTA1VrcaQXI/DB/P/C9P9xNKWr6LeSFwaidx+1gAAss+xQ1HlZILs5SkIFrpkfkxbjEWs/ZbLz/ObM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5215
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

On Thu, Aug 20, 2026 at 09:06:41PM +0000, Stuart Summers wrote:
> As we're planning more configfs entries over time, let's add
> some sorting rules to make sure this stays clean and easy to
> manage. Sorting first by type and then name for readability.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Assisted-by: Copilot:claude-sonnet-4.6,claude-opus-4.7
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 1092 +++++++++++++++---------------
>  drivers/gpu/drm/xe/xe_configfs.h |   24 +-
>  2 files changed, 564 insertions(+), 552 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 0a85043a9dd0..cb6ab1fcb8c1 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -58,10 +58,11 @@
>   *	│   └── ...
>   *	:
>   *	└── 0000:03:00.0
> - *	    ├── survivability_mode
> - *	    ├── gt_types_allowed
>   *	    ├── engines_allowed
> - *	    └── enable_psmi
> + *	    ├── gt_types_allowed
> + *	    ├── enable_multi_queue
> + *	    ├── enable_psmi
> + *	    └── survivability_mode

Kind of a subjective nitpick, but I'd handle the structure sorting
independently from the doc/function sorting.  IMO, this tree structure
should effectively be what the user expects to see when running "ls -l"
and they won't be thinking about what datatype we're using internally to
store the value (u64 vs bool vs ...).  Same for the expanded
descriptions below...if I want to find "enable_foo" documentation, I
think just pure alphabetic sorting is easiest to search through.  I'd
only incorporate the datatype as a sorting factor for the structure
itself.

BTW, should we add the ctx_restore_* entries and the SR-IOV subdirectory
to this tree so that it accurately reflects where everything lists in
the hierarchy?


Matt

>   *
>   * After configuring the attributes as per next section, the device can be
>   * probed with::
> @@ -73,13 +74,82 @@
>   * Configure Attributes
>   * ====================
>   *
> - * Survivability mode:
> - * -------------------
> +
> + * Context restore BB
> + * ------------------
>   *
> - * Enable survivability mode on supported cards. This setting only takes
> - * effect when probing the device. Example to enable it::
> + * Allow to execute a batch buffer during any context switches. When the
> + * GPU is restoring the context, it executes additional commands. It's useful
> + * for testing additional workarounds and validating certain HW behaviors: it's
> + * not intended for normal execution and will taint the kernel with TAINT_TEST
> + * when used.
>   *
> - *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
> + * The syntax allows to pass straight instructions to be executed by the engine
> + * in a batch buffer or set specific registers.
> + *
> + * #. Generic instruction::
> + *
> + *	<engine-class> cmd <instr> [[dword0] [dword1] [...]]
> + *
> + * #. Simple register setting::
> + *
> + *	<engine-class> reg <address> <value>
> + *
> + * Commands are saved per engine class: all instances of that class will execute
> + * those commands during context switch. The instruction, dword arguments,
> + * addresses and values are in hex format like in the examples below.
> + *
> + * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 after the
> + *    normal context restore::
> + *
> + *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> + *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb
> + *
> + * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 at the
> + *    beginning of the context restore::
> + *
> + *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> + *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_mid_bb
> +
> + * #. Load certain values in a couple of registers (it can be used as a simpler
> + *    alternative to the `cmd`) action::
> + *
> + *	# cat > /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb <<EOF
> + *	rcs reg 4F100 DEADBEEF
> + *	rcs reg 4F104 FFFFFFFF
> + *	EOF
> + *
> + *    .. note::
> + *
> + *       When using multiple lines, make sure to use a command that is
> + *       implemented with a single write syscall, like HEREDOC.
> + *
> + * Currently this is implemented only for post and mid context restore and
> + * these attributes can only be set before binding to the device.
> + *
> + * Allowed engines:
> + * ----------------
> + *
> + * Allow only a set of engine(s) to be available, disabling the other engines
> + * even if they are available in hardware. This is applied after HW fuses are
> + * considered on each tile. Examples:
> + *
> + * Allow only one render and one copy engines, nothing else::
> + *
> + *	# echo 'rcs0,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engines_allowed
> + *
> + * Allow only compute engines and first copy engine::
> + *
> + *	# echo 'ccs*,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engines_allowed
> + *
> + * Note that the engine names are the per-GT hardware names. On multi-tile
> + * platforms, writing ``rcs0,bcs0`` to this file would allow the first render
> + * and copy engines on each tile.
> + *
> + * The requested configuration may not be supported by the platform and driver
> + * may fail to probe. For example: if at least one copy engine is expected to be
> + * available for migrations, but it's disabled. This is intended for debugging
> + * purposes only.
>   *
>   * This attribute can only be set before binding to the device.
>   *
> @@ -121,29 +191,15 @@
>   *
>   *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>   *
> - * Allowed engines:
> - * ----------------
> - *
> - * Allow only a set of engine(s) to be available, disabling the other engines
> - * even if they are available in hardware. This is applied after HW fuses are
> - * considered on each tile. Examples:
> - *
> - * Allow only one render and one copy engines, nothing else::
> - *
> - *	# echo 'rcs0,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engines_allowed
> - *
> - * Allow only compute engines and first copy engine::
> - *
> - *	# echo 'ccs*,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engines_allowed
> + * Enable multi-queue
> + * ------------------
>   *
> - * Note that the engine names are the per-GT hardware names. On multi-tile
> - * platforms, writing ``rcs0,bcs0`` to this file would allow the first render
> - * and copy engines on each tile.
> + * Multi-queue support on the device is enabled by default where the
> + * hardware supports it. Writing 0 force-disables multi-queue support:
> + * multi-queue exec-queue group creation via ioctl is refused, and the
> + * GuC feature is disabled::
>   *
> - * The requested configuration may not be supported by the platform and driver
> - * may fail to probe. For example: if at least one copy engine is expected to be
> - * available for migrations, but it's disabled. This is intended for debugging
> - * purposes only.
> + *	# echo 0 > /sys/kernel/config/xe/0000:03:00.0/enable_multi_queue
>   *
>   * This attribute can only be set before binding to the device.
>   *
> @@ -159,57 +215,15 @@
>   *
>   * This attribute can only be set before binding to the device.
>   *
> - * Context restore BB
> - * ------------------
> - *
> - * Allow to execute a batch buffer during any context switches. When the
> - * GPU is restoring the context, it executes additional commands. It's useful
> - * for testing additional workarounds and validating certain HW behaviors: it's
> - * not intended for normal execution and will taint the kernel with TAINT_TEST
> - * when used.
> - *
> - * The syntax allows to pass straight instructions to be executed by the engine
> - * in a batch buffer or set specific registers.
> - *
> - * #. Generic instruction::
> - *
> - *	<engine-class> cmd <instr> [[dword0] [dword1] [...]]
> - *
> - * #. Simple register setting::
> - *
> - *	<engine-class> reg <address> <value>
> - *
> - * Commands are saved per engine class: all instances of that class will execute
> - * those commands during context switch. The instruction, dword arguments,
> - * addresses and values are in hex format like in the examples below.
> - *
> - * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 after the
> - *    normal context restore::
> - *
> - *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> - *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb
> - *
> - * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 at the
> - *    beginning of the context restore::
> - *
> - *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> - *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_mid_bb
> -
> - * #. Load certain values in a couple of registers (it can be used as a simpler
> - *    alternative to the `cmd`) action::
> - *
> - *	# cat > /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb <<EOF
> - *	rcs reg 4F100 DEADBEEF
> - *	rcs reg 4F104 FFFFFFFF
> - *	EOF
> + * Survivability mode:
> + * -------------------
>   *
> - *    .. note::
> + * Enable survivability mode on supported cards. This setting only takes
> + * effect when probing the device. Example to enable it::
>   *
> - *       When using multiple lines, make sure to use a command that is
> - *       implemented with a single write syscall, like HEREDOC.
> + *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>   *
> - * Currently this is implemented only for post and mid context restore and
> - * these attributes can only be set before binding to the device.
> + * This attribute can only be set before binding to the device.
>   *
>   * Max SR-IOV Virtual Functions
>   * ----------------------------
> @@ -237,18 +251,6 @@
>   *
>   * This setting only takes effect when probing the device.
>   *
> - * Enable multi-queue
> - * ------------------
> - *
> - * Multi-queue support on the device is enabled by default where the
> - * hardware supports it. Writing 0 force-disables multi-queue support:
> - * multi-queue exec-queue group creation via ioctl is refused, and the
> - * GuC feature is disabled::
> - *
> - *	# echo 0 > /sys/kernel/config/xe/0000:03:00.0/enable_multi_queue
> - *
> - * This attribute can only be set before binding to the device.
> - *
>   * Remove devices
>   * ==============
>   *
> @@ -267,14 +269,19 @@ struct xe_config_group_device {
>  	struct config_group group;
>  	struct config_group sriov;
>  
> +	/*
> +	 * Fields sorted by type (largest first) then name: struct arrays,
> +	 * u64, u32/unsigned int, u8, bool, sub-structs last. Within each
> +	 * type, entries are sorted alphabetically.
> +	 */
>  	struct xe_config_device {
> -		u64 gt_types_allowed;
> -		u64 engines_allowed;
> -		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
>  		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> -		bool survivability_mode;
> -		bool enable_psmi;
> +		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
> +		u64 engines_allowed;
> +		u64 gt_types_allowed;
>  		bool enable_multi_queue;
> +		bool enable_psmi;
> +		bool survivability_mode;
>  		struct {
>  			unsigned int max_vfs;
>  			bool admin_only_pf;
> @@ -290,11 +297,11 @@ struct xe_config_group_device {
>  };
>  
>  static const struct xe_config_device device_defaults = {
> -	.gt_types_allowed = U64_MAX,
>  	.engines_allowed = U64_MAX,
> -	.survivability_mode = false,
> -	.enable_psmi = false,
> +	.gt_types_allowed = U64_MAX,
>  	.enable_multi_queue = true,
> +	.enable_psmi = false,
> +	.survivability_mode = false,
>  	.sriov = {
>  		.max_vfs = XE_DEFAULT_MAX_VFS,
>  		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
> @@ -371,247 +378,60 @@ static bool is_bound(struct xe_config_group_device *dev)
>  	return ret;
>  }
>  
> -static ssize_t survivability_mode_show(struct config_item *item, char *page)
> -{
> -	struct xe_config_device *dev = to_xe_config_device(item);
> -
> -	return sprintf(page, "%d\n", dev->survivability_mode);
> -}
> +static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev *pdev);
>  
> -static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
> +/**
> + * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
> + * @pdev: pci device
> + * @class: hw engine class
> + * @cs: pointer to the bb to use - only valid during probe
> + *
> + * Return: Number of dwords used in the mid_ctx_restore setting in configfs
> + */
> +u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> +				       enum xe_engine_class class,
> +				       const u32 **cs)
>  {
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> -	bool survivability_mode;
> -	int ret;
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	u32 len;
>  
> -	ret = kstrtobool(page, &survivability_mode);
> -	if (ret)
> -		return ret;
> +	if (!dev)
> +		return 0;
>  
> -	guard(mutex)(&dev->lock);
> -	if (is_bound(dev))
> -		return -EBUSY;
> +	scoped_guard(mutex, &dev->lock) {
> +		if (cs)
> +			*cs = dev->config.ctx_restore_mid_bb[class].cs;
>  
> -	dev->config.survivability_mode = survivability_mode;
> +		len = dev->config.ctx_restore_mid_bb[class].len;
> +	}
> +	config_group_put(&dev->group);
>  
>  	return len;
>  }
>  
> -static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
> +/**
> + * xe_configfs_get_ctx_restore_post_bb - get configfs ctx_restore_post_bb setting
> + * @pdev: pci device
> + * @class: hw engine class
> + * @cs: pointer to the bb to use - only valid during probe
> + *
> + * Return: Number of dwords used in the post_ctx_restore setting in configfs
> + */
> +u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> +					enum xe_engine_class class,
> +					const u32 **cs)
>  {
> -	struct xe_config_device *dev = to_xe_config_device(item);
> -	char *p = page;
> -
> -	for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
> -		if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
> -			p += sprintf(p, "%s\n", gt_types[i].name);
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	u32 len;
>  
> -	return p - page;
> -}
> +	if (!dev)
> +		return 0;
>  
> -static ssize_t gt_types_allowed_store(struct config_item *item, const char *page,
> -				      size_t len)
> -{
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> -	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);
> -	char *p = buf;
> -	u64 typemask = 0;
> -
> -	if (!buf)
> -		return -ENOMEM;
> -
> -	while (p) {
> -		char *typename = strsep(&p, ",\n");
> -		bool matched = false;
> -
> -		if (typename[0] == '\0')
> -			continue;
> -
> -		for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++) {
> -			if (strcmp(typename, gt_types[i].name) == 0) {
> -				typemask |= BIT(gt_types[i].type);
> -				matched = true;
> -				break;
> -			}
> -		}
> -
> -		if (!matched)
> -			return -EINVAL;
> -	}
> -
> -	guard(mutex)(&dev->lock);
> -	if (is_bound(dev))
> -		return -EBUSY;
> -
> -	dev->config.gt_types_allowed = typemask;
> -
> -	return len;
> -}
> -
> -static ssize_t engines_allowed_show(struct config_item *item, char *page)
> -{
> -	struct xe_config_device *dev = to_xe_config_device(item);
> -	char *p = page;
> -
> -	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> -		u64 mask = engine_info[i].mask;
> -
> -		if ((dev->engines_allowed & mask) == mask) {
> -			p += sprintf(p, "%s*\n", engine_info[i].cls);
> -		} else if (mask & dev->engines_allowed) {
> -			u16 bit0 = __ffs64(mask), bit;
> -
> -			mask &= dev->engines_allowed;
> -
> -			for_each_set_bit(bit, (const unsigned long *)&mask, 64)
> -				p += sprintf(p, "%s%u\n", engine_info[i].cls,
> -					     bit - bit0);
> -		}
> -	}
> -
> -	return p - page;
> -}
> -
> -/*
> - * Lookup engine_info. If @mask is not NULL, reduce the mask according to the
> - * instance in @pattern.
> - *
> - * Examples of inputs:
> - * - lookup_engine_info("rcs0", &mask): return "rcs" entry from @engine_info and
> - *   mask == BIT_ULL(XE_HW_ENGINE_RCS0)
> - * - lookup_engine_info("rcs*", &mask): return "rcs" entry from @engine_info and
> - *   mask == XE_HW_ENGINE_RCS_MASK
> - * - lookup_engine_info("rcs", NULL): return "rcs" entry from @engine_info
> - */
> -static const struct engine_info *lookup_engine_info(const char *pattern, u64 *mask)
> -{
> -	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> -		u8 instance;
> -		u16 bit;
> -
> -		if (!str_has_prefix(pattern, engine_info[i].cls))
> -			continue;
> -
> -		pattern += strlen(engine_info[i].cls);
> -		if (!mask)
> -			return *pattern ? NULL : &engine_info[i];
> -
> -		if (!strcmp(pattern, "*")) {
> -			*mask = engine_info[i].mask;
> -			return &engine_info[i];
> -		}
> -
> -		if (kstrtou8(pattern, 10, &instance))
> -			return NULL;
> -
> -		bit = __ffs64(engine_info[i].mask) + instance;
> -		if (bit >= fls64(engine_info[i].mask))
> -			return NULL;
> -
> -		*mask = BIT_ULL(bit);
> -		return &engine_info[i];
> -	}
> -
> -	return NULL;
> -}
> -
> -static int parse_engine(const char *s, const char *end_chars, u64 *mask,
> -			const struct engine_info **pinfo)
> -{
> -	char buf[MAX_ENGINE_CLASS_CHARS + MAX_ENGINE_INSTANCE_CHARS + 1];
> -	const struct engine_info *info;
> -	size_t len;
> -
> -	len = strcspn(s, end_chars);
> -	if (len >= sizeof(buf))
> -		return -EINVAL;
> -
> -	memcpy(buf, s, len);
> -	buf[len] = '\0';
> -
> -	info = lookup_engine_info(buf, mask);
> -	if (!info)
> -		return -ENOENT;
> -
> -	if (pinfo)
> -		*pinfo = info;
> -
> -	return len;
> -}
> -
> -static ssize_t engines_allowed_store(struct config_item *item, const char *page,
> -				     size_t len)
> -{
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> -	ssize_t patternlen, p;
> -	u64 mask, val = 0;
> -
> -	for (p = 0; p < len; p += patternlen + 1) {
> -		patternlen = parse_engine(page + p, ",\n", &mask, NULL);
> -		if (patternlen < 0)
> -			return -EINVAL;
> -
> -		val |= mask;
> +	scoped_guard(mutex, &dev->lock) {
> +		*cs = dev->config.ctx_restore_post_bb[class].cs;
> +		len = dev->config.ctx_restore_post_bb[class].len;
>  	}
> -
> -	guard(mutex)(&dev->lock);
> -	if (is_bound(dev))
> -		return -EBUSY;
> -
> -	dev->config.engines_allowed = val;
> -
> -	return len;
> -}
> -
> -static ssize_t enable_psmi_show(struct config_item *item, char *page)
> -{
> -	struct xe_config_device *dev = to_xe_config_device(item);
> -
> -	return sprintf(page, "%d\n", dev->enable_psmi);
> -}
> -
> -static ssize_t enable_psmi_store(struct config_item *item, const char *page, size_t len)
> -{
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> -	bool val;
> -	int ret;
> -
> -	ret = kstrtobool(page, &val);
> -	if (ret)
> -		return ret;
> -
> -	guard(mutex)(&dev->lock);
> -	if (is_bound(dev))
> -		return -EBUSY;
> -
> -	dev->config.enable_psmi = val;
> -
> -	return len;
> -}
> -
> -static ssize_t enable_multi_queue_show(struct config_item *item, char *page)
> -{
> -	struct xe_config_device *dev = to_xe_config_device(item);
> -
> -	return sprintf(page, "%d\n", dev->enable_multi_queue);
> -}
> -
> -static ssize_t enable_multi_queue_store(struct config_item *item, const char *page,
> -					size_t len)
> -{
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> -	bool val;
> -	int ret;
> -
> -	ret = kstrtobool(page, &val);
> -	if (ret)
> -		return ret;
> -
> -	guard(mutex)(&dev->lock);
> -	if (is_bound(dev))
> -		return -EBUSY;
> -
> -	dev->config.enable_multi_queue = val;
> +	config_group_put(&dev->group);
>  
>  	return len;
>  }
> @@ -718,6 +538,9 @@ static ssize_t parse_hex(const char *line, u32 *pval)
>  	return p - line;
>  }
>  
> +static int parse_engine(const char *s, const char *end_chars, u64 *mask,
> +			const struct engine_info **pinfo);
> +
>  /*
>   * Parse lines with the format
>   *
> @@ -802,70 +625,439 @@ static ssize_t wa_bb_store(struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
>  		return count;
>  
>  	guard(mutex)(&dev->lock);
> -
> +
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	/*
> +	 * 2. Allocate a u32 array and set the pointers to the right positions
> +	 * according to the length of each class' wa_bb
> +	 */
> +	tmp = krealloc(wa_bb[0].cs, count * sizeof(u32), GFP_KERNEL);
> +	if (!tmp)
> +		return -ENOMEM;
> +
> +	if (!count) {
> +		memset(wa_bb, 0, sizeof(tmp_wa_bb));
> +		return len;
> +	}
> +
> +	for (class = 0, count = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
> +		tmp_wa_bb[class].cs = tmp + count;
> +		count += tmp_wa_bb[class].len;
> +		tmp_wa_bb[class].len = 0;
> +	}
> +
> +	/* 3. Parse wa_bb lines again, this time saving the values */
> +	count = parse_wa_bb_lines(page, tmp_wa_bb);
> +	if (count < 0)
> +		return count;
> +
> +	memcpy(wa_bb, tmp_wa_bb, sizeof(tmp_wa_bb));
> +
> +	return len;
> +}
> +
> +static ssize_t ctx_restore_mid_bb_store(struct config_item *item,
> +					const char *data, size_t sz)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +
> +	return wa_bb_store(dev->config.ctx_restore_mid_bb, dev, data, sz);
> +}
> +
> +static ssize_t ctx_restore_post_bb_store(struct config_item *item,
> +					 const char *data, size_t sz)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +
> +	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
> +}
> +
> +/**
> + * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
> + * @pdev: pci device
> + *
> + * Return: engine mask with allowed engines set in configfs
> + */
> +u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	u64 engines_allowed;
> +
> +	if (!dev)
> +		return device_defaults.engines_allowed;
> +
> +	scoped_guard(mutex, &dev->lock)
> +		engines_allowed = dev->config.engines_allowed;
> +	config_group_put(&dev->group);
> +
> +	return engines_allowed;
> +}
> +
> +static ssize_t engines_allowed_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +	char *p = page;
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> +		u64 mask = engine_info[i].mask;
> +
> +		if ((dev->engines_allowed & mask) == mask) {
> +			p += sprintf(p, "%s*\n", engine_info[i].cls);
> +		} else if (mask & dev->engines_allowed) {
> +			u16 bit0 = __ffs64(mask), bit;
> +
> +			mask &= dev->engines_allowed;
> +
> +			for_each_set_bit(bit, (const unsigned long *)&mask, 64)
> +				p += sprintf(p, "%s%u\n", engine_info[i].cls,
> +					     bit - bit0);
> +		}
> +	}
> +
> +	return p - page;
> +}
> +
> +/*
> + * Lookup engine_info. If @mask is not NULL, reduce the mask according to the
> + * instance in @pattern.
> + *
> + * Examples of inputs:
> + * - lookup_engine_info("rcs0", &mask): return "rcs" entry from @engine_info and
> + *   mask == BIT_ULL(XE_HW_ENGINE_RCS0)
> + * - lookup_engine_info("rcs*", &mask): return "rcs" entry from @engine_info and
> + *   mask == XE_HW_ENGINE_RCS_MASK
> + * - lookup_engine_info("rcs", NULL): return "rcs" entry from @engine_info
> + */
> +static const struct engine_info *lookup_engine_info(const char *pattern, u64 *mask)
> +{
> +	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> +		u8 instance;
> +		u16 bit;
> +
> +		if (!str_has_prefix(pattern, engine_info[i].cls))
> +			continue;
> +
> +		pattern += strlen(engine_info[i].cls);
> +		if (!mask)
> +			return *pattern ? NULL : &engine_info[i];
> +
> +		if (!strcmp(pattern, "*")) {
> +			*mask = engine_info[i].mask;
> +			return &engine_info[i];
> +		}
> +
> +		if (kstrtou8(pattern, 10, &instance))
> +			return NULL;
> +
> +		bit = __ffs64(engine_info[i].mask) + instance;
> +		if (bit >= fls64(engine_info[i].mask))
> +			return NULL;
> +
> +		*mask = BIT_ULL(bit);
> +		return &engine_info[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static int parse_engine(const char *s, const char *end_chars, u64 *mask,
> +			const struct engine_info **pinfo)
> +{
> +	char buf[MAX_ENGINE_CLASS_CHARS + MAX_ENGINE_INSTANCE_CHARS + 1];
> +	const struct engine_info *info;
> +	size_t len;
> +
> +	len = strcspn(s, end_chars);
> +	if (len >= sizeof(buf))
> +		return -EINVAL;
> +
> +	memcpy(buf, s, len);
> +	buf[len] = '\0';
> +
> +	info = lookup_engine_info(buf, mask);
> +	if (!info)
> +		return -ENOENT;
> +
> +	if (pinfo)
> +		*pinfo = info;
> +
> +	return len;
> +}
> +
> +static ssize_t engines_allowed_store(struct config_item *item, const char *page,
> +				     size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	ssize_t patternlen, p;
> +	u64 mask, val = 0;
> +
> +	for (p = 0; p < len; p += patternlen + 1) {
> +		patternlen = parse_engine(page + p, ",\n", &mask, NULL);
> +		if (patternlen < 0)
> +			return -EINVAL;
> +
> +		val |= mask;
> +	}
> +
> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.engines_allowed = val;
> +
> +	return len;
> +}
> +
> +static u64 get_gt_types_allowed(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	u64 mask;
> +
> +	if (!dev)
> +		return device_defaults.gt_types_allowed;
> +
> +	scoped_guard(mutex, &dev->lock)
> +		mask = dev->config.gt_types_allowed;
> +	config_group_put(&dev->group);
> +
> +	return mask;
> +}
> +
> +/**
> + * xe_configfs_primary_gt_allowed - determine whether primary GTs are supported
> + * @pdev: pci device
> + *
> + * Return: True if primary GTs are enabled, false if they have been disabled via
> + *     configfs.
> + */
> +bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev)
> +{
> +	return get_gt_types_allowed(pdev) & BIT_ULL(XE_GT_TYPE_MAIN);
> +}
> +
> +/**
> + * xe_configfs_media_gt_allowed - determine whether media GTs are supported
> + * @pdev: pci device
> + *
> + * Return: True if the media GTs are enabled, false if they have been disabled
> + *     via configfs.
> + */
> +bool xe_configfs_media_gt_allowed(struct pci_dev *pdev)
> +{
> +	return get_gt_types_allowed(pdev) & BIT_ULL(XE_GT_TYPE_MEDIA);
> +}
> +
> +static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +	char *p = page;
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
> +		if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
> +			p += sprintf(p, "%s\n", gt_types[i].name);
> +
> +	return p - page;
> +}
> +
> +static ssize_t gt_types_allowed_store(struct config_item *item, const char *page,
> +				      size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);
> +	char *p = buf;
> +	u64 typemask = 0;
> +
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	while (p) {
> +		char *typename = strsep(&p, ",\n");
> +		bool matched = false;
> +
> +		if (typename[0] == '\0')
> +			continue;
> +
> +		for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++) {
> +			if (strcmp(typename, gt_types[i].name) == 0) {
> +				typemask |= BIT(gt_types[i].type);
> +				matched = true;
> +				break;
> +			}
> +		}
> +
> +		if (!matched)
> +			return -EINVAL;
> +	}
> +
> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.gt_types_allowed = typemask;
> +
> +	return len;
> +}
> +
> +/**
> + * xe_configfs_get_enable_multi_queue - get configfs enable_multi_queue setting
> + * @pdev: pci device
> + *
> + * Return: true if multi-queue is enabled for this device (the default),
> + * false if it has been force-disabled via configfs.
> + */
> +bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	bool ret;
> +
> +	if (!dev)
> +		return true;
> +
> +	scoped_guard(mutex, &dev->lock)
> +		ret = dev->config.enable_multi_queue;
> +	config_group_put(&dev->group);
> +
> +	return ret;
> +}
> +
> +static ssize_t enable_multi_queue_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +
> +	return sprintf(page, "%d\n", dev->enable_multi_queue);
> +}
> +
> +static ssize_t enable_multi_queue_store(struct config_item *item, const char *page,
> +					size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	bool val;
> +	int ret;
> +
> +	ret = kstrtobool(page, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.enable_multi_queue = val;
> +
> +	return len;
> +}
> +
> +/**
> + * xe_configfs_get_psmi_enabled - get configfs enable_psmi setting
> + * @pdev: pci device
> + *
> + * Return: enable_psmi setting in configfs
> + */
> +bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	bool ret;
> +
> +	if (!dev)
> +		return false;
> +
> +	scoped_guard(mutex, &dev->lock)
> +		ret = dev->config.enable_psmi;
> +	config_group_put(&dev->group);
> +
> +	return ret;
> +}
> +
> +static ssize_t enable_psmi_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +
> +	return sprintf(page, "%d\n", dev->enable_psmi);
> +}
> +
> +static ssize_t enable_psmi_store(struct config_item *item, const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	bool val;
> +	int ret;
> +
> +	ret = kstrtobool(page, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&dev->lock);
>  	if (is_bound(dev))
>  		return -EBUSY;
>  
> -	/*
> -	 * 2. Allocate a u32 array and set the pointers to the right positions
> -	 * according to the length of each class' wa_bb
> -	 */
> -	tmp = krealloc(wa_bb[0].cs, count * sizeof(u32), GFP_KERNEL);
> -	if (!tmp)
> -		return -ENOMEM;
> +	dev->config.enable_psmi = val;
>  
> -	if (!count) {
> -		memset(wa_bb, 0, sizeof(tmp_wa_bb));
> -		return len;
> -	}
> +	return len;
> +}
>  
> -	for (class = 0, count = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
> -		tmp_wa_bb[class].cs = tmp + count;
> -		count += tmp_wa_bb[class].len;
> -		tmp_wa_bb[class].len = 0;
> -	}
> +/**
> + * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
> + * @pdev: pci device
> + *
> + * Return: survivability_mode attribute in configfs
> + */
> +bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	bool mode;
>  
> -	/* 3. Parse wa_bb lines again, this time saving the values */
> -	count = parse_wa_bb_lines(page, tmp_wa_bb);
> -	if (count < 0)
> -		return count;
> +	if (!dev)
> +		return device_defaults.survivability_mode;
>  
> -	memcpy(wa_bb, tmp_wa_bb, sizeof(tmp_wa_bb));
> +	scoped_guard(mutex, &dev->lock)
> +		mode = dev->config.survivability_mode;
> +	config_group_put(&dev->group);
>  
> -	return len;
> +	return mode;
>  }
>  
> -static ssize_t ctx_restore_mid_bb_store(struct config_item *item,
> -					const char *data, size_t sz)
> +static ssize_t survivability_mode_show(struct config_item *item, char *page)
>  {
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	struct xe_config_device *dev = to_xe_config_device(item);
>  
> -	return wa_bb_store(dev->config.ctx_restore_mid_bb, dev, data, sz);
> +	return sprintf(page, "%d\n", dev->survivability_mode);
>  }
>  
> -static ssize_t ctx_restore_post_bb_store(struct config_item *item,
> -					 const char *data, size_t sz)
> +static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
>  {
>  	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	bool survivability_mode;
> +	int ret;
>  
> -	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
> +	ret = kstrtobool(page, &survivability_mode);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.survivability_mode = survivability_mode;
> +
> +	return len;
>  }
>  
>  CONFIGFS_ATTR(, ctx_restore_mid_bb);
>  CONFIGFS_ATTR(, ctx_restore_post_bb);
> -CONFIGFS_ATTR(, enable_multi_queue);
> -CONFIGFS_ATTR(, enable_psmi);
>  CONFIGFS_ATTR(, engines_allowed);
>  CONFIGFS_ATTR(, gt_types_allowed);
> +CONFIGFS_ATTR(, enable_multi_queue);
> +CONFIGFS_ATTR(, enable_psmi);
>  CONFIGFS_ATTR(, survivability_mode);
>  
>  static struct configfs_attribute *xe_config_device_attrs[] = {
>  	&attr_ctx_restore_mid_bb,
>  	&attr_ctx_restore_post_bb,
> -	&attr_enable_multi_queue,
> -	&attr_enable_psmi,
>  	&attr_engines_allowed,
>  	&attr_gt_types_allowed,
> +	&attr_enable_multi_queue,
> +	&attr_enable_psmi,
>  	&attr_survivability_mode,
>  	NULL,
>  };
> @@ -1138,8 +1330,8 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>  				 dev->config.attr_); \
>  	} while (0)
>  
> -	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
>  	PRI_CUSTOM_ATTR("%llx", engines_allowed);
> +	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
>  	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
>  	PRI_CUSTOM_ATTR("%d", enable_psmi);
>  	PRI_CUSTOM_ATTR("%d", survivability_mode);
> @@ -1171,186 +1363,6 @@ void xe_configfs_check_device(struct pci_dev *pdev)
>  	config_group_put(&dev->group);
>  }
>  
> -/**
> - * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
> - * @pdev: pci device
> - *
> - * Return: survivability_mode attribute in configfs
> - */
> -bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
> -{
> -	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> -	bool mode;
> -
> -	if (!dev)
> -		return device_defaults.survivability_mode;
> -
> -	scoped_guard(mutex, &dev->lock)
> -		mode = dev->config.survivability_mode;
> -	config_group_put(&dev->group);
> -
> -	return mode;
> -}
> -
> -static u64 get_gt_types_allowed(struct pci_dev *pdev)
> -{
> -	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> -	u64 mask;
> -
> -	if (!dev)
> -		return device_defaults.gt_types_allowed;
> -
> -	scoped_guard(mutex, &dev->lock)
> -		mask = dev->config.gt_types_allowed;
> -	config_group_put(&dev->group);
> -
> -	return mask;
> -}
> -
> -/**
> - * xe_configfs_primary_gt_allowed - determine whether primary GTs are supported
> - * @pdev: pci device
> - *
> - * Return: True if primary GTs are enabled, false if they have been disabled via
> - *     configfs.
> - */
> -bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev)
> -{
> -	return get_gt_types_allowed(pdev) & BIT_ULL(XE_GT_TYPE_MAIN);
> -}
> -
> -/**
> - * xe_configfs_media_gt_allowed - determine whether media GTs are supported
> - * @pdev: pci device
> - *
> - * Return: True if the media GTs are enabled, false if they have been disabled
> - *     via configfs.
> - */
> -bool xe_configfs_media_gt_allowed(struct pci_dev *pdev)
> -{
> -	return get_gt_types_allowed(pdev) & BIT_ULL(XE_GT_TYPE_MEDIA);
> -}
> -
> -/**
> - * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
> - * @pdev: pci device
> - *
> - * Return: engine mask with allowed engines set in configfs
> - */
> -u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
> -{
> -	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> -	u64 engines_allowed;
> -
> -	if (!dev)
> -		return device_defaults.engines_allowed;
> -
> -	scoped_guard(mutex, &dev->lock)
> -		engines_allowed = dev->config.engines_allowed;
> -	config_group_put(&dev->group);
> -
> -	return engines_allowed;
> -}
> -
> -/**
> - * xe_configfs_get_psmi_enabled - get configfs enable_psmi setting
> - * @pdev: pci device
> - *
> - * Return: enable_psmi setting in configfs
> - */
> -bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
> -{
> -	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> -	bool ret;
> -
> -	if (!dev)
> -		return false;
> -
> -	scoped_guard(mutex, &dev->lock)
> -		ret = dev->config.enable_psmi;
> -	config_group_put(&dev->group);
> -
> -	return ret;
> -}
> -
> -/**
> - * xe_configfs_get_enable_multi_queue - get configfs enable_multi_queue setting
> - * @pdev: pci device
> - *
> - * Return: true if multi-queue is enabled for this device (the default),
> - * false if it has been force-disabled via configfs.
> - */
> -bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
> -{
> -	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> -	bool ret;
> -
> -	if (!dev)
> -		return true;
> -
> -	scoped_guard(mutex, &dev->lock)
> -		ret = dev->config.enable_multi_queue;
> -	config_group_put(&dev->group);
> -
> -	return ret;
> -}
> -
> -/**
> - * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
> - * @pdev: pci device
> - * @class: hw engine class
> - * @cs: pointer to the bb to use - only valid during probe
> - *
> - * Return: Number of dwords used in the mid_ctx_restore setting in configfs
> - */
> -u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> -				       enum xe_engine_class class,
> -				       const u32 **cs)
> -{
> -	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> -	u32 len;
> -
> -	if (!dev)
> -		return 0;
> -
> -	scoped_guard(mutex, &dev->lock) {
> -		if (cs)
> -			*cs = dev->config.ctx_restore_mid_bb[class].cs;
> -
> -		len = dev->config.ctx_restore_mid_bb[class].len;
> -	}
> -	config_group_put(&dev->group);
> -
> -	return len;
> -}
> -
> -/**
> - * xe_configfs_get_ctx_restore_post_bb - get configfs ctx_restore_post_bb setting
> - * @pdev: pci device
> - * @class: hw engine class
> - * @cs: pointer to the bb to use - only valid during probe
> - *
> - * Return: Number of dwords used in the post_ctx_restore setting in configfs
> - */
> -u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> -					enum xe_engine_class class,
> -					const u32 **cs)
> -{
> -	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> -	u32 len;
> -
> -	if (!dev)
> -		return 0;
> -
> -	scoped_guard(mutex, &dev->lock) {
> -		*cs = dev->config.ctx_restore_post_bb[class].cs;
> -		len = dev->config.ctx_restore_post_bb[class].len;
> -	}
> -	config_group_put(&dev->group);
> -
> -	return len;
> -}
> -
>  #ifdef CONFIG_PCI_IOV
>  /**
>   * xe_configfs_admin_only_pf() - Get PF's operational mode.
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 4fbbeafba473..bba592fb612c 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -18,18 +18,18 @@ struct pci_dev;
>  int xe_configfs_init(void);
>  void xe_configfs_exit(void);
>  void xe_configfs_check_device(struct pci_dev *pdev);
> -bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> -bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
> -bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
> -u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> -bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> -bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
>  u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>  				       enum xe_engine_class class,
>  				       const u32 **cs);
>  u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
>  					enum xe_engine_class class,
>  					const u32 **cs);
> +u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> +bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
> +bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
> +bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
> +bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> +bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>  #ifdef CONFIG_PCI_IOV
>  unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
>  bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
> @@ -38,18 +38,18 @@ bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
>  static inline int xe_configfs_init(void) { return 0; }
>  static inline void xe_configfs_exit(void) { }
>  static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
> -static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
> -static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
> -static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
> -static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> -static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> -static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
>  static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>  						     enum xe_engine_class class,
>  						     const u32 **cs) { return 0; }
>  static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
>  						      enum xe_engine_class class,
>  						      const u32 **cs) { return 0; }
> +static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> +static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
> +static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
> +static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
> +static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> +static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
>  #ifdef CONFIG_PCI_IOV
>  static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
>  {
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
