Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B10C88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 13:22:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE9E10E933;
	Wed, 16 Sep 2026 13:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FwrOfzkk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AE810E933;
 Wed, 16 Sep 2026 13:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789564939; x=1821100939;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ItXtTLbPDKGiMO2fDqw5oFjfvMG6G7M1G0tXnqEm4Ic=;
 b=FwrOfzkkS0sDjaXuo4gBwXzZiOS7nhf3fC5RUhuOfDJQ6AFnP+tY1CDN
 5Yy3ZWvzgXeIhWqse4tNi5oE7w/hQ9qrLpETXfd/NMasjSyuOp0x/X01N
 U1zYn0uV6I3QtVrSFLGdxKcl0XOPwWjRBu+gEXy8z8Bkas2Sy/bBpZmFi
 RPRu1+07JMHSDpWL5TUwR9gikzz3LxSl7+LnbmIH1l1GAtk9RcGj2Nf8w
 Xla4e2H1vVfjxRioK1XnnFyL61Xz0inxeR7Wk9rhVQnhZeFOtR9C4ymx2
 N5tAcxU/Zqah4FQeNtZgn4sTOP9WEIdWoRwrTXtsR6qZ7tgCVuanWYLXN Q==;
X-CSE-ConnectionGUID: fs0ua0SBQNiVfevdykaSHw==
X-CSE-MsgGUID: u/hSZw5USrSaVsPniYydgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88877225"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="88877225"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:22:19 -0700
X-CSE-ConnectionGUID: Fz2HnE47SK6s4XmDKK0X0g==
X-CSE-MsgGUID: 4srHItTjTeacUaD4BDneGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271558922"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:22:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:22:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 06:22:18 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:22:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ns6XUuugeqK0h9MYLZQF7jnBNXHCzDsA4K4hqG47U3WL5cWkHGuKPkIWqKojgsKrh4fNWzec+0aFWgpSgLNM5q2ZzRlj+EUZ6z1hMWuXujWD5FPmwYd7pJ54p8HhM+Dm2Rb5g4XjTrLSYKuX4zaUyowbni/F5tQxI4EGr/dOUgogcpe4voo9zIuJqHNUOBPgCIsqeddkXzr1Q4+lPT8cZGUQFZMzwtDjvlnzSY4ocHU9FZxo4cklS1RETrglBOl6vTRiikR/zl8j43FvB5VlcmM86Vk/PMCEOoUSByQZ23tIyiXwK27fXu3INsmHiAUjxtN51y9ZrGueCUns/fmYuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/YYLW5F5EqsrkgkvaW0r64X3SKf4SFYYRszzoyp6x0=;
 b=ETob230vSY2Du9Uy+YsrVm+j49UachcOnB1dSIgqa+sbJFjO1YRsziIEyjqLm/p/8tmfyFuhh1DF37mt5ncmV4KNQlILiNljeamsFyiLEYiggwE7CX/l6xQcmcw47TpJPr+Z0Xh9OAc2lsapoF+ahXMlZ7T9nO+n9TZxjrPp4U9SWRTi6w3XtBcjztP72nEBHUpvx5+S/r5TqW69K63UTH6elH07z0oG3mioYojG7xIgRyqibVEnc9xgJ65ArF7xj1/Ek33kZo9/oeyXRE6kjdcnTobqHkhuFWRy3tevMb09/C9/oqnrQdQMK6AYbzuUJiXa5vs/j1re1EYhGIAMfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 13:22:13 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 13:22:13 +0000
