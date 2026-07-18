Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFD8C44520
	for <intel-xe@archiver.kernel.org>; Sat, 18 Jul 2026 01:45:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2FE10E18A;
	Sat, 18 Jul 2026 01:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nnswpXvU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901D810E18A
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Jul 2026 01:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784339100; x=1815875100;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=9xK61pD4P1hMHfpSn11QfSASRB+OnNF5u0wklTX7CRY=;
 b=nnswpXvUrRn5WG7IQik/Ip3b/6xV8IdTaxXyd1Q9DcJCC7jW2tP9jm0h
 hoZ4bWYUYqflapxaU+mdwlEIosi6SnpvOWoLF8qqPQFPPuA4zSYU2e+nK
 YUqdsxCZhybq/xLdO5UyHfKF8fjwnZJDOXtbF2feinRie8CnZNHz6PYRy
 NP0gEq4YPogbswEpN23m3QnS/8y74tfTrGZ4vKPNEs67p5vD48evgp7c4
 q8CjFQf6C0rBJzZimgX/xRiICp6k6lQz4rA9H6staJWjxKMrZRo4UxnZU
 Zf+tczvcQEXcqYQxb5+rxS41kJ+36sX45tWN9wFhAQyxjCh10FdJ83u1Q Q==;
X-CSE-ConnectionGUID: +p7szG+jTEWs/9wlwDDy6A==
X-CSE-MsgGUID: bclTVN3VQg6pyp8HHiRnzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="110561770"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; d="scan'208";a="110561770"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 18:44:59 -0700
X-CSE-ConnectionGUID: IxA+clIJTIGRME/r9Q1GJQ==
X-CSE-MsgGUID: +1oRoLRgQM6Ty/QHZvLlng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; d="scan'208";a="257014261"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 18:45:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 17 Jul 2026 18:44:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 17 Jul 2026 18:44:59 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.57)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 17 Jul 2026 18:44:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCmNNg/62/PFaWDOggly+CTxcF+Jnf9DI7pB0gxnBdaG3tHsF8CRwsZVXCF6nInbH594+kOp7EPkT4P8BUPk+boCYSJKr9H9tSg3gU5zOiXztFtYAHw7kSm8IK1Cn0a6ts+PTDp67bYv+K6w5f+fNoBox92TR87/u+1aCgiWxvc6YodthLfLTfpJ750WEcfP4aenBQwGHup6WKUqxdSD//4bFSKxngnVjESQ3waslVZ/rJIIClM+lFgyty75/kH3WjSFHlwJGLZfjXspH/U5KG706t1to4Jua60YAXcSBMXZTLWKcoH3K24EzSiFjm3lltqb0k8cuPpLfLYb5ZuZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNF1/A3tvDkE8yoaeGzJH7BFlFKUmFwCH/LqjP+83zQ=;
 b=P0fx8XbZebFUreAYhAXq2GJVF0QRQc1j+Jxw4dCZHld6o6L1E+Px5VSGywFjeO1kWQqMnvhHwdWn1stt86EoVNymUdY2cZb2nZPIZmscj3GEEb83KyObe4BCc3R4S6wo0pmsXkhcsy68MnqRxmUZKnhznqhUXJ4mtqIYzxU2YMAXo+/9hk2sEIy2hRpia1GhgKeohjVjDukoR5biy4iYyb80I13o2Y22hvdvfGH4smbRgcVx+1ROTEhuvzpu6nHKMuyiZ+ABU+aM6C5rVGL0IlMeeixxwb4HiD6ojSUYl0dN84seaVhhONTHp7bs0jn3UbWUO0M8ivTUtOa38+HcbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB4803.namprd11.prod.outlook.com (2603:10b6:303:95::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Sat, 18 Jul
 2026 01:44:55 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0223.011; Sat, 18 Jul 2026
 01:44:55 +0000
Date: Fri, 17 Jul 2026 18:44:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/xe3p_lpg: Program TR_PTA_MODE (rev2)
Message-ID: <20260718014453.GD2327163@mdroper-desk1.amr.corp.intel.com>
References: <20260716-tr_pta_mode-v2-1-e4cd50da1c94@intel.com>
 <178425291852.199042.14339970392657570408@6beec6c84f66>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178425291852.199042.14339970392657570408@6beec6c84f66>
X-ClientProxiedBy: SJ0PR13CA0232.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB4803:EE_
X-MS-Office365-Filtering-Correlation-Id: 791dadcf-2aad-443d-726f-08dee46e2b33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|11063799006|5023799004|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xdCNdFIYYv8IH/5lEyBf9OGRa1TmmBdzQe55Vw/NrNdC7OEPkeOI9qcNo1REXB3NlCHYGQugSc3t3G4xDhd+j+Urg803jOq1mcc2sHBNTBAH+tNJEL6HvD8lECFFLMF65Nxcy6UXlY9QhBz6zQShjyAutcHvorjNuDiYv3kCFBLHHL+zbo8sJcisTyqMOTWte1wzdgD5NlbJ5JNY+5pKPdR7bSvm1ALeSSBZpF/3XkZS+thO+TkXBLBRuGvZMp3ZqKWbQnhMBMmPgDEqNRu2kjylGpchMjiAGZlozwhOl/AbCUzH39Xteozqy6n2bsk2jJy/pv9sR0KW77+pwTcG731mhBktvz0OWPcWm5xC/jh0mEftzc8iRlOT9LjRxSIj7t5/dtO4fbK6AjzX5/o+xLo17ewezbrBJbNU8rzCTb1l7KeCBUci/ALiNP11BcM7bEEgeExizFCxdrbSPjCdPoUy2mmUqSsAs5kSf37p7gZtTc8Am8ey0U91jLe5wx4IEMq6hzYRzrtJJFZJHUYTcI41pxy3wcTwrBVy45NMmprSH3LXgBazIa4UhaU0Jt3xfGk6860r4xdyIGnqyArnKkhdiP8asXV17telQnIN3n7C4Wf0ufa95TTNMFpCzbYU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(11063799006)(5023799004)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qHwarXAPGdUy0xUXTZdhaE8ns/ldhD0NCEPkePzVvy0FCz0A4WZaUKf7CfL9?=
 =?us-ascii?Q?4MEwl7X7c3YXgvFCr4Nled3cVTR0ZdV/KZhOUPmmXBQvH0Kd0LZ0PdoQT4Bj?=
 =?us-ascii?Q?bvG9WihTtwu7M4GZuyOOj2DYRKvOZWTvviQS9vjMEGWjwklGs0vSbvvirZJr?=
 =?us-ascii?Q?a45CPVcAcc5fZTzEbGRiPa4G6ujHMY8zn/AeCf1dBWaaethFn3dQ2E3LVLjk?=
 =?us-ascii?Q?Vnn6yXAPtVgWvB+m+v7Co3n1xbGaUieDxFuw7Dq7AVlJI+azy4et0oP4QLKn?=
 =?us-ascii?Q?sFz/HebwSNR8aEJHe2XPAVj+UzK4kCXnDY1yr+xr4rSdV90Ozb1TKtxihs7r?=
 =?us-ascii?Q?PiP//nIuQVlKKEhBjN7ZlasHLH/7W/4xDsL8P+CDf8Z1wKai9U3vRswuojPP?=
 =?us-ascii?Q?LtIiYqZt4HnDjpm27DKDFTzb2JY5sr/LRsh48SoqgP9bbjh8SG+/um4DLyGd?=
 =?us-ascii?Q?d0S0+W5c4eKO+DmvHeFtDMfp6QJr+itdMIncYg+s2j8VOb9RE6T5rA9YYrsm?=
 =?us-ascii?Q?cVS4uwj3/869//keB0cyAU6YLZUsk5MesdaddDmd73GW1E2+pAly2NHlUCth?=
 =?us-ascii?Q?dHFm2mPnTbtk4YyWEOyJll4W+th1O1zrgKSjXNsbQtaMb42Pqyjm4SgecA6x?=
 =?us-ascii?Q?giutSjKnCyKMrKZkVtEqBHRPgMjArTAZRvijaZhn2HyyJfxZqldpGTFtK+D1?=
 =?us-ascii?Q?O82CJ307E3TIpS4a7MJEc9AoNOCz3fQZuZCdY9UZ7jTFO43SCz/S0tBFl6Rq?=
 =?us-ascii?Q?+gHsqtQDc+VioOuuHB9KEyllS2vYrRmH7ubbqAzfExEX6OyOoPfb0LLDr5dk?=
 =?us-ascii?Q?P4SZxgj+Pll9H/u+OpD2J7xFQ6hA6f3uwvUsE3OuBgx/Grf4HlMYDBgYFKpr?=
 =?us-ascii?Q?LZ49m6ejH+DaL7GLf8boHfvK55Zp65DE0CfwOlakRXM+V7vd5zrRGHYtbDz+?=
 =?us-ascii?Q?WM1sa2dRLlwrYe2PLbk4pzcdhw60VwHWbFz5UrSnKA9Thi0iV1UAZaHfiGBL?=
 =?us-ascii?Q?QMXEBmWYydR1TeIZOWRa4qu1c8QM57eZ+DF38pEGAvQZWs231ozhIAiTey0d?=
 =?us-ascii?Q?DIVw1pWeXIkyFh/MXl6dQdjyZoUraCoA6cV1zd/O8aY0Ho+e3IvH9yK34X9q?=
 =?us-ascii?Q?K0alfnjiWu5z86891vavIXS4bX3qTxoVYZQ7x2VNd8ntCp3aCoiri1X73427?=
 =?us-ascii?Q?4jnad1XnM0gmzs75DK/geSavTn1hr6KbS+UvsO3S54D77wewsap4qD+M4j5j?=
 =?us-ascii?Q?WbHsHTPvacG1qKqIGmUHNorw1yiA9lG45Cn+dh5S3XVud4XnWHBU+229h1Kc?=
 =?us-ascii?Q?8wAltoJTX+qbgg++BbnT+QqzF0EPRVSgcTkH3dNs5Ncg1N0lnvbeG2wbDkUD?=
 =?us-ascii?Q?XOp359Q1rs+shs2eftDZMQca+dwyVwjjaI7v5F6dcPT8Wgimbl9XHVYC+LxZ?=
 =?us-ascii?Q?PG40n6Nbir3EbgohQF//d4r9PbUiLRN7OtdpPlr7USy8StLKhKtQilKmCO+A?=
 =?us-ascii?Q?axVBQVerGUWRwyarGrY2aIVpKiuzyVua1rOqC4EEGAZXwIqOj1FxpL9edtYI?=
 =?us-ascii?Q?th+3g5Bi1FJZp4zjQrlYbKAFpQ6TMDf7z8mzeZ3l3uPPpCU8NgpC3xe/7FDy?=
 =?us-ascii?Q?x5ZOYjk0TVBLvRWHY2UhWLO+0B/hq1i9SWzHmNk9pY9ZPN4teXRj4zEoQWu5?=
 =?us-ascii?Q?T7YND5OoaocHM65a8juE53/lOuTsFzxJlE8H0SlwcCvFRzes+WorbczcmKvw?=
 =?us-ascii?Q?0GR1cjBTJmVaW/yBuYMJ3Got+XbFCBU=3D?=
X-Exchange-RoutingPolicyChecked: C569HkxEW5DM9IiOauSUb2ifsuVy6nPJNDh770q3MNiFlqGqVafkfhMAyBt1E70FqES8i2ujwhv9YiA3Iof0J5BlPgty2+NYYTQxhG4tCpLYgsnJA0XZjkTbMVzCKk4SHp25sI3bPOKqQR3X0l35/d/Fj6A21NBCM9gK35zPvke9emIMHzLIc0RkVmastnV2cjICYM9E2IEHyuzKDprLBGzgmJR7AS6+gsL9ndeKBDKryGQhmMQ0KZVSBwzVuC6P+1+Q1oy2V/OTSTT0Y/MyqJydlZxLNlN/Y32TlKgoSBxnH+nQatHX6AxRZqtd74CRIqwq3MbroPYuUbWpZmg/EA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 791dadcf-2aad-443d-726f-08dee46e2b33
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 01:44:55.7297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCO5qQi+Wf1X3hYpauZoxzJS/hEurlOpqAA0Prd+/A8+nQahSbEGzSjObI+wVweaKQes8DJzqgveZoxB1Z2C15ZFMuRT7MOEwJnQ9iM5Ft4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4803
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

On Fri, Jul 17, 2026 at 01:48:38AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe3p_lpg: Program TR_PTA_MODE (rev2)
> URL   : https://patchwork.freedesktop.org/series/170444/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319_FULL -> xe-pw-170444v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-170444v2_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-170444v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-170444v2_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_content_protection@atomic-hdcp14:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-2/igt@kms_content_protection@atomic-hdcp14.html

Incomplete with no errors in the logs.  But the Xe3p change here
wouldn't impact BMG display tests, so unrelated.

> 
>   * igt@kms_setmode@basic:
>     - shard-bmg:          [PASS][2] -> [FAIL][3] +1 other test fail
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319/shard-bmg-10/igt@kms_setmode@basic.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-4/igt@kms_setmode@basic.html
> 

https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8618


Applied to drm-xe-next.  Thanks Gustavo for the review.


Matt

>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-170444v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@device_reset@unbind-reset-rebind:
>     - shard-bmg:          [PASS][4] -> [ABORT][5] ([Intel XE#8007]) +2 other tests abort
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319/shard-bmg-4/igt@device_reset@unbind-reset-rebind.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-1/igt@device_reset@unbind-reset-rebind.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2327]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2328] / [Intel XE#7367])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +6 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#367])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#367])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#8365])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +7 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#2887])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#7358]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@kms_chamelium_color_pipeline@plane-lut1d.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2252]) +4 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#373])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2390] / [Intel XE#6974])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-4/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x10:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2320])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2321] / [Intel XE#7355])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2286] / [Intel XE#6035]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1508])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#4354] / [Intel XE#7450])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#8265]) +2 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1138] / [Intel XE#7344])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1421])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][26] -> [FAIL][27] ([Intel XE#3098]) +1 other test fail
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [PASS][28] -> [FAIL][29] ([Intel XE#301]) +1 other test fail
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7179])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-10/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2311]) +31 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#4141]) +5 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#656] / [Intel XE#7905]) +2 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#6312] / [Intel XE#651])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7399])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2313]) +27 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#7865]) +2 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#7905]) +4 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7061]) +3 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#7061]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2486])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-4/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7283]) +4 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#3309] / [Intel XE#7368])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2505] / [Intel XE#7447])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_pm_rpm@package-g7:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#6814] / [Intel XE#7428])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-4/igt@kms_pm_rpm@package-g7.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#4608])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#4608] / [Intel XE#7304])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html
> 
>   * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#1489]) +2 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2387] / [Intel XE#7429])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-move:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2413])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full.html
> 
>   * igt@kms_sharpness_filter@filter-scaler-downscale:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#6503])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-4/igt@kms_sharpness_filter@filter-scaler-downscale.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#1499])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@kms_vrr@flip-suspend.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1499])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-bmg:          [PASS][60] -> [INCOMPLETE][61] ([Intel XE#6321] / [Intel XE#8355])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-large-external-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@xe_evict@evict-large-external-cm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][63] ([Intel XE#6321] / [Intel XE#8355])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-small-multi-queue-priority-cm:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#8370])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-4/igt@xe_evict@evict-small-multi-queue-priority-cm.html
> 
>   * igt@xe_exec_balancer@virtual-all-active:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#7482]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@xe_exec_balancer@virtual-all-active.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-defer-bind:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#8374]) +1 other test skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#8374]) +5 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-4/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#8364]) +3 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate.html
> 
>   * igt@xe_exec_multi_queue@two-queues-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#8364]) +17 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-userptr.html
> 
>   * igt@xe_exec_reset@long-spin-reuse-many-preempt-threads:
>     - shard-bmg:          NOTRUN -> [FAIL][71] ([Intel XE#7850])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-4/igt@xe_exec_reset@long-spin-reuse-many-preempt-threads.html
> 
>   * igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#8369])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#8378])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#8378]) +5 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html
> 
>   * igt@xe_multigpu_svm@mgpu-latency-copy-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#6964])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html
> 
>   * igt@xe_page_reclaim@pat-index-xd:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#7793])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@xe_page_reclaim@pat-index-xd.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-lnl-2/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pxp@display-black-pxp-fb:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-3/igt@xe_pxp@display-black-pxp-fb.html
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#944])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-4/igt@xe_query@multigpu-query-gt-list.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
>     - shard-bmg:          [ABORT][80] ([Intel XE#8007]) -> [PASS][81] +2 other tests pass
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][82] ([Intel XE#3544]) -> [SKIP][83] ([Intel XE#3374] / [Intel XE#3544])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
>   [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
>   [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
>   [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
>   [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
>   [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
>   [Intel XE#7450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7450
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
>   [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
>   [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
>   [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
>   [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
>   [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
>   [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319 -> xe-pw-170444v2
> 
>   IGT_9010: 17413fe8bc1c3c9418d3d2359fc16531927ab42e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319: 0fcee361fa4cf13207af78b95e71bbbaeb046319
>   xe-pw-170444v2: 170444v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170444v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
