Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7283CA9EDC
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 14:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D40010E5C7;
	Mon, 12 Oct 2026 14:28:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3D910E129;
 Mon, 12 Oct 2026 14:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791815310; x=1823351310;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KnlQefin3ooFXa7sdnSOUihUU3DhCUR1jqioKldGaiA=;
 b=RmXIsirVfreCFFMo+ZKjvQltBWy4XjsfedwrA+oOZtijD6nJXBiMh2tN
 5937svR7RxnoI56A4Lk2zgJn6VkZDWt9FYdEZQ2bE8KY2bOgalyuzYgLk
 Pjl/vfE3s/FQdFLhyYb0XQohVC6yLV1Q48Ts+5oIH6kbAdVJZSN38Dow/
 nQt2QUjPYj6m/0ebRT8y5FssxNfE52NF1GfKGiMaMSfFZ6WG+Wc7XgzBX
 3NMHlnHJm0zI5jpJzsPn6hGm42EdTu5zVvMfY5lw/t+OI5F2Xxj1zri5x
 8akpSF0uXt0IDR/fDJf38qz2SMAviRdHjZyZRyZGGKdyfsMGAe3dXP4GS w==;
X-CSE-ConnectionGUID: 84DFfNM/SxqAYcxsOK3izg==
X-CSE-MsgGUID: dHqwbOvjRCyxBtaXV9AECw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="537651"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="537651"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 07:28:30 -0700
X-CSE-ConnectionGUID: 2Ou3/gcpSLOe9+tobxN2qg==
X-CSE-MsgGUID: raG+FIv+SamHixHT8exq4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1229577"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 07:28:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 07:28:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 07:28:29 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 07:28:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLUt8E3Yf51Ik+klrATCj3JcTn8beURybC5oUED1orF1014Sk/YEmrYD2Tgj+FW9gOWRKVPk7n+9jD6baYEZT0hxZXY+xm3XAoG9loCWs91Lq5dl7LQHKh9NpIG8fwwXFnnkN/EAXlh7zSZ5GCIvnXW7Y/mLCMCAdCqk4bM+8Uz2A1HjS0F6Vq5VExadph18hNSQtyKmntkSyPs2rGBeQIa6rEXnsVrzJcMd9//qLLWMqBTdpg5svsjvntNH9yG0Glb1/p8ND8VL3rbxdn4dYv83ROxgJy+ZqkmiKYRaYqIXrXQwYMpdVlXwUCP68Tmbh1F+xarstioF4qu4WGioLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjVmaknbG+hiRC5JqX21Wq/pTL/JXt9EA5lYuyusXFg=;
 b=ESoEY6OjgS3Up6xoxgT770xoqpdyEDdG6pGeCVfJC8ezCEpzHZZNiyoX1NBVm8bOzwWxITuRRXu056B0YObH1sYjlSV1NF86aUlaMi5cvVvflO9PUSgFT4W2Qdw8Hn4JTafCgzs+g1dgJ0wxokg0uQ4++gYYv6hYOt2pgDimKC0kOsuT77fo574HLA2LdSbGERCq4+Kj/CGop9SN/6j3HyEM5iPQDl3H2CsE2Dj239yWKYBwmLjyqhSCC2vCbQXkeNu1L2Lxg/VrTkAZfTIn/q+UQ/XsMglBeCVADGYvVwiVkN3KkxsmVb8F8SI/NllUiTCKQ/1FmGAprTV8KJLIRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by EA3PR11MB406321.namprd11.prod.outlook.com
 (2603:10b6:303:309::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 14:28:27 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 14:28:27 +0000
Message-ID: <7bd1a133-d118-4339-b063-44688a9f5c93@intel.com>
Date: Mon, 12 Oct 2026 19:58:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/i915/gmbus: Handle the internal pullup disable
 bits more sensibly
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20261007222314.5714-1-ville.syrjala@linux.intel.com>
 <20261007222314.5714-3-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20261007222314.5714-3-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0208.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::17) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|EA3PR11MB406321:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a9ccaae-c7b2-4e18-392b-08df286d1481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|56012099006|11063799006|4143699003|261009223027099003|260925022911599003|260925021311599003|260925021911599003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: YnAL1al9g0I/RlJqNvWfqqM6eXSQOpLjUFv1FYZr6NrEgASPiOcjwzFeAzneQqQ9GWLobWICybWn4OC8mmlCMhLxdlk8AkLT/1EMUxja28v4OTQ0XFeKzEZelUppSpErPpvP3Z3ZJAwznOw2vi047tWRbhp7IMsLr6hGnoWQw0FwPoq3TI3Kn5TRYq+w1WOBx7powdy3mQxRfsiWqIvO8piVInFd4Gz1rXBv/gv4zm4pW5UgWOGiTCf5N1KXMViFYBkZgPV0S+hUvVbAl3BvJ1nM+e9439YMqnGognvgIC+1FT074RNgmy2nQ51D6ANqWxDB5kuLGva8LN/eQgQcXkp+ZBjUicNv6sd9lxr4IN2FZrJ5TvKkXAkAEaVP0pan4nrNS4tndTkg7OnTpLX2tsd8DBo8JGwVEIvHMK4nieFEJU9LjNpcayoCQ/qM0Rl+kbkV4L9IOF8pYHDn1KW7Fu+7fKPWLZs4jcA90VWDhXHF78l2R2qvcueTvCfeXH+sH+q+rZrce0ozQR+bAB60qzp8dLWEFI+3SmtMZnpq+O4sfAkE288sR3ubpoViaZmfTNoaxNOb0niI30OS2qGBV4IQRML0MLagZlE1+bDOmZnNv6BT0oQ7D6asn/QIEMjUdHcvUDV7KOCHeyGhTvvIntyc65KLihlmBiP6yL7ZQLI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(260925022911599003)(260925021311599003)(260925021911599003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qzh2RjVKdStSaUdoN2RGaXNXOGpQSk1GdlUra2JhYm5VeVpOSm92S3EyNURr?=
 =?utf-8?B?c1pnWGhGUEc2VUhuMmhza1g3TUFzS0Q1TnpTQnBSYlRkMlF5YTBDSWtZVUs2?=
 =?utf-8?B?M1lzZnhoVXNYdzBaUzBQWUNDbkJ0eGc5MmdoSmpNZHBWVjlPK013WGJJU3RS?=
 =?utf-8?B?THVnSjd4eWhxbzE4SmUyMDhxd3ZkUUMwZnFwMlRaOVArVWQzNHRJZXlLeWUw?=
 =?utf-8?B?VkNZQm1aS0U4NlBHSHpqK00rT1ptb3YwN1FKVEk3NGYxN3RRak1vY1JtZkVo?=
 =?utf-8?B?ZEFhVkpmNWo2UGQza2RqdkRjQ1NpWTVrZGZVY0liYURUdytLV3FBeXNkVFZP?=
 =?utf-8?B?YU1yYUZIMFNIc254M0VhU3k0SGRpUDNvR01aN29tZHJ4WGdyS2RYSTkydlFz?=
 =?utf-8?B?RDRqK2lMWHJkVkdVYWJZazFCUlFtZXZCcWQ5VmkwVzhaYnp4cmJYZm1ZVDI3?=
 =?utf-8?B?a3hnK3JyNFlxdVZtRmdjS3ZQRG5ta2xKSWdOMGpBSWtuZmFFaEVGS1dOZmhq?=
 =?utf-8?B?RU81dDFLZStpc0JQcXVJM1pERFpUYkF0azhlZ0dnT2Rjc0o4UjIxVWxPaXZE?=
 =?utf-8?B?VWFPSlFzd21oYXFwZnlqVGFUbmxQMkxHamhYOU0zK1VwKzNHbHIyUnM3WnZm?=
 =?utf-8?B?NGF3eE9BT0ZhQzhEZlErbjNnWjdFOFI1T2pJODlMU2dzaFVUc2VMZXE3RGl1?=
 =?utf-8?B?Mm01bm9WR1J1Z0NGZVhFREJlUndCaWgxbkdjMldBT3VvVTJBQm9HMFJGRTJD?=
 =?utf-8?B?UDBDbzdDWXRKRThjczV2VVlsOGkzdllRWlE5c3ZsVS9KK0dEWUt2RUR4QVZN?=
 =?utf-8?B?dEYwTVRHREMvcWs4RC8xN1JtYWlBQXRkRFFrVExYTllZcHk5bDYzYlBSbmZv?=
 =?utf-8?B?cDI2dklYZTJyOTNmUkhmVmxwOXVpWHJLTXZrVWx0anhtZG9sNzJreE0xVkVu?=
 =?utf-8?B?TkxSVm82bVpKWktZN2w2ZitzcXQvamYyMGdwaEthbEhCd0tsT0g1ZktSdTFV?=
 =?utf-8?B?QkJGQjZhb3hLVUE0aE9DVDlYUEhvekVxRlNyTThycU1ucGpIQjZPT3FTUmhE?=
 =?utf-8?B?SnM4aGV3d253cmZoZmkvdm0yZnlkYzd5bmZXbWpoSXhua1pINTk4NUIrOHdn?=
 =?utf-8?B?UkRab2FMY3MyNU0xaE9KR25Xam9TQmhwZlJ0T2tsYWpUZ1NFZkdHWTM5bWpy?=
 =?utf-8?B?M3J1TzR4a2hKVWRRS05EU0lVMURNS2N4TmJiaHVQUlpjKzYwMUpwY3lPV0xE?=
 =?utf-8?B?R3dUd0xOZ2dmbGtHUTg1OHJndFFoK1dJQlNjaGE1dVVpNXp6c21CK2djOEhQ?=
 =?utf-8?B?Mm9qajlzZyt3S3NyWmJrdkNGUUxnU3Jxb2ZiVisvMzMycktnUFVEUm5TVHFL?=
 =?utf-8?B?NU50Q0RDTDc1amZkVGVJWDFmYkdIVzgwNlF2RmVXUjZzdkd3TXRKWXVnL0Zq?=
 =?utf-8?B?REl6d0dVQnU4YlNtVmgvZzNiOVhNdlVTWXdpMzFRZzlBdk1ORmZUMWxnRVBI?=
 =?utf-8?B?S21BcWNDV29xZUptcHpTL2Rxbkc4TEp5bStlY1BlcE9YN1F0TG01dFhyOW5U?=
 =?utf-8?B?RFE1TjRDV1ZXRW84R0YybEkyM2p2bzcyRGhDR2plWDdSWVNkMkM0QkpTM3ho?=
 =?utf-8?B?cWp6RmhSTGxkRUdCM2pVNmZudHB6SVFCQXNYbXZwSk1wTXFrS1hOTWJnZGln?=
 =?utf-8?B?c3ZmdHZ1N3c0d3RmZnRsVjcvUVhuQmF4THBxMU5tMTVqUmlJajI0K3FCOGQ5?=
 =?utf-8?B?NHhrUXJqME9POXN2RlBGT0JRUXlrem11VmJQMWliaGZPWmxTTm13bVBtMERO?=
 =?utf-8?B?R056Y0VtQ2JBd2hzTEcrWXltQUNVOTRKSGxhRnVXWWNIVG9RNnBveGxzb3FH?=
 =?utf-8?B?OWpRanA3ZWZNb05jblNJOE9WVjBhWGRVeHM0aEV5UWs0WjRhQ3k3UitnYVIv?=
 =?utf-8?B?RUNLR0g4cGJHRlBPTEhnVk9QeGdkQ1c1WlpBYWdyKzdVa2taOVNCbWF2NC9m?=
 =?utf-8?B?d3NFUG1mVWZRSVVFaVVBbGZFV0ZlSzFSQS8rNXdaakp2Y2YvTkZnZE5pZWVJ?=
 =?utf-8?B?cTFCMHpocTE0d3Q4ZElVK0duN1QwSUV3NmNTVlIvWDZISHVmTU9DV01DTUlr?=
 =?utf-8?B?bjcrLzQ0Uzc0Wk1xN2R6Y1Iwa2dCV2RsNm5ISStQN2x1d1UvS1IvU1FGN1Vl?=
 =?utf-8?B?OUZRZlJzWW1JNW1PTGl1bEhsWmxhdTVzL0E2TnlvamNMMUhCenVZUFVWUzN2?=
 =?utf-8?B?aVdpZEl0VXAzUzlaeFFHUEIxd0Q4VG5QNlNWNFU1My9IWTRoeEd3MG1tQjl4?=
 =?utf-8?B?R0xNYU9aZzA4akR3bHh0N0dLM0tYOElNa1pHRWFZT09KSTd1K2RON3lOZzl4?=
 =?utf-8?Q?y3cmpDOL4ZVSQ+LI=3D?=
X-Exchange-RoutingPolicyChecked: tVCNGvrouZEz9iiA2l4hdL1wPoV67K/71uhikSl1M8FeSchRWXOMT9f5/kNDBZE0sHDAeaEQQgnbQkNAmVIyn7c97jVoZziMk/kGpwQtwyA2c/7HevvKB9j0yUmZPRYLFjPC3ogc3UtIw7pWzOdOSa1r06BkU97QeSItNtecgBcR41xQWBpvSObE0qFUZ3vxorgFdQ8t9WoS/CJBCRc+38ef+ohXrSit+t+fqNT+oVutptEijWiH1crA1q0Bz13TnJMlUUS8KOKtqztD0kslzYUkIdY2YuVkjDm5fxc8VIhIyt7B6B2md3igYji7wMsS/qn5KwYOQiB1o/t+L7zeKA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9ccaae-c7b2-4e18-392b-08df286d1481
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 14:28:27.3136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1P/YP5jTUGnUXRM/7ooMvmkb1Cv7m8f8CySgdW/npxA4cWcDQFn9OL1amH9Pz9uo1zhhM008m1eyLTf1d/Xi901rjfCEV/I1yQYQWXnKSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR11MB406321
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


On 10/8/2026 3:53 AM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> On gen2/3 platforms the GPIO register bits 5 and 13 are
> documented to be either internal pullup disable bits, or
> documented as reserved bits that must be preserved by software.
> It seems to be that either way we want to preserve their
> state always. That is, if they really are pullup disables, then
> presumably the firmware has configured them appropriately for us.
> So let's always preserve the state of these pins on gen2/3
> platforms.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_gmbus.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index d23422e12aa4..e808f5c4106b 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -251,11 +251,13 @@ static u32 get_reserved(struct intel_gmbus *bus)
>   	struct intel_display *display = bus->display;
>   	u32 preserve_bits = 0;
>   
> -	if (display->platform.i830 || display->platform.i845g)
> -		return 0;
> -
> -	/* On most chips, these bits must be preserved in software. */
> -	preserve_bits |= GPIO_DATA_PULLUP_DISABLE | GPIO_CLOCK_PULLUP_DISABLE;
> +	/*
> +	 * On gen2/3 these are either internal pullup disables, or
> +	 * documented as reserved bits that need to be preserved.
> +	 */
> +	if (DISPLAY_VER(display) < 4)
> +		preserve_bits |= GPIO_DATA_PULLUP_DISABLE |
> +			GPIO_CLOCK_PULLUP_DISABLE;
>   
>   	/* Wa_16025573575: the masks bits need to be preserved through out */
>   	if (intel_display_wa(display, INTEL_DISPLAY_WA_16025573575))
