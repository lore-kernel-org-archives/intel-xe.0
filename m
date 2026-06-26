Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268F1CDE008
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 07:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C629E10F44F;
	Fri, 26 Jun 2026 07:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7BBjolk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491D010E214
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 07:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782457963; x=1813993963;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tSpCj4yh+BAHCShnfOs/jZUNZPI0k//Ltztp2lEeg20=;
 b=Z7BBjolkYuyW1KOmGkOBXssWfWjeFGUBIulS88LNFJN+zLZ/PcpY44Q/
 Hp8m7PeVq3j2IsauI9TpYB+kc0C55k0YnTSS5QeRW+0+wDh36TZMxBOwJ
 Hrq6gI0mNVky9C/EUfZBmxPiIz4/0mBXWnuro3TQf3FDmKB+mjdL0wD+S
 KQVRPWivnE6LEK3to668RDuacN3bs/CQnI2e+1/5anLrM/k+HNKNpTw5S
 1sX5j1xowMd0hQ7tBNZDESDe8voI+16qUkzE5A8l/1COeC72u0YP05Mow
 HIs1KMvPlLWY95JHbiFPqZuwyA5k0LXnhbAuGOQxXeSgwH/hjSopyyVgb g==;
X-CSE-ConnectionGUID: G0wkDK2WTMmQ+wb+t4sFaA==
X-CSE-MsgGUID: PyM8qZGyQQKJn/JDSnKWBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="106045962"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="106045962"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 00:12:42 -0700
X-CSE-ConnectionGUID: eJtM2DwXRemCA405Wb9tmg==
X-CSE-MsgGUID: mugugVzDQKm2nGd2ZMDrbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="248620737"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 00:12:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 00:12:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 00:12:42 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 00:12:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1ArKm0o6DUx125niZQhaNzTfT3MeSFm/v8KgNumeEtehY7jRnVQq22h6fnKhru+zGmjwzFltMiyCj3N7KyJ8QX7wwE6gurrF1ScUxZ3KGgjhQ+Z3vjWyW9RuJJp4rJiUWqFyaeorD99+0esMjwLqt4NfZZz7tXZwpMdZeycbjYLqdtEY2DnVIMjj5/h7g1fHipOu8FadGE+f0JLVAj1iopwXCVxKX76rXa5iV3AmrPqghEsDA01xln7aEoHwqIgJkzEg3ORQ/Ma8H6Crg63Jx92gaR83+8OQW+bGbvM8D/3xOFeZJ1kPGcwlLx2s2UqjLYbq5loOubxDZJ3h8qs3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TT1z+Tl+wJpFIQJbQC4R4WtAatPQIuE+NGBr2ZNrYE=;
 b=oC4hPSH1ZiqpcLK9+2hX9v2If0FT3wdHlmysWwUVKuIZwTGc2x6rAynDiE9vKxYefLvg+6A++iaVGYPyrZRSVQ2CCLbE10MwPO1W+1eQt6CQy+KdU0HRrtTCYaiIfEX35MVd/7WTUIJCiIYYydeCReTS1SbHzi565qPjTkwDhvF7JDaKp1H5LGQ3wnFtLGxUFV1SEAaEuzGHSNbpR1feUD9YcM7WDZhVPnhggsI0Yrxo30JAfTUh9WwBaCby8dYb5CdZ40NOAl0VFLn3JZ1xQKmpqARyTIZj1cABsSV5HxJMrMtdis4HmTGotnzCi1EU8gkToPQ/LSywNVXSFK1JBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Fri, 26 Jun
 2026 07:12:34 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 07:12:33 +0000
