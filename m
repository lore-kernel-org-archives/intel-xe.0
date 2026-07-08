Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA8CC43602
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 16:38:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC9010E623;
	Wed,  8 Jul 2026 16:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EebvVStW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9C410E622
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 16:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783528723; x=1815064723;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/dJ+glGDGae9yzqJS7jB038uUwDvIchkJy0nRfkFtXY=;
 b=EebvVStWp8hFtm2Md87KFBIAqGhfInOnyUSf9RCoFlifUnLURl3JqJNm
 wCO4Zj+gO3cPLXXWpxBkmZxm5PM2pdjyAEcqCpiylSEOmAOj/vVicEXJF
 p4xcEUQXpdkzbQmekoh4r8JJ0ttn3/MgyaxzmH78RaNN5GrHALgldLVvF
 4U1Rw/tPNW+NlnO+ARB+EQvs0ms2nxG8uw/zVzfCAkm+nj+nsiOtMWUB2
 9jvf4IlKpqPRx5A6soXigfk51X8pkUqAx3wKCdZuHzXpJpitvOQC90CO6
 7v46/uqDNGThIUfO3qAPyvDpkTvnig1iSG2I1TxtixFgBXl0mG040mrVo g==;
X-CSE-ConnectionGUID: nKLsBhZUQDy2Nm/d38YreQ==
X-CSE-MsgGUID: t6Y7Ae7cT0CPml/ZwbR0gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84388406"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84388406"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 09:38:42 -0700
X-CSE-ConnectionGUID: VYsxwVUIS0S2oZJMvm3mJg==
X-CSE-MsgGUID: HoI/CJScSyaTgUwQvoJQ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="251681966"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 09:38:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 09:38:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 09:38:40 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 09:38:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5OpzoMgaK6w4w77FmFdCEHjDOhIb5XFkT5Np7bBw0DnhkHnu5cy6ESOBnUNU92d86d/6Ls/TcubB9Jnl9KjQiyDS4jLGAwmwJgKCu8rsl2K5M6yGbxQfIOQUCAGLTf6ZGQd8UQ7CbadXeXY4wmfmb64bVzJyS543bEdrD5YUAdEnNp8/aQEz1IunoExYjddIf+YnN1HYENVYe4rzY23RVgUhbZL718LrSVP/GMF2d29YQQ0YRsHSh5TKXra5kYvKIQXsSPMRdV1GdOZF1cmxqwqTOqyEbxm650sZHb/gesvfZ2T2ir5sTT4+YozQmvEhqSDKwjo6yUt4r7/O9hIcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FL3psGf32z5ZbLjaYunGn7uIy3Jg0vikbLE3sMyS/Sc=;
 b=il6e3zlKJXd6zblgqGwdFCi7TbOgqgPaJlxNaELOa8sMZ6ZuAQ7N2j2kYOqLo7sOw9f81N+VpwBVr6RV1RuG5rZUM++TLe8iNeunNgmgP4S2/IvMDfCfSjnHRM6L/KuBoEXqy1ZU+gXpcLAyfhSwAGKg8ogSPwYDVPvQtYiY0sAeviZ4hX5xvQ9ZUD1afMqxHLtn4Enac76U73cJxaECAlr0BlPZzes/Ws8qrpyjYOIlw+4nUZ0/l36DufpnZJc0HC4Le+K2o5qgaALGS7cRjFJ3KVlzpzizaBILGsWT77JQ+jl3ABUplyBkQ83FlhOyLXiKXHAr7bc6xZDEd6a9ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8)
 by CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 16:38:36 +0000
