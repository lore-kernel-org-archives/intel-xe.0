Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05086CF887F
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 22:05:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63DF10E08A;
	Thu, 20 Nov 2025 22:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VOeK6pcx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD7510E08A
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 22:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763676338; x=1795212338;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=whPwUfzTh/qKQx2cRmZkjAFSs/8Okl1m4ulDYTbWTJo=;
 b=VOeK6pcx2pEpPzRUCueeH8y7QkkijQDDE7XNfcf7bSwT8EdT8UMKLKTP
 L6i6zSZLswFRw3w3kAl3k/pPi2//hjE9FuGBdvC4TgmV9TsBf5QOu0quS
 77DSvIEuJOJC4wbuPiQ0To5ors6V1vj1q2os8ZkfafqKHMVjebpyXUGhr
 v5wNk+7KTNk/MOqOqfBhlueHyHAM5yqKHmm29uEstCcmhJOiVAEoCD1RO
 CCCRalLljyW1S5EEVPulWbUfoVBHH+Mg3yabAU06X0LQKdaNfE4eBFoiS
 K3eD8sug+SqAJLPRxfjI12AUmv5/feNiCMG8d/waDRFpTo1salnMnLTab g==;
X-CSE-ConnectionGUID: sg6v27x8SliFWfND6wLHLA==
X-CSE-MsgGUID: 4hfZSds6QqW5JXiRSCLniw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65801844"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65801844"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 14:05:38 -0800
X-CSE-ConnectionGUID: xfM8cXMzSPmGF/NbNY3fbQ==
X-CSE-MsgGUID: unep9Yt7QE+h3m6H9Ni/Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="191310827"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 14:05:38 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 14:05:37 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 14:05:37 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 14:05:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8hKc1HJrirZdIenlfvAZ6oq7kn+NaUQ7KgXl2m7U6ifqHLKznqL6AO1wM02RPHtVNgBnpUAKq1v/+CAzoiiN/JFmDr5t38ssg9Kb78aGFpm54vRihv7zXG+RxwGuWZ81zVNuOfOGb7erDjDexv+1InfZKYEhQjCoDZZgFZ/VgGaOZ1FSwK9M6DyheLakWf+0Mqos1MwM/ruuEFTnYY3GAUqfcSoyiKInkpV7FRtPHl5PG377qKMSIlmCbXShBe8a1NYTIaXEY3yktfRiWzPWmNikzPAfSwNbgOJdk49fAy7M7yfpytMBdk9d3UkAD+vVxAJWH1Ztl/qJRaxs0fbbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrnQfJHeTCf3Z2G9vn0BAO/fXBBtDWrk1p5AZIkwS4k=;
 b=bzBKz1e7QlZknEYFFnvF9jX3lzizwvLEm62xzhmu+CqwOr0HvJZ1lqptLZfaKRebea1HLu1p9rRqZdGSuFhMdPg9xwOfU4lAFhaJV/wHffBW9F/rGjhKc5wRz+0Q0usgB1yonsN5WW9N1eP0njrBCJq5opuzO57qUW8abCjoZcyCwcvHF3fivAXHIoeBIF6h7F9bu+AZI4O82J45fHMKHLjQcPB8chz2YkJ9UfbS8NjrjccF562zZ/oKpkSxZar/95iUwmTa1sxcy/u8w9UydEVCayaBTjrinHuV6A9aoFuYRYzesqotsnL/5wxoXI9UPWH99xtxHM7I2lTspukYFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB5280.namprd11.prod.outlook.com (2603:10b6:5:38b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 22:05:34 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 22:05:34 +0000
Date: Thu, 20 Nov 2025 14:05:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVy?=
 =?utf-8?Q?e_for_series_starting_with_=5Bv2=2C1=2F2?= =?utf-8?Q?=5D?= drm/xe:
 Track pre-production workaround support (rev2)
Message-ID: <20251120220532.GK4063759@mdroper-desk1.amr.corp.intel.com>
References: <20251119220459.3997343-3-matthew.d.roper@intel.com>
 <176367328063.15649.16251382227788014258@a3b018990fe9>
 <20251120211828.GI4063759@mdroper-desk1.amr.corp.intel.com>
 <4c89c31e-54ca-45b9-a8ef-081048f2591a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4c89c31e-54ca-45b9-a8ef-081048f2591a@intel.com>
X-ClientProxiedBy: BYAPR06CA0030.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::43) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB5280:EE_
X-MS-Office365-Filtering-Correlation-Id: 573dda89-cd2d-4d18-3da3-08de2880ede9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H10Uh5FtR0y3I05qjY8+e/BzQsblH86FR6+I1iZ8bdjpRbPl66dU3CLu5pAR?=
 =?us-ascii?Q?7wsbilyNd4n0WK8POZCFXdbxl5tC2LceDqpFRJmgsnRN/qBw1P/0JQlgwqrL?=
 =?us-ascii?Q?bqmYFweSFJP5R7OHhD2AwmB+SiygQcDsgM4gSTZgb5R0fmU8WmsGNzFUldDu?=
 =?us-ascii?Q?5h/2thtyP/4kTQACr8o5D7G0ygCTboqC4EhopKAqbwm1LtvHmBvqBHHSy3k6?=
 =?us-ascii?Q?8mR6NYLCZtQoUK2R029tWbNb3UykRrIRfjboOCYTBv78crq+KffDoZ6mGTYD?=
 =?us-ascii?Q?u33fSFO83dH4IynP8RWLEnEg/cS8JSLT6PNdmLExQjEPNCIhNbhuReJhPrcP?=
 =?us-ascii?Q?OrkCxEO/2Fm/dTLgNKWjpAfOtl7sEAo4ZZpjfQjEFdHLPG/1FN/H6EXV29QN?=
 =?us-ascii?Q?OMIY5khYSfYIXrOQk0CPiFXrbQ+dqTgbqcauPerlWX0pOGAOcJ6MBggDFVcJ?=
 =?us-ascii?Q?hqLwSIkHhZjyj/EG1wbDmkDOycxtsaqVNC7jpfZv6Bb5GYjNGU5kagUCyiW6?=
 =?us-ascii?Q?qXAwgFcD5Iy7aUhnDPq7atlO7GE8N6aKTY3QGUKC2wkxwN9G7yZl26/bgqNK?=
 =?us-ascii?Q?sZbzmstWo3n+8T2gqvxQgAcMO+sgoqQTc25vH8AqYcetpGIYr8daRNl8ZdlG?=
 =?us-ascii?Q?iwL6bW1Iv6KPU/FVhPSJLCzkRyAc9OCpyAy2/3XjIimDsYzF0Wtk2AikweG7?=
 =?us-ascii?Q?MxqHhY6IbicVCsf9UwYDhb84jTKaVhHOpDDVH9Sef5S3/gYhyZheWVrVMtb8?=
 =?us-ascii?Q?eagvjRhYu/N3HqvLVluqchgHmheKxUlkaTpBYG+Fec4JonMoBgAqNGVV/83I?=
 =?us-ascii?Q?ru2wDcnq7PQw419UFAiQoPL3MGoa3xlff6mfcI5V88FaekgeE2unZuxktugC?=
 =?us-ascii?Q?MrlX6VJAvoe5nV+upJCduHI+pFRNtUlnK78CtT0EJaNIGl2b2JTwB6NqzRo+?=
 =?us-ascii?Q?V9D7MxWLNIhnyCzaldd8Q4IdKgtKN1L8FwQ4OgRldLKNhNsN1M3klkUslG4u?=
 =?us-ascii?Q?0VZLEclgq7XIZPfWD0LOE0nAjsy+AjTckvvW9/My0yLAOXbRuTuz1EfzGklI?=
 =?us-ascii?Q?ycbuI3POTmCSDSDCWdbq+6vnVwYSOtip7JvvnmvcKwRzFc0r5TZccbEQROiY?=
 =?us-ascii?Q?4/6J2kCGSInDn94o5r6Ap0GA46BoONnhcwFesRKImlINSP7hdOe9OqzjDJHZ?=
 =?us-ascii?Q?WKMYTmU+GL7ggE5jCvT3aEnBzXT2dfx4uSLNJYYjEaUy9W2Pxncd6/Z/i8vX?=
 =?us-ascii?Q?ER1uGptJIkmiQNc8BN/vrqaQ5MTtybZctNveJEILWHeDxEv7N6x6jOCckZdT?=
 =?us-ascii?Q?y2HNz5tfq5BdFrDX8ZEdOLi3LLm7/6ML1GcPmdwBBHKsY6U4FinFxYbo0Ewm?=
 =?us-ascii?Q?G/t+a1CCfzOYYLicBy1RR/X45x4MpVHBnFqaUCPogK/dCMbaRX3EKnnBKAW9?=
 =?us-ascii?Q?rEcpxFj754Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UPof5FtSrf4PR74IoNA5FAhWN4ddmw3NGEvqqg1+afDckd2kje/EasJwSfek?=
 =?us-ascii?Q?klgMY/R2eF0VDQAYuziHpzYWEchSNB5XOEW2JQy9pORD41E6bR6TA9o65Jzn?=
 =?us-ascii?Q?ZcrW2aTZI39uEiMxTKPEHSUp0MpnM96cdYK/53/zQgImLbr3FPzbMXs6Ss67?=
 =?us-ascii?Q?I1b1XHBFQHjsb6ek/xh2S8FjKCgdiJFA2+inIrzplvsALfbDcd7ww3ZrcOVk?=
 =?us-ascii?Q?ui1tcvHgN2OYp4D6CHYPx2dBK7ZyxxyLKt4q4wXxSFMkPaFIps8xjhxLrm3F?=
 =?us-ascii?Q?hPpN4DUHMlIbWap90p1HhEtafHXs+QB02LXrHuxO7BY2aUvX/MoycGPjt+ja?=
 =?us-ascii?Q?Iv3yjAMKq1QKE9r8n9k73im3Ida1Ikg2OLkxvbaknmLuQ0zMflQCGTgGnhbp?=
 =?us-ascii?Q?WzJFhYnRCp4e0cu5lsIb7QIVnEjfin0BfNSUTucjgj6ve3qiECxEBHKjMXOw?=
 =?us-ascii?Q?iIwftxNou+Fq7pVqJX5v7EYqHYbbO8t8sNsMjqp9zngX1fgdCyZBqn3cQ3QP?=
 =?us-ascii?Q?DlyE0B/H145/ikc1HtUXtH+fSrqi04ygR39cYQCV5TQ0oOZBzNILFaQ193D6?=
 =?us-ascii?Q?CR5mzqxaPcB4J23IOlXIKlFmdDSepve9dDWiFCn1XfEXHuvm7i++R04rExI+?=
 =?us-ascii?Q?qFYfvWrrDAnoVyc8oOkURFMF+qKVTA38wWaH4gP7zMQT0vVNr3dSydHuTofp?=
 =?us-ascii?Q?m0qxFDZo3x8nFvFTkQsk38bvZY5CDaU8kdYTIvqQloIXLbc1GX2I/QqyE2oU?=
 =?us-ascii?Q?lHyypqpVZWeq3z63crwzLF60c17/CAVy9vzwYuG4aPvqrH80OMqqwpp173dG?=
 =?us-ascii?Q?KBc9Rst6Jy03YbrVQHNFLaIM6XUfvLd1a+j9lItXGL+Fo30I7TQvNnL158R4?=
 =?us-ascii?Q?LoIDC8Z/pA4hcHlpI1Rfuv2+URRMpW82hk9eRL3teqwYblZXuVCVE5Cl9H/c?=
 =?us-ascii?Q?LP4LkGJ7YcZsR6o8rZrtY6dq5M4eFW9SHySclN1pOjNIagJ5BTI8Wf9CDV9o?=
 =?us-ascii?Q?9Gf+hSDpe2Vqek82zxmq9y5s9E71whcc2rbRZFM3Dk1/fhv8yobKgNTc9Nv0?=
 =?us-ascii?Q?UzgKdnCIEGHwv6+Rk11RYL4wnwkfIx774CIeKVxF8j0xH1kWlZxYwYtE2V9F?=
 =?us-ascii?Q?BtsFFi6Jxxq/2J6uyScifxj4dLoMuUF9MD3/deRvh/LbcSv+BvfvhpUS6T61?=
 =?us-ascii?Q?TrKP0SGnP1PMOjuJgymJcBQJUrQppIx3b04LlusZy0o/RUJZeAQz0wBlC4NF?=
 =?us-ascii?Q?voH9pv2vvXmVv8fgLycbpiNrQDitFJY7ESecmV8FD5NFh0AffrLW7imVxbPK?=
 =?us-ascii?Q?pH9qGgt9E/Jnq5Q2SdSyzJHGIpkQpJjAZu/tzV0VvnLgMfZ10QdO6S4vH4Aq?=
 =?us-ascii?Q?+mJ0ThdBL1qNkozEPFWVoN7aWMhbYwTu8rGtts9UJaElmS+4zZecpcpSrEk2?=
 =?us-ascii?Q?HlCkf76YQRN+pfyr40bua2AtUzBC6gQLrrcq5eFx5R+tF8Ij6KT/p8ji1e8b?=
 =?us-ascii?Q?dmp68s2CThJl+LW3Q/QbLmZdThBUa5lZQbwdWdUpake5Uw5fl2XcRevjbwbP?=
 =?us-ascii?Q?Axe23L6ZqqB5rH453OcvlsdG/ESmT1ZGUebwGrfn4601iysIJwKZjN1HUNqT?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 573dda89-cd2d-4d18-3da3-08de2880ede9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 22:05:34.6844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFtt0PsrNeY3KfAYmZhdGA5T6mqh32As7AhAVYF2ThdZmv+0i0WAs76+NSUWvQa1yjc+u2ItkSBWNKywh1jnl2ROfuJ6GUl/TTxhw5uuXHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5280
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

