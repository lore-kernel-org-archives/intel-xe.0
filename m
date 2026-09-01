Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C77C61DD6
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 06:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2688C10E09A;
	Tue,  1 Sep 2026 06:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLlPEr11";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284D210E09A
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 06:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788242787; x=1819778787;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U/NOkml0EQpx0s0AQpMTlWF1GRKSXl1AoIt232cE0L0=;
 b=QLlPEr11R6CckMp0MnWMq76uT5adXn1UA2r7mMysMDPRBzCOfliPnn5S
 BjLJTkq8na/HS5S07ULtRn9HY3LkYjmP/NR6H7QV09GHWQhuLnX8Ou3y3
 UIgEZ8rd7dFQaoWjCkIxTwYjiXJfbfogOq+WwyLEJiSE8BmwcpfTArst3
 bs9Y5gXrl6DnIlr8lCVSQh6hAXEAuhLDGft06M0uK3VVDilOqKXpzeVWt
 OUS8mphoDCLx00H/vaiwxTCkLoWB1P8AeJBhoAf3C3j5mVTkZ5ixyS1/z
 JAOnCNXfOcdppGdqhF898vKPaX+ejK/KCpCPNm4x8uV7q4n7kZCcG50oR w==;
X-CSE-ConnectionGUID: 1qRcvPF0QSOez0J/A2yaJA==
X-CSE-MsgGUID: F+En4MOtQpifbFKU+m7ONA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="91173256"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="91173256"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 23:06:27 -0700
X-CSE-ConnectionGUID: yYjseal3SgqzbpQrbAv3HQ==
X-CSE-MsgGUID: q29T5S5ORQedoLgylNpu6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="267676038"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 23:06:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 23:06:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 23:06:25 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 23:06:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/3ke8To7A9mGibSDENNhHrH/+m1PcFCpyZ5ROvVp5kRPiG24pNmTXy5pgG/APu8x7RXOYhZmxizoPz6EQwY6gabst95w4e8fNaahDt+tFQi4ibnGG+KFEAK4S+1vBHDjAy1d0WtrsqSDSstm9gAnv19ut5GNks3yTip71rcNmwSRbpy6X5Sv3xlQM2+pS4fZZ3al/UDuviTaeTqABoEfkwKPuUbdZ/7IYlAsMZKlWoZatH2nkK8LvX/Dx7SN2auicPCSlJFk03VmUkDuxWL7ZP8wTDTTDCeue353kY9Sgfx6/tMiO7scyV2efv/IAADDEUaN/3nKf/nhTvphLDh7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSPk2v1tg03GBBYEvOY5wVal55vmeGrd6Qes7FYShqY=;
 b=CaM/vcSImPMyhwo6BBELtd+3swBlUP0dMdLkAWjMGBfGJ4VjVMe5uAzahmZUAZMUwq5GZELsGv0m91EeKPtkyHah2HL1aWg7pGh+u89acAnHo1/4OjhJcifDBpFIZlU9DaJZBy2ZnXugMzx0Gvua/gYUVa6/KL5VqHFRPiciUTYpIhrORlDYJLk/KR0+ASfri/C7huE1UBK2kXAdmYdEEEaowvsXAYA4CprLob5Rk3EYSbgRlS6bRxqsfZfns/jqPUHotL0RF3pDR8V4m3k2DuUMYWj0R3R2H0fMfNC3p7f21C2jhIXHUnKU+ja0p8R6Pn3Es03sb7a5aU7+R84ibA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by IA4PR11MB9201.namprd11.prod.outlook.com (2603:10b6:208:561::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 06:06:23 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 06:06:23 +0000
Message-ID: <b106d161-a6b9-4742-a447-be786619252c@intel.com>
Date: Tue, 1 Sep 2026 11:36:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/xe/hwmon: expose pwm[1-3]
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-5-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260717041757.2759084-5-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0300.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::13) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|IA4PR11MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: 4600fd51-6c04-4deb-d142-08df07ef2677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: +uzYNrSjknVFKqGYk+7pCQQxjWKxyFu7UX9KE+QEtbSIj+57MYloSetudkfpUoSVLLAFc0Ec1ly2AjI6w6cTFe/xBpLq9xKTiMoeD+g0MNvQRAVyugDeWtUezRXa9KwUhcdzYhJRcC8xkW7uDM12nxbSFCI4JKIQxGkKOeJGRUc1Km7hR1FO54zEvSFcyMwqoFJUwZ0j+XHPK2Aor0lD/8VllpYtAETDKf1nkYtWEp/zwn7uKI8angW22fkcljIyH+e062e4lxo4z6ryCJ6TS3bB2MYHNoj0bfKuJhbVTcowlkxqM5WRjdhpp1r0dJKdrnXbDtiriBKGjEXKFrNHoFiuVbuQgtDLoYWpsKjzeW9dSM2YusqIJRyClCEQ/9HdxuXF9U0Jq2sP3HnHhV1myJf++mDU3rKrk+a5d5LOHF8Vg9Deb0ir+sqZnPbbOmo11gQQnADRK4GkrJAGa/I/GfEcdKkSfvIE9PkeZksu3dhYtpEoZ1SOj7/yB5n5wIDQKZjXQFc0UJhBl1jcdaAryiJnzQgH9UH7rPlLgxgBD/mUFqyOiEdsnCbPmoAKPAcpZ2aMpJupD4SUNKLTRd9EbX9y9Y7t2sNg8PEvaIwvTw7eKh2Mj4p0geiQ+zMh0nk7hjRkzz+tLgIndiG13H91cDnKsR9NNBf1clVo+Kvq/Mk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUg1cS84UE9SMFRta2p4b29SUll3b3RDR3h2by8xV25wMkhIeUJwcUpZWEN5?=
 =?utf-8?B?dlpwTncvMDJvVEVLd2cycUJON3pSQkRYeHI4YUpYRnprNlV3MFlGekVhMm9l?=
 =?utf-8?B?cHNobUNxeVRJNlJHMUlmcVk0eEVyVE5BRUlIZDNGM0FnZHJLZ1dhUUJ0V1dV?=
 =?utf-8?B?MUlQeW1UQmJMbzc0OXpLQldtN3N6UFNpdlBQcEZ6RGI1MW1CUVYxVkVUY1Q1?=
 =?utf-8?B?VE9IdnQrR1dabDh4dzl2YzVtdTg1SldCUXNDeXIvcnY1R0tDMnNjWG9YcTAr?=
 =?utf-8?B?b1U1REpnZUlLbkVvSnBVY01zU3NzNEY2aGZ4b2oxcTBLc1VLMzRsc21NM0ZE?=
 =?utf-8?B?MThoWm1NQXUrR0RuVmZMWVN0L0VSMEtiVEIyazZEZnVoVmtDa3MzY2s5Wk9o?=
 =?utf-8?B?NGRmKy9yNnhUTzZ6dVdJNUcyTW5rQmFnemhIankrcW81Z1NGa29hUXZhM2dr?=
 =?utf-8?B?M2JaTjhHUjBZWDJTaW1sZTQzY2pvNVlqcjZ1bnowR05BVUZyUzRLMTkxdklG?=
 =?utf-8?B?b21xeFh2VkUyL3B0OHRvWWlvM0xTM3I1S2JkZElDZnRCWmdBWjZJYkNwOFov?=
 =?utf-8?B?N1Z5bnM4RjJUSHlRYXkvY1MwMFl3Z1NCeGJCa0VWZFVETjZGaER6ejNWdGhi?=
 =?utf-8?B?MjJOMWxwRjllNERkUG55SFRJdkJ0SXF4dWVtYVpuSW1NYjh6b2NIb1V1akN1?=
 =?utf-8?B?dVA4anVTR0pyd09JS2VJbzJuTlh0c1ZKemNtM2ltcHBESS92dERZSEw4SEIx?=
 =?utf-8?B?YjF1dXdMWUNyRzE4V09NaUxzbGk0OTRKWm9LMW5UTFNVeVI2OU5jaTNRTThx?=
 =?utf-8?B?S2crdFZoSDFBVjRiYWU5bXowcnpVem5ZZ3RpY1JmU0ZhQklkeTJNYkY2Q2pu?=
 =?utf-8?B?OEwxRitUSWlhbm5tTGRCbzJaV2JSNERteFRHejJTd0hOY1k3SEdic0p2OURC?=
 =?utf-8?B?dGQ4Q1JLN0E5K2hMMWt6ZTZqa1ZRREdsSVVGRUczd1dhejBQSlVGOXFNYWEy?=
 =?utf-8?B?VVFXUGNHMFBrVHJ3dk1oZkpsT05USlFUT0tEZTRKTXg2U3k0bXN6K2xiekxU?=
 =?utf-8?B?RytLNmgveGx4T01KT1FSNTR2U1pNZ3JpdzFkRm1oQVJ5UWdXdEI4dWdnQy84?=
 =?utf-8?B?dEpYRXdGTXNQTHpjQjRVRUJvRm54V2ttUmxVcXZnaDdGQ013MDNBR0d1ZHQ4?=
 =?utf-8?B?L1hZcUd2b2xXcCtZSm1CeG5YaUxFN0NXR3pEV1U5WFVzT2pQdVoxUTFTeHhm?=
 =?utf-8?B?ZTBjSElwaUpEM2dtdmx2YWRoVklaZXBLbW9EUk9nQ01rNVU3bWM5SGJJck85?=
 =?utf-8?B?TFFLaVc1NTh6enk4NzEweGpWVkU1b09nVkQwdDQxN1VEZHg4eklrQ21wN3NH?=
 =?utf-8?B?WUd2aWdOUEd5ZlZvbTllVEtwUFJEVXp4bUZlQytNb1poQUFEZUdZb2ljdEVu?=
 =?utf-8?B?QzNBaEFCYjZtNFh0cjJxVlZqUW50c1JQVHhoSnJWUTRlbUF4emRQdzFpbUNm?=
 =?utf-8?B?WmJzZ1hiRUxUME16MllvbUp3VzFDdUdXQ3ZLMzc0YW1UTkxvK1NrVnZtWHBY?=
 =?utf-8?B?aFlzdnlOYWZFb1RJbjJYZXFDQ2d4aU9UUzVwazRjeXkwMlp3U3dTWnhmbDZh?=
 =?utf-8?B?UXFwa0ZoU3ArT2VDOU9OUytJL3dJeHZLT093dFcvSzZldE54SzJuVm1YTkpO?=
 =?utf-8?B?SklDVmt6akZrcGpONElpM3VCSytQWkdoRkJGbFJhZ3h1NDJZeW11TGU1S3lM?=
 =?utf-8?B?VTljdjJ5U3FtYnhQMFJWVndoVm0raXZiOHhOaEZqSStocGRGMWhtS09rMVZL?=
 =?utf-8?B?cnF4L2thOFJFY3FuR3JVMFRQMmlpSzIrT1VRZjJrSEVzdC9NRjRrOHYyanIw?=
 =?utf-8?B?ZExaWFZwNDhXa0w1blVucUlFbWdEdytDQ1lYL2RsQjA2cEVINm4yZEx0bGFO?=
 =?utf-8?B?bTNRYis1VmJYUkljTTlZNVoxeFlMU0dGRFpaNGw5VmJjNmVvRkJJdVlxdGpL?=
 =?utf-8?B?Z2VPTlhEVE1xRkRuU2E3bkFsTmNLSWVEWi9QMHE0anFodU9aVmlMdHVRcFhk?=
 =?utf-8?B?ZW9VZkQrZTR5a3JuaGNSSWpHZi9QWWRic2JmWkJIdmRETkltM3Z0N01OQ1pJ?=
 =?utf-8?B?cEljYTRUZEovc2dzeU1KeUZzVVByd2JxSzJpeEdQSFVwdnRCOERXQkFJdmFE?=
 =?utf-8?B?dUVpbzJZdGJOcE9nNlJtK21NV0g3UWJSTjcralBHTUZhQkRBdHJsRlhWMWtL?=
 =?utf-8?B?RlZ0T3RsOGFqUjVNRDB1WTV0Vm50bVU1czgxcWk1OFFoTW1FRTZ6bkwvQXNR?=
 =?utf-8?B?N25lSGIrcEw0YWlnYm13aWZJMWYzOEptR1loT3dFdW0zK1h0Qy9aQkgxQmdv?=
 =?utf-8?Q?iWu2OWXhEW9CDnsg=3D?=
