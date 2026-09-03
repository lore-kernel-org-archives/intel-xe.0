Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F469C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 06:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B239C10E03E;
	Thu,  3 Sep 2026 06:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZ5jaCWm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488C810E03E
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 06:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788416585; x=1819952585;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SWzc89MeRmhnrVBI18qrceMJZRq4U5yT3ZVjFLbi9SU=;
 b=PZ5jaCWmyO886gJ0vTZ5fHw1T39H8NbWx478gwPyEDps1y6NwF4mc74L
 A8qzNd/m3Lrujc1Twbp7OhzlqFt8CrwdeRM5Xs4wvF/9QeE1RETWzeO2u
 C+W4RRPWleAbE+LVjWnIZcFlUZQ7Rn+F0Z1450jcppGmspMiNmpQsX6ba
 OC/Ij4MBNasER8ZThrJxilelp7H4+7bpSEG8nUUJNR1vsNxcJzgFxhy5C
 Qa80fh2Uzw/Zg8JxJw2uI6MTdPWCfaot9Axy/uW3OLR2n6Q7him4aVxiu
 jA62UA4FPP5Dsfd0qrDI9rI8+mi5965pisTZ5I3QlESBgcR5ledN9eaTy A==;
X-CSE-ConnectionGUID: H1E5jVYGQ6mXyfR6D8jUhA==
X-CSE-MsgGUID: 63AiRkQVQQGNZk6pc7gYUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88918905"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88918905"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 23:23:05 -0700
X-CSE-ConnectionGUID: AQ+kSataRSaObcM7NQ9+gQ==
X-CSE-MsgGUID: M1rUarK3TSeqQVClWpj7Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="273379655"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 23:23:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 23:23:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 23:23:04 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 23:23:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0Z0fIXN7Rl+RYAOW8ORAb002PK31JHbljgxnfgvCEcKzXP4DVjtzUMPDBOEcPIZtJDV1TvFOQGG86SwebLraA2lzhdCTAN1o7IJ4E6ecU/fpWz/Ugj8d9R2zNnAHXFPaMD8QXPkHUOLrKD0winrt4XCldimbBvhb3S/jOH5uUOJ2RGLE8iBSdd9wdcNRwiX0NZI0AFDhtNUBnvUfmP/d2YtJVtbDFPxIByDDVI+V4aG+w0TwBr+2LCiRCNYSw8VXnov/DkMU351eRqLXwB3ZDI68uXYVf5L/NJU11HGANmDG2luADcfG/6S0YTwOorWBuG0DuUMQ+NzQZt9Osg98A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neELFb0YmtdpTbfcwBAu3/s8xpS7j3oZodHtVFxGZZk=;
 b=aS/S3juomYH2p0XtYEnBZhpsaOLclBv019NSzRUJcs3SryrdFHWO4afnIWDEpMTpp4BzXR54/S4S23CZ725Y/kZAua4h4Rj2b+UT1IsZo0yA4eFtGs+wB0FZTes2Wi4kbjkWBuJCiZEVbqacaIAcfPdrN33uJtllkc9veyYe68sNLIaprT2pvY2zSdtTXKvUnSoVxRqfVzVcmqw61Vjj6LUdDY7W/JkLlTSxjJM4Qk+3J9E3LEYAGG41/ibX7IjH2jgn/PjpZLBrxyi/xdjjrO1x40B9nTmD71cP+vIAP36bQxyyYibm9clHThPJhWSME+iF2mtm6my/B7dDaB/yRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 06:22:57 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 06:22:57 +0000
