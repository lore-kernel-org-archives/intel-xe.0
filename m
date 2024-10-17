Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F7BD3C526
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 17:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4576710E161;
	Thu, 17 Oct 2024 17:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="clfjffeh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D089810E0BC
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 17:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729187468; x=1760723468;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9y1XQ8ACDcCMSKpJnMUPijX0q4hHLmQmujjGJBTRd88=;
 b=clfjffehnGZRR8odAmRF3xPurmOEM3g8DEZD3HgAImMMvmJUc7HjF1nL
 PGPjCTI8qsrLD7HoTL8dK4W94oEgokNtgfbImpMcXy0vTPPY3p4/84qbR
 X3WNPgNxCJ5uf7o9kB1x76AKtnPmGIROq1EVYiTaWKQ7cejS0steEuapi
 QwAVTGurkuVZPQuUPUYMLvGd5kUsHUfaT/0Byi+F45FSzkyYQsH7oF9fz
 QLP+j4ayXws09D2JKwzh4N5ugv5YEWKX/vLfxcBa/HVeRboessM3ChbIh
 pGDL9vwBJ3XMRJBIUj3nPlWxVbvJ1LsBsDQ4VtJf3Usd0y4OS4IpRY22R g==;
X-CSE-ConnectionGUID: 6DzF+yTxQq2OVI0A6kwpKw==
X-CSE-MsgGUID: 6PaLNn3sQFOKc5UXI7IYbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46156491"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="46156491"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 10:51:07 -0700
X-CSE-ConnectionGUID: GVEWK1lWSGyPCgtSAdiYqg==
X-CSE-MsgGUID: b8V8MSBWS2636bJXeo3DLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="109440868"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 10:51:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 10:51:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 10:51:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 10:51:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+/6MLlgJKVkoDxDoalVTjFObNwplTSh3kQlXSXTWUKTG00FL9+ZwwMaK8j9yDrs6D0870Cywe0y2yIjV8tB623EtCDIFhlJRYm+l+7wzs4SshUawH6K6qsahVZsh4U4toab6kMWfahUzcnqkceCByURxVxIGSibi+fXSawuow2+rRexUOvbJcUcPEmEuscVeYDOcZazwMtLoIIGBcF2GMxf5gawd3nsuiuOJNnFtw4FF1uXnLJDx5gf+UwrhJkTWXiFH8aM/jlY+FwRaiAJff+Ehd+G64hQJd5V9BYtXyexRzI4/wawOup1z+fGlwodl7mu45Tg+9Cz5lYiKmZwrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFFkCccCqCyYR4AMWGmosyulDWq5ebFm/y7glhJ5dlo=;
 b=jngCFUGTdagIPre4u47mFz2XQlMPVqnyPZgXJhmIN2Y8UrjBKMUSvb3TOs86Ty8vFPQO3+Pi+1bakTzu8e4scWdfcVmNKDOdBab005G+szlXSXoIvG6gtN5ZR9SkhWlvQ/xEYquO3iyLuS0+gW7C/xZIbecV4hSKh6gx3VNL1+D++Y1iOMGdqVIuVCw1yVsecG6BoTLQ/0jEP8rGc9aD7WACkyhSi8m4oLhxfd3xbHEsLPlZsu+HvUQ2AtHHaFc/bplAeonirjLpTRkoYUWhQBLT1h1bL29LgcEETGFU1niIbAMZB742waGZ22IMgGE0FFGWfMEqe/MEKGmk2G69mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by LV3PR11MB8742.namprd11.prod.outlook.com (2603:10b6:408:212::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 17:50:57 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 17:50:57 +0000
Message-ID: <b5e91925-2c95-461d-a18a-ef7d448c9f78@intel.com>
Date: Thu, 17 Oct 2024 23:20:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: Handle unreliable MMIO reads during forcewake
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Alex Zuo <alex.zuo@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20241017034026.1525693-1-shuicheng.lin@intel.com>
 <20241017163038.1554591-1-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241017163038.1554591-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::35) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|LV3PR11MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: 10a0f3a2-47f7-4342-4c0d-08dceed440dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qnp2ZTBCUFNUQ3ptYmVPRDRiOGlHSnlWK2pNdURibVpHZlhra0ppK1lqTFds?=
 =?utf-8?B?a0FYQXVCOWx3YUo3R29rdGNmUkVRdlVSSzZDTmNSRVRXQ0RUc0dRakE2dGI3?=
 =?utf-8?B?NlVCWVNxL2l5MDBhSFFxY3FGSU9yVTN1TTdtL0VRS2FuS0FnRW5WdnVjbDY0?=
 =?utf-8?B?cXF1UkYyL1dJRUVyeGR5RlI3RHQ5Y0NFZzcvRGNaRy8zeFFxU1NtVUhyd2FI?=
 =?utf-8?B?Tkp0SVF6NjRmcGdrcGlmYmRNTE43NXBlZk1KekpWeC8vdTZlT2hCQk5sQjNy?=
 =?utf-8?B?R1Zab1FvOU9DL0QwRXQ3TmorNGRZWnZEQm1NaXVuUHhmZklCQmZJKzBDa1FD?=
 =?utf-8?B?ZW9PSGdjK09ZTk0yT1hOemZXN2JwOFI5SHVaRlRvVUNkZVpjRGhEOWJFR3Fz?=
 =?utf-8?B?TkxKSldPNExqa0Ztbm1iT01WNlQ1d0lEeFd0YVBRU2d5YTdpRkl4TE43UFlo?=
 =?utf-8?B?aUlDM2RJZUQ0Z3ZQdkUrMklOVHV5ZUZKWmErcVVsdStvRFprSlA3KzV1Ly9C?=
 =?utf-8?B?L1dhemVBOG1OZEgzUFVFTUpEQkZ4VFBrK1dVK1Y3RTRZVmxneTV0SlJvZE5r?=
 =?utf-8?B?VEw4NlRiWW8wKzhseHk0Zk43Vno0cW10Y0lpQTNoMWpUbVRrSVlsWkhtTEZ2?=
 =?utf-8?B?VGJWMEJKMUpBMXBwSHE4NHJrTFVTM3RTZ3hvaHJFZ0tFUFJSWm1YWVlYUVk5?=
 =?utf-8?B?ZlY4TkpNdzhjcXVlMklUNVF0ekM2K012S1FZcld1UWVBS2dIZWVYSDE1UjZp?=
 =?utf-8?B?SlpJM0o3YzI4bDgveXNxMXFKM1k4MXJQWU1OTURMczJYeTZJU2JDVlAra25v?=
 =?utf-8?B?Y0RYZWF3NHRYbVA2ME1FdUgwQVFWUEUyZlVrTmZ6aldFSmpKREc3YjRsbzBy?=
 =?utf-8?B?VTNwUzJOUUpyVFNjRFh4WHMrRE5rQTBZRzJhMU5DNVFqZ2ZyN0lMZllWTStv?=
 =?utf-8?B?eWpzd3NOVG5QdTVVVUFUSHdGK0ZUVkQvUnpoTFBaMzVyd2ovYjF2RFcwTXNE?=
 =?utf-8?B?MkZ0cytuZ1RFZE9ESlh6TC9YRi9BWkZrN3MzUjR6WTM3UWtTZ0ZBbTZqK3dn?=
 =?utf-8?B?TXZFZW5XcEJzcHI1SHE2WFIzcjc5Uk50cFFGdWcrRE5Kd1hLYjFOYWpxTXlR?=
 =?utf-8?B?Vi9rdjh6dTZ6LzRTdlh2ZzJEMGM4QXgzM1VxU2RsTG01WDdkSVRXYXFIQzhY?=
 =?utf-8?B?ZXdtbHQxZE0zT1ltTVFlbEh6Qnh2ZjVWa3RTbVZWc3RDMVduQ2xWcU1BQUd2?=
 =?utf-8?B?Q1FiVGJQMjZOWS9FQmd2WEd5MUpFcGxCaHM4dmlvSnNJYkZLL2pJSExQZ1Nz?=
 =?utf-8?B?UFFEWm9Oc093MWNFSzNCd1E3KzVSRjdFNjEvdVloamg3QnhkcEdmYkpMK2R3?=
 =?utf-8?B?K1FudjgrVXpyUFRMUzRpTndhLzhyTFdmdUs3UThGbVR1OU9lQTN6NWFWaXNh?=
 =?utf-8?B?SXFQT2JxMUZWM2pFc3NhN1p5Mml0UlpNRldHZ1AzdUdsUit2QUxzcSt2UXBh?=
 =?utf-8?B?OStsL2s5RFd0dmxlRnp2YjArd0UrQnlKV212azBaWjkzTlI4d2E3OG9VekZp?=
 =?utf-8?B?NW9CYmRNTmJPbExLUjFvWm91ODh3MVpRNXhBRWRPUGREOXZ1TE1xS056SC82?=
 =?utf-8?B?MzZkN0J4cklrUXFkQTVQN2ppTHdZQWUzWGl6ZTgyK09IK3owaHZDYzVFcXND?=
 =?utf-8?B?YmdxZzJsRjBLbUFJUk9QdDVzaUIxSjNnaFZjTEx1d2hERFRDY0MzS09tNkpX?=
 =?utf-8?Q?j4TCrq9f4bgqN2I5X8aWNnhyxLTUrTVczvCrIER?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWZ4cEo1Y2dNeTBRK1lXMzBuNWlnK2ppSExZRjVrZGpsWXY3aFFwRU1TUDVE?=
 =?utf-8?B?RTlJWkVZYUF0VE1MZXgvMHBWTTRMVG00SUJueEt0eGFkeTdjSEFlQUJmU0JK?=
 =?utf-8?B?NkZUMGhjZTRzc1lVWE1jQkRvNWNodGVib01KVlI2c2RXeDliRkhmS1R0K1Q3?=
 =?utf-8?B?ckt3QkFldGMyV05RVHc5V1ovVGJjaDRzclhKc0k2MFVMS3lCQWpabDlpZU8y?=
 =?utf-8?B?NHU2Vi9DdEgwUm55V05Cd2Z1ZjRaTUt3TG5DSWNoZWI4T2tNMStPOGUxa05G?=
 =?utf-8?B?QWNUVkdKb1NJNmNsNjZMbG0ybTRHaFp3Uis1ZlNHRmtFcDFSRStGK05aWTBs?=
 =?utf-8?B?UE02VnZ4MU95VXNaaEZZRGlCNGpnZ2lnUzl1TFJ3MngrVkRrMkU4bkZUQTJG?=
 =?utf-8?B?SlR5UUdWTVNTSmliUEQ0TjhOUTJ6TzF4Qm1BQjh5S2tFSjF2MmxjaXRVVEJU?=
 =?utf-8?B?SUgxK3piSkd5c1JVNGMrQUxSKzF6THVzVFRVWWdNbzVDckNDMER6OFBqeENx?=
 =?utf-8?B?UXRMWkc2NkNUTVhQcUVqRGF3U0FYZkRBQVFuQWUrZE01cEJGVUJ1aGYrWXlL?=
 =?utf-8?B?c2ZxM3F5NWYwNWMvN1lwaXE4SEswdThEUzBYS3lSR1ZxeEJ3VWpta1E0NWtQ?=
 =?utf-8?B?ejd6MlM0ckFLQlFqMU1tcFV6RjhmQW84dGloV2pjbXoxVXRrTUJMZjFBZWln?=
 =?utf-8?B?TExpSC9DWEFlVE5jNThPUm4rWWNiZlRkMkgxWE9JVVg1NnhBcGhPSXhvT3hZ?=
 =?utf-8?B?RXZDS2czWjg4ektZZjE4QVZlZEZtcm8xSnFFYjQyeU1KaXlBTzEybTdBcS92?=
 =?utf-8?B?SDR1VFZ5N3AzZHJSeUxLQy9Kb3Q3ZlR0RTV5bVZicUtpemtwOHl6YUJLMDVV?=
 =?utf-8?B?L2srbWdvOEg3WEdFWHZ4ckZjVSszNzFCZ2pTSjh4bjhhczgzV1ZseUw0YVkr?=
 =?utf-8?B?MGlMVDFNNU41dGFjencxcFdJVDFRWjZuV2RwSTJYcXFiTmt6aWh6T2FGeXg5?=
 =?utf-8?B?WHpJZjB3ZFEzdHM0ZjBHVzBxQlRZM0pjNEIwTFJBOXlLbFg2bngvUUJGTkdn?=
 =?utf-8?B?bHNZaDdYaDFtOFF5dUxwWWlDTEIzclJ1TjYvaVVYcFdkZGswSGlYUWwveTZD?=
 =?utf-8?B?Z0VKbDg5TlpEMnVzMldYQlhKRlRZdnVGRmFyUDVPTUVzaldMRkhMODdZZFVi?=
 =?utf-8?B?YkJEeW1kN0x6SW8yYW9tREdJcE1wdE83OGNIWjBqWVhESEpTdjhST2ZWQXIv?=
 =?utf-8?B?amtrNDRuR3BueFFsek9IWWlmbnZ6bVpJV01ZQ2wwUTFoMWordWhwR0pzZ2RT?=
 =?utf-8?B?Rk8yaUtvRC8vOSsvS0U0QnF1MERlNDl1YkRnU0lvUWp5M2tnZUYvUFoyMllU?=
 =?utf-8?B?aWNZZ09LRVdyM0Y3Y0tOMUNvd0JDd0lDSkZFcHZmVDNSOVBZTjBoR3RXZDI5?=
 =?utf-8?B?REgzaCtrMWtFVjNaWXVXV0Y5V1ltUVhJM1BuZk1xcDB2T1lZLzJhYlNRTE5W?=
 =?utf-8?B?WGkxME1yM2ZObDllY0RrNndjUWJDNU9PWUE4UFdYNWk5OURwQkNBdTZVbUZD?=
 =?utf-8?B?SEJUaE5aMTAyRHNvcXRadjFJMCtZRllTdURQNXhQZW0yRzEreWhSWkdXdTFx?=
 =?utf-8?B?ZzRQOXlDajd1RHNpZDVnU1BsUWZId2RIemY2dkkyTXdvSHVMN1d4Y2dUMXJ3?=
 =?utf-8?B?NmhnSUQzbkRSRDdxakZOQXVYalg1S0EzZWIyMlNBdFRQSzB6MlhEWVcydjlF?=
 =?utf-8?B?MGlGaVJFblpmWnBuZGcvV3JJbmk4QTk1dFRUUnlSZGhjYTFYNUU4SVp3bmdu?=
 =?utf-8?B?dFpPbTl3TUJHWHRUSG9RYk9zcE9haEdrSDJENGNlVkg0ZnlmNU43d0RXdnJX?=
 =?utf-8?B?ekpzbjNoSmh1eEIzYVFrZVpCb3ZyRGlBTDVNbjZSMWZ5YTEwcGVIN2F6aTVH?=
 =?utf-8?B?djkwNitvN0tFRG1xNkFYaVBiOUhBVDhySHFQYXFmZC82RWc1M3BzVnZaUkRC?=
 =?utf-8?B?RW5oMHVUbFhmeTJEM3c4UUc5UFYrRi9MWFlVam9nWGVkUm8wTE5Hc3dZNFJk?=
 =?utf-8?B?N2J1Kzd2a1N2YnVITSt1V21yL3l5RHV3bjRwRU9iZTEydEIreloweU0xWUZx?=
 =?utf-8?B?L20wMmhDVUpyaC9oZjVWdjMvc2VJM1l0TmhoTXVvZmphTHo1QVQrdjNZY05p?=
 =?utf-8?Q?JEIzNs5yqOq2dUkc71P6z44=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a0f3a2-47f7-4342-4c0d-08dceed440dd
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 17:50:57.1805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9tHpr62PJYeh5LoytBIi2mR3uZsSzhuVKUEuMiPLRNYxKdgpAQiMPSHGY5bi+mtpCzWyKBksl/sfp6Y+AE1q97D0wm5+UaRV5zvF2DfbN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8742
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



