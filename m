Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A18D68BD0
	for <intel-xe@archiver.kernel.org>; Sat, 16 Nov 2024 02:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7198210E056;
	Sat, 16 Nov 2024 02:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="js5OdZSc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9033F10E056
 for <Intel-Xe@lists.freedesktop.org>; Sat, 16 Nov 2024 02:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731723375; x=1763259375;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=b/anz99hezdtEVkgOcj6h4idsQuTDiv+hHAvuoOVeSw=;
 b=js5OdZScix+WjuM5ryy+uTFYcFQvGDjuC6hxjqAel6ETNCDz53G7cYRn
 U5eWRrWFzaTmJLHC03xvAonHN6uRck+0yqDtO3Ax1H6WZ0RoVj5RMgh1R
 mMp7GUKM1191FiKodJLwlDGjjgmb4J9jG55QffVH427L6sdmtsGKElEKP
 VTgKulBBgnTEYhV3Xz+d4YAGjFte4x9eEhum9kzEe7XcnSt9F1DXKXlp4
 pmXophOcUQKDP7bHfpkmiJQ5M7WSt19nf6WdOj1aygmwulXFbbC9A4wP2
 HB1SN18fwTQ2k6xmwfV7uy61uGRGWZ+Tgl0U9+VgSezZ/AkI7VCJrvD8W Q==;