Message-ID: <1bfb95e2-9ff6-40ee-9a3a-d1594bcda1a4@intel.com>
Date: Thu, 3 Sep 2026 11:52:48 +0530
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
X-ClientProxiedBy: MA0PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::10) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|SA2PR11MB4938:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c500031-01d2-443a-95fd-08df0983cb7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|6133799003|18002099003|22082099003|3023799007|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: qQvj+f06xiLiQ5jeSRVT4Q1ymugdyxC4vogx60juMd7WOnS5pVPVg1mEpoRqVhJUwB2UEKsMg7ffRloIIZP1+ZZnrB7AA0tv4+fJzCYGtdg6gXIol3fBN094MKa1wiufIfAdGK2HRTGM0yX1xswFNy+8f7DqyCFjrTfSdMcd5SRX1oX7iN6OFUsoScCMsSI58o6tZXhXvHr5hKkJHSTF/JVvwdG5hB5u/+19TZz0JlJeR/RZoZdcRj9q88kpvtBnSMC358jIF//lm8viaZpPAUMwcREKufBQQ7Dd3QUGeBIAQoTPMZoY4d/KtPVnuDMvzZ63GI00KjlLK08pepoCuduKcX96ZAkdhzhQY3UADFUw42oLOag2l2A9VYB2kzSS1xeigVeE2aLFDiLvO91YCzsgGdW64x/jKDiqIqaa9IP62pZmoHSDb6wbEAEps8x1Ca01cG2iIsYIDLNcFzbulgA/lDeryNqThzr0CDxvpMrpbm8PSt+7fI4DfP0NwjUsPliEe52pw0puZUkW5BlIUhoLAxG/dy3wVRdoodpSI7jxkqkCI3QC2QFm6eslMn6yDYt7AbLpPL6FGxI8a/TbnmgUlKuYVCApOzCCtBOWDnKFij4y28eJmo7jxERXs7x31tdBC3t6H19opX34OHWUV3YDnpnutTkp/4IqnPkBiPI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkZLOVd4bGhoVXQ5c2phRHN6dEhaN1pkaHlQdUVVSjhLbDdOSzBybDJzTFFa?=
 =?utf-8?B?QWFHeUR3R0ZydmdsZG1SMTJ2QVpONHU4WE9ENGFWL0lkcFhPRlpyYS9hVm9Q?=
 =?utf-8?B?RFh3QlNiZi9DSy9SMnpubEVnSktUUElpeFB1YmtDN2c3bjRJWkhMUk5yT2dL?=
 =?utf-8?B?ZDBCR2x4MHJhSFNkTmZlYitoNC81cndzTGJzc2NjemdPdWM2U25Yb25STEZa?=
 =?utf-8?B?SHU1WG5LdGVNTEFuRy9GMWd6UEttSXEvZmZ2R2VBVDRROHZ3NWJaeXJyRWtw?=
 =?utf-8?B?Ym5XMkpQMmV5RWRjLzhqc2tIeFhjMklGd2VDRjlCM1FsZno2T0R2V21uNlEy?=
 =?utf-8?B?NnhQL254dklGUlo0VkxmUjFuM0puclRMQUVqMUQ1V3RLWllnVlcxTDFqeFZN?=
 =?utf-8?B?L0FWUmZsQklSWkRIdXNTejRQOXNzUDE4WS80dnV6b29mc1dwcU5heXdHNVRx?=
 =?utf-8?B?cVZHL3hjMWxOQUhjRHB1dW5qN2krZ0EyMklHRnp0YmRiQmN0ZkFaREFPQzhq?=
 =?utf-8?B?Y0RZU0NFK2Z3ZjdWUlpObWRLT1JibEZmdUlac3lza3ZzdG5uMCtuMHdtVElV?=
 =?utf-8?B?cUQrQTBoKzJMV3BBblNEUS81YUwxN255YWp2b1RucmRlYkRQa3drL3YwQXJQ?=
 =?utf-8?B?bWVUY3dIRE9KVXlmQWtFVFBXVkM3UlF0enVqeU9OcGd4bmxRZHNWanI4UXhC?=
 =?utf-8?B?WXRoMEFnb1ZVL2t1YXlZRVMrZzhRNDIyR3NUd0N5N25CMmVYTzVmR3pEQ3Fs?=
 =?utf-8?B?RXRqeVQvc0pDTzFqZitHcVVpSDZKdUI2YzdnR1RNeE1wTitxaURObTJwL1NI?=
 =?utf-8?B?NUtvUFcxRGRLbVc3L0ZVTmVwRUtKVVREYnhGMTA0a0RyMHpVdnBITDlIMVpr?=
 =?utf-8?B?K1J0SFVPMHRmcDYxMlN6ZjFiMXRvSXNYc3pFeFVWN1FwMkZxbWY2SUpvN1Zq?=
 =?utf-8?B?c3p3c2dZV29VUUtYOThuT1FHVkd2Uk9sVjdKZnZzUFBad3VucjJIMzFVK1ZV?=
 =?utf-8?B?Mno0U0tNOHU5T2t4UjRVNHlmak5oeUcwbnN0UkNJZGtXRnc1WXNIYitlZGdq?=
 =?utf-8?B?Q2cxN21BMzZxeEkrSHZoaS9FOGt0ZFloYW53SFZCQzE1cldBN0owZ2VnbEhW?=
 =?utf-8?B?K2hETnRHUWFUMmNJSHdsUElqWWpHZDI3QmZ5YWdxY05tSGhQQlNrTGljTXVO?=
 =?utf-8?B?THljSzF2Nm1vUi8wWjBLRi9kYThWL2pETVd3T3JRU01tM3FuLzdlT3NQSTRw?=
 =?utf-8?B?MWUyaVdZeGRJMklqQXdya0FXMDZla0hMVmVYTXZidjArWVg0Z2x6eUxOcE9v?=
 =?utf-8?B?ZWxONElseWVBcnNnNG90ZGJnV3dyL04wVzZPbVZZK3g3QWE0T3pMNUkwa0Yv?=
 =?utf-8?B?alBTekxVNGE3MktyeloyMHV2SnRseGpkK3ZWamdhbk1FSXBQU3NSeVZuRDZR?=
 =?utf-8?B?RlJoMEtNNTlheSt0SmhLWEl4SjBEeG5RNEtPSWRaNldGVmwwcUhDZzBVZmQx?=
 =?utf-8?B?TCtWaVU1NUVQcmJBZFNvTnZML3NBbzBKbFQ1Zm1UZHlIL01aMVZHQURVbWJi?=
 =?utf-8?B?MHY3WFd1bUZSQ05EZmIzY3BFa1FOK0RLQklyM2E0eUc1b3pMbnNVUjh2TmdC?=
 =?utf-8?B?c05EM3k0OEhLMzlkQmpUUmFBb3FUWTdYT2dxZFlFdTBUSTdMRVZhQkJNSkwr?=
 =?utf-8?B?OStTUldZanNEZjZ1dkdwV1RVWGtXWDhob0UwQkRublNCSmE0U2RJcHFDY1pJ?=
 =?utf-8?B?L1kyVGQvTSsyT3ZmNHBpZ3FYbGpXbGlWWElVb2dCbCs1K3hCY0M2Qy9DelR3?=
 =?utf-8?B?VVptNDFRM0dLVW0vMlYwbTlmcURXVDY3d0taK1FFUU93cEg0NGE2RlJXRWFO?=
 =?utf-8?B?VDY0akZzUGxLZU4rb25zc2RKWDcxT0JuRGc3UWw2RU9GNWNwdm90cExvVGEr?=
 =?utf-8?B?SDl0V0xTMU1oaEw4UVNhTCs0cWJMamlwUzduV2tZKzhaeVJEckNXY2FUQVdW?=
 =?utf-8?B?OVgvQXVmSkExd3BYTWJ1NmNSQlhZenVjL0dQUWJhdWtvT2lhQXZSTDlwb0RX?=
 =?utf-8?B?RFlTWUFHZG5hZVJ5YUw0Y2N3ZXN6aS9NTzRkb0MxYU5wSUNWUXRZbVI3Tm9H?=
 =?utf-8?B?WmJNdWdSQ0JoMEM1WU13Vm1XbHpkQ3Nsdm5POXVSamJ0TTAzY3lhY2d3WWtH?=
 =?utf-8?B?cVhucE9ydXB6MFdESllGRGExeEhDU21yOE5hK2oyYlRxa0h5cVQ5NmtpelYz?=
 =?utf-8?B?THdid2lRYWMrVGhGYVA0cExrWG0xSG9JVFNjZ3AyOFN3WVNvMmdtWUNkdk9M?=
 =?utf-8?B?eEd5N1VvOFpsVHl5eFdnQUVIeFRyTUQ2VVJsdlUrVnRYRjJ4djE2bHc1WHUz?=
 =?utf-8?Q?PP3+ZPeGdhT4TJZQ=3D?=
