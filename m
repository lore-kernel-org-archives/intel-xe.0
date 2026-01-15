Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402D7D44C63
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jan 2026 15:24:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E1D10E122;
	Thu, 15 Jan 2026 15:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AGK0VcPr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C51A10E122
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jan 2026 15:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768490668; x=1800026668;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=YoEEMDHVzTErptgLsRD+cHPB8i2SqVG9AtkfEfERdxU=;
 b=AGK0VcPrr7X25l2WqRMKTLXEDrbJ7AMal6C6kfVfNMHq44jReh7AGiK9
 ORH4aC2ki6/xy/5DWZRxn8ny8PnT+2GHsns69Sw7G0OGgFvH8WjiwZOd4
 6iekMwLt9wzhKHMgWjRxyZf8lyks4bXrxF7qFcx3Yvp6+6wqfl3IU2Rrf
 uU9KMCKnayK7yv9AS4s6dm4JbI5/vE2qKX985zPCtbP+t1ksbrZxX/3Ig
 UnCCSmV4pM8clp71nDpCh64XrhGTAx4M0FezcXGXaZt93EBNXb2KZu1uA
 ezMuIAOr89vAmRTofIeMc+9TwskaS9SqlQig0ndZJrht0nuVuz4fnR0hM A==;
X-CSE-ConnectionGUID: 8/jI0706RcC29C9ss33ZrA==
X-CSE-MsgGUID: Me71ZC6mRSCMCdEfVyCQfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73650447"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="73650447"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 07:24:25 -0800
X-CSE-ConnectionGUID: O831Za+/TgaOITVt2UeLVw==
X-CSE-MsgGUID: 1BUIqrssRpufr/yVZZzWpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="228053093"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 07:24:24 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 07:24:24 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 07:24:24 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 07:24:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DllYjVjSRE2rl/e+WIV9J3UbBpiT/JzvAhThCvK1ezQvq+5IN0989zWD/KfTN6CU1ReVjxdT9GnhhLD0i48G1P5Lgozwni7f+M1Kv078JOfGwbhL4bKDn74rp5e4Qc6WPXQ8ca/DNC20Kdi8u+WItihjNiTkYsI7vDMzWCU7nE84wdmW9/qiTdflxGGqYHhdFUNhR4zmbLfe9Wi7wLJf/RD8WEZ1NQs7XfcPyaIEy1R7uF4yRlm00GBfl/AmEcOHXBJOutkHl4oQPvZtIUBw77Fjl8oR8h0ENXYZc4Ks/WXE+kablbddETGaN77gjMwmLLy6ne1v3uygKnlHT8JKOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zwo3AwAczAWXwLXysqUJjPIDtun9jQhx10/j7BO7EqU=;
 b=oGoCqyi/ny7lGF5QM51AdfQtRGtBU6NY9Ewm7D11j02s4S5rDKvmQMM6svOhCt27iZkuHsod7N8+wCF5snhSK7u3v9VxEAgJwIPndwzlpiw7FzW1hTY1G9e3MxtIXg9fvrooG+0CEGqYGjnQa5xittk++fBZz2vu4rYRhSumwQG8wBn6M37rlsQAbvUehxJFz1w3hnStdvpOeK8e0SNjPbLzic07CMhvtBeGW/TKA0clClUcP1BBxuQnMg2TPihrToXtt/IElOu0Y7AqPQC7Q4RZ9ecv937Vww/kvlHJMUGNXQ0yPpInMIgQ0A3G650Z0fqaWNH4x1k04FY+XB2/Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS4PPF0BAC23327.namprd11.prod.outlook.com (2603:10b6:f:fc02::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 15:24:21 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9520.003; Thu, 15 Jan 2026
 15:24:21 +0000
Date: Thu, 15 Jan 2026 07:24:18 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 drm/xe: Cleanup unused header includes
Message-ID: <20260115152418.GH458797@mdroper-desk1.amr.corp.intel.com>
References: <20260115032803.4067824-2-matthew.d.roper@intel.com>
 <176846008541.156800.4819829565681830479@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176846008541.156800.4819829565681830479@a3b018990fe9>
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS4PPF0BAC23327:EE_
X-MS-Office365-Filtering-Correlation-Id: 071e17ca-01d8-4f93-20a5-08de544a27e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?peBXXFm0PlDozskIDXrel6G/IyjhPx8aZpt5NhOLl3d45TD2ugeDWxwTAR4H?=
 =?us-ascii?Q?jNPi8tHLKeFeSiXClbaxCFwHxTjXiJ3uzu5smBgODcwVRuQ5/d/U7djgndyz?=
 =?us-ascii?Q?omsK6DyLGa9d4eggAy3Y0X7VlF2/1xeVvx3IXgq9XfhTBXH7DcGUn5OmieD8?=
 =?us-ascii?Q?Mg5Hl3iqa/BwMD292Pesy+BBrb+6UNDfEBlsfaV04cOh7HBg5Hjo/xe5Wcrq?=
 =?us-ascii?Q?jDbQwVxlvKgK8IAjmpVJtTFhWGuKogHcp6UYiuoYJmPdhL/HsQh3JZLRqiFt?=
 =?us-ascii?Q?wlSP+pNBzzpVSOXVWhh/D48Iowu+jROFm+t0bK75xUFdpYuTnSYGmbhyJj8R?=
 =?us-ascii?Q?nN1gG4s+eu9dGUR/90qp/9sqDivFeVdES4zGDEFRfwjZi31vGx6dvUbUmF3w?=
 =?us-ascii?Q?Q11QBrSCYwXFpu3ady7ZGoMqippJYqAeQxy5+lmuwUVCN30fgnPD/YOjTfCi?=
 =?us-ascii?Q?ntInrpMxQWZZOFP1hk77mHzVjnXHAyk+OJx77QeTToqI2sNoE2c35+FO7pCt?=
 =?us-ascii?Q?2//ahgYXiw8wbKSUvcDKBpt9XcgtnrO2b3Q7G2oHOO1V8E8VYSqN84PDzOZl?=
 =?us-ascii?Q?zWUZ4ugx1v3LsydgP4rWQEeL+mbE5TbAzJh6vucuQ8T4vpcIzgZnz+5SE8dd?=
 =?us-ascii?Q?D0RFOmLIQiCs20tmTUc8djPrAlLq5shx/1K5ifPg5WjSFDw3Yr1wYtqVzF6k?=
 =?us-ascii?Q?hbwM/QlOYh6Te0ijpPQUMXA6FLfLwI77SN61gFFVPYIPFQh6zK5OyEu71a4q?=
 =?us-ascii?Q?tNKqyMWpfgShyQLa/3rmhreTdjaHaFY780H8UxC/zbK3RD/35WIN856+Y7C4?=
 =?us-ascii?Q?nkEv6ADXnkh2WazqPNU7sVVbWJsqHSP+gLxuGCCebBtseV0DI+xLkRAtgMRB?=
 =?us-ascii?Q?d+mu0xFT17Ry3RF8N3MfdD10/UiLbBAC+BnI8ZJ1Y5vWaOz40I14Xz68JObT?=
 =?us-ascii?Q?CnNxdG0Wn9Yk5dQjhhgWH2EjaG+ncRxb122YO4vik9WexkdEibg6FfiTlfml?=
 =?us-ascii?Q?cyj78Fi4D0ze5rk+1IwVDHADr19DNDgZbFLgnhND3Phw838GuvXeMoDewFjX?=
 =?us-ascii?Q?9qEjUKiCN9MvlIkTShu+TbyaBWak8P5vzWy49Bz4WpcMdsOLVoQDYhRQOkaV?=
 =?us-ascii?Q?4t9DnauJH/gTV62bT3hlDx30l9eRzgNO9sbOgV2JPAMj6Qpp+Vx+2l8gcFXj?=
 =?us-ascii?Q?YiSqG5MYzfAsXKMjDvgBlNn0x8NlQ++rbJYoZmEN4gs8k8RgP0403CcmYrqy?=
 =?us-ascii?Q?42V0Kk09eQA+jzam6IsBmybGcO9pOtY47UpIeYnT0e3xGEtHMRtfXyDsuV90?=
 =?us-ascii?Q?NBXp8pZqo5t1bSczfAcbjwVQD6IrdMCMCpgOZ7jrnHOETTX6Kuz3pK30oZmz?=
 =?us-ascii?Q?sJAW/TLrz78vamRu+TMGKv/p7OutdI6UaAhHkSCxTDmd7YXkJJp71bb5bYSt?=
 =?us-ascii?Q?Lo078TJxxy+rQzckXrotrmzv9TQk2oqYP0aPWzarcsX/la/mL5vZX7VWPxnI?=
 =?us-ascii?Q?6kaamaE9k/HR3DQT39ftzcMKSj8thkCHnd5o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/dNeCUIjKmJCOap0oJnR2SQnQ16D3VASMAvQmG86+mUMHqHYgyly+jjJHWbY?=
 =?us-ascii?Q?B6B+Ot3Y/Yt7OEktrN6NwOhu+3+BC4BRZZPibfnoVxjMHfj33fhdeyEHXtyM?=
 =?us-ascii?Q?DYGHk7Y2+Qpos0o88bBKpN0VNGcKWznN1BzVAZCqmOmVWRR2fDDQqqzt8WEa?=
 =?us-ascii?Q?FJyfdfzDF80rLyESkxM4AqE4J54gF2TvIKlk2Xaa73JxJou+GonqSAv1hfbd?=
 =?us-ascii?Q?9B5yISDmVy1bv4mWqJLSENDHdY1C9lv8KTraLlvM5mAon2RVveE7orOKcjrd?=
 =?us-ascii?Q?fbErm1en5wLRB0hGJpbqp6gEqtDZQg+HUVG3GZtmKsYdOQbDaVzp1I57060/?=
 =?us-ascii?Q?+ZkixF4SZzXQtpoZAdASom77DP4kQkryojR4nDPPqSqO/p4gAiR7NAeWHaGZ?=
 =?us-ascii?Q?hbEQ7LeiMg+c7cV737Mn1q8MMgfJLgkOJM46zCZG7wv9Ee6MqwgwvVwiqpRk?=
 =?us-ascii?Q?eA06ofjztQL6j5ix/rsd7XvCFtn15kAfZMN2HX/mlNjyrsi1x8TM6wxI6ul6?=
 =?us-ascii?Q?IoGIaxTJU/39jLXE2x9+v6PPlu13JkpmLbhw0W1uzDd/t8sXyDztyJWZu++2?=
 =?us-ascii?Q?7XlffQt38Tk6+AA1xHogqr9pKGIFGmQ3GZmuqVkJTMu92b27avs189/bn6lJ?=
 =?us-ascii?Q?uhxJYxbBo3j3dSnesI9nePC8h7x2iXQ128zlR3G9UrDInykGKmVJU2pwp3r9?=
 =?us-ascii?Q?YU6sPoNmgQxUXxQH1fq64iC375QerOwnCmLIKtYotEraxMRWVmY47zQovxXJ?=
 =?us-ascii?Q?XF0Q92FClK6GmwMvNYjA8Wh/u+XAm+0LZJxVlnt6KF3vsdSEIuuvysLMMLEZ?=
 =?us-ascii?Q?dkjeSFw8/nt3JssC1+mp/TBSD3eDaGoPUPjf+lZomWECGfQWx+esLA6svfGb?=
 =?us-ascii?Q?VStnAPFkIAzW0l7lOpSUamuVTy4XxeCrqgJ09Zv48OBO2vK9ygJ0+IQJZifV?=
 =?us-ascii?Q?CbM33t7mD/9Y9lYYs0dPv61/R6nHqIkrirzc9s+8seRY1EbofSIDAEeLw1W8?=
 =?us-ascii?Q?eIEKk8qrDddWrB3pGrGMb23wOEcmbXTjkiu75A3hK8apkAqAuBWYueulED++?=
 =?us-ascii?Q?ZN/hgdB5nWejF1KzP0AM4zqt8MsPO9CDpvR4X06tykVgZtnQSYcbQb8r5S0d?=
 =?us-ascii?Q?jSMZidZDjto+hR4LsvQUq88bWZfUR2lwXyfkqpdK8kEPGaIYNQXWwoj6wQfp?=
 =?us-ascii?Q?mXCunXBJvauEWIvjOHRgBmyZM3YL/Tc4PMErZg+gVAy4ObT3rvz7nudvRj0a?=
 =?us-ascii?Q?K2dL8geJTxguB42OgPXa1QS77ljgCObMk7DTkBLUpAcwLiJSVFmOsGqaoGjr?=
 =?us-ascii?Q?b275vVJL5Xl62MCbkS8UtqVI/ppX0oMj07KN2XMMxFxc0tfPeAHq1kDNfjb/?=
 =?us-ascii?Q?po+2TlUX2abt6yyvFpxOJC3pltUbTkD1kaurJ3yl8Y75DoQGgTS0Hx44JHdN?=
 =?us-ascii?Q?d2+2Q4hCg89q4ybn3L1CQpaO19z5cHWbdMVvhYn1XBVgfJiUbAM4X/DnsSJJ?=
 =?us-ascii?Q?8RWyLFCoafeoUD0ghlonbnvXxka8TAj3ZlBssn7AjgdDntEQ1SZzhqlJCRgE?=
 =?us-ascii?Q?wB4SqOd9Tx2cilrKrwurr0Hnu92a23IKgTvhvnrN3mSg+p8aHdX8QSCYbhvA?=
 =?us-ascii?Q?ngJdcLo5z/rlNQIpagD12308QUlEGPluXphvCSduyS1jRuex5QNy+KPFraeW?=
 =?us-ascii?Q?viW0Xh0FxXrAOllf/SSt4vPC7GXXOrUcBRthjPFBpmpHgD1U5WA5KQlswdmK?=
 =?us-ascii?Q?UUxhfaiYuvpNzNrTF4cj/2kBAMivj4c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 071e17ca-01d8-4f93-20a5-08de544a27e6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:24:20.8944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVbhQq70nurFJj1UQEC8dTwymHSfX1cLChERfLh1sqGh8DzIoA29Xm35+2hxew55A56lQVDISmrxJbpCLlYjombke7TZjh6obMCK75kr6/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF0BAC23327
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

On Thu, Jan 15, 2026 at 06:54:45AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Cleanup unused header includes
> URL   : https://patchwork.freedesktop.org/series/160118/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d_FULL -> xe-pw-160118v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-160118v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-160118v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-160118v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>     - shard-bmg:          NOTRUN -> [DMESG-FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

Unrelated failure.  This patch only changes compile-time header includes
and has no functional impact.

Applied to drm-xe-next.  Thanks for the review.


Matt

> 
>   
> #### Warnings ####
> 
>   * igt@xe_exec_system_allocator@process-many-mmap-file-mlock-nomemset:
>     - shard-lnl:          [DMESG-WARN][2] ([Intel XE#4537]) -> [DMESG-WARN][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d/shard-lnl-3/igt@xe_exec_system_allocator@process-many-mmap-file-mlock-nomemset.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-lnl-3/igt@xe_exec_system_allocator@process-many-mmap-file-mlock-nomemset.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-160118v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@hotreplug-lateclose:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#6779])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-2/igt@core_hotunplug@hotreplug-lateclose.html
> 
>   * igt@kms_3d@basic:
>     - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#6011])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-lnl-5/igt@kms_3d@basic.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2370])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1407])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-lnl-5/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#7059])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
>     - shard-lnl:          [PASS][9] -> [INCOMPLETE][10] ([Intel XE#5643])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d/shard-lnl-7/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-lnl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2327]) +2 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2328])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#610])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +9 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2314] / [Intel XE#2894])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#367]) +5 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +14 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#3432]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2724])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2325]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_frames@hdmi-aspect-ratio:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2252]) +9 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-bmg:          NOTRUN -> [FAIL][23] ([Intel XE#1178] / [Intel XE#3304]) +3 other tests fail
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-3/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][24] ([Intel XE#3304]) +1 other test fail
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2390] / [Intel XE#6974])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-0-hdcp14:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#6974]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2321])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2320]) +3 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#4331])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2244]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#776])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-7/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2373])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>     - shard-lnl:          [PASS][33] -> [FAIL][34] ([Intel XE#301])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [PASS][35] -> [FAIL][36] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2293] / [Intel XE#2380]) +5 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2293]) +5 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#651])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#656])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2311]) +30 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7061]) +6 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#4141]) +15 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2313]) +30 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:
>     - shard-bmg:          [PASS][45] -> [ABORT][46] ([Intel XE#6740]) +1 other test abort
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d/shard-bmg-2/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#4298])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#6911])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2925])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2501])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2486])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-2/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#5020])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#1406] / [Intel XE#1489]) +6 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#1406] / [Intel XE#2387]) +1 other test skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-pr-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#1406] / [Intel XE#6703]) +1 other test skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-2/igt@kms_psr@fbc-pr-dpms.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-move:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +13 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#1406] / [Intel XE#2414])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2330]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#3414] / [Intel XE#3904])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#1435])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_sharpness_filter@invalid-filter-with-scaler:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#6503]) +1 other test skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-scaler.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2426])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#1499])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@kms_vrr@flip-suspend.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2168])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-3/igt@kms_vrr@lobf.html
> 
>   * igt@xe_eudebug@vma-ufence:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#4837]) +6 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-7/igt@xe_eudebug@vma-ufence.html
> 
>   * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#4837] / [Intel XE#6665]) +4 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html
> 
>   * igt@xe_eudebug_online@pagefault-read-stress:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#6665] / [Intel XE#6681])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-7/igt@xe_eudebug_online@pagefault-read-stress.html
> 
>   * igt@xe_eudebug_sriov@deny-sriov:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#5793])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-2/igt@xe_eudebug_sriov@deny-sriov.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2322]) +9 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html
> 
>   * igt@xe_exec_multi_queue@two-queues-priority:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#6874]) +31 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html
> 
>   * igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#5007])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-2/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
>     - shard-lnl:          [PASS][73] -> [FAIL][74] ([Intel XE#5625])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
> 
>   * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-mlock:
>     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#6557] / [Intel XE#6703])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-mlock.html
> 
>   * igt@xe_exec_system_allocator@threads-many-stride-malloc-busy-nomemset:
>     - shard-bmg:          [PASS][76] -> [ABORT][77] ([Intel XE#3970])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-malloc-busy-nomemset.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-stride-malloc-busy-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#4943]) +22 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html
> 
>   * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#6964]) +2 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-3/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#1420])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2427] / [Intel XE#6953])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@xe_peer2peer@read.html
> 
>   * igt@xe_pm@d3cold-i2c:
>     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#5694])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-2/igt@xe_pm@d3cold-i2c.html
> 
>   * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
>     - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#4733]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#944]) +3 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-bmg:          NOTRUN -> [FAIL][85] ([Intel XE#5937])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>   * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
>     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#6703]) +81 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>     - shard-bmg:          [ABORT][87] ([Intel XE#5545]) -> [PASS][88] +1 other test pass
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][89] ([Intel XE#4459]) -> [PASS][90] +1 other test pass
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][91] ([Intel XE#6321]) -> [PASS][92]
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>   [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#5643]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643
>   [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
>   [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
>   [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
>   [Intel XE#6011]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
>   [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
>   [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
>   [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
>   [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d -> xe-pw-160118v1
> 
>   IGT_8701: 8701
>   xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d: 733664f1edf3c01cc68e6dd0bbdb135158a98a1d
>   xe-pw-160118v1: 160118v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160118v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
