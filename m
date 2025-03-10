Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D783AC282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 05:36:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1FB10E0DB;
	Mon, 10 Mar 2025 05:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b7FMxtgm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E5310E0BF
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 05:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741584987; x=1773120987;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7UHno1SQANU+Zgsw1cr69E3Fv4+VJnwakzh2mKoWeGo=;
 b=b7FMxtgmYeZzAX+B4CSmdg7tm0F+oCI8ZQnBXtaZZu23AS/QyR0uSsLH
 Qoipo+Zg9MzS0IiYqGAUu4mySULRwvm3INBsJSuyyaRu+zM3+snmDTr7m
 UgIzwjoiux/YOxr0TacfejDuhWldbQMNi2Ow3Irf9XLmoEcOzliYfbo/m
 r+baPJcdwYMLJrdq3kzgk1ars9PRTWLFR4CF1V1rhxZ9Sv+EUxcv2r/CY
 Ia2TiJTZisD6+woimiY032bvifVaFKYNTlROigtTG0x2qXCch3EGKLLyZ
 Wqviji93o7jctZ6W/GndrVqG3WlRzgAefWuq2zlAVPl2S7M0qwFaEEp2d g==;
X-CSE-ConnectionGUID: Z4NC3NpZR5ypo/QdZnuGFw==
X-CSE-MsgGUID: NMIDfgdKQ2+To6T3U/sPjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="59973484"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="59973484"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 22:36:26 -0700
X-CSE-ConnectionGUID: 9XwAgXd0SoSqtuyNt1AQAw==
X-CSE-MsgGUID: s78VEFRmQIWMTuLNmnVAnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="150825228"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Mar 2025 22:36:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 9 Mar 2025 22:36:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 9 Mar 2025 22:36:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Mar 2025 22:36:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHhEuW6YDaq0J5JwpEMye3o8R7vnJVu6hlpieFUwLiskWuIjN08jHTepW3ayEvF3GHk19z+aUo7ebrGnTbLW+PzxD9GDkhNa4D6cdV4TktKNI0LICQdlClvkZVkH7ODUFjy5XcYeqXupKsrh4V+fOKm0Luuo9NUlKDYnnlmKnq9m5pxha8UNaF46uIYE5jBCLsDzv2i33jn/fURn/GP3jT59pHnu2NQ6mmPFUfpNU5j/7QJZbDMKVtsNb5KSUgdO47jr80hwrI6QW4wzscb3rY5fjXu2Spc3RTkyB5kGteNEx1cOKwv2eOvKPXOLoFWbPBzYbBtTkMHh2kC2T9KYWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DARE+9iXZmlu3fldcs4UgWSVoY60k/culVa4M8X6Cow=;
 b=J6QkIC2QidjzddjMXcKcSuzDe8tf9B7yWKtcTYqQUhaUCi72TfK0uwDVls1gludGaSeu5zch9hEklok4kpwm5kZmh/XkgUbGTOJVAYN1bZiwk9vDrOaRX9FIXdelE7js1R1rmppcArh7JUcJV8Vq5YvJxfqs/pRw60iIoyYz/57Cll/GseIiAv3+I4V0tiyDysSRMn2slsreVWKXe6W82zCZLFRNR1Mj0mhsZBMyxu+OqzbZqMVvcGcPSLL86Lj4ZjU9+iIIRcdla8ml7foYVyCcUcgSEoI33YFJjHusSVrmehzCK33VPHVP2n9v6YLdc9vfu4nuCdfCT6UQxU/12A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB7873.namprd11.prod.outlook.com (2603:10b6:930:79::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.26; Mon, 10 Mar 2025 05:36:17 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 05:36:17 +0000
Message-ID: <be1de046-1795-40a7-ba0d-750851061ddd@intel.com>
Date: Mon, 10 Mar 2025 11:06:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] RFC drm/xe: Enable configfs support for survivability
 mode
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <lucas.demarchi@intel.com>
References: <20250307142446.1790715-1-riana.tauro@intel.com>
 <20250307142446.1790715-3-riana.tauro@intel.com> <Z8sKXQWCa5eJrAqG@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z8sKXQWCa5eJrAqG@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB7873:EE_
