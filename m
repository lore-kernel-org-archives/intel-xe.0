Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3D5CCD185
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 19:12:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E03A10EC7C;
	Fri, 10 Oct 2025 19:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YirXj6Fa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D353810EC7C
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 19:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760123531; x=1791659531;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9VP8+hlqkV5VX79L+Qms/qvjzgeQNCMuN5dS5yxysQU=;
 b=YirXj6FarjAVukzKlXv3gpOVQriZ7FQmtTGdu+uhNywJLHLE8d2twdGU
 HBinvJ72J8+kdjMXXTf+WaIfdGfiQqZU2rkT6Bmryh+8p/JJlv5L8n/R7
 BDREFuQKC4TEYci0z+i4OsRwhVRqTggsFT4s9L9j3Sx7+0ZivlKRW5duf
 ZpRXkD8GX8yv/E7Q8868diROt0ZH6DbzakdBfNK2XOQkpcLXLnDih9qYt
 M3qCzBo81RW75lKkybjcgSLX5zmLz/v20J7n1kcL0u3mlgrV6aLpIzWim
 jL3/uq9EWFbIt77LWFC1Vcwv8VLncLNMEtOSDgWHM8mte9ypM81f+TR4A w==;
X-CSE-ConnectionGUID: +0ydmxK/Tb6Vw3bQTIpD6g==
X-CSE-MsgGUID: 4a2IIwoRQKWcWVAtPuknrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="64969456"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="64969456"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 12:12:11 -0700
X-CSE-ConnectionGUID: ueChs5w8RweDr80hXEJ/Bw==
X-CSE-MsgGUID: NJP4HThkSyS3I1c0pWQ6cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="181059909"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 12:12:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 12:12:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 12:12:10 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 12:12:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQETjrCdxaDRW4tcaCZSNeolO6SnfYoOTOO2l+RTyF7xy1xEGFS9BRFVHdjzCoxeGMyoHPDQhB79hJEbqw1jB0qXpuucCKC+wOC5qu3UEM6LilqSogsfZdKxO7/MyWd+lPyfDwetcPX1x/RqQRtURX4jowKhlfdi00110kYj3QkUyy6+1Y24k6DR+XDhjrYULAY4X99Cc37/aMCS/NUT077AxNbq4QiOhjUO3B6reOSYhUEiiW2HuOwQ58jG2auLxcitMNk2VWB+v7sCqxXPtdoaQjw1PpasSQ2xfXMiiaYexf3r795RJt1dtxoIinzfA0gBvpsKTlK9fb3zuzDw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iI82Gp3c3UJFIaj9SioLHws/TFFXhWCPsT26LNYbnAk=;
 b=uBULuYyIDDFj9xUN+rarhZEQa/DDQ3UsAAsrpfkRHrF/2bDvf6ULjiwfQcrjVu9eCC5yaQmrHJ64XV1vTDY2ANrMu7PKe1qF7w8gUsekbldp6612dQKZ4P482LGTkqD65TylX76/ECuS216fypEKY/89o71FqRMeGUr06TB0qiNF2hj26sv9Cdx/0YdHMhX5wHed0NnGjt++lIDeEb+mPBOAFCCLc/CYqkQp9rC5Vh5NYTCC9igY6PKc+ybrniqHtNqjM7+0xjZyOweogWBBdEVEcmmTvVDebnhmdaflFXCq0cKMbAOMpgylmlWrLCAtXAEuGNff9W9Lxg4spwhDdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB8785.namprd11.prod.outlook.com (2603:10b6:208:599::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 19:12:08 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 19:12:08 +0000
Date: Fri, 10 Oct 2025 15:12:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLktVbml0OiBmYWlsdXI=?= =?utf-8?Q?e?= for
 drm/xe/migrate: Atomicize CCS copy command setup (rev3)
Message-ID: <aOlahHOm8-AnfVZ-@intel.com>
References: <20250929164507.2593639-1-satyanarayana.k.v.p@intel.com>
 <175916468885.375867.10792067763635597485@1538d3639d33>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175916468885.375867.10792067763635597485@1538d3639d33>
X-ClientProxiedBy: BYAPR08CA0065.namprd08.prod.outlook.com
 (2603:10b6:a03:117::42) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB8785:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c20dcc-278d-41b2-1205-08de0830e814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjZWaE5XTUdnNGs1NGwvU3FFbmNGbXhvOWhnWDRmV3J6Ui9JaHFMa3pPZmx0?=
 =?utf-8?B?YTlEMFpSelJjb3I3K1AvY2NtQnk4TU4vaWRVLzNxNFJBbUtINTlyNzRNblIx?=
 =?utf-8?B?TlVKaEpHWDRaWFBYSjA3aDJrM1M4cDFjRFJBRlRmc0dxcUxpY0tkaUt3RTU1?=
 =?utf-8?B?WjFJbDJvVUlqMVczV2R6S0VKZ1V0dkFtc25EZmRnM0xydkV5QldLc3J3elNY?=
 =?utf-8?B?VWRTZTYyR1hPWkpJVm5BazdWSS9EeXEyMlY5cTdnMnlmNXBNNlR2cTh4cWdD?=
 =?utf-8?B?Mzd3QjVyalFmV1AwdkV5WWQxRzRnK20xU09ZQmRkYUtHZm0vVnVoVk5lUCt6?=
 =?utf-8?B?YUhyYmUvNGUzczFpVnFvdWIwYXVkWndOWnlLRTlMTzdyMmtuWkZ5M1hESENt?=
 =?utf-8?B?b0ttNkluaUpOQjd0MUJYQkVSbEx5R3ZIbDl4VlZpVGFGeFVuT3pYQ3ZuSWVT?=
 =?utf-8?B?M1dOSndKWkt2Y2h6L2NxR280YkFtTmF2aTJob0xqMWQ1SDBFQkxpajlDRkZz?=
 =?utf-8?B?V1NpcGthbmtOZmFjZm9qRWlvV3VQYTU0enFrMXNCaHU3Y0pOS2RJdDgxQXdH?=
 =?utf-8?B?NWZlMXlpaEs2QzFEcmo1SUVBTnF1dmYxUSt2Z3hlM1VzQW9kc2VlQmMyTGdl?=
 =?utf-8?B?UWt2UEpQVU1HS2pGRHZGZVhQb1N0QmZiN1VUQnhVQm1oUy8zOG5MVjdtcCs4?=
 =?utf-8?B?RGJtTVhGODU3UFFsRzVGeHl2MDNKV216d1VUYWxTMWRXdTEzSitzbThiVEdo?=
 =?utf-8?B?UndJbnVacVNIWnVDMGZZRGZ5SHBPVVk2R3JrY3lhS29HYWRUaGlQcWtrNStT?=
 =?utf-8?B?bnBTeWpZNktaR2hJSDRmRnI3TUxHZ01yYStLRUNVMGY3YVE1ZjJGNTNud0lN?=
 =?utf-8?B?U3Rmd1NoY1FsRlE5ZWthM1FuT0ZUK1BBMUsreThldmFLeWVOSTFUUWRvWStU?=
 =?utf-8?B?VVI4ZGxOMUN1RkhwdHRsY2ZKcDhhcWpNcVQvT3MzcFkyY2I4ejd0R2o0Sm9m?=
 =?utf-8?B?QUxLMkFqTHhCSDNMMHdzZDc4aE0zbzdiMmRaTzVma2hzdytUbDQrZTJSQXQz?=
 =?utf-8?B?bzc0K3dxbTVDT3ZGbEFEaWFreS9CMXI3NThRZUdTbUh4d05INlJsQWJxYXdZ?=
 =?utf-8?B?bUlHR2hsUldsdlVyYy9jTFFYYUd2djdqOTM0eGJtN2x4WDBUUGFpTjNURkFj?=
 =?utf-8?B?bXhtdGVzaVJIQWhWdVQxN1ZGcGxpZUQ4WEJ4L3czVHVFZ0ZJL1QwYXlBNGZa?=
 =?utf-8?B?bXRxZk83cUpDTnJKWnN6Zzd4dHppeWpDeEJxRkpraWtWTlc4K1VvTDNUSEt2?=
 =?utf-8?B?YkZaQ3JEOGd1b3ZLNVlNQ3hBSld2ODNVdDl4WkpwaWp0dGNabldrS2JOSlEw?=
 =?utf-8?B?bmtjUk9HRGhpRlJpdTdpWUlNdFhnRDd4RzRMVCtpZzRUZ0txK3BSaGNYMVoz?=
 =?utf-8?B?VERveFRJU0RJYkhVbmVLbDhkRHlVWmRrYVpQYTVJQjhSVnVLQXlGTG44Mkkz?=
 =?utf-8?B?RlNCcHdrRGE4NkdCUzBieVF1dUlxdGt2Z3VlWmpSMGtMSmJnUE45T1l4SmNM?=
 =?utf-8?B?R0VvZmF3YlptclhMUE9VN1Q1S2xkMTFnM1JXUGVhRXk3ekxXRDI2SkxVc1di?=
 =?utf-8?B?K2txenRjSTVpUWZlMzR6ZFZMWjl2aW9vWHZ5UXNYSk9lNVJrVjNJVm9pYVMw?=
 =?utf-8?B?RFY5QTlCR0FZWUFrdVhLRGpYeXhpYTdXc2xvTnNMTzNzV3lQTDllK3QyUHNQ?=
 =?utf-8?B?VkdGY3F2YnRERXBqc2h6WjdYUHV6V2tVWXJRRVlwM0lmREN4TWxoTFlPdTlD?=
 =?utf-8?B?QjBSbTZ2ODhZd0VDMGZic1gzVE9GWXVPdVZjTHVMS0xkalF3SUNHWWlKTlZp?=
 =?utf-8?B?UDdwUnFMOC92V1Rra1lnaGRzSThXM2tNUHRibWM4T3V5TkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0pUeGdTZVhLU3lTdXY5djliUjNEcVdXYnFiUklIMXNKcjc4N2dGSkgvQURI?=
 =?utf-8?B?YVY3c0xSeEpXTGh2NWlrNUlLOER0U0VGNG45S0ZYV2gvdXU0eEpoVVdwYnky?=
 =?utf-8?B?T1hDOExKaXp2L2hLQThUVGw1Y25pU3QzN3c2anhhaTdxLzJWdGRXZnNlTi9G?=
 =?utf-8?B?cHd6Z2RBbE5EdnNEZ2swVFFmaXRVRE53eVVjZGdsclYwN2pQNjRuT2xsWVBR?=
 =?utf-8?B?Q1dNM295b2J5NSt2c1JJa3NqL0FhWmpGMmxtOFNiVE9xQzdwUkd2VW15UnpS?=
 =?utf-8?B?Nmpuek9FUWlmRkFnK2doc3JSZmhyNTZQRnovZGxuK0JWOFMvUnRPdHlHL3NV?=
 =?utf-8?B?R0E4am0wYUkxd2dKcXNiS0JzTHdXQkl0RFYvVExvUWlBM2Z0NnlvVWk5VEd3?=
 =?utf-8?B?OVFGQmhxTEZ4REVUeEtJY2tTbFRTS0M2MGllWjVzTmdlMVpGQ1RQVzFCMlZl?=
 =?utf-8?B?dThqR3JVNHJQNzNsN0J3eXN6L2puZVdvcHVsVFNNU3gvdlNrVmhpMUpmMGZI?=
 =?utf-8?B?RWlBaHQ2TnR1b1RhWXpkajRaUkp3VnIyYVlIK2JXYkZWZW03a1ZRWHlNU0lQ?=
 =?utf-8?B?SmpRTkpqbGFZY3ZyUzhvNmRHVHpyR05tSU9hKzE2eERwa2pXSlczVHJBbmg1?=
 =?utf-8?B?d2tBbjZTT2hVNU5OMm42MFNsZ01vVkY3Mjd4cmIxdVhybFRWVkdvclF1QUtv?=
 =?utf-8?B?SW9uVnhCaFQ5aVpjR2VYNzgyaHk4QTVka1A2UnIxMDhNbVlXa0R6RTkrTnRj?=
 =?utf-8?B?VnprdEZFL05ncEVqZlg4VkFoSkk1M2NEVGJvZXNnbldKWlYzdHdVYzBGRlIx?=
 =?utf-8?B?aGk1ZjREUXY0Y0Vtc3l6QmVDUXlqQmpidUM2bm1KT0N6UXZ3L21QMDd2c3hW?=
 =?utf-8?B?RzJ5SERYc2xscUVwTXB0bTZ2U2VaR0ltbmxZQXBmSStKcFlTT005cjlFSWZE?=
 =?utf-8?B?b3dOM21mUFVJeHZFMGp4NWFOcno3WXVnVVJKRjZMUGs5SlpXaHk1TUN3UGRv?=
 =?utf-8?B?cWVzem9NUXArNEFWQmtDdEdlNWJRZ3BheXErQTdhdmtnUmkrenF0cklEWlVU?=
 =?utf-8?B?dGx3bS9wYld1MGZLTU9vQVcvQ0xuK3dMOE43N2kzT3ZmaFh0aksrb3FyTXdK?=
 =?utf-8?B?My9aYXo0ZzZod0UwM3dHVFJ0aERwVHhHREZPNUFxOGFOT0pUVmVzTXI1aWpn?=
 =?utf-8?B?WkRIN1UvZUhqOEFEalFKcW9od3diZEVlVkpmTEEzQVlBYXUvZ1hSU2w3akdM?=
 =?utf-8?B?cE4ya3hXUm1UY1VtczNOWTNPdHdwemFoSmRlb3cxYms1ZTdKbTAvOFpiMlpP?=
 =?utf-8?B?b3ZBN2JSM3MvVVBUbnpFVkJJbGhvdk5lVkRGZnFjbWFKZmZMKzVzNTRMQUhK?=
 =?utf-8?B?UWdXSGZLd1E5eHhGeWdtVWVPY0l2L09oSnBteEI0MEU3V1djalhlRllkS2c1?=
 =?utf-8?B?WFJPVlFsSS9UbDMvTm9JK0poQ3hJbGZKbkc0T0hZVXY4VjEzL3UzdVlPbXpn?=
 =?utf-8?B?ejdMa1loUDNDRkpud0g1NDBzcS9FTG9zRzBBcTJ6bUl5a2RPY2JKOERDdk9k?=
 =?utf-8?B?QmJwYmVYN1crZm44MHU0V0pSaGlEc25pemUySzNXVG03YUZpbnJtbjR4ZDAz?=
 =?utf-8?B?SUdUbENCUDExVmk0RnZnRk9UdWpQTThBaGVzdDFDZnlFd1JsTXFucnhwNEtt?=
 =?utf-8?B?SWFoYmwzL1lMNWRadUN0RU9ZdXdYOEo2OUlNVCthRFpIUEZNT0lhOEZMRmFh?=
 =?utf-8?B?ZmY5QXBLd2dKVnJDN0prZ1c5Wkl1cHgydDE4U3lyU2JJQWl2YW8wc1NkOElP?=
 =?utf-8?B?KzNZYU1BZml1cW1JdU1Obkt5akphRklUMXFlMGYwaEJNM3ZxVW9tRzJhdVh3?=
 =?utf-8?B?MVcwMXA3d2tIcFNLaTRIKzVqcjZuSCthT29OeFN3NlFaMThFN3U5QkEvaXR2?=
 =?utf-8?B?QksrMG5oandheFFWVnhHNFNTRlozSEdIM1I1NGVGNEREa2JZTjVPVGxLYmJm?=
 =?utf-8?B?cnp5QnhBUWFzWkphS0NuZWFhaE9KdmUwM1Q4SS90RFNGNGJwRHU1QWljUnV6?=
 =?utf-8?B?WVpXMmFaVVFMMXZsTDY1WkZxL0xWbkJsUnpXcGREb0VBRWJ3QlkreDFrajlo?=
 =?utf-8?B?eittZFFZbzk2TVMrR25Ub0dUaHEweW5ld1Q0TU9PSE5SdkdOMEdHTVcvNzBp?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c20dcc-278d-41b2-1205-08de0830e814
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 19:12:08.0701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SO2T5eSPXpIpkfPGy9bsUOMtvZJjbqvvPNLGhufXhuHySDZxOl9hpTWkioXAbPzsrDMTFazC+k5nEkuf1rDxhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8785
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

On Mon, Sep 29, 2025 at 04:51:28PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/migrate: Atomicize CCS copy command setup (rev3)
> URL   : https://patchwork.freedesktop.org/series/155096/
> State : failure
> 
> == Summary ==
> 
> + trap cleanup EXIT
> + /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
> ERROR:root:../drivers/gpu/drm/xe/xe_migrate.c: In function ‘xe_migrate_memcpy_atomic’:
> ../drivers/gpu/drm/xe/xe_migrate.c:677:42: error: implicit declaration of function ‘static_cpu_has’; did you mean ‘static_key_false’? [-Werror=implicit-function-declaration]
>   677 |         if (IS_SRIOV_VF(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX)) {
>       |                                          ^~~~~~~~~~~~~~
>       |                                          static_key_false
> cc1: some warnings being treated as errors

please ensure this is passing....

> make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/xe/xe_migrate.o] Error 1
> make[7]: *** Waiting for unfinished jobs....
> make[6]: *** [../scripts/Makefile.build:556: drivers/gpu/drm/xe] Error 2
> make[5]: *** [../scripts/Makefile.build:556: drivers/gpu/drm] Error 2
> make[4]: *** [../scripts/Makefile.build:556: drivers/gpu] Error 2
> make[3]: *** [../scripts/Makefile.build:556: drivers] Error 2
> make[2]: *** [/kernel/Makefile:2011: .] Error 2
> make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> [16:50:55] Configuring KUnit Kernel ...
> Generating .config ...
> Populating config with:
> $ make ARCH=um O=.kunit olddefconfig
> [16:50:59] Building KUnit Kernel ...
> Populating config with:
> $ make ARCH=um O=.kunit olddefconfig
> Building with:
> $ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
> + cleanup
> ++ stat -c %u:%g /kernel
> + chown -R 1003:1003 /kernel
> 
> 