On Thu, Nov 20, 2025 at 10:59:46PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 11/20/2025 10:18 PM, Matt Roper wrote:
> > On Thu, Nov 20, 2025 at 09:14:40PM +0000, Patchwork wrote:
> >> == Series Details ==
> >>
> >> Series: series starting with [v2,1/2] drm/xe: Track pre-production workaround support (rev2)
> >> URL   : https://patchwork.freedesktop.org/series/157804/
> >> State : failure
> >>
> >> == Summary ==
> >>
> >> CI Bug Log - changes from xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7_BAT -> xe-pw-157804v2_BAT
> >> ====================================================
> >>
> >> Summary
> >> -------
> >>
> >>   **FAILURE**
> >>
> >>   Serious unknown changes coming with xe-pw-157804v2_BAT absolutely need to be
> >>   verified manually.
> >>   
> >>   If you think the reported changes have nothing to do with the changes
> >>   introduced in xe-pw-157804v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> >>   to document this new failure mode, which will reduce false positives in CI.
> >>
> >>   
> >>
> >> Participating hosts (13 -> 13)
> >> ------------------------------
> >>
> >>   No changes in participating hosts
> >>
> >> Possible new issues
> >> -------------------
> >>
> >>   Here are the unknown changes that may have been introduced in xe-pw-157804v2_BAT:
> >>
> >> ### IGT changes ###
> >>
> >> #### Possible regressions ####
> >>
> >>   * igt@sriov_basic@enable-vfs-autoprobe-on:
> >>     - bat-ptl-1:          [PASS][1] -> [ABORT][2] +1 other test abort
> >>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
> >>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
> > 
> > Looks like I'll need to add a !sriov check in the next version as well
> > since VFs don't have access to this register.
> > 
> > Michal, we don't have any other means of determining production vs
> > pre-production status on a VF, right?
> 
> we could try to add 0x9120 register to the runtime_regs, but that would be unofficial hack
> 
> so I guess it's easier to assume that VFs will be enabled only on production parts

