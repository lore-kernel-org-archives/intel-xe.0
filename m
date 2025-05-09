Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F8AC3ABBC
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 19:13:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9992410EAC3;
	Fri,  9 May 2025 19:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0yMcLB4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38BA10EAC3
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 19:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746818015; x=1778354015;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EriDBiLkuVMjlxqVEdUNXY3wJDdGGaALpBHKl0G0Zdk=;
 b=G0yMcLB4tz3iAPPM8xZ+qyELKfkP6NvOAxyHo9cz4NWqT3mVEY0aBFFB
 HC1JEfppp7GZ0aIGprrFAqpVsum30PuLz6cIfj8kMr0kP6jyAFBz0sX2u
 UUQo6z/aZ9gzOdQrxGQftCt9rbnZmPzMc4FVgOoIflFecNHlMsvj5y0Yv
 OVXaSrwY3NXuuYVo1lzeLQt3MnuIsZDfjqYto0t8QoUpeMm9LS30wkaU6
 Qz4VQgGKECEmL3f670xaW0V6+0qtol2nSkN0AXsTZxaPpqZ7I55y+wAR1
 VOclS0J0HGcWOeAxNaDOzk5QVTIptNcnO6Bim/dlqxTqi+3iy4pqEfNW9 Q==;
X-CSE-ConnectionGUID: ZNlLonXZR2qhiZGi++qO3A==
X-CSE-MsgGUID: wuxeQJ6/RkmX4wu86ttuYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="74043249"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; d="scan'208";a="74043249"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 12:13:34 -0700
X-CSE-ConnectionGUID: BGhQaIfrSBeaTNfapf339A==
X-CSE-MsgGUID: eM/yyH+mRxCX0jJwLtLGZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; d="scan'208";a="141478655"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 12:13:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 9 May 2025 12:13:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 9 May 2025 12:13:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 9 May 2025 12:13:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVgDKULhWTPiDByKpY5jLOK9P6GRxlmcJRgFCCPeKdQ/pek4SfwENrcTKqcd3mfy7LPLbbawQZEty0IS4Hrmf8D0dlb6YCz7MUu9MLIv9MPuQt9TiBptHzXIe6iOaE1SWc8Oy1ogjxLZHybsdI42q3McU2RR4MsrhmgUlYxzKw2UrhVBbajTJxo9IKY/S8jyhgXhc0kSptBuB7IfwsGJk0gV0N1NPEuK7iHGzDfDt9qj3kPI8tDenKvs1SvkXfr1xIqtd6ZVaiVbgliCMRNxwV7fNJPnLJ126y3cDZtRg50/7159AthVWu6ybRO8Mln4Z0Qph1FxSbK3fJS+HDYgKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziVJ6mb+nk90J9EuJd0ec/wOHCRwsEn2RJVXhw7Fqlc=;
 b=G2f3XRllZW2s+w+jiOmDvWCV1/EzVHamrZ7j4HEujbcwHhzs11jEbLLYe1vJis/OnpThwCGHZYreduHahNGOMbT9NMkQocHrwI3haPwdt5qAjuFzfS2fLZJXlF5ER8onkOGO12OXdJwjb1Dm6MdIZqwVmCMP7PnaFhBmOeV2Vo0FRx+PODPBOloFjW47hq++OPv8Cdu1tp9K8z2KdCIjVacEUiY5pw2wF2fsFMk8M5d2tBnEFWNfT7hySE+B+ZTtTGbQuikT8buUNGfGqcd1WQQ9qeZcrHg0vNCmlXaMHrpvnw1OeKaH8O1nQ4+HQtaz058/0rbe/NXQPF50DxbQ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA1PR11MB6265.namprd11.prod.outlook.com (2603:10b6:208:3e7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 9 May
 2025 19:13:04 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 19:13:04 +0000
Message-ID: <58717de2-2269-4d02-b8ea-7e02eaa0e1eb@intel.com>
Date: Fri, 9 May 2025 12:13:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Do not print engine reset message on a killed
 queue
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250508190920.1343610-1-matthew.brost@intel.com>
 <96b700c1-4980-4876-9ea3-62e753f0436a@intel.com>
 <aB2am1IYTbIU6j/u@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <aB2am1IYTbIU6j/u@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::15) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA1PR11MB6265:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ef4dc75-211e-497f-7108-08dd8f2d85d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWdodWR5RnpSeWlVYUpYaGM1c2g2ZFNwTGpYcnFZem8xbGZRcFB3czAxOXZ5?=
 =?utf-8?B?V0ZONWduMUliRXM2T0h5L3ZsdUljME5RVk9QMzZTTHdsKzZ0U2w2Wi9BcCta?=
 =?utf-8?B?bzlhZVJlQm9ocXFzWlBmV2JtbC8zbXlMcld2MFUxZnBOd0wrNi9OajFlQzRS?=
 =?utf-8?B?SjlycHNBMDRsTmdjRHZ4SnRtV1BzYmlicXp6NU5SYlNlWXlocXptbDdXbW03?=
 =?utf-8?B?alBKN0NtNHJhODYzblVLOTlLdVNOSHNHSTVRbkxmWnowQmVRTkNLSmpDbW0r?=
 =?utf-8?B?dTd1TXh4WkQyL3ZNU0xiV1cwTitQTUJWeTRIcS9oMVZTaEJYNGxMK0N5MXNI?=
 =?utf-8?B?QU5WZ3Q4WWFEZWJ0cm8wOXRlMWhpbGl3ZzhPVWNBc1NMekc5OVpYSmtQUEx3?=
 =?utf-8?B?c1d0RmEyOEc1bWFuUERWUUtQM1cvaWdwK29nckhDbU5PbUFPUWZETWozOEVh?=
 =?utf-8?B?bHFVUHplenpLYWpSZmpWZlNPSFhiTFMxRWd5Q1NZd1FhRUMwSGNwTVAyQkVY?=
 =?utf-8?B?VUlWUWJ6QWVXQU9FdXRaOHpnZG1CWjBnaEV4R3V2ZFYwSEt6cmMxSWZWUHFv?=
 =?utf-8?B?bi9mNWdQT0phd0tMckJTeHh0YjNVejRiS3BFVW5sMURienpDN1h2TnlHS2w0?=
 =?utf-8?B?RjZsY3R6UEczMmc0aURiMmFZZ0dkUWRORVNPNjdrZ2Y4OHg0V01ocjhDUkcv?=
 =?utf-8?B?Nm8xS0xmK1dYNlJ1djlSL0VOakRGM1VYeEdnU0JtMktNQkRZTjY5ZkdKYVls?=
 =?utf-8?B?UW9mdDBhdndKemFCcEw4TDlsZWNvRndsT3RvN2VhajlWU2RmNElyTE91aGlQ?=
 =?utf-8?B?NTJYOWlhdWJZUnJxeHpNNzJZTHdkS0pVWFltVmVDMERORzRZMTV5ZTlieVNV?=
 =?utf-8?B?RVk0VVFZbFZvSU8xYUhDQmVIOC8zenJQaGVPenVEdDB2NUFjeXBxM3llOHJL?=
 =?utf-8?B?THdaei82cStTY0tXZzhJckdoOGJWaCtya0NGdi9qcXVxOG0zZTcxRk92aWxl?=
 =?utf-8?B?SW9BRERxVld0S3hSV3ByRHhxZDk0OE12RG1OcnFxbWgvcW9lYUovcFQ5Ly9X?=
 =?utf-8?B?dG1iclJIajJKWC9zVEtYYTdhSjd3UW4zMVByZG5ZcTBDbVNsZmhvVmNXbGlj?=
 =?utf-8?B?S1pScjNLRTgrY0tEOXNVUXhwRnBjV2tUalRUUkRBc2M3dUcxQkJSclNzV21l?=
 =?utf-8?B?ejhXOTNGV3dSeGxQN2p5TXdoeVQrUnFVcVYzSmVwZkhMOWtWN1FJSlpXb0VB?=
 =?utf-8?B?RHBORWNQTHphQ2xCTGIrZXFlZ3A1S2lRcm11b2taTlhXRndwVUN5MTdJUjNU?=
 =?utf-8?B?R3lCakE0bmsvdjBFWk5XUUxFeW45WWtzSnlnTkJYb21zeUZyK0p6RDYxdjYy?=
 =?utf-8?B?aSt4a0g4dk5TT1ByVUxYQkJYT1Jqc2NsYnpMS3VlVHBOWGZranJtcUNxTXp5?=
 =?utf-8?B?Q3hCaE8vbERpOGNQRDR2K1dzanJOaC90b1FndU5CR1ZFekJmd0NZUjlwYTJl?=
 =?utf-8?B?WW9KSHI5d2tkZzlaY3pzaGszMUM5MjVWRG1yNFFiRzkyLzRyU0lod2lsaHl4?=
 =?utf-8?B?UGpaV3hHT1NCMjJYSWgvaE9rMnp6RWovTTJuZVA4Ni9Mb3NRbmEvVmpLN1Y2?=
 =?utf-8?B?RVRadGkzYStDWG9TQTgyWm91bGV3cGhFaWVYdFZYYTROKzc2UDZsVjBpVmpV?=
 =?utf-8?B?OUJwem5pdFZ1L3FkRklhRWlFVTVQOU5rT3hac01LMHBGZWoyL09UajNxazF3?=
 =?utf-8?B?S0xrSThvWEYzMEVMQTl1K3pWSHIrVHFmMGRKYUdpdnRVakMzYmZNODE5aVRw?=
 =?utf-8?Q?OcPYqaty+9WnvBQCDRg7yt/bc6x1swj6RheAQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkxqLzh1dFQ3RGVjWTQrc0lHd2pFcmNGdzNlbVloREsrVmY3TkZWKytwb0lj?=
 =?utf-8?B?SVYyNEhVdGlpMVl1VHdxeUt4OUpESjZYZ3JaYnFzOURsYndNaElwVEhFR0lo?=
 =?utf-8?B?M2dYekFHb0tCbjhXb2RsNlpjdk5Lc1I4NjJXdm94M0xueU1JVUk1YWhMYVlp?=
 =?utf-8?B?aUJGNjJ0ck14RkpJVCtvd3VEcGpsQkVDcWdERFR2OGF3VWRkMmlEZ2I3c1gw?=
 =?utf-8?B?aEJib001UnB3OFFiZUJJVFp6SytvZFI4RUJkalpyVndHN0ZQdGo4WW9CUDZo?=
 =?utf-8?B?NUtIbjdYYmlrNDB3TVd6cm9QdFpEWDlqT29GK2IrNGZOZ3hqN3FsVHV2YVBE?=
 =?utf-8?B?U1J6a2pDVmRMeFY1UVRYQW1sRUtzcGlYOTYwa2Z2K2NIK1VjbW1MenMrRWdY?=
 =?utf-8?B?Wjl6OUVlTmFMQjNmaVl2VnV2L05nSkdwcWEyRnpqaDErSXVaY1VPby9jOHcz?=
 =?utf-8?B?aDJXamZzbmE0RnJKTUh3dzZZNDBFS3k2RmlXYlk4VEVIVU02RzMweXlVSUNH?=
 =?utf-8?B?UVhzSGUzSHZFTXNlZExXbXkzWnNTT05FNGRWK2RQODdKaytPZGRyWHNrdG1E?=
 =?utf-8?B?NGJZMVBDSXFUWjdrbStPU1VOdk5TSHdzNXNLdnJrUnZNQ1VvREp6Z0E3b3Rj?=
 =?utf-8?B?NXRQeVhBWnpRa1B4THo1R3dtS1F1d2JUL0pZVnZVOGVXOHZTekl0SElKUlBu?=
 =?utf-8?B?TkZ3ZlJXVUo1UnBXQjFMT3d3RHJ2U3J1K2M4Z2hlMmZWY0JLWCtpVXpxUWxX?=
 =?utf-8?B?YTVXWnFnV0N3R2NKV0xMZWd4T1I5RldFeGdTMlN0MmhpWjFIYTVWZWtnaWVR?=
 =?utf-8?B?YmQwSkNkaUxhNm05REEyUVB6dm9KeVdEbVcvby9DZWxiRElQMy90U1k3SjNo?=
 =?utf-8?B?Z1craDFhSHlINHFsOUprNUY4c2lOWDdmNTZVQVVJLzNBMG1YZWVIZ0hxNkZF?=
 =?utf-8?B?dUJVZk41Y09wMEo4NFA2Yyt3WHZoV1VqR01aYnIyeGNMOEhCbEwxM0VhbHlI?=
 =?utf-8?B?QS80MHpjWUs3Z0kxWE5ybHNNWE0yR3Z6d0JtcllWVmlSOGRuOW5kOWxXbm5m?=
 =?utf-8?B?U2tHTGovMDhqTEV2eTcwLzRSUksvM2lFM1VFVVF3aVR0cGtvNUt4MzdDTGZq?=
 =?utf-8?B?bDZvdm00VURPVWN0SnZ6a2lNRWtSekJOdnRqWXUwbjUrbG5velN5bXNKY1R2?=
 =?utf-8?B?Si9jdEo3R2cyNkNrdEltY0EvOVNwUFBkeXFrcGdCR0ZVTWNURnpyOUhreVl3?=
 =?utf-8?B?T0xwSnhIWm0xUThPRFJDT0dZYW5MM3RkZUEwU0lIZE9MU2VsejFwZ2FnSXkr?=
 =?utf-8?B?QXB3Qm9kalRFVEphNENFc3NtL1M0MzJBSGp6QWFuM1gwNW9PZVVIWDIwdnhl?=
 =?utf-8?B?UmFuQVNYWHlIblc0QXFqSk94TzI4T3hSYndObFdwNzJuZUsrRjNJcHRiUUZB?=
 =?utf-8?B?RTJZbC9PVS84KzRET3hKZG53NUJJdDR1VkwwdTd1OFpxakNzVmhUc05lZHJl?=
 =?utf-8?B?eHkwZWlDTU9UblllM0Nwc3g4bjhzcWZjNVBLd2RoaXJ0TGdBTXB4Z05KajNu?=
 =?utf-8?B?V1RWRktWR1ZWS1Jna2FKTkZhNGNnOGx0Tm5uZmUwdE5iS0N1ekloSktqY3J6?=
 =?utf-8?B?NjdEYWtBOW1oQWJvTFRLMnhmSzlYWU1WbVhpbGlTOFhrK0hsaVpvc1o4ZVpY?=
 =?utf-8?B?amxFZ0hYRkpxNlRNcW94c0wzY1ZNUUNRMVEwR2FJSlhxeGZpWjNOTXEyNDd4?=
 =?utf-8?B?OWZOUFNXYzdxUXBUZk9lVktUSDROZ0tlcXByRGN3Z1RZOURwSmxJZFlRclFO?=
 =?utf-8?B?akM4Mm9iRGZ0MXlyYUhRb1pTc3ZFZDFYMUkvTTFwMmNwTVBRVGtRcWlHQUl5?=
 =?utf-8?B?MDdGa2lmRE1ya2Irb2hJOHhINjlTdW1vR25HQklXNWlyYWNuemNjamlWWk4w?=
 =?utf-8?B?UjhJeUVsN2JSRVFjam1BQm5rdmhTOVk2bEEzTW1WWGNjZ3lCNU1YV0p4cUMw?=
 =?utf-8?B?dStyRncyOFRMaDc0YURMZUhvRGxQVXVSTHBLNzNtamZaU0ZWT2dJUm9jaXJl?=
 =?utf-8?B?aFFjQTVtNGVQUEorbitmWkZ6MXF2TGR1YnlGM29jQWdGeFk4MnIxS3k5SHZG?=
 =?utf-8?B?bDJ0TVlweVhCZGx0YUpGaEpPcjY2VkhRSGZ0THZMOEpHUG10QmlmYU5aSWRW?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef4dc75-211e-497f-7108-08dd8f2d85d0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 19:13:04.2261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgiA2btr9GKtEeKxT3zhhyMXdvcest+iUkRY0dKIt9R7PhkwEUjUA2X5ZJMQS6Exx2R7/U8OApgtaVgDA5PK+0ADYorOHserEjGSptI11xY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6265
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

