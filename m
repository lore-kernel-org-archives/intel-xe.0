Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED88BCCD193
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 23:28:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AD710E984;
	Thu, 23 Oct 2025 23:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cHayDumC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B469010E984
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 23:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761262112; x=1792798112;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=eBT6O8Bf0uP4eFHAka+XSLeUqxNH4vfC8aGUktSYxgs=;
 b=cHayDumCujYhq3qvZC6xymy5YBCJe2RGY19byhj9rfSxZwqAXJ3n0U0c
 YnRIaqom7kUNq1FHNr8vL5+5JLCgUQfWsE5W+/utDpz7/7W9eHKpKN9Yh
 vtCYK+xXL1zbgeYLS4QSseVM6cyls8hL0C0aywTmJustRo1u28fw/eSrT
 m2C160hSwK4R3Q2FQyRY+gl+zYcV4AuDksEXnTZCNFAsCqAOFOWE1cwxS
 3EkhllGUq8225IjOCgzCQ2TS/y9wa923PdEhhnq/YL9pgxvwHJvSuAzAM
 D3NVyPpmPN4LtVbUZaTJgwSw4NlML4pzsdtQTVAwUzXKfMoH9+JSmugn5 Q==;
X-CSE-ConnectionGUID: R994fvC/Qee5A8ZOgShv6A==
X-CSE-MsgGUID: FpCABJcDSxSIHW8Pi02RDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66060058"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="66060058"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 16:28:32 -0700
X-CSE-ConnectionGUID: B+YQZMNERwqtCRywp+smGQ==
X-CSE-MsgGUID: LkRLtCpfQ8iPyxEjE7wLiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="184356337"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 16:28:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 16:28:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 16:28:31 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 16:28:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eo5ypuVT1/kdeGJ+b2SdRa7Rfm5V830EX3pMo6LhL6LAJ6SJa33bvJv1ms9OtEjOooBFUXtTvbNAwCi6PN+gOGhGXR3YWJs7xHy6rhIX1cEtUU7KV6EpmRLaevVR51zcfgu1pRF4gpOs6eWkZaefimhYNxLWxSmHhgSZvq1toUTDj15jPjQdDIJMBbZN61RkDChx4TXa9UiBDYQpj8KuyvhATpJzq2vC4xfyWMeHzmD25e6lQ+4MfFIR5XTBQ4H3egzJXOpqPo7JnAEx7PcwLwHJ4sa9GE0iZcCwuT/O9MRIK+Kd0+wVOW/oBSjhlaE6vK/jRZChzZIvuAWQC7zfQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5NdFUx8ZYv0zuxwP+ElgufnG7IWokf94AX3Xeo8cr4=;
 b=VhsykVIWHgijTCj6rOqX1zm4vmnBXpgRPBgaBiv1Aqwh3LJzZRSTgwXEsSpBhfiVUu8zAoeUGX2Uht21wI4CpyG/h/BLwizcLECEAdYy2S6wEhCMnUp4U/SX9SHpXn6v2aCmusqaSC1xL6esX9SWX9r2OHHkpvs29BY/ZDBnGM81Gc8nxAr2UF8UwkOF+/tb44W+BWK0tJjog5uVl3cWt1ovoVlNqIXxFcDeKLj2OiBYRydHzjXpCv3nzFipDxpsoIlk6sv15Oh0p/SmFd03Q3N12wbb7JNHwY41weju/FMtJtVcq6fulW11eybUZwFq+dTS5QsHuM8PnrKiYRNkSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 23:28:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:28:27 +0000
Date: Thu, 23 Oct 2025 16:28:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Xe3p_XPC Steering Updates
Message-ID: <20251023232824.GA5409@mdroper-desk1.amr.corp.intel.com>
References: <20251021224556.437970-1-matthew.d.roper@intel.com>
 <176110364605.39841.13632013695129532588@97596180aaec>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176110364605.39841.13632013695129532588@97596180aaec>