Message-ID: <d10306e5-c38b-4097-ae98-409ea78f80d9@intel.com>
Date: Fri, 26 Jun 2026 09:12:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/pf: Add support for VF Pause abort event
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260624095634.1250956-1-michal.winiarski@intel.com>
 <20260624095634.1250956-2-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260624095634.1250956-2-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::12) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: fefe60a7-17fb-4851-7756-08ded3524b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 4IEe9Y/fC5KlT67cQtHkex5mjVBjBufc9PBllRlZChe5O2uiJXfTw5+8OyGvDzGFpBJIBgyKtV2B1lslobhI3ci7cac/AwFZi3pPbFbTnJc6VXfIOfswbwhyKZYO7p4XxuFqwlKJwlUQzgHr5O5Jxl3tCKXNY7pRlAfgOFQFOmDWzl5PRkmj5buFI9teasjaVERKD1HtmxAdutHWs3Df457fivJPYAQjFtTLG9d/YMIP0TNPTR+kPPcCIQdqIgfrVWLKgtqJW8LCNIauB3/vc8o75ag+aqbFALovtgBdLd2qlA1Q/uUN9oba6DN9MGKPAwkagE2DXLMsSN2LWerHpVzDlLoyIj/o9v8ljpIZtnNntot8fT4RWaeCu9isUkd2q+9nqMr81bGDliQWlDH3WhKrko1wsKw9zyKyQHLbtMMp+LTtp66onHRINDk5IUd2GWIwK5AKXD9m3jpi6/qVv7+Py0tzylgR+jO0tUSeK84GXVrAZA/R3DB8FDcyItwJvmnnW78JxW50l+OZwF6scIfj8yos5udDOOKiiCkqBdypTMlGVQumV9mL6ZrbX2VFkXTzD596rrBfRrUUicetACa3toGvy1xfcK5KFgrb5/BjnvPXpk0641ckAwEejF3aU/+joeVojzuZMW/u3zRyCTGUfSdgwUP8OZ4Wo97e4lc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmQ3Vnp6UmFFQU13ejljMWJFQWZaMDhPQzVxS2xURnFsL0I5SDZPZVgvQ0d6?=
 =?utf-8?B?SGNkc1VBYk0yeEIwdktCK1ZBZlJWaVFyWUMwNlZPNm9BbEJUcVdHYk5VL3N5?=
 =?utf-8?B?djRWS2hIV3h3ZjZFT1N5YjFvZ3Z4ZS9qVEo0aDZ6QmgwWVlBaEpzUWszZjNB?=
 =?utf-8?B?bmdlSlNJUkhzQ1FGek5PNGhKVlFDYWkreTljeDFmai9CZWt1TjJMMXpnWWx5?=
 =?utf-8?B?S1I5Yjh5SjJoZ1EvQ0NYSFJsaGIzcDc3MUhqeVVDT2JKWVAwck05RktVb3BY?=
 =?utf-8?B?Z0srS1FoakhsSGdXTDA5V3NkTEg4K0ZPMnY1cm5LQVFwbGE3RitEd2ZSVHJH?=
 =?utf-8?B?OXRHWlpLTjM1Kyt2eVpjZ0hhb3N1YnJpQWE3UjE5Nnlta2VvWW5rYnBUUHJa?=
 =?utf-8?B?bzJpdGpOWCs2TTVYNVFCQUc5L3Y2c09xN2REdTVKNWtRZ2F4YTQvaTZyOXc4?=
 =?utf-8?B?aW1QVi9pZjg0MVUrSlEvUVBpMWd0TEdia3YvUGJGUmpyYUFvOVpYQ09zaWIr?=
 =?utf-8?B?cG5UQ2JrV3pocWtqbmNET2p4cFZJVDhRRWJWZEh3ZzNBaEh5STg0TlIzRm04?=
 =?utf-8?B?NG5uOVhOdy9wZVJPWEVBTXNOWFpQUGNUbVE4VWdFQlZ3U0FlNXZyK3BUQUcy?=
 =?utf-8?B?WXIyTW9QME1OQmVaa09EeFoxcTAva3ZEcHFTaUx5SlRqRUZlU0lvQ0FVR0sx?=
 =?utf-8?B?ckdiMXJlMXVBWkRZRE56MjRwOHAySHFRVHNSSzhSSFdVSlNUV2lZNzIzSmNO?=
 =?utf-8?B?RFhrVWtwZG9UaHVEeVpGS1JLaW13QnREMFRJb2ltaXM5bmVidVFRaXlmblpZ?=
 =?utf-8?B?RVpZWWVxRzRpWFV3dGQzTS96dmFLUFM2ZTR5RTFibDJqM0doOVV1allTTGhL?=
 =?utf-8?B?ZU0yazNIMWtxZkNnS0VhbWRxck5acHFJMjNWTmhSYkdpOWRKdUk5bHd2cU9S?=
 =?utf-8?B?VTBEanpXZGw1UDNnaDJsZ05LT3U0QlZPVTFLNEViR0oxSWp5eTZiL0trOUVL?=
 =?utf-8?B?cGJnNnZKajdkM3gzVXAwQnlKTGlMOHpoVHFOeTViQnhBSHVKNVliT081TzZE?=
 =?utf-8?B?Yk1XdGFOTHBKUG1iVFBtdkkydUVLbjVYVnpiRTR3UFBBR3ZiSkdFWnV3c3Q5?=
 =?utf-8?B?eFp0Q0wwekkzeld3bEZkbG9lSjFvT1pnSUY5N2xEMW5uQlNmWHBvUHN2emtS?=
 =?utf-8?B?RHFITzFKKzNiR0dNcGI0eFBZa1F1Y3IzakdaMDAxbkxPYklXRmJIM1VVS1Ra?=
 =?utf-8?B?U1YxdDR2LzNWOWpoVjFtZDNqQWZlbFlVOU1rV0cwdDY5bGN1S3VKMUNIUjVQ?=
 =?utf-8?B?dy9yQ2VWcit5N1hpVVhCcHdRQTNkdnAvcGxSSUV1WU1mVTVOaHFvUy9rUlln?=
 =?utf-8?B?K3RNWnM4NXIrMXRxQlorNmZTYmNoa2lMbTdDbWFLbWEraHBUMENra1IvUDAz?=
 =?utf-8?B?L2o3Y0E3U21YRm9vVk40bzBsMmVwRkQrMndjOGdMN1daa3lNM3FaQU84cmFr?=
 =?utf-8?B?ZXZCdGUyV2g5TGZnRHZ4OVFuZzdKaUxPbUxlL1BvbFpmdENHOVdaRmJldzhs?=
 =?utf-8?B?Q1BpN2FvL0U2VjB4aDhBT1BlU1h2bElhR1hIT0gxRHhkaTlPNUp1eDBxUHFY?=
 =?utf-8?B?M0VSSmNhZ21hTVBzclR6eUVHa0lyKzdLdytVTzJpMC9mWG5HenhXNFZhNkpH?=
 =?utf-8?B?SzNnSVkxR1BXS2l2RjVoWm1qK0ZaUkhpWlJHTVJGY2p0U1NoanFMcDJ6S0VH?=
 =?utf-8?B?Tmh5QzFXMXB6RFdUVU5VU0hhUGlvbjlpbzBFSWJMQkNtT2grMlJhb2JXUlJu?=
 =?utf-8?B?SG9wUFFYSmtPbEs2UEQ5NTJmYWZNemtkK3gzWWtPQWlsT1FKcmM1QjJDQWU1?=
 =?utf-8?B?ZU1QOG9UcXN5dHgxc0RFQi9LNGYzZ0ZZNkNZa3pWMi9sK01PVFlTS252VlhI?=
 =?utf-8?B?R1BxRWZuL1ZPNHZnKzMyNFpVV0ovcjl4Uk9NLzZrRnpwRGpsaWVGTkxjczVq?=
 =?utf-8?B?UGo0REpqb2x4TTh5RTE3NFdDNi9yZERCZVpjQkpvb080SFpSRFJpZ0llZFdr?=
 =?utf-8?B?RGlHRWtyUGRpRjNUbzMvOXF3b3BoZS9LL3ZyRXZ0MkxvcDdpbXJQdWZqTmlT?=
 =?utf-8?B?VjZpb2pSNGdFNEpyazVYTk9BWFl6cWtRY1AvckpjWk9LcVFOMnB4WnJaTktG?=
 =?utf-8?B?M2M5bUl6U3hYdm1GRUNSYU5IRkY4NitsRnNPeG43MTEvdHZnSk5Cdm4rcEp3?=
 =?utf-8?B?WC9tQ0FJSGh1eFRWYmF2TFcyNHM0akxaVnFZQkh1RWNMcW1hYURWY09SSjhW?=
 =?utf-8?B?OUhxMnkyc3p0UFVPRWhMTmtUQ1V2M1FsY29hdUx6RDIya3NLeEsyUmFLc2g4?=
 =?utf-8?Q?mpFNyhcTNXcmPyB0=3D?=