Yeah.  Since this is mostly a matter of catching cases where there's
still a pre-production part still sitting in an internal CI farm or
something, those settings will almost always be using the same
kernel+driver version for both the PF and VF.  So we'll already get the
warning when the PF driver is loaded and a warning from the VF's driver
would just be redundant.


Matt

> 
> > 
> > 
> > Matt
> > 
> >>     - bat-adlp-7:         [PASS][3] -> [ABORT][4] +1 other test abort
> >>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
> >>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
> >>
> >>   * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
> >>     - bat-ptl-2:          [PASS][5] -> [ABORT][6] +1 other test abort
> >>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
> >>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
> >>     - bat-atsm-2:         [PASS][7] -> [ABORT][8] +1 other test abort
> >>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
> >>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
> >>
> >>   * igt@xe_module_load@load:
> >>     - bat-adlp-vm:        [PASS][9] -> [ABORT][10]
> >>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/bat-adlp-vm/igt@xe_module_load@load.html
> >>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/bat-adlp-vm/igt@xe_module_load@load.html
> >>     - bat-ptl-vm:         [PASS][11] -> [ABORT][12]
> >>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/bat-ptl-vm/igt@xe_module_load@load.html
> >>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/bat-ptl-vm/igt@xe_module_load@load.html
> >>
> >>   
> >> Known issues
> >> ------------
> >>
> >>   Here are the changes found in xe-pw-157804v2_BAT that come from known issues:
> >>
> >> ### IGT changes ###
> >>
> >> #### Possible fixes ####
> >>
> >>   * igt@xe_waitfence@reltime:
> >>     - bat-dg2-oem2:       [FAIL][13] ([Intel XE#6520]) -> [PASS][14]
> >>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/bat-dg2-oem2/igt@xe_waitfence@reltime.html
> >>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/bat-dg2-oem2/igt@xe_waitfence@reltime.html
> >>
> >>   
> >>   [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
> >>
> >>
> >> Build changes
> >> -------------
> >>
> >>   * Linux: xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7 -> xe-pw-157804v2
> >>
> >>   IGT_8636: 254cd102396ff95d61f2ebe49fc09128878bf483 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> >>   xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7: 3d718db04a365cc44a3bc81ffa4db7bbd2e645d7
> >>   xe-pw-157804v2: 157804v2
> >>
> >> == Logs ==
> >>
> >> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/index.html
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
