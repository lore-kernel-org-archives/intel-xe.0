Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34451CCD1BB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 13:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48D510E780;
	Wed, 22 Oct 2025 13:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4IYWhOg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDEB10E780
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 13:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761139767; x=1792675767;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=xHHKEVtKNH5s2qyznjmD4WitV9mBVavOvnzL3FOPnSI=;
 b=J4IYWhOgXX9GqFKr5bZozESlU9X5iq18VE50gKZhT7AM3wofovumMP4g
 2lzJ8Lk5JrNxwgbDd+YJ/5rxN7v/SI0tca520xarh4IN06wchk8Ll9q1P
 2Xp7YfDQuy0btn6u+thqzCEg0ItksFmoWm7+XOIXZVZ+paa2uKXfaKmDO
 +NzH5Ts3Bha9YtMOzEJn9ojE8zhcJcAd/qfd74Xi4vUvsd3QjI+AGmcpe
 FAbmt3Fti4gL+ym4EhV4q4NTW/ASsMLjC/XRZqSO4zflUwkMBSqRcFwYN
 hMwLf/kO51UF4DOyZmBJclkSmkqJvsgbbRA9Lm3EhoaMmc6lzmN4Ig0YW g==;
X-CSE-ConnectionGUID: 8P8ZOGHASkWsIpHOBBIYrA==
X-CSE-MsgGUID: OLrrTRo7RTisxs4VoFAgCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67151751"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208,217";a="67151751"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 06:29:27 -0700
X-CSE-ConnectionGUID: K0qeWjgDRdStx03Wanj+lQ==
X-CSE-MsgGUID: 7bvKy4YgT+uBjrSkhpyPtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
 d="scan'208,217";a="183578476"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 06:29:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 06:29:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 06:29:26 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.38)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 06:29:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUWvVCzkCP8tGvFcM/8uscP4pQZhQcXSq3xxbmT99327d+8tf6MLbsDMns6ULrrrMv+OefN1EvSULgg0StjAWtmR/79WsG32MSATUONsvA7ntjuYEckuMgSexXkZ2GhJGMNT9aLtqsQCgl6dGf6nSGtG2ETtvhNMiHiYwTgSW3Bg60O4xAqneSZlYmETZcRhhappFysrSl2190+8x/dQpG9cNZi7Zvn3HDpfD0w0H3tWoV4ZaddwM4yWReq/drimbDuwuERYo3i4W5LqokFqooYHM7CRrtYkqbPmrNfpS0PX3iQeL689Pos96p8GuKJwl73+NXsteE60IZ5HadXZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsRrxlSAUE4hgGMN9eWYfqBl7v//3szSdTT8tbvLJNc=;
 b=tlNtBJfZdW3hLscfJFNlVhTzekgmiuCCwUPewerCbkVBRJtYdKNEcvIVZobpMj5Su65ttzxkhqizNdxpKlTVJ70/UEr3GttKnE51EjKNfNwLuwku7f4mZCTvqaAZz9klq/V23h+U8DLkAON2XXtOxq0IIs6ry2VLqCZ9Chjz7kCy9h0/0tZRrfRFc71/h8jxth4EXbef7aR16z8tHV2WPpyA+HPNKNaSiyTnS5Eq6PhwwRXyOwJ0R1qQJEBYIHaSh2sgwkmUUeu1/Arjia+gBJJrqSaMmPQ+YoWTzG/1Y5z1PXa+iQYzlzqdrklJfU/YoUKVmWPDrAZXDMFdXKqALw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.18; Wed, 22 Oct
 2025 13:29:23 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 13:29:22 +0000
Content-Type: multipart/alternative;
 boundary="------------gc0EAPo4LQDXxy4E5f7elWQ3"
Message-ID: <2cc16cb1-e7a2-48cf-b773-ad0b6939b387@intel.com>
Date: Wed, 22 Oct 2025 15:29:18 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvdmY6?=
 =?UTF-8?Q?_Minor_fixes_to_post-migration_recovery_=28rev7=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20251021224817.1593817-1-tomasz.lis@intel.com>
 <176110651153.39919.4050214744158103039@97596180aaec>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <176110651153.39919.4050214744158103039@97596180aaec>
