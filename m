Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39A7C61DD6
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 12:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03ADE10E554;
	Fri,  4 Sep 2026 12:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IZ7rEv2S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3F610E554
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 12:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788525646; x=1820061646;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1pmtR5ToeLfh9QFQOfJEkFbXudgvksbUWmKXCKFRTGw=;
 b=IZ7rEv2Sju41v2Vku7r2plrOcSehGw7vapBvFST7Erm8h7orjnF3oAab
 rb4K/H65zSDn6uQm5LYVtnG7GyDfi5kMQFwTCrx0Ef9Bw4Tsv39B3u+vq
 le1H61kTmmoA5nvjWtzEkyco5UlmCQ32HC64TqtVDAR9iBzhfPaa0+bSO
 L5+v3rXhRnvI4qkx3xVv46NZ+4PfBaeGsYNBQKm4vi8mS8XZimnU+ZBSt
 eAul5vZyJ6OYuhzgE6v33SqAHlozjA4apBz7ai+t51PsRLg5swMMPAfND
 00nUQF+Ai0l6UN/IYVkUDhItaJXB6CmCAzckISdqhLyryzx3u08iunU6m A==;
X-CSE-ConnectionGUID: FLE/APccTS+RswzrKNs/Fw==
X-CSE-MsgGUID: qXyEN3agQjSSqZcz9tBCNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92724880"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="92724880"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 05:40:46 -0700
X-CSE-ConnectionGUID: We0a/XT4RwGD3XJEt/jxgw==
X-CSE-MsgGUID: qYRJ0TzoRz2X73a/TASrYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="270560623"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 05:40:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 05:40:45 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 05:40:45 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 05:40:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4xvMW3ZDXn3uHwisgRlNjUaXSm3CCeBFjD+24Ad9l4iJt8bHV/S7/VN3Dt5FQgm3wzjnb8hThDvOh8GdT+CodSgrc5CivADm4Gorg7EH7Lf+A6sIYY5ft5ca/g4Mlckjqet1Fo/CPOMzXfaJiO+RqoQrVfoHXQhsAj1aEbh+ZEeqepU04id9XrxwOXZmAIRTTCOD5tzjAPbq7ov6KmKVVbQUP0M4/Ev2TS/b3nkuoOVpvFF311GYR4tDZsFPCCz/kJRyODGBlKACXEMgSTQPVZubdVd7VBKrq+vK/BS3i86k+eHMllM3ZLe48CaKCaMwhjzxUis/5owXnZ9dHBTDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwaarflKCljg0CZDs4D0WqaaDd7a3h7zDFRy8OPQnj8=;
 b=hkg1GTG23z1g4tgC944lXmYt3tqbykMV7Y0uvJD5lqnB+ySuHykIvAIXPDkxJP0mxYe9ckdMRMAtWdNusTENmcrwGBJQZFF0iWGJ0U0l+JWcRqOoBK27cspnozREq224cLINBcl58VrC//Cd33VmhrzWZ5LZAnbAhzsBDK8C7NqCBY9YZPHcBlJ+3jMXdF4TRKWZNjvC3NyfAG3VOBICVs2vlLq3xMma4xGoFoejLe6bmnKMnNG6YDP6l6K0K5zWL2kJbELBq9ai7JL5uZdlfvxg2TQhDfWpMu3TfuDOSEIV0TcVeA/TgfEAJP6UiomvF3qRIQjSU80LY9eCD3WRuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by PH8PR11MB9746.namprd11.prod.outlook.com (2603:10b6:510:3a4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 12:40:43 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 12:40:43 +0000
Message-ID: <4894efcd-a321-47ee-b79b-1bd5217c0dcf@intel.com>
Date: Fri, 4 Sep 2026 18:10:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/i2c: Expose AMC Alert reason sysfs
From: "Nilawar, Badal" <badal.nilawar@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <heikki.krogerus@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260823103523.554184-4-badal.nilawar@intel.com>
 <20260823103523.554184-6-badal.nilawar@intel.com>
 <aoya-4fWW7pLb9bc@intel.com> <28c4db86-72e8-4ff1-95f6-c2f25b2cfa6d@intel.com>