On 5/8/2025 11:03 PM, Matthew Brost wrote:
> On Thu, May 08, 2025 at 04:03:56PM -0700, John Harrison wrote:
>> On 5/8/2025 12:09 PM, Matthew Brost wrote:
>>> When an app is ctrl-c (killed) any queues running on the GPU have their
>>> preemption timeout set to the minimum value and scheduling is disabled.
>>> If the queue has something active on the GPU it is very likely for the
>>> GuC will trigger an engine reset resulting in the engine reset message
>>> being printed when this is fully expected. Do not print the engine reset
>>> message on queues which have been killed.
>>>
>>> Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4904
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index 369be36f7dc5..efff462ddd75 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -2005,8 +2005,9 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>>    	if (unlikely(!q))
>>>    		return -EPROTO;
>>> -	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
>>> -		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>>> +	if (!exec_queue_killed(q))
>>> +		xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
>>> +			   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>> Maybe make it an xe_gt_dbg in the case of a killed queue? It is still useful
>> to see such messages when triaging CI failures to get an idea of what is
>> going on behind the scenes.
>>
> I had thought about this, should be fine as long as this isn't spamming
> normal production kernels dmesg. I would assume xe_gt_dbg would not show
> up. I did the same thing for job timeout message in this patch - just
> dropped it on killed queues maybe I should be xe_gt_dbg message there
> too?
Yeah, for CI runs it is helpful to see when and why things are being 
killed. Especially when tracking down issues with context clean up and such!

And yeah, debug level does not show up by default. CI explicitly bumps 
the default log level to make it show up. And that brings on way more 
output from the display side than the i915 or Xe drivers ever produce!

John.

>
> Matt
>
>> John.
>>
>>>    	trace_xe_exec_queue_reset(q);

