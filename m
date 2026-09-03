Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD5CC61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 17:36:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB16910E377;
	Thu,  3 Sep 2026 17:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g6XX//Br";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CB510E377
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 17:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788457017; x=1819993017;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=33z2TZtYxKr4jD4PIscINzlrypConKsOx82Pe9mxlgE=;
 b=g6XX//Brjzakbulspffe/dzPnhqet/Q5dJrVOV0BPTNtpl6yH8fC020R
 ERjMKdqSIMThRCbqbffMPHAJVNoe+S1yMEMPT2oRjz2MWxczxsPH2CuDG
 AWyNW3XsyYJm5Bhq0G1LMDrgeVYCZ+8p1evrYr1GcLBu/HrJ0lW5hfwcm
 V0N9bpfqlFPWHuMd6UIZXAuEjkavhxg7K3y1E3QZ8jsBCzD4yEYnnUmpn
 4UgcjwFdAOlzSkG1OsDqWKY83RAD7D7ptbJ+XlYhPGjFeGdxmvHJMGE/k
 6qfAmcghbigkQrwWEE8ga3fk5Axd08v4s6fiY6MUf++rw+m1YACtBOydI w==;
X-CSE-ConnectionGUID: 09S421gITiinVnFbDYiInA==
X-CSE-MsgGUID: ew4gARTVRo26G3fxlMfV8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="106470221"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="106470221"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 10:36:56 -0700
X-CSE-ConnectionGUID: ohzQQdhGSseHE5F4SuoZFQ==
X-CSE-MsgGUID: iJqS26EaRAOiwFDiDp9/ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="299656065"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 10:36:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 10:36:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 10:36:56 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 10:36:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWR3LCizjuxpy8FgBkxeuhz61pW0xqRgAOVMhNe25Bgz/dVR6Y160tMSJYFXdH9c7daoCrC9U4swxtZVkD5QneMLn59Bd0PxMEE55jytV/KsgF6ZsVymVXyB5xC+Wf8Rjq+5BEmzPig2jq8N5mVNqQp4B+CMXd1Glx6lz3osx2ljkCdn/rGNV3Kx5JYR0sXk1PecyvBH7tFOMp6tad8agr4Uo7wbY1bxpngZ1myWRO7hPe4oHD63TbtwTyXvFTdTOdzM9yLG9lQfaRQ7Y4LlJjv/TAFj2xflUnwmPXQT8DnmQNSPK3UJgoHFGTTr1S5Vhovced5bo9qxvZuja7yBYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8WjKNlWktfNlFZyIxKVCLA5YN2sNxg3G22mzPzwhp8=;
 b=qoLJr9qQrfPjcjZdPc6Q1LCTbiV346KwkcD9tgNQoKyWhDt7smGab0UpCbcMdYdzHeg7Ro2IHlAV73Gvfs8LwHu2663nJCN/+NJf2f5J5Cf/qyHi5k77UJlEYU7G0j9RWd7cJdZ7+PrtMqLgTooEUozeVrLc0TAuNvaf3eUrHvJv9n6H1FyKLnJYmnLtjpV0K0CX4S1afwfx7lxDBVzcJ4d/q07aKy6P7C8oict5aXwvk6UDPdku/Bk1wNxnJw1W89n7d/qf7ZDhnJts3eMt4fEePsLihEbVWXuzmChjCCSliUu/r5s2AmjOWeJIfO7/wb53lRYojofl8HvOZX+QHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by SA3PR11MB160535.namprd11.prod.outlook.com (2603:10b6:806:594::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 17:36:54 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 17:36:53 +0000
Message-ID: <cd8c5b7c-cb0d-4136-8d25-9ad780dbc56f@intel.com>
Date: Thu, 3 Sep 2026 23:06:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/xe/hwmon: Enable fan curve control support
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-7-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260717041757.2759084-7-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0127.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::14) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|SA3PR11MB160535:EE_
X-MS-Office365-Filtering-Correlation-Id: 05f74d99-aeff-4206-8033-08df09e1f176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|6133799003|4143699003|10067099003|22082099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: ioOUYrAS0p1egKZpVEZfC/6okcov2RbyURDTMebr/MpUUlON3R/xylkSko04rjeEbC7HHekdH8DmymoQ3Xsjr0BdRm4N+Njvg+kvHQdlIKlyYOvWZECiYjXmHBI3fVd3qIZXPmMOsE5nnsqEdKa258XyWHDemtNyEr6fkQXys4U4puamyGc5uRsoNeEtmCVw+7OvrKAp2/v0UKHB6OEsNBCekbRH8hF3mypZozmgQuTeqCf1LLHyIvga0mRfOMUXHTa67KN3URdlX7ghLguFo506LcnYLxFQ4kffF1xojxIDfgQ4QO9rWdLHFuofnEAQE2GLgBm3xRp4XT2m0+RURbUpMTacwEPxElgl2/Hs33FbbgUXWHpnP4GeqBxqhEEWtSOM6s1uLnPqvguMOXOtEfGp6GupoRQkU25YqBK8E+zjGfbmf0sAlbyAbEZLq3PKEoIRg4RfcragGsw8aK5ykV4Uj3Jvg91jcJ/pawmUfadx0ui/aLWtcyWxqEBNjcN2fGQb6YR97YLrnzxBqXiAcvo2z1ZEfE3hRyaP4diihul7X+WQ2ruAwc9iNNz1eMMHWlLZV6n4w2Fl/UXFqrD467BY4Dcp5tMFSFWebfzNUxnZNq41Nm1Li4AkHVpkaLrk1yjRlB4fe7dIInQSZZtHxhzO9Z7W/YEQyRRdZ5BqmF0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(4143699003)(10067099003)(22082099003)(11063799006)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dU1MbXdSK09QZEZZVERUYUtQVGYwQWpxTjRTT1NQWm5KZnc0aGM0dDBIQllp?=
 =?utf-8?B?YVhUaVFJWE0rK1lTa3FGK3lFQWtwQmNyQU54QzhvNEU0WGVXQmhFblpUclBL?=
 =?utf-8?B?L2s2Snh1ZE9HdFE3THFpeStFTWpKRmtRbzRHVjZPL2VDMEhXMi9ma21ybVdq?=
 =?utf-8?B?SFRVQmI4ODRsd1dHRWt3Ni9MNnJ6UWFENSt2WVhvRUVBUGNUMEhOZTdRdkFJ?=
 =?utf-8?B?N2tWQk15U0J3YllIeGRUeE9lUVdSeS91cW4wVU5NV3NnNWpTVXJwRWd6d3Ni?=
 =?utf-8?B?THZGUzN2Wml5enJaM3AwSnJUNVIxZHBZRmVnZG5ZZ3BoQmNHL0cyUzRJbU1q?=
 =?utf-8?B?akFIR09UeTBBSkRqNy92K2FINWliaW16WnVSczlsSVNqZGtUQy9NaFF0eGZw?=
 =?utf-8?B?WjlsRG8vV21JS1h3c0ZNcHhlcnlMdThVaWhxWEZMR1FCYndIKzl1SkVCRk1z?=
 =?utf-8?B?WjZBS2IrZGxKL0pOMlhmSU5kbkw2Qk1aMXJaczRlVlZ2WlRsZWxKalVEdndG?=
 =?utf-8?B?M0N6aHFkSlBrS1B3ZHFtVVNmYzd3ODd6L21RcjRDSVBtUVcwc2w5bTZRN2ZR?=
 =?utf-8?B?dmxPWGVWWDQ4MlB5S2dUV0FMbGQwbUx5YmhERml0TjgwcDNzMmdNUkFFTXlz?=
 =?utf-8?B?UnBqalpoWUQ4K1B6WElMVkpGQlMwOFZ5bnBjRWEzNll6eDd5MmJUMnJTb0U3?=
 =?utf-8?B?aE9RMlBsV2djSXRZcjAvNVQwdStDcUxIdGt0RFdBOEw5ME13clZkQjVLc3hs?=
 =?utf-8?B?V1BOd1VlUmZlOStkbFN3TXdOUnNidUNGcnI4Z3d1aXQ3clFlOVA0Tm9JcHJ0?=
 =?utf-8?B?dDBBNnlPeHFmVlQyVnNqTWtlVXh4V0RRNUFZRXVCVFBSckhVNmowOU9VU2ll?=
 =?utf-8?B?WHQxa1QrUlRFSHZiVnlFdlZDMytlYTVodGxLK296QXgwSmgyVFN3K3B2MTl0?=
 =?utf-8?B?QUUvM3dhcTJXblhaWjQ4TThwZXZGUndpcjlERG5TYTJHVyt1VFNJZEFZSUF6?=
 =?utf-8?B?dWRNUWg1QlpWbmZqT3pnVVV0bGhlQkRTbXhFZ29rUUVBelowTDQ4cSs0Y1d6?=
 =?utf-8?B?TUpmNnJFNGdQb0p0eTRJTENMck9uaUU4Z1RzTGNFV2p3WFBDMzBYeTZCdE1H?=
 =?utf-8?B?ay9LbjcwZ0c0T1BHd24yNjRmUGUxVHF0VHI0U0VuaHk3S1ArTWpPOXlDdnlq?=
 =?utf-8?B?UUErUEVMaUZMRFMrOG9jTGYrOWRIZ2Zta3grTExjend6MFJ5UWZJeDg5NGNZ?=
 =?utf-8?B?d2xSbElWRlZob0VOaE5FOGcwV0tmNyswUnlOVmZuVmptWnM2blMwWVY0M3dw?=
 =?utf-8?B?dDdrQW4wb1psOHRpYmpjbERMTGFnU3FScVRxV2ZBRXZIajFaeTZmcG1zOUx2?=
 =?utf-8?B?MlZVanFqdG5NUy95UlNKR0NmOE80RlBWTFBXRFRmZ2VVZmpRTndIaHcwT25p?=
 =?utf-8?B?YTFqQlArVWRvNnpBSlR4QS9ITVlPamRNeVJteFdIZXJjY0V5QlFkMkpVNUor?=
 =?utf-8?B?aXhveWlEVG95VGRNL0cwMzZFbHdHa0FBbW9FOG5kK09wSVllTVNiTTJXL2Zq?=
 =?utf-8?B?NGVqSDRSd0I3NUk1a3V0ZHlqYkZCZUxyZEhxdWdBcEVudEJUdk5Za0d2VW9u?=
 =?utf-8?B?eC9kenZEOVBkb3BoRVBZQ2IzZnhuQmJ6dk1BcEhVWDZENU9ZUlh5ZnZQQTNQ?=
 =?utf-8?B?OWxQbVk5RkpiNk13dUFGTW92UzI4aHJnVTBZaHppUktRZFZuN2ZqUDF5ODEz?=
 =?utf-8?B?YkdoTGxNNGM1SEk5WnVENTZraFdjK1JjeU9rbFQ1aEpUMU5QdlRlTC96NTN1?=
 =?utf-8?B?anJBcjJtc20rOHFnb0ZSQWZDSUVnVkwrM1lweWpETkNuSVc2TkJLU3pvbDBW?=
 =?utf-8?B?Mi9WckFldnpUVzBvSnd4RUZnSjZ1UUNyMHptdm1nVVNGelQ3eWkzanpBc090?=
 =?utf-8?B?QUtaWWNvNU5nekhsYlQ1SGlHb1YxWVdZYTI1RjJOa2lzMVRMemk1NEJLaUpJ?=
 =?utf-8?B?aFBBYzhvcEU4RTVPaWJiMTdFQ2l0TGx3M2VDME95VTZzL3ZhMG1NM0xReW9Q?=
 =?utf-8?B?U0pIakxTUXZld0NpT1ZBSFgybFdGdS9GMytYV0FWazBTN01BL0pLb1VFaDN5?=
 =?utf-8?B?dUFYRFNJdTZmUFRPTXhwdmMwYThUNy9PcTI1OTZ6bEZQd0RHQk82VVNjOWNk?=
 =?utf-8?B?NU1tV0NDR1RMQmJBdVFXNjV4eUw1MU5QbnVXck9Xb1hBbEN4OXJGZHpFd3ZJ?=
 =?utf-8?B?U1pZS1I5R0x3U25vc3lQT3k1b2t2WU91eGRha09IWXZmL2taYk1Qd0xIckZG?=
 =?utf-8?B?bGhYNW9oZVp3TWJ0NEk0MGR1akUxRGtrS1hpNFN3MFNxdXRHS0p3OFNQWjZz?=
 =?utf-8?Q?LItOyhqlH7pxH0Xk=3D?=
