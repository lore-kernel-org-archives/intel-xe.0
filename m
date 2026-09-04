Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3D4C79F80
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 16:37:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B547810E1EA;
	Fri,  4 Sep 2026 16:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMWFRtqG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F040B10E1EA
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 16:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788539851; x=1820075851;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=luxDkFk++oGdz543KCZcUnDt0dtE9axUhvOfwwxz1Mk=;
 b=MMWFRtqGSTYXADmH42X8pwROQ6tsxT0m/mZpKKgq4hy1Zojw5ILfWpIE
 MkNvWByMBhMEvHfNAnBShkkKbW/A4D9sk/prldTz+c9JuRrDUOvdLwEAI
 ZMPnniVAy+T5sy/xyw/kgB9ou++gpb/ZHLQvBKcpC/mk7UuVg3TI620FH
 mGAA7vkfdRempPS4LD/M7b0PhB+I2Nw7OAzJmLK0yNjaUYVq8XevKDDHT
 Xe0rfca9mziDsi6hVSponpKGiivziU2MlFvy3RRUqsrWWurzPqO8W89jh
 YHHFMtfrbntJ2tt5Ui7B1Jj2K/hyIuR/bpCKFzKm0jEpDt0IJs9PsHOxd w==;
X-CSE-ConnectionGUID: 1Xqp1YrmQoiWMiqjVOVVJg==
X-CSE-MsgGUID: l9qK6k/eTPqCq0+n8Y8EUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="89168646"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89168646"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 09:37:30 -0700
X-CSE-ConnectionGUID: DcMyZgLgQCCWTBvzekO+NA==
X-CSE-MsgGUID: Al3e4yT3SA+6jDleWZpTTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="274237398"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 09:37:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 09:37:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 09:37:30 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 09:37:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7WBzLL4wCZ6ObLj+qkuKKgjT+mBjiwqNNv7tJ0MyzGux9YcuyGnJkB/bBkvUK3SU1RvRVttRcRKZ/iwaJhMiLZfqG3bOuO1nBQZam27h2LZsFhfUnoLxOm4BDnOurAdaGcs20V7osr1N86UX6xW3FGokJmi/qDSk9I7jtk9r3Ruk9r2wOdEB088sCAlTM2V6dA8NSAbU8fw2O79dUof3j3YCbWjVFDVmji4n4FU/oNWbkk3e+S1k4pO317En2zU3OH7+vNqB8MOm1REzoKC/4JASZvKNbCmFe9h830IADHvPz+mTkklcF0/k4ZrB22qH2IdY0L8k0WBIGoFMoYFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvACFRV8ECOSFy7S943wyzPMVu0xfo6QC4S0jS5nERo=;
 b=XxKesbut1JulkSdgCWDkojN5XlV7MV4B+U/MpYZ9P+w3W481jGxowxbqfv3vsBhggU2J3Ggiy/ahbtrmktTIjHNPiQMv4mlJHRCfFhKZBHLSzyYI7BK/k6XZ2pr+mJuGWo7dZ8lodZPquPHxtle8KGUwH5h+vYkn67arME3nd/84CkkFps9M/SkuDPyDniivhTY0JQt5DyBuIrXkp1oVJ5k2pwNdv5r9j6UZazqKnfy5okYKF6imd8ET6NBPhwMA9DBiK2GtFKnjw8KSvNwEZ+vhzNNrwTZANgPorBMXm+k7rzM8WqM0tPluJcGDQBfSSWS3GBCwVfMxxviz7zECWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by CH0PR11MB5217.namprd11.prod.outlook.com (2603:10b6:610:e0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 16:37:27 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 16:37:27 +0000
Message-ID: <65b77b6b-a21f-4631-9cb3-a5c0e07645c5@intel.com>
Date: Fri, 4 Sep 2026 18:37:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/cri: Expose device UUID through sysfs
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <heikki.krogerus@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260904160608.2004174-4-badal.nilawar@intel.com>
 <20260904160608.2004174-6-badal.nilawar@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260904160608.2004174-6-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0160.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::17) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|CH0PR11MB5217:EE_