On 17-10-2024 22:00, Shuicheng Lin wrote:
> In some cases, when the driver attempts to read an MMIO register,
> the hardware may return 0xFFFFFFFF. The current force wake path
> code treats this as a valid response, as it only checks the BIT.
> However, 0xFFFFFFFF should be considered an invalid value, indicating
> a potential issue. To address this, we should add a log entry to
> highlight this condition and return failure.
> The force wake failure log level is changed from notice to err
> to match the failure return value.
> 
> v2 (Matt Brost):
>    - set ret value (-EIO) to kick the error to upper layers
> v3 (Rodrigo):
>    - add commit message for the log level promotion from notice to err

Feel free to retain RB on this version.

As a general practice, creating a new version solely for commit message
or changelog updates is avoided, as this triggers a full CI run. Making
changes before pushing and running checkpatch should be sufficient.

BR
Himal

> 
> Suggested-by: Alex Zuo <alex.zuo@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_force_wake.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index a64c14757c84..08621717b14b 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -115,9 +115,15 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
>   			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
>   			     &value, true);
>   	if (ret)
> -		xe_gt_notice(gt, "Force wake domain %d failed to ack %s (%pe) reg[%#x] = %#x\n",
> -			     domain->id, str_wake_sleep(wake), ERR_PTR(ret),
> -			     domain->reg_ack.addr, value);
> +		xe_gt_err(gt, "Force wake domain %d failed to ack %s (%pe) reg[%#x] = %#x\n",
> +			  domain->id, str_wake_sleep(wake), ERR_PTR(ret),
> +			  domain->reg_ack.addr, value);
> +	if (value == ~0) {
> +		xe_gt_err(gt,
> +			  "Force wake domain %d: %s. MMIO unreliable (forcewake register returns 0xFFFFFFFF)!\n",
> +			  domain->id, str_wake_sleep(wake));
> +		ret = -EIO;
> +	}
>   
>   	return ret;
>   }