X-Exchange-RoutingPolicyChecked: PPmQtYjP3TmYYxqkl8YsdrM2RlpZ2yhSXpPC7fSamqr8tNZ++RGNFnCphJlilI4o2G4sbBiS1h7mSVyO/3znNs1mMUuKS+qfl+g1BuqqTnQ9V5ZMHLV5QDr42nvtIf5q0Zz6cJzrixKvlres1fHhfd/gnX7dR5qJ8bQTQfAek+J4WRFUns9LoI8j9TS3r54RmC2xEMTDsknIyjPhZAiHW5glpiVGvmdk+9mn/pYH6bLMuiiNuvP+IUyqYPMNIKanJrQrorFD+lJCABcKezRV2MxIQ/XWJvIhdsXohvUf7JI/MlDJ5iqdkdVW1reBQydwut6l86jhJswKVoYKY0GfBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f74d99-aeff-4206-8033-08df09e1f176
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 17:36:53.7590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2clAZzJEmpofOWT++wsbqqoGruVMOcdLOOMD1sanWI5QredAnGWlJLLQeMTRQrM5MJI3upVuGnFx5EPph5i/Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB160535
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
> Expose curve-point temperature and pwm controls via
> pwmF_auto_point[P]_temp and pwmF_auto_point[P]_pwm, where
> F is the fan number and P is the fan curve point number.
> Each fan curve point has temperature and pwm sysfs.
>
> Update Xe hwmon ABI documentation for pwm auto point temperature
> attributes.
>
> v2:
> - Use xe helpers for dmesg logs.
> - Update kernel version in Xe hwmon documentation.
> - Correct debug level of some dmesg logs.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: Codex:gpt-5-4
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  16 +
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 700 +++++++++++++++++-
>   2 files changed, 715 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index effc7d38ce1f..68cc6b99e8a5 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -341,3 +341,19 @@ Description:   RW. Fan control mode selector.
>                  user table control and value 2 to use firmware default behavior.
>   
>                  Only supported for particular Intel Xe graphics platforms.
> +
> +What:          /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_auto_point[1-10]_temp
> +Date:          June 2026
> +KernelVersion: 7.2
> +Contact:       intel-xe@lists.freedesktop.org
> +Description:   RW. Temperature in millidegree Celsius for each fan curve point.
> +
> +               Only supported for particular Intel Xe graphics platforms.
> +
> +What:          /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_auto_point[1-10]_pwm
> +Date:          June 2026
> +KernelVersion: 7.2
> +Contact:       intel-xe@lists.freedesktop.org
> +Description:   RW. PWM duty value (0..255) for each fan curve point.
> +
> +               Only supported for particular Intel Xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index fa9dbadd5fd6..a3ed139ad446 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -173,6 +173,10 @@ struct xe_hwmon_fan_info {
>   			/** @speed: fan speed in percentage */
>   			u8 speed;
>   		} fcp[MAX_FAN_CONTROL_POINTS];
> +		/** @last_point_temp_valid: last user temperature point was written */
> +		bool last_point_temp_valid;
> +		/** @last_point_speed_valid: last user PWM point was written */
> +		bool last_point_speed_valid;
>   	} fan_table[FAN_TABLE_MAX];
>   		/** @max_rps: maximum fan RPS */
>   		u32 max_rps;
> @@ -779,8 +783,11 @@ static const struct attribute_group hwmon_attrgroup = {
>   	.is_visible = xe_hwmon_attributes_visible,
>   };
>   
> +static const struct attribute_group hwmon_curve_attrgroup;
> +
>   static const struct attribute_group *hwmon_groups[] = {
>   	&hwmon_attrgroup,
> +	&hwmon_curve_attrgroup,
>   	NULL
>   };
>   
> @@ -945,7 +952,7 @@ static int xe_hwmon_get_num_fans(const struct xe_hwmon *hwmon, u32 *num_fans)
>   }
>   
>   static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *point_count,
> -					int table_type)
> +					enum fan_table_type table_type)
>   {
>   	int ret;
>   
> @@ -960,6 +967,16 @@ static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *poi
>   		return ret;
>   	}
>   
> +	xe_dbg(hwmon->xe, "fan %d %s point count read as %u\n", fan,
> +	       (table_type == USER_FAN_TABLE) ? "user" : "stock", *point_count);
> +
> +	if (*point_count > MAX_FAN_CONTROL_POINTS) {
> +		xe_err(hwmon->xe, "fan %d %s point count %u exceeds max %u\n", fan,
> +		       (table_type == USER_FAN_TABLE) ? "user" : "stock", *point_count,
> +		       MAX_FAN_CONTROL_POINTS);
> +		return -EINVAL;
> +	}
> +
>   	xe_dbg(hwmon->xe, "fan %d %s point count read as %u\n", fan,
>   	       (table_type == USER_FAN_TABLE) ? "user" : "stock", *point_count);
>   
> @@ -985,6 +1002,60 @@ static int xe_hwmon_write_user_fan_point(struct xe_hwmon *hwmon, u8 fan, u8 poin
>   	return ret;
>   }
>   
> +static int xe_hwmon_commit_user_fan_table(struct xe_hwmon *hwmon, u8 fan)
> +{
> +	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	u32 point_count = fi->fan_table[USER_FAN_TABLE].fan_control_point_count;
> +	int point;
> +	int ret;
> +
> +	if (!point_count)
> +		return -ENODATA;
> +
> +	for (point = 0; point < point_count; point++) {
> +		u8 temp = fi->fan_table[USER_FAN_TABLE].fcp[point].temp;
> +		u8 speed = fi->fan_table[USER_FAN_TABLE].fcp[point].speed;
> +
> +		/* Ensure fan control points are strictly increasing order */
> +		if (point > 0) {
> +			u8 prev_temp = fi->fan_table[USER_FAN_TABLE].fcp[point - 1].temp;
> +			u8 prev_speed = fi->fan_table[USER_FAN_TABLE].fcp[point - 1].speed;
> +
> +			if (temp < prev_temp || speed < prev_speed) {
> +				drm_dbg(&hwmon->xe->drm,
> +					"fan %d invalid user point previous value > current %d: %u/%u prev=%u/%u\n",
> +					fan, point, temp, speed, prev_temp, prev_speed);
> +				return -EINVAL;
> +			}
> +		}
> +
> +		drm_dbg(&hwmon->xe->drm,
> +			"committing fan %d user point %d temp %u, speed %u %%\n",
> +			fan, point, temp, speed);
> +		ret = xe_hwmon_write_user_fan_point(hwmon, fan, point, temp, speed);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	drm_dbg(&hwmon->xe->drm,
> +		"committing fan %d user table with %d points\n", fan, point_count);
> +	ret = xe_pcode_write_timeout(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL,
> +							   FSC_WRITE_NUM_FAN_CONTROL_POINTS,
> +							   fan),
> +				     point_count, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
> +	if (ret) {
> +		drm_dbg(&hwmon->xe->drm,
> +			"failed to update fan %d user table count, ret=%d\n", fan, ret);
> +		return ret;
> +	}
> +
> +	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
> +	fi->is_full_speed = false;
> +
> +	return 0;
> +}
> +
>   static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
>   					    bool is_full_speed, enum fan_table_type table_source)
>   {
> @@ -1105,6 +1176,633 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
>   	return 0;
>   }
>   
> +#define XE_CURVE_IDX(fan, point)	(((fan) << 8) | (point))
> +#define XE_CURVE_FAN(idx)		((u8)(((idx) >> 8) & 0xff))
> +#define XE_CURVE_POINT(idx)		((u8)((idx) & 0xff))
> +
> +static int
> +xe_hwmon_decode_curve_index(u32 index, u8 *fan, u8 *point)
> +{
> +	u8 local_fan = XE_CURVE_FAN(index);
> +	u8 local_point = XE_CURVE_POINT(index);
> +
> +	if (local_fan >= FAN_MAX || local_point >= MAX_FAN_CONTROL_POINTS)
> +		return -EINVAL;
> +
> +	*fan = local_fan;
> +	*point = local_point;
> +
> +	return 0;
> +}
> +
> +static inline enum fan_table_type xe_hwmon_get_active_fan_table(struct xe_hwmon *hwmon, u8 fan)
> +{
> +	if (hwmon->fi[fan].pwm_enable_mode == XE_FAN_PWM_AUTO_STOCK_TABLE)
> +		return STOCK_FAN_TABLE;
> +	else
> +		return USER_FAN_TABLE;
> +}
> +
> +static ssize_t
> +xe_hwmon_pwm_auto_point_temp_show(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	struct xe_hwmon_fan_info *fi;
> +	u32 point_count;
> +	u8 fan;
> +	u8 point;
> +	u8 temp;
> +	int ret;
> +	enum fan_table_type active_table;
> +
> +	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
> +	if (ret)
> +		return ret;
> +
> +	fi = &hwmon->fi[fan];
> +	active_table = xe_hwmon_get_active_fan_table(hwmon, fan);
> +
> +	guard(xe_pm_runtime)(hwmon->xe);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	fi = &hwmon->fi[fan];
> +
> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, active_table);
> +	if (ret)
> +		goto unlock;
> +
> +	if (point >= point_count) {
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	temp = fi->fan_table[active_table].fcp[point].temp;
> +	ret = sysfs_emit(buf, "%u\n", temp * MILLIDEGREE_PER_DEGREE);
> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret;
> +}
> +
> +static int xe_hwmon_update_user_fan_point(struct xe_hwmon *hwmon, u8 fan, u32 point,
> +					  u32 point_count, u8 temp, u8 pwm)
> +{
> +	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> +	int ret;
> +
> +	if (temp) {
> +		fi->fan_table[USER_FAN_TABLE].fcp[point].temp = temp;
> +		if (point == (point_count - 1))
> +			fi->fan_table[USER_FAN_TABLE].last_point_temp_valid = true;
> +	} else {
> +		fi->fan_table[USER_FAN_TABLE].fcp[point].speed = pwm;
> +		if (point == (point_count - 1))
> +			fi->fan_table[USER_FAN_TABLE].last_point_speed_valid = true;
> +	}
> +
> +	/* Cache intermediate points and commit once the last point arrives. */
> +	if (point == (point_count - 1) &&
> +	    fi->fan_table[USER_FAN_TABLE].last_point_temp_valid &&
> +	    fi->fan_table[USER_FAN_TABLE].last_point_speed_valid) {
> +		ret = xe_hwmon_commit_user_fan_table(hwmon, fan);
> +		if (ret)
> +			return ret;
> +		fi->fan_table[USER_FAN_TABLE].last_point_temp_valid = false;
> +		fi->fan_table[USER_FAN_TABLE].last_point_speed_valid = false;
> +	}
> +	return 0;
> +}
> +
> +static int xe_hwmon_get_u8_from_sysfs(long val, bool is_temp, u8 *out)
> +{
> +	long hw_val;
> +
> +	if (is_temp)
> +		hw_val = DIV_ROUND_CLOSEST(val, MILLIDEGREE_PER_DEGREE);
> +	else
> +		hw_val = DIV_ROUND_CLOSEST(val * 100, U8_MAX);
> +
> +	if (hw_val < 0 || hw_val > U8_MAX)
> +		return -EINVAL;
> +
> +	*out = hw_val;
> +
> +	return 0;
> +}
> +
> +static ssize_t
> +xe_hwmon_pwm_auto_point_temp_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	struct xe_hwmon_fan_info *fi;
> +	u8 fan;
> +	u8 point;
> +	u32 point_count;
> +	u8 temp;
> +	long val;
> +	int ret;
> +
> +	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
> +	if (ret)
> +		return ret;
> +
> +	fi = &hwmon->fi[fan];
> +
> +	if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
> +		drm_err(&hwmon->xe->drm,
> +			"pwm%d_enable not in manual mode; cannot update temp point %d\n",
> +			fan, point);
> +		return -EINVAL;
> +	}
> +
> +	ret = kstrtol(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_hwmon_get_u8_from_sysfs(val, true, &temp);
> +	if (ret)
> +		return ret;
> +
> +	guard(xe_pm_runtime)(hwmon->xe);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
> +	if (ret)
> +		goto unlock;
> +
> +	if (point >= point_count) {
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	drm_dbg(&hwmon->xe->drm,
> +		"updating fan %d point %d temp to %u, pwm %u\n", fan, point,
> +		temp, fi->fan_table[USER_FAN_TABLE].fcp[point].speed);
> +	ret = xe_hwmon_update_user_fan_point(hwmon, fan, point, point_count, temp, 0);
> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret ? ret : count;
> +}
> +
> +static ssize_t
> +xe_hwmon_pwm_auto_point_pwm_show(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buf)
> +{
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	struct xe_hwmon_fan_info *fi;
> +	u8 fan;
> +	u8 point;
> +	u32 point_count;
> +	int ret;
> +	enum fan_table_type active_table;
> +
> +	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
> +	if (ret)
> +		return ret;
> +
> +	fi = &hwmon->fi[fan];
> +	active_table = xe_hwmon_get_active_fan_table(hwmon, fan);
> +
> +	guard(xe_pm_runtime)(hwmon->xe);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, active_table);
> +	if (ret)
> +		goto unlock;
> +
> +	if (point >= point_count) {
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	ret = sysfs_emit(buf, "%u\n",
> +			 DIV_ROUND_CLOSEST(fi->fan_table[active_table].fcp[point].speed * U8_MAX,
> +					   100));
> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret;
> +}
> +
> +static ssize_t
> +xe_hwmon_pwm_auto_point_pwm_store(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	struct xe_hwmon_fan_info *fi;
> +	u32 point_count;
> +	long val;
> +	u8 point;
> +	u8 fan;
> +	u8 pwm;
> +	int ret;
> +
> +	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
> +	if (ret)
> +		return ret;
> +
> +	fi = &hwmon->fi[fan];
> +
> +	if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
> +		drm_err(&hwmon->xe->drm,
> +			"pwm%d_enable is not in manual user mode, cannot update pwm point %d\n",
> +			fan, point);
> +		return -EINVAL;
> +	}
> +
> +	ret = kstrtol(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_hwmon_get_u8_from_sysfs(val, false, &pwm);
> +	if (ret)
> +		return ret;
> +
> +	guard(xe_pm_runtime)(hwmon->xe);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
> +	if (ret)
> +		goto unlock;
> +
> +	if (point >= point_count) {
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	pwm = max_t(u8, pwm, fi->min_pwm);
> +
> +	drm_dbg(&hwmon->xe->drm, "updating fan %d point %d pwm to %u\n",
> +		fan, point, pwm);
> +	ret = xe_hwmon_update_user_fan_point(hwmon, fan, point, point_count, 0, pwm);
> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret ? ret : count;
> +}
> +
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point1_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 0));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point1_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 0));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point2_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 1));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point2_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 1));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point3_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 2));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point3_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 2));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point4_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 3));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point4_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 3));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point5_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 4));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point5_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 4));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point6_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 5));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point6_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 5));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point7_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 6));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point7_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 6));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point8_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 7));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point8_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 7));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point9_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 8));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point9_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 8));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point10_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 9));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point10_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 9));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point1_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 0));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point1_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 0));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point2_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 1));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point2_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 1));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point3_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 2));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point3_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 2));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point4_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 3));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point4_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 3));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point5_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 4));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point5_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 4));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point6_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 5));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point6_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 5));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point7_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 6));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point7_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 6));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point8_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 7));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point8_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 7));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point9_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 8));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point9_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 8));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point10_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 9));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point10_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 9));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point1_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 0));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point1_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 0));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point2_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 1));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point2_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 1));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point3_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 2));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point3_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 2));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point4_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 3));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point4_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 3));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point5_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 4));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point5_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 4));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point6_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 5));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point6_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 5));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point7_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 6));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point7_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 6));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point8_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 7));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point8_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 7));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point9_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 8));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point9_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 8));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point10_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 9));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point10_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 9));
nit: could SENSOR_DEVICE_ATTR boilerplate above be collapsed with a 
macro, e.g.:

#define XE_FAN_POINT_ATTRS(fan, point)        \
     static SENSOR_DEVICE_ATTR(pwm##fan##_auto_point##point##_temp, 0644,\
                   xe_hwmon_pwm_auto_point_temp_show,       \
                   xe_hwmon_pwm_auto_point_temp_store,      \
                   XE_CURVE_IDX((fan) - 1, (point) - 1));   \
     static SENSOR_DEVICE_ATTR(pwm##fan##_auto_point##point##_pwm, 0644, \
                   xe_hwmon_pwm_auto_point_pwm_show,        \
                   xe_hwmon_pwm_auto_point_pwm_store,       \
                   XE_CURVE_IDX((fan) - 1, (point) - 1))

#define XE_FAN_ATTRS(fan)      \
     XE_FAN_POINT_ATTRS(fan, 1);  XE_FAN_POINT_ATTRS(fan, 2);  \
     XE_FAN_POINT_ATTRS(fan, 3);  XE_FAN_POINT_ATTRS(fan, 4);  \
     XE_FAN_POINT_ATTRS(fan, 5);  XE_FAN_POINT_ATTRS(fan, 6);  \
     XE_FAN_POINT_ATTRS(fan, 7);  XE_FAN_POINT_ATTRS(fan, 8);  \
     XE_FAN_POINT_ATTRS(fan, 9);  XE_FAN_POINT_ATTRS(fan, 10)