X-MS-Office365-Filtering-Correlation-Id: 406aed07-49e5-4e44-d276-08df0aa2ce6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|4143699003|6133799003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: InF7Rad3YjftSjEy8ndDKGcROYTd0Uke9DE9vWinCMmn6I28x9hQVo+Q/9/5qDaRGn9cP0WDIc69WRgjB3WG6DRnSz1pAlDrYPir2UKokhrzrgpF0k1KC5NTl7i5DnOPy9QanBlcVfQg6amq/94F22NzRDzSoMBaUjrQBcAJl/GsP70Y8wDLBStVUDkczBGOuT2JPKlLKO4AqbPKsvQTEVtEd/jCaY7c7ay4/S44tzrdsPAGkS6tG62eZffQgVTcRB+IHN4UE3I2Wss/4hjYO96I/cU8TVMKA+/pZZNjfE4cDeiZEpNVEBQpldB0Wwnhn0uYWNUH39xDZUQuipOB1HvhbJMTllix5PMmubgj6celYa11Cus0EWBIBtIRD3nG06gtkSN/RcPs5CROsfcuyJNanOX0uZFlunOAnlk7jcajxq7FFlEwSW3ps8YAaSsSQsxOUUU+M5ddVrMQnp/luUjeqshf5Eh1d6EK/FU9aE5U4dJJO/mPRQe8ALujuyPZwOaY27/qSit5A+UjqNfSrBTE0xCkqTlqfyLIbqhpfO+N887y7Ri9HEeiaJHwSNUw78C11be4qrdKsQM6/jiDRxYM+bNH41qdeJO7wfPcBugWvjWK3tDGjrZOvazxNlh7vefW1v7buRSScTfISCVsbs2Qn3uRJiqKsXNt0NAPpgk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(4143699003)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXFreUpOakNtSVQvRW5ZMlVmTGFWNnJqSnltVGNpbDR1RThnS0FndGxydkNC?=
 =?utf-8?B?dFBaVzgyc1Q1YWluUm05elAwUDNTeTlmYlNWQzlScFpOSG5QOTdHT2JoYjNG?=
 =?utf-8?B?b0RWTW4xS0dJRyt2N0xaV1p6TjE3dE1BZFlJN1Y3Q01yYm16dFJNa1lVdzZt?=
 =?utf-8?B?U0RBQXY5bVhTUFNpaUt3RXdTMTd3MDFBV1NULyttVnFGdTlIY3VTTE0zeWx5?=
 =?utf-8?B?SU5ETWExVTk0VnhmY2RDakNLVTE5Vm1iTmpLSWRuQWh4Q3RaYzBTVm5udk10?=
 =?utf-8?B?TEw3d1RrdDlueGExRUFpbWVvZmZvem1hNm1CQU15QklQUW1TVGlVcFhHbi9Q?=
 =?utf-8?B?NGttdVZHSVg3QzRJS3RMK1VXbnVQS2RObm1IenVNU2ZmVk5mQndMcU1QUmdy?=
 =?utf-8?B?NWhQd0RRZjBuZ05lWEpEWFd2YklSajJzVTNCZm9TditxV1M5N3Y5eHo1V2FT?=
 =?utf-8?B?Wkczei9DSUNVa2RiVUFadWc4QWF1YlJwK2NJYkl3MW9MREFtMWE3ajRxWVNC?=
 =?utf-8?B?UllMYk5QMi9FYXRndjJ1dXUwOGFsMXNEZDZoT1JSTXhqOElxNFhRc05vKzNK?=
 =?utf-8?B?dlV6YzU1T2piT2JBWXRGOUhISlEwYVVnRDRRelpicWwybGVqK2tHVkV1cDVp?=
 =?utf-8?B?a1lGOFc3M3JrTzFQMm96Y0dPWmhXVkdpRndUWWtSS1hsUVJlNDFrdVYwYUpN?=
 =?utf-8?B?cHN2WDJ2REVIdGxpZG1aU1diOE1PVU1aQTc1VzROS0hQWU5oeEE5TzVsYlZB?=
 =?utf-8?B?OS85aFAvR3FYT1RwaFJudm5OSHUyK3pxTldvYUkzTWZXM3EvbUlIZDNPYWIx?=
 =?utf-8?B?ZzNxQllsdHpRbnVXNnNsRlhlZndQZDU4bi90Mk5FRE1sYk4wY0pXYmd3YjFK?=
 =?utf-8?B?K0E2L0RsT243NkZhQXhHUHkzOHVsOFN4Z1cyd09oTXRnRDZBeEdYWmFrNVhU?=
 =?utf-8?B?TEtJY0JZQU0vMTNZRktrSkVqVVU4aFhKRTU3WVU3OWNIMXNXV2ovSlFESUhw?=
 =?utf-8?B?dXFTbmNITklCLzkwaW9OajBkZ0dpMWY4Qmg0K3dIQURuUmdvdjBHNGpVZ2hQ?=
 =?utf-8?B?SUNnb1JTbTBabURjbnRmdWt1VkpWTGlVZzJtaGR1QkxsTCs1bDNLd2lMZzZY?=
 =?utf-8?B?Z05ORWk2VkJ5V3lnb0RCaUdTUkgyd3N4QmNIQ1R4eXl0VXRZWFNkZWk4N1ps?=
 =?utf-8?B?WDkzMWRKUzEwWTJXWDhGd1l4R1ZjRU5qb3RTUWR1ZnA0WjdYTUIxSnkvTmlM?=
 =?utf-8?B?TllrTE9oWC85M3J1b0ZHd25uby9kTVdJUHlubG92dGFUd3BuNjJiYVVsdmND?=
 =?utf-8?B?Yk1ESnhvYjhNNDVROTZmR3VqOEt2R3RMNGJMcXd1ak5xVU1LcUpJWFhSdHV5?=
 =?utf-8?B?ckYvTys2VFFSRktaUlJJWkdOOUhNbnk3TXZhV1ZRMDZCMVlLcUJsSDNPeVpl?=
 =?utf-8?B?ZTJYWWF1enNuQU41anNEaFlXVURLOU9OUDYxTmhvUWdhQ0tBbzVGWG16NkNh?=
 =?utf-8?B?TWEwVUZ3Q1M0VUdsZkZCREx4Y1krWFNoK01WZDdtNlA0UDhDTW93K3RkeHhG?=
 =?utf-8?B?aThoMGNlMEw2bWRJNUUrcGRPaUFSRUxFTTB4ZmVSZi9yZk9xQ0M4UXk1UTVE?=
 =?utf-8?B?NWhvRmwrcXg3TjFMWWFmMmlmNWwrT1JVNXhRcDBaVlFtOTR1YTU2N1F0V1Fl?=
 =?utf-8?B?a0JXM0wwWjJ4Z2dscUswektaMlUraFo1WktOenQ2OGV0dzZkUzZkR2JEbm1S?=
 =?utf-8?B?a0lKeWFzall3aStacHA2cWNybW96V3dzNFk3MHBOMDVvTDBIeFlUK3VEZ2pV?=
 =?utf-8?B?aUxVUzFVd0RZZ2tFVmdGSkJqcXhpcG5lZ0lIcDZzV0ZYRGkremhhcG1LSmZJ?=
 =?utf-8?B?dmxJNVo0U2RnQnpwVGdZNDFJQ29OaFVtOGhqelk5Z0cralhpTkJQSEM4OEc0?=
 =?utf-8?B?a2lMR25VSE1xK2NjMjhodTh4ZWtaYlpwYmxlRzA2YW5JM1hyQjc2cHJrcHV6?=
 =?utf-8?B?MUJUUmZWR0cwUEZzNVhzN3hzdUlPcXlQVmhURzNiSnNEL0lYZ3l4S1lHeGgx?=
 =?utf-8?B?U2xZV2trdUQ4clJ3TkExRkliTDlnWmYvVVZTRkN4RWl0T1BpaUwvMnhHeTd4?=
 =?utf-8?B?VjhVb2hBemh4OEdyRlR1c004L1plVUdtYW1CNVBuRitudkFBek5IMjQ5a2cw?=
 =?utf-8?B?MFB3ck1WTUFuUmRIYVRWclU5Q1lsV2ZHRS9lY2FVYkZiUXZhSTdENTRlWEVZ?=
 =?utf-8?B?RlFqODVKSDdrbXpZMzhLbHN4dTV0MktKZVZrMloybmo1N1hycDA3engzUk9v?=
 =?utf-8?B?STRkMTc0WmhSZTVHUHUwTzFPMCtRNytZVW53bUFiQXQzck15ZlZQMWZNcUZM?=
 =?utf-8?Q?JE1OE6sY+E+rW9z4=3D?=