Received: from SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f]) by SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f%3]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 16:38:36 +0000
Message-ID: <a88becd4-6f15-4ccb-b73c-5b9ee330b890@intel.com>
Date: Wed, 8 Jul 2026 09:38:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/uc: Apply RCS/CCS yield policy to SR-IOV VFs
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20260708100616.1050537-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260708100616.1050537-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0209.namprd05.prod.outlook.com
 (2603:10b6:a03:330::34) To SA2PR11MB4985.namprd11.prod.outlook.com
 (2603:10b6:806:111::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4985:EE_|CH3PR11MB8441:EE_
X-MS-Office365-Filtering-Correlation-Id: ae183ca8-28a6-4087-62cc-08dedd0f5b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|6133799003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 2x34GzlA/rxlMjYr253G/WAqvA/wtRqB1tU3C59TWusRB/nG1ZBMTWUhs67NKI2zY60PB/6DyTwehmcfWJJl6ZT1VFIRtN1cEpLG8/s1Y0x3sbklWGEp17zUdZIRdj+HYBr0YdgkezWO2O1NwhnqWuy5UY8L4HWYrG/sLaw7haNPUQUS8B3RVwnRzY7yxC46rINHpdG5tCX6a8l1J+xj+0kg8loGZRvPstv8GHUc64DoGaIj6JIlwBQQ6bHtfw+BkyrrLw4x70LAHGksYNAYsg0t2uREfbHHewDDl5pYf6ExFvaMpio9CNfXBIO8KJ5m+3LPBEhlkB9+GjGgPIyPik3zvb3gdD1hrdRasmecGjnpgmKqRA1asITU5CA+xV+Gfp9sdf3bwhTQOT3RwsJOKzdydyTD+KHuB8fS8gDVJ+kdmn/jaWogL1RKchpD9O8BQswWNnuazWHmKSWmjCnK42z1CMHf5RpFRLSfVvLgW0EatAZGteDO1NNOKegpuhkrvaKXUl7T+M7vqj5ujwdd86kjQ8QjkxWa0PmeqrE3i/ZdELDjubqwGZJ9/LII7WpKZ3DK4YdhsnYD2h9wxkFaVCQxvEEE1+gJrb1EGoy8YOVy9WaN1LfvZVgfy3+DPnHVxphiSmpcQIWUsgMyWhj/gzLYWt6bYskn/az09jR0Oj0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4985.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(11063799006)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTg1d2Y2QlJsVXZzbXVSeFc3RzJMNUhGVENHZHhVSXhLUC96eEpzOEtpZ0g1?=
 =?utf-8?B?ZU5NQ2QzTnpNZGd0aUl5eUJRWUZhMVVDTnBsdkEzVnozeWRVUFZHMmJzbWp1?=
 =?utf-8?B?WjMrNnFRaXA5Uy9mNDRaWDhOU3lqWFdETjkxVEFDYzlOam93Zi9URzVSTVNu?=
 =?utf-8?B?Z3BjdVFZNjkweEgrU05pS2RDdFM5YnNTSldSblJWZUhzemNGbFEzK1Uyc2hq?=
 =?utf-8?B?M0V6dGhpVXM1eFI0S3BXRDA1WnAxcFFWRFNiVXYzVi9mOTlyNUt1QjVVdTR5?=
 =?utf-8?B?UlBnbUVXY2w3M3dvT2FKNWFFNkNtMnk1KzdUWjR6NEdaUVVUZG9CQzFNdFdH?=
 =?utf-8?B?MWNNTXBUTytUcnR0cTkrd0RIVVpzTElDMnZ4NW1NdGlxelNubHpSbklxU0c0?=
 =?utf-8?B?YXJGalIydEJMM00wMVdYRjFBQllzTFdvdWhOUUMxRmVCRGtiaC9reFZhaTg2?=
 =?utf-8?B?Y1pzMjBEWmE5a2VRYXB2VWJFNGRyMURwbVpIRWtFL3k2eHVraklZN2thcTUr?=
 =?utf-8?B?UzdmNDYwaFVTUnduaTY2LzlrVTFPWVI1U3ZQeUhSaXFNVitHdWM2K2psMEZ4?=
 =?utf-8?B?eUVrUzNqLzV4VTBwK1EwYlk2VjBield5QlpyOEtIYWFjeC9aQjlMQThONC9U?=
 =?utf-8?B?QVlTMmlSOVFzbzRqVk91SHJ6UVIyNDdvb3hPdVc3MGtKN2NxTlJ0WEpCMXVG?=
 =?utf-8?B?VWlYbmw0UnY2dEh1L2F3TFgwUnN1QU54OVRjajRxUlJzWTdoN3JrNmEwT1pH?=
 =?utf-8?B?UUhXR0lQaDc5SkhMajRBN1VjbFBjRTRUa3l1WHd4ZWVxN3hCV0FLamsvZ2FC?=
 =?utf-8?B?S0NYUHFpNVUrV1pldG1jeFcrU3phbi9Ub3NwVDM5WVZMZW4yNmFYdTZTL2Y4?=
 =?utf-8?B?SEFNbFJDL0U4MU01bDA2OWNPWWpjdUVaZTlqdEdTTkpXT21sZmRQUGdHR0pY?=
 =?utf-8?B?T0NJV25qQlg4cHBBVlRTNW9jUG5KNUVCemRpT1JGeVBhU3Z4VllnaVBrL2Ja?=
 =?utf-8?B?S0xNVUVQMitaVE1Qa2VJamx4Q0NVUGlvREp5eUhrQjBCa25lR2plcTArZ0d2?=
 =?utf-8?B?b202T3E0bm02cnN4aE84bjR5TTFrRFBscmh4ZHBmUys1YTBWS2NranNRcXFs?=
 =?utf-8?B?eWxQYkR5eDdFOHdscW1YVmtwUGJNVE85YUdZTVo1UEtqZmtZZlh1RDczOGRk?=
 =?utf-8?B?amRKU2RRNldoc25YaUlES0hQVnFHL3NMZHRlWElodEYxMWtPWXB4R01jUldB?=
 =?utf-8?B?ZEYwQ01heUhzMjJ0eWs2eDFvWTFNTTE3bHRvYjcrZUk1aTFCbnFiWlBhNnpF?=
 =?utf-8?B?TGRxVFRSakpRcjhsRmYyd0dLUDFjNUFIcVAyTVNQcUFZVWtveWNzajMyRGtZ?=
 =?utf-8?B?YnpoNHI2UXowY1pZRVYydHc5R0pmTUtrcktQbWJ0ci9QRHVFdVNJMjk0eHFk?=
 =?utf-8?B?M2ZERk8vb0ZwNXovc1dVTlphYUl5SjUwR1ozb3Q2YWM5VHZJaUxObHFqK0pX?=
 =?utf-8?B?aUNtOTNwR2VFZ0I3UW5GU3Q5SDdZSXFmcG82clpVenJzaGdzaS9sR2RzWW14?=
 =?utf-8?B?cDRURmg3ZXM3WmFGSXNLa2xzRUNyak1pblpOdm1mMTNjOVRUeENnMXFpYVJt?=
 =?utf-8?B?YVZra2ZhOXFYS2FTRE5WZkJzem9tTzhUV0JrdTFKS3NpZFNHdElIRFJtOGpT?=
 =?utf-8?B?WmF2TTNOT0NDTnhoL0p3OFRpamwzanFGWEhHb3JsQU1RSTVGVEN2Zk5saGFj?=
 =?utf-8?B?Y2l5YS9LblowekFMdmFHckJnSnBJZXRHYjRlT0N0K0NUQ0hxWTFzdi90OEJJ?=
 =?utf-8?B?Mm5BZ3NmT1h0R25SSEE2Rlhsc2IxMHo3cWt4MnVPUUJYNlVWb2ZoajI1b1FF?=
 =?utf-8?B?VkNtTnNIZ01hUDNPNU8wUGNuT2NIY0xCTjZDWUVYdnRZbVdYRlA2bFV3Ukxu?=
 =?utf-8?B?SE5zOFFFaU5GOUdyNzIwajYyb0czL1ZpbzlOV0REcTZ3enlxOGQ2YXRlSjVO?=
 =?utf-8?B?VjVRWllSbElRWWdydGpWcTZzTnRFdmdMb2xZMDlnc0d1czkrZUtSZWQxTWlN?=
 =?utf-8?B?QzYzZ2phMDg0OTVxZjNiQVdhTGtPWkhhSUVIOUVnM3dpNHhhTTBzTWpObFFp?=
 =?utf-8?B?ME1VV3Q1dUdzYjNybFd2WkRZbURIR045emRxS3dRZGU3SVhHWXVmWnkxWUhh?=
 =?utf-8?B?UWtqalEzb2g1ak1tcXk2VHZ2NDlsMXh3WG9OOXAzVGFtZWt2S0U4VXZkMUlh?=
 =?utf-8?B?N0NvT2RuVUZKV1BYR1g0bWZhVS8wMjJRVld1MWdpOHoyeG1xZkdnMVVLOGs3?=
 =?utf-8?B?NHlVTUtud1BpbkRRemdMcTl0cDRyRTdPUlZ2WXZYSUkwNHRYN3dRcDZEUFV2?=
 =?utf-8?Q?F5mq2aoCUmoYq7RM=3D?=
X-Exchange-RoutingPolicyChecked: LnxOh0/sy2nJoielqqr7zogWYAbpdKTNSPe0v55/Y5XplmaJjKtmGmGo8gjSScxMhXmDiJ8+BYvCKVJ9h0RFtCcrtKYMQB1AeX+nkXbaeO3gTdeComklwRIn7M5hI9ozpxHGBfiST4irZkYWsNTOgTEy7r4x2sl5/2RX56ETqV4fdU7JhUJ3uxqFV7gvg8BV9JJVih1AgJ2CLolArjJMzN+z4nDYbzhbD4NXJ1K1FO9JBolxYjTW+Z0LX24F2YPU8qE2vv4lANXGLrlCbHccqxaAN82gR5x/ctVFlHaGmWtUixy3gP+AHNu2ugC8Hct3WvVdOjDzv8Zc9qrclT8hRw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae183ca8-28a6-4087-62cc-08dedd0f5b65
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4985.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 16:38:36.2639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uGab1FDIsWH7nWiL7yUQrYyQR7sFEGX5zKB967neGGmmLMY9vvWWtsGg0bm4a2qj67/df95AysDMzMTGBPdYBMhTE1Tw1fuQUJE4MqI1ZEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8441
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



On 7/8/2026 3:06 AM, Marcin Bernatowicz wrote:
> VFs were missing the call to apply the global scheduling policy.
> Call xe_guc_submit_enable() during vf_uc_load_hw() to ensure VFs
> get the same policy enforcement as PF.
>
> Fixes: 26caeae9fb48 ("drm/xe/guc: Set RCS/CCS yield policy")
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 75091bde0d50..c6f5fd966afb 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -15,6 +15,7 @@
>   #include "xe_guc_pc.h"
>   #include "xe_guc_rc.h"
>   #include "xe_guc_engine_activity.h"
> +#include "xe_guc_submit.h"
>   #include "xe_huc.h"
>   #include "xe_sriov.h"
>   #include "xe_wopcm.h"
> @@ -159,7 +160,9 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>   	if (err)
>   		return err;
>   
> -	uc->guc.submission_state.enabled = true;
> +	err = xe_guc_submit_enable(&uc->guc);
> +	if (err)
> +		return err;

On PF we call xe_guc_submit_enable() after 
xe_guc_opt_in_features_enable(). It doesn't make any difference right 
now, but IMO we should still make the VF ordering match PF in case it 
matters in the future.
With that:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Thanks for the fix!
Daniele

>   
>   	err = xe_guc_opt_in_features_enable(&uc->guc);
>   	if (err)

