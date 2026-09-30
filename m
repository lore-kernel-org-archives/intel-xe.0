Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3BCC9830E
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 06:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A608F10F1DE;
	Wed, 30 Sep 2026 06:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QdGthBPd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EA210F1DE
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 06:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790750904; x=1822286904;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PM6Wh2pFkNIGsorZdqIPKYGMlb2eK5bKCCskPqj6Id8=;
 b=QdGthBPdomGv3AXRNBowaPX6TseB8EPjr6Mm4pR2no8EQC3A7ORKmObg
 LHB1BTALFsvteYAiOHKocdqGoWhrAcVWFQVuZ5iXlGtLb03LJPm9CLr3c
 QVPueVo8+IAo89EoSI3fAsxkMJcMHoVPKFJPQUlmos1FrUdcD7vt/YxuX
 YpYpOCHVpHGXO+kxADD/ecfIzN3YdLJWuo5V4VN0A2zLKyxEIH1DBU8mG
 ufqRYDARWWm6TIkkSwmxqO1UW45pc2auFJT/lLV9EF37DbbJbsEX6k1CU
 6IDeNvn5+sXdmmhEyt4bsYIDyGCOtFnr/fg2boATY3kaEsvAypFrz9UJ9 Q==;
X-CSE-ConnectionGUID: L2AN1fJwR4OXs3Gks5TREw==
X-CSE-MsgGUID: TI4rhXCUTlmroRb3ou5eAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102006356"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="102006356"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 23:48:24 -0700
X-CSE-ConnectionGUID: +prhK9RRSdGtW993kQHLDg==
X-CSE-MsgGUID: ijnb0zxbQLaHHCh5J5kGww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="274717058"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 23:48:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 23:48:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 23:48:23 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 23:48:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FH71eNy7YI+ZN+X++HzLOqFLXDjmFn3D/Ex/quQg/bs4RoKSvMX1VzKZyceVCalruXcukV5WZ9AVTyUdkJN4aWmOLH/Xr/5Vc6vnAzlIjN8FVLaqsoHFlpdxh+Sm4ycjbcScf1yPZbYDH/qz6Wh8kHI1nIyxoKmjjs90swg38FMWsKRXocHLzR98kydPAey4eG0ImFiFCkcDGYM3czddRvGwrR8guImqIh2KP7aVeVRsGrhg2qsmH75J2E2iZxSjKFaTfPrEqFo6YrWUZAXd/UO7VMIMTlgIAUPyBlxRp88X9GUQVFtHhWxIhttDPn6sVEpHn9yOQb5B0UnI08PuNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6I/+bYer6b3jpIGCr4f6eCWf9TbTk5L+7tLpaRTEPsM=;
 b=EMVLHWUtfu5mQoryiQu0jN+tjuw5KC0s6Jb1VGA0wxwu5A0IL2YbtdSmXNA+r1jq8uodeU1uQlfxKbU22bHwffgeWlJLmRTSbJ4TWRbYL5/mkJ+Gi9Kn0j1FO0HxSqlOIY8TYp2bB9T8nm/X6YrBF7q9sCCQKbAb14mbVsYHu/923VIYqFuaRvbOaD2+zVPVVuVk2SMHTMtm6qudxjf0flrEq+KUzUjKrMOQnUvJblfHxLlT8s/r20udqx+W9i+gmwMa3rWm4nPSBR2YWm5H8bk46QwisIGMmCUlN45LEDyyY28CjflFQnSstpaGSDOAjQmTfH655i95/F9g8+euGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DSWPR11MB9931.namprd11.prod.outlook.com (2603:10b6:8:3a4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Wed, 30 Sep
 2026 06:48:16 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0451.014; Wed, 30 Sep 2026
 06:48:15 +0000
Message-ID: <1d249b0f-5d0d-491c-aa34-20b8fa63d886@intel.com>
Date: Wed, 30 Sep 2026 12:18:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] drm/xe/vram: Report VRAM errors using structured
 xe_log API
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
 <20260928092114.1610203-13-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260928092114.1610203-13-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0245.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::7) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DSWPR11MB9931:EE_
