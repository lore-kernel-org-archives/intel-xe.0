Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2844ECFD315
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 07:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC85110E108;
	Tue, 25 Nov 2025 07:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V24CVzq8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEB310E108
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 07:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764056333; x=1795592333;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VUFSOFFlt/hZy0eGTZOmxm34jrnBSNTEdKvTJ2/vpog=;
 b=V24CVzq8tpH3kK0NWi1X7AUQAQw7dFEL4zyqbnMKGR0H/OK1H89J8Tqs
 dEqKfAvL5Qkwo8bauq8N51GZuvO5oN7GqQa/Dk6Ls3PpN6DORAsxjk2rl
 VR738/KXPmTHrfhSP6tCYlu5ZWZ1e5Wvont3/Ji4qG4CIWIAu567o4T0F
 WutxmV6wajrvjjR6ECCinvdjoG58Y0Bm7Ba7ZlhlfPBuXk53MD0pc/a5D
 0BH4ADAWkFQ2nQvOQMDGlw09cBp/8td+SKZm9VNC8W0g+yfSl5MjmIwiC
 +C6e70h84nCV+y8XIE/2LoQmtLmXAeRhddstfwYKQ/9v0PXpObL7CcynZ w==;
X-CSE-ConnectionGUID: uy7r63mNROWsA21993dh9A==
X-CSE-MsgGUID: hLa8pmP2Qqip7ky5lNdRng==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66111772"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="66111772"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 23:38:52 -0800
X-CSE-ConnectionGUID: V1xuz5Z1RVaYv0yIov4Ydw==
X-CSE-MsgGUID: FVE6QvYFSMmaJQpVrEtfgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="192370731"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 23:38:54 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 23:38:53 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 23:38:53 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 23:38:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXGoaGRK5QJXWZQzryL//UhdB1Hsm6TFtntJdWHoVBA/VNWumA9kICWSucUa/A7QdD18peortajvcq1oIJLWNZYhNwyzK47qChQIxNLxOkrjJP9XdonPpMxz7NA6Ih5yPOhj1nPLXtN8l8IDPVRLM/MWzaqzOWzwnFiVZNMarqcf/XhAtudvT0bmJJNqqM/KxwIGqE6TeNNKfDmmdkt7Rydks85ZJVqnJczXJbsjoAYljCq84MtLJV/kIpG5+G6xNVXjz0BiNuC/HZpqFuCDcjVC5a7GqxJdB7xzaoVmemDY28RUS6LaIzM9Ck+wA6PpnnXjsGJA73MS1rkUIPRcBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjRfKn76UpcxOyTBBEfZswCGU9dF49C9q8AENscoovM=;
 b=exU9n7i/mmpIGW1YSX8WIjU1HxRWPQeYfk9hg1eFSiQz7VPQcDVEsE2N6PjYxdCzldJ/xHSTAe/T4A5ytf8ovgUXprQG1yQ+nN3dxnt+mdMajMq3LJuq/paV0iW4FL8yq8d9CNiOOsyMPghV+M+5JTBSgTysFz9Mo7WOzqsj6jnCCa2C25whzysmihD30PW0a1z2zQJfbhUFq/9QdU2ZPyR4Xd/MSoRxpV5kwC2sRDk47dAYz8BgO8ol3DBYhcMGAgiRzUByu5xPzWoahH81COGIuOyki7s+soqZgAkaHCBYUpFlh0GY++KudHHpREx0SqWBJr3O41QaEiD8ATlwjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH3PR11MB8316.namprd11.prod.outlook.com (2603:10b6:610:17b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 07:38:52 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 07:38:52 +0000
Date: Tue, 25 Nov 2025 08:38:49 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Lukasz Laguna <lukasz.laguna@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 2/4] drm/xe/pf: Configure LMTT in MERT
Message-ID: <20251125073849.54curdukmvx2sezk@intel.com>
References: <20251124190237.20503-1-lukasz.laguna@intel.com>
 <20251124190237.20503-3-lukasz.laguna@intel.com>
 <87bjkrutlv.wl-ashutosh.dixit@intel.com>
 <87a50but8w.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a50but8w.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: DUZPR01CA0246.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH3PR11MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: e5611290-a8c6-472f-090d-08de2bf5adee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3QwN1hTL1JKaDZPY1dITlhIaS9RVEtDRy9oTWJxcTBKMEp4cVhPNVdRSWlu?=
 =?utf-8?B?QTVrNnZZOGZER3VvTmkrUXVQMjlNcFpIV0NjZm5aOExkNVRpNlhLZEFQMGdn?=
 =?utf-8?B?ci8wY0ZvMnV1TFdHM3JSUDVOcDFxaEhMVzNjTGpuKy9SWVFHaEZ1N09wT1dW?=
 =?utf-8?B?QjVaQm51dnFtTjRKcGQ3aEM1VnAwUmVXMWFTZWtENmxhM1FndlhFT2hRNWxC?=
 =?utf-8?B?YTNZWkQwY1EyL3Q4YjFYQ3pkSTNjWTlraVNoU2FOM0xia29MN25jWjE4VkFv?=
 =?utf-8?B?aW45QXpSa012VEpDYWhPSkVFWnJ4b1VWWkI5VlNyUHRqK21yWjlJdDkxaTZR?=
 =?utf-8?B?eXR2L2YrOVRnTFNMMXR2b2Z0cXh1dDdSYVlITjU0MkVvRlUyTy9ncVFkdnY1?=
 =?utf-8?B?WUNUMUpaMFNabXFLL3p3ZlRnb1ZuVXR6TTY3RERuM3RYT2tETjEvbjFiY1Rh?=
 =?utf-8?B?V0RoT1YzMHFXQTZFbnZQRDU3VDNuVVl0TTUxblVweFNOaTNpajhMUEFCYUdp?=
 =?utf-8?B?NDcrQTVuYmk0ZjlMSmtNSGx2QlNTYlFKWWVuVVU5U3d1VVZSWHhxZUpXRlI5?=
 =?utf-8?B?UjFPN3ZNNWNQNExKNU9xVGpDLzBiMTVEM0JFd3RmZmRvUHoxVjY4dFgzWHRL?=
 =?utf-8?B?Nml0SmtnUmdNM2VRM2NHc1FLWEloNFNONSs2N3hJb2tESVZYZFNidGRNMzBa?=
 =?utf-8?B?cVBIOHdLKzdSYjdwRURRUURIMzJzU2V3TndCZ2R3NVdMUTN6dlZubGJCTG9F?=
 =?utf-8?B?MkQxNnlrcENRWE84UlpwQ0ZidzEzZ0Y0QTlGaXphQ3JMZGc5NlM3eXorT1dZ?=
 =?utf-8?B?eXpMbTJvazM5WXNoM0FnenNBRWdJWFBTM2FhUEhCaExXS0hZUzlBa1EwNTNO?=
 =?utf-8?B?VmxGV041eWJHNGp5cjJwWnJLRlQ3Z0xDbFFuT3psSDBpTTZ2TE1wL1I4eTJu?=
 =?utf-8?B?TC9ZTE0wbUtmNFRQWGpoVnBMK2g4c0dzdDZVOEt1VWxQdkMrMTQzaEhGV3Jv?=
 =?utf-8?B?K29wVit5Z0FXSHEwbkRMamU1QzExN0lKQ3Z2TVRacXN5VjVacU9od2tvbnBD?=
 =?utf-8?B?bG56bFVEeW82SHIxd0VTdTdtZTNLcDNPakZBVnRGVGZ3akJPRlVlQS9WaS8r?=
 =?utf-8?B?akJ0dXhrSUFZK0l6OEJNWUpOZU1Nc3hBSjlEbUJrMWxaSkRZWUxGcFI5Z2th?=
 =?utf-8?B?Q2dDcktmdnpUSGJTV2QrZ21iVTgwQjhWcGJrOHhuNWZIeWZsSFlXQlllNWVs?=
 =?utf-8?B?ajJNWTloeVBPQ1h0L3dSZlNGY0ZKMWFYQzMxMW5UTklWKzdha0t4VU11OWFh?=
 =?utf-8?B?WU1hYno2S0JGUGN0eGRQRTNobmlVaFBDemw2Nll1MENYNnNqeUhaTXQ5a0VG?=
 =?utf-8?B?SitrcWU4bDE4anZ5emY5eGRuaUFzME9qeTM1UCtiTWo0T1BscnVPRXNScjVF?=
 =?utf-8?B?TE9aUm9JS2VZSi9aYTZwUGF6NEFucElDZnFqOUhQSjNnTERNeWdWT1hybUFX?=
 =?utf-8?B?Sk51YkpQYlYwUE1VV2k1TXNFNEl4MEtxdlMxVmE0cjFsZ3dHNVYzWUdHTC9r?=
 =?utf-8?B?aGw1NFM4M0RqdW5ENktWTDA1MjBKeU1yUTZDNGtSMTVsUGo2ZFhuTGZSUUZE?=
 =?utf-8?B?RS9RaGdCTlhUQ2tveUo4Ulg5VWUrRW9TL2Rub3BpWUtjVTRnaTBhWERDQ0Jq?=
 =?utf-8?B?QWhISzMxdnhZbTFhczlabGdPUU9qUGVMZm45Y1g4MmJ6bnVpVTFQcVlTOW1y?=
 =?utf-8?B?MXBEM1pXZGdTRVFFa05iWGtaeFRWVGU2SDlkUS9ySDh5NkxFVTJjdWhFMVBX?=
 =?utf-8?B?MS9MYUd1VTVmck8zQjFEeHhGN3NsQk1BdnR2NGFqMjVPdGI5NE9Pc2FLQ2JS?=
 =?utf-8?B?TmJ0VkRucmlNZVJqMTgwTWhHc3AybkhnNGRKNERZdGFOeUIyOHU2UkVRaCtZ?=
 =?utf-8?Q?WCRdutuixCoG6J4lKjvBNozU2I0Kltsf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUtnZ0prNkZKaGFLNldDYmk2YlBjdkJpY1JGamdWa1FZQjRKM1daTGpTbTdk?=
 =?utf-8?B?YjJEc3RteHZPY0dXVnRrYlFCdHgzTHZpT0FrZWJwSmkwd0lqeGdVcHVKZDZD?=
 =?utf-8?B?UDJ6enowN3FRUDQwMWlkMzJRMFhYeGNBSmlxM2NKNThibGFWcjVhb3RSOXI2?=
 =?utf-8?B?YWZZdERRMFErOVRhcVhERGFpUjZwYU1DZkhWWGVKUU1jVHIyZkJhbUg0U3BE?=
 =?utf-8?B?RUdudmQ5YWxya2dNOGZQODhHUlptV3picDc4MEU1bE9ZZFkwZ2xsNXBNc2tL?=
 =?utf-8?B?dXJNcXduc0JwZGJrNFRINGg0Y3hhYW5BVVhZZTVJdkhNOXNtRnhJMUMrOWJt?=
 =?utf-8?B?a040S3BzR0JJeEJOMzZJWm13SC9hd09LZ0s1cGFiaUNxS3p4WTdFdU1RbHNG?=
 =?utf-8?B?VWdBY2JDQ1EwS0pDditmajhsM2g2aURoNCtHZmxrNTkrQk01RnJlRmJmTnhl?=
 =?utf-8?B?aXVONU9SdG1raWxhSE5FOFNPU0F3QVRVTi9YSVhVSnQ5aElmWHFWWlAzU05B?=
 =?utf-8?B?V3IvY2pJS0tkZFhNREZSdTR4UTZjQUdPNHZXVEZOQzlEejE3T3ZRY20zVURy?=
 =?utf-8?B?TlZJaUg4cGN3VnZNTlpxTXh2eGpCc09WWUQ3YmpkeTJzUXN6OVpEMGZRdzZu?=
 =?utf-8?B?QkpmS1lKQldEU3JqWnFaUTFLamdhNVhGSk13UGl5U0o4TlBwakR3UitUZ2Rq?=
 =?utf-8?B?Q3p0VVRhSGtlUnZaK0xuRjBBVE16UW9PQXVXSnpZem01RzhGR2Z0MHZOYXk5?=
 =?utf-8?B?clVZWWlsdDZFRDJUbXRFNHFRQ29UZmg5ZzFOdHBLK3FQajRNQSttL1FOYVgw?=
 =?utf-8?B?Mmx1VE0zQlJWVEFFMi9DcmpGZzNyZ3ZRcitLYnhjbHhyNWRvQ2NaZWtPaHVv?=
 =?utf-8?B?L29CNzFOQXQzNCs0L2JlUmFCVzhiSTRrZ3FpTmVOblJ0Rk1XSHpTb2c2dXBu?=
 =?utf-8?B?a0RSdGQ4YlF5OExnTEVDVmsrV01VK1RyazVxK1ZVREx4SktPWkFlNEdoN0JI?=
 =?utf-8?B?THhmakNsc2pCS0ZqcVZUbmxYSlo3UXdpOFQxbDg5eEloYU0zaDdTU20welVx?=
 =?utf-8?B?cmtPaDNHMXl1bDVaRTBxZFp4UXZqeVlQamg5YnYxN1FFdUFUcjkxYnB6V0Vn?=
 =?utf-8?B?Y0QvNGVRTXhiOXdralVqZmRpbnhMT0Z5UWR4YWpwNTJYWS8xVDh4MGZFUjNo?=
 =?utf-8?B?dWJkMnNUY3d3RXlRUzVUMkN5Q1VLdnZINWRkejM1RUhXYVBBQ2Rza3EzTysy?=
 =?utf-8?B?QmVmT0xXLzRiZ1NlUjZKUC9jZjZ6a2RvZi9KdzIwK2R5VUp4VDZreG9jSTlE?=
 =?utf-8?B?RllpenRsR1ZXMm5tNFowTnFJeUNCd1RhL0VNNnlZLy80VmxSZVNpcWFFdzdQ?=
 =?utf-8?B?RSszNE5wdmJWdHpBYzMrTkxBVVQ5ZmYvTXdKMFoxT05aMFNqRjc1T0huT1Zn?=
 =?utf-8?B?TEpnemNBN2Z6M0NPTks3SHVGaC9MWjJmSkFBR3FXKzBxRmpjeldHVVBHb3VL?=
 =?utf-8?B?a1A1TFZQZHhob3RJR3U2cEdkUmlKbmh0M0MzRlI3NWIreTQwTzZUdzdHazBi?=
 =?utf-8?B?TDkwZHoyN2M5RVBhaGZuUTh2bXdadi9PUWhJK1VFTERVOWZWb0R2YkhjVXpk?=
 =?utf-8?B?V1o4Uy9GOGJCUDhMT3c5V3pXK1pucHlOT21pL25LbWdmUmFuRDhqaWZXSTF1?=
 =?utf-8?B?T3cyWkVCbUpFZGg1TmVvYXJ6azhEZlVNSlZwVTlKakM2WlRqV1VpR0ZzRVM3?=
 =?utf-8?B?bWlJWGJ4b1d0WlYrU0dhZVNNa0VVU2c2VEQ0RUR3dVoyak9SakxRaXZqT2Iw?=
 =?utf-8?B?bCtTN1BLQXhic0xPNml6Mno2NnhqNFh5NmoybXQ4T1NGU0JTSGxZNWIydEVY?=
 =?utf-8?B?UVkyS1pKbk5UYWN0Zk44SGNmbUZNb0NPYm9ZQTYzVmorR0RMSEswQlZEdDZu?=
 =?utf-8?B?Ry8zajdFc3p1ZGhJV05xK1FLZ0U4VitiQUhMWlBmZzlKZDVidmhwL3FwNDNE?=
 =?utf-8?B?aklEK1VTODFhRCt5WTgyenhSeEd5VThUVnBqUjdUYld2N25HaFVObCtaNk41?=
 =?utf-8?B?bmlVeGtaUG9FZEk0d0hhZ0tMaTNyY2k5WThTVWJuekNHU1VHMGd5UmU3bGty?=
 =?utf-8?B?d2hycWdybkZCa1hoV2F2Z25NSjRkM1g1anRrZ2NYZkxpejIzdERBQ1JtbFVX?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5611290-a8c6-472f-090d-08de2bf5adee
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 07:38:51.9974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZZkypQJ2bdi2afPNtTMmAbY4S3aPgrULW0ft3QKzVs9nKsZSarBxDtrr9rRAOeqz/zfrSOF8IrpVZVQTSLykrQqZ8bclB6RC/mXr6dk0Pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8316
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

Dixit, Ashutosh <ashutosh.dixit@intel.com> wrote on pon [2025-lis-24 11:26:39 -0800]:
> On Mon, 24 Nov 2025 11:18:52 -0800, Dixit, Ashutosh wrote:
> >
> > On Mon, 24 Nov 2025 11:02:35 -0800, Lukasz Laguna wrote:
> > >
> > > On platforms with standalone MERT, the PF driver needs to program LMTT
> > > in MERT's LMEM_CFG register.
> > >
> > > Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> > > Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> >
> > Not sure if it matters but there's something wrong with the character
> > encoding here, the name should display as Piotr Piórkowski.
> 
> Looks like my mailer has actually fixed the character encoding, but you can
> see the distortion in the original email in plain text. Even the copyright
> character in the file headers is wrong. Maybe it's ok, not sure. I don't
> believe it's something at my end. Thanks.

On Patchwork and in my email client, it looks fine.
I think everything is OK with the encoding of these patches.

Thanks,
Piotr


-- 
