Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F177C5B56A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 13:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8ADC10E0A5;
	Tue, 11 Aug 2026 13:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMv1vlS+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC7A10E0A5
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 13:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786453920; x=1817989920;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ztl0OrT75IILxFTJtww4OgGVQlC3r7ZIoyt5daJrbUw=;
 b=GMv1vlS+ZdNd+9GBNYRrDEvcbyuNW1JKHIhqJgtfpKrROYW4ZMhj40g3
 RH8mlRStNBWD6tLJQHXDoqgysYOdojlo4LRzPVcEXBmJftriJwQ6zqPEV
 QuELjm7cje1FbAqUWnBtEMXqzjiph/QFVzjtjRg8n7g7pyN087B64NTZk
 1Sv0yldUwaAwAM6CNNjeF5U0kgZtinnSS76UHxf10A9taqohxmwdxDu1w
 Xs6xNQi6A8c3TBkl36dKavt1lZLgRN34qxpTL+AWPN43NqEaJYiXw3AAj
 aCYEFstt0p/UsDFQJnMHDY6uhMn1PbLkLeqX7vgHKIQnCVC1MTwUOkVh1 A==;
X-CSE-ConnectionGUID: /FujoA34QTi5rf5E0Z6pnA==
X-CSE-MsgGUID: o+/OCakcQ8OJHRQrZZcMEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="109773069"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="109773069"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 06:11:51 -0700
X-CSE-ConnectionGUID: 232IIq8fSeO76xCrPEYkTg==
X-CSE-MsgGUID: Kdawxw1ySdesbdPkyBGeNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="257125565"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 06:11:49 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 06:11:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 06:11:48 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 06:11:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nv8xLMbj1U0WV5+bdpZiwEvMuoxk8YLnSNbnsj0zLdVZn/P3qolWyOsNWKIWj4jFKikFK7PrAMDfThs78d8/fgiP9wU2m/BHgULibj64gAirCf6zDTPSl3IsqBCVZ8wIdszdsZUd3DIWCqqo4YwkIdg1r7lXUHG8ubZjC60LcrTotqyaddZGhRS53SlKd3Ngb8WocEHBCcPARn1KNvW+EGB0MDaEhR5UkcyH3LF05Z9T0bSPcgUVpSKXI6sTzDEtmlI5rRfMDljpMSJskcRCJieUIABtZPAB/wiRxhhbT8qHgco0tNkoq9rdKu5/MLRBPq8P0iFIpoxmvRbUlKVK9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q97j8/YV7dFq8oq7BeC2SSBjoUoSDwW2fkINfPZxVHE=;
 b=soE991iidpBaTLXzXBjUTbyysyo308hlB/S4kPLqzqMMMdWf3ijQjQbXxUqINp1G/HQWNlAwYuwfw+XHKes258WPg4a2LGKVmepHiMf6a+lEeTtwxF4oQhtgzzmC3H5EzbMeS3GioZydGagoMp3GCUAtbH8nwLhOA6+20Nt9sct249/zZPdZfy8EadbwAxM8XljhCreMoSUb3HuQ5C0ySw7MIJFbsa959nvJt0mLMnjINfJUM/5bQUQZcjBbZZJGEDXbl4+b9QoorZTdTDNdELfXPnpA2xCsHxr40l2pGLROXrEiAqIDubiTgi9KBrjG8nGsyYdRELLrysaN3jTaEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by PH0PR11MB4790.namprd11.prod.outlook.com (2603:10b6:510:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 13:11:46 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 13:11:46 +0000
Message-ID: <b44b489c-78df-4273-968b-49d3f80bd4e3@intel.com>
Date: Tue, 11 Aug 2026 18:41:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] drm/xe/hwmon: initialize fan-control backend and
 table cache
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>, <sk.anirban@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-3-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260717041757.2759084-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::7) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|PH0PR11MB4790:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d06e652-660a-42ff-a137-08def7aa18d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|4143699003|3023799007|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: vsj6daMVI3FzcGnOQU6j4CxTwQEQcgmP3euhHMIukPfypceuHXOpPnDIQ0jfe+0HMbmlpOaP/ZhNlMw2P0lMZoht+gceiic83/d0mah9AT1JQ48YT66Ye4Z3lrgzvmLzy9waVxXX1OJ30AIdVe9sUenz1hO2r+REpJd1niIVc/2MYsjft/aHUrK8AsKGrJ/eXCd6SXIe7ky15uYz8ZQSQEdt9EkcTQEz1iiyCQHo2J+d4xZg1wTla/1qmt+/HA/PzdH4EYGkA229/UCzorUCSduoUoaJwmmkzo3TChtLUPdtsi1T6JJEtnqMDYVhBdJ25JScrA3950o460IfCBt845t0zfUo61fhltL6q0UTm76zUtxOlYAk+70E9ORTJsN0yxvlLfxkLO+px7bCGWUx+TFfTY7dUuSBAzXjqgPyBiw0FS+MjunA71CXBTfykxLhP0woGoWY2JpW1TZV/FeBj4QSVn87JGiyHuBvB5OCvH+HfRzLbMmguDYTE18AfnsmkkKCuXQCdz6L/cXjCpyJMu3x7a1hFpaLoWIocvzkjm2TgNIE+Ik6MWxp6uhONaiqDlXRVQ3Kl+cBrKS3SV7lJIcnfXgus63ZwndGAGXEmVWbLvx8Dq8grbL0/QsO7aAJkfvqlo5mrv2h1/ttY1vHRISqocf95dUClEsI0ehFr7Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(3023799007)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFNFa0hxQTIzTmY3cXpZcnpwaVlYTCsvem42RE1maCtBSjVJOEh4KzVXWUNC?=
 =?utf-8?B?ZFZFOG1QbWFoN0h1MERMdU5TWkdDMFF1bHRtb1ArdkZlVTg5K3VsOWMwcHcy?=
 =?utf-8?B?WjVmcDV1UEU2TnBxaGE2dmVpQ0FmcnNObUpicjFUcG92YUdmeEZoUWJ0aWdB?=
 =?utf-8?B?WGMwT05OMUQ5bjl0bTFoYkZ4bkwvWHJoRVZjdWpPUjNxT1ljZ09WMjM4eFFp?=
 =?utf-8?B?cStWaFpNVDBIWWRUQ0NxT0VpQml3RVMxdFAzNkpSOWhFRGs5UGE4ZGV3VzZB?=
 =?utf-8?B?dTZwN1ZaWklzNXZJbGh6SlVjbW5ZMmcvNS9Yb09sb2Vlem4xZllLNjU5Vnhz?=
 =?utf-8?B?eWRhVDJqVnNlZUlYRlNRKy9hcFFkc28wM1d4TldBRXZHT2tCSGVtOHhGUGtC?=
 =?utf-8?B?MWNlUVdFMmo1MWlqdXI2YkxrYVBnMklTQm1IWlR2aDdIK21tSEF1NFFzMldq?=
 =?utf-8?B?RUs1VDJiQ3FvaHZHeE9SMFRZb0d1clRwRGs3OCsrUDdwclNwVENoWk9zQXd0?=
 =?utf-8?B?ZTByNnMyOU55QUprLzJVdExneStSUWV5RjlvRTFTY0RGNFhpWTA2S2g2SHZO?=
 =?utf-8?B?Y3dVRm5DQ0VkZUlWckhkQW8rSXViNytJeU9McWZGSml5YXV4SmF6eGEwdVdB?=
 =?utf-8?B?SDl6SVpNL0xqMEs5N0wrK00wWGN0L1RBbFRVQU1yblduWkVlWGRZWThnUXZm?=
 =?utf-8?B?UHkyRFpGN2ZaMURSVGVWbHJqbG92eFhqZTk5TnYycVA3bWZWWjZoSE80OGJj?=
 =?utf-8?B?bVdRaEJFNGlzSnBvYm5YdGtqQUl2UW42SWVkQUlCa3ZEeG11U3VZMVF2U0gw?=
 =?utf-8?B?ZVVNRWNYekthd3RoSmZJUUpjWlpEYTJaSFZhdU9tc2ZzYTdJY0V0bmpRK2Vo?=
 =?utf-8?B?aEFVQVdwaVQrcmtPMnNuV2RFY21hZy9LRDNzTERPWXAwNitjUVdINDh3VmZs?=
 =?utf-8?B?WjZieWp4ckxZZmovZzhCc0tVSVIxVS9tdXg2Z0NVK0NoQ2RGNEJMdm4rNW54?=
 =?utf-8?B?M1pkeElCNVp3eXp2YllwNGdrZmRQaHF2ZERWUmdPekdrUWhCemtTL1V1KzFH?=
 =?utf-8?B?OUJTYjhvUWdUS2p5a3ZIZXRMcVJUZEtCMmFHaWJ3Ym85clVtaEZPSDQyaDNP?=
 =?utf-8?B?bGUwaFo3QkVaaHRDb0I3WnFTL1dZMTVlY1hvUzhHY0N6Tm44Y2F5SGVHSEls?=
 =?utf-8?B?QzJ2dWJvVVlFSVZtVW9ZcXB4di83d0FTSjJFb3djZ2NqUlNCWVV5VUVyOFlk?=
 =?utf-8?B?LzhHZHkrZFF3di90dDRDSTNCZEtJallpRTJKU3U5MHhnWDFLeksxK2ZyM2RE?=
 =?utf-8?B?ZDhkY1ozUWFZZjNDTlRuWVRSNmJ2eExrTkp4OThQSHY0TDgzN1UrZXU4THU5?=
 =?utf-8?B?ZEpaMjFvWVVNMzYxQnl2WEpZWDM4d3A2Y0ZXaVdWNWU5bFh5eldtYVBrd1Bk?=
 =?utf-8?B?VDM2YlEvRklBdy9vaHZXcnV2NmVkVHNiTTUzYmRwQ0NUU3RFaHhwSUpCejFC?=
 =?utf-8?B?S1FBUS9TV1dTRGNlc1FSTnBwL05mYjZac0VISUVyc3YrbUFFNSs3NG1ISmw0?=
 =?utf-8?B?VlpYeVpCMWJDNXM4M3ZGS0gxbmxXR1ZzRFAxM2VCUktKTk50MTl5cVJmL1FL?=
 =?utf-8?B?NEcrQWNRZVRHQ2QyS2h5ZUs5NjhzalduTnFSQ0FKbXpOc1lYdUlucXlNZ2tD?=
 =?utf-8?B?ejYzTUM4NW0wUER4cGkvWkJvZkpZWGkxNU00ZmJWOTRVQ1FnNUpvQ0lwQWhr?=
 =?utf-8?B?Wnc5Z1ZDSnJTWG1DRGtTa09kL3dpVDcrRElqWWdTbEZYaHlDU3VRaHRqUHBU?=
 =?utf-8?B?Yy80OEhqZHhIWHdqK2lBUmloUmNzd1BoZll3d1BrbjdsZG5WZStWSWJEL1M1?=
 =?utf-8?B?ajU0V0N1bjkraFRlNHZIWkR1aDREdmJwT2c3R2IvWGt6dkcvVXNwSmZqM0J5?=
 =?utf-8?B?REZDYWR5VG51MC9pM054NWNPdFNic1dJbVpkUHV2MU1CYzlud3ZlelMwd1Jt?=
 =?utf-8?B?TVRCQ1FvRmY5Z1BEaDZmanUzRkZtUnoyOWJlRHRUVUh3SVFpOGlIS2dpcmE4?=
 =?utf-8?B?T0dLeXpQYkRKV25KNkVEMWpKY21zMUxSbTArdnd0TlhwZ3hvMm5Vb0p2U0Zy?=
 =?utf-8?B?R3NIMTRCVFFuRlp3WWdaTVZjei9HeHVHUWZhWHR4OTVpaWNFckxwZDkzMnNu?=
 =?utf-8?B?TXFrTXhzc3RMUGdPSmE3V1dsN25YaUQ4YXF3WSt5VUl2RllORE5FUXBpbkVX?=
 =?utf-8?B?WkQwTHU4elJzOXNVTm1yOS9iaXlUa3lwcllyaVFVTWtlcENKNWxtWVFlRlUr?=
 =?utf-8?B?cVE0ZFBQbUphRmtySFpIaDcxTHhFTllMTUE0Y1JLNHpydW1kbW4xUT09?=