X-MS-Office365-Filtering-Correlation-Id: 6060d40d-acba-43f7-dac1-08dd5f957a9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUdkS2UvRWpIaVlUVkJRLzFyWXlyNG10UEtsMmt1WFJEdDAvYU1nTEh5OXlZ?=
 =?utf-8?B?U0dvbkFmZW1SZTNUNC9hSmV6TFhRczUxU3ZGZllreFJBc2N2RFlNdUxJM2JV?=
 =?utf-8?B?Q0VyTHNRVjBDNkZJYlFweFYyRkJUNWwwOVU0NlY5M1YzaGxTY1hkVVorcnBX?=
 =?utf-8?B?SWdjaHpqU1lrWGF5M0dLcDhSNFVGUEp6ckxiblQ0TjkraFBOb0E0c2U5NnR1?=
 =?utf-8?B?YXFPbS9OdlZQU0YxQWFqL0JEbGRvMW05TVhkRVpaYitaUytwVTRWZkkyYko5?=
 =?utf-8?B?Nlp2a2R0OXUzcWJtVGJSdnhBQzZqTGprZS9Na01YQ0w0cXFLWmJkMW9jTTkr?=
 =?utf-8?B?SWUzZnhaT2JGNCtjUmVRYzhYTjZ5U3NmaG5Mdk9KUkpTQnVxSUlicWh2SFNW?=
 =?utf-8?B?NWYvbnZua09tTTlaRDRDcjJWUk0zV2x1QUtRWjgxem9RbzMyRXZYZjV0Q2dV?=
 =?utf-8?B?bEJJSGJ2Rm55clVBZnZYN0s4R2NpYVNKWTU0a2xNVXNpMHdMMVFIT3JVLzZI?=
 =?utf-8?B?ekRGaFVOanRPcmwwNzZ6azUxa3lXZkw4Q2wwSHNJRDc5RlRtWHFwaTNyQnJm?=
 =?utf-8?B?VXZ6b0xEMUFwTHBibURsTFZMR3AwSTFQTTZLVENheEk1bVV4UFI1czZ5YnRF?=
 =?utf-8?B?OVVXQjd1Ly92Vm1IMWxSZUY2R051Vll6aEJId0Nvdk1PUHIyblVINU52c1Va?=
 =?utf-8?B?clA3WEZ2VitsbURYckY0V0l4aEJEczV4SlphWjNGc3U1RnNmQjhkaE5DK0Rq?=
 =?utf-8?B?KzJ1SmNaVXRHUXYxV3BBNGRFVlVVeWRjdW12TXZyc3d4ZVVBZTZtUWMwY0dm?=
 =?utf-8?B?a01uRng5L1dvVzBRcDlMTFpqYktOTFptY2Y2VVQ4cjlYRGJhK0RMZGtkV3FP?=
 =?utf-8?B?OTBGRTczWk5kVGtKWlNqYnc3ZjNWN2ZvSG1sSUJudi9rUzlpMUUwUUMrU1NU?=
 =?utf-8?B?a0UzM1UrK2l2Q1hmTVpYQjhWTDh6VGFwbktBYWpKNS9XS2hEeUJmUTNpKzhL?=
 =?utf-8?B?VVJ2eFVjdENwM2IybEQ3b2h5R1FRK1dDdHJRNTRUTGVSNFIvTlk3S1VEYTBQ?=
 =?utf-8?B?NThTdnZtWG1Mdk5qKy9oTGhrWDVXbEp2Q0JoYTkzQ1BJbFA0cWY4MlJFb1BJ?=
 =?utf-8?B?MnQ4TnNwdkJMaHBidTNiYkVURDBZc2RIZjAzeXU3UDkwR3ErMmowZXFrQnE0?=
 =?utf-8?B?ZmpiaUlmekdNUFRuT2V2WEkyMmVLU2xUZXBtQjRNMFFBbTNaeXRpUHc2MzFL?=
 =?utf-8?B?NjBxQXlEaDdqdW9Yem1QVUFYN05HWWJqQ3RONjA3SWsrYitzS2ptWUVpMUU3?=
 =?utf-8?B?OFgwYkNIeXVtVjJKTHpRRWRpaCtQUTJ0Rk1tZExVR0tiTEtZN3pRL1hna0ow?=
 =?utf-8?B?WjlyTEJVSklnWUY4ZFdib3g5M25ZcDQxekZxSC9qdGIrUmdVMWpOWnU4anZ2?=
 =?utf-8?B?SEtOTWF3OFJvT2VjVk5pZHRZUEVLUEN1dUZHYkUySnphY3pVbzdCdHZQU1ly?=
 =?utf-8?B?TFJOcExyRFFCUk92ZUJtRTNkSVhJeHhqcVEvSmFHaEhOeXl3QjlMc20wUHhO?=
 =?utf-8?B?Q2pqUWJEcUZGNFMwRW1WZ2NyRmVDSmNnVXlyZ3A3VUdyTE0wd01MdUFFMUkx?=
 =?utf-8?B?NjdSSURSK0hpTzBHTkhkcVFBQWtOSnFPQU1UeGZ2V3B2TmxMRmdHMERyeEQz?=
 =?utf-8?B?TmVPbFk1SkMxd0h1YURLc2hRR1BCNGtTTVVJVS9vbytveStuc2x2NFVjQThG?=
 =?utf-8?B?UmU3bzdVeCt6T0psbTNacmExQXlJRmlWMlJYeml6SjRUVEg0cGVYaWVwMHVn?=
 =?utf-8?B?VkJHbjN0cjBTYW9pRjRIdlFHNXcxRTN5TlV3ZVpOMGk5UFZ1YTBjcFZCOVlw?=
 =?utf-8?Q?JUnxZPre+CIFI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WklMZGZHMHpuR3JjTnlnWnRFeHlZcjhCb3hSRm90b1RBYkFHMmovWUdFWEU5?=
 =?utf-8?B?TWRJbFR0NUlFbldldS9vSXBvdi9RWHJaQ1ZHU1gxYjZ4MzA0ZWs5ZjcxUFhi?=
 =?utf-8?B?THRITElvTU9mczA0c1NtNmsycFdOOHgvS0xCMEZiTm1OV0R0L2JnUnFrRGNk?=
 =?utf-8?B?L1BESVZxM1IrRzhHVHZkcG9tSllLaDBjZXlVUWpjaGRVd2FJUFREVkI1L0Qx?=
 =?utf-8?B?c0I0NzVHNzYyYWphSzhvazJHY2MreUszTGlCZFU1R3cyUHNzcnRrOUZTZ25B?=
 =?utf-8?B?Zk5IYkswMXp5Z2gvTlo1YWI1WkJRTkptcCtOVWVkTjludG9JNnpSUCtselZz?=
 =?utf-8?B?SVZuZ2JTTW9LaFVVeDhhVzJPY0E3cHBMeVIyRUh6SUlxcU03R2cvQVZ2VTli?=
 =?utf-8?B?L3hzL1JJZGdidnJaQkFSYzRVSExmVVJFS28yZ0N5RHAzVjh4YytPTFdWbXpC?=
 =?utf-8?B?V2J1eUxwNGZWODcvdlk2ZVlEaDM2bEsxZDBLV29VRFR4M1VqMnVRYjdUNnQ4?=
 =?utf-8?B?ZG9NNTB4L05oY0FCUnFYdmVHREhBUDFObVM2MW5NU1diZ0NOeVVmKzQ2ZzJS?=
 =?utf-8?B?WFA5RStMemF2VE1CWVRzRzFWRlRmdHdzU2lhOUo2NVFuUVpMOVYrV3djRndK?=
 =?utf-8?B?RFNsdFRIbzJmN0tQOVN6Q1EraXBiVWY5ZS9pcWVRcTFoQldpK0Y4RkJ4b2JI?=
 =?utf-8?B?cXRNZEdMZG02Z0RBUUowb0JCdHBvTWpOZDZmUFJNZ1h1Rnpla2NzRWJxY3dH?=
 =?utf-8?B?SzNHdFU0QWFtbTR2eS9xNXJnOXk4ZW1JNGFPY1RsSjA0anFTaVVUcXp5SVdZ?=
 =?utf-8?B?eUVtMGpvOFM3UE5GM0Z4b2YzNlg4YVE5K1ZoR2psM2ppQW5XUW9mQjUwT1Rk?=
 =?utf-8?B?dERoZ0dPekNGeTNxL3ZHaVJvemk4SlI0eDd0aFRBUUc4RkV6OVAxWlEwS3ll?=
 =?utf-8?B?S3VSTW9ab0taUFh2YU5ydklHdjVTVFZEQWYyb2NCQ0VsOTlsNkJLYlRya2Rt?=
 =?utf-8?B?Umw5azc3eER2cnV0ZHNTKzFDcHFzMTlzeUVyUmFaZlg2NnZNeXB2QmRZZ0NU?=
 =?utf-8?B?M0lxQVdFRzZoSDB5WW92U1kzRjFnVktrcGUrY3J3ZzdYVDFWSUhvNEx5TitX?=
 =?utf-8?B?VUN2K1lyNlJyUUZ6eXpETzlaTGUwWW1XNUJrU09JMWpDM0M2Mno2REhzYitM?=
 =?utf-8?B?NXMyb1QzYTcvWHlxOXhtWDB4eUV2c0xSQ3hrdGRsVEVPTTdKcFhOZHRrY2F0?=
 =?utf-8?B?V0U3bFc2bHJuTnVURTFiQUZSRzkyTk9ocWJUTWRkUHYvR1M3eHdyRDRQRm5G?=
 =?utf-8?B?V3Nxb3duTUtCY295UVRaR1NkUWg3aitNV2dhK3Z5OWxlK2MxaForTHY5NW5t?=
 =?utf-8?B?WWw1VkwvRTAvVHRBOHdMWDgzMEhxRFd6azIvSGhENitoSGxQbTJqdXdVY1ZZ?=
 =?utf-8?B?Y0dnZnVEb3hiT3YyRThkN2ZsUFhIRDNtMVRXTy9WTWhwT1BKOW85UVZ0UWNn?=
 =?utf-8?B?N1dqQmVqd2xLMjg0b3l4NzJKNXNnWWtlRUNwNXpKblprUW13K2RkTzJQclVN?=
 =?utf-8?B?S1lHK0ZxSHNoZW5xRWcrTUlGanRLS0YyR3BNZEpuWm8wVUJiZkw0Z2lGbkRJ?=
 =?utf-8?B?a1pGUGloRVdUUlkxc1FZOHhVODFVOENRcllheFB1MHVFK25FUTY2N3RxWXJn?=
 =?utf-8?B?Mi9ESy8rQ2hXUUo4bHFROHczbDhXMS9hU2VkbkRtNGFMeVhsOXJBYkg5TXQ2?=
 =?utf-8?B?eEhoam4weFpvQms2Rkd2T3haZ1paWkYrb2FuVVZTa3hkVG5pK2tGM1Bkdzlm?=
 =?utf-8?B?QnpHWFJWYXpxODQ2anpzU2xNNjRYS3kwN1hPUTR0MXQyeWxzc2ZweUxyYyty?=
 =?utf-8?B?RDVDSng2S2p2RzNVaUtkVmU3dzI5VzErRW05RTBrVCtHN1NJcy9LQjhuU1NE?=
 =?utf-8?B?Z0s4UTV6UFhRRUxTWlBabEZFTXpBZFlpakZEL0lIaGE4SmpPWFFKMkw5dzV6?=
 =?utf-8?B?YXhJSDZyd1lISzhJaWpSc1hMU1FHTTVCclpaaHVrRldZYXQ1NjJOck4ydTVX?=
 =?utf-8?B?dGF3K2NRWUt0L2QvMU5oL05OSWhOQmJHVmEvQ2pnRU8xWU0xVlRFaFMxdTNF?=
 =?utf-8?Q?TCySbXeOfE8toEqCYQutGwi27?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6060d40d-acba-43f7-dac1-08dd5f957a9c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 05:36:16.9679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UpxODNd+bbPH708artxkdqVPvP+hmKDH0lFsVJYxGEGq4ry48l2yasJvpwCGwt5wYPvgCMKhnL7TlB9XXVOdzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7873
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