Message-ID: <3a7c743c-f0e6-4d26-9672-9338ffe49830@intel.com>
Date: Wed, 16 Sep 2026 18:52:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] drm/i915: Check use_flipq in
 intel_crtc_needs_vblank_work()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
 <20260909161730.12969-3-ville.syrjala@linux.intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260909161730.12969-3-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0298.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::8) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: cd9b5e13-8704-4f7b-6936-08df13f58540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|4143699003|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 7Byr7RfzatYYYBcGFAmGjcZ/hqoqDTmZjggiCzklbMkPgRUwDe98WTW3xGdylDOQ28hJxYAD85JoS/OMj1omYOUs8JBNlWlm8nJTiFesxIHcMY9p/9EwlHOgpC4vzZ5XwNMTZHGX6WVzE+1gaXSWCni3rBe4+IX/KjB8G3VSJFGT02iEjE5fRdLTUNuiFZxzxgZeCJS49f7CgpPq4MrdxckZCK6QoRghhvky5VaZs+0nYi1mKhJB1kg0Z7gbKQFS2FlfqvyTgJoUspBRznTw2+T1oZ+nN90Tz72gQW+qREhCMGTCijW4o9bqPKp4h+L3eiy5jzaEEmSE1qS2fuASnzYHLf6BH8D2wxitX62AXePjEs9pQwZ7siXxuw94GIhyC+DoC/DyrtJKC0b97yZKICPm6QhZuQh4z6/q3BsKuU51E0hpABM1Uhr8lt+j0tTL15EahrjCD59lN1ne3xNRAmHu44pNQkgyk0XnFW5dfAcg9Ctd9bG37+foSIQcnNesw4IAugTIvI/LtxfpyLCY05SMLDORMQK/qCBTxlIMhrK3l3pym/68tUNV7lwZkaVBK7LXlBqbiEKHIJ5jqmeXrH19r3nzhPvQX7lWgwXB1X5Tx2tYRXo38isWOSgtROHqo/NAD1uXSAk6bXlRBq+derimXtLu14Cwf2a+09ZBETc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGZSemQvemNXRW40SnNFd1UvS3pNQlQyQ0JGMFM0aUVXa2tTMDAyVGZPbnZP?=
 =?utf-8?B?cFd5QnlkdjZIcVM2eVU5aWJVYXh1VWJGYm5vcU1SS25JRy9nSE1PTStXVmpB?=
 =?utf-8?B?TEUwc1lNL0dFV2V2WlhVQ3lvak9KUVE4cVZXdW9BSHpKd1ltSjZBQVNWRXZM?=
 =?utf-8?B?aFN4UXlJcUYvd2VpS1o2bE9JbXpzQ3BrcllaZllRUDdkYWJkV2RKcmpxTkkv?=
 =?utf-8?B?dVVOdCs4OEkzd21ldHl1UjlvOXY4Sk1mS1VuWElDZFdnUmVFM3NMM2dQbW40?=
 =?utf-8?B?Vit3eXBrYmRKZDdpL0RjUm5weS9RNUl3d3JMb0xyU0w0cnhMc1JVZGpuQjJo?=
 =?utf-8?B?ZmNBZXRyRng4eGVBNmd2V2V2RkthWlAzWVVpclZWQVdUdnZKeWJ1dHJJUGE3?=
 =?utf-8?B?by9nWmNmTUJoMW01UGJ1eGJmVEdoa3E3SmsvdnY4cTVlTExpNzRPa2lnMFlS?=
 =?utf-8?B?N0V5TXVHZXE3Mk1SbEF3VUlac0lkakl6bzJ6OVR5YkdpUFFjYVh5RWluK0tW?=
 =?utf-8?B?aVRyVVpVdVBLT3dRSlpZVGxUL3ZpYmRtZHNoZENvNXowejQzcGVXWUxlalFi?=
 =?utf-8?B?S0liNExPTnZNVk15VXo1aGtvekZxSzVDQ0FNNnk1ZXFCUk45RTJkVmR5bDBt?=
 =?utf-8?B?RUtIcW5iY2VNV0V2T2JLM0ZtZ2JFNTVYSG54ZzRYaUkrMW1WTnpuSklzanp0?=
 =?utf-8?B?azBUYkRYdk1jY2t4eTZ2bnd1bU9tZTJ5eWhNbG8zaVdDSDlUQ0UxMDFXQ0hJ?=
 =?utf-8?B?K21lT2JKdjBtVitUWFdZQVpKVFNpdVpwcDQrWjZjSTEwVEhyTUFTSS8wT2FF?=
 =?utf-8?B?SG5MYjY1OXFpaFRmeDFEcHJVelRwUGtsRlVjN011THdUQnc4SUY0cXhFZTFy?=
 =?utf-8?B?L21yb1czeEZXcVNEUTJaQ1ExOGxCZGJmaFphbW9ObWNBSzdXdFBuRHA3VWZu?=
 =?utf-8?B?aUtSa1d3VXpNUXUxaStHYVU1ZGIwNWtVSGdLVlhqUTFmc2x3QUNtTFZydmVB?=
 =?utf-8?B?c0tmYVhGam96R2FSUkEzVnFNcFB1SHpRZjNsNzVlQWJVR0JVQ3IzWFh0N01o?=
 =?utf-8?B?Z3ZDRFVKdXV5ak55bVJBR0M5OTRzTEhqSEF4U0pxWmdqSG5JTm12MkZDQ0kz?=
 =?utf-8?B?ZjZwM1huVDYrcGhnckRYM29abEtMeWNXVzR0cGh3QldPZlNwdGtzb3VMK1hu?=
 =?utf-8?B?QmwvZm1XMEJQTHJFM3ZZWFJRbTlUNTUweDJTMGtMK2ZHdlprWWxMRXBaWGRG?=
 =?utf-8?B?WG9oS2JpRks0UlpXNTBEOXV5QmhpOFhoWHJMZHBtS2hJa3hUUmxWa3Y5amdP?=
 =?utf-8?B?YjF2eURBMFZDUWl5SU9YaUJDOUY0V3gyRk0yYkVBSXFFWnBuOElrU2xtcjZL?=
 =?utf-8?B?eUc4S3NhNzVTSFgzb0t0SW5YYUR6UUlxTkdWdWNaMUowYnZraWtUSSt3RWkv?=
 =?utf-8?B?THZla3RUVkRDemVwaE1wTlZKRkViYUhzek5CRWpVSThIZUVZYnNEQjcvRTQ0?=
 =?utf-8?B?MHNDNi82eHpYZS95NXMwclZhTXpPOUd3eC9BWnpGNWcyR1NMQjAzTHZBVHdV?=
 =?utf-8?B?ODMzV3FhMEtWOU0yWmpyOWJIVFppMEZ5TUhBQjQwSk9qQ2NjT3psRmxTaExz?=
 =?utf-8?B?Y3J1d0c1VmlRRERIUjFYTjljNjBYOTA3Qks2YjBLZCs2OXVHaldBZCtVc2Qy?=
 =?utf-8?B?eHh6NGZHQnZ0NVJ6ei9ZUFZVOHRnSUhTRHE1RXZUVVI1ak83VUVYK2pPVC9X?=
 =?utf-8?B?Q09uUFFhSmNtanBSelg2b1pLRlR0OXFzblBiZE5tdlcwbTEvNnVHemhhMEdR?=
 =?utf-8?B?RXhIYTBGQTJIOVFGL05iamVCWjRNbUJWbHVtdFI4MGNqZXFyQWNmbnM4MXZE?=
 =?utf-8?B?UGxEN0tieXVnZHpUcENtUGhMNHVFcWE2ZWl2NXgyTHM5d0podTZHUllndFZr?=
 =?utf-8?B?emNNODhHUkxKc2pnSlphZVdRWDR6Z04xZkJhSDh3WUtqNUE5R0UxcitFbmhu?=
 =?utf-8?B?d2gwMmg3ODdvQ1NKNnRtSm5GL1duRVZnNm5YYU92L2RZTmJpUGRMNHhXay9k?=
 =?utf-8?B?QXJoZXZHSmNkeEVyenRGVFMraUJOVDJPZnFNMDE2NENrQlFSNWlwZzAyZlJ2?=
 =?utf-8?B?eEVzNzY2Vm5qZG1QemRzdU03bDgyTTJWTDNSSmZvSUNBcjllN21jNE83aDdu?=
 =?utf-8?B?RU9xbEhxODlHR2pOOWJDeE0zTlFUaFUyK3dqdWVoK0RnR2xwQnRtNC9OQ1FW?=
 =?utf-8?B?OENKZ0U3UmllQlp4ODBhU2dkekJMREFYbExmSEUzVWZaL2ovbG1jVjM1UUVZ?=
 =?utf-8?B?S251UUJEK0poaWcyY2xMVFNyOFMxQmdZZUFKVFhUazF1eUtPSW01S2ZkWmRi?=
 =?utf-8?Q?BLZuvWO8hqn2dHUI=3D?=