X-ClientProxiedBy: BE1P281CA0210.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::11) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: c8fe8409-9d62-466d-5e44-08de116f0328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDFMT1dNQWZUVzVvSHo4TUVpWVhSdHcreTF2b3JKZHJuK2VpKzg0RW5BbmtD?=
 =?utf-8?B?SVplT09tcDVXQ1ZQbWs1NGwwQlFVVDIyd0wwcHd1SU5heDkxUmpFQmhuTzNu?=
 =?utf-8?B?alJ5MnNnVVhsTHBlOGZ0L3gzaGVERkIzemtVQVhpUlp0WHR2bHp3dnJiM2hh?=
 =?utf-8?B?N1dtekZmUUhTanZlL1lPRUh2bllJRXRhNTlpd3FDU1VGSDZCN1dEUXhEVDk3?=
 =?utf-8?B?UGx2Tm1PdGdUR3ZydThoM1d1dURkc3o4eVVLb0psWnc3eWRWOVVOaXA3RUFC?=
 =?utf-8?B?elFLdHJ4UWFNQVZQdG9SbFVKeWFLbWc5eWYrRnF6YnVrMEpjNS9CdFpUZXhE?=
 =?utf-8?B?K0sra1lLaXcwZURSbERxZEd5R0JJZmU5dHpRcjg3eUNOZ2J3ak1Tb2RsZGNW?=
 =?utf-8?B?WklaUnNsWUtyWGczTXpUZnQvcVRDTitab2tFR3c2V3U0MXhOTWhUM1UyVjdx?=
 =?utf-8?B?eHR2ZG9EZXp6TnBydDZxM1FNMEZra1BqNjZWQ2FWSU1CUjN2WDB0c25ZQWwv?=
 =?utf-8?B?WVh4SnN2a3RVSHVkU01EN05NODhLRHlPT2VDNnZtSkhvN1E5ajNubTlTRDdx?=
 =?utf-8?B?WGhZaE91a1VKTmwyclFhTXczQ1YrclFnZGVjb2c5L1lZYWtPb2NCaWZ4ZUFP?=
 =?utf-8?B?SjhpYklrZDlGSUljNjdLbzJEOHRscjQyQmNhTm1KYUdwbGY3S2lraTc2TVNL?=
 =?utf-8?B?dnJsV0tzODdmeHU5ZGg4NmhqUmxybG92VFVQRDJ3L2lVWVhjL3kwY2FERG1t?=
 =?utf-8?B?S0ZUTnBQOVNibHpSVUR4MSt4NzNqdGc4T0tYV3hMd2pEQXZYOFNocHNZQ1Rr?=
 =?utf-8?B?WlMwRVY1eDJLSTZIWVdxZG9WcU5RbnAvbldoUEU3YnRSakRwZlBqa1VRWVF1?=
 =?utf-8?B?NG5wZUhJODlvMUM0UU82cTRIL3lvcnc1b1gwa0lNcEJybVNiNmdBZVN5TEJh?=
 =?utf-8?B?VTFYU1pwamdWc0crT21sWFF1eUN3YTcvVk1ra3NMemlGZDdhb3BRR3M3VWNK?=
 =?utf-8?B?SWhCS2lGRnUzbmJMTkV5K2pOd0ZBb0pxZ1VTSnZMSEE1Y2RjNmxWSGRyVlBq?=
 =?utf-8?B?NkpxSU55Tkk4NmkyaE9WYVVFaVlsdFNRZHgySFF4MVVUWkxNM0FsQVMySUs5?=
 =?utf-8?B?UnY1dm53YmN3NjM1UmI3bFNJeVhsQ3dmTUhuV2kxMkhtZExJRGlDVHcxUTRj?=
 =?utf-8?B?TEovZ1V5M21nZTNSQUVhTUJRZkJ0bnJ4b2ZvRUxZUEFLclR3MUJYUFdiT1Nx?=
 =?utf-8?B?TlpvbDBEM2VJbElkd09LQ1BaZnU5S2hma0IyUDJKL3NMc2h4ZWpqdUFFMUt4?=
 =?utf-8?B?My96ak43NzRiV05YdCt0UmVMbzExaWgyR3p6U0QwRmpOTm9sMGdPaTFGaGF1?=
 =?utf-8?B?WEZ0NVZ6ZWhubytjSFNvejRSSzNROFhpREJpeFJNdklZSVJUdUs0UDJKcnlB?=
 =?utf-8?B?U2VmNUlkMENQL0twZzJtSjg0bS9TUzNvR0RJbTFkTUMrUTJFTnpBall6a2h3?=
 =?utf-8?B?eVhPUzM1dkVtLzYrZDFxaWZQd2JOcEJnMEtvNEsrNHppZVMyQ3dhZWpJNVp4?=
 =?utf-8?B?VlVkeTVvdWptb1RvQVV5L0JwN3hpN0hUeXVoaHZHM0pRUE52eXRkK2ZmYnhU?=
 =?utf-8?B?QnN4MVUwN0xZclBJMkJVa3FHMTZhNWFQL3pHeGF0c3YrU0dwbHdncEIyS2FL?=
 =?utf-8?B?bnlqd1dSeGtWUnYrME1oZDhVaGNNWGFhZHZOQjdDenhySVNURnl5WjdMWUw1?=
 =?utf-8?B?WlJCL25RMlN1NUpuTlNqdko4LzJjaDMyTTdLM0hDbmZKUkpYYXlqN2FETEUv?=
 =?utf-8?B?blQ5K2E2QkpGakN5WDRmVHdLbG9IcnI4cGROblU5NTV3OE4xdXpLTm1QYW9L?=
 =?utf-8?B?VGpmd29XQjY1bVFoUm1oSkswQStmMEU3dlBINFRwWnJaUGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czQyc3ZvWWIvQm1TZWNOTitWTG94Y0k4ZnV6YWM0RHZjQ2pubE9XcmEwbStG?=
 =?utf-8?B?Um5XczJXbXdUN1ZES1owMDlYSHBOQ3dRdGxUM1FqdkNOenV5OWVwWkwyMDFh?=
 =?utf-8?B?Q0ROVmx6MVVDbzErQkpReTQxZnB1MVJ1UzdSZXZCaDQzc1FOMzZ3Z1hPTHYx?=
 =?utf-8?B?TDlhQ2tINmdnd0wxVEhSZlRQQlJlN2tRbkpmMk4wRkV5cXRNbjFDWlRqY3Ri?=
 =?utf-8?B?bWtwK1FSb0dXMlBFVWNTOUtMa09OWU9vM0lIaE9RSnMrOC9LSVhTNzZNUGQ3?=
 =?utf-8?B?aWlZUG9OV2FyRWtUNlo5Z2ppQnY0ZHFPTW5oWDBKNXFVSmxGRmduemp0SUti?=
 =?utf-8?B?NEYzUStiQ294ZVR3enRhVWF5T2VDU2pvNWM1cXRwZ1h5Q3ppN3JCR1ZGUGlS?=
 =?utf-8?B?Vit3SHBTZmJMMVNaZnA0VFdhZE9pY25QaE1BclQwdHVNbXMxVVhNRXVETXB2?=
 =?utf-8?B?VHpGMzhBeFgwNjVyYUFoRTRibS9sdEVlT3ErVFNrWGZzUi9KdUNZZ0ZWYVdO?=
 =?utf-8?B?QWlJcGYxSXZUK2FyNHo3ajFDdC9RUitLTjZLaGw0Si9KZ2toRXEwTWhZNjdm?=
 =?utf-8?B?dWNIbnFCem5jZDFNUGpPcVUvamEyaGFWODhrREpHRXBiam9CdlJQd25WYmMx?=
 =?utf-8?B?N2pIL0dWcHRWRUgwUUZzcFVsV1RwL0hidk5KNkZBTmdMRm5zcmZ2NzdvMGdt?=
 =?utf-8?B?a0tjTW9TaUdUa0N5ZEhoMlI0Qldnakk2ODFuZERxMWIyTDFJNEZkclZuZElE?=
 =?utf-8?B?dVJFb3U5bkFaOExjMjBqOUtpL0FOU0JPRG4xTWRPcG1oWmdZUFdBYW0wVlBU?=
 =?utf-8?B?bi9TYVFpSmtkWWJqZlNVZkJlMVZWaVlVNEZ2TVBpNHhJbnlkZGJTNnpiNUww?=
 =?utf-8?B?WVNBeVFjUE5QdHU5eXlSdlVBYVg1V2ZVT1dIUURGb1M5Um1DQ2dIL2x4eWhU?=
 =?utf-8?B?a1VyZzNDTWlBbkdIY3hOR1NGSThKcExDb04zZmlGTzNuTngwdTRxWXRTQkZO?=
 =?utf-8?B?MFVaUm5KK1o3ZHYzNFhvcVpPcVJEa1lOUDcveXkvYUdhYVpUMHI2ZVRWR3Vq?=
 =?utf-8?B?UkZoUEZ3NUFvZ2RKV2dWRWJMdVZqSVNEZGhlQzBDc25tRUR5SUxESWJHOFpU?=
 =?utf-8?B?MmVCZyttZSt4VGRLSEVXSFZrYVNUNTlOb2hmVXkvdEVoUE9YeEFNU2RPbEtV?=
 =?utf-8?B?V3A3RkxoeFpFdStDV3VvVkZIYzhYTmU3NzVsZ3JTTUUyUFltNDBIMldhaEw3?=
 =?utf-8?B?K2VuRDBzSmpWVVM5ZFg0VW1BOGlZS08wK3pmRnhHZ2lQdVRTTTZpeklPTm9L?=
 =?utf-8?B?b0FYeGRjcU9hdHJIT0gvR2NYc1lKNDJQelRZNFhYZDhxQ1NvTXF6WW5ldjNK?=
 =?utf-8?B?WkYyQ1MyclZaam1mRStuclV6ekZkcnhISm92UU9kT1VOLzA0bUdITERXMXUw?=
 =?utf-8?B?aVBaVVRDSENZT3FDUHFsTG1rU0tycDcvWnFaZGQxUU9qMitsTkMrcm1zNXM4?=
 =?utf-8?B?MEtZMm9iTE84UUNZVjFBNHhmbEdRZEJhYnZuNmpVQjh0anFZaktoT2RPU3Ir?=
 =?utf-8?B?Y1JvY2lyckswM2tzNXByVHVydFBiOU1mcEVNRWh1cU1EbVovajZiWjk5OXh1?=
 =?utf-8?B?YnFLNEhHNWJ4MzBmdUVHYUFzQUFUM2dmQ3lIcUI3azJacXJIcVhFMisvUWlV?=
 =?utf-8?B?dVFxeDRxZmRWZ2QzZDlLcTFXOWsyL1M2UDdNWG5FUmJKODAvMjk5OWZibGZp?=
 =?utf-8?B?ZGU3aHFBMzVxNXZ1eTU5M25RdVR6L3NEd29Fb0hjanQxQWg3djZRSGs2Y0lw?=
 =?utf-8?B?bHIyOTBpL0lOY0dxSXhJb2FWVTlGS3RKWHZnVi9ycHBZZThwM29LR2hLL294?=
 =?utf-8?B?SENQNDZUUlo4VVBTWFM1cElkYW1NcUxkQUU1UVJZTHhhU0JsQnVwQVZualN5?=
 =?utf-8?B?eWUwSTkyS0ViVkZKTFQ5M0FKVDFnVDZJenk2QnNQaExONEs0MStEQ3lYSDQ3?=
 =?utf-8?B?d2xOcVg4S1drYnUrd2k3WndLbm13YWRNc2NZZDdLSHA4S2REVTd4YWFPSVVq?=
 =?utf-8?B?L252VDVjSVNIMVE1dzNUL2lqdWFiRTZhTVB3YndUMUFPUUx5MEVzUnBDTmJr?=
 =?utf-8?Q?FyjkGEc0yvEcd9RKprN/dzHEP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8fe8409-9d62-466d-5e44-08de116f0328
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 13:29:22.8884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/n6O0OKceL7COFALLylZFHIjsqpy8gRJFHZ8KF8rWZMT7fsOA4y34LxuNLET3adLZgP3ttVYL5yzHw1blnRmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
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