X-Exchange-RoutingPolicyChecked: lUFnOWd28g7Izws10Orps8dIeRQ2r0zdFCVPW+Q7FOwIddFUGAjD9wXD/jfG/+tqG+19xQ3+DjcgPG9zRXD4d3BE1hPSKS14/Y30P07RWzd0hy6FqrjNvFrnw58W0BnBVODY5hj4lfIoRj1jqTFqFKk+cjE2unB/31kGipBwdG9yyqn6DsRxuQEi2ypZcRhxBKnHWmoz+ZPZAyqUWKVreZvJ0SvyMlDpl8ou0gKvKAmYXXuoBaAakP0T81a9A8pw0/vyyUAEzXv1X867ndDMvL7K0T1gEbf/19nm6ApqVm+LjUwcCcfb76V/bvmsyjWpRU47aaH+OZUQTbnv6NV7jA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4600fd51-6c04-4deb-d142-08df07ef2677
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 06:06:23.5462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHWLR9IuGwAIqj6d3je/qLzlmvEcaiP0zQvR6SqiAzaHssbziZt7cm7QgAgyLYzUzhToeWof/uZ+gpfjjCgXew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9201
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

Hi Karthik,

On 17-07-2026 09:47, Karthik Poosa wrote:
> Expose pwm[1-3] fan duty attributes through hwmon.
>
> This enables reading and writing user PWM values (0..255) for each
> available fan channel.
>
> Update Xe hwmon ABI documentation for pwm[1-3].
>
> This sysfs node can be used for manual control of fan speed,
> irrespective of fan curve.
>
> v2:
>   - Use xe helpers for dmesg logs.
>   - Avoid use hwmon->num_fans to get fan count in xe_hwmon_pwm_is_visible().
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: Codex:gpt-5-4
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   9 +
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 230 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
>   3 files changed, 242 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index ec0b94d76e22..7383898890aa 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -321,3 +321,12 @@ Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
>   		milliseconds over which sustained power is averaged.
>   
>   		Only supported for particular Intel Xe graphics platforms.
> +
> +What:           /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]
> +Date:           July 2026
> +KernelVersion:  7.2
> +Contact:        intel-xe@lists.freedesktop.org
> +Description:    RW. Target fan PWM duty value in the range 0..255. 0 is zero
> +                fan speed and 255 is 100% fan speed.

