Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA2BC88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 06:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B101110E07A;
	Wed, 16 Sep 2026 06:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e7lZmtGw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7799A10E07A;
 Wed, 16 Sep 2026 06:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789540741; x=1821076741;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JsL1KHKtVIIxM49KWS9nsF13CXOaMVejd3bsOgaFPQ4=;
 b=e7lZmtGwHH9XngfYFsd9G5e7tOAbyEHxV8THHI/Sb5Tb7zDMHAdpsxxO
 B156ogNYlCQcWPsiSDZNgFqIkBtPRjAxb2JWadMAW3728eDFJoNHzGn4N
 hV6hBiVGk1qqRtaZlno8quOlPuiqUiTDlBGHPhoJMDHMVy7XH2y7/HZXE
 gy2pgq8RsY5M3CQXAjVxiUhMeO79z8M+6V3bCAmHJKc71PzXFKHhVEp0K
 BqlmvSRdjGl7ZPpRGTc4oBiEoE7nGtBctXOywQaEe8GlEsMnKt3eNO/F1
 eaPqvTvEmu6g43ydlaLSMXIDjmGllMJTskt2iBZL2p3SUtUV5nd3K8+Ls A==;
X-CSE-ConnectionGUID: LIiLZUZTRqu4pky7kRHYhw==
X-CSE-MsgGUID: FRwXBLt9TqaLmZhoRNAl+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107421618"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107421618"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 23:39:01 -0700
X-CSE-ConnectionGUID: nvaumzIqSFWUOOpkTqQIYA==
X-CSE-MsgGUID: KWChYz/YSDGgdoPWSqJkwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="276997076"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 23:39:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 23:39:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 23:39:00 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 23:38:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLW5QwD1Bhna8jsv7ZJp7ZbtkTEdI8bxuPDT7QXTY267GzdQDReuCf6/7OAZlqqRuyFmhPFJYgbVhtc8n+QTkMem2BKkPP+JQG/vhHyBMoygj1fWyry7/LtLR/SpsftZydETzONyggktSQJFAUNOX8JDjmvkZjl8jc1pAxCRnF9ydIhSCWPZJd7e26h78A5nI5Nvd418Xue03VZTHkktCqTwQPXm8Htl853Rh9XZdV6BOg78VAiGMQJABRma3kenoM25MeAwTM2ZmoJA7jdbrNPBefrL6CANAXnpf13ogYW5m1FC+gWEblNzYIbjUB1BRX0oNSqEpnrrIVltMP5ljQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0L9e6+qiWrT9iBZQIdGIWS8GRoICHOT1xIVD3EyW/8Q=;
 b=tL7ptHkthEpA8wQetAtmXgea9oGpkPyIW0KHBokhfSRlbLq2GiSULbVt9Xchbc4BUi7PkPR2HEEEyEJFkc9Fghu2ModMdCoaCi1+4Y2EDHBNhr3Vt7eqSV0FXZ+fHVcMKMgl28ZxUlh32jG16vslGPd+UAGZ66BRNsRVt20RUtkg0oKvAxHdxvsltrwe/lRyhcwjqB8OBFGt8uoBe9x9bYO3KBzURgsxE3K2CdxhA9Nkc3gYNqLZcZDTGDsebkEw4lSScvSyufL/Yd76+wj4FfNTlNQEz0PDuVb5WX08DKwUTZ14DNoQX4nJMqPISJ1jk6yJ0pzPqyVpm4RUwKtqSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by SJ5PPF8DE294191.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::843) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 06:38:56 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 06:38:56 +0000