X-Exchange-RoutingPolicyChecked: Aw0l5Zxlx1ruo83oUIcyKj0h6ZnpaizEInXxYQ++D45max3/InLh9orkAH4HrQIblXt9lvDeMIrdzUhR89g2+j1N4MSXv/4vHKj7//eC1YaPrQHR9GZ3gJvNWPOJrzR+1Iy8LJmnWAURoAX9rdVuKycOJ0D8mrW6DN2cs4nadlNFM9FhDhffiSo1XlJxw4WjFIEt26FhKkmihlb/FI0Tzw+B0eWVpZWDxh4QNmDOOZVvAP7u1fWW3BuUouKnwJdk1vK97seNr7RMOJXHEJVC6kk+LxXPmzBjhqa0n8NFfBa8qMRjJUh1hKqukrn1PeU65S8eJrPqnZbHqW1MOJGg9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d06e652-660a-42ff-a137-08def7aa18d6
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:11:46.8622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hbcD72FeOeIMH7gDldy6u1742HxEjnDb42DJGgEKku+ngoKgLk/3KumsXPa39pJ3QQUzhvodKW+6x1XcKqsEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4790
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


On 17-07-2026 09:47, Karthik Poosa wrote:
> Initialize Xe hwmon fan-control support by detecting fan count,
> reading stock fan control points and min PWM.
>
> v2:
>   - Avoid user table initialization during probe. (Badal)
>   - Move unused code to appropriate patches.
>   - Use xe helpers for dmesg logs.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: Codex:gpt-5-4
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c     | 159 +++++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_pcode_api.h |   5 +
>   2 files changed, 149 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index de3f2aeffc3f..0a416e3e7b8c 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -20,6 +20,7 @@
>   #include "xe_pcode_api.h"
>   #include "xe_sriov.h"
>   #include "xe_pm.h"
> +#include "xe_printk.h"
>   #include "xe_vsec.h"
>   #include "regs/xe_pmt.h"
>   
> @@ -122,14 +123,50 @@ struct xe_hwmon_energy_info {
>   	long accum_energy;
>   };
>   
> +enum fan_table_type {
> +	/** @STOCK_FAN_TABLE: firmware-provided fan table */
> +	STOCK_FAN_TABLE,
> +	/** @USER_FAN_TABLE: user fan table written through sysfs */
> +	USER_FAN_TABLE,
> +	/** @FAN_TABLE_MAX: number of fan table slots tracked per fan */
> +	FAN_TABLE_MAX,
> +};
> +
> +/* Maximum number of fan control points supported by each fan */
> +#define MAX_FAN_CONTROL_POINTS	(10)
> +
> +/* Fan control point index: bit31 selects fan table type; bits30:0 control point index */
> +#define FCP_INDEX(FAN_TABLE_TYPE, POINT_NUM) (((FAN_TABLE_TYPE) << 31) | \
> +						((POINT_NUM) & REG_GENMASK(30, 0)))
> +
> +/* PCODE operations timeout for fan control commands */
> +#define XE_PCODE_FAN_CONTROL_TIMEOUT_MS	(10)
> +
>   /**
> - * struct xe_hwmon_fan_info - to cache previous fan reading
> + * struct xe_hwmon_fan_info - cached fan telemetry and control state
> + *
> + * Each fan keeps the latest tachometer sampling state along with two fan
> + * tables: the stock table discovered from firmware and the user table managed
> + * by hwmon sysfs writes.
>    */
>   struct xe_hwmon_fan_info {
>   	/** @reg_val_prev: previous fan reg val */
>   	u32 reg_val_prev;
>   	/** @time_prev: previous timestamp */
>   	u64 time_prev;
> +	/** @fan_table: fan control tables */
> +	struct fan_table {
> +		/** @fan_control_point_count: number of supported fan control points */
> +		u8 fan_control_point_count;
> +		struct fan_control_point {
> +			/** @temp: temperature in degree celsius */
> +			u8 temp;
> +			/** @speed: fan speed in percentage */
> +			u8 speed;
> +		} fcp[MAX_FAN_CONTROL_POINTS];
> +	} fan_table[FAN_TABLE_MAX];
> +	/** @min_pwm: minimum fan PWM */
> +	u32 min_pwm;
>   };
>   
>   /**
> @@ -168,6 +205,8 @@ struct xe_hwmon {
>   	int scl_shift_time;
>   	/** @ei: Energy info for energyN_input */
>   	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
> +	/** @num_fans: number of fans available */
> +	u8 num_fans;
>   	/** @fi: Fan info for fanN_input */
>   	struct xe_hwmon_fan_info fi[FAN_MAX];
>   	/** @boot_power_limit_read: is boot power limits read */
> @@ -856,17 +895,100 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
>   			      (uval & POWER_SETUP_I1_DATA_MASK));
>   }
>   
> -static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
> +static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u8 fan_num,
> +					   u32 *uval)
>   {
>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	return xe_pcode_read_timeout(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, fan_num),
> +				     uval, NULL, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
> +}
> +
> +static int xe_hwmon_get_num_fans(const struct xe_hwmon *hwmon, u32 *num_fans)
> +{
> +	u32 fan_mask = 0;
> +	int ret;
>   
>   	/* Platforms that don't return correct value */
> -	if (hwmon->xe->info.platform == XE_DG2 && subcmd == FSC_READ_NUM_FANS) {
> -		*uval = 2;
> +	if (hwmon->xe->info.platform == XE_DG2) {
> +		*num_fans = 2;
>   		return 0;
>   	}
>   
> -	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
> +	ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, 0, &fan_mask);
> +	if (ret) {
> +		xe_warn(hwmon->xe, "failed to read number of fans, ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	*num_fans = min_t(u32, hweight32(fan_mask), FAN_MAX);
> +
> +	return 0;
> +}
> +
> +static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	int point;
> +	int fan;
> +	int ret;
> +
> +	for (fan = 0; fan < hwmon->num_fans; fan++) {
> +		u32 stock_fcp_count = 0;
> +
> +		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> +
> +		ret = xe_hwmon_pcode_read_fan_control(hwmon,
> +						      FSC_READ_STOCK_FAN_CONTROL_POINTS,
> +						      fan, &stock_fcp_count);

Is stock fan table going to change after late bind? If yes, then I will 
suggest to maintain one more table.
Or Update the current one once late binding is done.

Thanks,
Badal

> +		if (ret) {
> +			xe_err(hwmon->xe,
> +			       "failed to read fan %d stock control point count, ret=%d\n",
> +			       fan, ret);
> +			return ret;
> +		}
> +		fi->fan_table[STOCK_FAN_TABLE].fan_control_point_count =
> +				min_t(u8, stock_fcp_count, MAX_FAN_CONTROL_POINTS);
> +
> +		xe_dbg(hwmon->xe, "fan %d stock points %u\n", fan,
> +		       fi->fan_table[STOCK_FAN_TABLE].fan_control_point_count);
> +
> +		/* Dump the stock fan control points for debugging purposes. */
> +		for (point = 0; point < fi->fan_table[STOCK_FAN_TABLE].fan_control_point_count;
> +		     point++) {
> +			u32 fcp = 0;
> +
> +			fcp = FCP_INDEX(STOCK_FAN_TABLE, point);
> +			ret = xe_pcode_read_timeout(root_tile,
> +						    PCODE_MBOX(FAN_SPEED_CONTROL,
> +							       FSC_READ_FAN_TABLE, fan),
> +						    &fcp, NULL, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
> +			if (ret) {
> +				xe_err(hwmon->xe, "failed to read fan %d stock point %d, ret=%d\n",
> +				       fan, point, ret);
> +				continue;
> +			}
> +
> +			/* Cache the stock fan control points in local structure for later use. */
> +			fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp =
> +						REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
> +			fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed =
> +						REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
> +			xe_dbg(hwmon->xe, "fan %d stock point %d: temp %u C, speed %u %%\n",
> +			       fan, point, fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp,
> +			       fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
> +		}
> +
> +		/* Read minimum fan PWM */
> +		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
> +						      &fi->min_pwm);
> +		if (ret) {
> +			xe_err(hwmon->xe, "failed to read fan %d min PWM, ret=%d\n", fan, ret);
> +			continue;
> +		}
> +
> +		xe_dbg(hwmon->xe, "fan %d min PWM %u\n", fan, fi->min_pwm);
> +	}
> +	return 0;
>   }
>   
>   static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
> @@ -1279,17 +1401,12 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   static umode_t
>   xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   {
> -	u32 uval = 0;
> -
>   	if (!hwmon->xe->info.has_fan_control)
>   		return 0;
>   
>   	switch (attr) {
>   	case hwmon_fan_input:
> -		if (xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, &uval))
> -			return 0;
> -
> -		return channel < uval ? 0444 : 0;
> +		return channel < hwmon->num_fans ? 0444 : 0;
>   	default:
>   		return 0;
>   	}
> @@ -1476,6 +1593,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   	u64 val_sku_unit = 0;
>   	int channel;
>   	struct xe_reg pkg_power_sku_unit;
> +	u32 num_fans = 0;
>   
>   	if (hwmon->xe->info.has_mbx_power_limits) {
>   		/* Check if GPU firmware support mailbox power limits commands. */
> @@ -1531,10 +1649,21 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   		if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, channel))
>   			xe_hwmon_energy_get(hwmon, channel, &energy);
>   
> -	/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
> -	for (channel = 0; channel < FAN_MAX; channel++)
> -		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
> -			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
> +	if (hwmon->xe->info.has_fan_control) {
> +		xe_hwmon_get_num_fans(hwmon, &num_fans);
> +
> +		xe_info(hwmon->xe, "Number of fans detected: %u\n", num_fans);
> +		hwmon->num_fans = num_fans;
> +
> +		/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
> +		for (channel = 0; channel < hwmon->num_fans; channel++)
> +			if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
> +				xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
> +
> +		/* Fan control tables initialization */
> +		if (xe_hwmon_read_fan_control_info(hwmon))
> +			xe_warn(hwmon->xe, "Fan control tables are not available\n");
> +	}
>   
>   	if (hwmon->xe->info.has_mbx_thermal_info && xe_hwmon_pcode_read_thermal_info(hwmon))
>   		drm_warn(&hwmon->xe->drm, "Thermal mailbox not supported by card firmware\n");
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 94575c476e3d..669010f1e2d0 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -85,6 +85,11 @@
>   
>   #define   FAN_SPEED_CONTROL			0x7D
>   #define     FSC_READ_NUM_FANS			0x4
> +#define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
> +#define     FSC_READ_FAN_TABLE			0x7
> +#define     FAN_CONTROL_POINT_TEMP_MASK		REG_GENMASK(7, 0)
> +#define     FAN_CONTROL_POINT_SPEED_MASK	REG_GENMASK(15, 8)
> +#define     FSC_READ_FAN_MIN_PWM		0x8
>   
>   #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
>   /* PCODE_SCRATCH0 */
