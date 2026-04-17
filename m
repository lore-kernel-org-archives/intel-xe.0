Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F59F436BD
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 16:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1547F10EA8D;
	Fri, 17 Apr 2026 16:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ri4L25hE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FFB10EA81
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 16:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776444075; x=1807980075;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KxGAp1Xga8uylc6+2HV5gRTVdiORxjB9MlwlIBU2f5Q=;
 b=Ri4L25hE7+J6wjiAVcrf5ek+Ktl0UyIV6HYwO7VOQumBBMjAUdTtN6wR
 h1bBQ0PVbtOl2+gZCvZkGeMivfiRuVTqnAIxOwbWWYrO0q15xPAMioFo5
 uCLS/QePhsP81R/0H0p/VsaeZHFB9k7KcJ5VPS/yqxtecVhJu0osT3pAC
 3n7ixgBCpfNUGnVfqcA1k3/itgvF+Zerrg1AVUn6g18i0Nd/x0QWTmh0z
 nr4fsFpW4KtQNKgzqdEg8HozzG+ZVcwoZ56tSzCJX+sv2TGuFDxccnZcY
 o9ZuRtIlzFs4X+zzgXzwA66wcvC6y00Q0hn5Kkr/7O75AKMS3i/t58tG/ A==;
X-CSE-ConnectionGUID: GRmf3VR6RRCdGHxKFqsZFw==
X-CSE-MsgGUID: ffFCkibHQOy2wIghvNO55A==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="102922893"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="102922893"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 09:41:15 -0700
X-CSE-ConnectionGUID: 35KSQuxGQECYp0XE7brGJA==
X-CSE-MsgGUID: Oj4bIQN1RUqjOeK6TBAX8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="230226424"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 09:41:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 09:41:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 17 Apr 2026 09:41:14 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 09:41:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkRzIVG3QCc/p7A/eCWK5BgZbGFj25SaFqrRhcqgFq6dllDNY8XOSrfHbkKMmkwvMHhf5gePSCjEKzx9ZrgAnykFxjCVTQ5mNqaR8pNpaevk/wZwAp1K1j9Q5yGO2vP3pX+hX1NnIq5NdxurrQtqPIq3+yAKbnt4dwM56/6jdIq1/9VSU60mNVtHN0XG9eH8S8VoShU82tdU66fKH3uEHQkIx7TvY+LqYolS3icWRizYHTI7uL8VIkVHpcaIqNpZbgru6hxF/lSpSzmugLtxbHuLZhPA34EB7Dv6XJX7sb1pcRI3drxnsq4Ue97wbm+uaNw6RRBcXPfJaQWDkHzXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfHkPjHqLX4wCPymn2cEfMLlFJ10VIA9XOSzM2QaMLI=;
 b=QYQeYKrrKGyZA4VxRBt3ttckhXX25CVV33m0TUOZ84YuhyZSKd3Y2lUayccjZozYAupDYk71d5kN9/iqeMBCGkDPMJOfeVdqK0f01aOL9VXBdEVDkknjwzDE5HhXvojWFbot4eIPZaNTtKARIsnM3OsQBAPsWG5blNVugoErGkfmQQNG0J8Qu1jEjjVBlUGgpktMbZfOl5HRHJ6ZLHES7PzNlR/GxwhDtXiaBk9fmOSsIjJrFBcaDOrQrjFurX2MTl0RD20disfLcjWqOiGwU6Fy66+8nA+7BwC9jxlMmCBn6Pajp2S7TRKt9TRk2EezC1baE7HAY+5Lj8GRSyOIEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA0PR11MB4685.namprd11.prod.outlook.com (2603:10b6:806:9e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 16:41:10 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 16:41:10 +0000
Message-ID: <9d814691-be04-4177-b7c5-a0179ae334d8@intel.com>
Date: Fri, 17 Apr 2026 09:41:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/gsc: Fix BO leak on error in
 query_compatibility_version()
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260417163308.3416147-1-shuicheng.lin@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260417163308.3416147-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0193.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::18) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA0PR11MB4685:EE_
X-MS-Office365-Filtering-Correlation-Id: c05487af-8edc-4fd2-d545-08de9ca020ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: NaWfjgWM/Nf34EjI3tYxw+NYtHtUExcjS/PLu32xYhplC/3uUlHY/2B7sUgLsCj/4ih+rQ0XJfpJeqxam/LoJlgnHqO0UAr8Ne/5X5owtkZ1ZMJ3kmqlkxaRb8UGSkKQfDWJFe0ctYG9uiY96nnI+k+akI65FayRW++UFZt6kBEHqKrJn93YygkAXaWUCxUqNQGrDbBR01kxXk+1PT3kEpU/LvozBAefRyWbEcGn0BROnI/0YgQoNhFsTAJVDvqq/dcyFJzfRbn0VpLOBVGYOFwDLKa/1YBYsXWY2Eyckb71eAb6IXkoNgWX5+LCxH7+IOAnunge7c0hAjRdFiBRdjcJgpR8/a9MM/UvMHOlR9xE3G6SrAXOGziCMw4vbtAqvsbZ5TKtat8/IPOwPHlfZQMJN+QAvwjFRF9hBbpmhNkz7GehcJfg66cj8o0ewNo0P8C1eL50LjqOxVe+GS7Z8jT2F31kVifa+g2cpB1mYweNgZuZ93z+Oj1TwsNJ2gyB1mwyDWyT4DbUJhDYFe2zSf8X+IVMvyqQ1SE3xa931ib+jQJCcYvBa/KOzVpLNXSKkw9DF+fmwbHbsESFm9febtSYNbsMm5XTluOtOxhuCQ0cCw1be4L+gX54raTbQzm6LpBNC8YzhuxTLujORPgHqccqaa0vFAdCNN7xVYjQLble3Ls6iaETVKGFl8TWlT2O9NSDnVgnlqbVjNUZReRbIvfgYJQ4m/uig9nAcIriINE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dktGRHRMV2NCTXMvMnJ6YjVJTTJZZlFKMHNsNGpPclJYWHhwYS9iczY5eGUy?=
 =?utf-8?B?UGR2aUtvQU5rQk8wRDNEWjA5ZkdKMlBHVzJTUW02MlNKVnV4NnhZdUIvdTRU?=
 =?utf-8?B?bTVGRzdjdm5peC9GT3U1OTYrSVRrMjdqYzM3NGpuekFKczJCOHNjdkNjRmdH?=
 =?utf-8?B?WXNocE43YWRHQXkzaGlFM2dadWVpc0RtQ1M4cVMvV3RLU0ttZDd2d24xeXRl?=
 =?utf-8?B?a2hGN3MvWXJVMkE5ZGo3OWVjdlg0eGZwK3RoeEh6OGRuTkNiQ1RwYUVNZ2dM?=
 =?utf-8?B?TkNLckpFc3ZjeFE5QUdBeUZibUF6bXVvNTZ1WkdSMWV1eEx3ZXQ2SkQ5L1li?=
 =?utf-8?B?cUx6bEtMeFNoYmxhdnlReHN3dW1weGI1elYzb24yazJDVzNYK0UzbFB2WDdZ?=
 =?utf-8?B?aFY3WkhvZEFjTHVCbElsdnkveC9yMkFMOHdSczBPMWFvZFNQb0QzNlh5SldE?=
 =?utf-8?B?UUhjeUNxVFNoUDUwc3NDRzZDVldvbTlCMG45US9LdzZQNEdEbHQrRmhtQmpn?=
 =?utf-8?B?SlZTd09aSW1kUHZCVUo4eXpMMUorUmp1ZFJENlAwTEx4OWJERkVkazh5VWJu?=
 =?utf-8?B?OUs1bFQwUDNCWWptNFRxUnVqdmlDMEZhSnBkNWx0YU1hTjJIMWozdGJjMy9R?=
 =?utf-8?B?VlliQzZnMnppdVdKNkwxZmx6Z1p0K0tJQmovaURyTE1qL2Nqbk9xUzJMUlhJ?=
 =?utf-8?B?SC85dFJ0RW90Y0UxaC9uYlFpQmFSdlV5SmFwbkdkWUJFN0s0MkZLem5wdkVa?=
 =?utf-8?B?UkNhcTNaWDRkMDRCQ1VqWVczaWJqdFpybkd3R25aYitLMkZKaXdOTnVtREth?=
 =?utf-8?B?VUJPTTJpbWpqd0JyMVhnbGRmUmpLbXRUU1RLcWVSZUdFdkFwWVNTa0dic3B5?=
 =?utf-8?B?cGczLzNyamFxVFBweXY2MitZdGllWnZiUndEWVQyaUN5R3hoMzRvdkE0YW55?=
 =?utf-8?B?QTdsMzVyV3pBdGdDejhERzByeFhsMzd3bG1RelNrRGFvUmV4S1ZxKzN3dDdV?=
 =?utf-8?B?dFFkbURKVFgraHEvME9UOEg5Qi9kK21BZ2RyRHBlWEtnU2U4M2drZXFDU21J?=
 =?utf-8?B?dkw1d25mSHpzN0xXNW5kc0U2KzZ1UlN3UXVnNDE2MzQybjVqZ1Nob2Z4TmNs?=
 =?utf-8?B?SnJwZFJPY2k4dVpHUlRyRGtGUkhrQ01DQUhDTEZVdnN6ejVoZkgxK0kyVjVH?=
 =?utf-8?B?dEdXY1U2TmFrczZhTisramgvRlBER2YxR0dmSVd6aVdtTjNBamkxVk43Nlp4?=
 =?utf-8?B?c0VCYnZyUiszdWhHdC8za0R3WCtKS2dwaDhoci84bnB3bzBnM2VpUXNxdWpy?=
 =?utf-8?B?ZlBWZ3pLZmVuMzdjVXRCelV6SUhoTy9WNllEaXRDNjZyN0l4MzJ3VmJWcWJj?=
 =?utf-8?B?RE51SUxadmdZdkJENkRycnBKUVZOcFNhc3ZNZEh1Z3FsdFJzZFF6ZjNnb04v?=
 =?utf-8?B?NFhqeEZlOU1ad2JWZUVhaUFqNlBMbG1OV3ZXSklqN29VZkR2cHZVTkxWeUFD?=
 =?utf-8?B?VzQyWmlTbFdQYXF0WVNGZTNoWlVBYzJLTTNWbE1HTnFwWmIyZjg5bzJoZHJP?=
 =?utf-8?B?NkhwNU5ZQjlmZFJuSldzb25iOEtDRGZkd2RkMVh5RXd0a2RaY1NINUNOOHlw?=
 =?utf-8?B?SkF2VTV5TkpqS0diaHpWL3BpZTdkMWRrL0ZRYVF6ZmFyZ2FkOGY0Nm5MS2Vu?=
 =?utf-8?B?dVVINVRmS2RhUHR2QzZpNzZqazYyVnZTYitoNFlvMWFUNVhvam9naDlXNUZC?=
 =?utf-8?B?dDhzOEJLbGpNY3dSbjVSbXBrdHEzTXRQeitXQWdkc3hCb2R4dVB0VlllK25L?=
 =?utf-8?B?eGltSlI4SXlVK09qampuTi8rL0VSODdWcUdlMXVtSjdqV04ydHg5OE5sODhE?=
 =?utf-8?B?cGdvUGN3MUhJVDcrTDBrYWJBU2pnVDBLb3FOWHAyUUswUVNHM3NTTzJUZ2lr?=
 =?utf-8?B?QytwMmEyaDlGelFWMFIwZTVTczUyK2xZdE5lcWlxc2Z5VE9pcTV4YVNpSUkv?=
 =?utf-8?B?QXluUUlhdjBvVWtYSlRLekFkMXVxaHBUdlBSV3NLQ0ZHVnV5WVVVcXdNQ3dD?=
 =?utf-8?B?ZVdOblJZWHdoUWtjL2psUHBXeVF4RVJQSjlFR0Z3ZTByN3kyWGw1V3RySGZF?=
 =?utf-8?B?R1ZrMWcwbU5Cc1BHTThPV2F6enVCTUZ1TjBVRng4L1NLY3k3Q3VOa3FoemN2?=
 =?utf-8?B?L3FmM1NFNVNnNVNBakZRUHhQZnVwZjVrcHF4NmtOVTQvM1BkQW9SMXNnU3pi?=
 =?utf-8?B?M1NrbUdMek1XMjVic3ZIbDBiTWZITjFOWlE0NjJoL3IxaSs1N0MrTk5QNU9o?=
 =?utf-8?B?Z1dnbGN5Wnphd3B3MkVobFI4UDV6UjhiNWpCWWhhUksyeEJ4VnExOTFnTS9V?=
 =?utf-8?Q?FFPGsYJRfmqo3Ixg=3D?=