X-Exchange-RoutingPolicyChecked: zP+Mva+h65YWRXtQsU6BfJ9fGo9UVohKLjj79GWAp5ET5kvEtF9+L2pIzQawYzKzk0Votidg0kJB+QCjBLObXzhOT/uzjNBfNfdySZlKPksz8DtBv5otMrkX172uN9IpuzWHaC5OyVwQEGZD29I70OZH/GfhtDTa1uDkfmPue2l/pFfhMuyCfVLgUcPtBE3lvLW47WV8wDmY3fzcaUfngbvJAJh1j2l84+AFNHGrzmlnEfg1x6DbKoMPS5rZN4gCkqL/MRtjH337gMPnYpGuqxoYrtQumFnitztwlUEnqqAtbQu0eXh7YWNKo7Lzj3VpjayfQBF81Vzgw5QJkYNHgw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 406aed07-49e5-4e44-d276-08df0aa2ce6c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 16:37:27.6856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8jjAJhISTpAFDbL7i3n7rI2U7jG6JbYXdixrcTssj41uTFLiCIxANAnM8sEvM+zKVcItM1sHWS63E8ecjk4C2iRFtv9vXi4wlKBScRfz+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5217
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



On 9/4/2026 6:06 PM, Badal Nilawar wrote:
> Expose a read-only sysfs attribute, device_uuid, that reports the
> GPU's unique hardware identifier.
> 