X-Exchange-RoutingPolicyChecked: hUIAT52PijyH96aET6w0J1DRafj7GGxX3aa2vek8vICuDeGvIOdzTERO6IXniAFFxhPK2sJ/JW7jzK49cZ1x12XlnbjrdYDGvfwKpzbDgBW75S9NAXFdwqxj02RatDl10vBO8PgnIC1xG4kEo6OzKKkWBw445NIccds+BlsS2IwMb3za7BbmY7KtkYa1i1U8WYBSDUX6rfvKSUTrYGIW1QCZvZ74RmvWaTC8/o014l4M2+zk9O1yRfSYHS6nyvl57rhe+nYzDJdpiUc9bXU33Tf5hJrOdeJGeNJwgsb7TXel5Ua3EmU6ULhkaj/1a3AHfRIoCHpP1JDZX3l6uMtHPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fefe60a7-17fb-4851-7756-08ded3524b37
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 07:12:33.7578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBhzAFJWzjQfTPKGRbn/yojeVweToCoI7eFaS2fkdJ/IYQh6VVgJ3QuPbpzDPcQsbzqxztHFqZKObD6olt4kkICTVOX3Kb92Ze7TZzyMYZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5823
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



On 6/24/2026 11:56 AM, Michał Winiarski wrote:
> GuC can notify the PF that the VF Pause has been aborted.
> Handle it on the PF side by moving the VF into PAUSE_FAILED state.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h |  2 ++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c    | 14 ++++++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> index d9f21202e1a9f..8665b8c5b7336 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> @@ -229,6 +229,7 @@
>   *  |   |       |   - _`GUC_PF_NOTIFY_VF_FLR_DONE` = 2                         |
>   *  |   |       |   - _`GUC_PF_NOTIFY_VF_PAUSE_DONE` = 3                       |
>   *  |   |       |   - _`GUC_PF_NOTIFY_VF_FIXUP_DONE` = 4                       |
> + *  |   |       |   - _`GUC_PF_NOTIFY_VF_PAUSE_ABORTED` = 5                    |
>   *  +---+-------+--------------------------------------------------------------+
>   */
>  #define GUC_ACTION_GUC2PF_VF_STATE_NOTIFY		0x5106u
> @@ -242,6 +243,7 @@
>  #define   GUC_PF_NOTIFY_VF_FLR_DONE			2u
>  #define   GUC_PF_NOTIFY_VF_PAUSE_DONE			3u
>  #define   GUC_PF_NOTIFY_VF_FIXUP_DONE			4u
> +#define   GUC_PF_NOTIFY_VF_PAUSE_ABORTED		5u
>  
>  /**
>   * DOC: VF2GUC_MATCH_VERSION
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index 65f015d0ede51..82957c596b683 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -1953,6 +1953,17 @@ static void pf_handle_vf_pause_done(struct xe_gt *gt, u32 vfid)
>  	pf_enter_vf_pause_guc_done(gt, vfid);
>  }
>  
> +static void pf_handle_vf_pause_aborted(struct xe_gt *gt, u32 vfid)
> +{
> +	if (!pf_exit_pause_wait_guc(gt, vfid)) {
> +		xe_gt_sriov_dbg(gt, "Received out of order 'VF%u PAUSE aborted'\n", vfid);
> +		pf_enter_vf_mismatch(gt, vfid);
> +		return;
> +	}
> +
> +	pf_enter_vf_pause_failed(gt, vfid);

hmm, after PAUSE sequence was aborted by the GuC, the GuC seems
to keep the VF in a MIDPAUSE state, while our PAUSE_FAILED state
actually exits the WIP state (which is good IMO) so we will be
able to initiate PAUSE action again - question whether that will
be accepted by GuC or not ... but if not, we will return to the
PAUSE_FAILED state again (this is already covered)

but we should update our PAUSE state machine diagram with this
new transition, rest LGTM


> +}
> +
>  static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
>  {
>  	xe_gt_sriov_dbg_verbose(gt, "received VF%u event %#x\n", vfid, eventid);
> @@ -1972,6 +1983,9 @@ static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
>  		break;
>  	case GUC_PF_NOTIFY_VF_FIXUP_DONE:
>  		break;
> +	case GUC_PF_NOTIFY_VF_PAUSE_ABORTED:
> +		pf_handle_vf_pause_aborted(gt, vfid);
> +		break;
>  	default:
>  		xe_gt_sriov_notice(gt, "unrecognized VF%u event %#x\n", vfid, eventid);
>  	}