XE_FAN_ATTRS(1);
XE_FAN_ATTRS(2);
XE_FAN_ATTRS(3);
> +
> +static struct attribute *hwmon_curve_attributes[] = {
> +	&sensor_dev_attr_pwm1_auto_point1_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point2_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point3_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point4_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point5_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point6_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point7_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point8_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point9_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point10_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point2_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point3_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point4_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point5_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point6_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point7_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point8_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point9_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point10_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point1_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point2_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point3_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point4_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point5_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point6_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point7_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point8_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point9_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point10_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point2_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point3_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point4_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point5_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point6_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point7_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point8_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point9_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point10_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point1_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point2_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point3_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point4_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point5_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point6_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point7_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point8_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point9_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point10_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point1_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point2_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point3_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point4_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point5_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point6_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point7_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point8_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point9_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point10_pwm.dev_attr.attr,
> +	NULL
> +};
nit: Could the entries of hwmon_curve_attributes[] be generated with a 
small macro. e.g.:

#define XE_ATTR(fan, point, kind) \
&sensor_dev_attr_pwm##fan##_auto_point##point##_##kind.dev_attr.attr

#define XE_FAN_KIND_LIST(fan, kind)                       \
     XE_ATTR(fan, 1, kind),  XE_ATTR(fan, 2, kind),        \
     XE_ATTR(fan, 3, kind),  XE_ATTR(fan, 4, kind),        \
     XE_ATTR(fan, 5, kind),  XE_ATTR(fan, 6, kind),        \
     XE_ATTR(fan, 7, kind),  XE_ATTR(fan, 8, kind),        \
     XE_ATTR(fan, 9, kind),  XE_ATTR(fan, 10, kind)