Bspec: 53048,53049

> Assisted-by: Claude:claude-opus-4.8
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-gpu     | 10 ++++++
>  drivers/gpu/drm/xe/regs/xe_regs.h             |  2 ++
>  drivers/gpu/drm/xe/xe_device.c                |  3 ++
>  drivers/gpu/drm/xe/xe_device_sysfs.c          | 36 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device_types.h          |  3 ++
>  5 files changed, 54 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> new file mode 100644
> index 000000000000..1a4bdfbad8d7
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> @@ -0,0 +1,10 @@
> +What:		/sys/bus/pci/drivers/xe/.../device_uuid
> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Unique 64-bit identifier of the device instance, read from
> +		the device's CRI_DEVICE_UUID register and printed as a

hmm, maybe in the user facing documentation we should refer to this register as

	DEVICE_UUID(102008)

instead of the meaningless macro name?

> +		zero-padded 16-digit hexadecimal string.

if this is UUID, shouldn't we print it in UUID format? see %pU

> +
> +		This sysfs file is present only on Intel Xe platforms that
> +		provide a device UUID. It is available to all users.
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index ef4746b7b5d3..68226fe0b659 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -30,6 +30,8 @@
>  #define XEHP_MTCFG_ADDR				XE_REG(0x101800)
>  #define   TILE_COUNT				REG_GENMASK(15, 8)
>  
> +#define CRI_DEVICE_UUID				XE_REG(0x102008)
> +
>  #define GGC					XE_REG(0x108040)
>  #define   GMS_MASK				REG_GENMASK(15, 8)
>  #define   GGMS_MASK				REG_GENMASK(7, 6)
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8583b2e9ecf4..e8db8871990b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -801,6 +801,9 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (IS_SRIOV_VF(xe))
>  		vf_update_device_info(xe);
>  
> +	if (xe->info.platform == XE_CRESCENTISLAND)
> +		xe->device_uuid = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), CRI_DEVICE_UUID);
> +
>  	/*
>  	 * Check for pcode uncore_init status to confirm if the SoC
>  	 * initialization is complete. Until done, any MMIO or lmem access from
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index a73e0e957cb0..a4d326159dce 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -8,6 +8,7 @@
>  #include <linux/pci.h>
>  #include <linux/sysfs.h>
>  
> +#include "regs/xe_regs.h"
>  #include "xe_device.h"
>  #include "xe_device_sysfs.h"
>  #include "xe_mmio.h"
> @@ -264,6 +265,35 @@ static const struct attribute_group auto_link_downgrade_attr_group = {
>  	.attrs = auto_link_downgrade_attrs,
>  };
>  
> +/**
> + * DOC: device_uuid

do we need this?
you already described that in Documentation/ABI

> + *
> + * Each Xe device exposes a 64-bit UUID that uniquely identifies the SoC.
> + * The value is read from the CRI_DEVICE_UUID register and can be
> + * read back through the ``device_uuid`` sysfs entry.
> + *
> + *    $ cat /sys/bus/pci/devices/<bdf>/device_uuid
> + */
> +
> +static ssize_t
> +device_uuid_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	return sysfs_emit(buf, "%016llx\n", xe->device_uuid);

%pU ?

> +}
> +static DEVICE_ATTR_RO(device_uuid);
> +
> +static struct attribute *device_uuid_attrs[] = {
> +	&dev_attr_device_uuid.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group device_uuid_attr_group = {
> +	.attrs = device_uuid_attrs,
> +};
> +
>  int xe_device_sysfs_init(struct xe_device *xe)
>  {
>  	struct device *dev = xe->drm.dev;
> @@ -285,5 +315,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
>  			return ret;
>  	}
>  
> +	if (xe->info.platform == XE_CRESCENTISLAND) {

use .is_visible instead

> +		ret = devm_device_add_group(dev, &device_uuid_attr_group);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 180d450a6deb..6fdd16eac906 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -257,6 +257,9 @@ struct xe_device {
>  		bool oob_initialized;
>  	} wa_active;
>  
> +	/** @device_uuid: unique 64-bit identifier read from CRI_DEVICE_UUID */
> +	u64 device_uuid;
> +
>  	/** @survivability: survivability information for device */
>  	struct xe_survivability survivability;
>  