Message-ID: <9a68d276-a762-4b2a-8f5f-6f8371267876@intel.com>
Date: Wed, 16 Sep 2026 12:08:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/display: Add command line param for DC balance
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20260915040015.2451786-1-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260915040015.2451786-1-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::14) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|SJ5PPF8DE294191:EE_
X-MS-Office365-Filtering-Correlation-Id: 10ed50fb-dc9f-4659-1b82-08df13bd2e8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: Qn38w99zYIKRTxIk9SwLGeHXrHbkaaYEHRSAq0muA6JzyX72OvE/Nzp5MB4pSrKiMNnMO0QvcY+l1x+1jq5NcGPjUKshpDVu1+5h0lR8tVT1kNe5Ct45+bwpTw8kDxK+KT4IeepLnV2HvJ8e3cJo0jPvR3OF9amoo9elXA8co0u01VGCqnIQJLodtSB1CUu+XDQj966WdLCT/FkGHtM8QLt/7gBoCwH96bP46+x47FzYVQypmc6yi0j3sYphVrYFcNR1cN5PYZvZe8vGBP2+orwgo/Xz3GxmkAuNJrhW6U6wbuKUkXT+9tjGGriufTKA1qIgwvEYmJ63/Q2JSoUA69qGkSEl4UnuK6bhmVdYIonaaw9+NbhRKgGCnjBeZ7qrt2QX5TCqRnzPE3rGN9+WX4yObszm7V8MBsCoMRJ1N/WCCNRbcIRIamdaUMNzNL/IXRYinGlVGw3pmXPd4+wNUPviAj3Ed5PWE36w54qbefRc9Ei4TQtxL6+tMEnfZO58yageYUhRKtr+Wf8FjTQSEYBbwinjZVzYJlid7DyI5jp+Z8ivJmTURdt/XIeoCNplhfmLfUgf/CSVIbuvtEYYw9QoT37d0R9s7gQ6vczypR8HBhOQWmzewJKfg88Trz6Va8PU++kxVODbhr0UBYNY0v9RGSAK3Z+Qtr9rsEy0kaA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2lKL29NZ3ZienRwMEhTVzdIeVJkWXRQcXNpSFRHS0NiV08xcGpQYmVDWVF0?=
 =?utf-8?B?VnVsYjZ3ZkNiQVFiMjJKYWFJU291SUlhMVhzNHhUTUR5dWU1WDRGVmtqa0d3?=
 =?utf-8?B?Y0lVTE5vN2ptODhKcEVLUFFac3hSZURLMnh6bXlKTWljaXM0MXhkaDk1WWs0?=
 =?utf-8?B?alAvRFNVSkMyWis1WjdDa1J0TkdrMjhZa0JCeVNPM2pIMm5kWUN4cnc3c283?=
 =?utf-8?B?cGZGY1RNcHBuOGtrMjgzMEc0ZS9NeDdpOFQ1SVdEOVB1L1c5YVdLNkxzcGFw?=
 =?utf-8?B?TVpHdVlqb1BvbnpkZDZXbkJxUGtneEM3WFFrNmxKdVE1UUhnVzhvbkNYc3Fr?=
 =?utf-8?B?TjczZ3BHZGJqekIzYWJ0YlVIR3FVUXdlRWRYWStBcUlyNm1MYmpvUXpxT0Rq?=
 =?utf-8?B?d0xUd3Nzb0c1S0UzN0loS3NxRG4vSTRrRThGbHlsTlA0NW43Y1dKUllqdVBP?=
 =?utf-8?B?ZndKbGdTV3ZOQ1NESUFtL2dKUDkwYURHcGVsMlR4YkR1VjNiL2VzbXdCYVU1?=
 =?utf-8?B?VjJHS1cyMVhQRmpaaTJBc2c0WUZucW8xOE5WWUJZd2dWWTFtZ2hoZUNZbFg3?=
 =?utf-8?B?bVRSQVEzWDhXeFFKU3ZZTzMyQkVBa1hUNmJCcSt0TEoyYkwydWhUeGZyRmZR?=
 =?utf-8?B?ZjZTampIdS9BalJnMmtzTGFRcHdLVnB3cGRwN25tSzlJaWg4M1BGaHA3SXVG?=
 =?utf-8?B?RWJCWVhHUXdnY1IreXoxcnBEV3JnVXJZRmtYZUNzalhoNENIcCtQMmJZcWln?=
 =?utf-8?B?b1pJSTVaUW9YdkJoSTBod2hqbTh4V3pLU1FkMEVUNlZoZFpFSzV0dE5oeHAr?=
 =?utf-8?B?KysrclFDZ3NDa2o2YUVvR2pjb1NKdjRUMnZWZDFEcjV2emphRGZ2U1YvbklK?=
 =?utf-8?B?ZXpGM24xekd1cUZtbEw4NGNNQkNaRHk0RG9ZeXNOYks2SEFlN0lIS0lFS2hz?=
 =?utf-8?B?ZHBjdlNEa3cxSEEwSk5xMDdqZGhsM3J2c3ZMNVNwRkNDcTZlZzB6bUVTZzBn?=
 =?utf-8?B?WTd3TWNBWkxNcGdkTHQxd2xxZmFMMVNjSVoyb29NK096MmlzR3lEeHVOVlh4?=
 =?utf-8?B?bWdSL2xNZ3hxcjlNSit0aDFQN1BpNC9mZFRvcmNCYmI1b0kxMGxCOEJCeFdL?=
 =?utf-8?B?SkFFY0hUaloxa0NxY2dRNnJFc0t2bEs2L2xyM1lPbFI0dlhLNll6QmpwUDNY?=
 =?utf-8?B?ZzBlYTZTRSs3QjlGV043MGVVSFRxY2hPSFR5NlVLVjlvVzg3SmVOblNYeEIw?=
 =?utf-8?B?MGxFL3d2ZW9hbmIrRGJtSlMyTWx4Z3ZHcHZkdkxWQk9JVXRQeERjYURwN01X?=
 =?utf-8?B?eVRCaE41dS82S1lWSXBMMm9JMWhrRmh1VVFuR0dwY0ZpcDN4dnF2WWZ1Tzg3?=
 =?utf-8?B?OGxlZTBJWU5xNGltRkVmVFY1cFVEaEN2elpQWTJyTUluRnZRVWFNTWg4L3ZN?=
 =?utf-8?B?RzlOdStXSWtRQ1VPODVweDljcVp0dm5laE5LUjhzTExhY213OU9sVUFsTjg2?=
 =?utf-8?B?d0NLbmZLT0l4OWxoNGE1K3hua1crRUhEc0wxOEFRakFBMVR5NXNMdXZxRFhq?=
 =?utf-8?B?SUxpeGZya2xnVVJSZk50Q1hDcDhybktNOHQ0MjFjMTVhVmtnbGtMQnhPSTc3?=
 =?utf-8?B?ZURxUnhybm9Wd0FmdXFoUlVzdmRLWHBwa3l4U1M5Qmp0ZC9NRWZjeFk0aWcr?=
 =?utf-8?B?VVh0b2xTSTIxU1dMd09veUNFM25FVFZyajBFOHZ4REowZU9MZTd1TUZCTlFR?=
 =?utf-8?B?THViTTRnR0ZlTXpIMElCVGppUXk3UG5sMHRJNFlxNVFxTHAyUlY1WTJTVEVx?=
 =?utf-8?B?ZGk3S3BMUzdlUU53aS9WZ2JTRHVPV0ptUllrQnNjRG41YmZFY2JXS0F0Y09E?=
 =?utf-8?B?RlJ0WWRGZFRaQnp1ODh5a3BTVTQxa1hPMWdRZklWTTdwZkM4b2YwMGIvRGN5?=
 =?utf-8?B?b0hXTXNlZFRQY3dmaE8rZ2xVZ3VWQURjRS9PNzlod3k1MnlGcU1RU1p6YUtk?=
 =?utf-8?B?a3RiYnU5Z3VuZUxBaDZSZTlUbTFNdFEvM0lxcGJwRGN6U29mM08rNE9VZmZh?=
 =?utf-8?B?RzVXWHFvelVDNlBSU1lueE41TmMzVDVadjh5L1kyc05ycVdFNk5NdHVTenMr?=
 =?utf-8?B?aXFCajlld1N3bStwU2grYWFiblYyN3VLOFdXUVN6Q2dUVU95eERwdWhCbGk3?=
 =?utf-8?B?MkJWdVFzdUZyTHQzQmJKUU92U3NPbDBXVTBrWkdwWm51dERpNlNrVW1uZTZn?=
 =?utf-8?B?bVRRekt1aDJ2ZUZKSTk3OU1WMGRHaFh0dW1kMGFLbnBTS05YZnNMWFRCblBn?=
 =?utf-8?B?UzNUWUtvSEtHQisvMUZNYVNBMEcwcWZLZXNsSGR0Y3Rab3kwVFg3Q0dYYTJj?=
 =?utf-8?Q?EXSFw4I+OxoH9KDg=3D?=