X-Exchange-RoutingPolicyChecked: Ucpk4qPIssAiWQuOTtg7ejGA15kALOOq9jfXiGIBIG3sb5JmloF8gg60TUn8gQMGCtLxLAlyt8kLEDvccLMBeJtmnsyxtLctJ5z/sRkZax2CAIcGRSeMkreaKEU2IoWLBegMlYpmDDyQx/mV6U2/2HpccNNL/Q+mVrNA1z/xIfUhWtW6nhZkg/m3kmB7Yp/08EgdOLCPBtsZ/dIlHpY/1PTDPJ2RfGpedmd9oW6lIk+jiuyina/biwG4hE7wZthfs3y5WzMRLinc9ZAzYuloeVIWA94GoGJVECak4Of0DSifc79n+tc68TXvzEx9HsUNiJ+Oo93BLWxKH+j5tfg1kQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c05487af-8edc-4fd2-d545-08de9ca020ff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 16:41:09.8208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+r/L7vexggrCB2J/3Jm/XS2YIj1Si9WzVGxSJSl8L0VgTLlhBMzWJkAQ4sI2YFdL1gbXx7KRfUviDSXEygFaBko79TIDPLPfe3VKoMosvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4685
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



On 4/17/2026 9:33 AM, Shuicheng Lin wrote:
> When xe_gsc_read_out_header() fails, query_compatibility_version()
> returns directly instead of jumping to the out_bo label. This skips
> the xe_bo_unpin_map_no_vm() call, leaving the BO pinned and mapped
> with no remaining reference to free it.
>
> Fix by using goto out_bo so the error path properly cleans up the BO,
> consistent with the other error handling in the same function.
>
> Fixes: 0881cbe04077 ("drm/xe/gsc: Query GSC compatibility version")
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_gsc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index e5c234f3d795..0d13e357fb43 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -166,7 +166,7 @@ static int query_compatibility_version(struct xe_gsc *gsc)
>   				     &rd_offset);
>   	if (err) {
>   		xe_gt_err(gt, "HuC: invalid GSC reply for version query (err=%d)\n", err);
> -		return err;
> +		goto out_bo;
>   	}
>   
>   	compat->major = version_query_rd(xe, &bo->vmap, rd_offset, proj_major);