--------------gc0EAPo4LQDXxy4E5f7elWQ3
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Manual check:


igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:

The test asserted during resume. Why it was suspending/resuming - hard 
to tell, name of the test does not suggest it is PM-related, and the 
test binary does not seem to use PM controls. Maybe since previous tests 
were display-related, the card was considered unused and finally went to 
sleep.

But the test itself actually passed, only assert warning was displayed 
while resuming. Regardless, no connection to the series under test.


igt@xe_vm@munmap-style-unbind-userptr-inval-front:

Looks like previously executed KMS-family test was still cleaning up 
something while xe_vm test got executed. Maybe that test exiting with 
error was the reason for the long freeze during the following test. 
Regardless, the execution was on PF, so this has nothing to do with VF 
migration.


Also, previous revisions of the series (which had only minor changes) 
reported fails on completely different tests, none matches.

In conclusion, both fails are unrelated to the series being tested.

-Tomasz


On 10/22/2025 6:15 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe/vf: Minor fixes to post-migration recovery (rev7)
> *URL:* 	https://patchwork.freedesktop.org/series/155865/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/index.html
>
>
>   CI Bug Log - changes from
>   xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687_FULL ->
>   xe-pw-155865v7_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-155865v7_FULL absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-155865v7_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-155865v7_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-463/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-436/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html>
>  *
>
>     igt@xe_vm@munmap-style-unbind-userptr-inval-front:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html>
>
>
>         Warnings
>
>   * igt@xe_exec_reset@cm-gt-reset:
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_reset@cm-gt-reset.html>
>         (Intel XE#6325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6325>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-1/igt@xe_exec_reset@cm-gt-reset.html>
>
>
>     Known issues
>
> Here are the changes found in xe-pw-155865v7_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#623
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>)
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#4345
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345> /
>         Intel XE#6168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html>
>         (Intel XE#6168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
>  *
>
>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +27
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +7
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@gamma:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_chamelium_color@gamma.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-storm:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-storm.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2
>         other tests skip
>  *
>
>     igt@kms_content_protection@srm@pipe-a-dp-2:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@kms_content_protection@srm@pipe-a-dp-2.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +3
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         (Intel XE#1475
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>)
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>         (Intel XE#4633
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>         (Intel XE#1340
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340>)
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +5
>         other tests skip
>  *
>
>     igt@kms_flip@absolute-wf_vblank-interruptible@d-hdmi-a6:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-463/igt@kms_flip@absolute-wf_vblank-interruptible@d-hdmi-a6.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#4842
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-3/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) +6
>         other tests dmesg-warn
>  *
>
>     igt@kms_flip@flip-vs-rmfb-interruptible:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543> /
>         Intel XE#5208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +10
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312>)
>  *
>
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html>
>         (Intel XE#1158
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +8
>         other tests skip
>  *
>
>     igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html>
>         (Intel XE#5624
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624>)
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#4173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173>) +6
>         other tests dmesg-warn
>  *
>
>     igt@kms_plane_lowres@tiling-y:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@kms_plane_lowres@tiling-y.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3
>         other tests skip
>  *
>
>     igt@kms_pm_backlight@basic-brightness:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-dpms:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_psr@fbc-psr2-dpms.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +4
>         other tests skip
>  *
>
>     igt@kms_vrr@flipline:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-8/igt@kms_vrr@flipline.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-lnl-1/igt@kms_vrr@flipline.html>
>         (Intel XE#4227
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227>) +1
>         other test fail
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-off:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#2849
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0x3fff:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x3fff.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>  *
>
>     igt@xe_eu_stall@blocking-read:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_eu_stall@blocking-read.html>
>         (Intel XE#5626
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626>)
>  *
>
>     igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +4
>         other tests skip
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html>
>         (Intel XE#6321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321>)
>  *
>
>     igt@xe_exec_basic@many-null-defer-bind:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_exec_basic@many-null-defer-bind.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_exec_basic@many-null-defer-bind.html>
>         (Intel XE#3876
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876>)
>  *
>
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +8
>         other tests skip
>  *
>
>     igt@xe_exec_reset@cm-gt-reset:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_exec_reset@cm-gt-reset.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_exec_reset@cm-gt-reset.html>
>         (Intel XE#6325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6325>)
>  *
>
>     igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html>
>         -> WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html>
>         (Intel XE#5786
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786>)
>  *
>
>     igt@xe_exec_system_allocator@twice-malloc-fork-read:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_exec_system_allocator@twice-malloc-fork-read.html>
>         (Intel XE#4915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915>)
>         +115 other tests skip
>  *
>
>     igt@xe_exec_threads@threads-cm-rebind:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_exec_threads@threads-cm-rebind.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_exec_threads@threads-cm-rebind.html>
>         (Intel XE#5625
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625>) +1
>         other test fail
>  *
>
>     igt@xe_oa@privileged-forked-access-vaddr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_oa@privileged-forked-access-vaddr.html>
>         (Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +2
>         other tests skip
>  *
>
>     igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html>
>         (Intel XE#1173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>) +1
>         other test fail
>  *
>
>     igt@xe_pm@s2idle-basic:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-6/igt@xe_pm@s2idle-basic.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-8/igt@xe_pm@s2idle-basic.html>
>         (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#4173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173> /
>         Intel XE#4504
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504>)
>  *
>
>     igt@xe_pm@s2idle-exec-after:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_pm@s2idle-exec-after.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_pm@s2idle-exec-after.html>
>         (Intel XE#3876
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876>)
>  *
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>  *
>
>     igt@xe_pm_residency@gt-c6-freeze@gt0:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_pm_residency@gt-c6-freeze@gt0.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_pm_residency@gt-c6-freeze@gt0.html>
>         (Intel XE#5545
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545>) +1
>         other test dmesg-fail
>  *
>
>     igt@xe_pmu@fn-engine-activity-load:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_pmu@fn-engine-activity-load.html>
>         (Intel XE#4650
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650>)
>  *
>
>     igt@xe_query@multigpu-query-mem-usage:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_query@multigpu-query-mem-usage.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_sriov_auto_provisioning@fair-allocation:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@xe_sriov_auto_provisioning@fair-allocation.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>)
>  *
>
>     igt@xe_vm@shared-pde-page:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_vm@shared-pde-page.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_vm@shared-pde-page.html>
>         (Intel XE#3876
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876>) +1
>         other test dmesg-fail
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html>
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html>
>         (Intel XE#3862
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html>
>         +1 other test pass
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html>
>         +4 other tests pass
>  *
>
>     igt@kms_dp_link_training@non-uhbr-sst:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html>
>         (Intel XE#4354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-sst.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html>
>         +6 other tests pass
>  *
>
>     igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-466/igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-463/igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6.html>
>  *
>
>     igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html>
>         +6 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html>
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html>
>         +1 other test pass
>  *
>
>     igt@kms_hdr@invalid-metadata-sizes:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-1/igt@kms_hdr@invalid-metadata-sizes.html>
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html>
>         (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html>
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#6321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#2705
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#4212
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212> /
>         Intel XE#4345
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345> /
>         Intel XE#4522
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#4345
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345> /
>         Intel XE#6168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168>)
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_content_protection@srm.html>
>         (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@kms_content_protection@srm.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>  *
>
>     igt@kms_flip@absolute-wf_vblank-interruptible:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-466/igt@kms_flip@absolute-wf_vblank-interruptible.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-463/igt@kms_flip@absolute-wf_vblank-interruptible.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#4842
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +13 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>)
>         +12 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +13 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>)
>         +12 other tests skip
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1500
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>)
>  *
>
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>
>       o shard-adlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#4917
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917> /
>         Intel XE#5530
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#5530
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530>)
>
>
>     Build changes
>
>   * Linux: xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687 ->
>     xe-pw-155865v7
>
> IGT_8594: 8594
> xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687: 
> fb0f56ad8a2c9953c57c3337a72ccbf9c5050687
> xe-pw-155865v7: 155865v7
>
--------------gc0EAPo4LQDXxy4E5f7elWQ3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Manual check:</p>
    <p><br>
    </p>
    <p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</p>
    <p>The test asserted during resume. Why it was suspending/resuming -
      hard to tell, name of the test does not suggest it is PM-related,
      and the test binary does not seem to use PM controls. Maybe since
      previous tests were display-related, the card was considered
      unused and finally went to sleep.</p>
    <p>But the test itself actually passed, only assert warning was
      displayed while resuming. Regardless, no connection to the series
      under test.</p>
    <p><br>
    </p>
    <p>igt@xe_vm@munmap-style-unbind-userptr-inval-front:</p>
    <p>Looks like previously executed KMS-family test was still cleaning
      up something while xe_vm test got executed. Maybe that test
      exiting with error was the reason for the long freeze during the
      following test. Regardless, the execution was on PF, so this has
      nothing to do with VF migration.</p>
    <p><br>
    </p>
    <p>Also, previous revisions of the series (which had only minor
      changes) reported fails on completely different tests, none
      matches.</p>
    <p>In conclusion, both fails are unrelated to the series being
      tested.</p>
    <p>-Tomasz</p>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 10/22/2025 6:15 AM, Patchwork wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:176110651153.39919.40502147441581=
03039@97596180aaec">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe/vf: Minor fixes to post-migration recovery (rev7)</t=
d>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/155865/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/155865/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
155865v7/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetex=
t">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/index.html</a><=
/td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687_FULL -&gt;
        xe-pw-155865v7_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-155865v7_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-155865v7_FULL, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-155865v7_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</=
p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-463/ig=
t@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html" moz-do-not-=
send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-155865v7/shard-dg2-436/igt@xe_exec_threads@threads-cm-shared-v=
m-userptr-invalidate.html" moz-do-not-send=3D"true">ABORT</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_vm@munmap-style-unbind-userptr-inval-front:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_=
vm@munmap-style-unbind-userptr-inval-front.html" moz-do-not-send=3D"true">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
5865v7/shard-adlp-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html"=
 moz-do-not-send=3D"true">INCOMPLETE</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>igt@xe_exec_reset@cm-gt-reset:
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_ex=
ec_reset@cm-gt-reset.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6325" moz-do-not-send=3D"=
true">Intel XE#6325</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-155865v7/shard-bmg-1/igt@xe_exec_reset@cm-gt-reset.html" moz=
-do-not-send=3D"true">ABORT</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-155865v7_FULL that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_addfb_basic@add=
fb25-y-tiled-small-legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/623" moz-do-not-sen=
d=3D"true">Intel XE#623</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_big_fb@yf-tiled=
-32bpp-rotate-180.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"tru=
e">Intel XE#1124</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-5/igt@kms_b=
w@connected-linear-tiling-2-displays-2560x1440p.html" moz-do-not-send=3D"tr=
ue">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-155865v7/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send=3D"true">Intel XE#=
2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
894" moz-do-not-send=3D"true">Intel XE#2894</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_bw@linear-tilin=
g-2-displays-3840x2160p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=
=3D"true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp=
-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155865v7/shard-bmg-8/igt@kms_ccs@crc-primary-rotati=
on-180-4-tiled-lnl-ccs@pipe-b-dp-2.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652" moz-d=
o-not-send=3D"true">Intel XE#2652</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>)=
 +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6=
:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-436/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html" moz-do-n=
ot-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-155865v7/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-mc-ccs@pipe-b-hdmi-a-6.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-=
not-send=3D"true">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3113" moz-do-not-send=3D"true">Intel XE#3113</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345" moz-=
do-not-send=3D"true">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6168" moz-do-not-send=3D"true">Intel XE#6168</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p=
>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-464/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html" moz-do-not-s=
end=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-155865v7/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-=
rc-ccs@pipe-b-dp-4.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168" moz-do-not-se=
nd=3D"true">Intel XE#6168</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6=
:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-464/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html" moz-do-n=
ot-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-155865v7/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs@pipe-b-hdmi-a-6.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-=
not-send=3D"true">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3113" moz-do-not-send=3D"true">Intel XE#3113</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_ccs@random-ccs-=
data-yf-tiled-ccs@pipe-b-dp-4.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-=
send=3D"true">Intel XE#787</a>) +27 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_ccs@random-ccs-=
data-yf-tiled-ccs@pipe-d-dp-4.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-=
send=3D"true">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +7 oth=
er tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@gamma:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_chamelium_color=
@gamma.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send=3D"true">Intel XE#=
306</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_chamelium_hpd@h=
dmi-hpd-storm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">In=
tel XE#373</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@kms_content_protection@srm=
@pipe-a-dp-2.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send=3D"true">In=
tel XE#1178</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_cursor_crc@curs=
or-onscreen-512x512.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/308" moz-do-not-send=3D"tr=
ue">Intel XE#308</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-vary=
ing-size:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-5/igt@kms_c=
ursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html" moz-do-=
not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-155865v7/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flip=
a-atomic-transitions-varying-size.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291" moz-do=
-not-send=3D"true">Intel XE#2291</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_c=
ursor_legacy@flip-vs-cursor-atomic.html" moz-do-not-send=3D"true">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/s=
hard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html" moz-do-not-sen=
d=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1475" moz-do-not-send=3D"true">Intel XE#1475</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-8/igt@kms_c=
ursor_legacy@flip-vs-cursor-legacy.html" moz-do-not-send=3D"true">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/s=
hard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html" moz-do-not-sen=
d=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4633" moz-do-not-send=3D"true">Intel XE#4633</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-tra=
nsitions-varying-size:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_cursor_legacy@s=
hort-busy-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/323" moz-do-not-send=3D"true">Intel XE#323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-5/igt@kms_d=
ither@fb-8bpc-vs-panel-6bpc.html" moz-do-not-send=3D"true">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bm=
g-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340"=
 moz-do-not-send=3D"true">Intel XE#1340</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_f=
lip@2x-flip-vs-dpms-on-nop-interruptible.html" moz-do-not-send=3D"true">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1558=
65v7/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316" moz-do-not-send=3D"true">Intel XE#2316</a>) +5 o=
ther tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@absolute-wf_vblank-interruptible@d-hdmi-a6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-463/igt@kms_flip@absolute-w=
f_vblank-interruptible@d-hdmi-a6.html" moz-do-not-send=3D"true">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049" m=
oz-do-not-send=3D"true">Intel XE#2049</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4842" moz-do-not-send=3D"true">Intel XE#484=
2</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-3/igt@kms_f=
lip@flip-vs-expired-vblank-interruptible@c-edp1.html" moz-do-not-send=3D"tr=
ue">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-155865v7/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c=
-edp1.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send=3D"true">Intel XE#3=
01</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/314=
9" moz-do-not-send=3D"true">Intel XE#3149</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@kms=
_flip@flip-vs-expired-vblank@b-hdmi-a1.html" moz-do-not-send=3D"true">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865=
v7/shard-adlp-3/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html" moz-do-=
not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4543" moz-do-not-send=3D"true">Intel XE#4543</a>) +6 =
other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-9/igt@kms=
_flip@flip-vs-rmfb-interruptible.html" moz-do-not-send=3D"true">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/sha=
rd-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html" moz-do-not-send=3D"=
true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4543" moz-do-not-send=3D"true">Intel XE#4543</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5208" moz-do-not-send=3D"t=
rue">Intel XE#5208</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-dra=
w-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@kms_frontbuffer_tra=
cking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send=3D"t=
rue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/651" moz-do-not-send=3D"true">Intel XE#651</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-dra=
w-render:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_frontbuffer_tra=
cking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6312" moz-do-not-send=3D"true">Intel XE#6312</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_frontbuffer_tra=
cking@plane-fbc-rte.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1158" moz-do-not-send=3D"t=
rue">Intel XE#1158</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:</=
p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_frontbuffer_tra=
cking@psr-2p-scndscrn-spr-indfb-move.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-=
do-not-send=3D"true">Intel XE#653</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_pipe_stress@str=
ess-xrgb8888-yftiled.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/5624" moz-do-not-send=3D"=
true">Intel XE#5624</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-1/igt@kms=
_plane@plane-panning-bottom-right-suspend.html" moz-do-not-send=3D"true">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155=
865v7/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html" m=
oz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953" moz-do-not-send=3D"true">Intel XE#2953</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173" mo=
z-do-not-send=3D"true">Intel XE#4173</a>) +6 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-y:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@kms_plane_lowres@ti=
ling-y.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#=
455</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@basic-brightness:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@kms_pm_backlight@ba=
sic-brightness.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/870" moz-do-not-send=3D"true">I=
ntel XE#870</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</=
p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@kms_psr2_sf@fbc-psr=
2-overlay-primary-update-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz=
-do-not-send=3D"true">Intel XE#1406</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489" moz-do-not-send=3D"true">Intel XE#1489<=
/a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-dpms:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@kms_psr@fbc-psr2-dp=
ms.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#140=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850=
" moz-do-not-send=3D"true">Intel XE#2850</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send=3D"true">Intel XE#9=
29</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flipline:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-8/igt@kms_v=
rr@flipline.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-lnl-1/igt@kms_vrr@=
flipline.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4227" moz-do-not-send=3D"true">Intel =
XE#4227</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@sriov_basic@enable-=
vfs-autoprobe-off.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1091" moz-do-not-send=3D"tru=
e">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2849" moz-do-not-send=3D"true">Intel XE#2849</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_copy_basic@mem-c=
opy-linear-0x3fff.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1123" moz-do-not-send=3D"tru=
e">Intel XE#1123</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eu_stall@blocking-read:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_eu_stall@blockin=
g-read.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5626" moz-do-not-send=3D"true">Intel XE=
#5626</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:=
</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@xe_eudebug_online@w=
rites-caching-sram-bb-vram-target-vram.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" m=
oz-do-not-send=3D"true">Intel XE#4837</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-small:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-3/igt@xe_ev=
ict@evict-mixed-many-threads-small.html" moz-do-not-send=3D"true">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/s=
hard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html" moz-do-not-sen=
d=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6321" moz-do-not-send=3D"true">Intel XE#6321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@many-null-defer-bind:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_=
exec_basic@many-null-defer-bind.html" moz-do-not-send=3D"true">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shar=
d-adlp-2/igt@xe_exec_basic@many-null-defer-bind.html" moz-do-not-send=3D"tr=
ue">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3876" moz-do-not-send=3D"true">Intel XE#3876</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-pref=
etch:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_exec_fault_mode@=
twice-bindexecqueue-userptr-rebind-prefetch.html" moz-do-not-send=3D"true">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
8" moz-do-not-send=3D"true">Intel XE#288</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@cm-gt-reset:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_=
exec_reset@cm-gt-reset.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/=
igt@xe_exec_reset@cm-gt-reset.html" moz-do-not-send=3D"true">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6325" moz-do-not=
-send=3D"true">Intel XE#6325</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_ex=
ec_system_allocator@many-stride-malloc-prefetch.html" moz-do-not-send=3D"tr=
ue">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-155865v7/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-malloc-pre=
fetch.html" moz-do-not-send=3D"true">WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5786" moz-do-not-send=3D"true">Intel XE#=
5786</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@twice-malloc-fork-read:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_exec_system_allo=
cator@twice-malloc-fork-read.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915" moz-do-not-=
send=3D"true">Intel XE#4915</a>) +115 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-cm-rebind:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_=
exec_threads@threads-cm-rebind.html" moz-do-not-send=3D"true">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard=
-adlp-2/igt@xe_exec_threads@threads-cm-rebind.html" moz-do-not-send=3D"true=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5625" moz-do-not-send=3D"true">Intel XE#5625</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@privileged-forked-access-vaddr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_oa@privileged-fo=
rked-access-vaddr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3573" moz-do-not-send=3D"tru=
e">Intel XE#3573</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@xe_peer2peer@write@=
write-gpua-vram01-gpub-system-p2p.html" moz-do-not-send=3D"true">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173" moz-do=
-not-send=3D"true">Intel XE#1173</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-basic:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-6/igt@xe_=
pm@s2idle-basic.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-8/igt@xe_=
pm@s2idle-basic.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953" moz-do-not-send=3D=
"true">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4173" moz-do-not-send=3D"true">Intel XE#4173</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504" moz-do-not-se=
nd=3D"true">Intel XE#4504</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-exec-after:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_=
pm@s2idle-exec-after.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/i=
gt@xe_pm@s2idle-exec-after.html" moz-do-not-send=3D"true">TIMEOUT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876" moz-do-not=
-send=3D"true">Intel XE#3876</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@vram-d3cold-threshold:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@xe_pm@vram-d3cold-t=
hreshold.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/579" moz-do-not-send=3D"true">Intel X=
E#579</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_=
pm_residency@gt-c6-freeze@gt0.html" moz-do-not-send=3D"true">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-=
adlp-2/igt@xe_pm_residency@gt-c6-freeze@gt0.html" moz-do-not-send=3D"true">=
DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5545" moz-do-not-send=3D"true">Intel XE#5545</a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@fn-engine-activity-load:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_pmu@fn-engine-ac=
tivity-load.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4650" moz-do-not-send=3D"true">Int=
el XE#4650</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-mem-usage:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-466/igt@xe_query@multigpu-q=
uery-mem-usage.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">I=
ntel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@xe_sriov_auto_provi=
sioning@fair-allocation.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130" moz-do-not-send=
=3D"true">Intel XE#4130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_vm@shared-pde-page:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@xe_=
vm@shared-pde-page.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-2/igt@=
xe_vm@shared-pde-page.html" moz-do-not-send=3D"true">DMESG-FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876" moz-do-not-s=
end=3D"true">Intel XE#3876</a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_b=
w@connected-linear-tiling-2-displays-3840x2160p.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2314" moz-do-not-send=3D"true">Intel XE#2314</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2894" moz-do-not-send=3D"true">Int=
el XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-155865v7/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-38=
40x2160p.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4=
:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-463/ig=
t@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html" moz-do-n=
ot-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3862" moz-do-not-send=3D"true">Intel XE#3862</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard=
-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.htm=
l" moz-do-not-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_c=
ursor_legacy@cursora-vs-flipb-legacy.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291" moz=
-do-not-send=3D"true">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@kms_cursor_legacy@c=
ursora-vs-flipb-legacy.html" moz-do-not-send=3D"true">PASS</a> +4 other tes=
ts pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@non-uhbr-sst:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_d=
p_link_training@non-uhbr-sst.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354" moz-do-not-=
send=3D"true">Intel XE#4354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@kms_dp_link_training@non-uh=
br-sst.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_f=
lip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html" moz-do-not-send=3D"t=
rue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2316" moz-do-not-send=3D"true">Intel XE#2316</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-1/igt@kms_fli=
p@2x-flip-vs-dpms-off-vs-modeset-interruptible.html" moz-do-not-send=3D"tru=
e">PASS</a> +6 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-466/ig=
t@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6.html" moz-do-not-send=
=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2049" moz-do-not-send=3D"true">Intel XE#2049</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-46=
3/igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6.html" moz-do-not-=
send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-8/igt@kms=
_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html" moz-do-not-send=3D"true">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4543" moz-do-not-send=3D"true">Intel XE#4543</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-9/igt@kms_fl=
ip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html" moz-do-not-send=3D"true">PASS=
</a> +6 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-3/igt@kms_f=
lip@flip-vs-expired-vblank-interruptible@b-edp1.html" moz-do-not-send=3D"tr=
ue">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/301" moz-do-not-send=3D"true">Intel XE#301</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-lnl-1/igt@kms_flip@f=
lip-vs-expired-vblank-interruptible@b-edp1.html" moz-do-not-send=3D"true">P=
ASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:=
</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@kms=
_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html" moz-do-not-sen=
d=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1874" moz-do-not-send=3D"true">Intel XE#1874</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-8/igt@=
kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html" moz-do-not-=
send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:=
</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@kms=
_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html" moz-do-not-sen=
d=3D"true">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4543" moz-do-not-send=3D"true">Intel XE#4543</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-adlp-=
8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html" moz-d=
o-not-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-metadata-sizes:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_h=
dr@invalid-metadata-sizes.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503" moz-do-not-se=
nd=3D"true">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-bmg-1/igt@kms_hdr@invalid-metadata-size=
s.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_p=
lane_multiple@2x-tiling-4.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596" moz-do-not-se=
nd=3D"true">Intel XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-=
4.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-4/igt@xe_ev=
ict@evict-beng-mixed-many-threads-small.html" moz-do-not-send=3D"true">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6321" moz-do-not-send=3D"true">Intel XE#6321</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-7/igt@xe_evict@e=
vict-beng-mixed-many-threads-small.html" moz-do-not-send=3D"true">PASS</a><=
/li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-464/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html" moz-do-not-send=3D"true"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1727" moz-do-not-send=3D"true">Intel XE#1727</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2705" moz-do-not-send=3D"true">=
Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3113" moz-do-not-send=3D"true">Intel XE#3113</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4212" moz-do-not-send=3D"tru=
e">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4345" moz-do-not-send=3D"true">Intel XE#4345</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4522" moz-do-not-send=3D"=
true">Intel XE#4522</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-155865v7/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send=3D"true"=
>Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3113" moz-do-not-send=3D"true">Intel XE#3113</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4345" moz-do-not-send=3D"tr=
ue">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6168" moz-do-not-send=3D"true">Intel XE#6168</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_c=
ontent_protection@srm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2341" moz-do-not-send=3D=
"true">Intel XE#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-155865v7/shard-bmg-2/igt@kms_content_protection@srm.html" m=
oz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178" moz-do-not-send=3D"true">Intel XE#1178</a>)</li=
>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@absolute-wf_vblank-interruptible:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-466/ig=
t@kms_flip@absolute-wf_vblank-interruptible.html" moz-do-not-send=3D"true">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2049" moz-do-not-send=3D"true">Intel XE#2049</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-463/igt@kms_=
flip@absolute-wf_vblank-interruptible.html" moz-do-not-send=3D"true">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/20=
49" moz-do-not-send=3D"true">Intel XE#2049</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4842" moz-do-not-send=3D"true">Intel X=
E#4842</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-3/igt@kms_f=
lip@flip-vs-expired-vblank-interruptible.html" moz-do-not-send=3D"true">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" =
moz-do-not-send=3D"true">Intel XE#301</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-lnl-1/igt@kms_flip@flip-vs-=
expired-vblank-interruptible.html" moz-do-not-send=3D"true">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-s=
end=3D"true">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3149" moz-do-not-send=3D"true">Intel XE#3149</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-m=
map-wc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_f=
rontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-1/=
igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2311" moz-do-not-send=3D"true">Intel XE#2311</a>) +1=
3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-re=
nder:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_f=
rontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-2/ig=
t@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5390" moz-do-not-send=3D"true">Intel XE#5390</a>) +6 oth=
er tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</=
p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_f=
rontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5390" moz-do-not-send=3D"true">Intel XE#5390</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-6/igt@kms_f=
rontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-dra=
w-render:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-5/igt@kms_f=
rontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html" moz-do-=
not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2311" moz-do-not-send=3D"true">Intel XE#2311</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-=
6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>=
) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscr=
een:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_f=
rontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html" moz-do-not-s=
end=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-1/ig=
t@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313" moz-do-not-send=3D"true">Intel XE#2313</a>) +13 oth=
er
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-7/igt@kms_f=
rontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2313" moz-do-not-send=3D"true">Intel XE#2313</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-bmg-6/i=
gt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>) +12 =
other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-463/ig=
t@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/362" moz-do-not-send=3D"true">Intel XE#362</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v7/shard-dg2-434/igt@km=
s_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1500" moz-do-not-send=3D"true">Intel XE#1500</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@xe_=
fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html" moz-do-not-send=3D=
"true">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4917" moz-do-not-send=3D"true">Intel XE#4917</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5530" moz-do-not-send=3D"true"=
>Intel XE#5530</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-155865v7/shard-adlp-2/igt@xe_fault_injection@probe-fail-guc-xe_gu=
c_ct_send_recv.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5530" moz-do-not-send=3D"true"=
>Intel XE#5530</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687
          -&gt; xe-pw-155865v7</li>
      </ul>
      <p>IGT_8594: 8594<br>
        xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687:
        fb0f56ad8a2c9953c57c3337a72ccbf9c5050687<br>
        xe-pw-155865v7: 155865v7</p>
    </blockquote>
  </body>
</html>

--------------gc0EAPo4LQDXxy4E5f7elWQ3--