X-Exchange-RoutingPolicyChecked: kMLoBqjhJ2X7vKfXjgJ5IRMGGypwDGYfor2/hVZf9vFvcQFW/mRRDbAJdqFEhfWVEvSozAZYaUJM2E5K+Dw+H9btr8/fBp+jjP/LP8gzM0REYX+aBDDh5USbuXZgqASg1RAPt389Yw+Yl7geUftgDmACMkSd1njfR7TuKrFLnMsdk5yLtKrgkeZ4tlD0EKDkftyEcxeFLKvlBE+MNy+RWKV5NO/oQfsobTQL+GIfk5UHvVuTtCRyiX6TYKAr42+xcfaS/AARemgt6ZvZhatQi5jMnL6780yf08CsUnMZQueqLo30HvcTwmRHqLMFCrgoj0LP6qq1SEDHEpShYWwj0w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ed50fb-dc9f-4659-1b82-08df13bd2e8d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 06:38:56.1281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vZnPAp3zaCatPN1Zf/Ts823oxF9XvvXS+so7SaWuET60LHJk0cVKcD7nac9KunVvhgGmPtct8DLkvxhEtltcRm/h5L610TAaMFvoJYty9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8DE294191
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


On 9/15/2026 9:30 AM, Mitul Golani wrote:
> Add an 'enable_dc_balance' display module parameter, disabled by
> default, so the feature can be explicitly opted in at driver