X-Exchange-RoutingPolicyChecked: SdwkRtnQb4C+hi437qI+2UTTieCVWLQXnnM3q4JEFOuLy7qt7+f0b4Szd3PKbRC53QQhNTNEKKFqSCfPlFDjCB7lDvy/0f1r3lFwWlxetoEYgP4fPA23aH2BrSafqGBllbWeELG6hN/XC04Va8g8Uj8sQ7wI8zVwFNt4STpeU9lde+cduWb60GrT+7uQu7Pn+YBQ8ABCN6pZv6YHT83L1idFidgWlDKabMrdLyz8E3617LraS4w63SqWY3oKIW7IFI7MpZxx3eebldzVgw0+yXi0FURUvBihonYzbxTi9aDq0+byQvvtetybSG5TgyZ7wv/j9zD6LivEA8Z8ioXabQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c500031-01d2-443a-95fd-08df0983cb7a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 06:22:57.1643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Q80MQqW745zyKvEkGlSM5GVNrPs+PB7Nq97cAGGI2jizm63B1wO1cFrz+WJJig7Yl3aWAX9IrXBPiVxk7K4QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4938
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
Seems like this is redundant. As already after this code block, fan 
control point is being set.
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

Why do we need multiple point_count for setting a fixed pwm ? could it 
be managed with just 2 (max and min) points ? Then user fan table might 
not be required in this case.

Thanks,
Soham

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