X-CSE-ConnectionGUID: 7vgYJc0sQNGT5TwJ/1xMiA==
X-CSE-MsgGUID: 6lju6EjaT9WJzcVF9IsDpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="49177959"
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; d="scan'208";a="49177959"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 18:16:15 -0800
X-CSE-ConnectionGUID: 2dL4GzV0Sc6TOD+5mLxNxQ==
X-CSE-MsgGUID: BxHoVbzQTYCB1chjfn3TFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; d="scan'208";a="93814692"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 18:16:14 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 18:16:13 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 18:16:13 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 18:16:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0xGEHXS2UAzTL+iM41uufcNucedlADXudE6f2K22Sm7WwAt891v3YNrl53ffoAUMq/IkLMEnIr7W+anTNbnncWokBZ3VndpZW4U8XtGJtJ7PG3RoIbySa0DCiemxeYRVPXqIGnb6J1y2C/GKstu56dpdojo/jLVvYM580hshA+OOo7Pg3whRENDLV4zTD632Tng5tHvgypD4e4ARzWKSCaI0PgG/16mDRob+qEpB6EpCz4Tl5gCIc7xRE3K9ZVNDIwXs+ydtNYwwWozwzZyu6Qj0SnAHC51Gnga44XG0tgZR2byU8QHeiRTBEXixda14YtjY/dIvfzc0/6feOHRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cAXVkjiTIMT0Bem7Ty6YgFMAWIEW9tnllNkI/l7Qt0=;
 b=eEVsGROUgqbGmYyi61IHIJGDDaTnxrPKZyJnxeH8/7HHCU5RD5hQSXc0PpbIZ2jkD1WCzUaMLf3bXL+ullcGzrFSyZg3kr0NbZlsX2/1hadexIcNsFaAuFR9/wm1fGE7qRG3/6Qj9/dkHCztZepW0fVeCQhH0hr2XDJQBaSUu7YH2zaZevJef4W5L9So+qiCkWWxrq4H/34ln10eykzuEnTtI0cnDPcN0kr9gNf43HL7V/fgOMT14mjDEl7HURSbZcvcuGnqFDPW65hi5S4ctzFp3TQi4MByq1vfHNHj61S8vsJhdM7B/gSPCITceXdaZp8jDNE8/4t2MjUoTanwDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SN7PR11MB8109.namprd11.prod.outlook.com (2603:10b6:806:2e0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Sat, 16 Nov
 2024 02:16:09 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.017; Sat, 16 Nov 2024
 02:16:09 +0000
Message-ID: <be422e54-dac9-4890-bee5-fed54f090b76@intel.com>
Date: Fri, 15 Nov 2024 18:16:06 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for G2G communications
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <Intel-Xe@Lists.FreeDesktop.Org>
References: <20241108202216.2020164-1-John.C.Harrison@Intel.com>
 <20241108202216.2020164-3-John.C.Harrison@Intel.com>
 <df4db3df-2a2e-49de-905f-a1c51793b8b9@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <df4db3df-2a2e-49de-905f-a1c51793b8b9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0292.namprd04.prod.outlook.com
 (2603:10b6:303:89::27) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SN7PR11MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: d5cf8849-f81f-43e9-4fa3-08dd05e4a24c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFlCV05GeUNUQUFoZUJ3Q2tpczEwazNNakJnNEVycDFvQ3FVZDBVVmZNSzdw?=
 =?utf-8?B?KzVKUVYrTVRhNWpxWnpmc0pyQzdLQjFiTjM0eGpEancvYWlrWmJPa1A2VlZ2?=
 =?utf-8?B?eko5R2dVVFdmQkZtTGpNNlVMa29taEVjTThueUkyYWlnc1ZsRFplVkhoR0NQ?=
 =?utf-8?B?aVdiZDBYSHl6YXpreHVVL0pJQ1d6VytaZzhVSXJ4VDJNZVlkZ1NTTU02dFJt?=
 =?utf-8?B?S0orM01kSERrbWJHNUwrQzVCa2V3Q3F3RUxFK1lGam9WOHYyaFNnMU9xOW1q?=
 =?utf-8?B?WGpWMDdmcytOMUtOeVZoM3hoVXFOaElaaUQ0UG9sRkhvQmdkdDNlOXlrVEZF?=
 =?utf-8?B?bEt6M0h1cWg3RGpxNGJDYjFYaFhvSStmRWh3ZnVUWDR0ZndPYzFJNXZQZXF4?=
 =?utf-8?B?UEVNdDF5SEZZaVRwVXU1OUpidXBwSnZhaTlRTXFhcVN4WnNYSjhuSEFGYlhC?=
 =?utf-8?B?VW1qL3JyUEJwUU5kSml2bURndW9zY251aVc1a2RoTUZVeEMwd0kxVkh1TzE1?=
 =?utf-8?B?aXk4eXVpdCtTaGcwcXhObG1ubUlnMWducEdIM0pYRnI0ZVZaejc3NHJVQkxi?=
 =?utf-8?B?anJTcGxMNWhESG9TemlmQUpFRlVnTmlzZEZIWWRweGlocndnS2R2eW5ocUt2?=
 =?utf-8?B?UjZ6UFJobWF6RENFTDNnYlNOL0dCR1YwQVluMzdvU0l3M2hyZlAvOXo4NHQy?=
 =?utf-8?B?emtQeG4vMXBHU2F1VEU0R3BGcU0yR0t4RmYyYnhabWVwcDVRTGVsMHlBTmNT?=
 =?utf-8?B?aDZGUDI0bEVqajFiUmtiVmtmencxNEdOa204b096TWY2U0wraVNaWE13cG16?=
 =?utf-8?B?SUFRT3V3dlp3a3dRTmxsdnBQU3NXVVlFeGxrajJSVWpLTlk4SzZnczNlTUVT?=
 =?utf-8?B?NnVwY2JqbWE3b0N0Q1dmbTgvYVczbmIzb2R2bCs4clZKZDEwd2d3UXFKcUlX?=
 =?utf-8?B?NkFzdmxHN1VkQzYxN0Q5TVlQY3hoMndMODNZcHk0aHJiUjk5d1E4UVVrTmlo?=
 =?utf-8?B?VGFrU2FzQUU0OExhQXdwMXJDSFZTTXhmeXVQRmlnM0ZXUUJUeG9FVUpVVzlY?=
 =?utf-8?B?VU5sOVJaZ0tId0R0alZRZXRoVXVjTktXOFowNy81Rys0Z0dVZUcyRXk3QzAv?=
 =?utf-8?B?TVoyOXo3UUZkZjRLOVlFekxHdGY3SE5rL1JpTG0xaXJqTmNlSUNkMUpDSzd2?=
 =?utf-8?B?bkRoK256NGdjMU11SVBJMlVqVzlOTlVLUWt6Wk8yaFR6SVo3K1E2RVVIL09i?=
 =?utf-8?B?QWcwVlZIKzFBeVJKaExJbnd1U3VxbjhhdXpyb08wYVkybFYvc2JvY0VhRk8y?=
 =?utf-8?B?SmE1U1ByUG1jNVdGUWFLVjdLbEwvb0xESnM2Tit2UWVzWWZOSCtuSVZFeE53?=
 =?utf-8?B?dEFCRTFEbXFMbEFBOWZTUEM2amd0K21UcTdncjEveGp3Tm9xUVZ5dkwzeW9z?=
 =?utf-8?B?V0FZb0x6R2pkTXhRaDNqWTZPNHFtamp6SGdWT2NseStyOHFvTlZoK3QvNU04?=
 =?utf-8?B?bEh2eDRIVUc5TldvMTVqYjRxTWNHNjlqQzBDWDBWVU9STUdwTk1wWlFod0tD?=
 =?utf-8?B?N21PcWhrQlFFL2o5YVZzWEFDZzlFc0J2R2tlamw3OXdRSGpJUE42S05zV0NF?=
 =?utf-8?B?a1dWVDRyaFJsS1plL0FGV0NqK0hPc3NWRi94OElHRFB5MlRuZUVMemNSS1ZX?=
 =?utf-8?B?cC9yVnc2eWJ1OEZJMXhsN2xOb0NiOTR0SWlWK0dXMklHMkdaSHduTU02cWlt?=
 =?utf-8?Q?dYdVzk5bHO9AKlTFVgxDF7X6mQR3UYavy0PO3qD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eExHTzV1SThPQ3FDQThFSE9SMlNHOTRDVlV3Ukt3dVJ3blRnZlNMc0hGanFF?=
 =?utf-8?B?ZVBQbENzc0J2alMzRTJhN0p6ZlNVcllSSHZ1MlQ0NUlCUXNoanJhUGU0aXpM?=
 =?utf-8?B?eU1IMEpnR1JsUHQyRkdFa2VyemJHNGNOUFgrS1VtVnVxNXBtOElvUFpJQ25D?=
 =?utf-8?B?Q0dSL05QTGxoazVOOERsaUVCVUh2NzFVdHZGcFJEemFxcXA4Mm16RVJPeHU2?=
 =?utf-8?B?ejNhMkhHeE9GK0lreXBSa3hYRENEK3dIZytscTBad2VkZjYwaVlJazFIV0lD?=
 =?utf-8?B?dmJCdGM2Qk1FS1F2bTM0bFRUME8rQUhwOEk3SXJZUGk4eTBjYzRqRUZVY29y?=
 =?utf-8?B?OEpGMnRYeTRPMFhsRVE5bGZjejRUOEl6WExmTXNGVmxadElLV2dxTXpDY1Zk?=
 =?utf-8?B?TkkwTXlqY2lYcVpyL3pmc0NDWU9yQzZNb3BxVDlva3owcUZBNmxIdFg5YkRS?=
 =?utf-8?B?VWlHVVdRRHk4ZlRZeVBGU0pDZHh0Zlo3aW5QSEQwQjFqRnpBMHJOVEZGcjJr?=
 =?utf-8?B?MFVZYm01dEZ6VW5lY0FwT2REWTJ5T2dNQnNVRmhVdFZBWC8yZmROb0R6aVFV?=
 =?utf-8?B?cmpaRHMwbjd3ZU1JWXhOMitFWXduc2YvczlreVRJdDZNRDdHcE14eWZaSS9O?=
 =?utf-8?B?Z28wMHZpWThoMnY2clZxZVpic2pHRTFpZmZhR3F6UEJSRzU0UmpMSkdsTVRZ?=
 =?utf-8?B?ZzJBV1pFZHBJNnJ4Skh3UHRPTm16ZW9OMnZMakVIQ0VjZmw4bXJRUlZGWHVN?=
 =?utf-8?B?RTErLzh1RDNLL25oSlVjN01STCt3WmZ4MVMyKzdMSEZXV2w3RDBMZ0xTdC9u?=
 =?utf-8?B?QWh1eVRpcHg3OEJEWmxESDY5NGVQbGh4YWtySk9zTzhsUEJEYTFoNkE2dndJ?=
 =?utf-8?B?TmtubER5N2JYY3J2blFMMTRZMFREb2JiVE4vSXZ4QkE0aDhKMkFJZ3o1a1Ry?=
 =?utf-8?B?US81SUlFbjQzT3NIQTNEeE54dVJCNjU1YlU3UGhHSnpzRDAxeEdqK3pwYzht?=
 =?utf-8?B?aEN4anFEZG81OE4xa20zT05RK05oUTZNTHMraU1PRlRPaDM0Sm1vbS94bnJS?=
 =?utf-8?B?aEN6YXpnaGYwQzZ0OFJJTzljR2dXM2w1NkJ5Z043aHNJWUVhbUFLV0VYVUdr?=
 =?utf-8?B?SFJ6eEttOWN1UHJ2bU94UVVlb1hiOEdZTmFSVFlwYUFzS1c3Ny9jSUJVL1FU?=
 =?utf-8?B?Y0JKM0RDTi8wMDNvTXpqbUI0RzJrdjBwMExMK0pVVG5uSWVkb2Vjd1o5T3ZY?=
 =?utf-8?B?c0JyMS9RcWlCM0NWbzN2a0xvUVJHT2RxUUdHU3pkdW94a1E2V2dZaG9jS2RP?=
 =?utf-8?B?WCsxbzZaUlliOVh0TXpKOTVmYzRKVmpHUGpxZUw0QjMyWld5WEswVUpacjh1?=
 =?utf-8?B?R3R3bitNWE1haXdMSVBCSDJzNFJsSWZpUHZaV2FKdWIxVlpsQjYvSyszdDlW?=
 =?utf-8?B?YklqUWp0a2piOUhsSkF6bFBXMU9ySkRtd3k1dzFhTVJqY0JaZDNZQSt1b21y?=
 =?utf-8?B?QTE2WUttV29kQk4yamc3dWF2MnEyWWVLLytZTnlXUDlGNVl3MUtRdDd0emdw?=
 =?utf-8?B?UWFTNVlKWnBTcG9odnVqMFRURFNUcjFrS1pkRU9sRldDK2pLSVQwc3BaTTRV?=
 =?utf-8?B?anZudkJpSXlsM01FRUwxRjNpTFFOSjdPLzdPVVJFYm1lblVNUFZiME9UZW1H?=
 =?utf-8?B?WGdTV1lVekhwSjliUmdEeHhoN0E0SUtQVE90aXpzNzVycnB6c0JWcEhMNUJ2?=
 =?utf-8?B?VTVTS2dyUXhyZ0ovNm40b1dPcXhQek8vL2hubzlIV2FkVVVVS05vYWUvQnQ3?=
 =?utf-8?B?TDZiVVdWUFdWRlE5UTRjUThrUUloaTAzeXI2d3NoUnpMOXJaejNaSkdoVkg2?=
 =?utf-8?B?MjJrdk1yS1lxZ2ZsT3doSTNwd0pqcFFXRzREcUhkL0tVdHAvU1YvLzM0ckJj?=
 =?utf-8?B?bUdnOWd6OGJHMnQwOGxzL0pYV1p1TWZYMzJsVzgwZGoyZG4xOXRPc0k4a2hJ?=
 =?utf-8?B?QUZ2NVJERXBobzJUSGt2SkFscmxIejlEMkp1emw0SDl5NWY1OWRRdFRUY2hp?=
 =?utf-8?B?QmxTS25lVDBHaDcvZHQxQW0waGlVaytRUUJJempnNU5WUVFUNzR5ajRuQVhS?=
 =?utf-8?B?cUxkWXNZcUtpZHhDNjM3QjRSL1BLaWNEMmhJMXVIb2x5MXRiNlM0S1kwWGNO?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5cf8849-f81f-43e9-4fa3-08dd05e4a24c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2024 02:16:09.2651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRY9+vBv0qi190Ze9FBk0qL5GC5uqE+NM/mPtkm9gQ0zU37MVyC/9fYRuEioLLQg9vFSXVCp4+rFp3k8cSjrysktN1HAuk0A7TLoa+aKNPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8109
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

On 11/15/2024 13:22, Daniele Ceraolo Spurio wrote:
> On 11/8/2024 12:22 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Some features require inter-GuC communication channels on multi-tile
>> devices. So allocate and enable such.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |  20 ++
>>   drivers/gpu/drm/xe/xe_guc.c              | 276 ++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_guc_types.h        |  10 +
>>   3 files changed, 305 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h 
>> b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> index b54fe40fc5a9..fee385532fb0 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> @@ -134,6 +134,8 @@ enum xe_guc_action {
>>       XE_GUC_ACTION_DEREGISTER_CONTEXT = 0x4503,
>>       XE_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
>>       XE_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER = 0x4506,
>> +    XE_GUC_ACTION_REGISTER_G2G = 0x4507,
>> +    XE_GUC_ACTION_DEREGISTER_G2G = 0x4508,
>>       XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
>>       XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>>       XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>> @@ -218,4 +220,22 @@ enum xe_guc_tlb_inval_mode {
>>       XE_GUC_TLB_INVAL_MODE_LITE = 0x1,
>>   };
>>   +/*
>> + * GuC to GuC communication (de-)registration fields:
>> + */
>> +enum xe_guc_g2g_type {
>> +    XE_G2G_TYPE_IN = 0x0,
>> +    XE_G2G_TYPE_OUT,
>> +    XE_G2G_TYPE_LIMIT,
>> +};
>> +
>> +#define XE_G2G_REGISTER_DEVICE    REG_GENMASK(16, 16)
>
> I'd call this DEVICE_ID like in the GuC specs, or GT_ID if you want a 
> shorter define. Just DEVICE sounds like it's going to a different card 
> instead of a different GuC device. Not a blocker.
Not seeing how device id is any different to just device in that 
respect. It is clearly a index or id of some sort given that it is an 
integer. And I would prefer to use the API's naming rather than calling 
it a GT id. That could be confused with gt->id, which it really isn't!

>
>> +#define XE_G2G_REGISTER_TILE REG_GENMASK(15, 12)
>> +#define XE_G2G_REGISTER_TYPE    REG_GENMASK(11, 8)
>> +#define XE_G2G_REGISTER_SIZE    REG_GENMASK(7, 0)
>> +
>> +#define XE_G2G_DEREGISTER_DEVICE    REG_GENMASK(16, 16)
>> +#define XE_G2G_DEREGISTER_TILE    REG_GENMASK(15, 12)
>> +#define XE_G2G_DEREGISTER_TYPE    REG_GENMASK(11, 8)
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 1cbad8a91798..899094423291 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -44,7 +44,15 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>>                   struct xe_bo *bo)
>>   {
>>       struct xe_device *xe = guc_to_xe(guc);
>> -    u32 addr = xe_bo_ggtt_addr(bo);
>> +    u32 addr;
>> +
>> +    /*
>> +     * For most BOs, the address on the allocating tile is fine. 
>> However for
>> +     * some, e.g. G2G CTB, the address on a specific tile is 
>> required as it
>> +     * might be different for each tile. So, just always ask for the 
>> address
>> +     * on the target GuC.
>> +     */
>> +    addr = __xe_bo_ggtt_addr(bo, gt_to_tile(guc_to_gt(guc))->id);
>>         /* GuC addresses above GUC_GGTT_TOP don't map through the GTT */
>>       xe_assert(xe, addr >= xe_wopcm_size(guc_to_xe(guc)));
>> @@ -244,6 +252,263 @@ static void guc_write_params(struct xe_guc *guc)
>>           xe_mmio_write32(&gt->mmio, SOFT_SCRATCH(1 + i), 
>> guc->params[i]);
>>   }
>>   +static int guc_action_register_g2g_buffer(struct xe_guc *guc, u32 
>> type, u32 dst_tile, u32 dst_dev,
>> +                      u32 desc_addr, u32 buff_addr, u32 size)
>> +{
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    u32 action[] = {
>> +        XE_GUC_ACTION_REGISTER_G2G,
>> +        FIELD_PREP(XE_G2G_REGISTER_SIZE, size / SZ_4K - 1) |
>
> This needs a comment somewhere to explain that the GuC expects the 
> number of pages minus 1, because otherwise that -1 is confusing.
Really? A lot of size fields are specified as being +1 given that 
providing a size of zero generally makes no sense.

>
>> +        FIELD_PREP(XE_G2G_REGISTER_TYPE, type) |
>> +        FIELD_PREP(XE_G2G_REGISTER_TILE, dst_tile) |
>> +        FIELD_PREP(XE_G2G_REGISTER_DEVICE, dst_dev),
>> +        desc_addr,
>> +        buff_addr,
>> +    };
>> +
>> +    xe_assert(xe, (type == XE_G2G_TYPE_IN) || (type == 
>> XE_G2G_TYPE_OUT));
>> +    xe_assert(xe, !(size % SZ_4K));
>
> Is it worth having asserts for max size (1MB) and for dst_dev (0 or 1)?
The FIELD_PREP macro should take care of out-of-range values.

>
>> +
>> +    return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>> +}
>> +
>> +static int guc_action_deregister_g2g_buffer(struct xe_guc *guc, u32 
>> type, u32 dst_tile, u32 dst_dev)
>> +{
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    u32 action[] = {
>> +        XE_GUC_ACTION_DEREGISTER_G2G,
>> +        FIELD_PREP(XE_G2G_DEREGISTER_TYPE, type) |
>> +        FIELD_PREP(XE_G2G_DEREGISTER_TILE, dst_tile) |
>> +        FIELD_PREP(XE_G2G_DEREGISTER_DEVICE, dst_dev),
>> +    };
>> +
>> +    xe_assert(xe, (type == XE_G2G_TYPE_IN) || (type == 
>> XE_G2G_TYPE_OUT));
>> +
>> +    return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>> +}
>> +
>> +#define G2G_DEV(gt)    (((gt)->info.type == XE_GT_TYPE_MAIN) ? 0 : 1)
>> +
>> +#define G2G_BUFFER_SIZE (SZ_4K)
>> +#define G2G_DESC_SIZE (64)
>> +#define G2G_DESC_AREA_SIZE (SZ_4K)
>> +
>> +/*
>> + * Generate a unique id for each bi-directional CTB for each pair of
>> + * near and far tiles/devices. The id can then be used as an index into
>> + * a single allocation that is sub-divided into multiple CTBs.
>> + *
>> + * For example, with two devices per tile and two tiles, the table 
>> should
>> + * look like:
>> + *           Far <tile>.<dev>
>> + *         0.0   0.1   1.0   1.1
>> + * N 0.0  --/-- 00/01 02/03 04/05
>> + * e 0.1  01/00 --/-- 06/07 08/09
>> + * a 1.0  03/02 07/06 --/-- 10/11
>> + * r 1.1  05/04 09/08 11/10 --/--
>> + *
>> + * Where each entry is Rx/Tx channel id.
>> + *
>> + * So GuC #3 (tile 1, dev 1) talking to GuC #2 (tile 1, dev 0) would
>> + * be reading from channel #11 and writing to channel #10. Whereas,
>> + * GuC #2 talking to GuC #3 would be read on #10 and write to #11.
>> + */
>> +static unsigned int g2g_slot(u32 near_tile, u32 near_dev, u32 
>> far_tile, u32 far_dev,
>> +                 u32 type, u32 max_inst, bool have_dev)
>> +{
>> +    u32 near = near_tile, far = far_tile;
>> +    u32 idx = 0;
>> +    int i;
>> +
>> +    if (have_dev) {
>> +        near = (near << 1) | near_dev;
>> +        far = (far << 1) | far_dev;
>> +    }
>> +
>> +    if (far > near) {
>> +        for (i = near; i > 0; i--)
>> +            idx += max_inst - i;
>
> The loop can be replaced by a single line with:
>
> idx += near * (2 * max_inst  - near - 1) / 2
>
> But the loop is probably easier to understand.
> (I've spent way too much time trying to find a better formula with 
> little luck :P)
>
>> +        idx += (far - 1 - near);
>> +        idx *= 2;
>> +        idx += type;
>> +        return idx;
>> +    }
>
> This needs some comments, because otherwise it's very hard to parse. 
> Maybe stick with to the table example? something like
>
> /* Count all BO pairs from the rows above the one where the pair we 
> want is */
> for (i = near; i > 0; i--)
>         idx += max_inst - i;
>
> /* Count all BO pairs on the same row and to the left of the pair we 
> want */
> idx += (far - 1 - near);
>
> /* Switch from BO pairs to individual BOs */
> idx *= 2;
>
> /* Select which of the 2 BOs in the pair we want */
> idx += type;
>     return idx;
>
> Same thing for the other one, just swap rows with columns and left 
> with above.
>
> I'm also ok with a different comments as along as there are some.
Only if you provide a comment to explain your anti-loop version first...

Not sure calling it 'BO pairs' is valid. The point is to divide a single 
BO into multiple slots. So 'slot pairs'  or 'slot rx/tx pairs' even 
seems more accurate.

>
>> +
>> +    if (far < near) {
>> +        for (i = far; i > 0; i--)
>> +            idx += max_inst - i;
>> +        idx += (near - 1 - far);
>> +        idx *= 2;
>> +        idx += (1 - type);
>> +        return idx;
>> +    }
>> +
>> +    return -1;
>> +}
>> +
>> +static int guc_g2g_register(struct xe_guc *near_guc, struct xe_gt 
>> *far_gt, u32 type, bool have_dev)
>
> you don't really need the have_dev passed in from outside, you can 
> just check for tile->media_gt being not null.
Passing it in means having a single point of calculation rather than 
evaluating it multiple times. And I prefer the gt count > tile count 
version just in case we one day have a platform where one tile has twin 
GTs and another does not or something else weird.

>
>> +{
>> +    struct xe_gt *near_gt = guc_to_gt(near_guc);
>> +    struct xe_device *xe = gt_to_xe(near_gt);
>> +    struct xe_bo *g2g_bo;
>> +    u32 near_tile = gt_to_tile(near_gt)->id;
>> +    u32 near_dev = G2G_DEV(near_gt);
>> +    u32 far_tile = gt_to_tile(far_gt)->id;
>> +    u32 far_dev = G2G_DEV(far_gt);
>> +    u32 max = xe->info.gt_count;
>> +    u32 base, desc, buf;
>> +    int slot;
>> +
>> +    xe_assert(xe, xe == gt_to_xe(far_gt));
>> +
>> +    g2g_bo = near_guc->g2g.bo;
>> +    xe_assert(xe, g2g_bo);
>> +
>> +    slot = g2g_slot(near_tile, near_dev, far_tile, far_dev, type, 
>> max, have_dev);
>> +    xe_assert(xe, slot >= 0);
>> +
>> +    base = guc_bo_ggtt_addr(near_guc, g2g_bo);
>> +    desc = base + slot * G2G_DESC_SIZE;
>> +    buf = base + slot * G2G_BUFFER_SIZE + G2G_DESC_AREA_SIZE;
>
> nit: I'd reorder this to have G2G_DESC_AREA_SIZE before the slot, so 
> it's in order to how the memory is actually filled.
>
>> +
>> +    xe_assert(xe, (desc - base + G2G_DESC_SIZE) <= G2G_DESC_AREA_SIZE);
>
> nit: We should be able to assert this only once at alloc time (see 
> below).
It's not just about ensuring the channel count does not overflow but 
that the calculations above are correct (including that slot does not 
exceed num_channels.

>
>> +    xe_assert(xe, (buf - base + G2G_BUFFER_SIZE) <= g2g_bo->size);
>> +
>> +    return guc_action_register_g2g_buffer(near_guc, type, far_tile, 
>> far_dev,
>> +                          desc, buf, G2G_BUFFER_SIZE);
>> +}
>> +
>> +static void guc_g2g_deregister(struct xe_guc *guc, u32 far_tile, u32 
>> far_dev, u32 type)
>> +{
>> +    guc_action_deregister_g2g_buffer(guc, type, far_tile, far_dev);
>> +}
>> +
>> +static u32 guc_g2g_size(struct xe_guc *guc)
>> +{
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    unsigned int count = xe->info.gt_count;
>> +    u32 num_channels = (count * (count - 1)) / 2;
>> +
>> +    return num_channels * XE_G2G_TYPE_LIMIT * G2G_BUFFER_SIZE + 
>> G2G_DESC_AREA_SIZE;
>
> Here we can assert:
> num_channels * XE_G2G_TYPE_LIMIT * G2G_DESC_SIZE <= G2G_DESC_AREA_SIZE
>
> to cover all the descriptors in one go
>
>> +}
>> +
>> +static bool xe_guc_g2g_wanted(struct xe_device *xe)
>> +{
>> +    /* Can't do GuC to GuC communication if there is only one GuC */
>> +    if (xe->info.gt_count <= 1)
>> +        return false;
>> +
>> +    /* No current user */
>> +    return false;
>> +}
>> +
>> +static int guc_g2g_alloc(struct xe_guc *guc)
>> +{
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    struct xe_tile *tile = gt_to_tile(gt);
>> +    struct xe_bo *bo;
>> +    u32 g2g_size;
>> +
>> +    if (guc->g2g.bo)
>> +        return 0;
>> +
>> +    if (gt->info.id != 0) {
>> +        struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
>> +        struct xe_guc *root_guc = &root_gt->uc.guc;
>> +        struct xe_bo *bo;
>> +
>> +        bo = xe_bo_get(root_guc->g2g.bo);
>> +        if (IS_ERR(bo))
>> +            return PTR_ERR(bo);
>> +
>> +        guc->g2g.bo = bo;
>> +        guc->g2g.owned = false;
>
> It doesn't look like you're actually using the "owned" variable (which 
> makes sense, because the BO is refcounted so it doesn't matter which 
> GuC it was originally allocated for)
Yeah, owned is only there for the selftest that comes later. But not 
including it now means the g2g structure only has a single entry, so 
really should not be a structure. Which suddenly makes the deltas for 
adding in owned later significantly larger!

Having said that, as Matthew pointed out, the code is currently leaking 
reference counts as they are not auto-cleaned. So it does actually need 
a fini function which will use the owned field to decide whether to call 
put or not.

John.


>
> Daniele
>
>> +        return 0;
>> +    }
>> +
>> +    g2g_size = guc_g2g_size(guc);
>> +    bo = xe_managed_bo_create_pin_map(xe, tile, g2g_size,
>> +                      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> +                      XE_BO_FLAG_GGTT |
>> +                      XE_BO_FLAG_GGTT_ALL |
>> +                      XE_BO_FLAG_GGTT_INVALIDATE);
>> +    if (IS_ERR(bo))
>> +        return PTR_ERR(bo);
>> +
>> +    xe_map_memset(xe, &bo->vmap, 0, 0, g2g_size);
>> +    guc->g2g.bo = bo;
>> +    guc->g2g.owned = true;
>> +
>> +    return 0;
>> +}
>> +
>> +static int guc_g2g_start(struct xe_guc *guc)
>> +{
>> +    struct xe_gt *far_gt, *gt = guc_to_gt(guc);
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    unsigned int i, j;
>> +    int t, err;
>> +    bool have_dev;
>> +
>> +    if (!guc->g2g.bo) {
>> +        int ret;
>> +
>> +        ret = guc_g2g_alloc(guc);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +
>> +    /* GuC interface will need extending if more GT device types are 
>> ever created. */
>> +    xe_gt_assert(gt, (gt->info.type == XE_GT_TYPE_MAIN) || 
>> (gt->info.type == XE_GT_TYPE_MEDIA));
>> +
>> +    /* Channel numbering depends on whether there are multiple GTs 
>> per tile */
>> +    have_dev = xe->info.gt_count > xe->info.tile_count;
>> +
>> +    for_each_gt(far_gt, xe, i) {
>> +        u32 far_tile, far_dev;
>> +
>> +        if (far_gt->info.id == gt->info.id)
>> +            continue;
>> +
>> +        far_tile = gt_to_tile(far_gt)->id;
>> +        far_dev = G2G_DEV(far_gt);
>> +
>> +        for (t = 0; t < XE_G2G_TYPE_LIMIT; t++) {
>> +            err = guc_g2g_register(guc, far_gt, t, have_dev);
>> +            if (err) {
>> +                while (--t >= 0)
>> +                    guc_g2g_deregister(guc, far_tile, far_dev, t);
>> +                goto err_deregister;
>> +            }
>> +        }
>> +    }
>> +
>> +    return 0;
>> +
>> +err_deregister:
>> +    for_each_gt(far_gt, xe, j) {
>> +        u32 tile, dev;
>> +
>> +        if (far_gt->info.id == gt->info.id)
>> +            continue;
>> +
>> +        if (j >= i)
>> +            break;
>> +
>> +        tile = gt_to_tile(far_gt)->id;
>> +        dev = G2G_DEV(far_gt);
>> +
>> +        for (t = 0; t < XE_G2G_TYPE_LIMIT; t++)
>> +            guc_g2g_deregister(guc, tile, dev, t);
>> +    }
>> +
>> +    return err;
>> +}
>> +
>>   static void guc_fini_hw(void *arg)
>>   {
>>       struct xe_guc *guc = arg;
>> @@ -423,7 +688,16 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>     int xe_guc_post_load_init(struct xe_guc *guc)
>>   {
>> +    int ret;
>> +
>>       xe_guc_ads_populate_post_load(&guc->ads);
>> +
>> +    if (xe_guc_g2g_wanted(guc_to_xe(guc))) {
>> +        ret = guc_g2g_start(guc);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +
>>       guc->submission_state.enabled = true;
>>         return 0;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h 
>> b/drivers/gpu/drm/xe/xe_guc_types.h
>> index fa75f57bf5da..83a41ebcdc91 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>> @@ -64,6 +64,15 @@ struct xe_guc {
>>       struct xe_guc_pc pc;
>>       /** @dbm: GuC Doorbell Manager */
>>       struct xe_guc_db_mgr dbm;
>> +
>> +    /** @g2g: GuC to GuC communication state */
>> +    struct {
>> +        /** @g2g.bo: Storage for GuC to GuC communication channels */
>> +        struct xe_bo *bo;
>> +        /** @g2g.owned: Is the BO owned by this GT or just mapped in */
>> +        bool owned;
>> +    } g2g;
>> +
>>       /** @submission_state: GuC submission state */
>>       struct {
>>           /** @submission_state.idm: GuC context ID Manager */
>> @@ -79,6 +88,7 @@ struct xe_guc {
>>           /** @submission_state.fini_wq: submit fini wait queue */
>>           wait_queue_head_t fini_wq;
>>       } submission_state;
>> +
>>       /** @hwconfig: Hardware config state */
>>       struct {
>>           /** @hwconfig.bo: buffer object of the hardware config */
>