`the feature` is not clear. DC balance should be mentioned here.


> initialization on configurations where it is known to be beneficial,
> while preserving existing behaviour everywhere else.
> intel_vrr_dc_balance_compute_config() honours the parameter, so no
> recompilation is needed to try the feature.
>
> --v2:
> - Make enable_dc_balance a bool and keep it disabled by default; fix the
>    parameter type/value mismatch and correct the description (Chaitanya
>    Kumar Borah, Jani Nikula)
> - Explain in the commit message why the feature is gated and why a
>    module parameter is used (Jani Nikula)
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display_params.c | 4 ++++
>   drivers/gpu/drm/i915/display/intel_display_params.h | 1 +
>   drivers/gpu/drm/i915/display/intel_vrr.c            | 4 +++-
>   3 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
> index 2aed110c5b090..ca0ef466bb103 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.c
> @@ -120,6 +120,10 @@ intel_display_param_named_unsafe(enable_psr, int, 0400,
>   	"(0=disabled, 1=enable up to PSR1, 2=enable up to PSR2) "
>   	"Default: -1 (use per-chip default)");
>   
> +intel_display_param_named_unsafe(enable_dc_balance, bool, 0400,
> +	"Enable VRR DC balance (0=disabled, 1=enabled). "
> +	"Default: 0 (disabled)");
> +
>   intel_display_param_named_unsafe(enable_panel_replay, int, 0400,
>   	"Enable Panel Replay (0=disabled, 1=enabled). Default: -1 (use per-chip default)");
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
> index ba01aeaf89440..5c5a1a1358c32 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> @@ -46,6 +46,7 @@ struct drm_printer;
>   	param(bool, enable_dp_mst, true, 0600) \
>   	param(int, enable_fbc, -1, 0600) \
>   	param(int, enable_psr, -1, 0600) \
> +	param(bool, enable_dc_balance, false, 0600) \
>   	param(int, enable_panel_replay, -1, 0600) \
>   	param(bool, psr_safest_params, false, 0400) \
>   	param(bool, enable_psr2_sel_fetch, true, 0400) \
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index e36db11744405..1698c54e258b4 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -439,10 +439,12 @@ static bool intel_vrr_dc_balance_possible(const struct intel_crtc_state *crtc_st
>   static void
>   intel_vrr_dc_balance_compute_config(struct intel_crtc_state *crtc_state)
>   {
> +	struct intel_display *display = to_intel_display(crtc_state);
>   	int guardband_usec, adjustment_usec;
>   	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
>   
> -	if (!intel_vrr_dc_balance_possible(crtc_state) || !crtc_state->vrr.enable)
> +	if (!intel_vrr_dc_balance_possible(crtc_state) ||
> +	    !crtc_state->vrr.enable || !display->params.enable_dc_balance)

I was thinking if we should put the `!display->params.enable_dc_balance` 
check inside the intel_vrr_dc_balance_possible().

But then, that will change the semantics of the helper and also will 
avoid the readback, so this looks ok as is.

With the nit pick in commit message addressed:

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

>   		return;
>   
>   	crtc_state->vrr.dc_balance.vmax = crtc_state->vrr.vmax;