X-MS-Office365-Filtering-Correlation-Id: f3602d13-e22d-422c-8c8d-08df1ebecdd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|5023799004|11063799006|18002099003|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: e7Q7TS1vmtpO5Hc7AfqmUUqrXGSlKZnT0roaDHfRG76jrLYJ9joThzh8sYzKiiInwXK2+jNfOM7fD0tiRa9gCAKYkSPQnlULhRCl7lN8B6h5Zz8ESOAkl1xOkL2OS7fMkm6JKKIMe1u2MvMnhZeEN3lyWg6weaE8GVkoB9pSZA8/pTvlXVGrN5aflKnvF6O+fq6FFCbBnZuXYkLMT9pT+hdXo+yMnlOAgV31HCM6/wireb4h1E7BRkpH1WbpviFRtQ/lEyzshAbkqh7qgagZQoV/3h9LAN4kWCzTJWJJJQZtw+1u57z3fPrDu71B35zYAd20LcbzoOBFoQCYjr5Db7aiNUh2BINX9gWa5sysHtbs+KwFgBqEoq/IUpcsGjMsCwWE/MHhoU1d9bGYCQRVLjqCSR/GUL2z2h8G/AwT9HB/zrEWHtxPed+zfxfzyxiKxdBCtWV2mAIGZe/sIaAjihL5r31SVgomF0OeCJUWt0xeVgDtGtSilSyCqVhpGRvu8fBrJUL9vPnOxMXU5PQqCqHKicJ82i/+tn2gWyIwokYuqfVhIwYv+iNBtgaz7/hnfIxGRMZFjPjhzPYxGIIeYzYZYVef5by4arEHFyiZwx3CA6EgRaeEmdil6PQd391s4yePonPx9/N1uRxJ1t/iGB7Jbti/nufdJSs/CKjDebM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(5023799004)(11063799006)(18002099003)(22082099003)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEpQQUJOVWtTODJuL0pnSlRTQUxwZHplRG1iV2oyZ0J2bTl6QXJ2K3h6c2tQ?=
 =?utf-8?B?R05UbURyL2VyOEdPQ01lbGc0OEticWtrZGdXbHhFUjJOOGFLY2NFTjRnY2h3?=
 =?utf-8?B?cEw4OVpJR3ZqVHRvMEs5RVZaU3FWQjE1YjdSeDgwdHFKRnhTVXVqVnVVV2dT?=
 =?utf-8?B?WFp3bnZjZFRZM2tqUHd2Um5sQzgycjJuMENBRkdmTW01RHVSSldLWUxSM1NQ?=
 =?utf-8?B?dDFheGgvZjRrR0RXQTBBbzJtb1o3TGlkditMRDBJUVFJYU1iS2ZmaHNyclZl?=
 =?utf-8?B?VjYwYzhrS3VLOG9YWm5yN0R5aWZZeHNiNHJYdTdjMFJubnFxYVQwbWdiVFEx?=
 =?utf-8?B?ZnhGSEVVTlJ2N2IvVlRpTCtzOFhTeFpYbndzRlMwbDR5Rm92UENKRFR4eDlY?=
 =?utf-8?B?OUV1b0hLczJsZ0JZaFJNZ1AyVGlIa0F1N3VyRUkxWnNLZnFScHB2V1VUVDhL?=
 =?utf-8?B?MXRMVVJKNk13Z2JzbDFqMnExUEwzRDFSV1NwczQwZWNsYlZRNm1UbVZXYXBS?=
 =?utf-8?B?Rm5WdXdVWmgvSkxUb3U2a08yc2h2YThWQUZ6V2FSM0tNVlNrWmJOc0hRWUU1?=
 =?utf-8?B?a0haUkxoM292bml5ekdsenhvWVcxVFBwamVoWUU2TUN6Y0RLS0UzL1JpL2lM?=
 =?utf-8?B?bExtSlc3VnE1RzdVOXBnQnluZDlrTXpKOWJmSmVZRjFYRDJVWGt6dHdzLzhI?=
 =?utf-8?B?ck5BbXVrZTAzZi8zUEpQbXVDNThGTVFwcERSSkR0L2IxYWN5Q0h6UjQ3UVdv?=
 =?utf-8?B?WVhlZGoxalUzdVlFaE5aMjFWWHltNlVIY24xNFNOa2MrSUdpd3dkdk0wZkND?=
 =?utf-8?B?bWhuQXpXK0djU0FWL01KVVg0WmdCMVNpSGxDMi9xVFk5ZWQ2MjJESklnb3BO?=
 =?utf-8?B?QXhvUUdmK25CNERqck9rOEFMcjE2am1GV2l5Y3J5QnA5S05HOCszdWpJbGxN?=
 =?utf-8?B?QkF2K3dhcHZsZFBLOUU0VUJiMVExZCt0K2FXVU53VmVUeWt0QW42akVkY3Bx?=
 =?utf-8?B?RmZFYUZVNUhTTFl1YjFYaEhKZzBKUVExWDlyMkpYbmkzSXoyQ2xkY09SVDl1?=
 =?utf-8?B?OGgxOWNzVGJyL250MFFVbktuTkhZQUlMQnJZcTF0Qkd2dyt4N01IOUVGakNw?=
 =?utf-8?B?eVRXc1dKbnZnL2hTeHdqUjNQc0thRHc1a3JnVS9GMjVMbHltaGpseE9kczBP?=
 =?utf-8?B?UHlNejhISDN5ejVlKzFXREVxTmV2NGt6TmJjajhURXFhK2c1Unhycy9nekFz?=
 =?utf-8?B?NlpkeUl6bUg3Z0l4RmtSSHZxM3FlV1pjd2JFWDJCWFozaE9mSzMvZ01VVENm?=
 =?utf-8?B?ZFNvWXUwU0FaNWVWR3hEeERoZ3R6UEZFN2FBQThJWWVlZ1h2ZHA3L29NbEF6?=
 =?utf-8?B?bGVwTWE3UXQzSHdUekZsNVNJZElKWk41L0llZHdFdHZCMVhpbTdHR2czSnla?=
 =?utf-8?B?cnREbXM2T0hOUnFkNzFaYk5VTFUyZllGdWZqYnRwV2pGZFBrbDI3M2JRQnhz?=
 =?utf-8?B?dkxPcTFBbnFzaGJGdDFrbXBMSHg0WHBBWHJIQ1kwVVNwM0NjYnozOGdjbS9J?=
 =?utf-8?B?NEc1dkhHVTBYVVJUaGVsbVpQbnRzdzdibU9GSm5HZ2JhdHhpUG00NEtUbHUz?=
 =?utf-8?B?cFBxb29GT0wveERzMlpRYUNLRjU2WVZKWFdtYWFVWGx6TEM2alVna0lYamNS?=
 =?utf-8?B?QTh1TnRLMWVpaTlrcFNoRlArbHJHNFhoSk9qY3lXL0UreFZaT1RTQ1RmQ2lx?=
 =?utf-8?B?TmVuSm1KMHNSUHRpaVd2UGdvNGlaZGxEc2NjWTF2TTR2cVZSNk5ONFZRakJC?=
 =?utf-8?B?YXFISUc4a083aG9BYnNHMks4am5SNlNDVzZLOHZwc2JyU2k4bjZDTjRxTElz?=
 =?utf-8?B?cHA2TWprVmJzRFAyOFdtRHZMUFlnaWVNQjVXQ2FBMktCRk43aXFKWVlTTW5i?=
 =?utf-8?B?OEEvMkxOTzNMZFkrMWJ2bExEZ3VHK3lyK1hPbVdEaWcweXliZm4xMHl2ZXN4?=
 =?utf-8?B?TFpPYlNlVGg2SEtTT2UwK3phaUxGM2xVb0ZZRjR0dGFSZDlPT0R2OXRBOW1H?=
 =?utf-8?B?dTd2aVJHcWtSMTZiTTJtQStlRlVJME0zQzlmQ2JleWcxemVaT2s0VGM4N3Jh?=
 =?utf-8?B?eWhuQ21xMG9BTmZndlNQdndoejBHR2VhQW85OWhUcTkxVmdwTjg5SFByWTJV?=
 =?utf-8?B?SWF1d1VhcGVSeVBTaStyTmoxQi85YmdFTitpRVY0cTFCQmxncXJmb1g0SW1Y?=
 =?utf-8?B?OXdnUUhJL0toNndoS09iTm91NE5VMnhPWGdadUUrYWlvYVc5Q24vMDBLTkNa?=
 =?utf-8?B?bHZBTWNXaE1SeHFGRkJCaHZqZnlVdVV5OFFTKzk3M3AzeCtua2NjbWJtbTl0?=
 =?utf-8?Q?xMgwcO8JvEJrkptM=3D?=
