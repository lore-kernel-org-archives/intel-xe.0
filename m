Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A900CD6E49
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 18:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DDD1123BF;
	Fri, 29 May 2026 18:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FRsEQJGW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67F61123BF
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 18:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780079529; x=1811615529;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=45LT5femD06LMKdnvkiVCaXJHqZCjijuwcFyHL9La1M=;
 b=FRsEQJGWpjxFeb6qPqh7Fn70qaq6umsqQp4uGA0/O4tdmcpsMduueynq
 5m2iR6NH3/H75nNk4eaWMsIaJRFK4WA5dVC9jKY3aDnsRFAZzLu/5i7w8
 NcDeTNOycVGEu59ZmKw3YUsQXIZBxI0vQ1azxMvhUFguAVhaTjzJPkZci
 fNNP+cSfrYw1j2TBgUTvo+JWS9YY07JI638s+egKyo5Y1Iw/ulv/SbWHV
 v1jvi1xbAKpHCSw0zyG76q0KkbpCAQ6uB8vVwI9JI78zX9D2wERv/fZkC
 RCAQdyPPNzKIjgJ84f+JOzJg8Ki1J6pqoZHrOJ7E1THQuqhgTOGCcc7uU Q==;
X-CSE-ConnectionGUID: s+PSi2YTQbqosqoqabQEkA==
X-CSE-MsgGUID: PSxHGhIDQuy0NZAc8vD2yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="98512328"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="98512328"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 11:32:07 -0700
X-CSE-ConnectionGUID: 9QC4KUZmQkW4PFz9t7beRw==
X-CSE-MsgGUID: AKOzliUhSgeID6l75WN+aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="243014313"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 11:32:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 11:32:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 11:32:06 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 11:32:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pF5dxxHZu5JS2PNHiGb5bg6E/b77QjlRbkaAfswjkWVViDr6N72IMbVDKnjbSITjNtxn5lkvIWN485zkt8BM92ifJvWfTE11TtTknozN78RwUpipUow5FfLICxFWSPnuqqOHn3pmbJ6N6nLaG/noUJ8goEb/zH4ikTCGfyf9AF3NhvzZU7KAEoiC6JEE4K54poSzLjRIwxSZU2x135oejq4UNt4RiDO5rpS4goqI5twUEfkDLkEl9IXKkddx+PtQhQw887ZhzrUxCbpsrKBlY7DTwOJTXAjcgBkbOyLPH8YsF/ZfvwAfpvQk+wTPibItdsa09wdiSc4ZjODwM7RLnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2RUNCGNq6C5EMkdIr1LKYaMKT6X7fZl7krQQf049Ow=;
 b=uXzt8IaZwGQDoWjHpNxX2tORz+6Z+STexHlcObiOK4xmpZ0LJ0cz/gH0lDmVt33+2aPZ/c72Xgr+dR0wB/6LBQWxbj00+CXxTwmBxOuq/XYj4mOpHsgGFopwdZJfV9LI49jhUckc+61ur25xNlTLbMwtamTiHMYe9dWau4QsgrI/+Gc7wzlA2/RLtWuCcy7GU7TPDhUHO2dIbDJl+imdFfI90cUW0G+nHt9rOyNnyPvm2/LpfRVHqt1kbIr/e02zmXVDjKiU+aXIzBn9IHpPqn67I+vxcs4J0EZt5GLiJr1c0jCIjEloUdVUD3WKjwq+oj8h/SIPWDAVMxs9tFqLlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB7273.namprd11.prod.outlook.com (2603:10b6:610:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 18:31:55 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 18:31:55 +0000
Date: Fri, 29 May 2026 11:31:53 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/9] drm/xe/rtp: Maintain OA whitelists separately
Message-ID: <ahnbmbvRsjBoUTOm@soc-5CG1426VCC.clients.intel.com>
References: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
 <20260518234716.1540123-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260518234716.1540123-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0306.namprd04.prod.outlook.com
 (2603:10b6:303:82::11) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: ee02adf7-2265-4b7c-8a2a-08debdb08f48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799006|56012099006|6133799003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3xEiFOEePKfR40VcFEnUHfwcljmbM7iJo8+ogKjo04sU6/EUrVPMg2pmpgbGO1+OburHk4qgk4ZV8RlhcfdxfxlzpBYxvgNzfyhXGB4AAPWLYi8nbXTIKZanNwhyPk4Eqg+BxAAQawO053nLXJG16Kj9N+ctEGM7RoGuCI0D7mqZc+svZAj/qpG7Z2fmqqdN/8S/cO4TwokFlrEgJv75+JrZi5STrvqm1RFV+xaz+POFn++/zTgpJ+IXtV4rInF+idOfTMzMe50YrZpwtsAYcktMNKGsHghe1WgqIZSUNt3ioMjlBqK1aEVG83GVZboSjK7IQ/ODEKTgchpZJFkqOkbvUx5eArNceeJHFJrWBtxjL+j2OorWoi+2/zQh+FiWeRnBwFETG9/1CAN2n9j1f8s9IqOYUE2BA6LmUrzrvxexTbW+IadimzbdOzqhrETQtkTLI0/lU6T6fmPH5df+IlsmNOHGU+El7IZ/fPoswf+WOyBdNQrNJc/Sh9qcMUZE7hzjqhcZhxKnid0G44VLE56yRJVZaUScCPgxwDedPVpfV6pT/ufevSru18Z0xm35I+d0CVFt4eggshFmGRkqIOv2f+tX1OUnvRGq29yTbMfuZHxgkON8Ro9gBN5uqrgk8+V+LTJU85WSDevG0/D2pmLrjcHDW7v2jhyHgd2PP5mpWsALbYyInLgzDV+68D2d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799006)(56012099006)(6133799003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWkxUk5mcmRoWTBRSzhGWURwRjZhYVhxWlNucE5OMGdNbkp5a0xoM2xzeUhM?=
 =?utf-8?B?UDIwdmRkcmhJdzIxTGpKOWxjNW0zOWRHblZVb3V3Tmw2b0F4L3d2aVFGZmhT?=
 =?utf-8?B?NUVLcjdJMlY5TVZaR01UYnprcGVxUmQvVFU0YWxQcjlWbEpMdkdrcWdpNUtj?=
 =?utf-8?B?bG1CZlJSL3FuUERYOVJqL0JYRkhPRC80OGc0V0JJK3NZaGt0cE5WZ25JVEhX?=
 =?utf-8?B?VmdOeFBURUNzSXF0b3BXc29NUE8ra2hIeGZBS3JLTUdZQ01oTFlQRi9Db1lh?=
 =?utf-8?B?bHhtRzRwY1NZMUJzdjJlZUtMdXV2SzhhOS9LNEJCTDFTMkZOMndPeDl1MUxh?=
 =?utf-8?B?S2JycmlDaVkrMVBUOThyVXNFSkltUEpJRUNyQ2NVRkprblIyamIrSThNMjZz?=
 =?utf-8?B?UkNHdlErYit3Mm1md2FtaTQ5TVJWeCsxOHhySDZkc3hIL1ZNQVdvdHBwdkpK?=
 =?utf-8?B?ekVvWGp6RXFlNDlzaHFUT3dzb3B0NzQzN0RYajQzT0Q5UWhwbzg0enRjN29p?=
 =?utf-8?B?ZjVlcVpyRU5kSUZ2UXJpUy8rZGhhWkk4NGJIUUZkb21HcHZoOWQzdlZxQ0lp?=
 =?utf-8?B?aENwSUdFNVZpMHR0Ujd5WE0veDE5Zks5REhEZ09FVjNEcW1LYnFXMTUweHlt?=
 =?utf-8?B?TUlqNit4Slk4UFlyelpZUnBWRW1qUTREVHJiK1lLTDdPcVlGd0p0Q2xIdWhU?=
 =?utf-8?B?MW1hRXJlZ1ptcVhwSEhGZDBiSzZjZGppemRvdTlEdmtIS3QvZmNXR2dObmll?=
 =?utf-8?B?SVpFaFlSbkdSU0dxYkdjSkExcVIwT3VpcXpYdTdMcldzZDN5TEgvUHltN2cv?=
 =?utf-8?B?LzU3dUhaODNGK0MyNTJlTi9yTEJseUphelhsS0xaeVZwMVE0MHNTMWxUZTc1?=
 =?utf-8?B?YXVSZDlCK1h0aWJMYXVGdEpLa3NDc29qaFE4ckxaT0NMSmdwalJ0TWoxQldI?=
 =?utf-8?B?ZE9idEkzOC9Xb1crOUtTUlpHRXFjNjA0R25NU3djVWJ5RDUvTVQ0aUFCL0Ni?=
 =?utf-8?B?WWdFQ3IvQ09DYVd1UEFPbVJDVCsxdVUranVXMTRMZ0xjZVN2SVh4ZnZ5S0RW?=
 =?utf-8?B?VVo5WURhSGxXeDFva3g4YWwzenBHWFFTNXExbVFaWm8yT0NaWXJNYldhd0ov?=
 =?utf-8?B?QVZkQmNhMFlEL0lGZFk2bnlCR0lMWWRxRVFNU3AxTmNUT2g4djEwcnNQcVg4?=
 =?utf-8?B?Um5hVXlKM2J6ZGNnQkdyZ3VCbkVLNE5Tb1lLancwMFZkTjBYZHFMZ3MwNTBw?=
 =?utf-8?B?cGN5eThwb2VtcmFadXdqMFdsVHJJQ1RIK0JsZjc2TFJJTE5DTDFNR2lKREpJ?=
 =?utf-8?B?WFhWejhZRmhEVTcreTkyWUxibVp5K2ZDUUVjZURob2c0L3hqSm1yK3ZzTWRD?=
 =?utf-8?B?R2hpUERnSGdWSnZYa2JIdVlMR1hBdEtuWmtNT09FbVgrMTE2Mis3QnZyV1pz?=
 =?utf-8?B?azBOYVFOTW9CQ290SDdobnVDRmd5NE5XZnRSUWxtOGt4WDIxVGRIOEkzMGN3?=
 =?utf-8?B?SmRLbU4rakVHRGNXZGs0cWJiNUVhcTlCN3hnOXduSFVLdnpYVm9oKyt0clhs?=
 =?utf-8?B?RTYwMUdpMmtzcm4rb1NETFRIWG9DKytvaUwvbHRVNkgzN2RyODYwZTdKSDQz?=
 =?utf-8?B?aVZQRE9jbm4rNUxGbWRoTXpZTEZlU3pNM2NzTERudU0zS1NUTFdBNmF3K3Va?=
 =?utf-8?B?ZFp3WXg2WVZSa3hoWVZnMWZHcjNZNkNJcEZSeXF0ZzkxTkNicFNwRnJMR1hk?=
 =?utf-8?B?V3NrbTVob1RScW9vbGZ1eWVrd01XREllYjY0TW5IelJjRTFFeXJTbVprQWlS?=
 =?utf-8?B?UzBxTWV2K3RpaDE5UVF3R1NHQkdKeTg0amZrK2JQNzRTZVNpZXlzUEZBS0hL?=
 =?utf-8?B?Zk5hNG9lUWNnZnlzZkNjZ0U3OERsZnEvWlhwVVlaWFk5SkFnczI4ZmkreUlM?=
 =?utf-8?B?Yk9GWXNrUlpjR0lPWjFZaXBtNlV1OEJ3MXoyOXVab1E2S2pKRjhQOVBIS0hH?=
 =?utf-8?B?WUFGU1IzN01zdWFpb3RMekFRbktCdUNQSDhaL2M5aGFxU1lNV1orMDVlL0Jy?=
 =?utf-8?B?a0JBcU4zSDUrd2hMRGd1SjF6QW5pdWdNRi8rQlN2N2hxVGdrNXpvWGI4VnFx?=
 =?utf-8?B?RXU2emYrSXpUMGZ2YXpXRE96N0k2aGxITnJRclVianBFU1B0U3FIdFhnYzdJ?=
 =?utf-8?B?WFFXWExjVHJxTW1nYkpjVlgzT2xGaWt1TVNJSm84b0QyS1JoSlBtbHVuOWgv?=
 =?utf-8?B?OUFxMFJLTnNPbjFZeUx0Yk9GSTR0elZWdmdZbDl5WW9Jcyt4TE5KeDVIUHJL?=
 =?utf-8?B?dTdlaExvNHpoalJXSnpKK09HaDdHV0hUcDVUb3ptSFl0UU81NGxsNDFzR1lV?=
 =?utf-8?Q?oqSr8Vr+Q0/A1b4o=3D?=
X-Exchange-RoutingPolicyChecked: nw6R8jSplqLWyG3J6PPewvWCnFNowfftKduSzYQX7gBd3XL8nO6MOjltSuZmkxGc3G8AVGxN2GahIgf6HgUeuyTpcsdo7myDcGk3pGZaWmgx+UsAAQ91flDhlOiHI+vSz0L2QLDhYpab9kSIYyLZbrTAF8DD7VKW/2HpBj77kXrF415BUztiySP59whUpEBPeKKzD0p185kXJRwMVa/oKlPIXESq02N1Je1glciSPS/LgRTmk6J84BKiVZqSRtf+cQdogTQrTisGeZld9l5CsNai7cuLs9M/lXHhee6O/Y0FYyhrS4E8Un5yOqBlzok4ekctpLKqMDc2Zy9HsxR57A==
X-MS-Exchange-CrossTenant-Network-Message-Id: ee02adf7-2265-4b7c-8a2a-08debdb08f48
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 18:31:55.1414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0sGArj2j0wcWVZyfCMQdCr5JjUGAYRf9oLktFizlgLdmEVzP+Ee49yGjO07A7qjpkAZAop8xY22VB3lUafpPdljNDKyFGxyghvvjGQGhTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7273
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

On Mon, May 18, 2026 at 04:47:09PM -0700, Ashutosh Dixit wrote:
>OA registers are dynamically whitelisted (and again dewhitelisted) on OA
>stream open/close. Maintaining OA whitelists separately from non-OA
>register whitlists simplifies this management of OA register
>whitelisting/dewhitelisting.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_gt_debugfs.c      | 4 +++-
> drivers/gpu/drm/xe/xe_hw_engine.c       | 2 ++
> drivers/gpu/drm/xe/xe_hw_engine_types.h | 8 ++++++++
> drivers/gpu/drm/xe/xe_reg_whitelist.c   | 5 +++++
> 4 files changed, 18 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>index f45306308cd66..c38bcacb27e4a 100644
>--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>@@ -149,8 +149,10 @@ static int register_save_restore(struct xe_gt *gt, struct drm_printer *p)
> 	drm_printf(p, "\n");
>
> 	drm_printf(p, "Whitelist\n");
>-	for_each_hw_engine(hwe, gt, id)
>+	for_each_hw_engine(hwe, gt, id) {
> 		xe_reg_whitelist_dump(&hwe->reg_whitelist, p);
>+		xe_reg_whitelist_dump(&hwe->oa_whitelist, p);
>+	}
>
> 	return 0;
> }
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index 05f0932dbb948..9b0175ef05093 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -569,6 +569,8 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
> 	hw_engine_setup_default_state(hwe);
>
> 	xe_reg_sr_init(&hwe->reg_whitelist, hwe->name, gt_to_xe(gt));
>+	xe_reg_sr_init(&hwe->oa_whitelist, hwe->name, gt_to_xe(gt));
>+	xe_reg_sr_init(&hwe->oa_sr, hwe->name, gt_to_xe(gt));
> 	xe_reg_whitelist_process_engine(hwe);
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>index 0f87128c65290..3499bc09ee219 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>@@ -128,6 +128,14 @@ struct xe_hw_engine {
> 	 * @reg_whitelist: table with registers to be whitelisted
> 	 */
> 	struct xe_reg_sr reg_whitelist;
>+	/**
>+	 * @oa_whitelist: oa registers to be whitelisted
>+	 */
>+	struct xe_reg_sr oa_whitelist;
>+	/**
>+	 * @oa_sr: oa nonpriv whitelist registers, changed on oa stream open/close
>+	 */
>+	struct xe_reg_sr oa_sr;
> 	/**
> 	 * @reg_lrc: LRC workaround registers
> 	 */
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index d6a5d499373bc..6cc81f53fc601 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -103,7 +103,9 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
> 			 WHITELIST(VFLSKPD,
> 				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
> 	},
>+};
>
>+static const struct xe_rtp_entry_sr oa_whitelist[] = {
> #define WHITELIST_OA_MMIO_TRG(trg, status, head) \
> 	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW | RING_FORCE_TO_NONPRIV_DENY), \
> 	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_DENY), \
>@@ -206,6 +208,9 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
> 	xe_rtp_process_to_sr(&ctx, register_whitelist, ARRAY_SIZE(register_whitelist),
> 			     &hwe->reg_whitelist, false);
> 	whitelist_apply_to_hwe(hwe);
>+
>+	xe_rtp_process_to_sr(&ctx, oa_whitelist, ARRAY_SIZE(oa_whitelist),
>+			     &hwe->oa_whitelist, false);
> }
>
> /**
>-- 
>2.54.0
>