X-ClientProxiedBy: SJ0PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f6bcc3-a7bf-425a-fe80-08de128bde30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?63mkpXiK3RR7U5DH4QF0rdS9ksI0AY0lU7pyDrlwxyMGklCVSMwzaigFQyYR?=
 =?us-ascii?Q?W2Y2aTYCX+zoIha56wTpIKn73d+O+5pwekmwJ5GSmgy95Kh4E2R+Ddevklms?=
 =?us-ascii?Q?bFztSkjKss1bsGxCYF9y6Vcz2sXSAvJWb1NjYTY3ykia+4BjCURbbLZHfydh?=
 =?us-ascii?Q?kmzLCoXN8sT5y1FZrQXYqWjw1VUd1FnA7uwVrPHL+Q0Dl3P9OsOFIqxKj6xD?=
 =?us-ascii?Q?Vu4N7c5+zFLfQ04Z6dWYR0PdVWRzzn+9Lccofg6S6zuvoQxRE6dI2kdQ6o8c?=
 =?us-ascii?Q?v+uUB9T0L/vYSFAsKzaBGdlNRhKpna0BPYUVNl5DB3QHowyHS11TYhjHJ1UO?=
 =?us-ascii?Q?ZRl9z3Swu1ky99oFvcaEQ5onOhQlih8RplvO3NBn9+t1iM3DDrZzmJ3haLd5?=
 =?us-ascii?Q?Q4IQIR4E3AKaaHJuDqbp9DGnxsPwRjWL1jSBRr+i0Bi4lWz+AyrJHAlz1VK1?=
 =?us-ascii?Q?xfqG1s6cQ3bCf8eretdZQEpaJuGmMTR2oXFrgFv6Zln/vQk3nT9Fv4um4bX3?=
 =?us-ascii?Q?q7ERZ590dpYoDw+Ct5QFvnaBOo7NsdKlCo11NOkLhIMatASkLhU0f8u8nywK?=
 =?us-ascii?Q?4gAXri0XXprhR2b+ZXAxlcwf8iuToZseVw8gPMZ5CyGlLsADoPABwvE+ApSN?=
 =?us-ascii?Q?Vir+m0KVrjNA3iCntsH1GR0oCr60adR+0F1nK70P5FsORD+XnEqRec8Qyc5Z?=
 =?us-ascii?Q?+rxobwhdjK3DM40lX7q7ccmQ6jf5qPkTPwwJZ+1eVoJmp1+EMOmuMazUnxaI?=
 =?us-ascii?Q?UzvWYYKQDw21GOGFRuPOZ7gWkQmgF1M4aD66udOuI9e8us6CKwKmKTIAi66x?=
 =?us-ascii?Q?Y0u7x2aqH7s5JlGoq8hOj5aSwGfvR8p6cThQoOCoR3gdpwA6U/qZuSfjbx5x?=
 =?us-ascii?Q?pxAXP5VPpI+B8K6yj3wsNcnfhCZWy2bOhx5j8coFQnPpD3dtLocbb6BlomQ0?=
 =?us-ascii?Q?PFhGas7gnMODMdoa3Y6rCZRCk9TQG3W2t1V578p60HlJJlIpzBSExE7hdfM7?=
 =?us-ascii?Q?/e77/gG7knBz4wQx2rl8rKGurpp4Z/keN62viavLKp4UFP0N12/vobz4V++y?=
 =?us-ascii?Q?PeZpAzlkqGyfdCAl/ORJ4gBZ5611z3tED8K3CZeyZjA6jzpVPl3oI0rKykvS?=
 =?us-ascii?Q?pjj2luvumzgaqNghTU6yfLVHp60Uzfd6HXRH0l3oS8FgiumPUkZkGjMoXcrM?=
 =?us-ascii?Q?bFByaOUrbmYz84GGmAeThiQUpNE47sUyVlZJmPNpnsElxk08i/2BxjZN7y6v?=
 =?us-ascii?Q?M+ISrGZ20JMyd4Z2FlqsczRqsugODKhZm7SvhiK1PpdjTnuV5DgnrC+M67lI?=
 =?us-ascii?Q?4ZVRvGWnQ/V158DYqMLm8OEV8rbkBn6Bs+fqlj8l3Dc1kBepjLTPEkK7PXol?=
 =?us-ascii?Q?Plnaz2Jqnzso3BEB2vnilgreRt94tvt9dam1jk8xrOY5w5lQyA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dMDbcpScjduXuZixDBDKsQzwqGs2fFygxk0d0zVmHMx5b9zCXN4VnJFJhuFO?=
 =?us-ascii?Q?IrkwYF4LtxmG8R4kZR3XbI7DSSAGMYL1lZ+pK42OIndHp8XzbdiCJJhBVvGs?=
 =?us-ascii?Q?an+Q2aCMuAJKcBkBvKUw55hVe/YPIEQYcdr7d91w9KUpZXoNhXLycuduT9jn?=
 =?us-ascii?Q?p0RBLtYvSCeu49PfqXHklxOcQArL2U5daeznwueM7nq/nPyZw53OXVcb/F2B?=
 =?us-ascii?Q?Zn04ySEgqt7UXHE06/5MoT3dMsp24LBfkSTLXgpREAqjE7zmJSfqxbL0kGVD?=
 =?us-ascii?Q?4n2eUp5VfD28q7vnm/uuDUGBrK83xo2V87ZtEyYKB0v2if745Cn891YB99X6?=
 =?us-ascii?Q?ErLEr4qvxDhM4y4e+K/LKRv5B5SyhVN+Bk9vPpPZup0IHxzqeTZChM4zn4Wx?=
 =?us-ascii?Q?Rg7n4aBKZnncAsoLhdLe8Q1/GaKskhLK/vWjdRhactyvGse7IvSb3uXedVX1?=
 =?us-ascii?Q?6rnKSZMqDNFGKalI6tIeFy/QhgY+tSGOw1N0tMhlDozBU7nexahhlAnedWUq?=
 =?us-ascii?Q?Rs70dWy5g88w1VNIKR7FB23T5E2HCUJIWPPaJbcdSDrIoQJ9sCDjdfQZxvJh?=
 =?us-ascii?Q?gkHC28knhn54ivCATTva+YK3K/UEBjfP3kPW/2BSXsoagJMJClqSuHxfVFyt?=
 =?us-ascii?Q?kw4r8t4FyBCrArAMuhoidCDAoVcHTDe70GohfSkgezV2e+MxAUW+fXkTDVfN?=
 =?us-ascii?Q?cRww20xlcyjGQjqRwaz8hPCR+IW0guUQ+FaHb2raukAxo4mGm3OwBKCNX66w?=
 =?us-ascii?Q?UiQwzrNFPheil+Ay8ooV1YZkifgRMm/rhZZ/BAqITEyZxQGD9qjobMnFpKXP?=
 =?us-ascii?Q?keReJMFZfIfo1PGO6/Ii6zetabS+NWiaHjIeHlqSac2mOPr5JMwJuIojGr69?=
 =?us-ascii?Q?eRlNQc2P/AZBZrWpXyDBcioj5VbjNIKwz4lIi4TpuxxP3zFb2uRdy6quf58l?=
 =?us-ascii?Q?0rDpRTqUpHOmdHX4Tk0EOb5s4/8Z2BmitlRiCAQWMZj9KMlzlBclrfxVs9bU?=
 =?us-ascii?Q?Q0xEUSa7DkkD88trsbjAtQS6n7keFtxYStamxesHHwcxmnu7c3yMp4AzhJR1?=
 =?us-ascii?Q?e+MDjiwyDQOpuMcYOpDknPm5Zm1cZCaroiEyESB0ivT3fRJYxLojqpaUiP7S?=
 =?us-ascii?Q?f0CSuFzwPiKgXv+4AKgXQftlJB2DUMIFD92KUSCc0XV/uArUK4CnXXYtTCoe?=
 =?us-ascii?Q?QMkY/3zem6//Q3mRQsQgKvkku3ijtVIUU6g8VjngukI3Kqu17g8sLB1IYHv4?=
 =?us-ascii?Q?xlQKnPFtI5gbAfYRajWEnpmVjbOQTFzIaFJq8nS3FAmPLIyFQaCQXhCeqS2B?=
 =?us-ascii?Q?URh+fzA0szyHsh6a3IEFcWx/NOeIFPZGG0liiQNoH6XSEpXyfRknCDu5dtlm?=
 =?us-ascii?Q?NZYyuG+C+aODzOaqtiRAbhh6vs/l6/LBUaYsYHSdwx7EPkNGK2vlP+KPBK6k?=
 =?us-ascii?Q?bPa3fNDVMDEK233pJv0d0W7o6zID6ucGjbczcq/ECDuGESu48+ZVF2tNz1IC?=
 =?us-ascii?Q?ztdWh0s+Jgm4ms0Egxp8toIlYf+LdAuHUwfwPZQXN4Gu2WM/njbFoUc9ujdW?=
 =?us-ascii?Q?Yh9cqd/oCAc/jQLGUrXLrg/hvC3JS2K1hC4AWklwXuxgTRQRnOsbd8+Ei+Vj?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f6bcc3-a7bf-425a-fe80-08de128bde30
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:28:27.2696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BBBFbYFvFyoN4v+Ue7BfphpqNpdBXgOhsBVyoceVvAqtCN0CpJWOgQnTRqiy2elWxbgxp8dw4AhgHafD3bWizj414NyfF4Kmn1YulcOW5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6029
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