X-Exchange-RoutingPolicyChecked: Xml5iOTSrzDkyGk3EUXNRbvD2Y8EfHSb8HlngIpR3woL3gq9tipiG8YXmiAxTw0VES2vGqD8wG7HMRltKTpew9RfAaVnhUxyRT81+tnV79nhpNqM24CWUbszUth4bWINOPawKeTXdWnaKBCsyYyu9U84a5dX9p2AxJVQxJs2OtgrTuQWRVpVytRkxbI/+NB1Yq3cwAsr7NYtSa1g/IY9ZSgn1kKMJmg8fFwml1JeJl1Xi+J4Fg/EzkjlM1FH1A/HaSQACLYt3hWhPsyGNsUJRMDyAGRCAvWyKsqhJEEjd77vUHrzirdd8OkZIW9UmuIEX3vZfdwRNQxZbXB4YD5+FQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f3602d13-e22d-422c-8c8d-08df1ebecdd3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 06:48:15.7043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ac3XzH9DgOIg1fFh3Hd6rDibyC/FI+xOP8zYgYXmSxP32yOIQ31mxvA8/Yx1yiFur8+69S7epBjE+GTSJbap/2Czx9jtNbmluaNJywlcFgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9931
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


On 28-09-2026 02:51 pm, Dnyaneshwar Bhadane wrote:
> Replace drm_err()/drm_info() with xe_log_err_fatal()/xe_log_info()
> using the VRAM component tag. The "no CPU visible VRAM" error uses
> tile or device as the log location depending on the caller context.
>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vram.c | 20 ++++++++++++++------
>   1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index fa06c7ae56b1..6c8558042ad4 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -17,6 +17,7 @@
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt_mcr.h"
> +#include "xe_log.h"
>   #include "xe_map.h"
>   #include "xe_migrate.h"
>   #include "xe_mmio.h"
> @@ -46,7 +47,8 @@ static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   
>   	if (!resource_is_valid(pdev, LMEM_BAR)) {
> -		drm_err(&xe->drm, "pci resource is not valid\n");
> +		xe_log_err_fatal(xe, VRAM, -ENXIO,
> +				 "pci resource is not valid\n");
Message should start with small or capital letter, make it consistency 
across all logs.
>   		return -ENXIO;
>   	}
>   
> @@ -254,8 +256,13 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
>   	vram->io_size = min_t(u64, usable_size, remain_io_size);
>   
>   	if (!vram->io_size) {
> -		drm_err(&xe->drm, "%s without any CPU visible VRAM. Aborting.\n",
> -			tile ? "Tile" : "Device");
> +		if (tile) {
> +			xe_log_err_fatal(tile, VRAM, -ENODEV,
> +					 "Tile without any CPU visible VRAM. Aborting.\n");
> +		} else {
> +			xe_log_err_fatal(xe, VRAM, -ENODEV,
> +					 "Device without any CPU visible VRAM. Aborting.\n");
> +		}
hmm, we can change it like:

xe_log_err_fatal(tile ? tile : xe, VRAM, -ENODEV, "%s without any CPU visible VRAM. Aborting.\n",
		 tile ? "Tile" : "Device");

right?

>   		return -ENODEV;
>   	}
>   
> @@ -320,7 +327,7 @@ int xe_vram_probe(struct xe_device *xe)
>   	err = determine_lmem_bar_size(xe, &lmem_bar);
>   	if (err)
>   		return err;
> -	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
> +	xe_log_info(xe, VRAM, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
>   
>   	remain_io_size = lmem_bar.io_size;
>   
> @@ -342,8 +349,9 @@ int xe_vram_probe(struct xe_device *xe)
>   			return err;
>   
>   		if (total_size > lmem_bar.io_size) {
> -			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
> -				 &total_size, &lmem_bar.io_size);
> +			xe_log_info(xe, VRAM,
> +				    "Total size %pa is larger than resource %pa\n",
> +				    &total_size, &lmem_bar.io_size);
>   		}
>   
>   		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);
