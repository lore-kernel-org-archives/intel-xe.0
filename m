Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F4DD15D8A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 15:34:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80A810E0B5;
	Wed,  3 Dec 2025 15:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gsTcwQ+L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777AF10E0B5
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 15:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764776061; x=1796312061;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=FQQ2nJ+aG6SUwSpA8XKn/7z+2lyxekw/sm7ndUJrxRc=;
 b=gsTcwQ+LaE/WeH5Uk4mdnKknhw01Lpa5imW5XOTCXhl5RAURA3Ee7Qg3
 5y+7V0CQc6ShIdlo3u/6e6hn07+Ga7QC5YVrDd15iRNN3wsBTbyuI93JM
 yBptUmcu0utvnUnD6zsfn0UZS7uTZJiInqvKcLlOMAjEKZq6C8Q5Uu3pJ
 NClgX6JSMRBAoY68+Zi+N3srb2wRZxNAtcj0tM+vFUVmUseKI8g72Sq8b
 QAz9WGK0oRwPKx1zQfYy33JVMbrtntVTsDPjGBE9UsFYJhCdQCZ/BZc6A
 OOCR3t0jCJ3CjCxMpuTV557u2l3TYlcOfir9F2luH0Otnhh4sVrOA4Jhr w==;
X-CSE-ConnectionGUID: KvWmcfiOSxG975ii4W9d1g==
X-CSE-MsgGUID: gj/R/INUTX2Q2/30neDxgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78238719"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="78238719"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 07:34:21 -0800
X-CSE-ConnectionGUID: ktCwiez3TOSomaHvO0ZQew==
X-CSE-MsgGUID: zmPBGHxWQyaxBB614ZyGwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="199849248"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 07:34:21 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 07:34:20 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 07:34:20 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 07:34:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WRiUkH6UxS/Bcr43YlpVWb8iLJKR8DzspGWpEjIyShVbRIkwdZDkQCk5MomS5KqDSXAaP1TbT+1LLvHcfqgG4Naj2yELQ7nQgVnRxmjcsRY86CJqKswFTUA4cHROVHCKWkcMsU3NCZiFEtHDUxihp0zWbDzIkSL9Ef8XhymyHSpqyYfmpCdEqKK7xc7uTLEEdhfyQJY328efDpBBD4kdxN3F07rBydvQwD9LvG/YruxoU8Ue8Fp1NxTDttzmlrJWZrFDB1lqZI2nhDhea5QegMP/53K1iRc+bRsz5InKaCQ85N2qVaAdYRaNy0uM3yR9pjjYk1Vv8CSRPbTqy5uZ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29A1qWKTUDB4cOn1GBiMziAih0KsKM2IFMyTRcU1aMo=;
 b=thdtA1L3BPyMu1ANEQoBcfYT3etW2V+tj1/WKN00LpkMedjwZLH7b9YGR4Tm1Mh5k2PLh2pTfi8ZCSD6YD7A8yxRm54BisNf01dq1WJReedS+VHv8Js5sR9kw/PK6slAg+PUKaeao04CqutgMtdxv6fn2I+MjvOSX01DDeoLg+F6J06KChB8K9+555qWYoCF3m9J2xBvgIm+eCDgz2dfcLK3ORjBN+9QVbbxtAK8M1oHtoKgio19+pXPNYgN0zcPOOw12o4isQMS9PbKScJ8ZCFp/AX3KYkfUkMPVP7eXLKu/vYTIlagk6GxwOFY8bsg6D9g3zkbGkiCyVJBTP6w5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6478.namprd11.prod.outlook.com (2603:10b6:8:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 15:34:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 15:34:13 +0000
Date: Wed, 3 Dec 2025 07:34:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZ1bGw6IHN1Y2Nl?=
 =?utf-8?Q?ss_for_drm=2Fxe=2Fsync?= =?utf-8?Q?=3A?= Use for_each_tlb_inval()
 to calculate invalidation fences
Message-ID: <20251203153411.GB4164497@mdroper-desk1.amr.corp.intel.com>
References: <20251202222551.1858930-2-matthew.d.roper@intel.com>
 <176474693983.52904.10590180579655450343@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176474693983.52904.10590180579655450343@a3b018990fe9>
X-ClientProxiedBy: BY3PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:254::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: 81657610-00fc-4d5b-d914-08de3281693a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rd8fb3jdN8zxCtWsGbl5w/VUjLtD6f79OAEBbBpPFIg+QYrCR9PQFbSqLKAu?=
 =?us-ascii?Q?Isi3WJsyglrZ+6+MzR+FrD7l1eJ2Tp8slqIkhoJ3n7d7I+oMle8Ixs9c6QIK?=
 =?us-ascii?Q?bZ3D085hongJx/8nZx62fc+xE5DdVRH3SP4Z485P1sTqRG6dugWAeaPcNPV8?=
 =?us-ascii?Q?djkSHx0sOAY33x3vzw6rjkwpqf+87610n/4JSKAuUvWInXgAcTm4Ta4LJb8b?=
 =?us-ascii?Q?BrMrNJnDRcu0GLCVxOjuGMW7DNn61C1pApB6buCeOcxRJDNoqfHKARxB5n73?=
 =?us-ascii?Q?ZhvhhMUkOQC8JaSFaEW4pmwxOuB/nNWPTbXXX9Jb8z7yaThqFrthfuQf5R0V?=
 =?us-ascii?Q?kUoMcGb6/bdGQpKttFoHdNo677RZuctTUOItyR1u1kJOJlJ6nQXKTs2mExMk?=
 =?us-ascii?Q?w8tVW+LSxP1J/py2yTd0Qa8iOoRI2whoajyOA78qGk6lyb20KRLKcQXVTZl1?=
 =?us-ascii?Q?fhIQj734nikNYMhRI3SyZsxqx0BZzm/ggcaOUa33DSb4KCmy7CnbfTRTWrKy?=
 =?us-ascii?Q?iIZsEuxakTKP7Jmj/T7/QiCNvNCwMSQ5puEMkCt7mjU9POtiHiGhAU1YsOVU?=
 =?us-ascii?Q?QqtrOo8/WiwuIxjqyeHNULZtcMoE/By83KD3H8SoMMpjKj49+oM7pyOB5bGq?=
 =?us-ascii?Q?GTmoREn3rKfzSr+3YI76PwejrxBAw/WAr6fT0DTJ0arkv1GsLwsk683gwsH1?=
 =?us-ascii?Q?3sEIbWJJnFMlHT/K+bsNgsQFDZVzoXh6sUMi5abp/Foq8yNcWKwa6tKY0W3v?=
 =?us-ascii?Q?jOaEUvRfdkwi+aqa0CUBsTnW778v8Ljt8WX7QtFYQTwcDV4fcgb448ThAYKh?=
 =?us-ascii?Q?cazHL+hb2D5yys+mzcEATUNKY9Z3U4XpSpfZ7pcFE/SR+Ne7E/QmOs6Ma+Bt?=
 =?us-ascii?Q?JICixTZwg9G5vDT6vmsBQqACx591rbRa549miXNCfKH/YrbsO74Rx0bv2hcX?=
 =?us-ascii?Q?WWDfpMKVTDJEZTX0ILvMJQ7d/GxqDJKqMx3Ash6NMy89pav6YH9P4A9NN6aV?=
 =?us-ascii?Q?8bupkfn1P8JZ1AeO544xH/rrAuxI4wttyTjfX8VivVcwX8HcSCfH6I2Eju0l?=
 =?us-ascii?Q?WxqwXRHZSrrJb3QKYLhjqD6ge2em8vTObyUdPlGQgUYa9r4BVSnOhSfnxb73?=
 =?us-ascii?Q?mQBilA2nqHctm1Bi+Bl+9HzDIZ7kAs1zTDaRiPs3tudugSInvg3vSFeZsVqe?=
 =?us-ascii?Q?zHXvKszyiK0hVLk53cpewuc3sHy8F3yijdMN4zDCcap9PX0wAq3RyVuxVOku?=
 =?us-ascii?Q?oAZaxxX4zn9v3qf8dxOC2FNcbh9vin6BGOT+LMSjfWZsC0DMpd1jjnZqkH7V?=
 =?us-ascii?Q?I2YZonGV1UEapAY3nVPBhazMhcurFaSuQCtlaQuAH+oeVH7Hf3aPhex71TmG?=
 =?us-ascii?Q?+wbXvQJ4qdxQmphmEzvtcxux97kVKziGc8X4CdxFCCFNuGPNWQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1nhlE86xNoF3oQoEhTZdgeG3Dcm5/fU6Dl275TLFeJu8i9qcrGrwOnrCq7wD?=
 =?us-ascii?Q?W9gAU3GGVIbzJ0RWx5p2tYw2NTAlUl2khAFtDDB5VF69MVb833gKG8Vp52wz?=
 =?us-ascii?Q?K9VF5UN2Q/vFIwfkb+qa8drjzGQMSUzW259pzND7KUcXtJYvyP8p9I4qYWL6?=
 =?us-ascii?Q?H+c+T4B7sjliGKXBnZp8rtAclWARbi4dPT8yKruTvL4pL5NTLquuKGwWDjFF?=
 =?us-ascii?Q?UOp5COAXscwpieN3Tff2xq1cyeQokt1jraR5qQGG2i7xZ4mAnRAieWsd13+0?=
 =?us-ascii?Q?/7s4bxl4F2cjaNaHRdX8zTR9eI84OMCaMz4BXYbovs7mhDiDxSF2Rre7saF6?=
 =?us-ascii?Q?w6NLNgoWd2L6eaNi/duPLUQn0p4uHTG5UIwD6rfK5DsbGGD0VmwCjWTsmrTf?=
 =?us-ascii?Q?RUgIMEhACs+Oj6fNMjJ1WkmP44wM9baYWW7OvJrQYoIrfJaO+kRqCkOK/NRC?=
 =?us-ascii?Q?T1ioh3Xe8Vamm8rX8zrGxEalHV0s4aFk5L6LCMk6n/kKVylmgombBeq7Nd/v?=
 =?us-ascii?Q?oAo5yjSjw/hN50KX7ya1bgD4dBVNimgJDdK8IxNstXF/6WfHh38U4BoCWaJq?=
 =?us-ascii?Q?D/LAKeZsQ0ZWMBW1oJ2pWJa1JVwJJHo1jb58niJvXlgWoTx1MTDHss9SZ7T+?=
 =?us-ascii?Q?OO2SeFqBlqXjDgvjIXTss7djX7FunrqVlI56m/H2G3G1WiAh8ErCuRrGFVSd?=
 =?us-ascii?Q?eahfA/ncPTnhl/3s7BDAhvlXoknG7TIfy6zrQDcimnIBIPtFbwVbFx73Kwjq?=
 =?us-ascii?Q?wpB9J2x3AfJbcud/l4xMOn+FMFSELZAo5MzQ5ASoRB2V00Pk15pwC2eEhAhj?=
 =?us-ascii?Q?pboIoywvtynW/8jeJxrA6Ruo3zA6MAWY+YbhV16DzozvpSte/QDu8XMdzoWU?=
 =?us-ascii?Q?mIQjS3myF8+xEovZuwTYF6qXO5CQkhRBp1pStiperAjCSlHFVz3ju5dD3Zv6?=
 =?us-ascii?Q?vzRacnohghWUiFWusivRfJ0mKFKMyK+n0kSeQi1fYjzPctLU+dfao8ZGExh9?=
 =?us-ascii?Q?99JD+uZrz0n34Ihzqs+zMsy++Gi2BxaXKMspyfTFsVPDp//unm85r8lZOkhZ?=
 =?us-ascii?Q?2RbDxwjMHMBy+Lhdn/V5rNsiIDwaNKSQAltTfTLW9FWHvF0XwATRTwEBAi7w?=
 =?us-ascii?Q?x7one2V/Q/5eOAlOb5z9QX5xn8nFu8NZfQ1GkMPWg4gvBjL/Mlb4t5mtM+3F?=
 =?us-ascii?Q?gLH0iM0I2nlfzEyXn9dWOqsJtDSoEJpXHaXCdVZf02P4pu4dYLEqxCSB0mFi?=
 =?us-ascii?Q?Lu3tCKLt3C/Fi/EU4bIFU33lEst4w1xEBIisB9Wflg71tswuLnGNZpZdrNHM?=
 =?us-ascii?Q?xvj8sMvW9VE8ZmVPtI9RUgSd5V1uPgVqh3AEZ7aiOzAs+TMnfFAnN2HXR/Qg?=
 =?us-ascii?Q?5X+GWNJbs+XL/lPD876mU46Xnpb47tbjoU1luCLJF9jiP4489i0US5zzXQ4G?=
 =?us-ascii?Q?3nhGLrVGAUVThWZ8cQfUFZylhsjWnbsX5Dn9l6qpvJJtcpFDPfxwifyrzVDe?=
 =?us-ascii?Q?rFy4H8MB3XIdQuOzTcwjKjNLHWzAyQT6HHKvihmvjvNa3LKZbWwIJE29faIz?=
 =?us-ascii?Q?tDZr1OEfPuXJfztrRDHe+FcFn5GAULO+Lf6Nzra4W3dskDaIXhzP2TVncRtQ?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81657610-00fc-4d5b-d914-08de3281693a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 15:34:13.3706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfmjZEsfNy6XQUajYRxR4JEA9lkTE+qcSiS2e3yMxcu0Kov9INzAT/R0qkvpVELI18/wEO7krvm82EL/lo5/GT4LkRyK/UEwfMmCTV5uC2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6478
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

On Wed, Dec 03, 2025 at 07:28:59AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/sync: Use for_each_tlb_inval() to calculate invalidation fences
> URL   : https://patchwork.freedesktop.org/series/158409/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3_FULL -> xe-pw-158409v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks MattB for the review.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-158409v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition:
>     - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#3279])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#1407])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
>     - shard-adlp:         NOTRUN -> [SKIP][3] ([Intel XE#1124]) +4 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-8/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-adlp:         NOTRUN -> [SKIP][4] ([Intel XE#619])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#316]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][6] ([Intel XE#316]) +2 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1124]) +3 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#2191])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#367]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#367])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#787]) +13 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#2907])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +3 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#787]) +17 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-3/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2669] / [Intel XE#3433]) +3 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][19] -> [INCOMPLETE][20] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4842])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#306])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-3/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#306])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#373])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-fast:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#373]) +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-3/igt@kms_chamelium_hpd@vga-hpd-fast.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#373]) +3 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc:
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#6704]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc.html
> 
>   * igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf:
>     - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#6704]) +4 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf.html
> 
>   * igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#6704]) +2 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf.html
> 
>   * igt@kms_colorop@plane-xr30-xr30-srgb_eotf:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#6704])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-bmg-4/igt@kms_colorop@plane-xr30-xr30-srgb_eotf.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#307])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#307])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#455]) +3 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-64x21:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1424]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-64x21.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#308])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#308]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>     - shard-adlp:         [PASS][36] -> [ABORT][37] ([Intel XE#6675]) +6 other tests abort
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
>     - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#309])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#323])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#4331])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#776])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-435/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#776])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#1138])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-bmg-4/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#310]) +3 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1421]) +1 other test skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1397] / [Intel XE#1745])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1397])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1401] / [Intel XE#1745])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1401])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#6312])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#651]) +4 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#656]) +19 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#651]) +9 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#658])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#6312])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#651])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2313])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#653]) +5 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1158])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#656]) +6 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#653]) +10 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][62] ([Intel XE#6675]) +3 other tests abort
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-435/igt@kms_hdr@bpc-switch-suspend.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#2925] / [Intel XE#3012])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_lease@lease-get:
>     - shard-adlp:         [PASS][64] -> [DMESG-WARN][65] ([Intel XE#2953] / [Intel XE#4173])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-1/igt@kms_lease@lease-get.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-2/igt@kms_lease@lease-get.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#356])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3:
>     - shard-bmg:          [PASS][67] -> [ABORT][68] ([Intel XE#6675])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-bmg-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_plane_multiple@2x-tiling-4:
>     - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#4596])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-3/igt@kms_plane_multiple@2x-tiling-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#5825]) +7 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#870])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#870])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-bmg-4/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#908])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-dg2-set2:     [PASS][74] -> [ABORT][75] ([Intel XE#6675]) +2 other tests abort
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>     - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1128] / [Intel XE#1406])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-psr-primary-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-bmg-4/igt@kms_psr@fbc-psr-primary-blt.html
> 
>   * igt@kms_psr@psr2-sprite-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +5 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@kms_psr@psr2-sprite-blt.html
> 
>   * igt@kms_psr@psr2-sprite-plane-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +4 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@kms_psr@psr2-sprite-plane-move.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1406] / [Intel XE#2939])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#3414])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#455]) +7 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-8/igt@kms_scaling_modes@scaling-mode-center.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][85] ([Intel XE#1729])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#2168])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-8/igt@kms_vrr@cmrr.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many-all-ram:
>     - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#6360])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@xe_compute_preempt@compute-preempt-many-all-ram.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many-vram:
>     - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#5191])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-3/igt@xe_compute_preempt@compute-preempt-many-vram.html
> 
>   * igt@xe_eu_stall@non-blocking-re-enable:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#5626]) +1 other test skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-435/igt@xe_eu_stall@non-blocking-re-enable.html
> 
>   * igt@xe_eu_stall@non-blocking-read:
>     - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#5626])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-8/igt@xe_eu_stall@non-blocking-read.html
> 
>   * igt@xe_eudebug@basic-client:
>     - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#4837]) +2 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@xe_eudebug@basic-client.html
> 
>   * igt@xe_eudebug_online@pagefault-read-stress:
>     - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#6665])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-8/igt@xe_eudebug_online@pagefault-read-stress.html
> 
>   * igt@xe_eudebug_online@pagefault-write-stress:
>     - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#6665])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@xe_eudebug_online@pagefault-write-stress.html
> 
>   * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
>     - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#4837] / [Intel XE#5565]) +5 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
> 
>   * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#4837]) +4 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#688]) +1 other test skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@xe_evict@evict-beng-cm-threads-large.html
> 
>   * igt@xe_evict@evict-beng-small:
>     - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@xe_evict@evict-beng-small.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#261]) +2 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-8/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#688])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
>     - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1392])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null:
>     - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1392] / [Intel XE#5575]) +3 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-3/igt@xe_exec_basic@multigpu-no-exec-null.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#288] / [Intel XE#5561]) +10 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#288]) +6 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_system_allocator@madvise-preffered-loc-atomic-cpu:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#4915]) +94 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@xe_exec_system_allocator@madvise-preffered-loc-atomic-cpu.html
> 
>   * igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:
>     - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#5007])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@many-mmap-huge-nomemset:
>     - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#4943]) +2 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@xe_exec_system_allocator@many-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock:
>     - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#4915]) +151 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-8/igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock.html
> 
>   * igt@xe_exec_system_allocator@twice-large-mmap-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#4943])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-bmg-4/igt@xe_exec_system_allocator@twice-large-mmap-huge-nomemset.html
> 
>   * igt@xe_gt_freq@freq_fixed_idle:
>     - shard-dg2-set2:     [PASS][109] -> [FAIL][110] ([Intel XE#6407])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-435/igt@xe_gt_freq@freq_fixed_idle.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-432/igt@xe_gt_freq@freq_fixed_idle.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#560])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#512])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_oa@non-privileged-map-oa-buffer:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#3573]) +3 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html
> 
>   * igt@xe_oa@rc6-disable:
>     - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#3573]) +2 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@xe_oa@rc6-disable.html
> 
>   * igt@xe_pm@s2idle-vm-bind-prefetch:
>     - shard-lnl:          [PASS][115] -> [ABORT][116] ([Intel XE#6675])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-lnl-3/igt@xe_pm@s2idle-vm-bind-prefetch.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-5/igt@xe_pm@s2idle-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s3-basic:
>     - shard-adlp:         NOTRUN -> [ABORT][117] ([Intel XE#6675])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-3/igt@xe_pm@s3-basic.html
> 
>   * igt@xe_pm@s3-d3hot-basic-exec:
>     - shard-bmg:          NOTRUN -> [ABORT][118] ([Intel XE#6675]) +1 other test abort
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-bmg-1/igt@xe_pm@s3-d3hot-basic-exec.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#579])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#4733])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
> 
>   * igt@xe_query@multigpu-query-hwconfig:
>     - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#944]) +1 other test skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@xe_query@multigpu-query-hwconfig.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#944])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   * igt@xe_survivability@i2c-functionality:
>     - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#6529])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@xe_survivability@i2c-functionality.html
> 
>   * igt@xe_survivability@runtime-survivability:
>     - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#6529])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@xe_survivability@runtime-survivability.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][125] ([Intel XE#1231] / [Intel XE#6699]) -> [PASS][126]
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2:
>     - shard-bmg:          [ABORT][127] ([Intel XE#6675]) -> [PASS][128]
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-bmg-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2.html
> 
>   * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
>     - shard-dg2-set2:     [ABORT][129] ([Intel XE#6675]) -> [PASS][130]
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-435/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-432/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html
> 
>   * igt@xe_exec_balancer@many-cm-virtual-basic:
>     - shard-adlp:         [TIMEOUT][131] -> [PASS][132]
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-9/igt@xe_exec_balancer@many-cm-virtual-basic.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@xe_exec_balancer@many-cm-virtual-basic.html
> 
>   * igt@xe_exec_basic@twice-basic-defer-bind:
>     - shard-adlp:         [DMESG-FAIL][133] ([Intel XE#3876]) -> [PASS][134]
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-9/igt@xe_exec_basic@twice-basic-defer-bind.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@xe_exec_basic@twice-basic-defer-bind.html
> 
>   * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:
>     - shard-adlp:         [FAIL][135] ([Intel XE#5625]) -> [PASS][136] +3 other tests pass
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-9/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_pm@s3-multiple-execs:
>     - shard-adlp:         [ABORT][137] ([Intel XE#6675]) -> [PASS][138] +3 other tests pass
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-4/igt@xe_pm@s3-multiple-execs.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@xe_pm@s3-multiple-execs.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-50:
>     - shard-lnl:          [FAIL][139] ([Intel XE#6251]) -> [PASS][140] +1 other test pass
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-50.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-50.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
>     - shard-lnl:          [ABORT][141] ([Intel XE#6675]) -> [PASS][142]
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-lnl-8/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-lnl-3/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][143] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [INCOMPLETE][144] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4842])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][145] ([Intel XE#2426]) -> [FAIL][146] ([Intel XE#1729])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@xe_exec_reset@cm-cat-error:
>     - shard-adlp:         [DMESG-FAIL][147] ([Intel XE#3868]) -> [DMESG-WARN][148] ([Intel XE#3868])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-9/igt@xe_exec_reset@cm-cat-error.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@xe_exec_reset@cm-cat-error.html
> 
>   * igt@xe_pmu@engine-activity-suspend:
>     - shard-adlp:         [TIMEOUT][149] ([Intel XE#3876] / [Intel XE#6421]) -> [ABORT][150] ([Intel XE#6675])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-9/igt@xe_pmu@engine-activity-suspend.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/shard-adlp-1/igt@xe_pmu@engine-activity-suspend.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>   [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
>   [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
>   [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
>   [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#5825]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5825
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360
>   [Intel XE#6407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6407
>   [Intel XE#6421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6421
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6529]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6529
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6675]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675
>   [Intel XE#6699]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6699
>   [Intel XE#6704]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3 -> xe-pw-158409v1
> 
>   IGT_8649: f76e05461c8d5938856ed75ac8668640946f9ecd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3: d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3
>   xe-pw-158409v1: 158409v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158409v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