Does zero fan speed means complete stop ? Or will it clamped up to the 
firmware-reported min_pwm ?

And does the write only succeeds when pwm_enable == 1 ? if so, kindly 
also mention the same in the doc.

Thanks,
Soham

> +
> +                Only supported for particular Intel Xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 769f4d1da83e..d3379727b1a9 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -803,6 +803,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
>   	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
>   			   HWMON_F_INPUT | HWMON_F_MAX),
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT),
>   	NULL
>   };
>   
> @@ -928,6 +929,158 @@ static int xe_hwmon_get_num_fans(const struct xe_hwmon *hwmon, u32 *num_fans)
>   	return 0;
>   }
>   
> +static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *point_count,
> +					int table_type)
> +{
> +	int ret;
> +
> +	ret = xe_hwmon_pcode_read_fan_control(hwmon,
> +					      (table_type == USER_FAN_TABLE) ?
> +					      FSC_READ_USER_FAN_CONTROL_POINTS :
> +					      FSC_READ_STOCK_FAN_CONTROL_POINTS,
> +					      fan, point_count);
> +	if (ret) {
> +		xe_err(hwmon->xe, "failed to read fan %d %s point count, ret=%d\n", fan,
> +		       (table_type == USER_FAN_TABLE) ? "user" : "stock", ret);
> +		return ret;
> +	}
> +
> +	xe_dbg(hwmon->xe, "fan %d %s point count read as %u\n", fan,
> +	       (table_type == USER_FAN_TABLE) ? "user" : "stock", *point_count);
> +
> +	return 0;
> +}
> +
> +static int xe_hwmon_write_user_fan_point(struct xe_hwmon *hwmon, u8 fan, u8 point, u8 temp,
> +					 u8 speed)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	u16 user_fcp_raw = FIELD_PREP(FAN_CONTROL_POINT_TEMP_MASK, temp) |
> +			 FIELD_PREP(FAN_CONTROL_POINT_SPEED_MASK, speed);
> +	int ret;
> +
> +	ret = xe_pcode_write_timeout(root_tile,
> +				     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_FAN_TABLE, fan),
> +				    (u32)user_fcp_raw, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
> +	if (ret)
> +		xe_dbg(hwmon->xe,
> +		       "failed to write fan %d user point %d temp %u, speed %u %%, ret=%d\n",
> +		       fan, point, temp, speed, ret);
> +
> +	return ret;
> +}
> +
> +static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
> +					    bool is_full_speed, enum fan_table_type table_source)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> +	u32 point_count;
> +	int ret;
> +	int point;
> +	struct fan_table *source_table = &fi->fan_table[table_source];
> +
> +	xe_dbg(hwmon->xe, "activating fan %d user table from %s table\n", fan,
> +	       (table_source == USER_FAN_TABLE) ? "user" : "stock");
> +
> +	point_count = source_table->fan_control_point_count;
> +
> +	if (!point_count) {
> +		xe_err(hwmon->xe,
> +		       "fan %d %s table point count is 0, cannot activate user table\n", fan,
> +		       (table_source == USER_FAN_TABLE) ? "user" : "stock");
> +		return -ENODATA;
> +	}
> +
> +	for (point = 0; point < point_count; point++) {
> +		u8 temp = source_table->fcp[point].temp;
> +		u8 speed = is_full_speed ? 100 : max_t(u8, source_table->fcp[point].speed,
> +					    min_t(u32, fi->min_pwm, U8_MAX));
> +
> +		ret = xe_hwmon_write_user_fan_point(hwmon, fan, point, temp, speed);
> +		if (ret)
> +			return ret;
> +
> +		if (table_source == STOCK_FAN_TABLE) {
> +			/* Update user table cache with stock table values */
> +			fi->fan_table[USER_FAN_TABLE].fcp[point].temp = temp;
> +			fi->fan_table[USER_FAN_TABLE].fcp[point].speed = speed;
> +		}
> +		if (is_full_speed)
> +			fi->fan_table[USER_FAN_TABLE].fcp[point].speed = speed;
> +	}
> +
> +	ret = xe_pcode_write_timeout(root_tile,
> +				     PCODE_MBOX(FAN_SPEED_CONTROL,
> +						FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan),
> +				     point_count, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
> +	if (ret) {
> +		xe_dbg(hwmon->xe, "failed to write fan %d user table, ret=%d\n", fan, ret);
> +		return ret;
> +	}
> +
> +	/* Verify if all the user points are set */
> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
> +	if (ret) {
> +		xe_err(hwmon->xe,
> +		       "failed to read fan %d user table point count, ret=%d\n", fan, ret);
> +		return ret;
> +	}
> +	if (point_count != source_table->fan_control_point_count) {
> +		xe_err(hwmon->xe, "fan %d user table point count mismatch, expected %u, got %u\n",
> +		       fan, source_table->fan_control_point_count, point_count);
> +		return -EIO;
> +	}
> +
> +	fi->fan_table[USER_FAN_TABLE].fan_control_point_count = point_count;
> +
> +	return 0;
> +}
> +
> +static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> +	u32 point_count = fi->fan_table[USER_FAN_TABLE].fan_control_point_count;
> +	u8 clamped_pwm;
> +	int ret;
> +	int point;
> +
> +	/* Read user table fan point count, if it is not set, activate the user table */
> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
> +	if (ret)
> +		return ret;
> +
> +	if (!point_count) {
> +		xe_dbg(hwmon->xe, "fan %d user table not set, activating it\n", fan);
> +		ret = xe_hwmon_activate_user_fan_table(hwmon, fan, false, STOCK_FAN_TABLE);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	pwm = DIV_ROUND_CLOSEST(pwm * 100, U8_MAX);
> +	clamped_pwm = max_t(u8, pwm, min_t(u32, fi->min_pwm, U8_MAX));
> +
> +	for (point = 0; point < point_count; point++) {
> +		u8 temp = fi->fan_table[USER_FAN_TABLE].fcp[point].temp;
> +
> +		ret = xe_hwmon_write_user_fan_point(hwmon, fan, point, temp, clamped_pwm);
> +		if (ret)
> +			return ret;
> +
> +		fi->fan_table[USER_FAN_TABLE].fcp[point].speed = clamped_pwm;
> +	}
> +
> +	ret = xe_pcode_write(root_tile,
> +			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan),
> +			     point_count);
> +	if (ret) {
> +		xe_dbg(hwmon->xe, "failed to update fan %d user table count, ret=%d\n", fan, ret);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
>   static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>   {
>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> @@ -1424,6 +1577,20 @@ xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   	}
>   }
>   
> +static umode_t
> +xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> +{
> +	if (!hwmon->xe->info.has_fan_control || channel >= hwmon->num_fans)
> +		return 0;
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
>   static int
>   xe_hwmon_fan_input_read(struct xe_hwmon *hwmon, int channel, long *val)
>   {
> @@ -1478,6 +1645,62 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   	}
>   }
>   
> +static int
> +xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
> +{
> +	struct xe_hwmon_fan_info *fi;
> +	int ret = 0;
> +
> +	if (channel < 0 || channel >= FAN_MAX)
> +		return -EINVAL;
> +
> +	fi = &hwmon->fi[channel];
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		/* Check if user fan table is set else activate it.*/
> +		if (!fi->fan_table[USER_FAN_TABLE].fan_control_point_count) {
> +			xe_dbg(hwmon->xe, "fan %d user table not set, activating it\n", channel);
> +			ret = xe_hwmon_activate_user_fan_table(hwmon, channel, false,
> +							       STOCK_FAN_TABLE);
> +			if (ret)
> +				return ret;
> +		}
> +		*val = DIV_ROUND_CLOSEST(fi->fan_table[USER_FAN_TABLE].fcp[0].speed *
> +						U8_MAX,	100);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int
> +xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
> +{
> +	int ret = 0;
> +
> +	if (channel < 0 || channel >= FAN_MAX)
> +		return -EINVAL;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		if (val < 0 || val > U8_MAX) {
> +			ret = -EINVAL;
> +			break;
> +		}
> +		ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val);
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret;
> +}
> +
>   static umode_t
>   xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   		    u32 attr, int channel)
> @@ -1504,6 +1727,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	case hwmon_fan:
>   		ret = xe_hwmon_fan_is_visible(hwmon, attr, channel);
>   		break;
> +	case hwmon_pwm:
> +		ret = xe_hwmon_pwm_is_visible(hwmon, attr, channel);
> +		break;
>   	default:
>   		ret = 0;
>   		break;
> @@ -1533,6 +1759,8 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		return xe_hwmon_energy_read(hwmon, attr, channel, val);
>   	case hwmon_fan:
>   		return xe_hwmon_fan_read(hwmon, attr, channel, val);
> +	case hwmon_pwm:
> +		return xe_hwmon_pwm_read(hwmon, attr, channel, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -1551,6 +1779,8 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		return xe_hwmon_power_write(hwmon, attr, channel, val);
>   	case hwmon_curr:
>   		return xe_hwmon_curr_write(hwmon, attr, channel, val);
> +	case hwmon_pwm:
> +		return xe_hwmon_pwm_write(hwmon, attr, channel, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 419ab4f416fa..5c5fdc650a97 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -84,9 +84,12 @@
>   #define     PCODE_MBOX_DOMAIN_HBM		0x2
>   
>   #define   FAN_SPEED_CONTROL			0x7D
> +#define     FSC_WRITE_NUM_FAN_CONTROL_POINTS	0x0
> +#define     FSC_WRITE_FAN_TABLE			0x1
>   #define     FSC_READ_MAX_FAN_RPS        0x3
>   #define     FSC_READ_NUM_FANS			0x4
>   #define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
> +#define     FSC_READ_USER_FAN_CONTROL_POINTS	0x6
>   #define     FSC_READ_FAN_TABLE			0x7
>   #define     FAN_CONTROL_POINT_TEMP_MASK		REG_GENMASK(7, 0)
>   #define     FAN_CONTROL_POINT_SPEED_MASK	REG_GENMASK(15, 8)
