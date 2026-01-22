Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA0DD3EE6A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 14:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648F510E9B9;
	Thu, 22 Jan 2026 14:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QnaT4Gf1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EC710E9BE
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 14:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769091157; x=1800627157;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4eYmmXWq5aUdNSxBAvSqSns4VLe7HKLkzA/cZaam2Ok=;
 b=QnaT4Gf1aDq4UFZAfd6MXxrGKLtbLTR6+vv3rR5L4wdqK4AoWwEn447q
 NxdNe9i/BBmTnTmwL4aFRo+7tOf2YJgb0xjliDj+QpSsYSHzReqGapeu5
 yXVbUcqq1XmBJEtHbbu3wY9kR6hGPAvQYcd9KZ8OJfmXiw/wz/mM0FrrB
 yooFxniECS8MyeblSwmcE5IbLQmyiaIjOQYffgVaauhCBGMhAj6VnKHoR
 HQHUJuoJaH9KLs8r/A0k5Mle6A8XHp48hlxURqgxpUiiFE5TkuEnrGFb3
 SQaBnB7Ye5TWSnBWXmDCysd2V55fAnPKny6z3TZ+0sNigM5JD5eksNH/a Q==;
X-CSE-ConnectionGUID: BFlMbKP0Re2uj8wRl6IZTA==
X-CSE-MsgGUID: wxqU/LrUScuzX5ZJyD0a6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70247058"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="70247058"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 06:12:36 -0800
X-CSE-ConnectionGUID: 5w5ii+ycSIyI2Kv/t2gbww==
X-CSE-MsgGUID: Df0x0Oo6QQmU8xNaChqbvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="244354290"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 06:12:37 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 06:12:36 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 06:12:36 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 06:12:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpOyqAXKyIVX1qmJ7rAGT2Z9B4+32DG5BBcngrAPZawdmnnzgM3Jhre59cGeq1MwwZDT+Wg8wPdXRn7T7x0pgyTLaiUETQO9EF4zWIEiR7t4q3GgAGFkwmDjNL6KmxvPkCEs9uDNebk0ZdI0RYih+6DXTHyIjooQEO8Ibi19n1E3yhnAKj7YjGyrRGGuvvfrnrZLwRuxFKpgoxTPbA5c4Y65EQGpXFyg1im4dAlJR/tmp4YW9mvJR5eFlk1Psy7rPd7YOynB6G+d8GOtaI9tav3UZmQtZg6lnkZ6XJBnoujunIT9FT03e90VLp6F1G22r+Xu8I2e94BQ6fCGSA0G2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70Is4Uv4IR7EZvZeslMmETp25n6wOpBSgroaiZCS9Ek=;
 b=mocgO9aA16WOZbUXk/4LaJpdVDmXEHd1IM5ykUS69eqSrY6IkQgy1Aohw/4V+1pbzsB7zA1P1O4Gg38DpcDMAC8cLKWm95TvHRc4cOuQrEEAimIAeb/dqX3CNnfd/bH3V6rI764Nln9/QlkmYEh1tx6dddXQFXBLHrcyUClDOkvii9YtF9XrA3Xwe4x4MQUlRsWO+l3dg6DDgIt+WjYVtw67Ik8WG/3pKzpjTBlKoswN8N/lpiLf6X7CMx4D5WxG7DwNPSdTLxF/3hsjSwudx0BKl+pajzWPAkLifBw2uFi1/UvJ/Uohoy8FDH9SJvqHN66rWpCTsrbRjOK2fvw32Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB6325.namprd11.prod.outlook.com (2603:10b6:8:cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 14:12:30 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 14:12:30 +0000
Message-ID: <50f14792-dec8-4907-98ba-87495f738039@intel.com>
Date: Thu, 22 Jan 2026 15:12:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Make xe_modparam.force_vram_bar_size signed
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260121235618.3138251-4-shuicheng.lin@intel.com>
 <20260121235618.3138251-5-shuicheng.lin@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260121235618.3138251-5-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0043.eurprd04.prod.outlook.com
 (2603:10a6:802:2::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB6325:EE_
X-MS-Office365-Filtering-Correlation-Id: 029f550d-df12-4309-4824-08de59c0478d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEV1d0dLNGhDSThobG5HRHdzbzM1SThob2dheExXTE85TE9yK0RJMEU3NW1T?=
 =?utf-8?B?ME1nSFd2eDNlZU1qM0FFQllrTzZmdEptak1icHE5RUN5OHZUcmlMWVZmdGUv?=
 =?utf-8?B?aEpDZHp3ZHZoT1p0S1dKVGJTc3RIVzVMNnFjcUNEeS9reXg2Z0xuUXVXMnJM?=
 =?utf-8?B?ZEN2RVh4NklBNlZxMGRncUR6WUpiSUxKVEYvWndLTzNhbzlCUkRteEZXOEph?=
 =?utf-8?B?S3A2UWh2aDN1alNkRmtYRDc4Nm5zVEVSczIrNkVmWloyU0dKQjlNamVuSmtL?=
 =?utf-8?B?cStQMkFDV3FkcUtzOWJ6ZGFlRlZMSzFMMm9icUZ5TTdjcTd0dHFqd3pFcFFk?=
 =?utf-8?B?bFFKNnduVTRlVmVPd0hMbisrWGxVVEl5NTlUejhickNLOG5UYTRGeUFaODVU?=
 =?utf-8?B?UENaczVRdGhHRDVMQ2ZsODJJbWRhUW1XZnh0dTlITE1TM3REdnIxaTQ1WGdP?=
 =?utf-8?B?Q2Z3ZXZjZThvcVR3cTZFRi90UzhBVkE0eng3b0llUUV0eW56NzNXQWtLVHJS?=
 =?utf-8?B?Q2RyelNFczJ6dWZnYWFwRjRzS3VidVpZd0hRRUxrOXVIM2lwcG9lY2dhZVlm?=
 =?utf-8?B?N1Z3V3h2TVRGWmd5cFExV0VsUTZSV2doaWpiWVFSUXc2aW12b2U2TU5KY1FJ?=
 =?utf-8?B?cmNobEhLOTA0WGgxdVBRWWYvRFNuenF3ajV5SjIwNnBPeGpITExBakRTYllp?=
 =?utf-8?B?SDIya3FUWjhITWtBbWh2cHkrZktBQ3pQeDdMVHNVQS9VeE9FMDgwcXJRNUUw?=
 =?utf-8?B?SE9CM0ZENVpyVUF0aHZaRlc3NTVOekUzVkFqNWRjOWRiYnhJcnFMbVl1cE9M?=
 =?utf-8?B?Y2p4Rk9EcFlsS0c5dmdUQ2dyelFGdlRQTWVGaDJtWVhEWklYcEc2WXk0NmpM?=
 =?utf-8?B?Tmc3L0lyZGlnUXZPNzlJa2FjcjNmamRsa1lnUGlpalphMXlvSndVZ1VkdEUy?=
 =?utf-8?B?Smk3RUlLTWF1dlFMenZrSWFJbHZvT1FFRk9BNEYvZFcxUFpPaFV1SktlcW1s?=
 =?utf-8?B?UjlhcS9HSmMzTmw3ZVFLd0VmL25uQnhWUjhxSmtqZS9YVGhOOE5FQ0lCZVpK?=
 =?utf-8?B?OElnRnUxWVF6MTdEREM3dHVvakRTMHFmdzRNL1hHMFBPT1NaQ0YwS1l4dWRp?=
 =?utf-8?B?RTJMaFc0ZjdqWGRySzI1amxuaGFveHg3MkptcFFvbTBtOU4xbFZlcGx1b2Va?=
 =?utf-8?B?VXBHK1NnVnlZTytlb0RXYjY3d3VGY3ExMkErTmRwRGt3eXIzMGMvVXRMb2t3?=
 =?utf-8?B?T2NSUUt0K2w1ZnJBM0ZEcVYrM3piWTB2OGxqK2lsNTB4b3VsaUZXdmxidHhC?=
 =?utf-8?B?Rm9qdDgvd1ZydHZ2WVQwazNLaVBmMVVPVVUvc25MRGRBQnJTQjY2T0pvaXlk?=
 =?utf-8?B?YXdDNXNsNkx0UG5ZdkRPVUk3aGsvMG1yTnJETnJ6eFFnUElUUWs3aE5RSDNX?=
 =?utf-8?B?d3grMU1taFlsU2prYmZFbGdvS2tJZWdGY2hsRTl1QWdJTm5vSzh0NFBScWJX?=
 =?utf-8?B?ZUYzWTVvaEtJT050YkhoMDdDL21QZkpjRkYvT1Fzc1hLS29ESUZoVUIyOG1v?=
 =?utf-8?B?enVzd2RtZDNneTU4L3czNnlyRzZLWFoyT0dpVVU5ZEVmeks2ckgzRGtiL2li?=
 =?utf-8?B?dk5DS2xQM3ViUGYrYmNKVDcwQzJFbVVVdHB0UlduVnBMQzJDcGxnMFJoZHo0?=
 =?utf-8?B?MGp4U3NPaFZsdVlwakdESm41c0tZOWxHc0VNYlVHOFAvd1loMEtkK01RMFpK?=
 =?utf-8?B?NFlGbXFaSUxQMjJ1ZmlKbzF2b2o2Y0ZGZzNRcWFHVllwU0xXT3MzR0dIcXA3?=
 =?utf-8?B?Qy9mZGNCNlBoRnZWTVNSdGdmd2NYYVVybnpNRkp5ZDd6KzRsNkZUVEluVDd3?=
 =?utf-8?B?Njc1RHpXUTZ2WU1NVkx5dHBrbmcvT1BFUVVQT1V5Mmd5anBiRHFJU25FQnpi?=
 =?utf-8?B?UE1kY2lSZXhNb1VUYUJWWUh2K1ZYQ3MzZ2ZVR0c0ZXlHTXpna3p4WkNVNWF3?=
 =?utf-8?B?UzlJRzdZdUZSQlF5elhNRGZGMExTSks1blB4ajYrSStNZE5UNlBLSmt4RVNN?=
 =?utf-8?B?MXI4bDltelNBeGJBNTZEaTNiTFNKMHhjcnpNRWlhdEtsNXhZQjloQW9nTk9N?=
 =?utf-8?Q?WzjY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGRKMkc5MmNxbFRvVzdJUkE2NUxKbG5PbzlaZ0pDR2lITWFtZjZLbXpxakJ6?=
 =?utf-8?B?Q2FUYzZ5MmNkYU9FOWdCL0toQWxwNmlFdlBuVXE1MHl6TDkzdHhWaTJ0dkEz?=
 =?utf-8?B?Z0c2cDhKL3pwWnJUTkU3dDY1ckxyMzU1M2l5MWdvRHpCVG8zSXpWd0tDeStr?=
 =?utf-8?B?enZ2aUhhUmRUZXlQRVJpZ3gyS2lycGNVUW0xTXVkck1abVkwQUxRbXNrVVBr?=
 =?utf-8?B?TGo2WEJmUWRJK09zTHdBNXNMcktEL3RCNzlRMktBcWg0WUlPb1IvTHRpckY2?=
 =?utf-8?B?d0s2UE1QbzYxYjB2OFZoS05KOW9YQ2xwUng4Q0dDaU9jbGRsOW4xc0E1TmFU?=
 =?utf-8?B?dXBvaDBwaW5OSk84YmFwbCs5Qlg4WWJWd3g4SlRiTGJpS01Yc0lML3puenRz?=
 =?utf-8?B?M1pzaXh2K3p2VXp5V2lleUZXQU1aK1VucE5CVmxDMEJWL2lKQnR6bDJqcXpT?=
 =?utf-8?B?aDhYWHpZa1BVRGNnODlXTkYxTjVrUXQzaHlmVTlQTEtKbDlMdWlrbFh3N0JJ?=
 =?utf-8?B?azRCZ1pkaHRuSU94SkplOFh2R0JHcThRcHdVWGl2ODlKb0tVTWNWK04zSkFl?=
 =?utf-8?B?WllFRHJSOTFuK0MvRVBDV21TblRGV0ZOSitjcjA4UUYrVjRyMTlTQWZQMTd5?=
 =?utf-8?B?OE1QVFRRWnBVUFNwVm1MT2VWT1BIa295c0c0UEh5UThPanFJTkdhMnNyYXRP?=
 =?utf-8?B?dG5nVjRmY1RwbU13ajAvMC92cVVSWnh2RDI1M01DaU5XYXlKQ083MFJtUXhu?=
 =?utf-8?B?cmN4Qm9kd3RPTGFWaFlHazBsQ1B2bHM0QWkwYjYyQURRb3hzY0sxejFITllN?=
 =?utf-8?B?ck5CaXE0STE3KzRIb25SWkx3Z1RqQkJrVU5NMVRPcmJjMytwdHFMNjFOdTV0?=
 =?utf-8?B?dFR0Tm1uRERjeW52RXo2dEh4dU45S2RhbHdnNlM3ampLQks3SUdBVVFxZSts?=
 =?utf-8?B?SXk1TnEraWVWQ0gvTEhZbWwvQjZvRnVtQ0ZOYjQxWmxaMERHOFBBdkljYzdV?=
 =?utf-8?B?V0pDbHZlSVVXNzV3b0VXN3FIVlgrL2M1MlpZYkViRU10UGl3eVZEdFM0Q2lD?=
 =?utf-8?B?Zk50NlBhVklGTE1POGhFQTNiMzUyWDVZZS9icjBJQ2h5cHVldmJKaWk4TnAx?=
 =?utf-8?B?NHFucVNmNEUvMGhKb2RuQzczYWVUTzZzOXhtZ3NlcTFzbGhyVkw0dTM0dm5s?=
 =?utf-8?B?aUxxc2swR2tFNmRPUTlVNklSYlNldnVrTDY2S3FhR0wrQkFuam1xYkFQOFJE?=
 =?utf-8?B?TkF6aUJOMWhHYVEwUTVOTzBuankzWUs0UFJvZTIvM2dJbFg1ZjVMeTZzYkVU?=
 =?utf-8?B?SG5LNnBGLzB4enU4ajRPMWxaT3JkM1hsdWR6UFQzdnczaWZkckw1VDg4eWcz?=
 =?utf-8?B?bEpkTXB0dzFjTUJneWV4aldmWitCamlsVmVmT05xeVZmOXBwamY5cXNtbmFH?=
 =?utf-8?B?YXg2SzQvSDNqYUp6VGtpQnQrVGVrdGJPZTlIeUtUdzU0Zy90NDMyelZZZlJN?=
 =?utf-8?B?Qlp2YW9GRFdTRHk3L043Wm56aHVERUNxU2IrM0ZoS3Znak9NRUs3aUxISUdG?=
 =?utf-8?B?ekxSaHduaXNvU0tVbnhPNTUrck1sb0dFTFBRMVp5dlczelRTVmI0c0t5YS93?=
 =?utf-8?B?eFlFRmsreXJQUjVlaXJqdGdEcG4rMFVZVXFnRDZsQXI3MjdaOUhPbTAxUzJv?=
 =?utf-8?B?aGthTGxxdE1XblVRaWVHVGxKeHJsTWxmKytXY29pMUdJdTVlalRXZlh5K0pt?=
 =?utf-8?B?MlY4OHMwRXV0cW52WklTb2lTZ1kzUjFnejgzeDdQUllYMHJxNFFxbGJNQldp?=
 =?utf-8?B?azVxWXFvNStoV2lnMUlzSzR3NTczb1dPWVRlS3pVOUtQRlpuZi8rTkJSN0Zo?=
 =?utf-8?B?cCszQzhXMU1SeFpqc1VxZEZEU2ViYTVrL1hpeHo1akg2a0ZlMzJFNDJPVUF6?=
 =?utf-8?B?WG56YXFWbExnRWp4UEN4dThmb1hDb0dGRnNHNnh5OXBPdTZoQm91L2lGQ1Ev?=
 =?utf-8?B?VUhWR0dCakduN1BQY1Frd091dDZyR1NzNFdFM1NYcW9PMjVDS0UxL1Y0VlVo?=
 =?utf-8?B?OE9FcGY2UjBEd1RkS01ybTV6MjVhR3VBVDU2MHR5RmRrRUJvbEVVQ1lFeHJ2?=
 =?utf-8?B?S2FqZDMrcDlsT1VWS0tJbmlrY21lQU9UOUFTY3JidFpCU1I4UWNGckgzSHQw?=
 =?utf-8?B?b0pJdldYU0hUWkkzR3BTMmpTbnlzVlVVWnVUSmFQZVRWWlhQWmhoYStWcnFh?=
 =?utf-8?B?eDhURFNsbHdYajlndTNZQ3BIM1E5T2VzT1A3ZGdjK3Q1ZFQwQnJ4UWJKTXdk?=
 =?utf-8?B?R0JIWkxrQXJ6Nnl6dFY1VStGTWJDWHdPcFBhN2ZBUW00eVFZR2ZTY3BtTnli?=
 =?utf-8?Q?cC0RkEOL9l5ZwCBg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 029f550d-df12-4309-4824-08de59c0478d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 14:12:30.4166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCotcc5/Jxl1stfmXft+lu7j85wc1+IpUF/L0YCaksqTrOJpoGO0Dwz2hAZ22PmYLGGj12Nb+qROcCR6BhkvcSecvx7Hcuucs74UYlH/rmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6325
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



On 1/22/2026 12:56 AM, Shuicheng Lin wrote:
> vram_bar_size is registered as an int module parameter and is documented
> to accept negative values to disable BAR resizing.
> Store it as an int in xe_modparam as well, so negative values work as
> intended and the module_param type matches.
> 
> Fixes: 80742a1aa26e ("drm/xe: Allow to drop vram resizing")
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_module.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 1c75f38ca393..79cb9639c0f3 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -12,7 +12,7 @@
>  struct xe_modparam {
>  	bool force_execlist;
>  	bool probe_display;
> -	u32 force_vram_bar_size;
> +	int force_vram_bar_size;
>  	int guc_log_level;
>  	char *guc_firmware_path;
>  	char *huc_firmware_path;

