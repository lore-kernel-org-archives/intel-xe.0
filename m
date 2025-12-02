Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D71D116F3
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 03:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7773910E516;
	Tue,  2 Dec 2025 03:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g62MZJNj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B3710E516
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 03:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764645015; x=1796181015;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5+Xcb41TGv3w9P8Jk/r3/PLsT49B6uqNHTFwveqVN4Q=;
 b=g62MZJNjuM2R1TtSax0z+r5XDUfbHzaWLS6uzKACcwKH9BxGMUiAnI69
 R+FrWUlDZIozFJhVAPUicdDAZLKFVDSrI2PhE2BNcHRPWzcrkeIqu4peY
 IcXeDAVvV+JdHZ9wbBvxfJwII5nkHgROp0c5BUimdpPImUrD7zu8dz0wR
 yFlKx4Jg8d9rc7pG9JxSUiIA3LCjVKFQGoOStOfQWxDjVmfmSxSrtY0AR
 nsA00vZkOODZBBMbG1a3JMkI/OESDyvWwquMXPY9ihgMsFttJupt//761
 2b/x8KKxd2Q+IbHJa2XtF9yxqYmlFbboKW0hFe771vtkqPEr5Ahvo5Djl A==;
X-CSE-ConnectionGUID: 6uJ2Sgj0RKuLc4ac24KNZA==
X-CSE-MsgGUID: PBXDw7UaSF2+ph6RyJ9iog==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="89249969"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="89249969"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 19:10:14 -0800
X-CSE-ConnectionGUID: kppmAf4JRJaLzPyOvLCcTA==
X-CSE-MsgGUID: IvuUK+FESvur+NWzr/ZzVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="193533326"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 19:10:13 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 19:10:13 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 19:10:13 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 19:10:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gI4ALeE8NOmdNS5+SCWuQlo3xCKacPZR5ZcTDnRWSM8B0FYnbcBR9qE6t8CMykHUge68ws6WmUqIyWIz5rLO78AAgLiDuJWq/sEO78UDoKwAVEZyiTjCvy1EwYLFInkU7lBFCKJ1mgxcVjfZsQ+HNu307nEK/BfoqaW8k6Eu8NDvJkGDsx98Zh0CcAlL6QAg6T0+UT0U4FpklQe69DfdYNnAwYBGBruH+z96y1cYqcKLI/nHFXSlkB1OIuoc8ETT2XxgrQnIIooWW5xhMNI9Bq+WksWDeWgrbz2GjOrHYd7Ea/Ezm7FIsAHupnOIzf92sRHBV2C5s/uoCAYZIKGi0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2lbZYT0US0gTgJd7iG66XxGA8wCDphP8GSz9KVL/vg=;
 b=RjEx4zFCJ6Vt5U4we+DdYBxMOtpgiO9V+8HFBjJLxPdILYqhqW+T69W7Vh0FSX+c7nf1Bs6jNsPAk7olXZtoHSHef92hOgBVBcnS69m7OsFi/pcjHTTPbWG3b6UewsZsAR8ukKxM+1LE5/1LlHoNGllFrOhJeGglFbbXYMTEI6kycQ8YKBbsuPFmaR8Il9kx667gGV3KfL+rBsBMnRtrMyeX0SDDNTUBndXUvfzpFJBfOkxIp6dtemhudJXLbKVwXppoLVp+DD5SFRdevwahyOiXRP0HNvfi1ZG06X85kMCZi8tTfKiJJpbURxpGxMQZcSue/6GpcrLqRqFtgf0xsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH3PPFCE69B97EC.namprd11.prod.outlook.com (2603:10b6:518:1::d4d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 03:10:09 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 03:10:09 +0000
Message-ID: <5438fd55-1d65-49e2-be16-1623da7646da@intel.com>
Date: Tue, 2 Dec 2025 08:40:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/xe_survivability: Redesign survivability
 mode
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
References: <20251201143420.3158372-4-riana.tauro@intel.com>
 <20251201143420.3158372-5-riana.tauro@intel.com> <aS3U7x5mabFPF23e@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aS3U7x5mabFPF23e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0188.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH3PPFCE69B97EC:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dc9116c-314f-4d5f-c4cf-08de31504cd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3VHaUh1WDV2SWpZR3c3dTJhVlNDeW4xK2FqNXlqWDN6NXZYYzFpMjJaV054?=
 =?utf-8?B?SytKWE5WR2pVL2Y1ZDU4d0Nrc09Rdk1JZG5SbnBFRHRCNXBsVGVvL2VTSGFr?=
 =?utf-8?B?cVFob2xwbHpDZmhPTVVPNDdhbzlrY2RNZ1d6OHFvVktmUGRTZVBmd0JRT1Fh?=
 =?utf-8?B?blJYN3ZEUFVuSHdZL1FkR0UrSHJnUDF6VWxMRjk4bWtoaUc3SytNYVltM2lm?=
 =?utf-8?B?b1FnTzEzN1U4blZsbUhaaGlhS1Y0TzZkVmVEYy95ZGFvb1hsaFZtZGFBcG93?=
 =?utf-8?B?enFoTHh1WFc0MW9qb2RzU0RRZWhSSXhVNnlFcFdJWHVPRGZTNXUxWFhKVkNl?=
 =?utf-8?B?M1g4aC9OL1daY3dUVlVPaHhTUDdsM050NUpuaXd1b01kREZrZnBGc2dTb1Nh?=
 =?utf-8?B?UzhXMVl4UVhzcGJqNlcvenVmY2JkNUZpanFKbHZkUHFKMzhRVFhqUFZqNlJK?=
 =?utf-8?B?R2FialBuL0tERGkyYWp2MXFiRVg2cWxPU282ZHFjb2VDRyt3bGVzQ1hHQUFh?=
 =?utf-8?B?TEF3TkpKNHJXenlSU0FRcG9BVEJ4NzZzTklJemR2bm5NYllFZGpkbkVEczFY?=
 =?utf-8?B?MjEwTWNmelhYL1VtcnRuNTE2QkNKOUNLVkNxdXp5Ym1oS0lhQmpGVjJWZ1dj?=
 =?utf-8?B?R1RWSUYrSjg5Z3VySkhJc2QvTWxKdWZtSDNjQnRGUW9jZXlVcTlhV3o1ZGVl?=
 =?utf-8?B?N1hpQ3BJdFBLK3hiMlAxVVlrVm5WWlVjditpMmp4eU9pNzRKR3Y1aUIxeDdY?=
 =?utf-8?B?M3dzblkzd1grc3FnKzVCbzNSNmxyNHloNmJLZmNNVmsyMU5vU2dnd1U3RmZ2?=
 =?utf-8?B?MjZESUFwUkN1SlVocGUvVjN5ak1WSU40eStLSXJJTW9ySEl4SjliVk5xMEl2?=
 =?utf-8?B?UVJ2RDFVd2x6alB0dzBocFpCODM1Q2tGTVQ3SHBhYUMydzZQQ0R5Uk5JdXVv?=
 =?utf-8?B?aFNRWkNnMmlnSWpSOHFUaUFiS294VkpZazNjQnBTM3NGUjNtaGhYOGpSMTBY?=
 =?utf-8?B?b1U0WXJMaHBoaTR3dWlpSlRoY0dHVHBJRi9lZ0FGL3JsdG03cElDL0hOVTVW?=
 =?utf-8?B?Szd2amZCbjNiTnBKckpoc2ZVZ0Y4VTgzVXFxdnVVaDBaUm9YdGNmUjY5eVZ0?=
 =?utf-8?B?dTg5K2Q3ODJDT241TElOSVJaMjJlbVpKRXlYSXI1NmVXTkJBUG9XcXdOcU0w?=
 =?utf-8?B?a1hQU3dSMjVlYVgvUGhHL0ZNc1RJZ1FpTHZ5Wm04aUFjQ1RocDIzdEVLRnVq?=
 =?utf-8?B?MDFaTVJZNFpJWitKR01nRTI4bVNCNXp1c0RwN0gxMzJEZVJoRXM2YThHSkov?=
 =?utf-8?B?ZWJSdjA5RGxscEQzbGpYV256ZVFhR3hTdnArM2VRNDRtK0o4eWwvQlVMcWlG?=
 =?utf-8?B?THFkMGxrR1FvL2dSVEZnWDJGdENVdHQxMkdBZ2xnNnh5WjJXbTM3dU5RQnp1?=
 =?utf-8?B?ZFFCTGhsazlJbTZqTVM3NHpJN0lEUTNEWUR5V3c3SlVzeENuUEVjdU5oaDZ5?=
 =?utf-8?B?TENPaE9ua0RYWmhmS3o0aG1qazhuay8vdjFJK0c0NmNyR1N4UUhVTXBhSS9T?=
 =?utf-8?B?TWZsMWtEeWdGZXRlSzZ6cHdOOFZNU3BnUHlpeWZsSm12S3hOam9YWGNuVFVk?=
 =?utf-8?B?eVVZdDk1ZHYyV1IyYnhRZC9hWnRWNmFqZnNKa1ZxUDUyZUJXUG9DM083Q2Vs?=
 =?utf-8?B?Y0NNR3h3ZkFVZFQ1RU01UndpTnZneHA4c1pDQmhlN1Y0N3lGMWl6Y1ZGZ1ow?=
 =?utf-8?B?L2NaK1ZKd0oyRUw0UEk0ZSt3K1NCcG0vVGdhdFgzdXNCQVRXcEk5R2NaWnJv?=
 =?utf-8?B?UE16MEdxc1JlMkV5MlpqUTYzOExYWDhHSDZCU1JGRXBLSjdFYzJXbDVzaU0v?=
 =?utf-8?B?Y1BEVVE2Q3VRWmVNeE5xM3RVTDFoUXpleUU5MlRpamNDZGZWWnBaUFcremRQ?=
 =?utf-8?Q?Ax+XjcIabxSSaD7WU6j07W18vOpNNzcL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDAvTUZDS3JQaDJhdWNKYVV4UTRNT1NVbFRQT2dTc2swSkIxeU9Ib2JGeTdS?=
 =?utf-8?B?QXlnblBLMkZpNW5pTG1TRWlBdU9hWnZGMlI4MFF6N3pyTmN1MzNLSzl0QlVJ?=
 =?utf-8?B?VmRyQUN0OXpLZG9PSDBLRW9IYlhPRXErNldEK3ZwaFNwQ0RXaVhYaGN2aHFz?=
 =?utf-8?B?amZBWmExK1VNWTJ0NkVXVXJ4dVN5Z0h2bTEzekxiYWxLcmdVcGZtUTdGdXIw?=
 =?utf-8?B?RHlRcWxYS1ZraHJGLzhNaE1ObGppRkVpUDNHU3BVTU8xMDM3NU4wYUV1R1dL?=
 =?utf-8?B?ZCtqS29ZYUtmZXJDMFFYdndYcThpTXFiS1R5a0RWL3VDMVUvMU1oTE9kck0w?=
 =?utf-8?B?SW50TjFLVW1EWWIraTdkRkoyamxxMUNTUk01ZXo2S25JWjVZaGVPVmQ3UC96?=
 =?utf-8?B?UXVvQ2JsdlhVV2NTZWI4K2tLcGhKQ1BjRTArSHJQWTJLQ0tUSm1RVUZvcUl1?=
 =?utf-8?B?b1o0d2NVMHJ0bjNpZko1bUN6dG5kWkRNVFYxSEZxME9vaTBkVUJXa0puZzNU?=
 =?utf-8?B?bHdQK1NXSytDbDZkUDM2OFRYVkdxT1JWV2JuTERqbHdNa1d3eEF3QTlBbi9C?=
 =?utf-8?B?WUF4WnAzZElOeWkrVFo4ajEreTQ0SU5jd2U0ZTh3dHg5SkN4MGoycjBIcEs4?=
 =?utf-8?B?MEUvNkcralZJaWFIMWlHMVBpL1Y3bUJ4elVwYklkM2RMdkkwb2FkRXJydmVk?=
 =?utf-8?B?OUl5WGc3cWgzTHRPbkp1dUVCWW10QzRiRG5aQjFEVzljeGZLRUNGZmxsZlhR?=
 =?utf-8?B?L3lObFRkV201ZCtXblBHU0xnTTJWOEFhMEJmdzdPOEpJMGVmMUNMRlZMTUYx?=
 =?utf-8?B?bU9hbUdTaVlWcjBMRm12YU9aL21icnk5WkJPU2pYM3hBTU1EcWFXOTJNNmZJ?=
 =?utf-8?B?UENtYjkyNk96b1Y2NldqbGZPcFRkRUpSQStNZmNxc0s5UHI0S0dLeDF2SCsr?=
 =?utf-8?B?NWVYdlFINDRtYnViR3E1Zmt0U0dnRnU3bUVid3Rra0F0cVBza0c0NG9JVVV1?=
 =?utf-8?B?cjBxK2dvc2JrK244WnJOUTNnRDlZQkNhcVNFb1d1dHZ5MHIzczNZOENrekJp?=
 =?utf-8?B?MGFwa2Y5Z2F4YjZoY0pRNXVMK04xbGRlUWNhL3hXcWo3eEp6R0dQWE9MOXMv?=
 =?utf-8?B?ZzQ3bTB1V01IZjh4bTMwQi8rMkh4M3lCQlVOdDRudis2WldYL3QrZms3VFBH?=
 =?utf-8?B?cFFWTFpwL2V0bDBoUVVHZElsOTNlMnBxUTJDdzh2K0YvQndySkxvSEVQeEdj?=
 =?utf-8?B?ci9uK2ZJTSt2NmF4aTY4RG4vNmtNZkFVcDVCeE5QcnpNdUt5SWRER1ZWV2lx?=
 =?utf-8?B?M0dwTFp3MlNxUHFsWEpqWG05Y1ZMOEpxdmdRTW04Y0tjOElpUG15eVJqNW9r?=
 =?utf-8?B?YVJ1Y0ZrL3k2YWs0MUxUL2w1WnlhSCtpUC9nZ0s4RjVHZHAzVEdWbCtzS2Rv?=
 =?utf-8?B?RVQxYTdxa3FMSDFMOWJkcW01Q2hzbnB3akp4ajVjZUhmeTUwTm1CMllzTlY5?=
 =?utf-8?B?Qzk3dHhLRERyYXkzcWJONndqNzlINW9EYk5xYkFGUTgraTVuL2ZHNFdRQXFY?=
 =?utf-8?B?dkZoTC9yWlc1VkZyTFBrMmRWZEwrWWwzMmF3OXlobC9rYU9HNFJrMjgvTHY3?=
 =?utf-8?B?b1lNeS9UN1ZoMTc0Sk9vcUt1MlRtd2wwVlptSnlIR3ZORktDMXpHZDRPYWJ6?=
 =?utf-8?B?clJqT3Y3bDNOdVl0c3VCTEJZMGpXWkJkOXZqR0xZTjJyR3lselVmekQrQ0VQ?=
 =?utf-8?B?VDhUTTl3WDNYSFNJYkY4ZFcvMHFsWVFRQy8zMUVMbk9jeWRkQUdYOW9JcEhY?=
 =?utf-8?B?Rk1COCtFTUU3S00vZTI0MHZPejF3UTU0N2loTU4rZkJkTEw0Y1NEbHBGSXlI?=
 =?utf-8?B?MFhkR2N6SERQODJjNk92Z3lSYUM5OGhiaElRb213ZGtkVXgrRE54b2R6WlZh?=
 =?utf-8?B?YUd1QzhObjNZcHpzSXhEZWJlcmphUzVETmZ1cjl3YnZ2SENZK3RvMFAzNXZm?=
 =?utf-8?B?aXhUMTNBcUt2ZC8rQjRWRDRZL00zY1p4N0lXdUpwSE41ZGNFWG9MWERRTWZR?=
 =?utf-8?B?NmN5WVJVQjl4TUF3OFA0cW9YTTZsaWpSalZEZ1dOUkM4MGhEYkNOYTdkNjl3?=
 =?utf-8?Q?ayBhauzOSgH3A4NaStB7TeWHd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc9116c-314f-4d5f-c4cf-08de31504cd6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 03:10:09.2751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3jfVpO6OqGlAIASx5LlQNGpLu9dwumq8C7X++rjzx9tbRjk3Jg310iItAroSaCh098P5YRrppYXgfCRZGcl8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFCE69B97EC
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



On 12/1/2025 11:18 PM, Rodrigo Vivi wrote:
> On Mon, Dec 01, 2025 at 08:04:22PM +0530, Riana Tauro wrote:
>> Redesign survivability mode to have only one value per file.
>>
>> 1) Retain the survivability_mode sysfs to indicate the type
>>
>> 	cat /sys/bus/pci/devices/0000\:03\:00.0/survivability_mode
>> 	(Boot / Runtime)
>>
>> 2) Add survivability_info directory to expose boot breadcrumbs.
>> Entries in survivability mode sysfs are only visible when
>> boot breadcrumb registers are populated.
>>
>> 	/sys/bus/pci/devices/0000:03:00.0/survivability_info
>> 	├── aux_info0
>> 	├── aux_info1
>> 	├── aux_info2
>> 	├── aux_info3
>> 	├── aux_info4
>> 	├── capability_info
>> 	├── postcode_trace
>> 	└── postcode_trace_overflow
>>
>> Capability_info:
>>
>> 	Provides data about boot status and has bits that
>> 	indicate the support for the other breadcrumbs
>>
>> Postcode Trace / Postcode Trace Overflow :
>>
>> 	Each postcode is represented as an 8-bit value and represents
>> 	a boot failure event. When a new failure event is logged by Pcode
>> 	the existing postcodes are shifted left. These entries provide a
>> 	history of 8 postcodes.
>>
>> Auxiliary Info:
>>
>> 	Some failures have additional debug information.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: Add array map for names (Rodrigo)
>> ---
>>   drivers/gpu/drm/xe/xe_survivability_mode.c    | 199 +++++++++++-------
>>   .../gpu/drm/xe/xe_survivability_mode_types.h  |  22 +-
>>   2 files changed, 135 insertions(+), 86 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index 1662bfddd4bc..b5b582442637 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -19,8 +19,6 @@
>>   #include "xe_pcode_api.h"
>>   #include "xe_vsec.h"
>>   
>> -#define MAX_SCRATCH_MMIO 8
>> -
>>   /**
>>    * DOC: Survivability Mode
>>    *
>> @@ -48,19 +46,25 @@
>>    *
>>    * Refer :ref:`xe_configfs` for more details on how to use configfs
>>    *
>> - * Survivability mode is indicated by the below admin-only readable sysfs which provides additional
>> - * debug information::
>> + * Survivability mode is indicated by the below admin-only readable sysfs entry::
>>    *
>>    *	/sys/bus/pci/devices/<device>/survivability_mode
>>    *
>> - * Capability Information:
>> - *	Provides boot status
>> - * Postcode Information:
>> - *	Provides information about the failure
>> - * Overflow Information
>> - *	Provides history of previous failures
>> - * Auxiliary Information
>> - *	Certain failures may have information in addition to postcode information
>> + * Survivability mode sysfs provides information about the type of survivability mode.
> 
> Perhaps expand here that it is ether 'Runtime' or 'Boot'...

sure will add this

> 
>> + * Any additional debug information if present will be visible under the directory
>> + * ``survivability_info``::
>> + *
>> + *     /sys/bus/pci/devices/<device>/survivability_info/
>> + *
>> + * This directory has the following attributes
>> + *
>> + * - ``capability_info`` : Indicates Boot status and support for additional information
>> + *
>> + * - ``postcode_trace``, ``postcode_trace_overflow`` : Each postcode is a 8bit value and
>> + *   represents a boot failure event. When a new failure event is logged by PCODE the
>> + *   existing postcodes are shifted left. These entries provide a history of 8 postcodes.
>> + *
>> + * - ``aux_info<n>`` : Some failures have additional debug information
>>    *
>>    * Runtime Survivability
>>    * =====================
>> @@ -79,49 +83,63 @@
>>    * to restore device to normal operation.
>>    */
>>   
>> +static const char * const reg_map[] = {
>> +	[CAPABILITY_INFO]         = "Capability_info",
> 
> Why do we need '_' between the words here instead of space like
> the entries below?

Sorry missed removing  '_'.
Thanks for catching this. Will fix this

Thank you
Riana

> 
>> +	[POSTCODE_TRACE]          = "Postcode trace",
>> +	[POSTCODE_TRACE_OVERFLOW] = "Postcode trace overflow",
>> +	[AUX_INFO0]               = "Auxiliary Info 0",
>> +	[AUX_INFO1]               = "Auxiliary Info 1",
>> +	[AUX_INFO2]               = "Auxiliary Info 2",
>> +	[AUX_INFO3]               = "Auxiliary Info 3",
>> +	[AUX_INFO4]               = "Auxiliary Info 4",
>> +};
>> +
>> +struct xe_survivability_attribute {
>> +	struct device_attribute attr;
>> +	u8 index;
>> +};
>> +
>> +static struct
>> +xe_survivability_attribute *dev_attr_to_survivability_attr(struct device_attribute *attr)
>> +{
>> +	return container_of(attr, struct xe_survivability_attribute, attr);
>> +}
>> +
>>   static u32 aux_history_offset(u32 reg_value)
>>   {
>>   	return REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, reg_value);
>>   }
>>   
>> -static void set_survivability_info(struct xe_mmio *mmio, struct xe_survivability_info *info,
>> -				   int id, char *name)
>> +static void set_survivability_info(struct xe_mmio *mmio, u32  *info, int id)
>>   {
>> -	strscpy(info[id].name, name, sizeof(info[id].name));
>> -	info[id].reg = PCODE_SCRATCH(id).raw;
>> -	info[id].value = xe_mmio_read32(mmio, PCODE_SCRATCH(id));
>> +	info[id] = xe_mmio_read32(mmio, PCODE_SCRATCH(id));
>>   }
>>   
>>   static void populate_survivability_info(struct xe_device *xe)
>>   {
>>   	struct xe_survivability *survivability = &xe->survivability;
>> -	struct xe_survivability_info *info = survivability->info;
>> +	u32 *info = survivability->info;
>>   	struct xe_mmio *mmio;
>>   	u32 id = 0, reg_value;
>> -	char name[NAME_MAX];
>>   	int index;
>>   
>>   	mmio = xe_root_tile_mmio(xe);
>> -	set_survivability_info(mmio, info, id, "Capability Info");
>> -	reg_value = info[id].value;
>> +	set_survivability_info(mmio, info, CAPABILITY_INFO);
>> +	reg_value = info[CAPABILITY_INFO];
>>   
>>   	if (reg_value & HISTORY_TRACKING) {
>> -		id++;
>> -		set_survivability_info(mmio, info, id, "Postcode Info");
>> +		set_survivability_info(mmio, info, POSTCODE_TRACE);
>>   
>> -		if (reg_value & OVERFLOW_SUPPORT) {
>> -			id = REG_FIELD_GET(OVERFLOW_REG_OFFSET, reg_value);
>> -			set_survivability_info(mmio, info, id, "Overflow Info");
>> -		}
>> +		if (reg_value & OVERFLOW_SUPPORT)
>> +			set_survivability_info(mmio, info, POSTCODE_TRACE_OVERFLOW);
>>   	}
>>   
>>   	if (reg_value & AUXINFO_SUPPORT) {
>>   		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
>>   
>> -		for (index = 0; id && reg_value; index++, reg_value = info[id].value,
>> -		     id = aux_history_offset(reg_value)) {
>> -			snprintf(name, NAME_MAX, "Auxiliary Info %d", index);
>> -			set_survivability_info(mmio, info, id, name);
>> +		for (index = 0; id >= AUX_INFO0 && id < MAX_SCRATCH_REG; index++) {
>> +			set_survivability_info(mmio, info, id);
>> +			id = aux_history_offset(info[id]);
>>   		}
>>   	}
>>   }
>> @@ -130,15 +148,14 @@ static void log_survivability_info(struct pci_dev *pdev)
>>   {
>>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>>   	struct xe_survivability *survivability = &xe->survivability;
>> -	struct xe_survivability_info *info = survivability->info;
>> +	u32 *info = survivability->info;
>>   	int id;
>>   
>>   	dev_info(&pdev->dev, "Survivability Boot Status : Critical Failure (%d)\n",
>>   		 survivability->boot_status);
>> -	for (id = 0; id < MAX_SCRATCH_MMIO; id++) {
>> -		if (info[id].reg)
>> -			dev_info(&pdev->dev, "%s: 0x%x - 0x%x\n", info[id].name,
>> -				 info[id].reg, info[id].value);
>> +	for (id = 0; id < MAX_SCRATCH_REG; id++) {
>> +		if (info[id])
>> +			dev_info(&pdev->dev, "%s: 0x%x\n", reg_map[id], info[id]);
>>   	}
>>   }
>>   
>> @@ -156,25 +173,38 @@ static ssize_t survivability_mode_show(struct device *dev,
>>   	struct pci_dev *pdev = to_pci_dev(dev);
>>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>>   	struct xe_survivability *survivability = &xe->survivability;
>> -	struct xe_survivability_info *info = survivability->info;
>> -	int index = 0, count = 0;
>>   
>> -	count += sysfs_emit_at(buff, count, "Survivability mode type: %s\n",
>> -			       survivability->type ? "Runtime" : "Boot");
>> +	return sysfs_emit(buff, "%s\n", survivability->type ? "Runtime" : "Boot");
>> +}
>>   
>> -	if (!check_boot_failure(xe))
>> -		return count;
>> +static DEVICE_ATTR_ADMIN_RO(survivability_mode);
>>   
>> -	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
>> -		if (info[index].reg)
>> -			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
>> -					       info[index].reg, info[index].value);
>> -	}
>> +static ssize_t survivability_info_show(struct device *dev,
>> +				       struct device_attribute *attr, char *buff)
>> +{
>> +	struct xe_survivability_attribute *sa = dev_attr_to_survivability_attr(attr);
>> +	struct pci_dev *pdev = to_pci_dev(dev);
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +	struct xe_survivability *survivability = &xe->survivability;
>> +	u32 *info = survivability->info;
>>   
>> -	return count;
>> +	return sysfs_emit(buff, "0x%x\n", info[sa->index]);
>>   }
>>   
>> -static DEVICE_ATTR_ADMIN_RO(survivability_mode);
>> +#define SURVIVABILITY_ATTR_RO(name, _index)					\
>> +	struct xe_survivability_attribute attr_##name =	{			\
>> +		.attr =  __ATTR(name, 0400, survivability_info_show, NULL),	\
>> +		.index = _index,						\
>> +	}
>> +
>> +SURVIVABILITY_ATTR_RO(capability_info, CAPABILITY_INFO);
>> +SURVIVABILITY_ATTR_RO(postcode_trace, POSTCODE_TRACE);
>> +SURVIVABILITY_ATTR_RO(postcode_trace_overflow, POSTCODE_TRACE_OVERFLOW);
>> +SURVIVABILITY_ATTR_RO(aux_info0, AUX_INFO0);
>> +SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
>> +SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
>> +SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
>> +SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
>>   
>>   static void xe_survivability_mode_fini(void *arg)
>>   {
>> @@ -182,17 +212,48 @@ static void xe_survivability_mode_fini(void *arg)
>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>   	struct device *dev = &pdev->dev;
>>   
>> -	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>> +	device_remove_file(dev, &dev_attr_survivability_mode);
>> +}
>> +
>> +static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct attribute *attr,
>> +						int idx)
>> +{
>> +	struct xe_device *xe = kdev_to_xe_device(kobj_to_dev(kobj));
>> +	struct xe_survivability *survivability = &xe->survivability;
>> +	u32 *info = survivability->info;
>> +
>> +	if (info[idx])
>> +		return 0400;
>> +
>> +	return 0;
>>   }
>>   
>> +/* Attributes are ordered according to enum scratch_reg */
>> +static struct attribute *survivability_info_attrs[] = {
>> +	&attr_capability_info.attr.attr,
>> +	&attr_postcode_trace.attr.attr,
>> +	&attr_postcode_trace_overflow.attr.attr,
>> +	&attr_aux_info0.attr.attr,
>> +	&attr_aux_info1.attr.attr,
>> +	&attr_aux_info2.attr.attr,
>> +	&attr_aux_info3.attr.attr,
>> +	&attr_aux_info4.attr.attr,
>> +	NULL,
>> +};
>> +
>> +static const struct attribute_group survivability_info_group = {
>> +	.name = "survivability_info",
>> +	.attrs = survivability_info_attrs,
>> +	.is_visible = survivability_info_attrs_visible,
>> +};
>> +
>>   static int create_survivability_sysfs(struct pci_dev *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>>   	int ret;
>>   
>> -	/* create survivability mode sysfs */
>> -	ret = sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>> +	ret = device_create_file(dev, &dev_attr_survivability_mode);
>>   	if (ret) {
>>   		dev_warn(dev, "Failed to create survivability sysfs files\n");
>>   		return ret;
>> @@ -203,6 +264,12 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>>   	if (ret)
>>   		return ret;
>>   
>> +	if (check_boot_failure(xe)) {
>> +		ret = devm_device_add_group(dev, &survivability_info_group);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>   	return 0;
>>   }
>>   
>> @@ -239,25 +306,6 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>   	return ret;
>>   }
>>   
>> -static int init_survivability_mode(struct xe_device *xe)
>> -{
>> -	struct xe_survivability *survivability = &xe->survivability;
>> -	struct xe_survivability_info *info;
>> -
>> -	survivability->size = MAX_SCRATCH_MMIO;
>> -
>> -	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
>> -			    GFP_KERNEL);
>> -	if (!info)
>> -		return -ENOMEM;
>> -
>> -	survivability->info = info;
>> -
>> -	populate_survivability_info(xe);
>> -
>> -	return 0;
>> -}
>> -
>>   /**
>>    * xe_survivability_mode_is_boot_enabled- check if boot survivability mode is enabled
>>    * @xe: xe device instance
>> @@ -325,9 +373,7 @@ int xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>   		return -EINVAL;
>>   	}
>>   
>> -	ret = init_survivability_mode(xe);
>> -	if (ret)
>> -		return ret;
>> +	populate_survivability_info(xe);
>>   
>>   	ret = create_survivability_sysfs(pdev);
>>   	if (ret)
>> @@ -356,14 +402,11 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
>>   {
>>   	struct xe_survivability *survivability = &xe->survivability;
>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> -	int ret;
>>   
>>   	if (!xe_survivability_mode_is_requested(xe))
>>   		return 0;
>>   
>> -	ret = init_survivability_mode(xe);
>> -	if (ret)
>> -		return ret;
>> +	populate_survivability_info(xe);
>>   
>>   	/* Log breadcrumbs but do not enter survivability mode for Critical boot errors */
>>   	if (survivability->boot_status == CRITICAL_FAILURE) {
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> index cd65a5d167c9..f31b3907d933 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> @@ -9,23 +9,29 @@
>>   #include <linux/limits.h>
>>   #include <linux/types.h>
>>   
>> +enum scratch_reg {
>> +	CAPABILITY_INFO,
>> +	POSTCODE_TRACE,
>> +	POSTCODE_TRACE_OVERFLOW,
>> +	AUX_INFO0,
>> +	AUX_INFO1,
>> +	AUX_INFO2,
>> +	AUX_INFO3,
>> +	AUX_INFO4,
>> +	MAX_SCRATCH_REG,
>> +};
>> +
>>   enum xe_survivability_type {
>>   	XE_SURVIVABILITY_TYPE_BOOT,
>>   	XE_SURVIVABILITY_TYPE_RUNTIME,
>>   };
>>   
>> -struct xe_survivability_info {
>> -	char name[NAME_MAX];
>> -	u32 reg;
>> -	u32 value;
>> -};
>> -
>>   /**
>>    * struct xe_survivability: Contains survivability mode information
>>    */
>>   struct xe_survivability {
>> -	/** @info: struct that holds survivability info from scratch registers */
>> -	struct xe_survivability_info *info;
>> +	/** @info: survivability debug info */
>> +	u32 info[MAX_SCRATCH_REG];
>>   
>>   	/** @size: number of scratch registers */
>>   	u32 size;
>> -- 
>> 2.47.1
>>