X-Exchange-RoutingPolicyChecked: DIrsSHrFsRfb9SV7ifG615f+kF6VUhjXiBRTPO7K3a0e7MnmNDwB6BNRB6dJPBsGQcpehlUAyuaOCBi1Zn+N7P0tfDaxKLIi9VBvTYkIgqv4gLjxvouHuw1mJ1nj6FDf0/QxthKFOeIWsx9L5ImgN2VMQK+i/yumr4tuIfEHUX4wsJgg3TBGH5QYLARXSnno4MG/OE4IrQm9Z/ZkpaUfbsKus2l2/ucFSeOG27oRHYwknHus/wZdNaA6Mu80MBmWdULv0DhgVxEg2Nv/pC90Vpzj0mO4jQdh0ElFJMdLnxvacimWSjCnGtpk2Hcan7bjf7f6KcEa2ul+Rz374zTiQw==
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9b5e13-8704-4f7b-6936-08df13f58540
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 13:22:13.6202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ok3qT2cAJk6D9yB77xc5oqYTbfylOr7uQfpcGB97wAUSlW6TYFrZBPGQE0Q/Wat42V9VMLjRgIT7OwL4Ej/ejIRKljtF99/Z4SLc3La7JXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
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



On 9/9/2026 9:47 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Check use_flipq in addition to use_dsb in
> intel_crtc_needs_vblank_work(). Currently this is never the case
> as we only use the vblank work for LUT updates, but we never
> take the flipq path when a LUT update is needed. The plan is to
> replace use_flipq/dsb with a single enum, so checking both will
> make that change clearer.
> 

LGTM.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_crtc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
> index 10ed9bdfee76..c7a85dce6aca 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -497,6 +497,7 @@ static bool intel_crtc_needs_vblank_work(const struct intel_crtc_state *crtc_sta
>   		(intel_crtc_needs_color_update(crtc_state) &&
>   		 !HAS_DOUBLE_BUFFERED_LUT(display)) &&
>   		!intel_color_uses_dsb(crtc_state) &&
> +		!crtc_state->use_flipq &&
>   		!crtc_state->use_dsb;
>   }
>   

