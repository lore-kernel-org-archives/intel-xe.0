Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8F0C0218D
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 07:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4BD10EA27;
	Fri, 31 Jan 2025 07:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/ClkemB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D91010EA27
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 07:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738309084; x=1769845084;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vZz7J/KOnQFyF35tmkt/1/+FFbtdoOGBp8et85rWzYI=;
 b=S/ClkemB6Jdyem7I+mAvV2u9wkKs8OqeO9yfCDbYyCSrMmvinCJUpA51
 zoMyfSRJS5YgwlQdbi4+XcN+WWP6i8nAbYIZ1fF0t+aHk75Q9fHL/cuoz
 ZrcNdPdYMzI8rNsSyCZSrY9OK5H7lxqC9IYVVpGcQBia0V0jtBUzV632a
 v/6LBt+HLlzfJxDk9DKDaBBKgvgAmdZM6jZbuCjHijs5Op18Y7NzqUffN
 qE3nmYftjNfRyzZSiaUpXNmSmjZMq0au4kgbcVWKqsdnKjYwUGAF4fZC8
 en5EGSZ+68RNMioaiR+LBP3yMrtdbcuCSHFnXZ0TueZQCDBxLwO2CX7o8 w==;
X-CSE-ConnectionGUID: MYo0V6uvRweBIBd5Uqjq/g==
X-CSE-MsgGUID: gMtTJK4GQfOP2jrvnGEJfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38777801"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; d="scan'208";a="38777801"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 23:38:03 -0800
X-CSE-ConnectionGUID: dU58suV0RC+/pbLItRbQQw==
X-CSE-MsgGUID: KP7yUkklSSuvhmAqDgnVdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; d="scan'208";a="109508299"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 23:38:03 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 23:38:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 23:38:03 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 23:38:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9WpzFbGapZ1m82AVxUfGVVESMxZhNseuy/JhDGrsntYqm3qtGQPWgn08wXprmbEbtvrSlDy4uz1G5D57uG7RhWi0F3mHIVAw3rPqu4Lbglecm3gapCO3AJTt/LeUKZBWUS+7KAqfKSNOA8j72091sjRG57LVs9bH5pCszPTHuH0yuh5YLI6eGulCXZ3Rs47QeCkOir6YN7FTgsR4Vt6n0pBXeXWyQxVY7sXCerXmT01uUI9dE3e5q5Kro6M/hXJLV1AzC6M9bQ6spcP1H9+iEurh0cKG2EsgtDXkpeYAk9z4rVEZBogi3XFnzicfDo6HwT/5Spo2BeFoZIoRH7Zjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0lf0jG5KsldHrtG+LPzDUfbBFVZH4ZivTHwMb1TWtI=;
 b=buoHaQCjqg4LXfw7lEEMcYLYbDIPXJ1aWX2bV4hKUtIlql5nq1JS2FQy9hICog5/tcOZ/SaWwHT9pIG081mcTi39ciVAwoKViICk1G6w8gLgDo6M2HjI09rqvkz3Jj5cU8mCf5Xjlb8UCK/pEXMjr5PzBbaefZu1NowZOOvo1ux4MkCGpMDAsEG8xXqBUGmC1fZVoQyGtuY6/ls3nnXHP5uun/j/ohhLNUzZga3LE3Xkv6CpKPUaWTiWNgUhs5f4pF+9wcinGISmfLZ8kxsq75VQmLMP/eHDvv4b3IvSRsPqEBMNC4yrTNt5bLq6OZsQQgp68dAC+/pI4GuCX7y+hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by PH7PR11MB6881.namprd11.prod.outlook.com (2603:10b6:510:200::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Fri, 31 Jan
 2025 07:37:20 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%3]) with mapi id 15.20.8377.021; Fri, 31 Jan 2025
 07:37:20 +0000
