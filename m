Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4F3FEFB6D
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 16:56:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4821510EBD1;
	Fri, 27 Feb 2026 16:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8RgxC7N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C403410EBD1
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 16:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772211381; x=1803747381;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=7lxkg9Yi9vhrc4aN0NaP+R/wqMOYsMctMXpYH29tecs=;
 b=n8RgxC7NyXYNSUj5OOMftN7cEnX/17mWUb5QrRflttyYoRe/pL0f1hgJ
 KHvnvF8RlomVAkHCxDJWDbe3xboD2hnJIyqruH25xiyNa2yec8uXA+cBz
 EtwmxyPlWfAob2mTNwlNVk9yt3FuWlY8nKFDpjfVZHsewbNRUfd3Jcu1q
 EnrYIidezJqhAwYjm+p3rv+XCa2o6wC8ezXATiEjNHLObXpjssat3uebR
 4wJGdLjKkJIO+MJJLrUCtiueXMlA/sSxSeJA3ke4N8rna/az4wBgI6PNX
 Q5gomd/IozOXcrzuCSCKzT9muCoUxrjj+HPNHrdzthT17Lk+wwMeEBkN8 w==;
X-CSE-ConnectionGUID: NsiuC3e2TdCWAYmCRANMuw==
X-CSE-MsgGUID: 3NZb4++ZTKO7eQaUFka3dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="98763780"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="98763780"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 08:56:12 -0800
X-CSE-ConnectionGUID: B82P980FQeSuUXbX+Q8jKQ==
X-CSE-MsgGUID: +512liLeS4SLwYbCe0A1oA==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 08:56:12 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 08:56:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 08:56:11 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 08:56:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwNFejGtU6S6LUmrAqu5RPyStqyIzq4BDpqJhyrYG2noziSN/c2yIkwUj4WJbOlquCNFrGZvRWh8AOntQh01VYD1fSGKupwEQk7c5O/183FAi+ksNiAECapuG3ooId0El3hqYBao/+VoBzDVUorITJw5BSakm19FXf8fsyPBFeLauz6GoEstQBrlaupuLopDe21WKeonlXvmq5d7Gv5H0DcCD9Qp/SsPd3qdoyqSV+8B+kBtUBz3hcOMyPCHpJ7WzBaLcFyTmkbGUUcF0XeimBj2nyAA4wT8KO80XrNrIwSH/ws237srgKukzsbFHv4cz+fGHSXInRaDAyb9EeyB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgvHqOuTgv9c+86FOCUUznCMzmEoJW98+WtyC2G411A=;
 b=O2shVphkFnz++luFJ3EPI0+VQI6vRavCo/w4p9XhE5Bz0ujW5R54NFXvfqeq5QvsRo4NWFBJ0+Wyv6dISeL6hTND6fh5y7jmtfmPZgcHhmgHOu+WVqsVRcIW2wItRBw3u5168xlk3wzX8A7Gq4vSbK5KnJxvEJfSKHu+wPn+Uzuv7yswlErlTGJIsNZeG+VumrVq/X2H9DHcXhJ+ibyA2IWHBHaEFOcTkaCxD4pb1XKEOutkI2C8FUdaRelBBwlGT7e7a4ctDIuMO3pNcIH86m0Xy+8cqBrx2QPPnRBrE7BbuFZeAW+kf2hxj45fx0Q5XTxYoQbA6euRk1zMG+et9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV2PR11MB6045.namprd11.prod.outlook.com (2603:10b6:408:17b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 16:56:07 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 16:56:07 +0000
Date: Fri, 27 Feb 2026 08:56:05 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw6IHN1Y2Nl?=
 =?utf-8?Q?ss_for_drm=2Fxe=2Ftuning?= =?utf-8?Q?=3A?= Apply windower hardware
 filtering setting on Xe3 and Xe3p
Message-ID: <20260227165605.GB4694@mdroper-desk1.amr.corp.intel.com>
References: <20260224235055.3038710-2-matthew.d.roper@intel.com>
 <177200857090.284988.9907393533496529856@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177200857090.284988.9907393533496529856@a3b018990fe9>
X-ClientProxiedBy: BY5PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV2PR11MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: 3859a9c8-f4c5-48d9-c352-08de762119e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: z+KYf5uRMCbAMyIibETY92boLlszNdEH1mPqqgZCdC3mOGCKsG8jgAdAGhapr+rXaJzu+Cph6o7+/jluKaFYxYJz5IJcrgScYzYQeBVGnKm8qOfoFjEEKnEtv7N4whQcYZNrGlMkT+UsZW717h7O3yJ7VP9sYMgxx+7Tw8TqgfeLITBydbSY9fUdIqz6dNlmMMzdQmUreHR8gVestsUieE0roDFlwUr06OMFD1WJx+vyD5MljRKU1PH7WzdRHObb1mWIeEIwLFJUr7whzlAD6XuV+izFbola25niWSlRzJndwdVJemx+567/t8dCMZFO97EWdgDpS6HohiKSIC4IwojsgcICVOvzZYonz03SzcVv3LUt/rk5Av7rxEE3z8HG78VAIJRppbCGkXHo9oyVBdYIevjtHaVNgb68u9qwYSZXeJWAsV1tXhygHsmRLj0zUS87EWiHQSrSE5DOXctQ8cjF75SQFUE7GuxZeYwqvgSchai2C9mudUm44oLMazs2LwqL3MOPFJsYeCE3pxIg1nUW1wQNXZfcmOcNsI5X5JMHsLLw0lr3oODYQqh03DasBv+6KQTeqglWK7x/P/FdhU5vgFLBTADH4k48AHLe+Gp/1y4AZBquQZzn65rH7errqcNvJFu65mM5KFYpKswpuBox7gKDUWN8l6HBksunct4XbH831p72GUAp5HurQyGx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?anNjZvOR3P89YraGOedGnL2pRdundeffymlxSenEyjqAUH4b8R2sBhmj54VA?=
 =?us-ascii?Q?zRw8ZFthAFJG4skAlc++hF5qEQiT7qhMd0RRIs7BV4l3BnWWTuFLEvkFn6UI?=
 =?us-ascii?Q?DwJKP18MKARxRVGpJqgC4mqBdRdrMc5/oRwaCv+C1C9IAZJdx2z7uGqpxCki?=
 =?us-ascii?Q?9pl2EVMJ8Y8AW1J2kLfG1/dVv8uY2ysOYzC6LtVZOQu7qAo2njcJ53c5l7va?=
 =?us-ascii?Q?HCkEX0zjb0d1cGfuD9QQkUIE/M+nGctF2jI/n6OJ3kZAmlQbtT9OJOCY2GqA?=
 =?us-ascii?Q?gvAHacngczpvrM7WkohIiCYNzTjykLEajN+F0FowhU/7fkVGoyftoaUmUVTW?=
 =?us-ascii?Q?MEpEK3UXfhIwi+2w1eTtLvu4sjXoG8hpnr9xbi3luHnFTaJWoD8/7iLBizGN?=
 =?us-ascii?Q?ymr+/GQtCfMU08FQD4wCYYcZQ/UmdeQeJz1JNj7im5V4Erzuw1N5al5SyVJR?=
 =?us-ascii?Q?Fhz7jphQ8rFtCYEgxv/X2Y3qYXtcA306ByYaj2bjiwfeaagBRrnq/wCsJtFt?=
 =?us-ascii?Q?/8wY6xwu2yySDDNdBp8bigj8/8gw+iCJvN1vGKG5SnECttmDI8/VVYXk5LEZ?=
 =?us-ascii?Q?F4w1XsGnpELHREiHDCnuyeWzV99WnVgfULYbtoXxn9PBWB4957VG2bxdfvp+?=
 =?us-ascii?Q?1pI7PmnCbxItPiqBvecyxN8zMzdRDfi8IPUK1Z565K1JQbXZp7XtzvekelbQ?=
 =?us-ascii?Q?pFHyZlJNyRWdp2Xvs5AFl4EnVzkFCrsBUDVJQPAYszjb1yRedAq9wk1lWOt0?=
 =?us-ascii?Q?BV8Oza3UNp7bRm1RJqF5gcwYfgIJliA1OWvMPuoRVKnGFCt04XCmdLw8S4yi?=
 =?us-ascii?Q?4DbBB6DT0KKi5qNtu0oMNyY8mckilVv7ZbReJOR0daYvMqwMpbNXkzT0+I7T?=
 =?us-ascii?Q?9ZHqac43yQh8/Pt3RqSIO/f4KJNxyvNOg7bzjJtIEm4gLtH2bXsZMuv9VyUM?=
 =?us-ascii?Q?JvR08xmvxZ0127ZNFJYkeLdE9Nz9il/VlhVBn/NAEolPAEivTOXeC5n11zTZ?=
 =?us-ascii?Q?99ZneZqfc6eEaVDZ94bkELBYZ3ssqGy6qy3NthGhiNm5YddBtOqiIbf9lsVi?=
 =?us-ascii?Q?mogrSIgLArtFwrbCfmo9OrWjcyN1Nggxa2nWCqFBajwvRxS3/cSWu+XsREWr?=
 =?us-ascii?Q?JJMApkD7XxKLKkwW9qzmuJkxNo4kscEhl35pOpq3R9ULBu+CBxWBMBdtqGV8?=
 =?us-ascii?Q?jLTXoEvNm8lAH2ZGgSf7OZODLvVTHVB+Evc+q+FGnu2URbLyMOzHAwRZyCXh?=
 =?us-ascii?Q?3B3nxV9O8WhgC55ATMvzjgykfgfFmmKs0tvEc6k1FS6n3uf4uuPEdm08glLB?=
 =?us-ascii?Q?yauNiqZrp4qvCgrSFBSbwGs88XKYlGtO5Y7d7Nbs18JiL/BWPt5ZbQ1OgSOM?=
 =?us-ascii?Q?wSJZ1gpK0CRhlvC9aD/RINxMGYiU16ZKNRiysfguuX56lbWC/T8Xp3MgIrSD?=
 =?us-ascii?Q?9150+URy4s3tsuqPWjqAGStwQzMhDsEBaixKn68trN6aZo5paMjYnm2OX08p?=
 =?us-ascii?Q?BQKvtf/E/d5fnFemQphP9OvBST/0io+8Iqc+BjNaOWVgoaYa8s5tfQEtFQ8h?=
 =?us-ascii?Q?bLaZ4YtlGVh1HIIS0Noc2nITbGHngfXvlhbh//Lgp9cXDTmqnJuzdws+HFSG?=
 =?us-ascii?Q?tPq3COXq0yX6/w4TLzdzJHjtD7C3I4Xl+e/hjT6v0aS2PfeIz8Dgjbhwc10J?=
 =?us-ascii?Q?yoadR6ciSBUB6TFiDp70dHuC28+Wupe6LDaSv2P1a5HjUaez2Pkbv6g7czg4?=
 =?us-ascii?Q?NJkd/5Gs3rSKLi3E7v73s1Fm8MHtr/M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3859a9c8-f4c5-48d9-c352-08de762119e1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 16:56:07.4915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9a/kc1jlJKzo2nP9KRpER8aIeY41xESSrrd9GIs0XiHPXWUsoTfn1k9oXIpfcDMU42HUrvBhwcA21na5DPbfCz585iPY/T4oGLlRoZcwIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6045
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

On Wed, Feb 25, 2026 at 08:36:10AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/tuning: Apply windower hardware filtering setting on Xe3 and Xe3p
> URL   : https://patchwork.freedesktop.org/series/162104/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe_FULL -> xe-pw-162104v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks Shuicheng for the review.


Matt

> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> 
> Changes
> -------
> 
>   No changes found
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe -> xe-pw-162104v1
> 
>   IGT_8769: 8769
>   xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe: 4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe
>   xe-pw-162104v1: 162104v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162104v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