Content-Language: en-US
In-Reply-To: <28c4db86-72e8-4ff1-95f6-c2f25b2cfa6d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0194.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::7) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|PH8PR11MB9746:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a3d9466-8c3b-4eed-3083-08df0a81bbf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|6133799003|11063799006|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 5UbuXMSQLrev6kCm/irg5vE0SIFixvBGYY5WGVLJIXLe+EZToX6aTTgILVj1GvE1kT5QsnEbKFkx7vSr6vi43BBYrhljqYNXREah7CqlhoOLeMLLBAUi/lI3tiCj4rBfyUoukV9uogxMB4mDLZYqo4pxTVYtYj1eizK10B6BMMwyarmofxp9Fp7V87s/nKrI4z5DoV20mtMnzYZZ1qNf2varPY+bLhppjVym2hkgelBuhvYGIKMd8lJtAN613rIM1ID2XzjYgUqBIcyjHqgJsKFyjcQU0cgZMLeedZJeaqTEAhX/pXUkfhoK/G9EpPA8d9ine71JdXIM+2Anr5yOgXdK2NZUYlZ9LqE41hU4mmWMDt6tvVWaBAD9MswSwBYTugo9tp3TajmRK+nbrZ3i5K92Yc79sKjET3oSYddyoEcqboM50CRMpV2L7KKzMpKI8+sox48lEjcOA4ZLg8a0mcNimVsWy9Nocku2y9c6VlwJx1FLXEMymCxOgefb06U6um/1Lwne5M/U+hX4q3kLCvpWtV2pT/t5Zhb77VkBN8wYlBaTMswDWGTRIOoyNY2rQTAv6RZsUpomDiWZpL7eMQQB2wONEF/3dmyZYx/7xs2qVFP4v/HD/kvCr5ArbYcupz7FRoD8LhBL5z5PmS0r4GAP2dzQM6ij4s0AW1EEiC0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(11063799006)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUxMQmNQalFHRDFnN2xndHZodVBXb0t0dzdOL2JKV3NheGxHd1JxY1I4OWhT?=
 =?utf-8?B?dGFlRkhLdHpDYWNJZ3NJckZVeU5jL1I3YW9RbXBHU05xTG9kQXZ1WEc4UHAw?=
 =?utf-8?B?ci8yeTVrb2xGaVA3Y0tMSW9PeDVKdWR2YnA0b2FyZkRYTFI5K29Rb2lscitT?=
 =?utf-8?B?NDRsTkNyalgwakFVSFg5cXNhalJEbi94aTE0Wk5hZjcwMDVQSlVWTGc0bUgy?=
 =?utf-8?B?NDNrR0RWTXNxMUY1K014cm9MR1dlUm43NE91QVFFSytSUVJvK3Q1OEVpNnVS?=
 =?utf-8?B?Ump1dnJGMmlsenk2SVZ3OWdoY2MzeEdVR3RWY2Y2Z3l6YjdQQ3kzNWpqdTNI?=
 =?utf-8?B?bnhneEVXSzlmajRUN1NnRG9CS3padXZwZGhoU2VKaGRUVnlramdrVVkvVFpC?=
 =?utf-8?B?d2JERG94aFd0N3ZXRDlwSG5XT1hTbm1MRDluNGl6bXpzSXdSNmMxbmh6aEdR?=
 =?utf-8?B?ejhQNEFLMkplUU9vYUZEY200WnpZSEtOTkMyVTB1M0xCeXg5ZVVrOHUycys1?=
 =?utf-8?B?MVF5S29xSWNqcUY2MVhEdS9IMnVyQVlyRjlTSmxUTXZOR3VXRWF2ZVBUSnl4?=
 =?utf-8?B?QVJRNDd5ZVpKYVNKVkJCMmtKenFBMjJScnhUYTdPaUFnOEViYlZEQ1lkS2dG?=
 =?utf-8?B?SjRCaGFsdzdxT3VVak9XZ1owZXJtcW5wSHhtNmtFbk9qWCtxY3FIQmc0SlUz?=
 =?utf-8?B?VHBWaXorc0FQYko5R2tRemR3NXlQRGNnVHF6UnVXbTljMHgvekpXMXF4cmp5?=
 =?utf-8?B?aEVYTUpsUzNEUGFEb3dnbDNJL1owaXBZZXRkUjNLM2YrL1pHb1J5Y2hybUJm?=
 =?utf-8?B?UlpzOU13ZlRSRDJiRGdkM1JxOUtQRnVYamRNeDdaUlBiQ0pCVGROZWdKcUV0?=
 =?utf-8?B?SmhkSVpTY2ZsRE5PWDB0Ny9VOWM3U25YenRZektDVGtPdjhZbDU5TXZsYVJU?=
 =?utf-8?B?L2F1VTEzY0dqeGlGMHN4TmFJMjhVTXdlRDQrL3l6cWZzenJselRhUUtmcElm?=
 =?utf-8?B?QllTY0xmN3ZFRy9xTEJJM25nRGN6Q0wwWHJUaXZGWnZ1aWNDdWJPOUlSVU5u?=
 =?utf-8?B?WWJ6Ty81UnJRQUdlSHlmUUFRUnI2QlZvY0tKNW96T09ONm4zWUN4WExhYTFV?=
 =?utf-8?B?a2V0RUlLTlAxRFc4dVBXYXN3MGRXU3U3am56aDB0VnIrU25ITzRRcWVyZ2dN?=
 =?utf-8?B?Uy9FZmoyb2pORWxTcWhQaENxUEhNWlRMaFRHVk9LNlltT04ybjd4MTlJREEv?=
 =?utf-8?B?TEJXeE9Bd29wL2ZaVHRSY2IzM0VYaTh6RFBmbm9ncGZBQXBlYmpzOTA5bkF1?=
 =?utf-8?B?S041a2lEb1FNMXA5NEtIWmlFZGpXdEVzZlAvREtvRkg5UmFVUy82eUhhek1S?=
 =?utf-8?B?QjhlOGoybnRKeVVSQUhFUE1aN0lKYlBPWlk5bDA0VUsrcTlhRDhuWXR2V01O?=
 =?utf-8?B?bjk3Y0ZENjNkNHhJNHJDMFVETExhUUZXSUxoa3VTTG5KaXZIcGdqRGYzd1Jy?=
 =?utf-8?B?Y1VRbFN2UzZ4RzBEdVV0VkdvYnN1MGdLREp3eEVFTm04L1pvUi9SWjQyNk11?=
 =?utf-8?B?NWswTnhMdVBHVWlHLzBBTElsZWo5aC9KUXNGaFVmY21HcE84b1FSMWsvdjFo?=
 =?utf-8?B?NWptL0NuVEVUdTcxZnF5SVRKdVdXU2dtRllSbDd0OVRPbDVaZU5QMGlwNFA3?=
 =?utf-8?B?YWsrZHJ5dG9OVWdzc0RNYk5hQjBFOUF6MWRjT0pyTEphV0k1WVFRajNiVUFv?=
 =?utf-8?B?NlRkY0lSVE1DMzZ1d3ZWejROaFdzVVZXa1JOcWRDckFrV3J6YmpZNWdKTitD?=
 =?utf-8?B?dE8yNVkxYm9tUUtNZy8ydmpzTktTQmc2S0M0SVpCcnhEZlBITThEakRtZjU1?=
 =?utf-8?B?dW5ta1hrMDZrN1Joa2lib0E5V3VDZXpWbUhraTlGYzJzN3R0UUZGZ0tXWHcr?=
 =?utf-8?B?UmtyUXlnb3pqaEVvaHd3eC9jbE9kRU92V05OQ2lHQXlJaFZZU0FzK1FycGdO?=
 =?utf-8?B?dkxwSkxEbUtmNDhveTdmUWlacDlvR2xseXdqNm1TYUJvQWpJckxnVCtlamhw?=
 =?utf-8?B?YVdpOGsvS0JJcnEzeGhaL3RFNkEvand0Y3hoYkZPbHZJNlBIb0hSd0E2SGVn?=
 =?utf-8?B?blZqZzRlVUpDd3FYYVhUUi9jbUZpZVNKbXdPajNaZ242MXc5RFowMjNESVNi?=
 =?utf-8?B?ODNtVm9LOGNoYXBSZXIvS2xZZjF3YjV4dGFiZ20rVTBQV3pHWGdZQUdFOWZt?=
 =?utf-8?B?SXNTRjlPQ2dIOVltLzJiVm1xb3hpUWtDcEFJTmNhSWZORmt6empHVm1uemdy?=
 =?utf-8?B?Z1ArbzcxYnZ0bWtaZjg4OEdTeTZ0RzQvZHEvMHZ1YTd2Ni9aeFhlN2RiSVRk?=
 =?utf-8?Q?WPYtJxdlL9FvcxOY=3D?=