On Wed, Oct 22, 2025 at 03:27:26AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Xe3p_XPC Steering Updates
> URL   : https://patchwork.freedesktop.org/series/156288/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687_FULL -> xe-pw-156288v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-156288v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-156288v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-156288v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-435/igt@kms_hdr@bpc-switch-suspend.html

System didn't come back from suspend during a display test.  Unrelated
to Xe3p_XPC or GT MCR steering.

Patches applied to drm-xe-next.  Thanks Lucas for the review.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-156288v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][2] ([Intel XE#623])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:
>     - shard-adlp:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#4543]) +15 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#316])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1124]) +7 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#619])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#367])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#367])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2887])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#2907])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][14] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#787]) +34 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#306]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-432/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_frames@dp-crc-single:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2252]) +2 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-single.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#373]) +5 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-bmg:          NOTRUN -> [FAIL][20] ([Intel XE#1178]) +2 other tests fail
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#308])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-64x21:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2320]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-64x21.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#2291]) +2 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-bmg:          [PASS][25] -> [FAIL][26] ([Intel XE#4633])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#323])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#4294])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2244])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_flip@2x-plain-flip-interruptible:
>     - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#2316]) +4 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-3/igt@kms_flip@2x-plain-flip-interruptible.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html
> 
>   * igt@kms_flip@flip-vs-rmfb:
>     - shard-adlp:         [PASS][33] -> [DMESG-WARN][34] ([Intel XE#4543] / [Intel XE#5208])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
>     - shard-adlp:         [PASS][35] -> [DMESG-WARN][36] ([Intel XE#2953] / [Intel XE#4173]) +3 other tests dmesg-warn
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#6312]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2311]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#5390]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#651]) +12 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2313]) +4 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1158])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#653]) +15 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@kms_hdr@static-toggle-dpms:
>     - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#1503])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-3/igt@kms_hdr@static-toggle-dpms.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2927])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#5624])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-432/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#455]) +6 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-435/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#870])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-435/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2391])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-pr-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@kms_psr@fbc-pr-basic.html
> 
>   * igt@kms_psr@fbc-psr2-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +8 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1127])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#3414] / [Intel XE#3904])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [PASS][56] -> [FAIL][57] ([Intel XE#4459]) +1 other test fail
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-lnl:          [PASS][58] -> [FAIL][59] ([Intel XE#4227]) +1 other test fail
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-8/igt@kms_vrr@flipline.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-lnl-7/igt@kms_vrr@flipline.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1091] / [Intel XE#2849])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#6360])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1123])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_eu_stall@blocking-read:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#5626])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-432/igt@xe_eu_stall@blocking-read.html
> 
>   * igt@xe_eudebug@basic-exec-queues:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#4837]) +2 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@xe_eudebug@basic-exec-queues.html
> 
>   * igt@xe_eudebug@basic-vm-access-userptr-faultable:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#4837]) +8 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-434/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2322]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#288]) +14 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#2360])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#4943]) +3 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html
> 
>   * igt@xe_exec_system_allocator@twice-malloc-fork-read:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#4915]) +171 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-432/igt@xe_exec_system_allocator@twice-malloc-fork-read.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2457])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@xe_module_load@force-load.html
> 
>   * igt@xe_oa@privileged-forked-access-vaddr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#3573]) +2 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-432/igt@xe_oa@privileged-forked-access-vaddr.html
> 
>   * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][73] ([Intel XE#1173]) +1 other test fail
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-435/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html
> 
>   * igt@xe_pm@d3cold-basic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#2284] / [Intel XE#366])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-434/igt@xe_pm@d3cold-basic.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#579])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_pmu@fn-engine-activity-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#4650])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-432/igt@xe_pmu@fn-engine-activity-load.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#944])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#944])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html
> 
>   * igt@xe_sriov_auto_provisioning@fair-allocation:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#4130])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-435/igt@xe_sriov_auto_provisioning@fair-allocation.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@hotrebind-lateclose:
>     - shard-adlp:         [DMESG-WARN][80] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][81]
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-9/igt@core_hotunplug@hotrebind-lateclose.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-adlp-2/igt@core_hotunplug@hotrebind-lateclose.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>     - shard-bmg:          [SKIP][82] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][83]
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [INCOMPLETE][84] ([Intel XE#3862]) -> [PASS][85] +1 other test pass
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][86] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#6168]) -> [PASS][87]
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][88] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][89]
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
>     - shard-dg2-set2:     [INCOMPLETE][90] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][91]
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-bmg:          [SKIP][92] ([Intel XE#2291]) -> [PASS][93] +4 other tests pass
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-bmg:          [SKIP][94] ([Intel XE#4354]) -> [PASS][95]
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-bmg:          [SKIP][96] ([Intel XE#2316]) -> [PASS][97] +6 other tests pass
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6:
>     - shard-dg2-set2:     [INCOMPLETE][98] ([Intel XE#2049]) -> [PASS][99] +1 other test pass
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-466/igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-435/igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][100] ([Intel XE#4543]) -> [PASS][101] +5 other tests pass
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-adlp-4/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [FAIL][102] ([Intel XE#301]) -> [PASS][103] +3 other tests pass
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
>     - shard-adlp:         [FAIL][104] ([Intel XE#1874]) -> [PASS][105]
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [DMESG-FAIL][106] ([Intel XE#4543]) -> [PASS][107] +1 other test pass
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-bmg:          [SKIP][108] ([Intel XE#1503]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_plane_multiple@2x-tiling-4:
>     - shard-bmg:          [SKIP][110] ([Intel XE#4596]) -> [PASS][111]
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html
> 
>   * igt@xe_exec_balancer@once-parallel-userptr-invalidate:
>     - shard-bmg:          [DMESG-FAIL][112] ([Intel XE#3876]) -> [PASS][113] +2 other tests pass
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_balancer@once-parallel-userptr-invalidate.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@xe_exec_balancer@once-parallel-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@many-null-defer-bind:
>     - shard-bmg:          [DMESG-WARN][114] ([Intel XE#3876]) -> [PASS][115]
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_basic@many-null-defer-bind.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@xe_exec_basic@many-null-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:
>     - shard-bmg:          [FAIL][116] ([Intel XE#5625]) -> [PASS][117] +3 other tests pass
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
>     - shard-bmg:          [FAIL][118] ([Intel XE#6050]) -> [PASS][119] +1 other test pass
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html
> 
>   * igt@xe_exec_reset@cm-gt-reset:
>     - shard-bmg:          [FAIL][120] ([Intel XE#6325]) -> [PASS][121]
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_reset@cm-gt-reset.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@xe_exec_reset@cm-gt-reset.html
> 
>   * igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset:
>     - shard-bmg:          [FAIL][122] ([Intel XE#4937] / [Intel XE#5625]) -> [PASS][123] +32 other tests pass
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset.html
> 
>   * igt@xe_pm@s2idle-exec-after:
>     - shard-bmg:          [TIMEOUT][124] ([Intel XE#3876] / [Intel XE#6162]) -> [PASS][125]
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_pm@s2idle-exec-after.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@xe_pm@s2idle-exec-after.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze@gt0:
>     - shard-bmg:          [DMESG-FAIL][126] ([Intel XE#5545]) -> [PASS][127] +1 other test pass
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt0.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt0.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze@gt1:
>     - shard-bmg:          [FAIL][128] ([Intel XE#5545]) -> [PASS][129]
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt1.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt1.html
> 
>   * igt@xe_vm@munmap-style-unbind-userptr-inval-front:
>     - shard-bmg:          [INCOMPLETE][130] ([Intel XE#4842]) -> [PASS][131]
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][132] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [INCOMPLETE][133] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-bmg:          [SKIP][134] ([Intel XE#2341]) -> [FAIL][135] ([Intel XE#1178])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_content_protection@srm.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-5/igt@kms_content_protection@srm.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [DMESG-WARN][136] ([Intel XE#4543]) -> [DMESG-WARN][137] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][138] ([Intel XE#2311]) -> [SKIP][139] ([Intel XE#2312]) +13 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][140] ([Intel XE#2312]) -> [SKIP][141] ([Intel XE#2311]) +13 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][142] ([Intel XE#2312]) -> [SKIP][143] ([Intel XE#5390]) +6 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][144] ([Intel XE#5390]) -> [SKIP][145] ([Intel XE#2312]) +8 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][146] ([Intel XE#2313]) -> [SKIP][147] ([Intel XE#2312]) +10 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          [SKIP][148] ([Intel XE#2312]) -> [SKIP][149] ([Intel XE#2313]) +13 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][150] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][151] ([Intel XE#3544])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          [SKIP][152] ([Intel XE#5021]) -> [SKIP][153] ([Intel XE#4596])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][154] ([Intel XE#2426]) -> [SKIP][155] ([Intel XE#2509])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>     - shard-dg2-set2:     [SKIP][156] ([Intel XE#362]) -> [SKIP][157] ([Intel XE#1500])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-dg2-set2:     [ABORT][158] ([Intel XE#5466]) -> [ABORT][159] ([Intel XE#4917] / [Intel XE#5466])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/shard-dg2-466/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>   
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
>   [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
>   [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
>   [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>   [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#6050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6050
>   [Intel XE#6162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6162
>   [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6325
>   [Intel XE#6360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687 -> xe-pw-156288v1
> 
>   IGT_8594: 8594
>   xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687: fb0f56ad8a2c9953c57c3337a72ccbf9c5050687
>   xe-pw-156288v1: 156288v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156288v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
