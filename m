Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6ACC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 21:55:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E2F10E0E5;
	Wed, 15 May 2024 21:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPKCZihJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D69E10E0E5
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 21:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715810116; x=1747346116;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ptx99Lu9dyVOZSLXUsLR7Rvty4yvsd7HircWSJhLk7o=;
 b=fPKCZihJHGzyrp/2y/czZLRHsyjPL57LbZCig5NkzDM1w4CCsSykwA0d
 FJHjTSwsDVCWjA5DthrSCr5tEHJghENwxa1un/u2JQAqiFZkNKrxkfWyL
 QhhX3TdqyEl+5/6bNb0NfnvuvSeehky8gZL4ZgUxp7QcaycF7cWvKg1qa
 pHCESW/hklWbzZRgLJFmglfYKbhw0fQ6Fkhpew4Hq3cRnpsEv+WZq/FfA
 W2gXJ0tB+ryOdKj70ev7V+FiQzgNX/gypLO0CIeycWAh2W+hRvDiaUgaO
 GviljExczB32j5wIAzTt5WVTxOwv5xfmc6Plqxle7J6ftrJUkPDYjGbh8 w==;
X-CSE-ConnectionGUID: OoXroJh2Qkum01mRru/GJA==
X-CSE-MsgGUID: eTxcEWweSCmVdmn4VRjahA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29378888"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="29378888"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:55:16 -0700
X-CSE-ConnectionGUID: 4c1wLtJeRzy/LMH5L80GoA==
X-CSE-MsgGUID: lbQRRCjPSkuSnml8xiuSIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="62394514"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 14:55:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 14:55:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 15 May 2024 14:55:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 14:55:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyEoUZgsNDBJmYskUAxcvTmQsBQjOO3snrDIv1H3S3esZMCsdXkcv3tiZGMPv/0JndAd+TYNT9weRGYuHq38iGVGYj+X20m9GlmNUR1il3sES52mZ714QqHKDfy2wIQmskF+XnTiYdP/A/k9WFlfaRFqq60r80jrZrOamCgtS+w/vPL54vj6eEzHHANTZWWJ7Pbe/HRbh1flOMoMF9A+Gwx5r4BJRbfTE18LOhdqLyT0HsWR0tBJKNxFrkKEaRuBd+Pof/xxnejQm1PF6NK88duUw3VqMJTZ2RZfZt1/8fncwE9KxhtgZVFyOJmwf7E8YeF8mfksYBaCwlxfS3IZ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MUCwgCe8WJufXGaPy5/9I9+PZ2lNAiz3gepdhx5B8w=;
 b=J9zgOgsycDMuMU5u5TKO03TqLeTtnZ6vvS7zC5NZKV1BYS56VZMtdn5uQwKl+aYQ2A5oNyWoIgJYZD0m3PgkMc9LOQW5tTTQlz/RRBVvB2bAocqf2W9fdOAA8aqytf6X6hVAk7VnCsybooZUXyAY1t0eLpKI6HKc3+nma8LjpmS3YZD9sTIgHOKY8bEbypFOvYzRRGfzSNposoondcFzHUGRevv4HlJx/DTllbKbr1uGs99f0d64b+u27TNECWiUGck7UONjYyBZ6D830h5q2xObgQn35PEdDdPptAV0I9MXsIKYaF8wXBcFfaqxm6DYUXu93qL5QAYcLVwV9NeP7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by LV3PR11MB8726.namprd11.prod.outlook.com (2603:10b6:408:21a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Wed, 15 May
 2024 21:55:13 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ca61:3301:7ce0:f694]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ca61:3301:7ce0:f694%4]) with mapi id 15.20.7587.025; Wed, 15 May 2024
 21:55:13 +0000
