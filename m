Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD16C3ABBC
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 16:20:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6BE10EAB8;
	Fri,  9 May 2025 16:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y5SonYG9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A8510EAB8
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 16:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746807620; x=1778343620;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9Yqm6Iz9SW9clwLtGEXZMStgQRH9RAuyE8k71kDIyfg=;
 b=Y5SonYG9S1osYB/nQO4TgygyHPTeqZFGsPgvqqP/J6nIJaE83B9wIIAb
 aRsSAinRzMaCI4f6Qyvu6Y7oIPE6LzY/V4Qo78rrRyQBKYOxqzL9Ks477
 hd9b4k5kLm5uOBiBVGe7SnqHODXSB+1LpDyTYpkfrQ03PO5z3vVzAtnoq
 T3eE0GwbsYraxcfpBQjjUtKWr50d2Hu0OMCaAXbF7iXR8BKit5pSE+b89
 oPZwdyxb96Vs7p8lw7MAnkjqsM8elX94iOf0s5oPbLoNit908cnotu5WJ
 NMQtvTQeK0YoSOffuL+Eku8UPYn01EShPbGfIyNFFBdq5ut7/oBJdkBoy w==;
X-CSE-ConnectionGUID: pEpHDXOSQXOWaDKHQu9z9A==
X-CSE-MsgGUID: KEi2iI1OQ46vGnWe5KY90Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48339576"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="48339576"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 09:20:19 -0700
X-CSE-ConnectionGUID: GYnplvIVTtmia3PNFpxG5w==
X-CSE-MsgGUID: w9q7REywQOOovieiHr5BaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="140723658"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 09:20:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 9 May 2025 09:20:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 9 May 2025 09:20:17 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 9 May 2025 09:20:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAPisz3I7btDwNHqMOLfpmVN2viWj36ahIV5Mr9XsKMw8xwgeszztp/jdELEeIuy8chn4G/Ho9tx31ga6yvIw3DIOOJpGIPIMwaQYU50VLwX3QbVCN+Xh22oVf8/SFRnysS4/JipScsV5gM7uoFpY97X2jxfQEVpyjYjXbsTLbqg/hR5OrDNLWfClH9FKa5soTVFNTVzFXkLMX0rp7LcN0hn1FlpJStxSWtRTJZN6p+fwO2VeRa3/a86lPBJ3Q3m6PDjWkYM0yIx52GWc3RxkPObZ5E61OF+uWwUU09yppdre4YcTc4KfwJ4ylVyj74Bp+e4tqkAEUoqNCfMsI342Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Yqm6Iz9SW9clwLtGEXZMStgQRH9RAuyE8k71kDIyfg=;
 b=rS+RRu5GUU67Mg2w/bbje9OvV3l+N2h/4o6mvS0axzumahrPu8iTmIdObubTuJOU91VNGwEqFI8q0Np1tx4s9k/8UtEcxaCihP7T8Ju1B56oafN8fEG4ljtNrjgqQAkZYeTxE/NoQRAtNCMzCQkImZZTfDol3hvTpXZHOxkNW7RPT6G24ttZWwLCn0CY4lwNQFZ2UOHtbQWomG/oSzKK3BW0eLiwU9Be9J0Gq+7a///QoiRMlNmTsiV/xDN7HN9tKQZEK1V6NtpitzRzdMEh8eWkUoGqdwoD4GSK13de6v7dUbc76UVOfw5NaScADLVCsK1ONXq0tjtWnyQwWMwnIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6174.namprd11.prod.outlook.com (2603:10b6:8:9a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.32; Fri, 9 May
 2025 16:20:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8678.027; Fri, 9 May 2025
 16:20:15 +0000
Date: Fri, 9 May 2025 11:20:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH v5 2/3] drm/xe: Save the gt pointer in lrc and drop the
 tile
Message-ID: <oj5xx3zc76dgnmececrhjn27dismg7prdondpzwpp5oqyxwkba@ygc57if2hcu7>
References: <20250509161159.2173069-5-umesh.nerlige.ramappa@intel.com>
 <20250509161159.2173069-7-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250509161159.2173069-7-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:303:8d::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6174:EE_