Hi Rodrigo

On 3/7/2025 8:31 PM, Rodrigo Vivi wrote:
> On Fri, Mar 07, 2025 at 07:54:45PM +0530, Riana Tauro wrote:
>> Register a configfs subsystem called 'xe' to userspace that allows
>> users to modify the exposed attributes. Expose survivability mode as
>> an attribute that can be modified manually. This is useful if
>> pcode fails to detect survivability mode and for validation
>>
>> To enable survivability mode for a card,
>>
>> echo "domain:bus:dev.fn" > /sys/bus/pci/drivers/xe/unbind
>> echo "domain:bus:dev.fn" > sys/kernel/config/xe/survivability_mode
>> echo "domain:bus:dev.fn" > /sys/bus/pci/drivers/xe/bind
> 
> This is very great! Perhaps at some point we will still need
> the module parameter in this specific survivability case.
> But this configfs is more than needed and wanted for this and
> many other cases.
> 
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_configfs.c           | 22 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_configfs.h           |  6 +++++-
>>   drivers/gpu/drm/xe/xe_pci.c                |  8 ++++----
>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 21 +++++++++++++++++++--
>>   4 files changed, 50 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index 8c5f248e466d..ce9f3757100f 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -6,6 +6,7 @@
>>   #include <linux/configfs.h>
>>   #include <linux/init.h>
>>   #include <linux/module.h>
>> +#include <linux/pci.h>
>>   
>>   #include "xe_configfs.h"
>>   #include "xe_module.h"
>> @@ -28,6 +29,27 @@ void xe_configfs_clear_survivability_mode(void)
>>   	xe_modparam.survivability_mode = NULL;
>>   }
>>   
>> +bool xe_configfs_survivability_mode_enabled(struct pci_dev *pdev)
>> +{
>> +	unsigned int domain, bus, slot, function;
>> +	int ret = 0;
>> +
>> +	if (!xe_modparam.survivability_mode)
>> +		goto err;
>> +
>> +	ret = sscanf(xe_modparam.survivability_mode, "%04x:%02x:%02x.%x", &domain, &bus,
>> +		     &slot, &function);
>> +	if (ret != 4)
>> +		goto err;
>> +
>> +	if ((pci_domain_nr(pdev->bus) == domain) && (pdev->bus->number == bus) &&
>> +	    (PCI_SLOT(pdev->devfn) == slot) && (PCI_FUNC(pdev->devfn) == function))
>> +		return true;
>> +
>> +err:
> 
> if nothing else is here, please just return false everywhere instead of the goto
sure will fix this
> 
>> +	return false;
>> +}
>> +
>>   static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
>>   {
>>   	char *survivability_mode;
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>> index 491629a2ca53..b03f4c7d0f54 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.h
>> +++ b/drivers/gpu/drm/xe/xe_configfs.h
>> @@ -5,8 +5,12 @@
>>   #ifndef _XE_CONFIGFS_H_
>>   #define _XE_CONFIGFS_H_
>>   
>> +#include <linux/types.h>
>> +
>> +struct pci_dev;
>> +
>>   int xe_configfs_init(void);
>>   void xe_configfs_exit(void);
>>   void xe_configfs_clear_survivability_mode(void);
>> -
>> +bool xe_configfs_survivability_mode_enabled(struct pci_dev *pdev);
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 4d982a5a4ffd..d0f66cc08aa5 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -17,6 +17,7 @@
>>   
>>   #include "display/xe_display.h"
>>   #include "regs/xe_gt_regs.h"
>> +#include "xe_configfs.h"
>>   #include "xe_device.h"
>>   #include "xe_drv.h"
>>   #include "xe_gt.h"
>> @@ -815,10 +816,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>   	 * mei. If early probe fails, check if survivability mode is flagged by
>>   	 * HW to be enabled. In that case enable it and return success.
>>   	 */
>> -	if (err) {
>> -		if (xe_survivability_mode_required(xe) &&
>> -		    xe_survivability_mode_enable(xe))
>> -			return 0;
>> +	if (xe_configfs_survivability_mode_enabled(pdev) || err) {
> 
> no strong feelings here, but:
> 
> I believe it is likely better to keep the current code and add
> the 2 new lines, instead of mixing err and new condition.
> 
> 
> 	if (err) {
> 		if (xe_survivability_mode_required(xe) &&
> 		    xe_survivability_mode_enable(xe))
> 			return 0;
> 	}
> 	if (xe_configfs_survivability_mode_enabled(pdev) || err)
> 	   		return 0;
> 
> 
> or perhaps encapsulate all of that in a static function and then here
> just:
> 
>         if(check_for_survivability(err))
> 		return 0;
Will try this.
> 
> the function can be better to extend to the module parameter
> to be used in boot if/when needed.
> 
> but, really up to you... as I said, no strong feelings...
> 
>> +		if (xe_survivability_mode_required(xe))
>> +			return xe_survivability_mode_enable(xe);
>>   
>>   		return err;
>>   	}
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index d939ce70e6fa..5b60cbf8f7cb 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/pci.h>
>>   #include <linux/sysfs.h>
>>   
>> +#include "xe_configfs.h"
>>   #include "xe_device.h"
>>   #include "xe_gt.h"
>>   #include "xe_heci_gsc.h"
>> @@ -28,8 +29,10 @@
>>    * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
>>    * to be flashed through mei and collect telemetry. The driver's probe flow is modified
>>    * such that it enters survivability mode when pcode initialization is incomplete and boot status
>> - * denotes a failure. The driver then  populates the survivability_mode PCI sysfs indicating
>> - * survivability mode and provides additional information required for debug
>> + * denotes a failure. Survivability mode can also be enabled manually by writing the pci address of
>> + * the card to the xe configfs attribute. This is useful in cases where pcode does not detect
>> + * failure and for validation.
> 
> or even for IFR (in-field-repair) use cases, where the repair or flash can be
> performed in a single GPU card without impacting the usage of other GPUs
> in the same node.
> 
> or something like that...
Will add the IFR case
> 
>> The driver then  populates the survivability_mode PCI sysfs
>> + * indicating survivability mo
> de and provides additional information required for debug
>>    *
>>    * KMD exposes below admin-only readable sysfs in survivability mode
>>    *
>> @@ -42,6 +45,15 @@
>>    *			      Overflow Information   - Provides history of previous failures
>>    *			      Auxiliary Information  - Certain failures may have information in
>>    *						       addition to postcode information
>> + * Enable survivability mode through configfs
>> + *
>> + * survivability mode is exposed as an attribute under the xe configfs subsystem. User can specify
>> + * the card that needs to enter survivability mode.
>> + *
>> + * echo "domain:bus:dev.fn" > /sys/bus/pci/drivers/xe/unbind
>> + * echo "domain:bus:dev.fn" > sys/kernel/config/xe/survivability_mode
>> + * echo "domain:bus:dev.fn" > /sys/bus/pci/drivers/xe/bind
> 
> should we add an example in the doc so folks don't get so confused
> with the details of the terminology?
> 
> Example:
> 
> echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/unbind
> echo "0000:03:00.0" > sys/kernel/config/xe/survivability_mode
> echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/bind
> 
> ?

Sure. will add an example instead
> 
>> + *
>>    */
>>   
>>   static u32 aux_history_offset(u32 reg_value)
>> @@ -133,6 +145,7 @@ static void xe_survivability_mode_fini(void *arg)
>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>   	struct device *dev = &pdev->dev;
>>   
>> +	xe_configfs_clear_survivability_mode();
>>   	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>>   }
>>   
>> @@ -190,11 +203,15 @@ bool xe_survivability_mode_required(struct xe_device *xe)
>>   {
>>   	struct xe_survivability *survivability = &xe->survivability;
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>   	u32 data;
>>   
>>   	if (!IS_DGFX(xe) || xe->info.platform < XE_BATTLEMAGE || IS_SRIOV_VF(xe))
>>   		return false;
>>   
>> +	if (xe_configfs_survivability_mode_enabled(pdev))
>> +		return true;
> 
> this part is not needed right? as the check outside won't be evaluated
> or bypassed...
If its changed to single check , i'll remove this.

Thanks
Riana
> 
>> +
>>   	data = xe_mmio_read32(mmio, PCODE_SCRATCH(0));
>>   	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
>>   
>> -- 
>> 2.47.1
>>