Message-ID: <afea7b56-2d7d-4686-aac1-012288e1bab5@intel.com>
Date: Wed, 15 May 2024 17:55:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] drm/xe/guc: Extract GuC error capture lists
Content-Language: en-US
To: <intel-xe@lists.freedesktop.org>
References: <20240507014736.1057093-1-zhanjun.dong@intel.com>
 <20240507014736.1057093-5-zhanjun.dong@intel.com>
 <66f6cab5388fb92fe090427406f1f2807bf10d25.camel@intel.com>
 <d89e9233-083d-4ab3-bb8d-9fad07922864@intel.com>
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <d89e9233-083d-4ab3-bb8d-9fad07922864@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0068.namprd05.prod.outlook.com
 (2603:10b6:a03:332::13) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|LV3PR11MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: 414359e8-7210-4020-bd3c-08dc7529b2e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1Vva2NkNW5Zb2pGSUVsYmlySUVnQ0Z6TjI5d1JOL3p0NnNMV3pVNXgxUlpI?=
 =?utf-8?B?UmxEUksyRnJFU3B2L1NNVXUzemFPem5ScDlSeC9Ja3lqV1V6bnVHMTV5U2FC?=
 =?utf-8?B?WXF1ZUgwREpRNjZrK0dNN0xaSEZlTTYrRkFielZVcThTTzI3R1pWV2Y4aHEw?=
 =?utf-8?B?U0F3dHVLTDI3cDVPZGV0RmovYkFyRmJ6MFZhVlVydEMvZzNMa2xvVytNQVdK?=
 =?utf-8?B?bi95bjhOMzEwT3NyUDhsdG5heVJPcEtzdHUxVGVSVTdlOC9RK3AyWmhTOXhu?=
 =?utf-8?B?RDl5WXVJZjRWWW01d3dLU2VCbmI2ZUpjaFhhTWdyRURDUXhTR1diUnpybU1L?=
 =?utf-8?B?Tm9FK3JIMWdYbDhUaW9PMWp2eUFRb0RDcmNLKzZ0U2JmZlI4YURaZkpXV3pv?=
 =?utf-8?B?YVc5NGxYcFg5TGFKaUZKRmUzSVlIZHhRczRmQ3paNGI1ZFJwU2xDRXJ6ajRw?=
 =?utf-8?B?WGlIMGRxYmZoTkZpZy9UREVNMDVVZFdZall5NFJNZitRdzFFYjFxL0lqRTNq?=
 =?utf-8?B?bFFwVmVFMkxHVGI5Q0NzWVQxb3lrZFM5QWlQcGFzc21Vdk0ySFUzOE5URDJ3?=
 =?utf-8?B?SXYxTGFlb3J3RXlXY0llc0c2cTU3M2V2MFdoNTRUQVl4R0VtYUNibFFHVXo2?=
 =?utf-8?B?K25RdSt4RnZSc2RteGNEek13NkJGbHlrZnZNWTh5bndrNTVHbmw5VWo4QmFZ?=
 =?utf-8?B?VkZvNi9VU3YzTU4veWRCOWVwTCtCUGpZVGg1OEtqMGhzdTdiaklCWjlXeGx1?=
 =?utf-8?B?b0tLOVJVMnJrbWhBOUdFMEFpNFVHLzdCaC84b0J5R0NmWWQxNk1nZ3liVmVW?=
 =?utf-8?B?MG41dStUdVRwOHYvZm54R2poTmcwcHZUbGdTbXhCb1JnMmQ5N0l5aEN3L1VX?=
 =?utf-8?B?bFMwSXZmVTlhSm1Sa1NsRFBjb3k3cnlxbnhjM3NSeE9vSHhoYW8wZzhpZTFq?=
 =?utf-8?B?NDhyWXRRVmpGUVoxS0QyTGpNUkFwOHRNOVpoVmw4QWFiVGNvTVNoQ3o4U0Jo?=
 =?utf-8?B?dGZUMllVL1NvdlcraTlxeXhHNkUwVnMrWGpLb2VlV1hpeW5kdmVMbUFTcnpX?=
 =?utf-8?B?Y3c3VHZobHYwK0g5eWoxcDBCU3VBejlZeno3S3pCbFBKVU9GejFjejNxUDMw?=
 =?utf-8?B?Wnk0Zm9LaSsxR1ExUnBMR3pYRjBJajFKWmNmamxER241WnlSaHlFcjFCOTE4?=
 =?utf-8?B?OStoeko1WDdSQ3dxS2RJY2I1Q3UrYW82SnNHRS8yY1NNSzVKSUVhWjkvRkdF?=
 =?utf-8?B?SndsTkdKWmRoVkJIYjBBWWRPZmViSWg1TWVmMDgzZ1RPYlhrNjFwU3piZWJ0?=
 =?utf-8?B?Y1VnNWwwTWh2dkd2K1VTS0VXSjM4L3VEUWpwSGFzUS9oMi81QnR2eTBOZHl4?=
 =?utf-8?B?UHNHUGhyYWtub2FnNzFrbENMaGkwaE5PRkpMUnF0ckFvS2hTUThYUlowUlQy?=
 =?utf-8?B?OW1sWjV5YXAwdEZMMUIwSituODdLczZZTXNPWGJGRmg5cEx1Q3NWck1RdTJp?=
 =?utf-8?B?cDdNUlVCRTg5VTBUUjh6UERPUFNia1NvSmJIUkdUVVF0SXdEak96VFhpZkQv?=
 =?utf-8?B?ZERscjI4MkgxeXRSbndSOFBiNTVCVDBvSWhveHFoK3hySDlFTjlhZkRkcE1v?=
 =?utf-8?B?ZFRXa05WS1ZzTm5TWXRqOUc4cUh5NkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG43VDkxeEpaSWRlaFNRNDQ1MWVpTStxT0NpVXJIdWkra2k1ZFFCMTR0NnJM?=
 =?utf-8?B?RzJFdW9UdkJyaEl5K3RnU2VmVnNjUktpOGk4VlZITGErQkRuaDNFelNQK0Mv?=
 =?utf-8?B?WVZLQzRpQ0ZOc3IxWHBrTnFBVVhaOE04YW1sSG1HbVFKSis5WWJlRVFWZkZ0?=
 =?utf-8?B?YUZlZUR3eUJJRjBrczdXc1paRmt3c1Ryb3hiRmEwZVBLOFRIVTVia2F2NC9Y?=
 =?utf-8?B?WWdBU0NqdldrNW9KZ3ZsdE9HUXB6TEpqRWU5cXhnTkZ6Zm51KzFFN2Mwb29Z?=
 =?utf-8?B?eVdJalJuaytQTHJoYi9IV3M0amx5NGNEYlBtUFVCMXUvdU1YOUNjb3FxbGFi?=
 =?utf-8?B?N1BZekdiVHNPTW5HbFg1Q0RtcW0vZHRXYzB0dWhTSitFbm4zdzI1cGhwaCtw?=
 =?utf-8?B?emFSVE1vSlRrdzM1eXFkR2dyZGlaZ0xsSmtTZ0FXUzhFWWg5Y0FtWDE1aENn?=
 =?utf-8?B?NTd3THpKc3RIdnJvU0RjaUxad3NmM2I2K0RJdXB4cDlWY1pWNUc4eU04a0lM?=
 =?utf-8?B?VWZENjVUT3Qybmw3aDJWWTcwWnJlcW9PUWF5cUdnQ3pwbUErNGlMTkFUcnBR?=
 =?utf-8?B?UUQ2S3B6bWQwTTFmcjRERDdSL09NYWx2UE4wTVk1UlZlbXJsU05QOXBEMlk3?=
 =?utf-8?B?dCtQYVFhZmcrWk1TRXVmZ0pBQXpoMC9Sck1wSStRMTE3TGdzOXdWNkFMYjAx?=
 =?utf-8?B?YmRWUW4yYzdkbWtacVRjcWgwR1JGYjJvUXIraEtZRjlaNURvSDZ2eU0rTUxx?=
 =?utf-8?B?OGFoWTFiSVFuVHgrN2RqZ1ZaYnhsY1lqY0liRDg1dXMzSkFvazRsU2pwaDlC?=
 =?utf-8?B?czg3ZzFlZEorM1ZRUXBNV2VONmtKZSthNzZ6aUsvUHgxVWZzRlFnQ244cDRm?=
 =?utf-8?B?WUVmUXc5WjMyZXZHeUZyakVWc05yQzdRcFAzZVo2ZDBZaW1tK1M0bGo0cHVw?=
 =?utf-8?B?UFFFNXRPY2RkRmowaHNtK0Zycm9WVXdqQXplNUNtaXFFdVBzRWJXYnlySDVl?=
 =?utf-8?B?c3BPMjdBRk1nZ3o0QUlpUWZwb1FGVXpQRHdKT1F0Znd5elJtbFpPS1NvTG5P?=
 =?utf-8?B?TENKcTdnUFB4V2xCaEwzd2wzVWU0TG8vbFlseWNtZ3dHUDFRMTBna2MvOVVs?=
 =?utf-8?B?eUJ4QlRwQUVUcG5MWXVQeFg5U2lobklDL000NHVkOGR0WGVseFZWUXo1TkFH?=
 =?utf-8?B?YTg2U0RLQTZXM1RLZHVCZXF1bFZyK2hzQ3lDVnVld0pZalh5Uk5UY24vK0Rz?=
 =?utf-8?B?UzFWYWdjRDBES0RUbVQ4MGFBcHEzelNXYzRram5BNGFWYko5aDVYMTh6TnVL?=
 =?utf-8?B?Ym41Vi9jbjZUWjR1L0dRNEFDeVJKeW9ydHBKcVBLTEV0SXp0SGNxaU9wTmhD?=
 =?utf-8?B?cnFObm8zeTA4SmZ5aDJGdUFXZnljQWYweFJTOTREY3h0WDNjeDFqeGVaQ0Nv?=
 =?utf-8?B?R1V5QVUycTRacWFpazU0YVJETEVMdEc2K2VzSXh3eC80UGFjbTFhMXdXZE9W?=
 =?utf-8?B?VEpkRS9rYXE2Z3NBaDdkaTROTjl6Q0tqaE9QU3dPNkxsTXM2OUZUYlg4LzF5?=
 =?utf-8?B?MGJheDNrdUN1ejc2OGRNMzZKZzl5Q3J6ZUFZRk1Lc1k3M1pGNmVLOXlyaTUr?=
 =?utf-8?B?TFhQOUwwdDd2VHIzRnFCM21JdmVNa3RSeVRLUjlCRm9JTHFScy80dTVGQ1BQ?=
 =?utf-8?B?U21wVTRYK2ROSSs5V3lRWXNZNzZzWUdFZW1uVjVERHhRa0UxdUZLQXdDVGtN?=
 =?utf-8?B?N05UdEE3dmduUXc2U0Y5VDNlYUtzdjl0MkxHNytmWUo5VTN2SFdVVWVjRUxL?=
 =?utf-8?B?T2E3UStVUEdsbmljd2M5cnB3RmFaL25ldkNKV01OaUtqTXpkMEQ3R1RnTnpK?=
 =?utf-8?B?YVlNQlFTZkQzMGQ5dm9STUY4KytmUzhHYnM0RmQ4Rm5TK3JZZGJzMWh4Q2pp?=
 =?utf-8?B?NDZYTmVCN0c1ekxNT0pWS2JYZ1hUY2dqc1ZmYVdqZHk2dTEvak5kUXp2Q1ZH?=
 =?utf-8?B?dUdmd0R4OFBmcUNBQkpRa24yWk5nRVg5c1FWNUR3VXorbWdITDdrdVdWRHEr?=
 =?utf-8?B?QXQyZDg2QWFETi83cWNjSWV6RVU3azlNZVhTNzlrK2RadjZyZCtoQnRWSHJZ?=
 =?utf-8?Q?Pk7ytANy+0jVO5/5ZZk3WIyQo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 414359e8-7210-4020-bd3c-08dc7529b2e9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 21:55:13.6974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uN/4bQt9eYp8PxDLXtK69nKc7gj7JOy1H8K6TLPJLz1Cxycm5zWGCNuAaNFbyVqt6i09TnAna71uET1dUVxKeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8726
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