X-MS-Office365-Filtering-Correlation-Id: 7420b598-c28c-4351-9c6d-08dd8f15619a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WTpI5UjMpTEGRRnsPogRimxPRh34fLQ7MgD3PkEt5hPicmROsO2Oxu3j8MXQ?=
 =?us-ascii?Q?t0Mi29My4FCgnRGEAgJbw62sRuXm5ffPrFj/P9qytfeVSL13QfhV8BP/1y3a?=
 =?us-ascii?Q?6MIOUenGqhaqBBfNaZ5RnvWJNRDxhEPCTJkxeNWkQh7gcBdXJ8HZIJxjQeWY?=
 =?us-ascii?Q?kFTf9zyjTAmr4j4Qy6dr7HYRsMGcuCMoLfN8ZroXjZf6vxKUzYUoj5tzemNY?=
 =?us-ascii?Q?4D2iU2U67WHB25h34C4aMiACsG28tHQqfZRqPFyPJO9Z1KsDSfBD93yYcMnx?=
 =?us-ascii?Q?V+n4XZavKayAOrWQBRNlg3oS6oGq22gABQ+83o51i7uhx9EN4eESSK0Zi//T?=
 =?us-ascii?Q?gYmgnf9/C49VXocQ8dAei3Lp1nzwDP89gIl1CZM19IFzkHEr35j9pU5asFzo?=
 =?us-ascii?Q?/eB0lsyI2zRV0T3evaHwFVXiJ8b0dN++7MMvRtHxnwYyw/FzhkH0eCE+R1vx?=
 =?us-ascii?Q?DWvFuFE00VwE7Alf8+plCwDKEt8STH6TXsUJy4HGJUIsogoYVDc7QoPF/aJb?=
 =?us-ascii?Q?110Cp+2u8Nzu+ze85mwbS6Z27p2q2RRDb9wambruJbypAhRusR5kUT9O8oBQ?=
 =?us-ascii?Q?qHpfiPS2YPPjDtYphqQWuGl79HeIW2KsHpO6tDHqMt3+sGovoJ/bKlHsZ/Xu?=
 =?us-ascii?Q?tb7Zt/zI+WHq79soBHNF3OSDH5t3PiEah9cgeezy3mZp10ghAaX+FtjomoIb?=
 =?us-ascii?Q?cTCjWh4hqAPjiROv5DtjIS1c7bfZCoPqwR6eiYjxXBEN9TD9eaqCt2mVRDvy?=
 =?us-ascii?Q?6lpA/SETQoxZ2dEGAwbtVgRMztDTkX1y461ykoaphwvhgUNpmg/NWACkQWsR?=
 =?us-ascii?Q?eozAK2tCCaLQCfmxF/fnxr+ZpppU4sRPMWQFzbPPZPSb2S+wDpFg4NUG5WnR?=
 =?us-ascii?Q?IhE0a27EFRiln7wqMvF7hNVuvz3YxSPu9RqteHGTouqdNUJjdh3VRR2qSaXN?=
 =?us-ascii?Q?bzhlrBPbSB6wQk7wJGM7b1GCDP8Fr6t6M9i0S2hW+R9O052vwy67kPapB+Ui?=
 =?us-ascii?Q?vJI7xkfSO2YJf7BRilyOgHddleWv5y5CxZ8QY5tGmZYPpVChdlwXO9F+6t2E?=
 =?us-ascii?Q?XEsysSk3Nbbo+UL7xx3Z5Mo1kGqVTUg/ZCgkhUEPaleIXjpoRCkvAhdX9nqq?=
 =?us-ascii?Q?cs8bz+6a8raB8kk5fQ0m1aNb/HrhZdsTueiecqcv6dz+vE7t9F1h34oI2xrF?=
 =?us-ascii?Q?ph9tFSPGGppxFOiVMkNA5qZ9DM4YBhaD75jULPsPICCavzjvMSO8apmcLmz5?=
 =?us-ascii?Q?mZwVvBaJ8Y3Ou49qy1RzI/w6enf6RblFp8CvV7JcSij+kYaGdhlc9jFJs2XX?=
 =?us-ascii?Q?YUxUu+19d59+isIaOaAHOji64Agih6BA/pmmK3DETRWdcNRSHxr6JZR3Y1mV?=
 =?us-ascii?Q?G2HMA5BcppgFIPiIfNqCvByA/8RyvPETP4GJI7J3FXtVz/m5BUBBZwrIgX/P?=
 =?us-ascii?Q?DouLNLBd3yg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/JeBf72E9QHoS7lRNG+iocG/FvhinhBlbJDMPd6JLOxNWyG5cN1W2R7CBPpj?=
 =?us-ascii?Q?+fQhj6wODoHjqBfsIYTpnUZMNOjLBAOcnzb9AnIoEbGQd77BmyPiIka3wtZs?=
 =?us-ascii?Q?6S1eQuJilpfKcKK95BK6k6EaR4DDc2NTeyBiSuY/BKCgGHJ9Ce4C8X0uV5Ux?=
 =?us-ascii?Q?i8B80lXWm2AfPRAfVkWnjaYvtUAZ3kO6NBYKlctOdgb5/RLdKpDTD8Dw8310?=
 =?us-ascii?Q?FwiCBmv/nZG9Hu6GFJA0Z/LKPYeytGc7Q0UlGmSw1mvsrFxbT41MphPiKc4r?=
 =?us-ascii?Q?xpYZOWVSsqPZxDxQQiP2uHdFGVyn6bkrj/APWPf1Y/poUrnLdRZZCdVVsovD?=
 =?us-ascii?Q?/yqKWzGRfx9G3yPkVD8GWhHREIhoLbjVLjSkbL9nleCjw/yLYWAl1gXycRrR?=
 =?us-ascii?Q?/2LSoCLEtbvLcMXqSi5+4HSlR3YFKX8EMVstrdgFh5ZTVbNwSuDc19NpQV0z?=
 =?us-ascii?Q?qLlYtvkZ59xYXPT0dhN8acxh3Uk3QW1yUdDxFCoWOgMLsmtk+2zITgxOpPYH?=
 =?us-ascii?Q?Ju2gP4aoBOjZrggZrQ02o7xu5Ufu8NnDjvVmOFWM6D9GZXXNMW1hP1vPNA4X?=
 =?us-ascii?Q?Xi4BRiVPfWCqsEuPlpZAJSlxxldXMSNDxEnCkSzgaCmy+za6YR6zwnrisTC7?=
 =?us-ascii?Q?3VNXIKjttXmbCx5W7zYasGv0SrE7BFCHkZzVzl3j74yNLKTNcbGMvPfWCQlJ?=
 =?us-ascii?Q?PGywmsa47SljP37VAgMBf4WQ5WMYfzJlqASJa5U4s3pgN98yyQbAU/jOCi4B?=
 =?us-ascii?Q?WCSJMPgpLVgGDqIffDw/YZ8QVrIGherquAb4bAs5W/Bubbu89UYxJDRO0YkS?=
 =?us-ascii?Q?c3+eO7TEWElRx3sqJLw298WQEL6UVdP0U15Mh53PSMf5aLfzdXZCSPAZmn+v?=
 =?us-ascii?Q?PqYJfxGhLyywUGjJhD4Uv9HOhwEoRsOC3si6NWQbFzMhdAmSbDgfJIWslFEo?=
 =?us-ascii?Q?TeuriVRK0Xb5aCPKP3h6AoJHaB252KsebYt9S2aYtS33uAlnjf5sf1W8oVRf?=
 =?us-ascii?Q?5HBZqVjKaPtZriXkMFWIQe5atNyf4jqsEOIMp0EvqRLqCGoQxnaj0ZL/2IMw?=
 =?us-ascii?Q?RjBKZs30dADtMwXSwxnllwJp4pTFB4ZhRnEIxMFeosjrlwglgy8sg50YJxhd?=
 =?us-ascii?Q?7KdANR8r09pyhdhfog+ufRBuH5nUiZGuqwZFyfCuFkJyDqZhai08JTS52q5o?=
 =?us-ascii?Q?zotRPF7QtPqt9T+gP3ILsKCgpvF8zY9ui1w9V9u+whmLdVbG76+McjQKITpD?=
 =?us-ascii?Q?WddjbsJvc4ovRF3q4J3eBguNsGP0VEKXV73phx2DDCSDxw8BD/XkSUAsXPzg?=
 =?us-ascii?Q?G6HyM/v07uPf2AverPr/ccPSjM7hTeW5NlpTluLXme4PYOMNwvvI0iA8LoMW?=
 =?us-ascii?Q?pfcQXvnaFqiJ+fQ5dlzRdX9GmnFfZwt4t9opSuZqAujSTkCBbeTwfe3vV3Vo?=
 =?us-ascii?Q?dA1jhD7CIDExAfCezAl6J9Z/V5JhaY4vHfTTU5m2rRFPcgIZV43rH03VbHoQ?=
 =?us-ascii?Q?jf8vJ7IRLTw/GwAomZ05bY1oW0YIuBX3Zyp2qSSu4zO6OUqa5Uymp00IozHl?=
 =?us-ascii?Q?wFL8fvcMZl2JYoANGqg++6lK6NbeCuEpjYDTSiUvs/JAuNLan7VnUXKZP4Sg?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7420b598-c28c-4351-9c6d-08dd8f15619a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:20:15.3311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnEaS8xK/TyS03xFj5ejOV/nz58gWrQjuQpN1bFjpaABD+US6nPUahW3N4JlSfHpOn2MUdz8nLTTwJ/TceKvE3BGT+zQo0qtUQh/7wrIRsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6174
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

On Fri, May 09, 2025 at 09:12:02AM -0700, Umesh Nerlige Ramappa wrote:
>Save the gt pointer in the lrc so that it can used for gt based helpers.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