Message-ID: <54eff7e0-9c48-4b4c-9d86-41b5c8c1040f@intel.com>
Date: Fri, 31 Jan 2025 09:37:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Add xe_mmio_init() initialization function
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.d.roper@intel.com>, <lucas.demarchi@intel.com>,
 <koby.elbaz@intel.com>, <yaron.avizrat@intel.com>
References: <20250130105057.136586-1-ilia.levi@intel.com>
 <20250130105057.136586-2-ilia.levi@intel.com>
 <efc3c364-a41d-4ab6-a3bc-f1e571326712@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <efc3c364-a41d-4ab6-a3bc-f1e571326712@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0028.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::10) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|PH7PR11MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fda13bc-a492-4ca0-4620-08dd41ca17e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0s4V2lUTldTcG0rc3V1MHF3TVowN3FnUjJFUDZvTFdoUFZONlB1Y2d6b3Nv?=
 =?utf-8?B?aU1zWW5adzFCY1l3Y2FuaVF3MUg5YnVwQUJySDJSaWx4ZXpyZ1F3dzZER1V0?=
 =?utf-8?B?U3cyQWdleHM2WjRjRmJwWUU1Z3R2V3ZaQmlGTzdOZjl4VXpYRTUvN3hRaXMy?=
 =?utf-8?B?Rno5Mk54QllqWUhQbVBEL24rYmRLMkp3OHppcnZVVkVwbFdDVm92SjFKTU1V?=
 =?utf-8?B?bExTSkU2aUJuQ3gvVEFXYytFMER0bm1WdzRHYjFRWkErN1NxMWdhSG8vN2Zs?=
 =?utf-8?B?bGtNTkQ1cDNTZWZPaFRWSy9ReS9ocS9PbGMrczd6eXowc0greXlQRW1uaEk4?=
 =?utf-8?B?UFBPRVRsRjl3Z0NMR1Mvb0tLRTJQeEdqeWFuMGN6QnBJQVovZlpmUlZYUEZr?=
 =?utf-8?B?d2JPcXpLKzNwaDRmc09aN1llOXZHQTI3ditiVTZleWlLdEtHcTk2ZUYxcXk4?=
 =?utf-8?B?eVZkWFhyZXdLdEhDTW10Ui9IbFFVRERiTVNqeFU5OFdZK29yMk5Hd2lac0p2?=
 =?utf-8?B?aFV1T1ZSZ05nb01lSFYzaFNYTDVWSUV1dTlGMHNaTVJFRFFnQ016eURwRHhQ?=
 =?utf-8?B?MWpEaHVLN2R3RmdGSjZ3cjFrRTI0NHBWTmxGS0wyZGxTWFloVGFhQlBjTVZZ?=
 =?utf-8?B?UUNmbTlEbUNERGR2YWpDUGtwc3Y3N3pBNUxVV0pkT3hRbWFJbzgweDZyajl3?=
 =?utf-8?B?bGE0S0dHZkdzYUw2MlVncmFDRVpOVlpwNUJTR2d0VEkwWFhVcWdPRVhCdTZU?=
 =?utf-8?B?VTI2Z2FpYVVtMjFPNmxWNDh5dEw3a3NyNklzbUJwQ091SW9XcFpCUW9HK3FV?=
 =?utf-8?B?NzI2ZjEwdXh6SlpUd2dnZjhyUVczYlphSWpoN1A5SE80VlU2WFR0UzVFRTRW?=
 =?utf-8?B?a01Sczd1S2JIZ0RhY0tCYTdZaUwzaWNIR1FSZG5nZkorVFhRY2RLOERkeit6?=
 =?utf-8?B?MzVoYkdqWWJPcG16Y1NNNDkwby9XUlN2SVpLOCtVaExvTy9VVXowajlMbGln?=
 =?utf-8?B?N3IxaGhVYzVaSm9TMHhrak1Wd3NrdnIrU0pnMnFqUWdCdUN0b1lzSlo0TmRj?=
 =?utf-8?B?MHoxZjZlOUltZkZJaWV4V2NUbmlaNUdhVCtqVms1VzQ0WEc0dU1YUGhyY3Yx?=
 =?utf-8?B?WUhxMWw3OCt6cFpVampVTDBhRGZOWm1NcHR0b1hJK2t5QkRja3UxSnE4b2g1?=
 =?utf-8?B?VUtMZUN0cnhIejNsUEVGTDhRK2lNT2lWVm1kOUpwdTZsUFNPVThCVnJmUnR6?=
 =?utf-8?B?TVpmcUpDSmkvSllxbHROOGtlTmNtQkNWS01udGs3cmNkNGk4OUNxUi8wN2Jz?=
 =?utf-8?B?WE5GSkxjclJTQ1Juc3E3UXl1ODJYSDRmWEcxaGNtT0lLc04wZkliRit4aHdG?=
 =?utf-8?B?OCtPQUxwQkp4bVdWNGZyQ3BDOE1sRE9HdUJ4VDJaMmZ3amJJTHNoS2hVRFVq?=
 =?utf-8?B?TUcvUE81OXUxVk5peUNpRkJsR2dVWS9ZRjZIb3hlaWlWaE0rSDU3NlI2eDBk?=
 =?utf-8?B?SkZ4RFFHWjc2QnBJVEVBVmtYKzZKTnhxalpSeDAzYUFlK2tTaDBKM0hocE9P?=
 =?utf-8?B?YU5SUGJzeEwwSkZvTm5kcmcyTHl6YXd1anlpWlVzQ294L3Z1d3VTeFRGcG5K?=
 =?utf-8?B?RFM0ZHNvdDhGY0NQVnJWZFE0clpKSUk3Q1JkcnVVZ3poVTB5eENFWlRkNEYz?=
 =?utf-8?B?UjJYMmZOazlkbVpUNU1rWHl1eWp5M3UxNGU2T2k3S1JIQ1dZdFdtc3A4dFZZ?=
 =?utf-8?B?L0thZWtkVVpWR1lTSm1OWEh4Qk95K3VNTDc1U1FHdzlUcm14Q1ZDWmFQNVZY?=
 =?utf-8?B?WHF6NmMrbm44dnBqNHEzMDlpNHU4anc0Unc2aEphWHlFd092YmVuQXB6VFo4?=
 =?utf-8?Q?73tdo3GYlaVqY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm4zU3R6dEthc1hDcHYzYk5uMHlnZjZ4RiswS0NGN1ZKY0xPQUkxVyt1czc1?=
 =?utf-8?B?WnhqQ0RlQkNiUzA1MXlBZHVkdzZEZVY0RDRnZEFlVGZoa3BGdUpCeVhrWGpQ?=
 =?utf-8?B?NHhUcEhIeEpoSU9YOTVEckNZRk96elY2aTRUc1RyT2RUYXpObmNpTENLMFhS?=
 =?utf-8?B?RDBMSFdEZXF5bGNUY1czbFdPNGlTZUp0anYyOUhiQ280eTlsNER3My9PZlRl?=
 =?utf-8?B?TTJqNVRIQWpNeU9DbENBL2FrVG9oMjZINjRVRm5XenZ1d21TRTNvWlNkcjdY?=
 =?utf-8?B?Wmd0NDRmUmJTejhPdkdVa0RKd29NVVdNTFNqdFFqM1JiSnorRWY2SVNJN2x6?=
 =?utf-8?B?QmU3cXEvWHRWeEV0UUN6Q015aU9yNlZmL1ljZlBQK1FsUTQyMkdRSFBDckFy?=
 =?utf-8?B?SloydHBTT2ZzNXZIbEo1Mk1CSU5aL2ZiTlFib1c2bFIvcGFGa1JJMEt0ZUFF?=
 =?utf-8?B?MzN2QWNYVXVhT0NTc25RQTJxdzR2YmM0cERucDl1S285RXFaWEVQblNNd2Mr?=
 =?utf-8?B?N3dhSDFjVlJtcWxWbVNHeXpaMUhxQmlzd2FVSDRmNFBkdFV4bGpFWjVJZ2lK?=
 =?utf-8?B?YXcwNzNOOFJScjQvZTdoaVhrUnkwRXJjMm0rbkh3MGFkZGhnWTRMNDErQTFv?=
 =?utf-8?B?d1lpSzFWYVVreG43eFdaeEdRNHIrY1ZYRnRjcDdxVWhtUkxicHd2TlMzRGFa?=
 =?utf-8?B?WVdTb2JoL1plcmJGSmdqNnpBaWhmQ1RRSlNwYldhcVpUUFczNkdNUVhyaDJY?=
 =?utf-8?B?NmUya0E0bkdwOUFPaFArekZrUHN1Q0tuQ2N6V0R1ZC9CTklieFJnMnRrdkdi?=
 =?utf-8?B?cG1aeWpWTkM0eHNmcjBOTkVWSTNVdGtXWFpiSkFoNWZUSk5pTXJ4Y09EYXdh?=
 =?utf-8?B?SGsrTTlycGlsbytZQkxPMlM5NHgyellvZUFILzFHV2tpekFxRVVIMGY5b3ZV?=
 =?utf-8?B?YmIwWjNCRDRsWG44S3YwZkI3QzZTMEd2dHlvSVBqRytxOFNVSld5YmFhK1Zz?=
 =?utf-8?B?dGx5dG9DN0lzclpPVVZ2T0FQRmlHZGtUeTNXNGNWRmRnYXYyU24zbzRkN0pX?=
 =?utf-8?B?MVV5elpQVDJERHFlNktjUFYzM3JydHZoNy92ZG1HYUkzZDJYSXhQT3dMUGhj?=
 =?utf-8?B?aVRhenBxM2RBUk4yamMvaFNmZDdiQjdORXJrbUc5aC9DSXFIQVR3L1B6dE9T?=
 =?utf-8?B?aFlvaWxKZ1pEY3NmS3pyeXhPV2hZMnkvN0JSYk5xMVdXRTZheGpKWGt1ajl1?=
 =?utf-8?B?N1pkUjdqMjVPUTBHb0RkYmFWMVFEbmROcUVYdUlmeTZJT3dUV1dDdURtN3ZJ?=
 =?utf-8?B?UjNhQTByQlE4K0RUOERLQ3ArNkVTT2pYakN0NFZUdlcrTzMwOUE1NHNDVWxF?=
 =?utf-8?B?dUtRN3UxUXROUnFGcTdOZ2JqbXJKeDVvTW9zbXBuWkZMZUk5ZFVVV043dzRY?=
 =?utf-8?B?RUdjbmJFa04xeVh5VmlCcW5KZ3lIdlFEangvZlo3Q1pFSWtpdkRyak1nYkhI?=
 =?utf-8?B?TmJNeVd1SGlRbFUxWm1HM2FEZGtGYitIRlFVL0hselR6QWkzanRmL1dTSmNy?=
 =?utf-8?B?Tm5oRnRRTDFiazJ5U2JrNHNKOUdWWDBST0FRRENJanE0M0FGanRLWUhieFZR?=
 =?utf-8?B?eTJmcm10SHNKTUxXQm5JMElqS083cHZLMXFkcmpLTzI5NFFQMFhpMlRHT0V3?=
 =?utf-8?B?K29VdHRjd1l6UVk0SHNMamFicFRjcFQ4c3QwYUNYalB3WmUwWmJxaWhuaEJ3?=
 =?utf-8?B?b3o4U1dSODdsZVA3WXhYcFN2WHk4RDdDQlNZU1BoSTd0eTVLRnIyQ21yYmd4?=
 =?utf-8?B?Zjh4T2YxQTBja2Z6S1k4YTJPVVByM0M4S0JlaFc2cnN0ajE1OGRxb0xFM3B1?=
 =?utf-8?B?Q3VOQVFvY0Z3YzJzK3AwMlBlb29JQU5CYW9KaFFHM2VldUkreVFhYjNVZGxB?=
 =?utf-8?B?Zm1QLzNNYTNOZmUyN1F4RHRxNEs5UjRKZFh1N21IN0hyR3VYL1FQNjMrUExs?=
 =?utf-8?B?b1dZNGpvbzE0L2FOOGoxc0NCNEs0U1dGbEdhcFRHMEE3cWlpZjFOTzcvckJB?=
 =?utf-8?B?TFZtZ0NPT1NJSkRMcjlVUStPbmpJNlZLSzFGK0RYWkxZeFg5U0NqVlJtS3RL?=
 =?utf-8?Q?yuyu+r0YKFHNiKMSWA8QEiFjl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fda13bc-a492-4ca0-4620-08dd41ca17e9
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 07:37:19.9243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OaEKD7WYVNnGgInFqFVR5TnEgxUiYMxRCf+hTvpUE6rvnsOXiUyuye7faQt/ITSO8/5NYx96k/eu9uRRLvid7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6881
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