On 2024-05-15 5:45 p.m., Dong, Zhanjun wrote:
> See my comments below.
> 
> Regards,
> Zhanjun Dong
> 
> On 2024-05-10 9:43 p.m., Teres Alexis, Alan Previn wrote:
>> On Mon, 2024-05-06 at 18:47 -0700, Zhanjun Dong wrote:
>>> Upon the G2H Notify-Err-Capture event, parse through the
>>> GuC Log Buffer (error-capture-subregion) and generate one or
>>> more capture-nodes. A single node represents a single "engine-
>>> instance-capture-dump" and contains at least 3 register lists:
>>> global, engine-class and engine-instance. An internal link
>>> list is maintained to store one or more nodes.
>>>
>>> Because the link-list node generation happen before the call
>>> to devcoredump, duplicate global and engine-class register
>>> lists for each engine-instance register dump if we find
>>> dependent-engine resets in a engine-capture-group.
>>>
>> alan:snip
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c 
>>> b/drivers/gpu/drm/xe/xe_guc_capture.c
>>> index d2df027081b5..71d7c4a58925 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>>> @@ -520,6 +520,560 @@ static void check_guc_capture_size(struct 
>>> xe_guc *guc)
>>>                            buffer_size, spare_size, capture_size);
>>>   }
>>>
>> alan:snip
>>> +static struct __guc_capture_parsed_output *
>>> +guc_capture_get_prealloc_node(struct xe_guc *guc)
>>> +{
>>> +       struct __guc_capture_parsed_output *found = NULL;
>>> +
>>> +       if (!list_empty(&guc->capture->cachelist)) {
>>> +               struct __guc_capture_parsed_output *n, *ntmp;
>>> +
>>> +               /* get first avail node from the cache list */
>>> +               list_for_each_entry_safe(n, ntmp, 
>>> &guc->capture->cachelist, link) {
>>> +                       found = n;
>>> +                       list_del(&n->link);
>>> +                       break;
>>> +               }
>>> +       } else {
>>> +               struct __guc_capture_parsed_output *n, *ntmp;
>>> +
>>> +               /* traverse down and steal back the oldest node 
>>> already allocated */
>>> +               list_for_each_entry_safe(n, ntmp, 
>>> &guc->capture->outlist, link) {
>>> +                       found = n;
>>> +               }
>>> +               if (found)
>>> +                       list_del(&found->link);
>>> +       }
>>> +       if (found)
>>> +               guc_capture_init_node(guc, found);
>>> +
>>> +       return found;
>>> +}
>> alan: I mentioned this in rev6, you cannot start pre-allocated 
>> nodelist anywhere
>> in this patch when you are only allocating it in patch 6. Look back at 
>> my rev 6
>> comments on this. Also, take a look at the original i915 patch on how 
>> to implement
>> guc_capture_alloc/delete_one_node without preallocated nodelist:
>> https://patchwork.freedesktop.org/patch/479022/?series=101604&rev=1
>> (note: watch especially for the use of new->reginfo[i].regs which needed
>> additional allocation step. Alternatively we could squash patch 4 and 
>> patch 6
>> together and change patch 4's comment but not sure it might be too 
>> large a
>> patch (can discuss offline).
> 
> Good point, let me try with pre-alloc vs GFP_AOTMIC and will get back to 
> you.
> 
>>
>>> +static int
>>> +guc_capture_extract_reglists(struct xe_guc *guc, struct 
>>> __guc_capture_bufstate *buf)
>>> +{
>>> +       struct xe_gt *gt = guc_to_gt(guc);
>>> +       struct guc_state_capture_group_header_t ghdr = {0};
>>> +       struct guc_state_capture_header_t hdr = {0};
>>> +       struct __guc_capture_parsed_output *node = NULL;
>>> +       struct guc_mmio_reg *regs = NULL;
>>> +       int i, numlists, numregs, ret = 0;
>>> +       enum guc_capture_type datatype;
>>> +       struct guc_mmio_reg tmp;
>>> +       bool is_partial = false;
>> alan:snip
>>> +               if (!node) {
>>> +                       node = guc_capture_get_prealloc_node(guc);
>> alan: see above comment on the use of prealloc_node (as per rev 6's 
>> comments)
>> alan:snip
>>
>>> +static void __guc_capture_process_output(struct xe_guc *guc)
>>> +{
>>> +       unsigned int buffer_size, read_offset, write_offset, full_count;
>>> +       struct xe_uc *uc = container_of(guc, typeof(*uc), guc);
>>> +       struct guc_log_buffer_state log_buf_state_local;
>>> +       struct guc_log_buffer_state *log_buf_state;
>>> +       struct __guc_capture_bufstate buf;
>>> +       bool new_overflow;
>>> +       int ret;
>>> +       u32 log_buf_state_offset;
>>> +       u32 src_data_offset;
>>> +
>>> +       log_buf_state = (struct guc_log_buffer_state 
>>> *)((ulong)guc->log.bo->vmap.vaddr +
>>> +                       (sizeof(struct guc_log_buffer_state) * 
>>> GUC_CAPTURE_LOG_BUFFER));
>> alan: once again, i dont think we can use vmap.vaddr directly this 
>> this anymore right?
>> i dont think we use "log_buf_state" until the end of this function to 
>> set the new read_ptr
>> and flush flag. We ought to use xe_map_wr below?
> Yes, need xe_map_xxx helper, as we are doing read, so should be xe_map_rd
Oops, here is to get the pointer, but the code at function bottom:
	/* Update the state of log buffer err-cap state */
	log_buf_state->read_ptr = write_offset;
	log_buf_state->flush_to_file = 0;
Need to be replaced by xe_map_wr

>>> +
>>> +       log_buf_state_offset = sizeof(struct guc_log_buffer_state) * 
>>> GUC_CAPTURE_LOG_BUFFER;
>>> +       src_data_offset = xe_guc_get_log_buffer_offset(&guc->log, 
>>> GUC_CAPTURE_LOG_BUFFER);
>>> +
>>> +       /*
>>> +        * Make a copy of the state structure, inside GuC log buffer
>>> +        * (which is uncached mapped), on the stack to avoid reading
>>> +        * from it multiple times.
>>> +        */
>>> +       xe_map_memcpy_from(guc_to_xe(guc), &log_buf_state_local, 
>>> &guc->log.bo->vmap,
>>> +                          log_buf_state_offset, sizeof(struct 
>>> guc_log_buffer_state));
>> alan:snip
>>