#define XE_FAN_ATTR_LIST(fan) \
     XE_FAN_KIND_LIST(fan, temp), XE_FAN_KIND_LIST(fan, pwm)

static struct attribute *hwmon_curve_attributes[] = {
     XE_FAN_ATTR_LIST(1),
     XE_FAN_ATTR_LIST(2),
     XE_FAN_ATTR_LIST(3),
     NULL,

};

Thanks,
soham

> +
> +static umode_t xe_hwmon_curve_attributes_visible(struct kobject *kobj,
> +						 struct attribute *attr, int index)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +
> +	/* Temp/PWM pairs for each point. */
> +	u32 attrs_per_fan = 2 * MAX_FAN_CONTROL_POINTS;
> +	u32 fan = index / attrs_per_fan;
> +	u32 local = index % attrs_per_fan;
> +	u32 point_count;
> +
> +	if (!hwmon->xe->info.has_fan_control)
> +		return 0;
> +
> +	if (fan >= hwmon->num_fans)
> +		return 0;
> +
> +	point_count = max(hwmon->fi[fan].fan_table[USER_FAN_TABLE].fan_control_point_count,
> +			  hwmon->fi[fan].fan_table[STOCK_FAN_TABLE].fan_control_point_count);
> +
> +	if (!point_count)
> +		return 0;
> +
> +	if (local < MAX_FAN_CONTROL_POINTS)
> +		return (local + 1) <= point_count ? attr->mode : 0;
> +
> +	if (local < (2 * MAX_FAN_CONTROL_POINTS))
> +		return (local - MAX_FAN_CONTROL_POINTS + 1) <= point_count ?
> +			attr->mode : 0;
> +
> +	return 0;
> +}
> +
> +static const struct attribute_group hwmon_curve_attrgroup = {
> +	.attrs = hwmon_curve_attributes,
> +	.is_visible = xe_hwmon_curve_attributes_visible,
> +};
> +
>   static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>   {
>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