On 30/01/2025 21:54, Michal Wajdeczko wrote:
>
> On 30.01.2025 11:50, Ilia Levi wrote:
>> Add a convenience function for minimal initialization of struct xe_mmio.
>> This function also validates that the space referred by this xe_mmio is
>> small enough to be accessed with struct xe_reg.
> hmm, maybe is _large_ enough ?


The addr field of struct xe_reg is currently 22 bits, i. e. the biggest offset
that can be used within xe_mmio is up to 8MiB. This means that there's
no sense in instantiating xe_mmio bigger than 8MiB, as xe_mmio_read &
xe_mmio_write functions will not be able to access a register placed at
an offset after 8MiB. Hence, I validate that xe_mmio is no larger than 8MiB
(~ small enough). This patch is in continuation of the discussion I had with Matt in
https://lore.kernel.org/all/55e647fd-08b0-4395-8fb0-ad53ac3f9be7@intel.com
(specifically my 2nd comment there).

- Ilia

>
>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_reg_defs.h |  4 +++-
>>  drivers/gpu/drm/xe/xe_gt.c            |  7 +++----
>>  drivers/gpu/drm/xe/xe_mmio.c          | 24 +++++++++++++-----------
>>  drivers/gpu/drm/xe/xe_mmio.h          |  2 ++
>>  4 files changed, 21 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>> index 89716172fbb8..26d00d825454 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>> @@ -10,6 +10,8 @@
>>  
>>  #include "compat-i915-headers/i915_reg_defs.h"
>>  
>> +#define XE_REG_ADDR_WIDTH	22
>> +
>>  /**
>>   * struct xe_reg - Register definition
>>   *
>> @@ -21,7 +23,7 @@ struct xe_reg {
>>  	union {
>>  		struct {
>>  			/** @addr: address */
>> -			u32 addr:22;
>> +			u32 addr:XE_REG_ADDR_WIDTH;
>>  			/**
>>  			 * @masked: register is "masked", with upper 16bits used
>>  			 * to identify the bits that are updated on the lower
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 01a4a852b8f4..f10c1f5fbbe1 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -637,10 +637,9 @@ int xe_gt_init(struct xe_gt *gt)
>>  void xe_gt_mmio_init(struct xe_gt *gt)
>>  {
>>  	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_device *xe = tile_to_xe(tile);
>>  
>> -	gt->mmio.regs = tile->mmio.regs;
>> -	gt->mmio.regs_size = tile->mmio.regs_size;
>> -	gt->mmio.tile = tile;
>> +	xe_mmio_init(&gt->mmio, tile, tile->mmio.regs, tile->mmio.regs_size);
>>  
>>  	if (gt->info.type == XE_GT_TYPE_MEDIA) {
>>  		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
>> @@ -650,7 +649,7 @@ void xe_gt_mmio_init(struct xe_gt *gt)
>>  		gt->mmio.adj_limit = 0;
>>  	}
>>  
>> -	if (IS_SRIOV_VF(gt_to_xe(gt)))
>> +	if (IS_SRIOV_VF(xe))
>>  		gt->mmio.sriov_vf_gt = gt;
>>  }
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 3aed849a128b..8cee986947bc 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -55,7 +55,6 @@ static void tiles_fini(void *arg)
>>  static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
>>  {
>>  	struct xe_tile *tile;
>> -	void __iomem *regs;
>>  	u8 id;
>>  
>>  	/*
>> @@ -94,13 +93,8 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
>>  		}
>>  	}
>>  
>> -	regs = xe->mmio.regs;
>> -	for_each_tile(tile, xe, id) {
>> -		tile->mmio.regs_size = SZ_4M;
>> -		tile->mmio.regs = regs;
>> -		tile->mmio.tile = tile;
>> -		regs += tile_mmio_size;
>> -	}
>> +	for_each_remote_tile(tile, xe, id)
>> +		xe_mmio_init(&tile->mmio, tile, xe->mmio.regs + id * tile_mmio_size, SZ_4M);
>>  }
>>  
>>  int xe_mmio_probe_tiles(struct xe_device *xe)
>> @@ -140,13 +134,21 @@ int xe_mmio_probe_early(struct xe_device *xe)
>>  	}
>>  
>>  	/* Setup first tile; other tiles (if present) will be setup later. */
>> -	root_tile->mmio.regs_size = SZ_4M;
>> -	root_tile->mmio.regs = xe->mmio.regs;
>> -	root_tile->mmio.tile = root_tile;
>> +	xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
>>  
>>  	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
>>  }
>>  
> missing kernel-doc for this new public function
>
>> +void xe_mmio_init(struct xe_mmio *mmio, struct xe_tile *tile, void __iomem *ptr, u32 size)
>> +{
>> +	/* Validate that we can use XE_REG macro with this xe_mmio later */
>> +	xe_assert(tile_to_xe(tile), size <= (1 << (XE_REG_ADDR_WIDTH + 1)));
> you can use xe_tile_assert(tile, ...) here and BIT() instead of shift
>
> but I'm not sure I follow the logic here: if in the future we will
> change xe_reg.addr to more than 22 bits to allow new extended register
> definitions for new platforms, this assert will trigger when we would
> initialize older platforms with smaller MMIO BAR, no?
>
> maybe better place for such assert would be in xe_mmio_read|write():
>
> 	xe_tile_assert(mmio->tile, reg.addr < mmio->regs_size);
>
> and likely this new assert/ADDR_WIDTH could be added in separate patch

See my explanation above, I check the other direction - that xe_mmio is not too big to be
addressed with 22 bits. You're suggesting a check that the provided register offset, while
still being 22 bits, is smaller than xe_mmio size. It sounds like a good check to add, but
different from the concern that I had. I'll implement it in an additional patch.

- Ilia

>
>> +
>> +	mmio->regs = ptr;
>> +	mmio->regs_size = size;
>> +	mmio->tile = tile;
>> +}
>> +
>>  static void mmio_flush_pending_writes(struct xe_mmio *mmio)
>>  {
>>  #define DUMMY_REG_OFFSET	0x130030
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>> index b32e7ee4b23e..c151ba569003 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>> @@ -14,6 +14,8 @@ struct xe_reg;
>>  int xe_mmio_probe_early(struct xe_device *xe);
>>  int xe_mmio_probe_tiles(struct xe_device *xe);
>>  
>> +void xe_mmio_init(struct xe_mmio *mmio, struct xe_tile *tile, void __iomem *ptr, u32 size);
>> +
>>  u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
>>  u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
>>  void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val);