X-Exchange-RoutingPolicyChecked: 5lJjrPXe5/olji9aPff2+he0ncfEc2TStaNr12ujJzDpGuGSkKAAjj6vmeEkSTtLSO9Hk8O7iOBrfHKJ5cdSydR5W0j0+noJC/jxdLPpfBc5roqqM03qmd3Qhx5WXj2+LRirGuiz+Vq0bzCwj3uKd5Yj69kzfwZQwN6H9OQZnyiGHmnGBa8z8Za4772RgBqjenuRQH6YNyTprhBeHKyC8+SbImWO75MrUHGU8SjqsiXCYJsp3WoLrkrnddk4p5nbFlraIL8RzhBhS//mUfqccOREoyQZKZTNSMhQovgNlj5bI/Bp+/QMtM1uzx0lo8hgtTUl5YAqFSpbP4wTteA+rg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a3d9466-8c3b-4eed-3083-08df0a81bbf0
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 12:40:43.0976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GfOvDLqusl8LSCvUuS6zqMBxntipepXhaUPQvVBt32dGHM5mcfQNfyOXB1O571BJnV+gnMYiiz2riGDZezD1cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9746
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


On 04-09-2026 17:38, Nilawar, Badal wrote:
>
> On 25-08-2026 00:56, Rodrigo Vivi wrote:
>> On Sun, Aug 23, 2026 at 04:05:26PM +0530, Badal Nilawar wrote:
>>> AMC raises an SMBUS alert before performing a power removal or
>>> power-cycle operation. The xe driver then places the device into
>>> vendor-specific wedge mode until the recovery is performed.
>>>
>>> Expose a read-only xe_amc_alert_reason sysfs attribute to help users
>>> identify the required recovery action.
>>>
>>> Assisted-by: Claude:claude-opus-4.8
>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>> ---
>>>   .../ABI/testing/sysfs-driver-intel-xe-amc     | 21 ++++++
>>>   drivers/gpu/drm/xe/xe_amc.c                   | 65 
>>> ++++++++++++++++++-
>>>   2 files changed, 84 insertions(+), 2 deletions(-)
>>>   create mode 100644 
>>> Documentation/ABI/testing/sysfs-driver-intel-xe-amc
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-amc 
>>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
>>> new file mode 100644
>>> index 000000000000..b3de933efe11
>>> --- /dev/null
>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
>>> @@ -0,0 +1,21 @@
>>> +What:        /sys/bus/pci/drivers/xe/.../xe_amc_alert_reason
>> Should we do <bdf> instead of ... ?!
> Sure
>>
>>> +Date:        August 2026
>>> +KernelVersion:    7.3
>> this will be 7.4
> I will fix this.
>>
>>> +Contact: intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        This file exposes the reason for the most recent Add-In
>>> +        Management Controller (AMC) alert on Intel Xe platforms.
>>> +
>>> +        An AMC alert is delivered via an SMBUS interrupt and causes 
>>> the
>>> +        device to be wedged, requiring vendor-specific recovery. This
>>> +        attribute is created when such an alert is handled and is
>>> +        available to all users as read-only.
>>> +
>>> +        Read returns a single line containing one of the following
>>> +        alert reasons:
>>> +
>>> +            Firmware Download
>>> +            Thermal Trip
>>> +            OOB Request
>>> +            OOB Reset
>>> +            Catastrophic
>>> diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
>>> index 8ecadee6eea3..ceb2c4d618fe 100644
>>> --- a/drivers/gpu/drm/xe/xe_amc.c
>>> +++ b/drivers/gpu/drm/xe/xe_amc.c
>>> @@ -18,6 +18,7 @@
>>>   #include "xe_device.h"
>>>   #include "xe_i2c.h"
>>>   #include "xe_mmio.h"
>>> +#include "xe_printk.h"
>>>     /**
>>>    * DOC: Add-In Management Controller (AMC)
>>> @@ -56,6 +57,8 @@ static const char * const amc_alert[] = {
>>>   struct xe_amc {
>>>       struct xe_i2c *i2c;
>>>       struct work_struct work;
>>> +    u8 alert_reason;
>>> +    bool sysfs_created;
>>>   };
>>>     struct amc_header {
>>> @@ -104,6 +107,54 @@ static const struct amc_request 
>>> amc_get_alert_reason = {
>>>       },
>>>   };
>>>   +/**
>>> + * DOC: AMC Alert Reason
>>> + *
>>> + * On Intel Xe platforms, AMC sends an alert notification via an 
>>> SMBUS interrupt
>>> + * to notify events such as firmware download, thermal trip or a
>>> + * catastrophic error. See enum xe_amc_alert for the full list of 
>>> reasons.
>>> + * Upon an AMC alert the device is wedged and requires 
>>> vendor-specific recovery.
>>> + *
>>> + * The alert reason is exposed through
>>> + * /sys/bus/pci/drivers/xe/.../xe_amc_alert_reason
>> ditto
>>
>>> + *
>>> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-amc for the ABI
>>> + * specification.
>>> + */
>>> +
>>> +static ssize_t xe_amc_alert_reason_show(struct device *dev,
>>> +                    struct device_attribute *attr, char *buff)
>>> +{
>>> +    struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>>> +    struct xe_amc *amc = xe->i2c->amc;
>>> +
>>> +    return sysfs_emit(buff, "%s\n", amc_alert[amc->alert_reason]);
>>> +}
>>> +static DEVICE_ATTR_RO(xe_amc_alert_reason);
>>> +
>>> +static void xe_remove_amc_alert_sysfs(struct xe_device *xe)
>>> +{
>>> +    if (xe->i2c->amc->sysfs_created)
>>> +        device_remove_file(xe->drm.dev, 
>>> &dev_attr_xe_amc_alert_reason);
>>> +}
>>> +
>>> +static void xe_create_amc_alert_sysfs(struct xe_device *xe)
>>> +{
>>> +    struct device *dev = xe->drm.dev;
>>> +    int ret;
>>> +
>>> +    if (xe->i2c->amc->sysfs_created)
>>> +        return;
>> Why do you need to track this?!
>> if this can be called from multiple places shoulnd't you protect with 
>> lock?
>
> This will not be called from multiple places. Will drop this check.

Forgot to mention, I will create this sysfs probe time. When no valid 
alert reason it will give EINVAL.

Thanks,
Badal

>
> Thanks,
> Badal
>
>>
>> But I prefer that you ensure this is absolutely called only once and
>> remove this check.
>>
>>> +
>>> +    ret = device_create_file(dev, &dev_attr_xe_amc_alert_reason);
>>> +    if (ret)
>>> +        goto failed;
>>> +
>>> +    xe->i2c->amc->sysfs_created = true;
>>> +failed:
>>> +    dev_err(dev, "Failed to create sysfs file for amc alert 
>>> reason\n");
>>> +}
>>> +
>>>   static void xe_amc_work(struct work_struct *work)
>>>   {
>>>       const struct amc_request *request = &amc_get_alert_reason;
>>> @@ -158,10 +209,16 @@ static void xe_amc_work(struct work_struct *work)
>>>       case AMC_ALERT_THERMAL_TRIP:
>>>       case AMC_ALERT_OOB_REQUEST:
>>>       case AMC_ALERT_OOB_RESET:
>>> -    case AMC_ALERT_CATERR:
>>> +    case AMC_ALERT_CATERR: {
>>> +        struct xe_device *xe = i2c_client_to_xe_device(client);
>>> +
>>>           dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n", 
>>> amc_alert[alert_reason]);
>>> - xe_device_declare_wedged(i2c_client_to_xe_device(client));
>>> +        amc->alert_reason = alert_reason;
>>> +        xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>>> +        xe_device_declare_wedged(xe);
>>> +        xe_create_amc_alert_sysfs(xe);
>>>           break;
>>> +    }
>>>       default:
>>>           dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", 
>>> alert_reason);
>>>           break;
>>> @@ -190,8 +247,12 @@ int xe_amc_init(struct xe_i2c *i2c)
>>>     void xe_amc_exit(struct xe_i2c *i2c)
>>>   {
>>> +    struct xe_device *xe;
>>> +
>>>       if (i2c->amc) {
>>>           cancel_work_sync(&i2c->amc->work);
>>> +        xe = i2c_client_to_xe_device(i2c->client[XE_I2C_CLIENT_AMC]);
>>> +        xe_remove_amc_alert_sysfs(xe);
>>>           kfree(i2c->amc);
>>>       }
>>>   }
>>> -- 
>>> 2.54.0
>>>
